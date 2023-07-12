.class public final Lcom/facebook/bolts/Task;
.super Ljava/lang/Object;
.source "Task.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/bolts/Task$UnobservedExceptionHandler;,
        Lcom/facebook/bolts/Task$TaskCompletionSource;,
        Lcom/facebook/bolts/Task$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<TResult:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nTask.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Task.kt\ncom/facebook/bolts/Task\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 3 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,981:1\n1#2:982\n1849#3,2:983\n*S KotlinDebug\n*F\n+ 1 Task.kt\ncom/facebook/bolts/Task\n*L\n460#1:983,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000t\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u0002\n\u0002\u0008\u0006\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0018\u0000 @*\u0004\u0008\u0000\u0010\u00012\u00020\u0002:\u0003@ABB\u0007\u0008\u0010\u00a2\u0006\u0002\u0010\u0003B\u0011\u0008\u0012\u0012\u0008\u0010\u0004\u001a\u0004\u0018\u00018\u0000\u00a2\u0006\u0002\u0010\u0005B\u000f\u0008\u0012\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0002\u0010\u0008J\u0012\u0010%\u001a\u0008\u0012\u0004\u0012\u0002H&0\u0000\"\u0004\u0008\u0001\u0010&J4\u0010\'\u001a\u0008\u0012\u0004\u0012\u00020\u00110\u00002\u000c\u0010(\u001a\u0008\u0012\u0004\u0012\u00020\u00070)2\u0018\u0010*\u001a\u0014\u0012\u0004\u0012\u00020\u0011\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00110\u00000\u0010J>\u0010\'\u001a\u0008\u0012\u0004\u0012\u00020\u00110\u00002\u000c\u0010(\u001a\u0008\u0012\u0004\u0012\u00020\u00070)2\u0018\u0010*\u001a\u0014\u0012\u0004\u0012\u00020\u0011\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00110\u00000\u00102\u0008\u0010+\u001a\u0004\u0018\u00010,JJ\u0010\'\u001a\u0008\u0012\u0004\u0012\u00020\u00110\u00002\u000c\u0010(\u001a\u0008\u0012\u0004\u0012\u00020\u00070)2\u0018\u0010*\u001a\u0014\u0012\u0004\u0012\u00020\u0011\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00110\u00000\u00102\u0008\u0008\u0002\u0010-\u001a\u00020.2\n\u0008\u0002\u0010+\u001a\u0004\u0018\u00010,J&\u0010/\u001a\u0008\u0012\u0004\u0012\u0002H00\u0000\"\u0004\u0008\u0001\u001002\u0012\u0010*\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u0002H00\u0010J0\u0010/\u001a\u0008\u0012\u0004\u0012\u0002H00\u0000\"\u0004\u0008\u0001\u001002\u0012\u0010*\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u0002H00\u00102\u0008\u0010+\u001a\u0004\u0018\u00010,J.\u0010/\u001a\u0008\u0012\u0004\u0012\u0002H00\u0000\"\u0004\u0008\u0001\u001002\u0012\u0010*\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u0002H00\u00102\u0006\u0010-\u001a\u00020.J8\u0010/\u001a\u0008\u0012\u0004\u0012\u0002H00\u0000\"\u0004\u0008\u0001\u001002\u0012\u0010*\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u0002H00\u00102\u0006\u0010-\u001a\u00020.2\u0008\u0010+\u001a\u0004\u0018\u00010,J,\u00101\u001a\u0008\u0012\u0004\u0012\u0002H00\u0000\"\u0004\u0008\u0001\u001002\u0018\u0010*\u001a\u0014\u0012\u0004\u0012\u00028\u0000\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H00\u00000\u0010J6\u00101\u001a\u0008\u0012\u0004\u0012\u0002H00\u0000\"\u0004\u0008\u0001\u001002\u0018\u0010*\u001a\u0014\u0012\u0004\u0012\u00028\u0000\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H00\u00000\u00102\u0008\u0010+\u001a\u0004\u0018\u00010,J4\u00101\u001a\u0008\u0012\u0004\u0012\u0002H00\u0000\"\u0004\u0008\u0001\u001002\u0018\u0010*\u001a\u0014\u0012\u0004\u0012\u00028\u0000\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H00\u00000\u00102\u0006\u0010-\u001a\u00020.J>\u00101\u001a\u0008\u0012\u0004\u0012\u0002H00\u0000\"\u0004\u0008\u0001\u001002\u0018\u0010*\u001a\u0014\u0012\u0004\u0012\u00028\u0000\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H00\u00000\u00102\u0006\u0010-\u001a\u00020.2\u0008\u0010+\u001a\u0004\u0018\u00010,J\u000c\u00102\u001a\u0008\u0012\u0004\u0012\u00020\u00110\u0000J&\u00103\u001a\u0008\u0012\u0004\u0012\u0002H00\u0000\"\u0004\u0008\u0001\u001002\u0012\u0010*\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u0002H00\u0010J0\u00103\u001a\u0008\u0012\u0004\u0012\u0002H00\u0000\"\u0004\u0008\u0001\u001002\u0012\u0010*\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u0002H00\u00102\u0008\u0010+\u001a\u0004\u0018\u00010,J.\u00103\u001a\u0008\u0012\u0004\u0012\u0002H00\u0000\"\u0004\u0008\u0001\u001002\u0012\u0010*\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u0002H00\u00102\u0006\u0010-\u001a\u00020.J8\u00103\u001a\u0008\u0012\u0004\u0012\u0002H00\u0000\"\u0004\u0008\u0001\u001002\u0012\u0010*\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u0002H00\u00102\u0006\u0010-\u001a\u00020.2\u0008\u0010+\u001a\u0004\u0018\u00010,J,\u00104\u001a\u0008\u0012\u0004\u0012\u0002H00\u0000\"\u0004\u0008\u0001\u001002\u0018\u0010*\u001a\u0014\u0012\u0004\u0012\u00028\u0000\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H00\u00000\u0010J6\u00104\u001a\u0008\u0012\u0004\u0012\u0002H00\u0000\"\u0004\u0008\u0001\u001002\u0018\u0010*\u001a\u0014\u0012\u0004\u0012\u00028\u0000\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H00\u00000\u00102\u0008\u0010+\u001a\u0004\u0018\u00010,J4\u00104\u001a\u0008\u0012\u0004\u0012\u0002H00\u0000\"\u0004\u0008\u0001\u001002\u0018\u0010*\u001a\u0014\u0012\u0004\u0012\u00028\u0000\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H00\u00000\u00102\u0006\u0010-\u001a\u00020.J>\u00104\u001a\u0008\u0012\u0004\u0012\u0002H00\u0000\"\u0004\u0008\u0001\u001002\u0018\u0010*\u001a\u0014\u0012\u0004\u0012\u00028\u0000\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H00\u00000\u00102\u0006\u0010-\u001a\u00020.2\u0008\u0010+\u001a\u0004\u0018\u00010,J\u0008\u00105\u001a\u000206H\u0002J\u0006\u00107\u001a\u00020\u0007J\u0016\u00108\u001a\u00020\u00072\u000e\u0010\u0012\u001a\n\u0018\u00010\u0013j\u0004\u0018\u0001`\u0014J\u0015\u00109\u001a\u00020\u00072\u0008\u0010\u0004\u001a\u0004\u0018\u00018\u0000\u00a2\u0006\u0002\u0010:J\u0006\u0010;\u001a\u000206J\u0016\u0010;\u001a\u00020\u00072\u0006\u0010<\u001a\u00020=2\u0006\u0010>\u001a\u00020?R\u000e\u0010\t\u001a\u00020\u0007X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0007X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0016\u0010\u000b\u001a\n \r*\u0004\u0018\u00010\u000c0\u000cX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\"\u0010\u000e\u001a\u0016\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020\u00110\u0010\u0018\u00010\u000fX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0019\u0010\u0012\u001a\n\u0018\u00010\u0013j\u0004\u0018\u0001`\u00148F\u00a2\u0006\u0006\u001a\u0004\u0008\u0015\u0010\u0016R\u0016\u0010\u0017\u001a\n\u0018\u00010\u0013j\u0004\u0018\u0001`\u0014X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0018\u001a\u00020\u0007X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0011\u0010\u0019\u001a\u00020\u00078F\u00a2\u0006\u0006\u001a\u0004\u0008\u0019\u0010\u001aR\u0011\u0010\u001b\u001a\u00020\u00078F\u00a2\u0006\u0006\u001a\u0004\u0008\u001b\u0010\u001aR\u0011\u0010\u001c\u001a\u00020\u00078F\u00a2\u0006\u0006\u001a\u0004\u0008\u001c\u0010\u001aR\u000e\u0010\u001d\u001a\u00020\u001eX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0013\u0010\u0004\u001a\u0004\u0018\u00018\u00008F\u00a2\u0006\u0006\u001a\u0004\u0008\u001f\u0010 R\u0012\u0010!\u001a\u0004\u0018\u00018\u0000X\u0082\u000e\u00a2\u0006\u0004\n\u0002\u0010\"R\u0010\u0010#\u001a\u0004\u0018\u00010$X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006C"
    }
    d2 = {
        "Lcom/facebook/bolts/Task;",
        "TResult",
        "",
        "()V",
        "result",
        "(Ljava/lang/Object;)V",
        "cancelled",
        "",
        "(Z)V",
        "cancelledField",
        "completeField",
        "condition",
        "Ljava/util/concurrent/locks/Condition;",
        "kotlin.jvm.PlatformType",
        "continuations",
        "",
        "Lcom/facebook/bolts/Continuation;",
        "Ljava/lang/Void;",
        "error",
        "Ljava/lang/Exception;",
        "Lkotlin/Exception;",
        "getError",
        "()Ljava/lang/Exception;",
        "errorField",
        "errorHasBeenObserved",
        "isCancelled",
        "()Z",
        "isCompleted",
        "isFaulted",
        "lock",
        "Ljava/util/concurrent/locks/ReentrantLock;",
        "getResult",
        "()Ljava/lang/Object;",
        "resultField",
        "Ljava/lang/Object;",
        "unobservedErrorNotifier",
        "Lcom/facebook/bolts/UnobservedErrorNotifier;",
        "cast",
        "TOut",
        "continueWhile",
        "predicate",
        "Ljava/util/concurrent/Callable;",
        "continuation",
        "ct",
        "Lcom/facebook/bolts/CancellationToken;",
        "executor",
        "Ljava/util/concurrent/Executor;",
        "continueWith",
        "TContinuationResult",
        "continueWithTask",
        "makeVoid",
        "onSuccess",
        "onSuccessTask",
        "runContinuations",
        "",
        "trySetCancelled",
        "trySetError",
        "trySetResult",
        "(Ljava/lang/Object;)Z",
        "waitForCompletion",
        "duration",
        "",
        "timeUnit",
        "Ljava/util/concurrent/TimeUnit;",
        "Companion",
        "TaskCompletionSource",
        "UnobservedExceptionHandler",
        "facebook-core_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x5,
        0x1
    }
.end annotation


# static fields
.field public static final BACKGROUND_EXECUTOR:Ljava/util/concurrent/ExecutorService;

.field public static final Companion:Lcom/facebook/bolts/Task$Companion;

.field private static final IMMEDIATE_EXECUTOR:Ljava/util/concurrent/Executor;

.field private static final TASK_CANCELLED:Lcom/facebook/bolts/Task;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/bolts/Task<",
            "*>;"
        }
    .end annotation
.end field

.field private static final TASK_FALSE:Lcom/facebook/bolts/Task;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/bolts/Task<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static final TASK_NULL:Lcom/facebook/bolts/Task;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/bolts/Task<",
            "*>;"
        }
    .end annotation
.end field

.field private static final TASK_TRUE:Lcom/facebook/bolts/Task;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/bolts/Task<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final UI_THREAD_EXECUTOR:Ljava/util/concurrent/Executor;

.field private static volatile unobservedExceptionHandler:Lcom/facebook/bolts/Task$UnobservedExceptionHandler;


# instance fields
.field private cancelledField:Z

.field private completeField:Z

.field private final condition:Ljava/util/concurrent/locks/Condition;

.field private continuations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/facebook/bolts/Continuation<",
            "TTResult;",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation
.end field

.field private errorField:Ljava/lang/Exception;

.field private errorHasBeenObserved:Z

.field private final lock:Ljava/util/concurrent/locks/ReentrantLock;

.field private resultField:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TTResult;"
        }
    .end annotation
.end field

.field private unobservedErrorNotifier:Lcom/facebook/bolts/UnobservedErrorNotifier;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/facebook/bolts/Task$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/bolts/Task$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/facebook/bolts/Task;->Companion:Lcom/facebook/bolts/Task$Companion;

    .line 528
    sget-object v0, Lcom/facebook/bolts/BoltsExecutors;->Companion:Lcom/facebook/bolts/BoltsExecutors$Companion;

    invoke-virtual {v0}, Lcom/facebook/bolts/BoltsExecutors$Companion;->background()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/facebook/bolts/Task;->BACKGROUND_EXECUTOR:Ljava/util/concurrent/ExecutorService;

    .line 535
    sget-object v0, Lcom/facebook/bolts/BoltsExecutors;->Companion:Lcom/facebook/bolts/BoltsExecutors$Companion;

    invoke-virtual {v0}, Lcom/facebook/bolts/BoltsExecutors$Companion;->immediate$facebook_core_release()Ljava/util/concurrent/Executor;

    move-result-object v0

    sput-object v0, Lcom/facebook/bolts/Task;->IMMEDIATE_EXECUTOR:Ljava/util/concurrent/Executor;

    .line 538
    sget-object v0, Lcom/facebook/bolts/AndroidExecutors;->Companion:Lcom/facebook/bolts/AndroidExecutors$Companion;

    invoke-virtual {v0}, Lcom/facebook/bolts/AndroidExecutors$Companion;->uiThread()Ljava/util/concurrent/Executor;

    move-result-object v0

    sput-object v0, Lcom/facebook/bolts/Task;->UI_THREAD_EXECUTOR:Ljava/util/concurrent/Executor;

    .line 975
    new-instance v0, Lcom/facebook/bolts/Task;

    invoke-direct {v0, v1}, Lcom/facebook/bolts/Task;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/facebook/bolts/Task;->TASK_NULL:Lcom/facebook/bolts/Task;

    .line 976
    new-instance v0, Lcom/facebook/bolts/Task;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/facebook/bolts/Task;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/facebook/bolts/Task;->TASK_TRUE:Lcom/facebook/bolts/Task;

    .line 977
    new-instance v0, Lcom/facebook/bolts/Task;

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/facebook/bolts/Task;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/facebook/bolts/Task;->TASK_FALSE:Lcom/facebook/bolts/Task;

    .line 978
    new-instance v0, Lcom/facebook/bolts/Task;

    invoke-direct {v0, v1}, Lcom/facebook/bolts/Task;-><init>(Z)V

    sput-object v0, Lcom/facebook/bolts/Task;->TASK_CANCELLED:Lcom/facebook/bolts/Task;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lcom/facebook/bolts/Task;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 61
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/bolts/Task;->condition:Ljava/util/concurrent/locks/Condition;

    .line 68
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/facebook/bolts/Task;->continuations:Ljava/util/List;

    return-void
.end method

.method private constructor <init>(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTResult;)V"
        }
    .end annotation

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lcom/facebook/bolts/Task;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 61
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/bolts/Task;->condition:Ljava/util/concurrent/locks/Condition;

    .line 68
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/facebook/bolts/Task;->continuations:Ljava/util/List;

    .line 72
    invoke-virtual {p0, p1}, Lcom/facebook/bolts/Task;->trySetResult(Ljava/lang/Object;)Z

    return-void
.end method

.method private constructor <init>(Z)V
    .locals 1

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lcom/facebook/bolts/Task;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 61
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/bolts/Task;->condition:Ljava/util/concurrent/locks/Condition;

    .line 68
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/facebook/bolts/Task;->continuations:Ljava/util/List;

    if-eqz p1, :cond_0

    .line 77
    invoke-virtual {p0}, Lcom/facebook/bolts/Task;->trySetCancelled()Z

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 79
    invoke-virtual {p0, p1}, Lcom/facebook/bolts/Task;->trySetResult(Ljava/lang/Object;)Z

    :goto_0
    return-void
.end method

.method public static final synthetic access$getIMMEDIATE_EXECUTOR$cp()Ljava/util/concurrent/Executor;
    .locals 1

    .line 38
    sget-object v0, Lcom/facebook/bolts/Task;->IMMEDIATE_EXECUTOR:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method public static final synthetic access$getTASK_CANCELLED$cp()Lcom/facebook/bolts/Task;
    .locals 1

    .line 38
    sget-object v0, Lcom/facebook/bolts/Task;->TASK_CANCELLED:Lcom/facebook/bolts/Task;

    return-object v0
.end method

.method public static final synthetic access$getTASK_FALSE$cp()Lcom/facebook/bolts/Task;
    .locals 1

    .line 38
    sget-object v0, Lcom/facebook/bolts/Task;->TASK_FALSE:Lcom/facebook/bolts/Task;

    return-object v0
.end method

.method public static final synthetic access$getTASK_NULL$cp()Lcom/facebook/bolts/Task;
    .locals 1

    .line 38
    sget-object v0, Lcom/facebook/bolts/Task;->TASK_NULL:Lcom/facebook/bolts/Task;

    return-object v0
.end method

.method public static final synthetic access$getTASK_TRUE$cp()Lcom/facebook/bolts/Task;
    .locals 1

    .line 38
    sget-object v0, Lcom/facebook/bolts/Task;->TASK_TRUE:Lcom/facebook/bolts/Task;

    return-object v0
.end method

.method public static final synthetic access$getUnobservedExceptionHandler$cp()Lcom/facebook/bolts/Task$UnobservedExceptionHandler;
    .locals 1

    .line 38
    sget-object v0, Lcom/facebook/bolts/Task;->unobservedExceptionHandler:Lcom/facebook/bolts/Task$UnobservedExceptionHandler;

    return-object v0
.end method

.method public static final synthetic access$setUnobservedExceptionHandler$cp(Lcom/facebook/bolts/Task$UnobservedExceptionHandler;)V
    .locals 0

    .line 38
    sput-object p0, Lcom/facebook/bolts/Task;->unobservedExceptionHandler:Lcom/facebook/bolts/Task$UnobservedExceptionHandler;

    return-void
.end method

.method public static final call(Ljava/util/concurrent/Callable;)Lcom/facebook/bolts/Task;
    .locals 1
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

    sget-object v0, Lcom/facebook/bolts/Task;->Companion:Lcom/facebook/bolts/Task$Companion;

    invoke-virtual {v0, p0}, Lcom/facebook/bolts/Task$Companion;->call(Ljava/util/concurrent/Callable;)Lcom/facebook/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static final call(Ljava/util/concurrent/Callable;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;
    .locals 1
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

    sget-object v0, Lcom/facebook/bolts/Task;->Companion:Lcom/facebook/bolts/Task$Companion;

    invoke-virtual {v0, p0, p1}, Lcom/facebook/bolts/Task$Companion;->call(Ljava/util/concurrent/Callable;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static final call(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;)Lcom/facebook/bolts/Task;
    .locals 1
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

    sget-object v0, Lcom/facebook/bolts/Task;->Companion:Lcom/facebook/bolts/Task$Companion;

    invoke-virtual {v0, p0, p1}, Lcom/facebook/bolts/Task$Companion;->call(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;)Lcom/facebook/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static final call(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;
    .locals 1
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

    sget-object v0, Lcom/facebook/bolts/Task;->Companion:Lcom/facebook/bolts/Task$Companion;

    invoke-virtual {v0, p0, p1, p2}, Lcom/facebook/bolts/Task$Companion;->call(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static final callInBackground(Ljava/util/concurrent/Callable;)Lcom/facebook/bolts/Task;
    .locals 1
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

    sget-object v0, Lcom/facebook/bolts/Task;->Companion:Lcom/facebook/bolts/Task$Companion;

    invoke-virtual {v0, p0}, Lcom/facebook/bolts/Task$Companion;->callInBackground(Ljava/util/concurrent/Callable;)Lcom/facebook/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static final callInBackground(Ljava/util/concurrent/Callable;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;
    .locals 1
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

    sget-object v0, Lcom/facebook/bolts/Task;->Companion:Lcom/facebook/bolts/Task$Companion;

    invoke-virtual {v0, p0, p1}, Lcom/facebook/bolts/Task$Companion;->callInBackground(Ljava/util/concurrent/Callable;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static final cancelled()Lcom/facebook/bolts/Task;
    .locals 1
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

    sget-object v0, Lcom/facebook/bolts/Task;->Companion:Lcom/facebook/bolts/Task$Companion;

    invoke-virtual {v0}, Lcom/facebook/bolts/Task$Companion;->cancelled()Lcom/facebook/bolts/Task;

    move-result-object v0

    return-object v0
.end method

.method public static synthetic continueWhile$default(Lcom/facebook/bolts/Task;Ljava/util/concurrent/Callable;Lcom/facebook/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;ILjava/lang/Object;)Lcom/facebook/bolts/Task;
    .locals 0

    and-int/lit8 p6, p5, 0x4

    if-eqz p6, :cond_0

    .line 206
    sget-object p3, Lcom/facebook/bolts/Task;->IMMEDIATE_EXECUTOR:Ljava/util/concurrent/Executor;

    :cond_0
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_1

    const/4 p4, 0x0

    .line 207
    check-cast p4, Lcom/facebook/bolts/CancellationToken;

    :cond_1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/facebook/bolts/Task;->continueWhile(Ljava/util/concurrent/Callable;Lcom/facebook/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static final delay(J)Lcom/facebook/bolts/Task;
    .locals 1
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

    sget-object v0, Lcom/facebook/bolts/Task;->Companion:Lcom/facebook/bolts/Task$Companion;

    invoke-virtual {v0, p0, p1}, Lcom/facebook/bolts/Task$Companion;->delay(J)Lcom/facebook/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static final delay(JLcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;
    .locals 1
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

    sget-object v0, Lcom/facebook/bolts/Task;->Companion:Lcom/facebook/bolts/Task$Companion;

    invoke-virtual {v0, p0, p1, p2}, Lcom/facebook/bolts/Task$Companion;->delay(JLcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static final delay$facebook_core_release(JLjava/util/concurrent/ScheduledExecutorService;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;
    .locals 1
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

    sget-object v0, Lcom/facebook/bolts/Task;->Companion:Lcom/facebook/bolts/Task$Companion;

    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/facebook/bolts/Task$Companion;->delay$facebook_core_release(JLjava/util/concurrent/ScheduledExecutorService;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static final forError(Ljava/lang/Exception;)Lcom/facebook/bolts/Task;
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

    sget-object v0, Lcom/facebook/bolts/Task;->Companion:Lcom/facebook/bolts/Task$Companion;

    invoke-virtual {v0, p0}, Lcom/facebook/bolts/Task$Companion;->forError(Ljava/lang/Exception;)Lcom/facebook/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static final forResult(Ljava/lang/Object;)Lcom/facebook/bolts/Task;
    .locals 1
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

    sget-object v0, Lcom/facebook/bolts/Task;->Companion:Lcom/facebook/bolts/Task$Companion;

    invoke-virtual {v0, p0}, Lcom/facebook/bolts/Task$Companion;->forResult(Ljava/lang/Object;)Lcom/facebook/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static final getUnobservedExceptionHandler()Lcom/facebook/bolts/Task$UnobservedExceptionHandler;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/facebook/bolts/Task;->Companion:Lcom/facebook/bolts/Task$Companion;

    invoke-virtual {v0}, Lcom/facebook/bolts/Task$Companion;->getUnobservedExceptionHandler()Lcom/facebook/bolts/Task$UnobservedExceptionHandler;

    move-result-object v0

    return-object v0
.end method

.method private final runContinuations()V
    .locals 3

    .line 459
    iget-object v0, p0, Lcom/facebook/bolts/Task;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 460
    :try_start_0
    iget-object v1, p0, Lcom/facebook/bolts/Task;->continuations:Ljava/util/List;

    if-eqz v1, :cond_0

    check-cast v1, Ljava/lang/Iterable;

    .line 983
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/bolts/Continuation;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 462
    :try_start_1
    invoke-interface {v2, p0}, Lcom/facebook/bolts/Continuation;->then(Lcom/facebook/bolts/Task;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v1

    .line 466
    :try_start_2
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    check-cast v2, Ljava/lang/Throwable;

    throw v2

    :catch_0
    move-exception v1

    .line 464
    check-cast v1, Ljava/lang/Throwable;

    throw v1

    :cond_0
    const/4 v1, 0x0

    .line 469
    check-cast v1, Ljava/util/List;

    iput-object v1, p0, Lcom/facebook/bolts/Task;->continuations:Ljava/util/List;

    .line 470
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 459
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_1
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public static final setUnobservedExceptionHandler(Lcom/facebook/bolts/Task$UnobservedExceptionHandler;)V
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/facebook/bolts/Task;->Companion:Lcom/facebook/bolts/Task$Companion;

    invoke-virtual {v0, p0}, Lcom/facebook/bolts/Task$Companion;->setUnobservedExceptionHandler(Lcom/facebook/bolts/Task$UnobservedExceptionHandler;)V

    return-void
.end method

.method public static final whenAll(Ljava/util/Collection;)Lcom/facebook/bolts/Task;
    .locals 1
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

    sget-object v0, Lcom/facebook/bolts/Task;->Companion:Lcom/facebook/bolts/Task$Companion;

    invoke-virtual {v0, p0}, Lcom/facebook/bolts/Task$Companion;->whenAll(Ljava/util/Collection;)Lcom/facebook/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static final whenAllResult(Ljava/util/Collection;)Lcom/facebook/bolts/Task;
    .locals 1
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

    sget-object v0, Lcom/facebook/bolts/Task;->Companion:Lcom/facebook/bolts/Task$Companion;

    invoke-virtual {v0, p0}, Lcom/facebook/bolts/Task$Companion;->whenAllResult(Ljava/util/Collection;)Lcom/facebook/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static final whenAny(Ljava/util/Collection;)Lcom/facebook/bolts/Task;
    .locals 1
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

    sget-object v0, Lcom/facebook/bolts/Task;->Companion:Lcom/facebook/bolts/Task$Companion;

    invoke-virtual {v0, p0}, Lcom/facebook/bolts/Task$Companion;->whenAny(Ljava/util/Collection;)Lcom/facebook/bolts/Task;

    move-result-object p0

    return-object p0
.end method

.method public static final whenAnyResult(Ljava/util/Collection;)Lcom/facebook/bolts/Task;
    .locals 1
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

    sget-object v0, Lcom/facebook/bolts/Task;->Companion:Lcom/facebook/bolts/Task$Companion;

    invoke-virtual {v0, p0}, Lcom/facebook/bolts/Task$Companion;->whenAnyResult(Ljava/util/Collection;)Lcom/facebook/bolts/Task;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final cast()Lcom/facebook/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TOut:",
            "Ljava/lang/Object;",
            ">()",
            "Lcom/facebook/bolts/Task<",
            "TTOut;>;"
        }
    .end annotation

    .line 153
    move-object v0, p0

    check-cast v0, Lcom/facebook/bolts/Task;

    return-object v0
.end method

.method public final continueWhile(Ljava/util/concurrent/Callable;Lcom/facebook/bolts/Continuation;)Lcom/facebook/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable<",
            "Ljava/lang/Boolean;",
            ">;",
            "Lcom/facebook/bolts/Continuation<",
            "Ljava/lang/Void;",
            "Lcom/facebook/bolts/Task<",
            "Ljava/lang/Void;",
            ">;>;)",
            "Lcom/facebook/bolts/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    const-string v0, "predicate"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "continuation"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 177
    sget-object v0, Lcom/facebook/bolts/Task;->IMMEDIATE_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v1, 0x0

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/facebook/bolts/Task;->continueWhile(Ljava/util/concurrent/Callable;Lcom/facebook/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public final continueWhile(Ljava/util/concurrent/Callable;Lcom/facebook/bolts/Continuation;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable<",
            "Ljava/lang/Boolean;",
            ">;",
            "Lcom/facebook/bolts/Continuation<",
            "Ljava/lang/Void;",
            "Lcom/facebook/bolts/Task<",
            "Ljava/lang/Void;",
            ">;>;",
            "Lcom/facebook/bolts/CancellationToken;",
            ")",
            "Lcom/facebook/bolts/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    const-string v0, "predicate"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "continuation"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 189
    sget-object v0, Lcom/facebook/bolts/Task;->IMMEDIATE_EXECUTOR:Ljava/util/concurrent/Executor;

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/facebook/bolts/Task;->continueWhile(Ljava/util/concurrent/Callable;Lcom/facebook/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public final continueWhile(Ljava/util/concurrent/Callable;Lcom/facebook/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable<",
            "Ljava/lang/Boolean;",
            ">;",
            "Lcom/facebook/bolts/Continuation<",
            "Ljava/lang/Void;",
            "Lcom/facebook/bolts/Task<",
            "Ljava/lang/Void;",
            ">;>;",
            "Ljava/util/concurrent/Executor;",
            "Lcom/facebook/bolts/CancellationToken;",
            ")",
            "Lcom/facebook/bolts/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    const-string v0, "predicate"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "continuation"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "executor"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 210
    new-instance v0, Lcom/facebook/bolts/Task$continueWhile$predicateContinuation$1;

    invoke-direct {v0, p4, p1, p2, p3}, Lcom/facebook/bolts/Task$continueWhile$predicateContinuation$1;-><init>(Lcom/facebook/bolts/CancellationToken;Ljava/util/concurrent/Callable;Lcom/facebook/bolts/Continuation;Ljava/util/concurrent/Executor;)V

    .line 209
    check-cast v0, Lcom/facebook/bolts/Continuation;

    .line 223
    invoke-virtual {p0}, Lcom/facebook/bolts/Task;->makeVoid()Lcom/facebook/bolts/Task;

    move-result-object p1

    invoke-virtual {p1, v0, p3}, Lcom/facebook/bolts/Task;->continueWithTask(Lcom/facebook/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public final continueWith(Lcom/facebook/bolts/Continuation;)Lcom/facebook/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/bolts/Continuation<",
            "TTResult;TTContinuationResult;>;)",
            "Lcom/facebook/bolts/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    const-string v0, "continuation"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 273
    sget-object v0, Lcom/facebook/bolts/Task;->IMMEDIATE_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lcom/facebook/bolts/Task;->continueWith(Lcom/facebook/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public final continueWith(Lcom/facebook/bolts/Continuation;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/bolts/Continuation<",
            "TTResult;TTContinuationResult;>;",
            "Lcom/facebook/bolts/CancellationToken;",
            ")",
            "Lcom/facebook/bolts/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    const-string v0, "continuation"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 284
    sget-object v0, Lcom/facebook/bolts/Task;->IMMEDIATE_EXECUTOR:Ljava/util/concurrent/Executor;

    invoke-virtual {p0, p1, v0, p2}, Lcom/facebook/bolts/Task;->continueWith(Lcom/facebook/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public final continueWith(Lcom/facebook/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/bolts/Continuation<",
            "TTResult;TTContinuationResult;>;",
            "Ljava/util/concurrent/Executor;",
            ")",
            "Lcom/facebook/bolts/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    const-string v0, "continuation"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "executor"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 235
    invoke-virtual {p0, p1, p2, v0}, Lcom/facebook/bolts/Task;->continueWith(Lcom/facebook/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public final continueWith(Lcom/facebook/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/bolts/Continuation<",
            "TTResult;TTContinuationResult;>;",
            "Ljava/util/concurrent/Executor;",
            "Lcom/facebook/bolts/CancellationToken;",
            ")",
            "Lcom/facebook/bolts/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    const-string v0, "continuation"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "executor"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 248
    new-instance v0, Lkotlin/jvm/internal/Ref$BooleanRef;

    invoke-direct {v0}, Lkotlin/jvm/internal/Ref$BooleanRef;-><init>()V

    .line 249
    new-instance v8, Lcom/facebook/bolts/TaskCompletionSource;

    invoke-direct {v8}, Lcom/facebook/bolts/TaskCompletionSource;-><init>()V

    .line 250
    iget-object v1, p0, Lcom/facebook/bolts/Task;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    move-object v9, v1

    check-cast v9, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v9}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 251
    :try_start_0
    invoke-virtual {p0}, Lcom/facebook/bolts/Task;->isCompleted()Z

    move-result v1

    iput-boolean v1, v0, Lkotlin/jvm/internal/Ref$BooleanRef;->element:Z

    .line 252
    iget-boolean v1, v0, Lkotlin/jvm/internal/Ref$BooleanRef;->element:Z

    if-nez v1, :cond_0

    .line 253
    iget-object v10, p0, Lcom/facebook/bolts/Task;->continuations:Ljava/util/List;

    if-eqz v10, :cond_0

    .line 254
    new-instance v11, Lcom/facebook/bolts/Task$continueWith$$inlined$withLock$lambda$1;

    move-object v1, v11

    move-object v2, p0

    move-object v3, v0

    move-object v4, v8

    move-object v5, p1

    move-object v6, p2

    move-object v7, p3

    invoke-direct/range {v1 .. v7}, Lcom/facebook/bolts/Task$continueWith$$inlined$withLock$lambda$1;-><init>(Lcom/facebook/bolts/Task;Lkotlin/jvm/internal/Ref$BooleanRef;Lcom/facebook/bolts/TaskCompletionSource;Lcom/facebook/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)V

    .line 253
    invoke-interface {v10, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 259
    :cond_0
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 250
    invoke-interface {v9}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 260
    iget-boolean v0, v0, Lkotlin/jvm/internal/Ref$BooleanRef;->element:Z

    if-eqz v0, :cond_1

    .line 261
    sget-object v1, Lcom/facebook/bolts/Task;->Companion:Lcom/facebook/bolts/Task$Companion;

    move-object v2, v8

    move-object v3, p1

    move-object v4, p0

    move-object v5, p2

    move-object v6, p3

    invoke-static/range {v1 .. v6}, Lcom/facebook/bolts/Task$Companion;->access$completeImmediately(Lcom/facebook/bolts/Task$Companion;Lcom/facebook/bolts/TaskCompletionSource;Lcom/facebook/bolts/Continuation;Lcom/facebook/bolts/Task;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)V

    .line 263
    :cond_1
    invoke-virtual {v8}, Lcom/facebook/bolts/TaskCompletionSource;->getTask()Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1

    :catchall_0
    move-exception p1

    .line 250
    invoke-interface {v9}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p1
.end method

.method public final continueWithTask(Lcom/facebook/bolts/Continuation;)Lcom/facebook/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/bolts/Continuation<",
            "TTResult;",
            "Lcom/facebook/bolts/Task<",
            "TTContinuationResult;>;>;)",
            "Lcom/facebook/bolts/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    const-string v0, "continuation"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 332
    sget-object v0, Lcom/facebook/bolts/Task;->IMMEDIATE_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lcom/facebook/bolts/Task;->continueWithTask(Lcom/facebook/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public final continueWithTask(Lcom/facebook/bolts/Continuation;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/bolts/Continuation<",
            "TTResult;",
            "Lcom/facebook/bolts/Task<",
            "TTContinuationResult;>;>;",
            "Lcom/facebook/bolts/CancellationToken;",
            ")",
            "Lcom/facebook/bolts/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    const-string v0, "continuation"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 343
    sget-object v0, Lcom/facebook/bolts/Task;->IMMEDIATE_EXECUTOR:Ljava/util/concurrent/Executor;

    invoke-virtual {p0, p1, v0, p2}, Lcom/facebook/bolts/Task;->continueWithTask(Lcom/facebook/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public final continueWithTask(Lcom/facebook/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/bolts/Continuation<",
            "TTResult;",
            "Lcom/facebook/bolts/Task<",
            "TTContinuationResult;>;>;",
            "Ljava/util/concurrent/Executor;",
            ")",
            "Lcom/facebook/bolts/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    const-string v0, "continuation"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "executor"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 295
    invoke-virtual {p0, p1, p2, v0}, Lcom/facebook/bolts/Task;->continueWithTask(Lcom/facebook/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public final continueWithTask(Lcom/facebook/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/bolts/Continuation<",
            "TTResult;",
            "Lcom/facebook/bolts/Task<",
            "TTContinuationResult;>;>;",
            "Ljava/util/concurrent/Executor;",
            "Lcom/facebook/bolts/CancellationToken;",
            ")",
            "Lcom/facebook/bolts/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    const-string v0, "continuation"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "executor"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 307
    new-instance v0, Lkotlin/jvm/internal/Ref$BooleanRef;

    invoke-direct {v0}, Lkotlin/jvm/internal/Ref$BooleanRef;-><init>()V

    .line 308
    new-instance v8, Lcom/facebook/bolts/TaskCompletionSource;

    invoke-direct {v8}, Lcom/facebook/bolts/TaskCompletionSource;-><init>()V

    .line 309
    iget-object v1, p0, Lcom/facebook/bolts/Task;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    move-object v9, v1

    check-cast v9, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v9}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 310
    :try_start_0
    invoke-virtual {p0}, Lcom/facebook/bolts/Task;->isCompleted()Z

    move-result v1

    iput-boolean v1, v0, Lkotlin/jvm/internal/Ref$BooleanRef;->element:Z

    .line 311
    iget-boolean v1, v0, Lkotlin/jvm/internal/Ref$BooleanRef;->element:Z

    if-nez v1, :cond_0

    .line 312
    iget-object v10, p0, Lcom/facebook/bolts/Task;->continuations:Ljava/util/List;

    if-eqz v10, :cond_0

    .line 313
    new-instance v11, Lcom/facebook/bolts/Task$continueWithTask$$inlined$withLock$lambda$1;

    move-object v1, v11

    move-object v2, p0

    move-object v3, v0

    move-object v4, v8

    move-object v5, p1

    move-object v6, p2

    move-object v7, p3

    invoke-direct/range {v1 .. v7}, Lcom/facebook/bolts/Task$continueWithTask$$inlined$withLock$lambda$1;-><init>(Lcom/facebook/bolts/Task;Lkotlin/jvm/internal/Ref$BooleanRef;Lcom/facebook/bolts/TaskCompletionSource;Lcom/facebook/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)V

    .line 312
    invoke-interface {v10, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 318
    :cond_0
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 309
    invoke-interface {v9}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 319
    iget-boolean v0, v0, Lkotlin/jvm/internal/Ref$BooleanRef;->element:Z

    if-eqz v0, :cond_1

    .line 320
    sget-object v1, Lcom/facebook/bolts/Task;->Companion:Lcom/facebook/bolts/Task$Companion;

    move-object v2, v8

    move-object v3, p1

    move-object v4, p0

    move-object v5, p2

    move-object v6, p3

    invoke-static/range {v1 .. v6}, Lcom/facebook/bolts/Task$Companion;->access$completeAfterTask(Lcom/facebook/bolts/Task$Companion;Lcom/facebook/bolts/TaskCompletionSource;Lcom/facebook/bolts/Continuation;Lcom/facebook/bolts/Task;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)V

    .line 322
    :cond_1
    invoke-virtual {v8}, Lcom/facebook/bolts/TaskCompletionSource;->getTask()Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1

    :catchall_0
    move-exception p1

    .line 309
    invoke-interface {v9}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p1
.end method

.method public final getError()Ljava/lang/Exception;
    .locals 2

    .line 110
    iget-object v0, p0, Lcom/facebook/bolts/Task;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 111
    :try_start_0
    iget-object v1, p0, Lcom/facebook/bolts/Task;->errorField:Ljava/lang/Exception;

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    .line 112
    iput-boolean v1, p0, Lcom/facebook/bolts/Task;->errorHasBeenObserved:Z

    .line 113
    iget-object v1, p0, Lcom/facebook/bolts/Task;->unobservedErrorNotifier:Lcom/facebook/bolts/UnobservedErrorNotifier;

    if-eqz v1, :cond_0

    .line 114
    invoke-virtual {v1}, Lcom/facebook/bolts/UnobservedErrorNotifier;->setObserved()V

    const/4 v1, 0x0

    .line 115
    check-cast v1, Lcom/facebook/bolts/UnobservedErrorNotifier;

    iput-object v1, p0, Lcom/facebook/bolts/Task;->unobservedErrorNotifier:Lcom/facebook/bolts/UnobservedErrorNotifier;

    .line 118
    :cond_0
    iget-object v1, p0, Lcom/facebook/bolts/Task;->errorField:Ljava/lang/Exception;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 110
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object v1

    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final getResult()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TTResult;"
        }
    .end annotation

    .line 104
    iget-object v0, p0, Lcom/facebook/bolts/Task;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_0
    iget-object v1, p0, Lcom/facebook/bolts/Task;->resultField:Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object v1

    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final isCancelled()Z
    .locals 2

    .line 92
    iget-object v0, p0, Lcom/facebook/bolts/Task;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_0
    iget-boolean v1, p0, Lcom/facebook/bolts/Task;->cancelledField:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v1

    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final isCompleted()Z
    .locals 2

    .line 86
    iget-object v0, p0, Lcom/facebook/bolts/Task;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_0
    iget-boolean v1, p0, Lcom/facebook/bolts/Task;->completeField:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v1

    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final isFaulted()Z
    .locals 2

    .line 98
    iget-object v0, p0, Lcom/facebook/bolts/Task;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_0
    iget-object v1, p0, Lcom/facebook/bolts/Task;->errorField:Ljava/lang/Exception;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v1

    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final makeVoid()Lcom/facebook/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/bolts/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 159
    sget-object v0, Lcom/facebook/bolts/Task$makeVoid$1;->INSTANCE:Lcom/facebook/bolts/Task$makeVoid$1;

    check-cast v0, Lcom/facebook/bolts/Continuation;

    .line 158
    invoke-virtual {p0, v0}, Lcom/facebook/bolts/Task;->continueWithTask(Lcom/facebook/bolts/Continuation;)Lcom/facebook/bolts/Task;

    move-result-object v0

    return-object v0
.end method

.method public final onSuccess(Lcom/facebook/bolts/Continuation;)Lcom/facebook/bolts/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/bolts/Continuation<",
            "TTResult;TTContinuationResult;>;)",
            "Lcom/facebook/bolts/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    const-string v0, "continuation"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 389
    sget-object v0, Lcom/facebook/bolts/Task;->IMMEDIATE_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lcom/facebook/bolts/Task;->onSuccess(Lcom/facebook/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public final onSuccess(Lcom/facebook/bolts/Continuation;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/bolts/Continuation<",
            "TTResult;TTContinuationResult;>;",
            "Lcom/facebook/bolts/CancellationToken;",
            ")",
            "Lcom/facebook/bolts/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    const-string v0, "continuation"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 400
    sget-object v0, Lcom/facebook/bolts/Task;->IMMEDIATE_EXECUTOR:Ljava/util/concurrent/Executor;

    invoke-virtual {p0, p1, v0, p2}, Lcom/facebook/bolts/Task;->onSuccess(Lcom/facebook/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public final onSuccess(Lcom/facebook/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/bolts/Continuation<",
            "TTResult;TTContinuationResult;>;",
            "Ljava/util/concurrent/Executor;",
            ")",
            "Lcom/facebook/bolts/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    const-string v0, "continuation"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "executor"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 354
    invoke-virtual {p0, p1, p2, v0}, Lcom/facebook/bolts/Task;->onSuccess(Lcom/facebook/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public final onSuccess(Lcom/facebook/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/bolts/Continuation<",
            "TTResult;TTContinuationResult;>;",
            "Ljava/util/concurrent/Executor;",
            "Lcom/facebook/bolts/CancellationToken;",
            ")",
            "Lcom/facebook/bolts/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    const-string v0, "continuation"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "executor"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 367
    new-instance v0, Lcom/facebook/bolts/Task$onSuccess$1;

    invoke-direct {v0, p3, p1}, Lcom/facebook/bolts/Task$onSuccess$1;-><init>(Lcom/facebook/bolts/CancellationToken;Lcom/facebook/bolts/Continuation;)V

    check-cast v0, Lcom/facebook/bolts/Continuation;

    .line 366
    invoke-virtual {p0, v0, p2}, Lcom/facebook/bolts/Task;->continueWithTask(Lcom/facebook/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public final onSuccessTask(Lcom/facebook/bolts/Continuation;)Lcom/facebook/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/bolts/Continuation<",
            "TTResult;",
            "Lcom/facebook/bolts/Task<",
            "TTContinuationResult;>;>;)",
            "Lcom/facebook/bolts/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    const-string v0, "continuation"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 445
    sget-object v0, Lcom/facebook/bolts/Task;->IMMEDIATE_EXECUTOR:Ljava/util/concurrent/Executor;

    invoke-virtual {p0, p1, v0}, Lcom/facebook/bolts/Task;->onSuccessTask(Lcom/facebook/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public final onSuccessTask(Lcom/facebook/bolts/Continuation;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/bolts/Continuation<",
            "TTResult;",
            "Lcom/facebook/bolts/Task<",
            "TTContinuationResult;>;>;",
            "Lcom/facebook/bolts/CancellationToken;",
            ")",
            "Lcom/facebook/bolts/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    const-string v0, "continuation"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 455
    sget-object v0, Lcom/facebook/bolts/Task;->IMMEDIATE_EXECUTOR:Ljava/util/concurrent/Executor;

    invoke-virtual {p0, p1, v0, p2}, Lcom/facebook/bolts/Task;->onSuccessTask(Lcom/facebook/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public final onSuccessTask(Lcom/facebook/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/bolts/Continuation<",
            "TTResult;",
            "Lcom/facebook/bolts/Task<",
            "TTContinuationResult;>;>;",
            "Ljava/util/concurrent/Executor;",
            ")",
            "Lcom/facebook/bolts/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    const-string v0, "continuation"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "executor"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 411
    invoke-virtual {p0, p1, p2, v0}, Lcom/facebook/bolts/Task;->onSuccessTask(Lcom/facebook/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public final onSuccessTask(Lcom/facebook/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/bolts/Continuation<",
            "TTResult;",
            "Lcom/facebook/bolts/Task<",
            "TTContinuationResult;>;>;",
            "Ljava/util/concurrent/Executor;",
            "Lcom/facebook/bolts/CancellationToken;",
            ")",
            "Lcom/facebook/bolts/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    const-string v0, "continuation"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "executor"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 424
    new-instance v0, Lcom/facebook/bolts/Task$onSuccessTask$1;

    invoke-direct {v0, p3, p1}, Lcom/facebook/bolts/Task$onSuccessTask$1;-><init>(Lcom/facebook/bolts/CancellationToken;Lcom/facebook/bolts/Continuation;)V

    check-cast v0, Lcom/facebook/bolts/Continuation;

    .line 423
    invoke-virtual {p0, v0, p2}, Lcom/facebook/bolts/Task;->continueWithTask(Lcom/facebook/bolts/Continuation;Ljava/util/concurrent/Executor;)Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1
.end method

.method public final trySetCancelled()Z
    .locals 3

    .line 476
    iget-object v0, p0, Lcom/facebook/bolts/Task;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 477
    :try_start_0
    iget-boolean v1, p0, Lcom/facebook/bolts/Task;->completeField:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    .line 478
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v1

    :cond_0
    const/4 v1, 0x1

    .line 480
    :try_start_1
    iput-boolean v1, p0, Lcom/facebook/bolts/Task;->completeField:Z

    .line 481
    iput-boolean v1, p0, Lcom/facebook/bolts/Task;->cancelledField:Z

    .line 482
    iget-object v2, p0, Lcom/facebook/bolts/Task;->condition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Condition;->signalAll()V

    .line 483
    invoke-direct {p0}, Lcom/facebook/bolts/Task;->runContinuations()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 484
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v1

    :catchall_0
    move-exception v1

    .line 476
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final trySetError(Ljava/lang/Exception;)Z
    .locals 3

    .line 506
    iget-object v0, p0, Lcom/facebook/bolts/Task;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 507
    :try_start_0
    iget-boolean v1, p0, Lcom/facebook/bolts/Task;->completeField:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 508
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v2

    :cond_0
    const/4 v1, 0x1

    .line 510
    :try_start_1
    iput-boolean v1, p0, Lcom/facebook/bolts/Task;->completeField:Z

    .line 511
    iput-object p1, p0, Lcom/facebook/bolts/Task;->errorField:Ljava/lang/Exception;

    .line 512
    iput-boolean v2, p0, Lcom/facebook/bolts/Task;->errorHasBeenObserved:Z

    .line 513
    iget-object p1, p0, Lcom/facebook/bolts/Task;->condition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {p1}, Ljava/util/concurrent/locks/Condition;->signalAll()V

    .line 514
    invoke-direct {p0}, Lcom/facebook/bolts/Task;->runContinuations()V

    .line 515
    iget-boolean p1, p0, Lcom/facebook/bolts/Task;->errorHasBeenObserved:Z

    if-nez p1, :cond_1

    sget-object p1, Lcom/facebook/bolts/Task;->unobservedExceptionHandler:Lcom/facebook/bolts/Task$UnobservedExceptionHandler;

    if-eqz p1, :cond_1

    .line 516
    new-instance p1, Lcom/facebook/bolts/UnobservedErrorNotifier;

    invoke-direct {p1, p0}, Lcom/facebook/bolts/UnobservedErrorNotifier;-><init>(Lcom/facebook/bolts/Task;)V

    iput-object p1, p0, Lcom/facebook/bolts/Task;->unobservedErrorNotifier:Lcom/facebook/bolts/UnobservedErrorNotifier;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 518
    :cond_1
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v1

    :catchall_0
    move-exception p1

    .line 506
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p1
.end method

.method public final trySetResult(Ljava/lang/Object;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTResult;)Z"
        }
    .end annotation

    .line 491
    iget-object v0, p0, Lcom/facebook/bolts/Task;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 492
    :try_start_0
    iget-boolean v1, p0, Lcom/facebook/bolts/Task;->completeField:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    const/4 p1, 0x0

    .line 493
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return p1

    :cond_0
    const/4 v1, 0x1

    .line 495
    :try_start_1
    iput-boolean v1, p0, Lcom/facebook/bolts/Task;->completeField:Z

    .line 496
    iput-object p1, p0, Lcom/facebook/bolts/Task;->resultField:Ljava/lang/Object;

    .line 497
    iget-object p1, p0, Lcom/facebook/bolts/Task;->condition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {p1}, Ljava/util/concurrent/locks/Condition;->signalAll()V

    .line 498
    invoke-direct {p0}, Lcom/facebook/bolts/Task;->runContinuations()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 499
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v1

    :catchall_0
    move-exception p1

    .line 491
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p1
.end method

.method public final waitForCompletion()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 125
    iget-object v0, p0, Lcom/facebook/bolts/Task;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 126
    :try_start_0
    invoke-virtual {p0}, Lcom/facebook/bolts/Task;->isCompleted()Z

    move-result v1

    if-nez v1, :cond_0

    .line 127
    iget-object v1, p0, Lcom/facebook/bolts/Task;->condition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Condition;->await()V

    .line 129
    :cond_0
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 125
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final waitForCompletion(JLjava/util/concurrent/TimeUnit;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    const-string v0, "timeUnit"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 140
    iget-object v0, p0, Lcom/facebook/bolts/Task;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 141
    :try_start_0
    invoke-virtual {p0}, Lcom/facebook/bolts/Task;->isCompleted()Z

    move-result v1

    if-nez v1, :cond_0

    .line 142
    iget-object v1, p0, Lcom/facebook/bolts/Task;->condition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v1, p1, p2, p3}, Ljava/util/concurrent/locks/Condition;->await(JLjava/util/concurrent/TimeUnit;)Z

    .line 144
    :cond_0
    invoke-virtual {p0}, Lcom/facebook/bolts/Task;->isCompleted()Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 140
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return p1

    :catchall_0
    move-exception p1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p1
.end method
