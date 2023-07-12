.class final Lcom/appsflyer/AppsFlyerLibCore$e;
.super Lcom/appsflyer/AppsFlyerLibCore$d;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/appsflyer/AppsFlyerLibCore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "e"
.end annotation


# instance fields
.field private synthetic ˎ:Lcom/appsflyer/AppsFlyerLibCore;


# direct methods
.method public constructor <init>(Lcom/appsflyer/AppsFlyerLibCore;Landroid/content/Context;Ljava/lang/String;Ljava/util/concurrent/ScheduledExecutorService;)V
    .locals 0

    .line 3381
    iput-object p1, p0, Lcom/appsflyer/AppsFlyerLibCore$e;->ˎ:Lcom/appsflyer/AppsFlyerLibCore;

    .line 3382
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/appsflyer/AppsFlyerLibCore$d;-><init>(Lcom/appsflyer/AppsFlyerLibCore;Landroid/content/Context;Ljava/lang/String;Ljava/util/concurrent/ScheduledExecutorService;)V

    return-void
.end method


# virtual methods
.method public final ˊ()Ljava/lang/String;
    .locals 1

    const-string v0, "https://%sapi.%s/install_data/v3/"

    .line 3387
    invoke-static {v0}, Lcom/appsflyer/ServerConfigHandler;->getUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected final ˋ(Ljava/lang/String;I)V
    .locals 1

    .line 3399
    invoke-static {}, Lcom/appsflyer/AppsFlyerLibCore;->ˋ()Lcom/appsflyer/AppsFlyerConversionListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/appsflyer/AppsFlyerConversionListener;->onInstallConversionFailure(Ljava/lang/String;)V

    const/16 p1, 0x190

    if-lt p2, p1, :cond_0

    const/16 p1, 0x1f4

    if-ge p2, p1, :cond_0

    .line 3402
    iget-object p1, p0, Lcom/appsflyer/AppsFlyerLibCore$d;->ˋ:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/Context;

    invoke-static {p1}, Lcom/appsflyer/AppsFlyerLibCore;->ˊ(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    const/4 p2, 0x0

    const-string v0, "appsflyerConversionDataRequestRetries"

    .line 3403
    invoke-interface {p1, v0, p2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    .line 3404
    iget-object p2, p0, Lcom/appsflyer/AppsFlyerLibCore$d;->ˋ:Ljava/lang/ref/WeakReference;

    invoke-virtual {p2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/content/Context;

    add-int/lit8 p1, p1, 0x1

    invoke-static {p2, v0, p1}, Lcom/appsflyer/AppsFlyerLibCore;->ॱ(Landroid/content/Context;Ljava/lang/String;I)V

    :cond_0
    return-void
.end method

.method protected final ˏ(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x1

    .line 3392
    invoke-static {v0}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v0

    const-string v1, "is_first_launch"

    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3393
    invoke-static {}, Lcom/appsflyer/AppsFlyerLibCore;->ˋ()Lcom/appsflyer/AppsFlyerConversionListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/appsflyer/AppsFlyerConversionListener;->onInstallConversionDataLoaded(Ljava/util/Map;)V

    .line 3394
    iget-object p1, p0, Lcom/appsflyer/AppsFlyerLibCore$d;->ˋ:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/Context;

    const-string v0, "appsflyerConversionDataRequestRetries"

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Lcom/appsflyer/AppsFlyerLibCore;->ॱ(Landroid/content/Context;Ljava/lang/String;I)V

    return-void
.end method
