.class public final Lcom/facebook/appevents/internal/ActivityLifecycleTracker;
.super Ljava/lang/Object;
.source "ActivityLifecycleTracker.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000n\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0000\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0008\u0010\u001e\u001a\u00020\u001fH\u0002J\n\u0010 \u001a\u0004\u0018\u00010\rH\u0007J\n\u0010!\u001a\u0004\u0018\u00010\"H\u0007J\u0008\u0010#\u001a\u00020$H\u0007J\u0008\u0010%\u001a\u00020$H\u0007J\u0012\u0010&\u001a\u00020\u001f2\u0008\u0010\'\u001a\u0004\u0018\u00010\rH\u0007J\u0010\u0010(\u001a\u00020\u001f2\u0006\u0010\'\u001a\u00020\rH\u0002J\u0010\u0010)\u001a\u00020\u001f2\u0006\u0010\'\u001a\u00020\rH\u0002J\u0010\u0010*\u001a\u00020\u001f2\u0006\u0010\'\u001a\u00020\rH\u0007J\u001a\u0010+\u001a\u00020\u001f2\u0006\u0010,\u001a\u00020-2\u0008\u0010\n\u001a\u0004\u0018\u00010\u0004H\u0007R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0004X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\tX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\n\u001a\u0004\u0018\u00010\u0004X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0016\u0010\u000b\u001a\n\u0012\u0004\u0012\u00020\r\u0018\u00010\u000cX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u0006X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000f\u001a\u0008\u0012\u0002\u0008\u0003\u0018\u00010\u0010X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0001X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0012\u001a\u0004\u0018\u00010\u0013X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u0015X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0016\u001a\u00020\t8BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0017\u0010\u0018R\u0016\u0010\u0019\u001a\n \u001b*\u0004\u0018\u00010\u001a0\u001aX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001c\u001a\u00020\u001dX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006."
    }
    d2 = {
        "Lcom/facebook/appevents/internal/ActivityLifecycleTracker;",
        "",
        "()V",
        "INCORRECT_IMPL_WARNING",
        "",
        "INTERRUPTION_THRESHOLD_MILLISECONDS",
        "",
        "TAG",
        "activityReferences",
        "",
        "appId",
        "currActivity",
        "Ljava/lang/ref/WeakReference;",
        "Landroid/app/Activity;",
        "currentActivityAppearTime",
        "currentFuture",
        "Ljava/util/concurrent/ScheduledFuture;",
        "currentFutureLock",
        "currentSession",
        "Lcom/facebook/appevents/internal/SessionInfo;",
        "foregroundActivityCount",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "sessionTimeoutInSeconds",
        "getSessionTimeoutInSeconds",
        "()I",
        "singleThreadExecutor",
        "Ljava/util/concurrent/ScheduledExecutorService;",
        "kotlin.jvm.PlatformType",
        "tracking",
        "Ljava/util/concurrent/atomic/AtomicBoolean;",
        "cancelCurrentTask",
        "",
        "getCurrentActivity",
        "getCurrentSessionGuid",
        "Ljava/util/UUID;",
        "isInBackground",
        "",
        "isTracking",
        "onActivityCreated",
        "activity",
        "onActivityDestroyed",
        "onActivityPaused",
        "onActivityResumed",
        "startTracking",
        "application",
        "Landroid/app/Application;",
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
.field private static final INCORRECT_IMPL_WARNING:Ljava/lang/String; = "Unexpected activity pause without a matching activity resume. Logging data may be incorrect. Make sure you call activateApp from your Application\'s onCreate method"

.field public static final INSTANCE:Lcom/facebook/appevents/internal/ActivityLifecycleTracker;

.field private static final INTERRUPTION_THRESHOLD_MILLISECONDS:J = 0x3e8L

.field private static final TAG:Ljava/lang/String;

.field private static activityReferences:I

.field private static appId:Ljava/lang/String;

.field private static currActivity:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private static currentActivityAppearTime:J

.field private static volatile currentFuture:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture<",
            "*>;"
        }
    .end annotation
.end field

.field private static final currentFutureLock:Ljava/lang/Object;

.field private static volatile currentSession:Lcom/facebook/appevents/internal/SessionInfo;

.field private static final foregroundActivityCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field private static final singleThreadExecutor:Ljava/util/concurrent/ScheduledExecutorService;

.field private static final tracking:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 53
    new-instance v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;

    invoke-direct {v0}, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;-><init>()V

    sput-object v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->INSTANCE:Lcom/facebook/appevents/internal/ActivityLifecycleTracker;

    .line 55
    const-class v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;

    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "com.facebook.appevents.internal.ActivityLifecycleTracker"

    .line 56
    :goto_0
    sput-object v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->TAG:Ljava/lang/String;

    .line 62
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    sput-object v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->singleThreadExecutor:Ljava/util/concurrent/ScheduledExecutorService;

    .line 65
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->currentFutureLock:Ljava/lang/Object;

    .line 66
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->foregroundActivityCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 70
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    sput-object v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->tracking:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final synthetic access$getActivityReferences$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;)I
    .locals 0

    .line 53
    sget p0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->activityReferences:I

    return p0
.end method

.method public static final synthetic access$getAppId$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;)Ljava/lang/String;
    .locals 0

    .line 53
    sget-object p0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->appId:Ljava/lang/String;

    return-object p0
.end method

.method public static final synthetic access$getCurrentActivityAppearTime$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;)J
    .locals 2

    .line 53
    sget-wide v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->currentActivityAppearTime:J

    return-wide v0
.end method

.method public static final synthetic access$getCurrentFuture$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;)Ljava/util/concurrent/ScheduledFuture;
    .locals 0

    .line 53
    sget-object p0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->currentFuture:Ljava/util/concurrent/ScheduledFuture;

    return-object p0
.end method

.method public static final synthetic access$getCurrentFutureLock$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;)Ljava/lang/Object;
    .locals 0

    .line 53
    sget-object p0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->currentFutureLock:Ljava/lang/Object;

    return-object p0
.end method

.method public static final synthetic access$getCurrentSession$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;)Lcom/facebook/appevents/internal/SessionInfo;
    .locals 0

    .line 53
    sget-object p0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->currentSession:Lcom/facebook/appevents/internal/SessionInfo;

    return-object p0
.end method

.method public static final synthetic access$getForegroundActivityCount$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;)Ljava/util/concurrent/atomic/AtomicInteger;
    .locals 0

    .line 53
    sget-object p0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->foregroundActivityCount:Ljava/util/concurrent/atomic/AtomicInteger;

    return-object p0
.end method

.method public static final synthetic access$getSessionTimeoutInSeconds$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;)I
    .locals 0

    .line 53
    invoke-direct {p0}, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->getSessionTimeoutInSeconds()I

    move-result p0

    return p0
.end method

.method public static final synthetic access$getSingleThreadExecutor$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;)Ljava/util/concurrent/ScheduledExecutorService;
    .locals 0

    .line 53
    sget-object p0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->singleThreadExecutor:Ljava/util/concurrent/ScheduledExecutorService;

    return-object p0
.end method

.method public static final synthetic access$getTAG$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;)Ljava/lang/String;
    .locals 0

    .line 53
    sget-object p0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->TAG:Ljava/lang/String;

    return-object p0
.end method

.method public static final synthetic access$onActivityDestroyed(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;Landroid/app/Activity;)V
    .locals 0

    .line 53
    invoke-direct {p0, p1}, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->onActivityDestroyed(Landroid/app/Activity;)V

    return-void
.end method

.method public static final synthetic access$onActivityPaused(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;Landroid/app/Activity;)V
    .locals 0

    .line 53
    invoke-direct {p0, p1}, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->onActivityPaused(Landroid/app/Activity;)V

    return-void
.end method

.method public static final synthetic access$setActivityReferences$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;I)V
    .locals 0

    .line 53
    sput p1, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->activityReferences:I

    return-void
.end method

.method public static final synthetic access$setAppId$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;Ljava/lang/String;)V
    .locals 0

    .line 53
    sput-object p1, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->appId:Ljava/lang/String;

    return-void
.end method

.method public static final synthetic access$setCurrentActivityAppearTime$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;J)V
    .locals 0

    .line 53
    sput-wide p1, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->currentActivityAppearTime:J

    return-void
.end method

.method public static final synthetic access$setCurrentFuture$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;Ljava/util/concurrent/ScheduledFuture;)V
    .locals 0

    .line 53
    sput-object p1, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->currentFuture:Ljava/util/concurrent/ScheduledFuture;

    return-void
.end method

.method public static final synthetic access$setCurrentSession$p(Lcom/facebook/appevents/internal/ActivityLifecycleTracker;Lcom/facebook/appevents/internal/SessionInfo;)V
    .locals 0

    .line 53
    sput-object p1, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->currentSession:Lcom/facebook/appevents/internal/SessionInfo;

    return-void
.end method

.method private final cancelCurrentTask()V
    .locals 3

    .line 256
    sget-object v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->currentFutureLock:Ljava/lang/Object;

    monitor-enter v0

    .line 257
    :try_start_0
    sget-object v1, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->currentFuture:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v1, :cond_0

    .line 258
    sget-object v1, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->currentFuture:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v1, :cond_0

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    :cond_0
    const/4 v1, 0x0

    .line 260
    check-cast v1, Ljava/util/concurrent/ScheduledFuture;

    sput-object v1, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->currentFuture:Ljava/util/concurrent/ScheduledFuture;

    .line 261
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 256
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static final getCurrentActivity()Landroid/app/Activity;
    .locals 2
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 266
    sget-object v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->currActivity:Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Landroid/app/Activity;

    :cond_0
    return-object v1
.end method

.method public static final getCurrentSessionGuid()Ljava/util/UUID;
    .locals 2
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 144
    sget-object v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->currentSession:Lcom/facebook/appevents/internal/SessionInfo;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->currentSession:Lcom/facebook/appevents/internal/SessionInfo;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/facebook/appevents/internal/SessionInfo;->getSessionId()Ljava/util/UUID;

    move-result-object v1

    :cond_0
    return-object v1
.end method

.method private final getSessionTimeoutInSeconds()I
    .locals 1

    .line 250
    invoke-static {}, Lcom/facebook/FacebookSdk;->getApplicationId()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/internal/FetchedAppSettingsManager;->getAppSettingsWithoutQuery(Ljava/lang/String;)Lcom/facebook/internal/FetchedAppSettings;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 252
    invoke-virtual {v0}, Lcom/facebook/internal/FetchedAppSettings;->getSessionTimeoutInSeconds()I

    move-result v0

    return v0

    .line 251
    :cond_0
    invoke-static {}, Lcom/facebook/appevents/internal/Constants;->getDefaultAppEventsSessionTimeoutInSeconds()I

    move-result v0

    return v0
.end method

.method public static final isInBackground()Z
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 134
    sget v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->activityReferences:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static final isTracking()Z
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 139
    sget-object v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->tracking:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method public static final onActivityCreated(Landroid/app/Activity;)V
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 150
    sget-object p0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->singleThreadExecutor:Ljava/util/concurrent/ScheduledExecutorService;

    sget-object v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker$onActivityCreated$1;->INSTANCE:Lcom/facebook/appevents/internal/ActivityLifecycleTracker$onActivityCreated$1;

    check-cast v0, Ljava/lang/Runnable;

    invoke-interface {p0, v0}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method private final onActivityDestroyed(Landroid/app/Activity;)V
    .locals 0

    .line 244
    invoke-static {p1}, Lcom/facebook/appevents/codeless/CodelessManager;->onActivityDestroyed(Landroid/app/Activity;)V

    return-void
.end method

.method private final onActivityPaused(Landroid/app/Activity;)V
    .locals 3

    .line 195
    sget-object v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->foregroundActivityCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v0

    if-gez v0, :cond_0

    .line 199
    sget-object v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->foregroundActivityCount:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 200
    sget-object v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->TAG:Ljava/lang/String;

    const-string v1, "Unexpected activity pause without a matching activity resume. Logging data may be incorrect. Make sure you call activateApp from your Application\'s onCreate method"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 202
    :cond_0
    invoke-direct {p0}, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->cancelCurrentTask()V

    .line 203
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 204
    move-object v2, p1

    check-cast v2, Landroid/content/Context;

    invoke-static {v2}, Lcom/facebook/internal/Utility;->getActivityName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    .line 205
    invoke-static {p1}, Lcom/facebook/appevents/codeless/CodelessManager;->onActivityPaused(Landroid/app/Activity;)V

    .line 206
    new-instance p1, Lcom/facebook/appevents/internal/ActivityLifecycleTracker$onActivityPaused$handleActivityPaused$1;

    invoke-direct {p1, v0, v1, v2}, Lcom/facebook/appevents/internal/ActivityLifecycleTracker$onActivityPaused$handleActivityPaused$1;-><init>(JLjava/lang/String;)V

    check-cast p1, Ljava/lang/Runnable;

    .line 240
    sget-object v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->singleThreadExecutor:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static final onActivityResumed(Landroid/app/Activity;)V
    .locals 4
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "activity"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 160
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->currActivity:Ljava/lang/ref/WeakReference;

    .line 161
    sget-object v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->foregroundActivityCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 162
    sget-object v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->INSTANCE:Lcom/facebook/appevents/internal/ActivityLifecycleTracker;

    invoke-direct {v0}, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->cancelCurrentTask()V

    .line 163
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 164
    sput-wide v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->currentActivityAppearTime:J

    .line 165
    move-object v2, p0

    check-cast v2, Landroid/content/Context;

    invoke-static {v2}, Lcom/facebook/internal/Utility;->getActivityName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    .line 166
    invoke-static {p0}, Lcom/facebook/appevents/codeless/CodelessManager;->onActivityResumed(Landroid/app/Activity;)V

    .line 167
    invoke-static {p0}, Lcom/facebook/appevents/aam/MetadataIndexer;->onActivityResumed(Landroid/app/Activity;)V

    .line 168
    invoke-static {p0}, Lcom/facebook/appevents/suggestedevents/SuggestedEventsManager;->trackActivity(Landroid/app/Activity;)V

    .line 169
    invoke-static {}, Lcom/facebook/appevents/iap/InAppPurchaseManager;->startTracking()V

    .line 170
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    .line 171
    new-instance v3, Lcom/facebook/appevents/internal/ActivityLifecycleTracker$onActivityResumed$handleActivityResume$1;

    invoke-direct {v3, v0, v1, v2, p0}, Lcom/facebook/appevents/internal/ActivityLifecycleTracker$onActivityResumed$handleActivityResume$1;-><init>(JLjava/lang/String;Landroid/content/Context;)V

    check-cast v3, Ljava/lang/Runnable;

    .line 191
    sget-object p0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->singleThreadExecutor:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {p0, v3}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static final startTracking(Landroid/app/Application;Ljava/lang/String;)V
    .locals 3
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "application"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 78
    sget-object v0, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->tracking:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 81
    :cond_0
    sget-object v0, Lcom/facebook/internal/FeatureManager$Feature;->CodelessEvents:Lcom/facebook/internal/FeatureManager$Feature;

    sget-object v1, Lcom/facebook/appevents/internal/ActivityLifecycleTracker$startTracking$1;->INSTANCE:Lcom/facebook/appevents/internal/ActivityLifecycleTracker$startTracking$1;

    check-cast v1, Lcom/facebook/internal/FeatureManager$Callback;

    invoke-static {v0, v1}, Lcom/facebook/internal/FeatureManager;->checkFeature(Lcom/facebook/internal/FeatureManager$Feature;Lcom/facebook/internal/FeatureManager$Callback;)V

    .line 88
    sput-object p1, Lcom/facebook/appevents/internal/ActivityLifecycleTracker;->appId:Ljava/lang/String;

    .line 90
    new-instance p1, Lcom/facebook/appevents/internal/ActivityLifecycleTracker$startTracking$2;

    invoke-direct {p1}, Lcom/facebook/appevents/internal/ActivityLifecycleTracker$startTracking$2;-><init>()V

    check-cast p1, Landroid/app/Application$ActivityLifecycleCallbacks;

    .line 89
    invoke-virtual {p0, p1}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    return-void
.end method
