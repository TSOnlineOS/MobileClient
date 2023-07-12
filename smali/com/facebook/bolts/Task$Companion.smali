.class public final Lcom/facebook/bolts/Task$Companion;
.super Ljava/lang/Object;
.source "Task.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/bolts/Task;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000~\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0010\u001e\n\u0000\n\u0002\u0010 \n\u0002\u0008\u0003\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J$\u0010\u0010\u001a\u0008\u0012\u0004\u0012\u0002H\u00110\u0008\"\u0004\u0008\u0001\u0010\u00112\u000e\u0010\u0012\u001a\n\u0012\u0006\u0012\u0004\u0018\u0001H\u00110\u0013H\u0007J.\u0010\u0010\u001a\u0008\u0012\u0004\u0012\u0002H\u00110\u0008\"\u0004\u0008\u0001\u0010\u00112\u000e\u0010\u0012\u001a\n\u0012\u0006\u0012\u0004\u0018\u0001H\u00110\u00132\u0008\u0010\u0014\u001a\u0004\u0018\u00010\u0015H\u0007J,\u0010\u0010\u001a\u0008\u0012\u0004\u0012\u0002H\u00110\u0008\"\u0004\u0008\u0001\u0010\u00112\u000e\u0010\u0012\u001a\n\u0012\u0006\u0012\u0004\u0018\u0001H\u00110\u00132\u0006\u0010\u0016\u001a\u00020\u0006H\u0007J6\u0010\u0010\u001a\u0008\u0012\u0004\u0012\u0002H\u00110\u0008\"\u0004\u0008\u0001\u0010\u00112\u000e\u0010\u0012\u001a\n\u0012\u0006\u0012\u0004\u0018\u0001H\u00110\u00132\u0006\u0010\u0016\u001a\u00020\u00062\u0008\u0010\u0014\u001a\u0004\u0018\u00010\u0015H\u0007J$\u0010\u0017\u001a\u0008\u0012\u0004\u0012\u0002H\u00110\u0008\"\u0004\u0008\u0001\u0010\u00112\u000e\u0010\u0012\u001a\n\u0012\u0006\u0012\u0004\u0018\u0001H\u00110\u0013H\u0007J.\u0010\u0017\u001a\u0008\u0012\u0004\u0012\u0002H\u00110\u0008\"\u0004\u0008\u0001\u0010\u00112\u000e\u0010\u0012\u001a\n\u0012\u0006\u0012\u0004\u0018\u0001H\u00110\u00132\u0008\u0010\u0014\u001a\u0004\u0018\u00010\u0015H\u0007J\u0014\u0010\u0018\u001a\u0008\u0012\u0004\u0012\u0002H\u00110\u0008\"\u0004\u0008\u0001\u0010\u0011H\u0007J\\\u0010\u0019\u001a\u00020\u001a\"\u0004\u0008\u0001\u0010\u001b\"\u0004\u0008\u0002\u0010\u00112\u000c\u0010\u001c\u001a\u0008\u0012\u0004\u0012\u0002H\u001b0\u001d2\u0018\u0010\u001e\u001a\u0014\u0012\u0004\u0012\u0002H\u0011\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u001b0\u00080\u001f2\u000c\u0010 \u001a\u0008\u0012\u0004\u0012\u0002H\u00110\u00082\u0006\u0010\u0016\u001a\u00020\u00062\u0008\u0010\u0014\u001a\u0004\u0018\u00010\u0015H\u0002JV\u0010!\u001a\u00020\u001a\"\u0004\u0008\u0001\u0010\u001b\"\u0004\u0008\u0002\u0010\u00112\u000c\u0010\u001c\u001a\u0008\u0012\u0004\u0012\u0002H\u001b0\u001d2\u0012\u0010\u001e\u001a\u000e\u0012\u0004\u0012\u0002H\u0011\u0012\u0004\u0012\u0002H\u001b0\u001f2\u000c\u0010 \u001a\u0008\u0012\u0004\u0012\u0002H\u00110\u00082\u0006\u0010\u0016\u001a\u00020\u00062\u0008\u0010\u0014\u001a\u0004\u0018\u00010\u0015H\u0002J\u0018\u0010\"\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010#0\u00082\u0006\u0010\"\u001a\u00020$H\u0007J\"\u0010\"\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010#0\u00082\u0006\u0010\"\u001a\u00020$2\u0008\u0010%\u001a\u0004\u0018\u00010\u0015H\u0007J/\u0010\"\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010#0\u00082\u0006\u0010\"\u001a\u00020$2\u0006\u0010\u0016\u001a\u00020&2\u0008\u0010%\u001a\u0004\u0018\u00010\u0015H\u0001\u00a2\u0006\u0002\u0008\'J$\u0010(\u001a\u0008\u0012\u0004\u0012\u0002H\u00110\u0008\"\u0004\u0008\u0001\u0010\u00112\u000e\u0010)\u001a\n\u0018\u00010*j\u0004\u0018\u0001`+H\u0007J#\u0010,\u001a\u0008\u0012\u0004\u0012\u0002H\u00110\u0008\"\u0004\u0008\u0001\u0010\u00112\u0008\u0010-\u001a\u0004\u0018\u0001H\u0011H\u0007\u00a2\u0006\u0002\u0010.J\n\u0010/\u001a\u0004\u0018\u00010\u000fH\u0007J\u0012\u00100\u001a\u00020\u001a2\u0008\u00101\u001a\u0004\u0018\u00010\u000fH\u0007J \u00102\u001a\u0008\u0012\u0004\u0012\u00020#0\u00082\u0010\u00103\u001a\u000c\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u000804H\u0007J0\u00105\u001a\u0010\u0012\u000c\u0012\n\u0012\u0006\u0012\u0004\u0018\u0001H\u0011060\u0008\"\u0004\u0008\u0001\u0010\u00112\u0012\u00103\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00110\u000804H\u0007J$\u00107\u001a\u000c\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u00080\u00082\u0010\u00103\u001a\u000c\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u000804H\u0007J.\u00108\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00110\u00080\u0008\"\u0004\u0008\u0001\u0010\u00112\u0012\u00103\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00110\u000804H\u0007R\u0010\u0010\u0003\u001a\u00020\u00048\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0007\u001a\u0006\u0012\u0002\u0008\u00030\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\t\u001a\u0008\u0012\u0004\u0012\u00020\n0\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u000b\u001a\u0006\u0012\u0002\u0008\u00030\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\n0\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\r\u001a\u00020\u00068\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000e\u001a\u0004\u0018\u00010\u000fX\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u00069"
    }
    d2 = {
        "Lcom/facebook/bolts/Task$Companion;",
        "",
        "()V",
        "BACKGROUND_EXECUTOR",
        "Ljava/util/concurrent/ExecutorService;",
        "IMMEDIATE_EXECUTOR",
        "Ljava/util/concurrent/Executor;",
        "TASK_CANCELLED",
        "Lcom/facebook/bolts/Task;",
        "TASK_FALSE",
        "",
        "TASK_NULL",
        "TASK_TRUE",
        "UI_THREAD_EXECUTOR",
        "unobservedExceptionHandler",
        "Lcom/facebook/bolts/Task$UnobservedExceptionHandler;",
        "call",
        "TResult",
        "callable",
        "Ljava/util/concurrent/Callable;",
        "ct",
        "Lcom/facebook/bolts/CancellationToken;",
        "executor",
        "callInBackground",
        "cancelled",
        "completeAfterTask",
        "",
        "TContinuationResult",
        "tcs",
        "Lcom/facebook/bolts/TaskCompletionSource;",
        "continuation",
        "Lcom/facebook/bolts/Continuation;",
        "task",
        "completeImmediately",
        "delay",
        "Ljava/lang/Void;",
        "",
        "cancellationToken",
        "Ljava/util/concurrent/ScheduledExecutorService;",
        "delay$facebook_core_release",
        "forError",
        "error",
        "Ljava/lang/Exception;",
        "Lkotlin/Exception;",
        "forResult",
        "value",
        "(Ljava/lang/Object;)Lcom/facebook/bolts/Task;",
        "getUnobservedExceptionHandler",
        "setUnobservedExceptionHandler",
        "eh",
        "whenAll",
        "tasks",
        "",
        "whenAllResult",
        "",
        "whenAny",
        "whenAnyResult",
        "facebook-core_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x5,
        0x1
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 526
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 526
    invoke-direct {p0}, Lcom/facebook/bolts/Task$Companion;-><init>()V

    return-void
.end method

.method public static final synthetic access$completeAfterTask(Lcom/facebook/bolts/Task$Companion;Lcom/facebook/bolts/TaskCompletionSource;Lcom/facebook/bolts/Continuation;Lcom/facebook/bolts/Task;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)V
    .locals 0

    .line 526
    invoke-direct/range {p0 .. p5}, Lcom/facebook/bolts/Task$Companion;->completeAfterTask(Lcom/facebook/bolts/TaskCompletionSource;Lcom/facebook/bolts/Continuation;Lcom/facebook/bolts/Task;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)V

    return-void
.end method

.method public static final synthetic access$completeImmediately(Lcom/facebook/bolts/Task$Companion;Lcom/facebook/bolts/TaskCompletionSource;Lcom/facebook/bolts/Continuation;Lcom/facebook/bolts/Task;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)V
    .locals 0

    .line 526
    invoke-direct/range {p0 .. p5}, Lcom/facebook/bolts/Task$Companion;->completeImmediately(Lcom/facebook/bolts/TaskCompletionSource;Lcom/facebook/bolts/Continuation;Lcom/facebook/bolts/Task;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)V

    return-void
.end method

.method private final completeAfterTask(Lcom/facebook/bolts/TaskCompletionSource;Lcom/facebook/bolts/Continuation;Lcom/facebook/bolts/Task;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            "TResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/bolts/TaskCompletionSource<",
            "TTContinuationResult;>;",
            "Lcom/facebook/bolts/Continuation<",
            "TTResult;",
            "Lcom/facebook/bolts/Task<",
            "TTContinuationResult;>;>;",
            "Lcom/facebook/bolts/Task<",
            "TTResult;>;",
            "Ljava/util/concurrent/Executor;",
            "Lcom/facebook/bolts/CancellationToken;",
            ")V"
        }
    .end annotation

    .line 941
    :try_start_0
    new-instance v0, Lcom/facebook/bolts/Task$Companion$completeAfterTask$1;

    invoke-direct {v0, p5, p1, p2, p3}, Lcom/facebook/bolts/Task$Companion$completeAfterTask$1;-><init>(Lcom/facebook/bolts/CancellationToken;Lcom/facebook/bolts/TaskCompletionSource;Lcom/facebook/bolts/Continuation;Lcom/facebook/bolts/Task;)V

    check-cast v0, Ljava/lang/Runnable;

    .line 940
    invoke-interface {p4, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p2

    .line 971
    new-instance p3, Lcom/facebook/bolts/ExecutorException;

    invoke-direct {p3, p2}, Lcom/facebook/bolts/ExecutorException;-><init>(Ljava/lang/Exception;)V

    check-cast p3, Ljava/lang/Exception;

    invoke-virtual {p1, p3}, Lcom/facebook/bolts/TaskCompletionSource;->setError(Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method private final completeImmediately(Lcom/facebook/bolts/TaskCompletionSource;Lcom/facebook/bolts/Continuation;Lcom/facebook/bolts/Task;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            "TResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/bolts/TaskCompletionSource<",
            "TTContinuationResult;>;",
            "Lcom/facebook/bolts/Continuation<",
            "TTResult;TTContinuationResult;>;",
            "Lcom/facebook/bolts/Task<",
            "TTResult;>;",
            "Ljava/util/concurrent/Executor;",
            "Lcom/facebook/bolts/CancellationToken;",
            ")V"
        }
    .end annotation

    .line 901
    :try_start_0
    new-instance v0, Lcom/facebook/bolts/Task$Companion$completeImmediately$1;

    invoke-direct {v0, p5, p1, p2, p3}, Lcom/facebook/bolts/Task$Companion$completeImmediately$1;-><init>(Lcom/facebook/bolts/CancellationToken;Lcom/facebook/bolts/TaskCompletionSource;Lcom/facebook/bolts/Continuation;Lcom/facebook/bolts/Task;)V

    check-cast v0, Ljava/lang/Runnable;

    .line 900
    invoke-interface {p4, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p2

    .line 916
    new-instance p3, Lcom/facebook/bolts/ExecutorException;

    invoke-direct {p3, p2}, Lcom/facebook/bolts/ExecutorException;-><init>(Ljava/lang/Exception;)V

    check-cast p3, Ljava/lang/Exception;

    invoke-virtual {p1, p3}, Lcom/facebook/bolts/TaskCompletionSource;->setError(Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method


# virtual methods
.method public final call(Ljava/util/concurrent/Callable;)Lcom/facebook/bolts/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable<",
            "TTResult;>;)",
            "Lcom/facebook/bolts/Task<",
            "TTResult;>;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "callable"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 700
    move-object v0, p0

    check-cast v0, Lcom/facebook/bolts/Task$Companion;

    invoke-static {}, Lcom/facebook/bolts/Task;->access$getIMMEDIATE_EXECUTOR$cp()Ljava/util/concurrent/Executor;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v1, v2}, Lcom/facebook/bolts/Task$Companion;->call(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public final call(Ljava/util/concurrent/Callable;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable<",
            "TTResult;>;",
            "Lcom/facebook/bolts/CancellationToken;",
            ")",
            "Lcom/facebook/bolts/Task<",
            "TTResult;>;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "callable"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 706
    move-object v0, p0

    check-cast v0, Lcom/facebook/bolts/Task$Companion;

    invoke-static {}, Lcom/facebook/bolts/Task;->access$getIMMEDIATE_EXECUTOR$cp()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-virtual {v0, p1, v1, p2}, Lcom/facebook/bolts/Task$Companion;->call(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public final call(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;)Lcom/facebook/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable<",
            "TTResult;>;",
            "Ljava/util/concurrent/Executor;",
            ")",
            "Lcom/facebook/bolts/Task<",
            "TTResult;>;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "callable"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "executor"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 659
    move-object v0, p0

    check-cast v0, Lcom/facebook/bolts/Task$Companion;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p2, v1}, Lcom/facebook/bolts/Task$Companion;->call(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public final call(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable<",
            "TTResult;>;",
            "Ljava/util/concurrent/Executor;",
            "Lcom/facebook/bolts/CancellationToken;",
            ")",
            "Lcom/facebook/bolts/Task<",
            "TTResult;>;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "callable"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "executor"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 671
    new-instance v0, Lcom/facebook/bolts/TaskCompletionSource;

    invoke-direct {v0}, Lcom/facebook/bolts/TaskCompletionSource;-><init>()V

    .line 674
    :try_start_0
    new-instance v1, Lcom/facebook/bolts/Task$Companion$call$1;

    invoke-direct {v1, p3, v0, p1}, Lcom/facebook/bolts/Task$Companion$call$1;-><init>(Lcom/facebook/bolts/CancellationToken;Lcom/facebook/bolts/TaskCompletionSource;Ljava/util/concurrent/Callable;)V

    check-cast v1, Ljava/lang/Runnable;

    .line 673
    invoke-interface {p2, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 688
    new-instance p2, Lcom/facebook/bolts/ExecutorException;

    invoke-direct {p2, p1}, Lcom/facebook/bolts/ExecutorException;-><init>(Ljava/lang/Exception;)V

    check-cast p2, Ljava/lang/Exception;

    invoke-virtual {v0, p2}, Lcom/facebook/bolts/TaskCompletionSource;->setError(Ljava/lang/Exception;)V

    .line 690
    :goto_0
    invoke-virtual {v0}, Lcom/facebook/bolts/TaskCompletionSource;->getTask()Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public final callInBackground(Ljava/util/concurrent/Callable;)Lcom/facebook/bolts/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable<",
            "TTResult;>;)",
            "Lcom/facebook/bolts/Task<",
            "TTResult;>;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "callable"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 640
    move-object v0, p0

    check-cast v0, Lcom/facebook/bolts/Task$Companion;

    sget-object v1, Lcom/facebook/bolts/Task;->BACKGROUND_EXECUTOR:Ljava/util/concurrent/ExecutorService;

    check-cast v1, Ljava/util/concurrent/Executor;

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v1, v2}, Lcom/facebook/bolts/Task$Companion;->call(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public final callInBackground(Ljava/util/concurrent/Callable;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable<",
            "TTResult;>;",
            "Lcom/facebook/bolts/CancellationToken;",
            ")",
            "Lcom/facebook/bolts/Task<",
            "TTResult;>;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "callable"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 649
    move-object v0, p0

    check-cast v0, Lcom/facebook/bolts/Task$Companion;

    sget-object v1, Lcom/facebook/bolts/Task;->BACKGROUND_EXECUTOR:Ljava/util/concurrent/ExecutorService;

    check-cast v1, Ljava/util/concurrent/Executor;

    invoke-virtual {v0, p1, v1, p2}, Lcom/facebook/bolts/Task$Companion;->call(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public final cancelled()Lcom/facebook/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">()",
            "Lcom/facebook/bolts/Task<",
            "TTResult;>;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 585
    invoke-static {}, Lcom/facebook/bolts/Task;->access$getTASK_CANCELLED$cp()Lcom/facebook/bolts/Task;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "null cannot be cast to non-null type com.facebook.bolts.Task<TResult>"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final delay(J)Lcom/facebook/bolts/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lcom/facebook/bolts/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 596
    move-object v0, p0

    check-cast v0, Lcom/facebook/bolts/Task$Companion;

    sget-object v1, Lcom/facebook/bolts/BoltsExecutors;->Companion:Lcom/facebook/bolts/BoltsExecutors$Companion;

    invoke-virtual {v1}, Lcom/facebook/bolts/BoltsExecutors$Companion;->scheduled$facebook_core_release()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, p1, p2, v1, v2}, Lcom/facebook/bolts/Task$Companion;->delay$facebook_core_release(JLjava/util/concurrent/ScheduledExecutorService;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public final delay(JLcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Lcom/facebook/bolts/CancellationToken;",
            ")",
            "Lcom/facebook/bolts/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 609
    move-object v0, p0

    check-cast v0, Lcom/facebook/bolts/Task$Companion;

    sget-object v1, Lcom/facebook/bolts/BoltsExecutors;->Companion:Lcom/facebook/bolts/BoltsExecutors$Companion;

    invoke-virtual {v1}, Lcom/facebook/bolts/BoltsExecutors$Companion;->scheduled$facebook_core_release()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v1

    invoke-virtual {v0, p1, p2, v1, p3}, Lcom/facebook/bolts/Task$Companion;->delay$facebook_core_release(JLjava/util/concurrent/ScheduledExecutorService;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public final delay$facebook_core_release(JLjava/util/concurrent/ScheduledExecutorService;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/ScheduledExecutorService;",
            "Lcom/facebook/bolts/CancellationToken;",
            ")",
            "Lcom/facebook/bolts/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "executor"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    if-eqz p4, :cond_0

    .line 618
    invoke-virtual {p4}, Lcom/facebook/bolts/CancellationToken;->isCancellationRequested()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 619
    move-object p1, p0

    check-cast p1, Lcom/facebook/bolts/Task$Companion;

    invoke-virtual {p1}, Lcom/facebook/bolts/Task$Companion;->cancelled()Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1

    :cond_0
    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-gtz v2, :cond_1

    .line 622
    move-object p1, p0

    check-cast p1, Lcom/facebook/bolts/Task$Companion;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/facebook/bolts/Task$Companion;->forResult(Ljava/lang/Object;)Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1

    .line 624
    :cond_1
    new-instance v0, Lcom/facebook/bolts/TaskCompletionSource;

    invoke-direct {v0}, Lcom/facebook/bolts/TaskCompletionSource;-><init>()V

    .line 625
    new-instance v1, Lcom/facebook/bolts/Task$Companion$delay$scheduled$1;

    invoke-direct {v1, v0}, Lcom/facebook/bolts/Task$Companion$delay$scheduled$1;-><init>(Lcom/facebook/bolts/TaskCompletionSource;)V

    check-cast v1, Ljava/lang/Runnable;

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {p3, v1, p1, p2, v2}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p1

    if-eqz p4, :cond_2

    .line 626
    new-instance p2, Lcom/facebook/bolts/Task$Companion$delay$1;

    invoke-direct {p2, p1, v0}, Lcom/facebook/bolts/Task$Companion$delay$1;-><init>(Ljava/util/concurrent/ScheduledFuture;Lcom/facebook/bolts/TaskCompletionSource;)V

    check-cast p2, Ljava/lang/Runnable;

    invoke-virtual {p4, p2}, Lcom/facebook/bolts/CancellationToken;->register(Ljava/lang/Runnable;)Lcom/facebook/bolts/CancellationTokenRegistration;

    .line 630
    :cond_2
    invoke-virtual {v0}, Lcom/facebook/bolts/TaskCompletionSource;->getTask()Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public final forError(Ljava/lang/Exception;)Lcom/facebook/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Exception;",
            ")",
            "Lcom/facebook/bolts/Task<",
            "TTResult;>;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 576
    new-instance v0, Lcom/facebook/bolts/TaskCompletionSource;

    invoke-direct {v0}, Lcom/facebook/bolts/TaskCompletionSource;-><init>()V

    .line 577
    invoke-virtual {v0, p1}, Lcom/facebook/bolts/TaskCompletionSource;->setError(Ljava/lang/Exception;)V

    .line 578
    invoke-virtual {v0}, Lcom/facebook/bolts/TaskCompletionSource;->getTask()Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public final forResult(Ljava/lang/Object;)Lcom/facebook/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">(TTResult;)",
            "Lcom/facebook/bolts/Task<",
            "TTResult;>;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "null cannot be cast to non-null type com.facebook.bolts.Task<TResult>"

    if-nez p1, :cond_1

    .line 563
    invoke-static {}, Lcom/facebook/bolts/Task;->access$getTASK_NULL$cp()Lcom/facebook/bolts/Task;

    move-result-object p1

    if-eqz p1, :cond_0

    return-object p1

    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 565
    :cond_1
    instance-of v1, p1, Ljava/lang/Boolean;

    if-eqz v1, :cond_4

    .line 566
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-static {}, Lcom/facebook/bolts/Task;->access$getTASK_TRUE$cp()Lcom/facebook/bolts/Task;

    move-result-object p1

    goto :goto_0

    :cond_2
    invoke-static {}, Lcom/facebook/bolts/Task;->access$getTASK_FALSE$cp()Lcom/facebook/bolts/Task;

    move-result-object p1

    :goto_0
    if-eqz p1, :cond_3

    return-object p1

    :cond_3
    new-instance p1, Ljava/lang/NullPointerException;

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 568
    :cond_4
    new-instance v0, Lcom/facebook/bolts/TaskCompletionSource;

    invoke-direct {v0}, Lcom/facebook/bolts/TaskCompletionSource;-><init>()V

    .line 569
    invoke-virtual {v0, p1}, Lcom/facebook/bolts/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    .line 570
    invoke-virtual {v0}, Lcom/facebook/bolts/TaskCompletionSource;->getTask()Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public final getUnobservedExceptionHandler()Lcom/facebook/bolts/Task$UnobservedExceptionHandler;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 545
    invoke-static {}, Lcom/facebook/bolts/Task;->access$getUnobservedExceptionHandler$cp()Lcom/facebook/bolts/Task$UnobservedExceptionHandler;

    move-result-object v0

    return-object v0
.end method

.method public final setUnobservedExceptionHandler(Lcom/facebook/bolts/Task$UnobservedExceptionHandler;)V
    .locals 0
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 555
    invoke-static {p1}, Lcom/facebook/bolts/Task;->access$setUnobservedExceptionHandler$cp(Lcom/facebook/bolts/Task$UnobservedExceptionHandler;)V

    return-void
.end method

.method public final whenAll(Ljava/util/Collection;)Lcom/facebook/bolts/Task;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+",
            "Lcom/facebook/bolts/Task<",
            "*>;>;)",
            "Lcom/facebook/bolts/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "tasks"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 842
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 843
    move-object p1, p0

    check-cast p1, Lcom/facebook/bolts/Task$Companion;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/facebook/bolts/Task$Companion;->forResult(Ljava/lang/Object;)Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1

    .line 845
    :cond_0
    new-instance v6, Lcom/facebook/bolts/TaskCompletionSource;

    invoke-direct {v6}, Lcom/facebook/bolts/TaskCompletionSource;-><init>()V

    .line 846
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 847
    new-instance v8, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v8}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    .line 848
    new-instance v9, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v0

    invoke-direct {v9, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 849
    new-instance v10, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v0, 0x0

    invoke-direct {v10, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 850
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v11, v0

    check-cast v11, Lcom/facebook/bolts/Task;

    if-eqz v11, :cond_1

    .line 852
    new-instance v12, Lcom/facebook/bolts/Task$Companion$whenAll$1;

    move-object v0, v12

    move-object v1, v8

    move-object v2, v7

    move-object v3, v10

    move-object v4, v9

    move-object v5, v6

    invoke-direct/range {v0 .. v5}, Lcom/facebook/bolts/Task$Companion$whenAll$1;-><init>(Ljava/util/concurrent/locks/ReentrantLock;Ljava/util/ArrayList;Ljava/util/concurrent/atomic/AtomicBoolean;Ljava/util/concurrent/atomic/AtomicInteger;Lcom/facebook/bolts/TaskCompletionSource;)V

    check-cast v12, Lcom/facebook/bolts/Continuation;

    invoke-virtual {v11, v12}, Lcom/facebook/bolts/Task;->continueWith(Lcom/facebook/bolts/Continuation;)Lcom/facebook/bolts/Task;

    goto :goto_0

    .line 851
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "null cannot be cast to non-null type com.facebook.bolts.Task<kotlin.Any>"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 878
    :cond_2
    invoke-virtual {v6}, Lcom/facebook/bolts/TaskCompletionSource;->getTask()Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public final whenAllResult(Ljava/util/Collection;)Lcom/facebook/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection<",
            "Lcom/facebook/bolts/Task<",
            "TTResult;>;>;)",
            "Lcom/facebook/bolts/Task<",
            "Ljava/util/List<",
            "TTResult;>;>;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "tasks"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 804
    move-object v0, p0

    check-cast v0, Lcom/facebook/bolts/Task$Companion;

    invoke-virtual {v0, p1}, Lcom/facebook/bolts/Task$Companion;->whenAll(Ljava/util/Collection;)Lcom/facebook/bolts/Task;

    move-result-object v0

    .line 806
    new-instance v1, Lcom/facebook/bolts/Task$Companion$whenAllResult$1;

    invoke-direct {v1, p1}, Lcom/facebook/bolts/Task$Companion$whenAllResult$1;-><init>(Ljava/util/Collection;)V

    check-cast v1, Lcom/facebook/bolts/Continuation;

    .line 805
    invoke-virtual {v0, v1}, Lcom/facebook/bolts/Task;->onSuccess(Lcom/facebook/bolts/Continuation;)Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public final whenAny(Ljava/util/Collection;)Lcom/facebook/bolts/Task;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+",
            "Lcom/facebook/bolts/Task<",
            "*>;>;)",
            "Lcom/facebook/bolts/Task<",
            "Lcom/facebook/bolts/Task<",
            "*>;>;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "tasks"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 758
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 759
    move-object p1, p0

    check-cast p1, Lcom/facebook/bolts/Task$Companion;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/facebook/bolts/Task$Companion;->forResult(Ljava/lang/Object;)Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1

    .line 761
    :cond_0
    new-instance v0, Lcom/facebook/bolts/TaskCompletionSource;

    invoke-direct {v0}, Lcom/facebook/bolts/TaskCompletionSource;-><init>()V

    .line 762
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 763
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/bolts/Task;

    if-eqz v2, :cond_1

    .line 765
    new-instance v3, Lcom/facebook/bolts/Task$Companion$whenAny$1;

    invoke-direct {v3, v1, v0}, Lcom/facebook/bolts/Task$Companion$whenAny$1;-><init>(Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/facebook/bolts/TaskCompletionSource;)V

    check-cast v3, Lcom/facebook/bolts/Continuation;

    .line 764
    invoke-virtual {v2, v3}, Lcom/facebook/bolts/Task;->continueWith(Lcom/facebook/bolts/Continuation;)Lcom/facebook/bolts/Task;

    goto :goto_0

    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "null cannot be cast to non-null type com.facebook.bolts.Task<kotlin.Any>"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 775
    :cond_2
    invoke-virtual {v0}, Lcom/facebook/bolts/TaskCompletionSource;->getTask()Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public final whenAnyResult(Ljava/util/Collection;)Lcom/facebook/bolts/Task;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection<",
            "Lcom/facebook/bolts/Task<",
            "TTResult;>;>;)",
            "Lcom/facebook/bolts/Task<",
            "Lcom/facebook/bolts/Task<",
            "TTResult;>;>;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "tasks"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 723
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 724
    move-object p1, p0

    check-cast p1, Lcom/facebook/bolts/Task$Companion;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/facebook/bolts/Task$Companion;->forResult(Ljava/lang/Object;)Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1

    .line 726
    :cond_0
    new-instance v0, Lcom/facebook/bolts/TaskCompletionSource;

    invoke-direct {v0}, Lcom/facebook/bolts/TaskCompletionSource;-><init>()V

    .line 727
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 728
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/bolts/Task;

    .line 730
    new-instance v3, Lcom/facebook/bolts/Task$Companion$whenAnyResult$1;

    invoke-direct {v3, v1, v0}, Lcom/facebook/bolts/Task$Companion$whenAnyResult$1;-><init>(Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/facebook/bolts/TaskCompletionSource;)V

    check-cast v3, Lcom/facebook/bolts/Continuation;

    .line 729
    invoke-virtual {v2, v3}, Lcom/facebook/bolts/Task;->continueWith(Lcom/facebook/bolts/Continuation;)Lcom/facebook/bolts/Task;

    goto :goto_0

    .line 740
    :cond_1
    invoke-virtual {v0}, Lcom/facebook/bolts/TaskCompletionSource;->getTask()Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1
.end method
