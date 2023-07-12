.class public Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;
.super Lcom/google/firebase/appcheck/FirebaseAppCheck;
.source "DefaultFirebaseAppCheck.java"


# static fields
.field private static final BUFFER_TIME_MILLIS:J = 0x493e0L


# instance fields
.field private final appCheckListenerList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/firebase/appcheck/FirebaseAppCheck$AppCheckListener;",
            ">;"
        }
    .end annotation
.end field

.field private appCheckProvider:Lcom/google/firebase/appcheck/AppCheckProvider;

.field private appCheckProviderFactory:Lcom/google/firebase/appcheck/AppCheckProviderFactory;

.field private final appCheckTokenListenerList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/firebase/appcheck/interop/AppCheckTokenListener;",
            ">;"
        }
    .end annotation
.end field

.field private final backgroundExecutor:Ljava/util/concurrent/Executor;

.field private cachedToken:Lcom/google/firebase/appcheck/AppCheckToken;

.field private final clock:Lcom/google/firebase/appcheck/internal/util/Clock;

.field private final firebaseApp:Lcom/google/firebase/FirebaseApp;

.field private final heartbeatControllerProvider:Lcom/google/firebase/inject/Provider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/firebase/inject/Provider<",
            "Lcom/google/firebase/heartbeatinfo/HeartBeatController;",
            ">;"
        }
    .end annotation
.end field

.field private final liteExecutor:Ljava/util/concurrent/Executor;

.field private final retrieveStoredTokenTask:Lcom/google/android/gms/tasks/Task;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private final storageHelper:Lcom/google/firebase/appcheck/internal/StorageHelper;

.field private final tokenRefreshManager:Lcom/google/firebase/appcheck/internal/TokenRefreshManager;

.field private final uiExecutor:Ljava/util/concurrent/Executor;


# direct methods
.method public constructor <init>(Lcom/google/firebase/FirebaseApp;Lcom/google/firebase/inject/Provider;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;Ljava/util/concurrent/ScheduledExecutorService;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/FirebaseApp;",
            "Lcom/google/firebase/inject/Provider<",
            "Lcom/google/firebase/heartbeatinfo/HeartBeatController;",
            ">;",
            "Ljava/util/concurrent/Executor;",
            "Ljava/util/concurrent/Executor;",
            "Ljava/util/concurrent/Executor;",
            "Ljava/util/concurrent/ScheduledExecutorService;",
            ")V"
        }
    .end annotation

    .line 71
    invoke-direct {p0}, Lcom/google/firebase/appcheck/FirebaseAppCheck;-><init>()V

    .line 72
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    iput-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->firebaseApp:Lcom/google/firebase/FirebaseApp;

    .line 75
    iput-object p2, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->heartbeatControllerProvider:Lcom/google/firebase/inject/Provider;

    .line 76
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckTokenListenerList:Ljava/util/List;

    .line 77
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckListenerList:Ljava/util/List;

    .line 78
    new-instance p2, Lcom/google/firebase/appcheck/internal/StorageHelper;

    .line 79
    invoke-virtual {p1}, Lcom/google/firebase/FirebaseApp;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/firebase/FirebaseApp;->getPersistenceKey()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p2, v0, v1}, Lcom/google/firebase/appcheck/internal/StorageHelper;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object p2, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->storageHelper:Lcom/google/firebase/appcheck/internal/StorageHelper;

    .line 80
    new-instance p2, Lcom/google/firebase/appcheck/internal/TokenRefreshManager;

    .line 82
    invoke-virtual {p1}, Lcom/google/firebase/FirebaseApp;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p2, p1, p0, p4, p6}, Lcom/google/firebase/appcheck/internal/TokenRefreshManager;-><init>(Landroid/content/Context;Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;Ljava/util/concurrent/Executor;Ljava/util/concurrent/ScheduledExecutorService;)V

    iput-object p2, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->tokenRefreshManager:Lcom/google/firebase/appcheck/internal/TokenRefreshManager;

    .line 86
    iput-object p3, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->uiExecutor:Ljava/util/concurrent/Executor;

    .line 87
    iput-object p4, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->liteExecutor:Ljava/util/concurrent/Executor;

    .line 88
    iput-object p5, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->backgroundExecutor:Ljava/util/concurrent/Executor;

    .line 89
    invoke-direct {p0, p5}, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->retrieveStoredAppCheckTokenInBackground(Ljava/util/concurrent/Executor;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->retrieveStoredTokenTask:Lcom/google/android/gms/tasks/Task;

    .line 90
    new-instance p1, Lcom/google/firebase/appcheck/internal/util/Clock$DefaultClock;

    invoke-direct {p1}, Lcom/google/firebase/appcheck/internal/util/Clock$DefaultClock;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->clock:Lcom/google/firebase/appcheck/internal/util/Clock;

    return-void
.end method

.method private hasValidToken()Z
    .locals 5

    .line 288
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->cachedToken:Lcom/google/firebase/appcheck/AppCheckToken;

    if-eqz v0, :cond_0

    .line 289
    invoke-virtual {v0}, Lcom/google/firebase/appcheck/AppCheckToken;->getExpireTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->clock:Lcom/google/firebase/appcheck/internal/util/Clock;

    invoke-interface {v2}, Lcom/google/firebase/appcheck/internal/util/Clock;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v0, v2

    const-wide/32 v2, 0x493e0

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method static synthetic lambda$getToken$1(Lcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 200
    invoke-virtual {p0}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 203
    invoke-virtual {p0}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/appcheck/AppCheckToken;

    .line 202
    invoke-static {p0}, Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;->constructFromAppCheckToken(Lcom/google/firebase/appcheck/AppCheckToken;)Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;

    move-result-object p0

    .line 201
    invoke-static {p0}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0

    .line 207
    :cond_0
    new-instance v0, Lcom/google/firebase/FirebaseException;

    .line 210
    invoke-virtual {p0}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    .line 211
    invoke-virtual {p0}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p0

    invoke-direct {v0, v1, p0}, Lcom/google/firebase/FirebaseException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 208
    invoke-static {v0}, Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;->constructFromError(Lcom/google/firebase/FirebaseException;)Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;

    move-result-object p0

    .line 207
    invoke-static {p0}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method

.method private retrieveStoredAppCheckTokenInBackground(Ljava/util/concurrent/Executor;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 94
    new-instance v0, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    .line 95
    new-instance v1, Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultFirebaseAppCheck$gCmTEg2EEwlWSqGWH3vIOQ1SW0A;

    invoke-direct {v1, p0, v0}, Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultFirebaseAppCheck$gCmTEg2EEwlWSqGWH3vIOQ1SW0A;-><init>(Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    invoke-interface {p1, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 103
    invoke-virtual {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method private updateStoredToken(Lcom/google/firebase/appcheck/AppCheckToken;)V
    .locals 2

    .line 281
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->backgroundExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultFirebaseAppCheck$13M78FZpHaTlnWa_rQTodrYdaDE;

    invoke-direct {v1, p0, p1}, Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultFirebaseAppCheck$13M78FZpHaTlnWa_rQTodrYdaDE;-><init>(Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;Lcom/google/firebase/appcheck/AppCheckToken;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 282
    invoke-virtual {p0, p1}, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->setCachedToken(Lcom/google/firebase/appcheck/AppCheckToken;)V

    .line 284
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->tokenRefreshManager:Lcom/google/firebase/appcheck/internal/TokenRefreshManager;

    invoke-virtual {v0, p1}, Lcom/google/firebase/appcheck/internal/TokenRefreshManager;->maybeScheduleTokenRefresh(Lcom/google/firebase/appcheck/AppCheckToken;)V

    return-void
.end method


# virtual methods
.method public addAppCheckListener(Lcom/google/firebase/appcheck/FirebaseAppCheck$AppCheckListener;)V
    .locals 3

    .line 162
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckListenerList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 164
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->tokenRefreshManager:Lcom/google/firebase/appcheck/internal/TokenRefreshManager;

    iget-object v1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckTokenListenerList:Ljava/util/List;

    .line 165
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    iget-object v2, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckListenerList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/2addr v1, v2

    .line 164
    invoke-virtual {v0, v1}, Lcom/google/firebase/appcheck/internal/TokenRefreshManager;->onListenerCountChanged(I)V

    .line 167
    invoke-direct {p0}, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->hasValidToken()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 168
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->cachedToken:Lcom/google/firebase/appcheck/AppCheckToken;

    invoke-interface {p1, v0}, Lcom/google/firebase/appcheck/FirebaseAppCheck$AppCheckListener;->onAppCheckTokenChanged(Lcom/google/firebase/appcheck/AppCheckToken;)V

    :cond_0
    return-void
.end method

.method public addAppCheckTokenListener(Lcom/google/firebase/appcheck/interop/AppCheckTokenListener;)V
    .locals 3

    .line 141
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckTokenListenerList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 143
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->tokenRefreshManager:Lcom/google/firebase/appcheck/internal/TokenRefreshManager;

    iget-object v1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckTokenListenerList:Ljava/util/List;

    .line 144
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    iget-object v2, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckListenerList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/2addr v1, v2

    .line 143
    invoke-virtual {v0, v1}, Lcom/google/firebase/appcheck/internal/TokenRefreshManager;->onListenerCountChanged(I)V

    .line 146
    invoke-direct {p0}, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->hasValidToken()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 147
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->cachedToken:Lcom/google/firebase/appcheck/AppCheckToken;

    .line 148
    invoke-static {v0}, Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;->constructFromAppCheckToken(Lcom/google/firebase/appcheck/AppCheckToken;)Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;

    move-result-object v0

    .line 147
    invoke-interface {p1, v0}, Lcom/google/firebase/appcheck/interop/AppCheckTokenListener;->onAppCheckTokenChanged(Lcom/google/firebase/appcheck/AppCheckTokenResult;)V

    :cond_0
    return-void
.end method

.method fetchTokenFromProvider()Lcom/google/android/gms/tasks/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/firebase/appcheck/AppCheckToken;",
            ">;"
        }
    .end annotation

    .line 247
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckProvider:Lcom/google/firebase/appcheck/AppCheckProvider;

    .line 248
    invoke-interface {v0}, Lcom/google/firebase/appcheck/AppCheckProvider;->getToken()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    iget-object v1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->uiExecutor:Ljava/util/concurrent/Executor;

    new-instance v2, Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultFirebaseAppCheck$xHW6b2CTo0vbK3x-jePD6nlLDoc;

    invoke-direct {v2, p0}, Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultFirebaseAppCheck$xHW6b2CTo0vbK3x-jePD6nlLDoc;-><init>(Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;)V

    .line 249
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/tasks/Task;->onSuccessTask(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/SuccessContinuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method public getAppCheckToken(Z)Lcom/google/android/gms/tasks/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/firebase/appcheck/AppCheckToken;",
            ">;"
        }
    .end annotation

    .line 219
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->retrieveStoredTokenTask:Lcom/google/android/gms/tasks/Task;

    iget-object v1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->liteExecutor:Ljava/util/concurrent/Executor;

    new-instance v2, Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultFirebaseAppCheck$wUF2g9mXGI5mF9oSwE8b0KkXXrQ;

    invoke-direct {v2, p0, p1}, Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultFirebaseAppCheck$wUF2g9mXGI5mF9oSwE8b0KkXXrQ;-><init>(Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;Z)V

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/tasks/Task;->continueWithTask(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method getHeartbeatControllerProvider()Lcom/google/firebase/inject/Provider;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/firebase/inject/Provider<",
            "Lcom/google/firebase/heartbeatinfo/HeartBeatController;",
            ">;"
        }
    .end annotation

    .line 267
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->heartbeatControllerProvider:Lcom/google/firebase/inject/Provider;

    return-object v0
.end method

.method public getInstalledAppCheckProviderFactory()Lcom/google/firebase/appcheck/AppCheckProviderFactory;
    .locals 1

    .line 123
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckProviderFactory:Lcom/google/firebase/appcheck/AppCheckProviderFactory;

    return-object v0
.end method

.method public getLimitedUseAppCheckToken()Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/firebase/appcheck/AppCheckToken;",
            ">;"
        }
    .end annotation

    .line 235
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckProvider:Lcom/google/firebase/appcheck/AppCheckProvider;

    if-nez v0, :cond_0

    .line 236
    new-instance v0, Lcom/google/firebase/FirebaseException;

    const-string v1, "No AppCheckProvider installed."

    invoke-direct {v0, v1}, Lcom/google/firebase/FirebaseException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/google/android/gms/tasks/Tasks;->forException(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0

    .line 242
    :cond_0
    invoke-interface {v0}, Lcom/google/firebase/appcheck/AppCheckProvider;->getToken()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method public getToken(Z)Lcom/google/android/gms/tasks/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/firebase/appcheck/AppCheckTokenResult;",
            ">;"
        }
    .end annotation

    .line 183
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->retrieveStoredTokenTask:Lcom/google/android/gms/tasks/Task;

    iget-object v1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->liteExecutor:Ljava/util/concurrent/Executor;

    new-instance v2, Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultFirebaseAppCheck$Yl3vV7xrp4OHm50UExiDtNP1RgE;

    invoke-direct {v2, p0, p1}, Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultFirebaseAppCheck$Yl3vV7xrp4OHm50UExiDtNP1RgE;-><init>(Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;Z)V

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/tasks/Task;->continueWithTask(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public installAppCheckProviderFactory(Lcom/google/firebase/appcheck/AppCheckProviderFactory;)V
    .locals 1

    .line 108
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->firebaseApp:Lcom/google/firebase/FirebaseApp;

    invoke-virtual {v0}, Lcom/google/firebase/FirebaseApp;->isDataCollectionDefaultEnabled()Z

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->installAppCheckProviderFactory(Lcom/google/firebase/appcheck/AppCheckProviderFactory;Z)V

    return-void
.end method

.method public installAppCheckProviderFactory(Lcom/google/firebase/appcheck/AppCheckProviderFactory;Z)V
    .locals 1

    .line 114
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    iput-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckProviderFactory:Lcom/google/firebase/appcheck/AppCheckProviderFactory;

    .line 116
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->firebaseApp:Lcom/google/firebase/FirebaseApp;

    invoke-interface {p1, v0}, Lcom/google/firebase/appcheck/AppCheckProviderFactory;->create(Lcom/google/firebase/FirebaseApp;)Lcom/google/firebase/appcheck/AppCheckProvider;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckProvider:Lcom/google/firebase/appcheck/AppCheckProvider;

    .line 117
    iget-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->tokenRefreshManager:Lcom/google/firebase/appcheck/internal/TokenRefreshManager;

    invoke-virtual {p1, p2}, Lcom/google/firebase/appcheck/internal/TokenRefreshManager;->setIsAutoRefreshEnabled(Z)V

    return-void
.end method

.method public synthetic lambda$fetchTokenFromProvider$4$DefaultFirebaseAppCheck(Lcom/google/firebase/appcheck/AppCheckToken;)Lcom/google/android/gms/tasks/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 252
    invoke-direct {p0, p1}, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->updateStoredToken(Lcom/google/firebase/appcheck/AppCheckToken;)V

    .line 253
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckListenerList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/appcheck/FirebaseAppCheck$AppCheckListener;

    .line 254
    invoke-interface {v1, p1}, Lcom/google/firebase/appcheck/FirebaseAppCheck$AppCheckListener;->onAppCheckTokenChanged(Lcom/google/firebase/appcheck/AppCheckToken;)V

    goto :goto_0

    .line 257
    :cond_0
    invoke-static {p1}, Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;->constructFromAppCheckToken(Lcom/google/firebase/appcheck/AppCheckToken;)Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;

    move-result-object v0

    .line 258
    iget-object v1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckTokenListenerList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/firebase/appcheck/interop/AppCheckTokenListener;

    .line 259
    invoke-interface {v2, v0}, Lcom/google/firebase/appcheck/interop/AppCheckTokenListener;->onAppCheckTokenChanged(Lcom/google/firebase/appcheck/AppCheckTokenResult;)V

    goto :goto_1

    .line 261
    :cond_1
    invoke-static {p1}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public synthetic lambda$getAppCheckToken$3$DefaultFirebaseAppCheck(ZLcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    if-nez p1, :cond_0

    .line 222
    invoke-direct {p0}, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->hasValidToken()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 223
    iget-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->cachedToken:Lcom/google/firebase/appcheck/AppCheckToken;

    invoke-static {p1}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1

    .line 225
    :cond_0
    iget-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckProvider:Lcom/google/firebase/appcheck/AppCheckProvider;

    if-nez p1, :cond_1

    .line 226
    new-instance p1, Lcom/google/firebase/FirebaseException;

    const-string p2, "No AppCheckProvider installed."

    invoke-direct {p1, p2}, Lcom/google/firebase/FirebaseException;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Lcom/google/android/gms/tasks/Tasks;->forException(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1

    .line 228
    :cond_1
    invoke-virtual {p0}, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->fetchTokenFromProvider()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public synthetic lambda$getToken$2$DefaultFirebaseAppCheck(ZLcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    if-nez p1, :cond_0

    .line 186
    invoke-direct {p0}, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->hasValidToken()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 187
    iget-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->cachedToken:Lcom/google/firebase/appcheck/AppCheckToken;

    .line 188
    invoke-static {p1}, Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;->constructFromAppCheckToken(Lcom/google/firebase/appcheck/AppCheckToken;)Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;

    move-result-object p1

    .line 187
    invoke-static {p1}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1

    .line 190
    :cond_0
    iget-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckProvider:Lcom/google/firebase/appcheck/AppCheckProvider;

    if-nez p1, :cond_1

    .line 191
    new-instance p1, Lcom/google/firebase/FirebaseException;

    const-string p2, "No AppCheckProvider installed."

    invoke-direct {p1, p2}, Lcom/google/firebase/FirebaseException;-><init>(Ljava/lang/String;)V

    .line 192
    invoke-static {p1}, Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;->constructFromError(Lcom/google/firebase/FirebaseException;)Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;

    move-result-object p1

    .line 191
    invoke-static {p1}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1

    .line 196
    :cond_1
    invoke-virtual {p0}, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->fetchTokenFromProvider()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    iget-object p2, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->liteExecutor:Ljava/util/concurrent/Executor;

    sget-object v0, Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultFirebaseAppCheck$srRDamzXg9TR6IfQqGBQFT4vxxc;->INSTANCE:Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultFirebaseAppCheck$srRDamzXg9TR6IfQqGBQFT4vxxc;

    .line 197
    invoke-virtual {p1, p2, v0}, Lcom/google/android/gms/tasks/Task;->continueWithTask(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public synthetic lambda$retrieveStoredAppCheckTokenInBackground$0$DefaultFirebaseAppCheck(Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 1

    .line 97
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->storageHelper:Lcom/google/firebase/appcheck/internal/StorageHelper;

    invoke-virtual {v0}, Lcom/google/firebase/appcheck/internal/StorageHelper;->retrieveAppCheckToken()Lcom/google/firebase/appcheck/AppCheckToken;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 99
    invoke-virtual {p0, v0}, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->setCachedToken(Lcom/google/firebase/appcheck/AppCheckToken;)V

    :cond_0
    const/4 v0, 0x0

    .line 101
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    return-void
.end method

.method public synthetic lambda$updateStoredToken$5$DefaultFirebaseAppCheck(Lcom/google/firebase/appcheck/AppCheckToken;)V
    .locals 1

    .line 281
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->storageHelper:Lcom/google/firebase/appcheck/internal/StorageHelper;

    invoke-virtual {v0, p1}, Lcom/google/firebase/appcheck/internal/StorageHelper;->saveAppCheckToken(Lcom/google/firebase/appcheck/AppCheckToken;)V

    return-void
.end method

.method public removeAppCheckListener(Lcom/google/firebase/appcheck/FirebaseAppCheck$AppCheckListener;)V
    .locals 2

    .line 174
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckListenerList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 176
    iget-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->tokenRefreshManager:Lcom/google/firebase/appcheck/internal/TokenRefreshManager;

    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckTokenListenerList:Ljava/util/List;

    .line 177
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckListenerList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/2addr v0, v1

    .line 176
    invoke-virtual {p1, v0}, Lcom/google/firebase/appcheck/internal/TokenRefreshManager;->onListenerCountChanged(I)V

    return-void
.end method

.method public removeAppCheckTokenListener(Lcom/google/firebase/appcheck/interop/AppCheckTokenListener;)V
    .locals 2

    .line 154
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckTokenListenerList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 156
    iget-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->tokenRefreshManager:Lcom/google/firebase/appcheck/internal/TokenRefreshManager;

    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckTokenListenerList:Ljava/util/List;

    .line 157
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckListenerList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/2addr v0, v1

    .line 156
    invoke-virtual {p1, v0}, Lcom/google/firebase/appcheck/internal/TokenRefreshManager;->onListenerCountChanged(I)V

    return-void
.end method

.method public resetAppCheckState()V
    .locals 1

    const/4 v0, 0x0

    .line 133
    iput-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckProviderFactory:Lcom/google/firebase/appcheck/AppCheckProviderFactory;

    .line 134
    iput-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckProvider:Lcom/google/firebase/appcheck/AppCheckProvider;

    .line 135
    iput-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->cachedToken:Lcom/google/firebase/appcheck/AppCheckToken;

    .line 136
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->storageHelper:Lcom/google/firebase/appcheck/internal/StorageHelper;

    invoke-virtual {v0}, Lcom/google/firebase/appcheck/internal/StorageHelper;->clearSharedPrefs()V

    return-void
.end method

.method setCachedToken(Lcom/google/firebase/appcheck/AppCheckToken;)V
    .locals 0

    .line 273
    iput-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->cachedToken:Lcom/google/firebase/appcheck/AppCheckToken;

    return-void
.end method

.method public setTokenAutoRefreshEnabled(Z)V
    .locals 1

    .line 128
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->tokenRefreshManager:Lcom/google/firebase/appcheck/internal/TokenRefreshManager;

    invoke-virtual {v0, p1}, Lcom/google/firebase/appcheck/internal/TokenRefreshManager;->setIsAutoRefreshEnabled(Z)V

    return-void
.end method
