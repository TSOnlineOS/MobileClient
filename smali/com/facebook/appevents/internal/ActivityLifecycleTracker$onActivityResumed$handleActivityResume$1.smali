.class final Lcom/facebook/appevents/internal/ActivityLifecycleTracker$onActivityResumed$handleActivityResume$1;
.super Ljava/lang/Object;
.source "ActivityLifecycleTracker.kt"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->onActivityResumed(Landroid/app/Activity;)V
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

.field final synthetic $appContext:Landroid/content/Context;

.field final synthetic $currentTime:J


# direct methods
.method constructor <init>(JLjava/lang/String;Landroid/content/Context;)V
    .locals 0

    iput-wide p1, p0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker$onActivityResumed$handleActivityResume$1;->$currentTime:J

    iput-object p3, p0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker$onActivityResumed$handleActivityResume$1;->$activityName:Ljava/lang/String;

    iput-object p4, p0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker$onActivityResumed$handleActivityResume$1;->$appContext:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 10

    invoke-static {p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-static {p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v0, :cond_1

    return-void

    .line 172
    :cond_1
    :try_start_1
    sget-object v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->INSTANCE:Lcom/facebook/appevents/internal/ActivityLifecycleTracker;

    invoke-static {v0}, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->access$getCurrentSession$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;)Lcom/facebook/appevents/internal/SessionInfo;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/facebook/appevents/internal/SessionInfo;->getSessionLastEventTime()Ljava/lang/Long;

    move-result-object v0

    goto :goto_0

    :cond_2
    move-object v0, v1

    .line 173
    :goto_0
    sget-object v2, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->INSTANCE:Lcom/facebook/appevents/internal/ActivityLifecycleTracker;

    invoke-static {v2}, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->access$getCurrentSession$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;)Lcom/facebook/appevents/internal/SessionInfo;

    move-result-object v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const-string v3, "appContext"

    if-nez v2, :cond_3

    .line 174
    :try_start_2
    sget-object v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->INSTANCE:Lcom/facebook/appevents/internal/ActivityLifecycleTracker;

    new-instance v2, Lcom/facebook/appevents/internal/SessionInfo;

    iget-wide v4, p0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker$onActivityResumed$handleActivityResume$1;->$currentTime:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x4

    const/4 v9, 0x0

    move-object v4, v2

    invoke-direct/range {v4 .. v9}, Lcom/facebook/appevents/internal/SessionInfo;-><init>(Ljava/lang/Long;Ljava/lang/Long;Ljava/util/UUID;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-static {v0, v2}, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->access$setCurrentSession$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;Lcom/facebook/appevents/internal/SessionInfo;)V

    .line 175
    iget-object v0, p0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker$onActivityResumed$handleActivityResume$1;->$activityName:Ljava/lang/String;

    sget-object v2, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->INSTANCE:Lcom/facebook/appevents/internal/ActivityLifecycleTracker;

    invoke-static {v2}, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->access$getAppId$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;)Ljava/lang/String;

    move-result-object v2

    iget-object v4, p0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker$onActivityResumed$handleActivityResume$1;->$appContext:Landroid/content/Context;

    invoke-static {v4, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v0, v1, v2, v4}, Lcom/facebook/appevents/internal/SessionLogger;->logActivateApp(Ljava/lang/String;Lcom/facebook/appevents/internal/SourceApplicationInfo;Ljava/lang/String;Landroid/content/Context;)V

    goto :goto_1

    :cond_3
    if-eqz v0, :cond_5

    .line 177
    iget-wide v4, p0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker$onActivityResumed$handleActivityResume$1;->$currentTime:J

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    sub-long/2addr v4, v6

    .line 178
    sget-object v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->INSTANCE:Lcom/facebook/appevents/internal/ActivityLifecycleTracker;

    invoke-static {v0}, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->access$getSessionTimeoutInSeconds$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;)I

    move-result v0

    mul-int/lit16 v0, v0, 0x3e8

    int-to-long v6, v0

    cmp-long v0, v4, v6

    if-lez v0, :cond_4

    .line 181
    iget-object v0, p0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker$onActivityResumed$handleActivityResume$1;->$activityName:Ljava/lang/String;

    sget-object v2, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->INSTANCE:Lcom/facebook/appevents/internal/ActivityLifecycleTracker;

    invoke-static {v2}, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->access$getCurrentSession$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;)Lcom/facebook/appevents/internal/SessionInfo;

    move-result-object v2

    sget-object v4, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->INSTANCE:Lcom/facebook/appevents/internal/ActivityLifecycleTracker;

    invoke-static {v4}, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->access$getAppId$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v2, v4}, Lcom/facebook/appevents/internal/SessionLogger;->logDeactivateApp(Ljava/lang/String;Lcom/facebook/appevents/internal/SessionInfo;Ljava/lang/String;)V

    .line 182
    iget-object v0, p0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker$onActivityResumed$handleActivityResume$1;->$activityName:Ljava/lang/String;

    sget-object v2, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->INSTANCE:Lcom/facebook/appevents/internal/ActivityLifecycleTracker;

    invoke-static {v2}, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->access$getAppId$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;)Ljava/lang/String;

    move-result-object v2

    iget-object v4, p0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker$onActivityResumed$handleActivityResume$1;->$appContext:Landroid/content/Context;

    invoke-static {v4, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v0, v1, v2, v4}, Lcom/facebook/appevents/internal/SessionLogger;->logActivateApp(Ljava/lang/String;Lcom/facebook/appevents/internal/SourceApplicationInfo;Ljava/lang/String;Landroid/content/Context;)V

    .line 183
    sget-object v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->INSTANCE:Lcom/facebook/appevents/internal/ActivityLifecycleTracker;

    new-instance v7, Lcom/facebook/appevents/internal/SessionInfo;

    iget-wide v1, p0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker$onActivityResumed$handleActivityResume$1;->$currentTime:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x4

    const/4 v6, 0x0

    move-object v1, v7

    invoke-direct/range {v1 .. v6}, Lcom/facebook/appevents/internal/SessionInfo;-><init>(Ljava/lang/Long;Ljava/lang/Long;Ljava/util/UUID;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-static {v0, v7}, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->access$setCurrentSession$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;Lcom/facebook/appevents/internal/SessionInfo;)V

    goto :goto_1

    :cond_4
    const-wide/16 v0, 0x3e8

    cmp-long v2, v4, v0

    if-lez v2, :cond_5

    .line 185
    sget-object v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->INSTANCE:Lcom/facebook/appevents/internal/ActivityLifecycleTracker;

    invoke-static {v0}, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->access$getCurrentSession$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;)Lcom/facebook/appevents/internal/SessionInfo;

    move-result-object v0

    if-eqz v0, :cond_5

    invoke-virtual {v0}, Lcom/facebook/appevents/internal/SessionInfo;->incrementInterruptionCount()V

    .line 188
    :cond_5
    :goto_1
    sget-object v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->INSTANCE:Lcom/facebook/appevents/internal/ActivityLifecycleTracker;

    invoke-static {v0}, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->access$getCurrentSession$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;)Lcom/facebook/appevents/internal/SessionInfo;

    move-result-object v0

    if-eqz v0, :cond_6

    iget-wide v1, p0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker$onActivityResumed$handleActivityResume$1;->$currentTime:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/facebook/appevents/internal/SessionInfo;->setSessionLastEventTime(Ljava/lang/Long;)V

    .line 189
    :cond_6
    sget-object v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->INSTANCE:Lcom/facebook/appevents/internal/ActivityLifecycleTracker;

    invoke-static {v0}, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->access$getCurrentSession$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;)Lcom/facebook/appevents/internal/SessionInfo;

    move-result-object v0

    if-eqz v0, :cond_7

    invoke-virtual {v0}, Lcom/facebook/appevents/internal/SessionInfo;->writeSessionToDisk()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_7
    return-void

    :catchall_0
    move-exception v0

    .line 190
    :try_start_3
    invoke-static {v0, p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    return-void

    :catchall_1
    move-exception v0

    invoke-static {v0, p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-void
.end method
