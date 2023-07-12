.class public Lcom/appsflyer/share/CrossPromotionHelper;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/appsflyer/share/CrossPromotionHelper$a;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static trackAndOpenStore(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 28
    invoke-static {p0, p1, p2, v0}, Lcom/appsflyer/share/CrossPromotionHelper;->trackAndOpenStore(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static trackAndOpenStore(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const-string v0, "https://%sapp.%s"

    .line 39
    invoke-static {v0}, Lcom/appsflyer/ServerConfigHandler;->getUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 35
    invoke-static {p0, p1, p2, p3, v0}, Lcom/appsflyer/share/CrossPromotionHelper;->ॱ(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)Lcom/appsflyer/share/LinkGenerator;

    move-result-object p1

    .line 41
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "waitForCustomerId"

    const/4 v2, 0x0

    .line 42
    invoke-virtual {v0, v1, v2}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    const-string p0, "CustomerUserId not set, track And Open Store is disabled"

    .line 43
    invoke-static {p0, v1}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;Z)V

    return-void

    .line 47
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    if-eqz p3, :cond_1

    .line 49
    invoke-interface {v0, p3}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    :cond_1
    const-string p3, "af_campaign"

    .line 51
    invoke-interface {v0, p3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object p2

    const-string p3, "af_cross_promotion"

    invoke-virtual {p2, p0, p3, v0}, Lcom/appsflyer/AppsFlyerLib;->trackEvent(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;)V

    .line 54
    new-instance p2, Lcom/appsflyer/internal/aa;

    invoke-direct {p2}, Lcom/appsflyer/internal/aa;-><init>()V

    .line 55
    new-instance p3, Lcom/appsflyer/share/CrossPromotionHelper$a;

    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v0

    invoke-virtual {v0}, Lcom/appsflyer/AppsFlyerLib;->isTrackingStopped()Z

    move-result v0

    invoke-direct {p3, p2, p0, v0}, Lcom/appsflyer/share/CrossPromotionHelper$a;-><init>(Lcom/appsflyer/internal/aa;Landroid/content/Context;Z)V

    new-array p0, v1, [Ljava/lang/String;

    invoke-virtual {p1}, Lcom/appsflyer/share/LinkGenerator;->generateLink()Ljava/lang/String;

    move-result-object p1

    aput-object p1, p0, v2

    invoke-virtual {p3, p0}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static trackCrossPromoteImpression(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 63
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "waitForCustomerId"

    const/4 v2, 0x0

    .line 64
    invoke-virtual {v0, v1, v2}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    const-string p0, "CustomerUserId not set, Promote Impression is disabled"

    .line 65
    invoke-static {p0, v1}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;Z)V

    return-void

    :cond_0
    const-string v0, "https://%simpression.%s"

    .line 73
    invoke-static {v0}, Lcom/appsflyer/ServerConfigHandler;->getUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v3, 0x0

    .line 69
    invoke-static {p0, p1, p2, v3, v0}, Lcom/appsflyer/share/CrossPromotionHelper;->ॱ(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)Lcom/appsflyer/share/LinkGenerator;

    move-result-object p0

    .line 74
    new-instance p1, Lcom/appsflyer/share/CrossPromotionHelper$a;

    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object p2

    invoke-virtual {p2}, Lcom/appsflyer/AppsFlyerLib;->isTrackingStopped()Z

    move-result p2

    invoke-direct {p1, v3, v3, p2}, Lcom/appsflyer/share/CrossPromotionHelper$a;-><init>(Lcom/appsflyer/internal/aa;Landroid/content/Context;Z)V

    new-array p2, v1, [Ljava/lang/String;

    invoke-virtual {p0}, Lcom/appsflyer/share/LinkGenerator;->generateLink()Ljava/lang/String;

    move-result-object p0

    aput-object p0, p2, v2

    invoke-virtual {p1, p2}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method private static ॱ(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)Lcom/appsflyer/share/LinkGenerator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/appsflyer/share/LinkGenerator;"
        }
    .end annotation

    .line 82
    new-instance v0, Lcom/appsflyer/share/LinkGenerator;

    const-string v1, "af_cross_promotion"

    invoke-direct {v0, v1}, Lcom/appsflyer/share/LinkGenerator;-><init>(Ljava/lang/String;)V

    .line 1060
    iput-object p4, v0, Lcom/appsflyer/share/LinkGenerator;->ˊ:Ljava/lang/String;

    .line 2045
    iput-object p1, v0, Lcom/appsflyer/share/LinkGenerator;->ˋ:Ljava/lang/String;

    .line 85
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const-string p1, "af_siteid"

    invoke-virtual {v0, p1, p0}, Lcom/appsflyer/share/LinkGenerator;->addParameter(Ljava/lang/String;Ljava/lang/String;)Lcom/appsflyer/share/LinkGenerator;

    if-eqz p2, :cond_0

    .line 87
    invoke-virtual {v0, p2}, Lcom/appsflyer/share/LinkGenerator;->setCampaign(Ljava/lang/String;)Lcom/appsflyer/share/LinkGenerator;

    :cond_0
    if-eqz p3, :cond_1

    .line 90
    invoke-virtual {v0, p3}, Lcom/appsflyer/share/LinkGenerator;->addParameters(Ljava/util/Map;)Lcom/appsflyer/share/LinkGenerator;

    .line 92
    :cond_1
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object p0

    const-string p1, "advertiserId"

    invoke-virtual {p0, p1}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_2

    const-string p1, "advertising_id"

    .line 94
    invoke-virtual {v0, p1, p0}, Lcom/appsflyer/share/LinkGenerator;->addParameter(Ljava/lang/String;Ljava/lang/String;)Lcom/appsflyer/share/LinkGenerator;

    :cond_2
    return-object v0
.end method
