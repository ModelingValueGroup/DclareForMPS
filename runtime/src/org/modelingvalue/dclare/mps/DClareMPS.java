//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// (C) Copyright 2018 Modeling Value Group B.V. (http://modelingvalue.org)                                             ~
//                                                                                                                     ~
// Licensed under the GNU Lesser General Public License v3.0 (the "License"). You may not use this file except in      ~
// compliance with the License. You may obtain a copy of the License at: https://choosealicense.com/licenses/lgpl-3.0  ~
// Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on ~
// an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the  ~
// specific language governing permissions and limitations under the License.                                          ~
//                                                                                                                     ~
// Contributors:                                                                                                       ~
//     Wim Bast, Carel Bast, Tom Brus, Arjan Kok, Ronald Krijgsheld                                                    ~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

package org.modelingvalue.dclare.mps;

import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.function.Supplier;

import org.jetbrains.mps.openapi.language.SLanguage;
import org.jetbrains.mps.openapi.model.SModel;
import org.jetbrains.mps.openapi.model.SNode;
import org.jetbrains.mps.openapi.module.SModule;
import org.jetbrains.mps.openapi.module.SRepository;
import org.jetbrains.mps.openapi.project.Project;
import org.modelingvalue.collections.Collection;
import org.modelingvalue.collections.Entry;
import org.modelingvalue.collections.Map;
import org.modelingvalue.collections.Set;
import org.modelingvalue.collections.util.ContextThread;
import org.modelingvalue.collections.util.ContextThread.ContextPool;
import org.modelingvalue.collections.util.Pair;
import org.modelingvalue.collections.util.TriConsumer;
import org.modelingvalue.transactions.AbstractLeaf;
import org.modelingvalue.transactions.Constant;
import org.modelingvalue.transactions.Getable;
import org.modelingvalue.transactions.Imperative;
import org.modelingvalue.transactions.Observed;
import org.modelingvalue.transactions.Priority;
import org.modelingvalue.transactions.Root;
import org.modelingvalue.transactions.Setable;
import org.modelingvalue.transactions.State;

import jetbrains.mps.smodel.language.LanguageRegistry;
import jetbrains.mps.smodel.language.LanguageRuntime;

public class DClareMPS implements TriConsumer<State, State, Boolean> {

    protected static final Observed<DClareMPS, Set<SLanguage>> ALL_LANGUAGES = Observed.of("ALL_LANGAUGES", Set.of(), (tx, o, b, a) -> {
                                                                                 Setable.<Set<SLanguage>, SLanguage> diff(Set.of(), b, a, x -> o.start(x), x -> {
                                                                                                                                                          });
                                                                             });

    protected static final Observed<SLanguage, Set<IRuleSet>>  RULE_SETS     = Observed.of("RULE_SETS", Set.of());

    protected static final Observed<DClareMPS, Set<DType>>     TYPES         = Observed.of("TYPES", Set.of(), (tx, o, b, a) -> {
                                                                                 Setable.<Set<DType>, DType> diff(Set.of(), b, a, x -> x.start(tx.root()), x -> x.stop(tx.root()));
                                                                             });

    private final ThreadLocal<Boolean>                         COMMITTING    = new ThreadLocal<Boolean>() {
                                                                                 @Override
                                                                                 protected Boolean initialValue() {
                                                                                     return false;
                                                                                 }

                                                                             };

    public final Getable<SRepository, DRepository>             DREPOSITORY   = Constant.of(Pair.of(this, "DREPOSITORY"), r -> new DRepository(r));
    public final Getable<SModule, DModule>                     DMODULE       = Constant.of(Pair.of(this, "DMODULE"), m -> new DModule(m));
    public final Getable<SModel, DModel>                       DMODEL        = Constant.of(Pair.of(this, "DMODEL"), m -> new DModel(m));
    public final Getable<SNode, DNode>                         DNODE         = Constant.of(Pair.of(this, "DNODE"), n -> new DNode(n));
    public final Getable<Pair<SNode, DNode>, DCopy>            DCOPY         = Constant.of(Pair.of(this, "DCOPY"), p -> new DCopy(p.a(), p.b(), null));
    public final Getable<Pair<DCopy, DNode>, DCopy>            DCHILD_COPY   = Constant.of(Pair.of(this, "DCHILD_COPY"), p -> {
                                                                                 return new DCopy(DNode.newSNode(p.b().getConcept()), p.b(), p.a());
                                                                             });
    public final Getable<SClassObject, DClassObject>           DCLASS_OBJECT = Constant.of(Pair.of(this, "DCLASS_OBJECT"), c -> new DClassObject(c));

    private final ContextPool                                  thePool       = ContextThread.createPool();
    protected final Thread                                     waitForEndThread;
    protected final Root                                       root;
    protected final Project                                    project;
    private final StartStopHandler                             startStopHandler;
    private DRepository                                        repository;
    private Imperative                                         imperative;
    private final Timer                                        timer         = new Timer();
    private Map<Object, Runnable>                              pollers       = Map.of();
    private final TimerTask                                    poolTask      = new TimerTask() {
                                                                                 @Override
                                                                                 public void run() {
                                                                                     poll();
                                                                                 }
                                                                             };
    private boolean                                            running;

    protected DClareMPS(Project project, State prevState, int maxTotalNrOfChanges, int maxNrOfChanges, StartStopHandler startStopHandler) {
        System.err.println(DObject.DCLARE + "START " + project.getName());
        this.project = project;
        this.startStopHandler = startStopHandler;
        root = Root.of(this, thePool, prevState, 100, maxTotalNrOfChanges, maxNrOfChanges, 10, null);
        waitForEndThread = new Thread(() -> {
            try {
                root.waitForEnd();
                thePool.shutdownNow();
            } catch (Throwable t) {
                thePool.shutdownNow();
                stop();
                throw t;
            }
        });
        waitForEndThread.setDaemon(true);
        waitForEndThread.start();
        root.put("init", () -> {
            imperative = root.addIntegration("MPSNative", this, r -> {
                if (imperative != null && !COMMITTING.get()) {
                    if (!running) {
                        running = true;
                        command(() -> startStopHandler.start(project));
                    }
                    command(r);
                }
            });
            repository = DRepository.of(project.getRepository());
            repository.activate(null, root);
        }, Priority.high);
        timer.schedule(poolTask, 500, 500);
    }

    @Override
    public int hashCode() {
        return project.hashCode();
    }

    @Override
    public boolean equals(Object obj) {
        return obj instanceof DClareMPS && project.equals(((DClareMPS) obj).project);
    }

    public void schedule(Runnable action) {
        if (imperative != null) {
            imperative.schedule(action);
        }
    }

    public void command(Runnable runnable) {
        project.getModelAccess().executeCommandInEDT(runnable);
    }

    public void read(Runnable runnable) {
        project.getModelAccess().runReadAction(runnable);
    }

    public void write(Runnable runnable) {
        project.getModelAccess().runWriteAction(runnable);
    }

    @SuppressWarnings("unchecked")
    public <R> R command(Supplier<R> supplier) {
        BlockingQueue<Object> queue = new LinkedBlockingQueue<>(1);
        project.getModelAccess().executeCommandInEDT(() -> {
            try {
                try {
                    queue.put(supplier.get());
                } catch (InterruptedException e) {
                    throw e;
                } catch (Throwable t) {
                    queue.put(t);
                }
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        });
        try {
            Object result = queue.take();
            if (result instanceof Throwable) {
                throw new Error((Throwable) result);
            } else {
                return (R) result;
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
            return null;
        }
    }

    @SuppressWarnings("unchecked")
    public <R> R read(Supplier<R> supplier) {
        R[] result = (R[]) new Object[1];
        project.getModelAccess().runReadAction(() -> result[0] = supplier.get());
        return result[0];
    }

    @SuppressWarnings("unchecked")
    public <R> R write(Supplier<R> supplier) {
        R[] result = (R[]) new Object[1];
        project.getModelAccess().runWriteAction(() -> result[0] = supplier.get());
        return result[0];
    }

    public static DClareMPS instance() {
        return (DClareMPS) AbstractLeaf.getCurrent().root().getId();
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    private final Map<Pair<DObject, DObserved>, Pair<Object, Object>>[] deferred = new Map[]{Map.of()};

    @SuppressWarnings({"unchecked", "rawtypes"})
    @Override
    public void accept(State pre, State post, Boolean last) {
        if (imperative != null) {
            COMMITTING.set(true);
            try {
                pre.diff(post, o -> o instanceof DObject, p -> p instanceof DObserved).forEach(e0 -> {
                    DObject dObject = (DObject) e0.getKey();
                    e0.getValue().forEach(e1 -> {
                        DObserved mpsObserved = (DObserved) e1.getKey();
                        if (!mpsObserved.isDeferred()) {
                            mpsObserved.toMPS(dObject, e1.getValue().a(), e1.getValue().b(), true);
                        }
                    });
                });
                pre.diff(post, o -> o instanceof DObject, p -> p instanceof DObserved).forEach(e0 -> {
                    DObject dObject = (DObject) e0.getKey();
                    e0.getValue().forEach(e1 -> {
                        DObserved mpsObserved = (DObserved) e1.getKey();
                        if (mpsObserved.isDeferred()) {
                            Pair<DObject, DObserved> slot = Pair.of(dObject, mpsObserved);
                            Pair<Object, Object> old = deferred[0].get(slot);
                            deferred[0] = deferred[0].put(slot, old != null ? Pair.of(old.a(), e1.getValue().b()) : Pair.of(e1.getValue().a(), e1.getValue().b()));
                        } else {
                            mpsObserved.toMPS(dObject, e1.getValue().a(), e1.getValue().b(), false);
                        }
                    });
                });
                if (last) {
                    deferred[0].forEach(e -> e.getKey().b().toMPS(e.getKey().a(), e.getValue().a(), e.getValue().b(), true));
                    deferred[0].forEach(e -> e.getKey().b().toMPS(e.getKey().a(), e.getValue().a(), e.getValue().b(), false));
                    deferred[0] = Map.of();
                    running = false;
                    startStopHandler.stop(project, DObject.ALL_PROBLEMS.get(repository));
                }
            } finally {
                COMMITTING.set(false);
            }
        }
    }

    public void addPoller(Object id, Runnable poller) {
        synchronized (timer) {
            pollers = pollers.put(id, poller);
        }
    }

    public void removePoller(Object id) {
        synchronized (timer) {
            pollers = pollers.removeKey(id);
        }
    }

    private void poll() {
        for (Entry<Object, Runnable> pl : pollers) {
            pl.getValue().run();
        }
    }

    public void stop() {
        if (imperative != null) {
            System.err.println(DObject.DCLARE + "STOP " + project.getName());
            timer.cancel();
            imperative = null;
            root.put("stopDclareMPS", () -> repository.stop(this));
            root.stop();
        }
    }

    public DRepository getRepository() {
        return repository;
    }

    public boolean isRunning() {
        return imperative != null;
    }

    private void start(SLanguage language) {
        LanguageRegistry registry = LanguageRegistry.getInstance(repository.original());
        LanguageRuntime rtLang = registry.getLanguage(language);
        IRuleAspect aspect = rtLang != null ? rtLang.getAspect(IRuleAspect.class) : null;
        RULE_SETS.set(language, aspect != null ? Collection.of(aspect.getRuleSets()).toSet() : Set.of());
    }

    public void onLoaded() {
        schedule(() -> {
            LanguageRegistry registry = LanguageRegistry.getInstance(repository.original());
            for (SLanguage language : ALL_LANGUAGES.get(this)) {
                LanguageRuntime rtLang = registry.getLanguage(language);
                IRuleAspect aspect = rtLang != null ? rtLang.getAspect(IRuleAspect.class) : null;
                RULE_SETS.set(language, aspect != null ? Collection.of(aspect.getRuleSets()).toSet() : Set.of());
            }
        });
    }

    public static <T> T pre(Supplier<T> supplier) {
        DObject.EMPTY_ATTRIBUTE.set(true);
        return AbstractLeaf.getCurrent().root().preState().get(supplier);
    }

    public Root root() {
        return root;
    }
}
