.class public final Lcom/appsflyer/internal/p;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/appsflyer/internal/p$a;,
        Lcom/appsflyer/internal/p$b;
    }
.end annotation


# static fields
.field public static ˏ:Lcom/appsflyer/internal/p;


# instance fields
.field ˊ:Z

.field ˋ:Z

.field public ॱ:Lcom/appsflyer/internal/p$b;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 52
    iput-boolean v0, p0, Lcom/appsflyer/internal/p;->ˊ:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/appsflyer/internal/p;->ˋ:Z

    const/4 v0, 0x0

    .line 53
    iput-object v0, p0, Lcom/appsflyer/internal/p;->ॱ:Lcom/appsflyer/internal/p$b;

    return-void
.end method


# virtual methods
.method public final onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    .line 156
    invoke-static {}, Lcom/appsflyer/AFDeepLinkManager;->getInstance()Lcom/appsflyer/AFDeepLinkManager;

    move-result-object p2

    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/appsflyer/AFDeepLinkManager;->collectIntentsFromActivities(Landroid/content/Intent;)V

    return-void
.end method

.method public final onActivityDestroyed(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method

.method public final onActivityPaused(Landroid/app/Activity;)V
    .locals 2

    const/4 v0, 0x1

    .line 139
    iput-boolean v0, p0, Lcom/appsflyer/internal/p;->ˋ:Z

    .line 140
    new-instance v0, Lcom/appsflyer/internal/p$a;

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, p0, v1}, Lcom/appsflyer/internal/p$a;-><init>(Lcom/appsflyer/internal/p;Ljava/lang/ref/WeakReference;)V

    .line 142
    invoke-static {}, Lcom/appsflyer/AFExecutor;->getInstance()Lcom/appsflyer/AFExecutor;

    move-result-object p1

    invoke-virtual {p1}, Lcom/appsflyer/AFExecutor;->getThreadPoolExecutor()Ljava/util/concurrent/Executor;

    move-result-object p1

    const/4 v1, 0x0

    :try_start_0
    new-array v1, v1, [Ljava/lang/Void;

    .line 146
    invoke-virtual {v0, p1, v1}, Lcom/appsflyer/internal/p$a;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    const-string v0, "backgroundTask.executeOnExecutor failed with Exception"

    .line 150
    invoke-static {v0, p1}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void

    :catch_0
    move-exception p1

    const-string v0, "backgroundTask.executeOnExecutor failed with RejectedExecutionException Exception"

    .line 148
    invoke-static {v0, p1}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public final onActivityResumed(Landroid/app/Activity;)V
    .locals 2

    const/4 v0, 0x0

    .line 124
    iput-boolean v0, p0, Lcom/appsflyer/internal/p;->ˋ:Z

    .line 125
    iget-boolean v0, p0, Lcom/appsflyer/internal/p;->ˊ:Z

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    .line 126
    iput-boolean v1, p0, Lcom/appsflyer/internal/p;->ˊ:Z

    if-eqz v0, :cond_0

    .line 130
    :try_start_0
    iget-object v0, p0, Lcom/appsflyer/internal/p;->ॱ:Lcom/appsflyer/internal/p$b;

    invoke-interface {v0, p1}, Lcom/appsflyer/internal/p$b;->ˋ(Landroid/app/Activity;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    const-string v0, "Listener threw exception! "

    .line 132
    invoke-static {v0, p1}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public final onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method public final onActivityStarted(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method

.method public final onActivityStopped(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method
