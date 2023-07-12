.class final Lcom/facebook/unity/FB$4;
.super Ljava/lang/Object;
.source "FB.java"

# interfaces
.implements Lcom/facebook/AccessToken$AccessTokenRefreshCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/unity/FB;->RefreshCurrentAccessToken(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$unityMessage:Lcom/facebook/unity/UnityMessage;


# direct methods
.method constructor <init>(Lcom/facebook/unity/UnityMessage;)V
    .locals 0

    .line 511
    iput-object p1, p0, Lcom/facebook/unity/FB$4;->val$unityMessage:Lcom/facebook/unity/UnityMessage;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public OnTokenRefreshFailed(Lcom/facebook/FacebookException;)V
    .locals 1

    .line 520
    iget-object v0, p0, Lcom/facebook/unity/FB$4;->val$unityMessage:Lcom/facebook/unity/UnityMessage;

    invoke-virtual {p1}, Lcom/facebook/FacebookException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/facebook/unity/UnityMessage;->sendError(Ljava/lang/String;)V

    return-void
.end method

.method public OnTokenRefreshed(Lcom/facebook/AccessToken;)V
    .locals 2

    .line 514
    iget-object v0, p0, Lcom/facebook/unity/FB$4;->val$unityMessage:Lcom/facebook/unity/UnityMessage;

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Lcom/facebook/unity/FBLogin;->addLoginParametersToMessage(Lcom/facebook/unity/UnityMessage;Lcom/facebook/AccessToken;Ljava/lang/String;)V

    .line 515
    iget-object p1, p0, Lcom/facebook/unity/FB$4;->val$unityMessage:Lcom/facebook/unity/UnityMessage;

    invoke-virtual {p1}, Lcom/facebook/unity/UnityMessage;->send()V

    return-void
.end method
