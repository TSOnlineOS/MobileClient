.class public Lcom/appsflyer/GcmInstanceIdListener;
.super Lcom/google/android/gms/iid/InstanceIDListenerService;
.source ""


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Lcom/google/android/gms/iid/InstanceIDListenerService;-><init>()V

    return-void
.end method


# virtual methods
.method public onTokenRefresh()V
    .locals 6

    .line 14
    invoke-super {p0}, Lcom/google/android/gms/iid/InstanceIDListenerService;->onTokenRefresh()V

    .line 16
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "gcmProjectNumber"

    invoke-virtual {v0, v1}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 18
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    const/4 v3, 0x0

    .line 21
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/google/android/gms/iid/InstanceID;->getInstance(Landroid/content/Context;)Lcom/google/android/gms/iid/InstanceID;

    move-result-object v4

    const-string v5, "GCM"

    invoke-virtual {v4, v0, v5, v3}, Lcom/google/android/gms/iid/InstanceID;->getToken(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    const-string v4, "Error registering for uninstall tracking"

    .line 23
    invoke-static {v4, v0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    if-eqz v3, :cond_0

    .line 27
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v4, "GCM Refreshed Token = "

    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 28
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v4, "afUninstallToken"

    invoke-virtual {v0, v4}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 29
    invoke-static {v0}, Lcom/appsflyer/internal/b$b$a;->ˎ(Ljava/lang/String;)Lcom/appsflyer/internal/b$b$a;

    move-result-object v0

    .line 30
    new-instance v4, Lcom/appsflyer/internal/b$b$a;

    invoke-direct {v4, v1, v2, v3}, Lcom/appsflyer/internal/b$b$a;-><init>(JLjava/lang/String;)V

    .line 1071
    iget-wide v1, v4, Lcom/appsflyer/internal/b$b$a;->ˏ:J

    .line 1075
    iget-object v3, v4, Lcom/appsflyer/internal/b$b$a;->ˎ:Ljava/lang/String;

    .line 1042
    invoke-virtual {v0, v1, v2, v3}, Lcom/appsflyer/internal/b$b$a;->ˊ(JLjava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 32
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v4}, Lcom/appsflyer/internal/v;->ॱ(Landroid/content/Context;Lcom/appsflyer/internal/b$b$a;)V

    :cond_0
    return-void
.end method
