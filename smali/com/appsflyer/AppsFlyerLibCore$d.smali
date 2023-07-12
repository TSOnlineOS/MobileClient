.class abstract Lcom/appsflyer/AppsFlyerLibCore$d;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/appsflyer/AppsFlyerLibCore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x400
    name = "d"
.end annotation


# instance fields
.field private ˊ:Ljava/util/concurrent/ScheduledExecutorService;

.field ˋ:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private synthetic ˎ:Lcom/appsflyer/AppsFlyerLibCore;

.field private ˏ:Ljava/lang/String;

.field private ॱ:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method constructor <init>(Lcom/appsflyer/AppsFlyerLibCore;Landroid/content/Context;Ljava/lang/String;Ljava/util/concurrent/ScheduledExecutorService;)V
    .locals 1

    .line 3417
    iput-object p1, p0, Lcom/appsflyer/AppsFlyerLibCore$d;->ˎ:Lcom/appsflyer/AppsFlyerLibCore;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    .line 3412
    iput-object p1, p0, Lcom/appsflyer/AppsFlyerLibCore$d;->ˋ:Ljava/lang/ref/WeakReference;

    .line 3415
    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object p1, p0, Lcom/appsflyer/AppsFlyerLibCore$d;->ॱ:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 3418
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/appsflyer/AppsFlyerLibCore$d;->ˋ:Ljava/lang/ref/WeakReference;

    .line 3419
    iput-object p3, p0, Lcom/appsflyer/AppsFlyerLibCore$d;->ˏ:Ljava/lang/String;

    if-nez p4, :cond_0

    .line 3421
    invoke-static {}, Lcom/appsflyer/AFExecutor;->getInstance()Lcom/appsflyer/AFExecutor;

    move-result-object p1

    invoke-virtual {p1}, Lcom/appsflyer/AFExecutor;->ˏ()Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    move-result-object p1

    iput-object p1, p0, Lcom/appsflyer/AppsFlyerLibCore$d;->ˊ:Ljava/util/concurrent/ScheduledExecutorService;

    return-void

    .line 3423
    :cond_0
    iput-object p4, p0, Lcom/appsflyer/AppsFlyerLibCore$d;->ˊ:Ljava/util/concurrent/ScheduledExecutorService;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    const-string v0, "af_siteid"

    .line 3434
    iget-object v1, p0, Lcom/appsflyer/AppsFlyerLibCore$d;->ˏ:Ljava/lang/String;

    if-eqz v1, :cond_12

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    goto/16 :goto_7

    .line 3439
    :cond_0
    iget-object v1, p0, Lcom/appsflyer/AppsFlyerLibCore$d;->ˎ:Lcom/appsflyer/AppsFlyerLibCore;

    invoke-virtual {v1}, Lcom/appsflyer/AppsFlyerLib;->isTrackingStopped()Z

    move-result v1

    if-eqz v1, :cond_1

    return-void

    .line 3443
    :cond_1
    iget-object v1, p0, Lcom/appsflyer/AppsFlyerLibCore$d;->ॱ:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 3446
    :try_start_0
    iget-object v3, p0, Lcom/appsflyer/AppsFlyerLibCore$d;->ˋ:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/Context;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-nez v3, :cond_2

    .line 3553
    iget-object v0, p0, Lcom/appsflyer/AppsFlyerLibCore$d;->ॱ:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    return-void

    .line 3451
    :cond_2
    :try_start_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 3452
    new-instance v6, Ljava/lang/ref/WeakReference;

    invoke-direct {v6, v3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {v6}, Lcom/appsflyer/AppsFlyerLibCore;->ˊ(Ljava/lang/ref/WeakReference;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v6}, Lcom/appsflyer/AppsFlyerLibCore;->ˎ(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    const-string v7, ""

    const/4 v8, 0x1

    if-eqz v6, :cond_4

    .line 3455
    :try_start_2
    invoke-static {}, Lcom/appsflyer/AppsFlyerLibCore;->ˊ()Ljava/util/List;

    move-result-object v9

    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_3

    const-string v9, "-"

    .line 3456
    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v9, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto :goto_0

    :cond_3
    const-string v9, "AF detected using redundant Google-Play channel for attribution - %s. Using without channel postfix."

    new-array v10, v8, [Ljava/lang/Object;

    aput-object v6, v10, v2

    .line 3458
    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/appsflyer/AFLogger;->afWarnLog(Ljava/lang/String;)V

    :cond_4
    move-object v6, v7

    .line 3461
    :goto_0
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 3462
    invoke-virtual {p0}, Lcom/appsflyer/AppsFlyerLibCore$d;->ˊ()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3463
    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3464
    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "?devkey="

    .line 3465
    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/appsflyer/AppsFlyerLibCore$d;->ˏ:Ljava/lang/String;

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "&device_id="

    .line 3466
    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v6, Ljava/lang/ref/WeakReference;

    invoke-direct {v6, v3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {v6}, Lcom/appsflyer/internal/u;->ˋ(Ljava/lang/ref/WeakReference;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4068
    sget-object v6, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v6, :cond_5

    .line 4069
    new-instance v6, Lcom/appsflyer/internal/x;

    invoke-direct {v6}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v6, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 4071
    :cond_5
    sget-object v6, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 3468
    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v10

    const-string v11, "server_request"

    .line 4183
    filled-new-array {v7}, [Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v11, v10, v7}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 3469
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Calling server for attribution url: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/appsflyer/AFExecutor$2$1;->ˏ(Ljava/lang/String;)V

    .line 3471
    new-instance v6, Ljava/net/URL;

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v6

    check-cast v6, Ljava/net/HttpURLConnection;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :try_start_3
    const-string v1, "GET"

    .line 3473
    invoke-virtual {v6, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/16 v1, 0x2710

    .line 3474
    invoke-virtual {v6, v1}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    const-string v1, "Connection"

    const-string v7, "close"

    .line 3475
    invoke-virtual {v6, v1, v7}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 3476
    invoke-virtual {v6}, Ljava/net/URLConnection;->connect()V

    .line 3478
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1

    .line 3479
    invoke-static {v6}, Lcom/appsflyer/AppsFlyerLibCore;->ॱ(Ljava/net/HttpURLConnection;)Ljava/lang/String;

    move-result-object v7

    .line 5068
    sget-object v10, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v10, :cond_6

    .line 5069
    new-instance v10, Lcom/appsflyer/internal/x;

    invoke-direct {v10}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v10, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 5071
    :cond_6
    sget-object v10, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 3480
    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    const-string v12, "server_response"

    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/String;

    .line 5187
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v14

    aput-object v14, v13, v2

    aput-object v7, v13, v8

    invoke-virtual {v10, v12, v11, v13}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    const/16 v10, 0xc8

    if-ne v1, v10, :cond_c

    .line 3483
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    const-string v1, "appsflyerGetConversionDataTiming"

    sub-long/2addr v9, v4

    .line 3485
    invoke-static {v3, v1, v9, v10}, Lcom/appsflyer/AppsFlyerLibCore;->ˊ(Landroid/content/Context;Ljava/lang/String;J)V

    const-string v1, "Attribution data: "

    .line 3488
    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/appsflyer/AFExecutor$2$1;->ˏ(Ljava/lang/String;)V

    .line 3490
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_e

    if-eqz v3, :cond_e

    .line 3491
    invoke-static {v7}, Lcom/appsflyer/AppsFlyerLibCore;->ˊ(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v1

    const-string v4, "iscache"

    .line 3492
    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    if-eqz v4, :cond_7

    .line 3495
    invoke-static {v2}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    const-string v5, "appsflyerConversionDataCacheExpiration"

    .line 3497
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    invoke-static {v3, v5, v9, v10}, Lcom/appsflyer/AppsFlyerLibCore;->ˊ(Landroid/content/Context;Ljava/lang/String;J)V

    .line 3499
    :cond_7
    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    const-string v9, "[Invite] Detected App-Invite via channel: "

    const-string v10, "af_channel"

    if-eqz v5, :cond_9

    .line 3500
    :try_start_4
    invoke-interface {v1, v10}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 3502
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    goto :goto_1

    :cond_8
    const-string v5, "[CrossPromotion] App was installed via %s\'s Cross Promotion"

    new-array v11, v8, [Ljava/lang/Object;

    .line 3507
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    aput-object v12, v11, v2

    .line 3505
    invoke-static {v5, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 3510
    :cond_9
    :goto_1
    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 3511
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    :cond_a
    const-string v0, "is_first_launch"

    .line 3515
    invoke-static {v2}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1, v0, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3517
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    const-string v5, "attributionId"

    if-eqz v0, :cond_b

    .line 3519
    :try_start_5
    invoke-static {v3, v5, v0}, Lcom/appsflyer/AppsFlyerLibCore;->ˏ(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 3521
    :cond_b
    invoke-static {v3, v5, v7}, Lcom/appsflyer/AppsFlyerLibCore;->ˏ(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 3524
    :goto_2
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v5, "iscache="

    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " caching conversion data"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 3526
    invoke-static {}, Lcom/appsflyer/AppsFlyerLibCore;->ˋ()Lcom/appsflyer/AppsFlyerConversionListener;

    move-result-object v0

    if-eqz v0, :cond_e

    .line 3527
    iget-object v0, p0, Lcom/appsflyer/AppsFlyerLibCore$d;->ॱ:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    if-gt v0, v8, :cond_e

    .line 3530
    :try_start_6
    invoke-static {v3}, Lcom/appsflyer/AppsFlyerLibCore;->ˏ(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v1
    :try_end_6
    .catch Lcom/appsflyer/internal/s; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_3

    :catch_0
    move-exception v0

    :try_start_7
    const-string v3, "Exception while trying to fetch attribution data. "

    .line 3532
    invoke-static {v3, v0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 3535
    :goto_3
    invoke-virtual {p0, v1}, Lcom/appsflyer/AppsFlyerLibCore$d;->ˏ(Ljava/util/Map;)V

    goto :goto_4

    .line 3541
    :cond_c
    invoke-static {}, Lcom/appsflyer/AppsFlyerLibCore;->ˋ()Lcom/appsflyer/AppsFlyerConversionListener;

    move-result-object v0

    if-eqz v0, :cond_d

    const-string v0, "Error connection to server: "

    .line 3542
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v1}, Lcom/appsflyer/AppsFlyerLibCore$d;->ˋ(Ljava/lang/String;I)V

    .line 3544
    :cond_d
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "AttributionIdFetcher response code: "

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "  url: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFExecutor$2$1;->ˏ(Ljava/lang/String;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 3553
    :cond_e
    :goto_4
    iget-object v0, p0, Lcom/appsflyer/AppsFlyerLibCore$d;->ॱ:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    if-eqz v6, :cond_10

    .line 3555
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->disconnect()V

    goto :goto_6

    :catchall_0
    move-exception v0

    move-object v1, v6

    goto :goto_5

    :catchall_1
    move-exception v0

    .line 3548
    :goto_5
    :try_start_8
    invoke-static {}, Lcom/appsflyer/AppsFlyerLibCore;->ˋ()Lcom/appsflyer/AppsFlyerConversionListener;

    move-result-object v3

    if-eqz v3, :cond_f

    .line 3549
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3, v2}, Lcom/appsflyer/AppsFlyerLibCore$d;->ˋ(Ljava/lang/String;I)V

    .line 3551
    :cond_f
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 3553
    iget-object v0, p0, Lcom/appsflyer/AppsFlyerLibCore$d;->ॱ:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    if-eqz v1, :cond_10

    .line 3555
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 3558
    :cond_10
    :goto_6
    iget-object v0, p0, Lcom/appsflyer/AppsFlyerLibCore$d;->ˊ:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ScheduledExecutorService;->shutdown()V

    return-void

    :catchall_2
    move-exception v0

    .line 3553
    iget-object v2, p0, Lcom/appsflyer/AppsFlyerLibCore$d;->ॱ:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    if-eqz v1, :cond_11

    .line 3555
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_11
    throw v0

    :cond_12
    :goto_7
    return-void
.end method

.method public abstract ˊ()Ljava/lang/String;
.end method

.method protected abstract ˋ(Ljava/lang/String;I)V
.end method

.method protected abstract ˏ(Ljava/util/Map;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method
