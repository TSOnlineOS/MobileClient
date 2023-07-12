.class public Lcom/appsflyer/AppsFlyerUnityHelper;
.super Ljava/lang/Object;
.source "AppsFlyerUnityHelper.java"


# static fields
.field private static TAG:Ljava/lang/String; = "AppsFlyerUnityHelper"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createConversionDataListener(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    .line 17
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v0

    new-instance v1, Lcom/appsflyer/AppsFlyerUnityHelper$1;

    invoke-direct {v1, p1}, Lcom/appsflyer/AppsFlyerUnityHelper$1;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0, v1}, Lcom/appsflyer/AppsFlyerLib;->registerConversionListener(Landroid/content/Context;Lcom/appsflyer/AppsFlyerConversionListener;)V

    return-void
.end method

.method public static createValidateInAppListener(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 45
    new-instance v0, Lcom/appsflyer/AppsFlyerUnityHelper$2;

    invoke-direct {v0, p1, p2, p3}, Lcom/appsflyer/AppsFlyerUnityHelper$2;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object p1

    invoke-virtual {p1, p0, v0}, Lcom/appsflyer/AppsFlyerLib;->registerValidatorListener(Landroid/content/Context;Lcom/appsflyer/AppsFlyerInAppPurchaseValidatorListener;)V

    return-void
.end method
