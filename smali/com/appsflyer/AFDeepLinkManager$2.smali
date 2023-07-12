.class final Lcom/appsflyer/AFDeepLinkManager$2;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/appsflyer/AFDeepLinkManager;->ˏ(Landroid/content/Context;Ljava/util/Map;Landroid/net/Uri;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private synthetic ˋ:Lcom/appsflyer/AFDeepLinkManager;

.field private synthetic ˎ:Landroid/net/Uri;

.field private synthetic ˏ:Landroid/content/Context;

.field private synthetic ॱ:Ljava/util/Map;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1012
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Lcom/appsflyer/AFDeepLinkManager;Landroid/net/Uri;Ljava/util/Map;Landroid/content/Context;)V
    .locals 0

    .line 74
    iput-object p1, p0, Lcom/appsflyer/AFDeepLinkManager$2;->ˋ:Lcom/appsflyer/AFDeepLinkManager;

    iput-object p2, p0, Lcom/appsflyer/AFDeepLinkManager$2;->ˎ:Landroid/net/Uri;

    iput-object p3, p0, Lcom/appsflyer/AFDeepLinkManager$2;->ॱ:Ljava/util/Map;

    iput-object p4, p0, Lcom/appsflyer/AFDeepLinkManager$2;->ˏ:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static ˏ(Landroid/content/Context;)V
    .locals 6

    .line 1023
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const-string v0, "onBecameBackground"

    .line 1024
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 1025
    invoke-static {}, Lcom/appsflyer/AppsFlyerLibCore;->getInstance()Lcom/appsflyer/AppsFlyerLibCore;

    move-result-object v0

    .line 1211
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, v0, Lcom/appsflyer/AppsFlyerLibCore;->ᐝ:J

    const-string v0, "callStatsBackground background call"

    .line 1026
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 1027
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 1028
    invoke-static {}, Lcom/appsflyer/AppsFlyerLibCore;->getInstance()Lcom/appsflyer/AppsFlyerLibCore;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/appsflyer/AppsFlyerLibCore;->ॱ(Ljava/lang/ref/WeakReference;)V

    .line 2068
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v0, :cond_0

    .line 2069
    new-instance v0, Lcom/appsflyer/internal/x;

    invoke-direct {v0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 2071
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 2322
    iget-boolean v1, v0, Lcom/appsflyer/internal/x;->ˋ:Z

    if-eqz v1, :cond_4

    .line 1031
    invoke-virtual {v0}, Lcom/appsflyer/internal/x;->ˏ()V

    if-eqz p0, :cond_3

    .line 1033
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    .line 1034
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    .line 4068
    :try_start_0
    sget-object v2, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v2, :cond_1

    .line 4069
    new-instance v2, Lcom/appsflyer/internal/x;

    invoke-direct {v2}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v2, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 4071
    :cond_1
    sget-object v2, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 3099
    invoke-virtual {v2, v1, p0}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Landroid/content/pm/PackageManager;)V

    .line 5068
    sget-object p0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez p0, :cond_2

    .line 5069
    new-instance p0, Lcom/appsflyer/internal/x;

    invoke-direct {p0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object p0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 5071
    :cond_2
    sget-object p0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 3100
    invoke-virtual {p0}, Lcom/appsflyer/internal/x;->ˎ()Ljava/lang/String;

    move-result-object p0

    .line 3101
    new-instance v2, Lcom/appsflyer/internal/q;

    const/4 v3, 0x0

    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v4

    invoke-virtual {v4}, Lcom/appsflyer/AppsFlyerLib;->isTrackingStopped()Z

    move-result v4

    invoke-direct {v2, v3, v4}, Lcom/appsflyer/internal/q;-><init>(Landroid/content/Context;Z)V

    .line 3103
    iput-object p0, v2, Lcom/appsflyer/internal/q;->ˋ:Ljava/lang/String;

    const/4 p0, 0x0

    .line 5127
    iput-boolean p0, v2, Lcom/appsflyer/internal/q;->ˏ:Z

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    .line 3105
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "https://%smonitorsdk.%s/remote-debug?app_id="

    invoke-static {v5}, Lcom/appsflyer/ServerConfigHandler;->getUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v3, p0

    invoke-virtual {v2, v3}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1037
    :catchall_0
    :cond_3
    invoke-virtual {v0}, Lcom/appsflyer/internal/x;->ॱ()V

    goto :goto_0

    :cond_4
    const-string p0, "RD status is OFF"

    .line 1039
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 1042
    :goto_0
    invoke-static {}, Lcom/appsflyer/AFExecutor;->getInstance()Lcom/appsflyer/AFExecutor;

    move-result-object p0

    .line 6098
    :try_start_1
    iget-object v0, p0, Lcom/appsflyer/AFExecutor;->ˏ:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-static {v0}, Lcom/appsflyer/AFExecutor;->ˋ(Ljava/util/concurrent/ExecutorService;)V

    .line 6100
    iget-object v0, p0, Lcom/appsflyer/AFExecutor;->ˊ:Ljava/util/concurrent/Executor;

    instance-of v0, v0, Ljava/util/concurrent/ThreadPoolExecutor;

    if-eqz v0, :cond_5

    .line 6101
    iget-object p0, p0, Lcom/appsflyer/AFExecutor;->ˊ:Ljava/util/concurrent/Executor;

    check-cast p0, Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-static {p0}, Lcom/appsflyer/AFExecutor;->ˋ(Ljava/util/concurrent/ExecutorService;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :cond_5
    return-void

    :catchall_1
    move-exception p0

    const-string v0, "failed to stop Executors"

    .line 6104
    invoke-static {v0, p0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 8

    .line 76
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 77
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 81
    :try_start_0
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "ESP deeplink resoling is started: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, p0, Lcom/appsflyer/AFDeepLinkManager$2;->ˎ:Landroid/net/Uri;

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/appsflyer/AFLogger;->afRDLog(Ljava/lang/String;)V

    .line 83
    new-instance v5, Ljava/net/URL;

    iget-object v6, p0, Lcom/appsflyer/AFDeepLinkManager$2;->ˎ:Landroid/net/Uri;

    .line 84
    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v5

    check-cast v5, Ljava/net/HttpURLConnection;

    .line 85
    invoke-virtual {v5, v3}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 86
    sget v6, Lcom/appsflyer/AFDeepLinkManager;->ˊ:I

    invoke-virtual {v5, v6}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 87
    sget v6, Lcom/appsflyer/AFDeepLinkManager;->ˊ:I

    invoke-virtual {v5, v6}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    const-string v6, "User-agent"

    const-string v7, "Dalvik/2.1.0 (Linux; U; Android 6.0.1; Nexus 5 Build/M4B30Z)"

    .line 88
    invoke-virtual {v5, v6, v7}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    invoke-virtual {v5}, Ljava/net/URLConnection;->connect()V

    const-string v6, "ESP deeplink resoling is finished"

    .line 92
    invoke-static {v6}, Lcom/appsflyer/AFLogger;->afRDLog(Ljava/lang/String;)V

    const-string v6, "status"

    .line 94
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v0, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v6

    const/16 v7, 0x12c

    if-lt v6, v7, :cond_0

    .line 97
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v6

    const/16 v7, 0x131

    if-gt v6, v7, :cond_0

    const-string v6, "Location"

    .line 98
    invoke-virtual {v5, v6}, Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    .line 100
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v1

    .line 101
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v5

    const-string v6, "error"

    .line 103
    invoke-virtual {v5}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v0, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v6, "status"

    const-string v7, "-1"

    .line 104
    invoke-interface {v0, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v1

    .line 106
    invoke-virtual {v5}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v5}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    const-string v1, "latency"

    .line 109
    invoke-static {v6, v7}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz v4, :cond_1

    const-string v1, "res"

    .line 112
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_1
    const-string v1, "res"

    const-string v2, ""

    .line 114
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "ESP deeplink results: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v0}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/appsflyer/AFLogger;->afRDLog(Ljava/lang/String;)V

    .line 119
    iget-object v1, p0, Lcom/appsflyer/AFDeepLinkManager$2;->ॱ:Ljava/util/Map;

    monitor-enter v1

    .line 120
    :try_start_1
    iget-object v2, p0, Lcom/appsflyer/AFDeepLinkManager$2;->ॱ:Ljava/util/Map;

    const-string v5, "af_deeplink_r"

    invoke-interface {v2, v5, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    iget-object v0, p0, Lcom/appsflyer/AFDeepLinkManager$2;->ॱ:Ljava/util/Map;

    const-string v2, "af_deeplink"

    iget-object v5, p0, Lcom/appsflyer/AFDeepLinkManager$2;->ˎ:Landroid/net/Uri;

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v2, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 125
    sput-boolean v3, Lcom/appsflyer/AFDeepLinkManager;->ˋ:Z

    if-eqz v4, :cond_2

    goto :goto_2

    .line 126
    :cond_2
    iget-object v4, p0, Lcom/appsflyer/AFDeepLinkManager$2;->ˎ:Landroid/net/Uri;

    .line 127
    :goto_2
    invoke-static {}, Lcom/appsflyer/AppsFlyerLibCore;->getInstance()Lcom/appsflyer/AppsFlyerLibCore;

    move-result-object v0

    iget-object v1, p0, Lcom/appsflyer/AFDeepLinkManager$2;->ˏ:Landroid/content/Context;

    iget-object v2, p0, Lcom/appsflyer/AFDeepLinkManager$2;->ॱ:Ljava/util/Map;

    invoke-virtual {v0, v1, v2, v4}, Lcom/appsflyer/AppsFlyerLibCore;->handleDeepLinkCallback(Landroid/content/Context;Ljava/util/Map;Landroid/net/Uri;)V

    return-void

    :catchall_1
    move-exception v0

    .line 122
    monitor-exit v1

    throw v0
.end method
