.class public Lcom/google/firebase/appcheck/debug/internal/DebugAppCheckProvider;
.super Ljava/lang/Object;
.source "DebugAppCheckProvider.java"

# interfaces
.implements Lcom/google/firebase/appcheck/AppCheckProvider;


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static final UTF_8:Ljava/lang/String; = "UTF-8"


# instance fields
.field private final blockingExecutor:Ljava/util/concurrent/Executor;

.field private final debugSecretTask:Lcom/google/android/gms/tasks/Task;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final liteExecutor:Ljava/util/concurrent/Executor;

.field private final networkClient:Lcom/google/firebase/appcheck/internal/NetworkClient;

.field private final retryManager:Lcom/google/firebase/appcheck/internal/RetryManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 41
    const-class v0, Lcom/google/firebase/appcheck/debug/internal/DebugAppCheckProvider;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/firebase/appcheck/debug/internal/DebugAppCheckProvider;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/google/firebase/FirebaseApp;Lcom/google/firebase/inject/Provider;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/FirebaseApp;",
            "Lcom/google/firebase/inject/Provider<",
            "Lcom/google/firebase/appcheck/debug/InternalDebugSecretProvider;",
            ">;",
            "Ljava/util/concurrent/Executor;",
            "Ljava/util/concurrent/Executor;",
            "Ljava/util/concurrent/Executor;",
            ")V"
        }
    .end annotation

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    new-instance v0, Lcom/google/firebase/appcheck/internal/NetworkClient;

    invoke-direct {v0, p1}, Lcom/google/firebase/appcheck/internal/NetworkClient;-><init>(Lcom/google/firebase/FirebaseApp;)V

    iput-object v0, p0, Lcom/google/firebase/appcheck/debug/internal/DebugAppCheckProvider;->networkClient:Lcom/google/firebase/appcheck/internal/NetworkClient;

    .line 58
    iput-object p3, p0, Lcom/google/firebase/appcheck/debug/internal/DebugAppCheckProvider;->liteExecutor:Ljava/util/concurrent/Executor;

    .line 59
    iput-object p5, p0, Lcom/google/firebase/appcheck/debug/internal/DebugAppCheckProvider;->blockingExecutor:Ljava/util/concurrent/Executor;

    .line 60
    new-instance p3, Lcom/google/firebase/appcheck/internal/RetryManager;

    invoke-direct {p3}, Lcom/google/firebase/appcheck/internal/RetryManager;-><init>()V

    iput-object p3, p0, Lcom/google/firebase/appcheck/debug/internal/DebugAppCheckProvider;->retryManager:Lcom/google/firebase/appcheck/internal/RetryManager;

    .line 63
    invoke-interface {p2}, Lcom/google/firebase/inject/Provider;->get()Ljava/lang/Object;

    move-result-object p3

    if-eqz p3, :cond_0

    .line 64
    invoke-interface {p2}, Lcom/google/firebase/inject/Provider;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/google/firebase/appcheck/debug/InternalDebugSecretProvider;

    invoke-interface {p2}, Lcom/google/firebase/appcheck/debug/InternalDebugSecretProvider;->getDebugSecret()Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    if-nez p2, :cond_1

    .line 68
    invoke-static {p1, p4}, Lcom/google/firebase/appcheck/debug/internal/DebugAppCheckProvider;->determineDebugSecret(Lcom/google/firebase/FirebaseApp;Ljava/util/concurrent/Executor;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    goto :goto_1

    .line 69
    :cond_1
    invoke-static {p2}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    :goto_1
    iput-object p1, p0, Lcom/google/firebase/appcheck/debug/internal/DebugAppCheckProvider;->debugSecretTask:Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Lcom/google/firebase/appcheck/internal/NetworkClient;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;Lcom/google/firebase/appcheck/internal/RetryManager;)V
    .locals 0

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    iput-object p2, p0, Lcom/google/firebase/appcheck/debug/internal/DebugAppCheckProvider;->networkClient:Lcom/google/firebase/appcheck/internal/NetworkClient;

    .line 80
    iput-object p3, p0, Lcom/google/firebase/appcheck/debug/internal/DebugAppCheckProvider;->liteExecutor:Ljava/util/concurrent/Executor;

    .line 81
    iput-object p4, p0, Lcom/google/firebase/appcheck/debug/internal/DebugAppCheckProvider;->blockingExecutor:Ljava/util/concurrent/Executor;

    .line 82
    iput-object p5, p0, Lcom/google/firebase/appcheck/debug/internal/DebugAppCheckProvider;->retryManager:Lcom/google/firebase/appcheck/internal/RetryManager;

    .line 83
    invoke-static {p1}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/appcheck/debug/internal/DebugAppCheckProvider;->debugSecretTask:Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method static determineDebugSecret(Lcom/google/firebase/FirebaseApp;Ljava/util/concurrent/Executor;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/FirebaseApp;",
            "Ljava/util/concurrent/Executor;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 90
    new-instance v0, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    .line 91
    new-instance v1, Lcom/google/firebase/appcheck/debug/internal/-$$Lambda$DebugAppCheckProvider$fTkU0bBlF7qb-ZmdPezevnz-fuQ;

    invoke-direct {v1, p0, v0}, Lcom/google/firebase/appcheck/debug/internal/-$$Lambda$DebugAppCheckProvider$fTkU0bBlF7qb-ZmdPezevnz-fuQ;-><init>(Lcom/google/firebase/FirebaseApp;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    invoke-interface {p1, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 107
    invoke-virtual {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$determineDebugSecret$0(Lcom/google/firebase/FirebaseApp;Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 3

    .line 93
    new-instance v0, Lcom/google/firebase/appcheck/debug/internal/StorageHelper;

    .line 95
    invoke-virtual {p0}, Lcom/google/firebase/FirebaseApp;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0}, Lcom/google/firebase/FirebaseApp;->getPersistenceKey()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, v1, p0}, Lcom/google/firebase/appcheck/debug/internal/StorageHelper;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 96
    invoke-virtual {v0}, Lcom/google/firebase/appcheck/debug/internal/StorageHelper;->retrieveDebugSecret()Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_0

    .line 98
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object p0

    .line 99
    invoke-virtual {v0, p0}, Lcom/google/firebase/appcheck/debug/internal/StorageHelper;->saveDebugSecret(Ljava/lang/String;)V

    .line 101
    :cond_0
    sget-object v0, Lcom/google/firebase/appcheck/debug/internal/DebugAppCheckProvider;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Enter this debug secret into the allow list in the Firebase Console for your project: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    invoke-virtual {p1, p0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$getToken$3(Lcom/google/firebase/appcheck/internal/AppCheckTokenResponse;)Lcom/google/android/gms/tasks/Task;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 129
    invoke-static {p0}, Lcom/google/firebase/appcheck/internal/DefaultAppCheckToken;->constructFromAppCheckTokenResponse(Lcom/google/firebase/appcheck/internal/AppCheckTokenResponse;)Lcom/google/firebase/appcheck/internal/DefaultAppCheckToken;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public getToken()Lcom/google/android/gms/tasks/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/firebase/appcheck/AppCheckToken;",
            ">;"
        }
    .end annotation

    .line 113
    iget-object v0, p0, Lcom/google/firebase/appcheck/debug/internal/DebugAppCheckProvider;->debugSecretTask:Lcom/google/android/gms/tasks/Task;

    iget-object v1, p0, Lcom/google/firebase/appcheck/debug/internal/DebugAppCheckProvider;->liteExecutor:Ljava/util/concurrent/Executor;

    new-instance v2, Lcom/google/firebase/appcheck/debug/internal/-$$Lambda$DebugAppCheckProvider$sPR3wVVU1rqb_1C5byksw3rN5rI;

    invoke-direct {v2, p0}, Lcom/google/firebase/appcheck/debug/internal/-$$Lambda$DebugAppCheckProvider$sPR3wVVU1rqb_1C5byksw3rN5rI;-><init>(Lcom/google/firebase/appcheck/debug/internal/DebugAppCheckProvider;)V

    .line 114
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/tasks/Task;->onSuccessTask(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/SuccessContinuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    iget-object v1, p0, Lcom/google/firebase/appcheck/debug/internal/DebugAppCheckProvider;->liteExecutor:Ljava/util/concurrent/Executor;

    sget-object v2, Lcom/google/firebase/appcheck/debug/internal/-$$Lambda$DebugAppCheckProvider$P6TuxZEcPyIF6i5bDUILNfsTDtc;->INSTANCE:Lcom/google/firebase/appcheck/debug/internal/-$$Lambda$DebugAppCheckProvider$P6TuxZEcPyIF6i5bDUILNfsTDtc;

    .line 126
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/tasks/Task;->onSuccessTask(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/SuccessContinuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method public synthetic lambda$getToken$1$DebugAppCheckProvider(Lcom/google/firebase/appcheck/debug/internal/ExchangeDebugTokenRequest;)Lcom/google/firebase/appcheck/internal/AppCheckTokenResponse;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 121
    iget-object v0, p0, Lcom/google/firebase/appcheck/debug/internal/DebugAppCheckProvider;->networkClient:Lcom/google/firebase/appcheck/internal/NetworkClient;

    .line 122
    invoke-virtual {p1}, Lcom/google/firebase/appcheck/debug/internal/ExchangeDebugTokenRequest;->toJsonString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "UTF-8"

    invoke-virtual {p1, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p1

    iget-object v1, p0, Lcom/google/firebase/appcheck/debug/internal/DebugAppCheckProvider;->retryManager:Lcom/google/firebase/appcheck/internal/RetryManager;

    const/4 v2, 0x2

    .line 121
    invoke-virtual {v0, p1, v2, v1}, Lcom/google/firebase/appcheck/internal/NetworkClient;->exchangeAttestationForAppCheckToken([BILcom/google/firebase/appcheck/internal/RetryManager;)Lcom/google/firebase/appcheck/internal/AppCheckTokenResponse;

    move-result-object p1

    return-object p1
.end method

.method public synthetic lambda$getToken$2$DebugAppCheckProvider(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 117
    new-instance v0, Lcom/google/firebase/appcheck/debug/internal/ExchangeDebugTokenRequest;

    invoke-direct {v0, p1}, Lcom/google/firebase/appcheck/debug/internal/ExchangeDebugTokenRequest;-><init>(Ljava/lang/String;)V

    .line 118
    iget-object p1, p0, Lcom/google/firebase/appcheck/debug/internal/DebugAppCheckProvider;->blockingExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/google/firebase/appcheck/debug/internal/-$$Lambda$DebugAppCheckProvider$tmNLEz8iopXb3RbYkO5HTfkYjoQ;

    invoke-direct {v1, p0, v0}, Lcom/google/firebase/appcheck/debug/internal/-$$Lambda$DebugAppCheckProvider$tmNLEz8iopXb3RbYkO5HTfkYjoQ;-><init>(Lcom/google/firebase/appcheck/debug/internal/DebugAppCheckProvider;Lcom/google/firebase/appcheck/debug/internal/ExchangeDebugTokenRequest;)V

    invoke-static {p1, v1}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method
