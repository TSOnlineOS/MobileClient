.class final Lcom/appsflyer/AppsFlyerLibCore$c;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/appsflyer/AppsFlyerLibCore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "c"
.end annotation


# instance fields
.field private ˊ:Z

.field private ˋ:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private ˎ:I

.field private ˏ:Ljava/lang/String;

.field private ॱ:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private synthetic ᐝ:Lcom/appsflyer/AppsFlyerLibCore;


# direct methods
.method private constructor <init>(Lcom/appsflyer/AppsFlyerLibCore;Ljava/lang/String;Ljava/util/Map;Landroid/content/Context;ZI)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Landroid/content/Context;",
            "ZI)V"
        }
    .end annotation

    .line 3335
    iput-object p1, p0, Lcom/appsflyer/AppsFlyerLibCore$c;->ᐝ:Lcom/appsflyer/AppsFlyerLibCore;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    .line 3328
    iput-object p1, p0, Lcom/appsflyer/AppsFlyerLibCore$c;->ˋ:Ljava/lang/ref/WeakReference;

    .line 3336
    iput-object p2, p0, Lcom/appsflyer/AppsFlyerLibCore$c;->ˏ:Ljava/lang/String;

    .line 3337
    iput-object p3, p0, Lcom/appsflyer/AppsFlyerLibCore$c;->ॱ:Ljava/util/Map;

    .line 3338
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p4}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/appsflyer/AppsFlyerLibCore$c;->ˋ:Ljava/lang/ref/WeakReference;

    .line 3339
    iput-boolean p5, p0, Lcom/appsflyer/AppsFlyerLibCore$c;->ˊ:Z

    .line 3340
    iput p6, p0, Lcom/appsflyer/AppsFlyerLibCore$c;->ˎ:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/appsflyer/AppsFlyerLibCore;Ljava/lang/String;Ljava/util/Map;Landroid/content/Context;ZIB)V
    .locals 0

    .line 3323
    invoke-direct/range {p0 .. p6}, Lcom/appsflyer/AppsFlyerLibCore$c;-><init>(Lcom/appsflyer/AppsFlyerLibCore;Ljava/lang/String;Ljava/util/Map;Landroid/content/Context;ZI)V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 9

    .line 3345
    iget-object v0, p0, Lcom/appsflyer/AppsFlyerLibCore$c;->ᐝ:Lcom/appsflyer/AppsFlyerLibCore;

    invoke-virtual {v0}, Lcom/appsflyer/AppsFlyerLib;->isTrackingStopped()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 3351
    iget-boolean v1, p0, Lcom/appsflyer/AppsFlyerLibCore$c;->ˊ:Z

    if-eqz v1, :cond_1

    iget v1, p0, Lcom/appsflyer/AppsFlyerLibCore$c;->ˎ:I

    const/4 v2, 0x2

    if-gt v1, v2, :cond_1

    iget-object v1, p0, Lcom/appsflyer/AppsFlyerLibCore$c;->ᐝ:Lcom/appsflyer/AppsFlyerLibCore;

    .line 3353
    invoke-static {v1}, Lcom/appsflyer/AppsFlyerLibCore;->ˋ(Lcom/appsflyer/AppsFlyerLibCore;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 3354
    iget-object v1, p0, Lcom/appsflyer/AppsFlyerLibCore$c;->ॱ:Ljava/util/Map;

    const-string v2, "rfr"

    iget-object v3, p0, Lcom/appsflyer/AppsFlyerLibCore$c;->ᐝ:Lcom/appsflyer/AppsFlyerLibCore;

    invoke-static {v3}, Lcom/appsflyer/AppsFlyerLibCore;->ˏ(Lcom/appsflyer/AppsFlyerLibCore;)Ljava/util/Map;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3358
    :cond_1
    iget-object v1, p0, Lcom/appsflyer/AppsFlyerLibCore$c;->ॱ:Ljava/util/Map;

    new-instance v2, Lcom/appsflyer/internal/b$b;

    iget-object v3, p0, Lcom/appsflyer/AppsFlyerLibCore$c;->ॱ:Ljava/util/Map;

    iget-object v4, p0, Lcom/appsflyer/AppsFlyerLibCore$c;->ˋ:Ljava/lang/ref/WeakReference;

    invoke-virtual {v4}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/Context;

    invoke-direct {v2, v3, v4}, Lcom/appsflyer/internal/b$b;-><init>(Ljava/util/Map;Landroid/content/Context;)V

    invoke-interface {v1, v2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 3361
    :try_start_0
    iget-object v1, p0, Lcom/appsflyer/AppsFlyerLibCore$c;->ॱ:Ljava/util/Map;

    const-string v2, "appsflyerKey"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Ljava/lang/String;

    .line 3362
    iget-object v1, p0, Lcom/appsflyer/AppsFlyerLibCore$c;->ॱ:Ljava/util/Map;

    monitor-enter v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 3363
    :try_start_1
    iget-object v2, p0, Lcom/appsflyer/AppsFlyerLibCore$c;->ॱ:Ljava/util/Map;

    invoke-static {v2}, Lcom/appsflyer/AFHelper;->convertToJsonObject(Ljava/util/Map;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    .line 3364
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 3365
    :try_start_2
    iget-object v2, p0, Lcom/appsflyer/AppsFlyerLibCore$c;->ᐝ:Lcom/appsflyer/AppsFlyerLibCore;

    iget-object v3, p0, Lcom/appsflyer/AppsFlyerLibCore$c;->ˏ:Ljava/lang/String;

    iget-object v6, p0, Lcom/appsflyer/AppsFlyerLibCore$c;->ˋ:Ljava/lang/ref/WeakReference;

    const/4 v7, 0x0

    iget-boolean v8, p0, Lcom/appsflyer/AppsFlyerLibCore$c;->ˊ:Z

    move-object v4, v0

    invoke-static/range {v2 .. v8}, Lcom/appsflyer/AppsFlyerLibCore;->ॱ(Lcom/appsflyer/AppsFlyerLibCore;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ref/WeakReference;Ljava/lang/String;Z)V

    return-void

    :catchall_0
    move-exception v2

    .line 3364
    monitor-exit v1

    throw v2
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :catchall_1
    move-exception v0

    .line 3374
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void

    :catch_0
    move-exception v1

    const-string v2, "Exception while sending request to server. "

    .line 3368
    invoke-static {v2, v1}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    if-eqz v0, :cond_2

    .line 3369
    iget-object v2, p0, Lcom/appsflyer/AppsFlyerLibCore$c;->ˋ:Ljava/lang/ref/WeakReference;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/appsflyer/AppsFlyerLibCore$c;->ˏ:Ljava/lang/String;

    const-string v3, "&isCachedRequest=true&timeincache="

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 3370
    invoke-static {}, Lcom/appsflyer/cache/CacheManager;->getInstance()Lcom/appsflyer/cache/CacheManager;

    move-result-object v2

    new-instance v3, Lcom/appsflyer/cache/RequestCacheData;

    iget-object v4, p0, Lcom/appsflyer/AppsFlyerLibCore$c;->ˏ:Ljava/lang/String;

    const-string v5, "4.10.0"

    invoke-direct {v3, v4, v0, v5}, Lcom/appsflyer/cache/RequestCacheData;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/appsflyer/AppsFlyerLibCore$c;->ˋ:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    invoke-virtual {v2, v3, v0}, Lcom/appsflyer/cache/CacheManager;->cacheRequest(Lcom/appsflyer/cache/RequestCacheData;Landroid/content/Context;)V

    .line 3371
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v1}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_2
    return-void
.end method
