.class final Lcom/appsflyer/AppsFlyerLibCore$5;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lcom/appsflyer/AppsFlyerConversionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/appsflyer/AppsFlyerLibCore;->getConversionData(Landroid/content/Context;Lcom/appsflyer/ConversionDataListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private synthetic ˎ:Lcom/appsflyer/AppsFlyerLibCore;

.field private synthetic ॱ:Lcom/appsflyer/ConversionDataListener;


# direct methods
.method constructor <init>(Lcom/appsflyer/AppsFlyerLibCore;Lcom/appsflyer/ConversionDataListener;)V
    .locals 0

    .line 1387
    iput-object p1, p0, Lcom/appsflyer/AppsFlyerLibCore$5;->ˎ:Lcom/appsflyer/AppsFlyerLibCore;

    iput-object p2, p0, Lcom/appsflyer/AppsFlyerLibCore$5;->ॱ:Lcom/appsflyer/ConversionDataListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAppOpenAttribution(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public final onAttributionFailure(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public final onInstallConversionDataLoaded(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1389
    iget-object v0, p0, Lcom/appsflyer/AppsFlyerLibCore$5;->ॱ:Lcom/appsflyer/ConversionDataListener;

    invoke-interface {v0, p1}, Lcom/appsflyer/ConversionDataListener;->onConversionDataLoaded(Ljava/util/Map;)V

    return-void
.end method

.method public final onInstallConversionFailure(Ljava/lang/String;)V
    .locals 1

    .line 1393
    iget-object v0, p0, Lcom/appsflyer/AppsFlyerLibCore$5;->ॱ:Lcom/appsflyer/ConversionDataListener;

    invoke-interface {v0, p1}, Lcom/appsflyer/ConversionDataListener;->onConversionFailure(Ljava/lang/String;)V

    return-void
.end method
