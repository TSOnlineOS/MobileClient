.class final Lcom/appsflyer/AppsFlyerUnityHelper$1;
.super Ljava/lang/Object;
.source "AppsFlyerUnityHelper.java"

# interfaces
.implements Lcom/appsflyer/AppsFlyerConversionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/appsflyer/AppsFlyerUnityHelper;->createConversionDataListener(Landroid/content/Context;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$callbackObjectName:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 17
    iput-object p1, p0, Lcom/appsflyer/AppsFlyerUnityHelper$1;->val$callbackObjectName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAppOpenAttribution(Ljava/util/Map;)V
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

    .line 29
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 30
    iget-object p1, p0, Lcom/appsflyer/AppsFlyerUnityHelper$1;->val$callbackObjectName:Ljava/lang/String;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "onAppOpenAttribution"

    invoke-static {p1, v1, v0}, Lcom/unity3d/player/UnityPlayer;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onAttributionFailure(Ljava/lang/String;)V
    .locals 2

    .line 34
    iget-object v0, p0, Lcom/appsflyer/AppsFlyerUnityHelper$1;->val$callbackObjectName:Ljava/lang/String;

    const-string v1, "onAppOpenAttributionFailure"

    invoke-static {v0, v1, p1}, Lcom/unity3d/player/UnityPlayer;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onInstallConversionDataLoaded(Ljava/util/Map;)V
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

    .line 20
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 21
    iget-object p1, p0, Lcom/appsflyer/AppsFlyerUnityHelper$1;->val$callbackObjectName:Ljava/lang/String;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "didReceiveConversionData"

    invoke-static {p1, v1, v0}, Lcom/unity3d/player/UnityPlayer;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onInstallConversionFailure(Ljava/lang/String;)V
    .locals 2

    .line 25
    iget-object v0, p0, Lcom/appsflyer/AppsFlyerUnityHelper$1;->val$callbackObjectName:Ljava/lang/String;

    const-string v1, "didReceiveConversionDataWithError"

    invoke-static {v0, v1, p1}, Lcom/unity3d/player/UnityPlayer;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
