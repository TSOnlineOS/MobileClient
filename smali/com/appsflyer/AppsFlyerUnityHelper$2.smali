.class final Lcom/appsflyer/AppsFlyerUnityHelper$2;
.super Ljava/lang/Object;
.source "AppsFlyerUnityHelper.java"

# interfaces
.implements Lcom/appsflyer/AppsFlyerInAppPurchaseValidatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/appsflyer/AppsFlyerUnityHelper;->createValidateInAppListener(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$callbackMethodFailedName:Ljava/lang/String;

.field final synthetic val$callbackMethodName:Ljava/lang/String;

.field final synthetic val$callbackObjectName:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 45
    iput-object p1, p0, Lcom/appsflyer/AppsFlyerUnityHelper$2;->val$callbackObjectName:Ljava/lang/String;

    iput-object p2, p0, Lcom/appsflyer/AppsFlyerUnityHelper$2;->val$callbackMethodName:Ljava/lang/String;

    iput-object p3, p0, Lcom/appsflyer/AppsFlyerUnityHelper$2;->val$callbackMethodFailedName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onValidateInApp()V
    .locals 3

    const-string v0, "AppsFlyerLibUnityhelper"

    const-string v1, "onValidateInApp called."

    .line 47
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    iget-object v0, p0, Lcom/appsflyer/AppsFlyerUnityHelper$2;->val$callbackObjectName:Ljava/lang/String;

    iget-object v1, p0, Lcom/appsflyer/AppsFlyerUnityHelper$2;->val$callbackMethodName:Ljava/lang/String;

    const-string v2, "Validate success"

    invoke-static {v0, v1, v2}, Lcom/unity3d/player/UnityPlayer;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onValidateInAppFailure(Ljava/lang/String;)V
    .locals 2

    const-string v0, "AppsFlyerLibUnityhelper"

    const-string v1, "onValidateInAppFailure called."

    .line 52
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    iget-object v0, p0, Lcom/appsflyer/AppsFlyerUnityHelper$2;->val$callbackObjectName:Ljava/lang/String;

    iget-object v1, p0, Lcom/appsflyer/AppsFlyerUnityHelper$2;->val$callbackMethodFailedName:Ljava/lang/String;

    invoke-static {v0, v1, p1}, Lcom/unity3d/player/UnityPlayer;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
