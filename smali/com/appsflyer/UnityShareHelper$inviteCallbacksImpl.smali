.class Lcom/appsflyer/UnityShareHelper$inviteCallbacksImpl;
.super Ljava/lang/Object;
.source "UnityShareHelper.java"

# interfaces
.implements Lcom/appsflyer/CreateOneLinkHttpTask$ResponseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/appsflyer/UnityShareHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "inviteCallbacksImpl"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/appsflyer/UnityShareHelper;


# direct methods
.method private constructor <init>(Lcom/appsflyer/UnityShareHelper;)V
    .locals 0

    .line 105
    iput-object p1, p0, Lcom/appsflyer/UnityShareHelper$inviteCallbacksImpl;->this$0:Lcom/appsflyer/UnityShareHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/appsflyer/UnityShareHelper;Lcom/appsflyer/UnityShareHelper$1;)V
    .locals 0

    .line 105
    invoke-direct {p0, p1}, Lcom/appsflyer/UnityShareHelper$inviteCallbacksImpl;-><init>(Lcom/appsflyer/UnityShareHelper;)V

    return-void
.end method


# virtual methods
.method public onResponse(Ljava/lang/String;)V
    .locals 2

    const-string v0, "AppsFlyerLibUnityhelper"

    const-string v1, "CreateOneLinkHttpTask.ResponseListener called."

    .line 108
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    invoke-static {}, Lcom/appsflyer/UnityShareHelper;->access$100()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/appsflyer/UnityShareHelper;->access$200()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1}, Lcom/unity3d/player/UnityPlayer;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onResponseError(Ljava/lang/String;)V
    .locals 2

    const-string v0, "AppsFlyerLibUnityhelper"

    const-string v1, "onValidateInAppFailure called."

    .line 114
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    invoke-static {}, Lcom/appsflyer/UnityShareHelper;->access$100()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/appsflyer/UnityShareHelper;->access$300()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1}, Lcom/unity3d/player/UnityPlayer;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
