.class Lcom/facebook/login/LoginLogger$1;
.super Ljava/lang/Object;
.source "LoginLogger.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/login/LoginLogger;->logHeartbeatEvent(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/login/LoginLogger;

.field final synthetic val$bundle:Landroid/os/Bundle;


# direct methods
.method constructor <init>(Lcom/facebook/login/LoginLogger;Landroid/os/Bundle;)V
    .locals 0

    .line 214
    iput-object p1, p0, Lcom/facebook/login/LoginLogger$1;->this$0:Lcom/facebook/login/LoginLogger;

    iput-object p2, p0, Lcom/facebook/login/LoginLogger$1;->val$bundle:Landroid/os/Bundle;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    invoke-static {p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 216
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/facebook/login/LoginLogger$1;->this$0:Lcom/facebook/login/LoginLogger;

    invoke-static {v0}, Lcom/facebook/login/LoginLogger;->access$000(Lcom/facebook/login/LoginLogger;)Lcom/facebook/appevents/InternalAppEventsLogger;

    move-result-object v0

    const-string v1, "fb_mobile_login_heartbeat"

    iget-object v2, p0, Lcom/facebook/login/LoginLogger$1;->val$bundle:Landroid/os/Bundle;

    invoke-virtual {v0, v1, v2}, Lcom/facebook/appevents/InternalAppEventsLogger;->logEventImplicitly(Ljava/lang/String;Landroid/os/Bundle;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 217
    invoke-static {v0, p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-void
.end method
