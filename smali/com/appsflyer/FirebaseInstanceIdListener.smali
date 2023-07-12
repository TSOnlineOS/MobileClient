.class public Lcom/appsflyer/FirebaseInstanceIdListener;
.super Lcom/google/firebase/iid/FirebaseInstanceIdService;
.source ""


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Lcom/google/firebase/iid/FirebaseInstanceIdService;-><init>()V

    return-void
.end method


# virtual methods
.method public onTokenRefresh()V
    .locals 5

    .line 14
    invoke-super {p0}, Lcom/google/firebase/iid/FirebaseInstanceIdService;->onTokenRefresh()V

    const-string v0, "FirebaseInstanceIdService is deprecated in firebase-messaging:v17.1.0 ."

    .line 16
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    const-string v0, "When using v17.1.0 or newer, please use com.appsflyer.FirebaseMessagingServiceListener instead of FirebaseInstanceIdListener"

    .line 17
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 20
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 23
    :try_start_0
    invoke-static {}, Lcom/google/firebase/iid/FirebaseInstanceId;->getInstance()Lcom/google/firebase/iid/FirebaseInstanceId;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/firebase/iid/FirebaseInstanceId;->getToken()Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v2

    const-string v3, "Error registering for uninstall tracking"

    .line 25
    invoke-static {v3, v2}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v2, 0x0

    :goto_0
    if-eqz v2, :cond_0

    .line 29
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "Firebase Refreshed Token = "

    invoke-virtual {v4, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 30
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v3

    const-string v4, "afUninstallToken"

    invoke-virtual {v3, v4}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 31
    invoke-static {v3}, Lcom/appsflyer/internal/b$b$a;->ˎ(Ljava/lang/String;)Lcom/appsflyer/internal/b$b$a;

    move-result-object v3

    .line 32
    new-instance v4, Lcom/appsflyer/internal/b$b$a;

    invoke-direct {v4, v0, v1, v2}, Lcom/appsflyer/internal/b$b$a;-><init>(JLjava/lang/String;)V

    .line 1071
    iget-wide v0, v4, Lcom/appsflyer/internal/b$b$a;->ˏ:J

    .line 1075
    iget-object v2, v4, Lcom/appsflyer/internal/b$b$a;->ˎ:Ljava/lang/String;

    .line 1042
    invoke-virtual {v3, v0, v1, v2}, Lcom/appsflyer/internal/b$b$a;->ˊ(JLjava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 34
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v4}, Lcom/appsflyer/internal/v;->ॱ(Landroid/content/Context;Lcom/appsflyer/internal/b$b$a;)V

    :cond_0
    return-void
.end method
