.class public Lcom/google/firebase/appcheck/internal/DefaultTokenRefresher;
.super Ljava/lang/Object;
.source "DefaultTokenRefresher.java"


# static fields
.field static final INITIAL_DELAY_SECONDS:J = 0x1eL

.field static final MAX_DELAY_SECONDS:J = 0x3c0L

.field private static final UNSET_DELAY:J = -0x1L


# instance fields
.field private volatile delayAfterFailureSeconds:J

.field private final firebaseAppCheck:Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;

.field private final liteExecutor:Ljava/util/concurrent/Executor;

.field private volatile refreshFuture:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture<",
            "*>;"
        }
    .end annotation
.end field

.field private final scheduledExecutorService:Ljava/util/concurrent/ScheduledExecutorService;


# direct methods
.method constructor <init>(Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;Ljava/util/concurrent/Executor;Ljava/util/concurrent/ScheduledExecutorService;)V
    .locals 0

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;

    iput-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultTokenRefresher;->firebaseAppCheck:Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;

    .line 51
    iput-object p2, p0, Lcom/google/firebase/appcheck/internal/DefaultTokenRefresher;->liteExecutor:Ljava/util/concurrent/Executor;

    .line 52
    iput-object p3, p0, Lcom/google/firebase/appcheck/internal/DefaultTokenRefresher;->scheduledExecutorService:Ljava/util/concurrent/ScheduledExecutorService;

    const-wide/16 p1, -0x1

    .line 53
    iput-wide p1, p0, Lcom/google/firebase/appcheck/internal/DefaultTokenRefresher;->delayAfterFailureSeconds:J

    return-void
.end method

.method private getNextRefreshMillis()J
    .locals 7

    .line 84
    iget-wide v0, p0, Lcom/google/firebase/appcheck/internal/DefaultTokenRefresher;->delayAfterFailureSeconds:J

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    const-wide/16 v0, 0x1e

    return-wide v0

    .line 86
    :cond_0
    iget-wide v0, p0, Lcom/google/firebase/appcheck/internal/DefaultTokenRefresher;->delayAfterFailureSeconds:J

    const-wide/16 v2, 0x2

    mul-long v0, v0, v2

    const-wide/16 v4, 0x3c0

    cmp-long v6, v0, v4

    if-gez v6, :cond_1

    .line 87
    iget-wide v0, p0, Lcom/google/firebase/appcheck/internal/DefaultTokenRefresher;->delayAfterFailureSeconds:J

    mul-long v0, v0, v2

    return-wide v0

    :cond_1
    return-wide v4
.end method

.method public static synthetic lambda$tO613SWa9ssGrQTmXkqV0rW94II(Lcom/google/firebase/appcheck/internal/DefaultTokenRefresher;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/firebase/appcheck/internal/DefaultTokenRefresher;->onRefresh()V

    return-void
.end method

.method private onRefresh()V
    .locals 3

    .line 94
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultTokenRefresher;->firebaseAppCheck:Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;

    .line 95
    invoke-virtual {v0}, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->fetchTokenFromProvider()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    iget-object v1, p0, Lcom/google/firebase/appcheck/internal/DefaultTokenRefresher;->liteExecutor:Ljava/util/concurrent/Executor;

    new-instance v2, Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultTokenRefresher$yY-3o43rG4qpE2IaFOaCAIx3ZBY;

    invoke-direct {v2, p0}, Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultTokenRefresher$yY-3o43rG4qpE2IaFOaCAIx3ZBY;-><init>(Lcom/google/firebase/appcheck/internal/DefaultTokenRefresher;)V

    .line 96
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/tasks/Task;->addOnFailureListener(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method private scheduleRefreshAfterFailure()V
    .locals 5

    .line 77
    invoke-virtual {p0}, Lcom/google/firebase/appcheck/internal/DefaultTokenRefresher;->cancel()V

    .line 78
    invoke-direct {p0}, Lcom/google/firebase/appcheck/internal/DefaultTokenRefresher;->getNextRefreshMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/firebase/appcheck/internal/DefaultTokenRefresher;->delayAfterFailureSeconds:J

    .line 79
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultTokenRefresher;->scheduledExecutorService:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v1, Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultTokenRefresher$tO613SWa9ssGrQTmXkqV0rW94II;

    invoke-direct {v1, p0}, Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultTokenRefresher$tO613SWa9ssGrQTmXkqV0rW94II;-><init>(Lcom/google/firebase/appcheck/internal/DefaultTokenRefresher;)V

    iget-wide v2, p0, Lcom/google/firebase/appcheck/internal/DefaultTokenRefresher;->delayAfterFailureSeconds:J

    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 80
    invoke-interface {v0, v1, v2, v3, v4}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultTokenRefresher;->refreshFuture:Ljava/util/concurrent/ScheduledFuture;

    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 2

    .line 101
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultTokenRefresher;->refreshFuture:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultTokenRefresher;->refreshFuture:Ljava/util/concurrent/ScheduledFuture;

    invoke-interface {v0}, Ljava/util/concurrent/ScheduledFuture;->isDone()Z

    move-result v0

    if-nez v0, :cond_0

    .line 102
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultTokenRefresher;->refreshFuture:Ljava/util/concurrent/ScheduledFuture;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    :cond_0
    return-void
.end method

.method public synthetic lambda$onRefresh$0$DefaultTokenRefresher(Ljava/lang/Exception;)V
    .locals 0

    .line 96
    invoke-direct {p0}, Lcom/google/firebase/appcheck/internal/DefaultTokenRefresher;->scheduleRefreshAfterFailure()V

    return-void
.end method

.method public scheduleRefresh(J)V
    .locals 4

    .line 64
    invoke-virtual {p0}, Lcom/google/firebase/appcheck/internal/DefaultTokenRefresher;->cancel()V

    const-wide/16 v0, -0x1

    .line 65
    iput-wide v0, p0, Lcom/google/firebase/appcheck/internal/DefaultTokenRefresher;->delayAfterFailureSeconds:J

    .line 66
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultTokenRefresher;->scheduledExecutorService:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v1, Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultTokenRefresher$tO613SWa9ssGrQTmXkqV0rW94II;

    invoke-direct {v1, p0}, Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultTokenRefresher$tO613SWa9ssGrQTmXkqV0rW94II;-><init>(Lcom/google/firebase/appcheck/internal/DefaultTokenRefresher;)V

    const-wide/16 v2, 0x0

    .line 68
    invoke-static {v2, v3, p1, p2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p1

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 67
    invoke-interface {v0, v1, p1, p2, v2}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultTokenRefresher;->refreshFuture:Ljava/util/concurrent/ScheduledFuture;

    return-void
.end method
