.class final Lcom/facebook/appevents/internal/ActivityLifecycleTracker$onActivityPaused$handleActivityPaused$1;
.super Ljava/lang/Object;
.source "ActivityLifecycleTracker.kt"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->onActivityPaused(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
        "run"
    }
    k = 0x3
    mv = {
        0x1,
        0x5,
        0x1
    }
.end annotation


# instance fields
.field final synthetic $activityName:Ljava/lang/String;

.field final synthetic $currentTime:J


# direct methods
.method constructor <init>(JLjava/lang/String;)V
    .locals 0

    iput-wide p1, p0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker$onActivityPaused$handleActivityPaused$1;->$currentTime:J

    iput-object p3, p0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker$onActivityPaused$handleActivityPaused$1;->$activityName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 8

    invoke-static {p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-static {p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    if-eqz v0, :cond_1

    return-void

    .line 207
    :cond_1
    :try_start_1
    sget-object v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->INSTANCE:Lcom/facebook/appevents/internal/ActivityLifecycleTracker;

    invoke-static {v0}, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->access$getCurrentSession$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;)Lcom/facebook/appevents/internal/SessionInfo;

    move-result-object v0

    if-nez v0, :cond_2

    .line 210
    sget-object v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->INSTANCE:Lcom/facebook/appevents/internal/ActivityLifecycleTracker;

    new-instance v7, Lcom/facebook/appevents/internal/SessionInfo;

    iget-wide v1, p0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker$onActivityPaused$handleActivityPaused$1;->$currentTime:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x4

    const/4 v6, 0x0

    move-object v1, v7

    invoke-direct/range {v1 .. v6}, Lcom/facebook/appevents/internal/SessionInfo;-><init>(Ljava/lang/Long;Ljava/lang/Long;Ljava/util/UUID;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-static {v0, v7}, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->access$setCurrentSession$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;Lcom/facebook/appevents/internal/SessionInfo;)V

    .line 212
    :cond_2
    sget-object v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->INSTANCE:Lcom/facebook/appevents/internal/ActivityLifecycleTracker;

    invoke-static {v0}, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->access$getCurrentSession$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;)Lcom/facebook/appevents/internal/SessionInfo;

    move-result-object v0

    if-eqz v0, :cond_3

    iget-wide v1, p0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker$onActivityPaused$handleActivityPaused$1;->$currentTime:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/facebook/appevents/internal/SessionInfo;->setSessionLastEventTime(Ljava/lang/Long;)V

    .line 213
    :cond_3
    sget-object v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->INSTANCE:Lcom/facebook/appevents/internal/ActivityLifecycleTracker;

    invoke-static {v0}, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->access$getForegroundActivityCount$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-gtz v0, :cond_4

    .line 217
    new-instance v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker$onActivityPaused$handleActivityPaused$1$task$1;

    invoke-direct {v0, p0}, Lcom/facebook/appevents/internal/ActivityLifecycleTracker$onActivityPaused$handleActivityPaused$1$task$1;-><init>(Lcom/facebook/appevents/internal/ActivityLifecycleTracker$onActivityPaused$handleActivityPaused$1;)V

    check-cast v0, Ljava/lang/Runnable;

    .line 228
    sget-object v1, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->INSTANCE:Lcom/facebook/appevents/internal/ActivityLifecycleTracker;

    invoke-static {v1}, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->access$getCurrentFutureLock$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 230
    :try_start_2
    sget-object v2, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->INSTANCE:Lcom/facebook/appevents/internal/ActivityLifecycleTracker;

    sget-object v3, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->INSTANCE:Lcom/facebook/appevents/internal/ActivityLifecycleTracker;

    invoke-static {v3}, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->access$getSingleThreadExecutor$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v3

    .line 231
    sget-object v4, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->INSTANCE:Lcom/facebook/appevents/internal/ActivityLifecycleTracker;

    invoke-static {v4}, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->access$getSessionTimeoutInSeconds$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;)I

    move-result v4

    int-to-long v4, v4

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 230
    invoke-interface {v3, v0, v4, v5, v6}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->access$setCurrentFuture$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;Ljava/util/concurrent/ScheduledFuture;)V

    .line 232
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 228
    :try_start_3
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    .line 234
    :cond_4
    :goto_0
    sget-object v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->INSTANCE:Lcom/facebook/appevents/internal/ActivityLifecycleTracker;

    invoke-static {v0}, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->access$getCurrentActivityAppearTime$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_5

    .line 236
    iget-wide v2, p0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker$onActivityPaused$handleActivityPaused$1;->$currentTime:J

    sub-long/2addr v2, v0

    const/16 v0, 0x3e8

    int-to-long v0, v0

    div-long/2addr v2, v0

    .line 237
    :cond_5
    iget-object v0, p0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker$onActivityPaused$handleActivityPaused$1;->$activityName:Ljava/lang/String;

    invoke-static {v0, v2, v3}, Lcom/facebook/appevents/internal/AutomaticAnalyticsLogger;->logActivityTimeSpentEvent(Ljava/lang/String;J)V

    .line 238
    sget-object v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->INSTANCE:Lcom/facebook/appevents/internal/ActivityLifecycleTracker;

    invoke-static {v0}, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->access$getCurrentSession$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;)Lcom/facebook/appevents/internal/SessionInfo;

    move-result-object v0

    if-eqz v0, :cond_6

    invoke-virtual {v0}, Lcom/facebook/appevents/internal/SessionInfo;->writeSessionToDisk()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :cond_6
    return-void

    :catchall_1
    move-exception v0

    .line 239
    :try_start_4
    invoke-static {v0, p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    return-void

    :catchall_2
    move-exception v0

    invoke-static {v0, p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-void
.end method
