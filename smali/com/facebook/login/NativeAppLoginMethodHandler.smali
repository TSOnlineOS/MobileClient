.class abstract Lcom/facebook/login/NativeAppLoginMethodHandler;
.super Lcom/facebook/login/LoginMethodHandler;
.source "NativeAppLoginMethodHandler.java"


# direct methods
.method constructor <init>(Landroid/os/Parcel;)V
    .locals 0

    .line 47
    invoke-direct {p0, p1}, Lcom/facebook/login/LoginMethodHandler;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method constructor <init>(Lcom/facebook/login/LoginClient;)V
    .locals 0

    .line 43
    invoke-direct {p0, p1}, Lcom/facebook/login/LoginMethodHandler;-><init>(Lcom/facebook/login/LoginClient;)V

    return-void
.end method

.method private completeLogin(Lcom/facebook/login/LoginClient$Result;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 98
    iget-object v0, p0, Lcom/facebook/login/NativeAppLoginMethodHandler;->loginClient:Lcom/facebook/login/LoginClient;

    invoke-virtual {v0, p1}, Lcom/facebook/login/LoginClient;->completeAndValidate(Lcom/facebook/login/LoginClient$Result;)V

    goto :goto_0

    .line 100
    :cond_0
    iget-object p1, p0, Lcom/facebook/login/NativeAppLoginMethodHandler;->loginClient:Lcom/facebook/login/LoginClient;

    invoke-virtual {p1}, Lcom/facebook/login/LoginClient;->tryNextHandler()V

    :goto_0
    return-void
.end method


# virtual methods
.method protected getError(Landroid/os/Bundle;)Ljava/lang/String;
    .locals 1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    const-string v0, "error"

    .line 156
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    const-string v0, "error_type"

    .line 158
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_1
    return-object v0
.end method

.method protected getErrorMessage(Landroid/os/Bundle;)Ljava/lang/String;
    .locals 1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    const-string v0, "error_message"

    .line 167
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    const-string v0, "error_description"

    .line 169
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_1
    return-object v0
.end method

.method public getTokenSource()Lcom/facebook/AccessTokenSource;
    .locals 1

    .line 53
    sget-object v0, Lcom/facebook/AccessTokenSource;->FACEBOOK_APPLICATION_WEB:Lcom/facebook/AccessTokenSource;

    return-object v0
.end method

.method protected handleResultCancel(Lcom/facebook/login/LoginClient$Request;Landroid/content/Intent;)V
    .locals 3

    .line 136
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p2

    .line 137
    invoke-virtual {p0, p2}, Lcom/facebook/login/NativeAppLoginMethodHandler;->getError(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "error_code"

    .line 139
    invoke-virtual {p2, v1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {p2, v1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 144
    :goto_0
    invoke-static {}, Lcom/facebook/internal/ServerProtocol;->getErrorConnectionFailure()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 145
    invoke-virtual {p0, p2}, Lcom/facebook/login/NativeAppLoginMethodHandler;->getErrorMessage(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object p2

    .line 146
    invoke-static {p1, v0, p2, v1}, Lcom/facebook/login/LoginClient$Result;->createErrorResult(Lcom/facebook/login/LoginClient$Request;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/facebook/login/LoginClient$Result;

    move-result-object p2

    invoke-direct {p0, p2}, Lcom/facebook/login/NativeAppLoginMethodHandler;->completeLogin(Lcom/facebook/login/LoginClient$Result;)V

    .line 149
    :cond_1
    invoke-static {p1, v0}, Lcom/facebook/login/LoginClient$Result;->createCancelResult(Lcom/facebook/login/LoginClient$Request;Ljava/lang/String;)Lcom/facebook/login/LoginClient$Result;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/facebook/login/NativeAppLoginMethodHandler;->completeLogin(Lcom/facebook/login/LoginClient$Result;)V

    return-void
.end method

.method protected handleResultError(Lcom/facebook/login/LoginClient$Request;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    const-string v1, "logged_out"

    .line 109
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 p1, 0x1

    .line 110
    sput-boolean p1, Lcom/facebook/login/CustomTabLoginMethodHandler;->calledThroughLoggedOutAppSwitch:Z

    .line 111
    invoke-direct {p0, v0}, Lcom/facebook/login/NativeAppLoginMethodHandler;->completeLogin(Lcom/facebook/login/LoginClient$Result;)V

    goto :goto_0

    .line 112
    :cond_0
    invoke-static {}, Lcom/facebook/internal/ServerProtocol;->getErrorsProxyAuthDisabled()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1, p2}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 113
    invoke-direct {p0, v0}, Lcom/facebook/login/NativeAppLoginMethodHandler;->completeLogin(Lcom/facebook/login/LoginClient$Result;)V

    goto :goto_0

    .line 114
    :cond_1
    invoke-static {}, Lcom/facebook/internal/ServerProtocol;->getErrorsUserCanceled()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1, p2}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 115
    invoke-static {p1, v0}, Lcom/facebook/login/LoginClient$Result;->createCancelResult(Lcom/facebook/login/LoginClient$Request;Ljava/lang/String;)Lcom/facebook/login/LoginClient$Result;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/facebook/login/NativeAppLoginMethodHandler;->completeLogin(Lcom/facebook/login/LoginClient$Result;)V

    goto :goto_0

    .line 117
    :cond_2
    invoke-static {p1, p2, p3, p4}, Lcom/facebook/login/LoginClient$Result;->createErrorResult(Lcom/facebook/login/LoginClient$Request;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/facebook/login/LoginClient$Result;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/facebook/login/NativeAppLoginMethodHandler;->completeLogin(Lcom/facebook/login/LoginClient$Result;)V

    :goto_0
    return-void
.end method

.method protected handleResultOk(Lcom/facebook/login/LoginClient$Request;Landroid/os/Bundle;)V
    .locals 3

    .line 125
    :try_start_0
    invoke-virtual {p1}, Lcom/facebook/login/LoginClient$Request;->getPermissions()Ljava/util/Set;

    move-result-object v0

    invoke-virtual {p0}, Lcom/facebook/login/NativeAppLoginMethodHandler;->getTokenSource()Lcom/facebook/AccessTokenSource;

    move-result-object v1

    invoke-virtual {p1}, Lcom/facebook/login/LoginClient$Request;->getApplicationId()Ljava/lang/String;

    move-result-object v2

    .line 124
    invoke-static {v0, p2, v1, v2}, Lcom/facebook/login/NativeAppLoginMethodHandler;->createAccessTokenFromWebBundle(Ljava/util/Collection;Landroid/os/Bundle;Lcom/facebook/AccessTokenSource;Ljava/lang/String;)Lcom/facebook/AccessToken;

    move-result-object v0

    .line 127
    invoke-virtual {p1}, Lcom/facebook/login/LoginClient$Request;->getNonce()Ljava/lang/String;

    move-result-object v1

    invoke-static {p2, v1}, Lcom/facebook/login/NativeAppLoginMethodHandler;->createAuthenticationTokenFromWebBundle(Landroid/os/Bundle;Ljava/lang/String;)Lcom/facebook/AuthenticationToken;

    move-result-object p2

    .line 129
    invoke-static {p1, v0, p2}, Lcom/facebook/login/LoginClient$Result;->createCompositeTokenResult(Lcom/facebook/login/LoginClient$Request;Lcom/facebook/AccessToken;Lcom/facebook/AuthenticationToken;)Lcom/facebook/login/LoginClient$Result;

    move-result-object p2

    .line 128
    invoke-direct {p0, p2}, Lcom/facebook/login/NativeAppLoginMethodHandler;->completeLogin(Lcom/facebook/login/LoginClient$Result;)V
    :try_end_0
    .catch Lcom/facebook/FacebookException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p2

    const/4 v0, 0x0

    .line 131
    invoke-virtual {p2}, Lcom/facebook/FacebookException;->getMessage()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, v0, p2}, Lcom/facebook/login/LoginClient$Result;->createErrorResult(Lcom/facebook/login/LoginClient$Request;Ljava/lang/String;Ljava/lang/String;)Lcom/facebook/login/LoginClient$Result;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/facebook/login/NativeAppLoginMethodHandler;->completeLogin(Lcom/facebook/login/LoginClient$Result;)V

    :goto_0
    return-void
.end method

.method onActivityResult(IILandroid/content/Intent;)Z
    .locals 5

    .line 58
    iget-object p1, p0, Lcom/facebook/login/NativeAppLoginMethodHandler;->loginClient:Lcom/facebook/login/LoginClient;

    invoke-virtual {p1}, Lcom/facebook/login/LoginClient;->getPendingRequest()Lcom/facebook/login/LoginClient$Request;

    move-result-object p1

    const/4 v0, 0x1

    if-nez p3, :cond_0

    const-string p2, "Operation canceled"

    .line 62
    invoke-static {p1, p2}, Lcom/facebook/login/LoginClient$Result;->createCancelResult(Lcom/facebook/login/LoginClient$Request;Ljava/lang/String;)Lcom/facebook/login/LoginClient$Result;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/facebook/login/NativeAppLoginMethodHandler;->completeLogin(Lcom/facebook/login/LoginClient$Result;)V

    goto :goto_0

    :cond_0
    if-nez p2, :cond_1

    .line 64
    invoke-virtual {p0, p1, p3}, Lcom/facebook/login/NativeAppLoginMethodHandler;->handleResultCancel(Lcom/facebook/login/LoginClient$Request;Landroid/content/Intent;)V

    goto :goto_0

    :cond_1
    const/4 v1, -0x1

    const/4 v2, 0x0

    if-eq p2, v1, :cond_2

    const-string p2, "Unexpected resultCode from authorization."

    .line 67
    invoke-static {p1, p2, v2}, Lcom/facebook/login/LoginClient$Result;->createErrorResult(Lcom/facebook/login/LoginClient$Request;Ljava/lang/String;Ljava/lang/String;)Lcom/facebook/login/LoginClient$Result;

    move-result-object p1

    .line 66
    invoke-direct {p0, p1}, Lcom/facebook/login/NativeAppLoginMethodHandler;->completeLogin(Lcom/facebook/login/LoginClient$Result;)V

    goto :goto_0

    .line 70
    :cond_2
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p2

    if-nez p2, :cond_3

    const-string p2, "Unexpected null from returned authorization data."

    .line 73
    invoke-static {p1, p2, v2}, Lcom/facebook/login/LoginClient$Result;->createErrorResult(Lcom/facebook/login/LoginClient$Request;Ljava/lang/String;Ljava/lang/String;)Lcom/facebook/login/LoginClient$Result;

    move-result-object p1

    .line 72
    invoke-direct {p0, p1}, Lcom/facebook/login/NativeAppLoginMethodHandler;->completeLogin(Lcom/facebook/login/LoginClient$Result;)V

    return v0

    .line 78
    :cond_3
    invoke-virtual {p0, p2}, Lcom/facebook/login/NativeAppLoginMethodHandler;->getError(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object p3

    const-string v1, "error_code"

    .line 80
    invoke-virtual {p2, v1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_4

    invoke-virtual {p2, v1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 81
    :cond_4
    invoke-virtual {p0, p2}, Lcom/facebook/login/NativeAppLoginMethodHandler;->getErrorMessage(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    const-string v3, "e2e"

    .line 83
    invoke-virtual {p2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 84
    invoke-static {v3}, Lcom/facebook/internal/Utility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_5

    .line 85
    invoke-virtual {p0, v3}, Lcom/facebook/login/NativeAppLoginMethodHandler;->logWebLoginCompleted(Ljava/lang/String;)V

    :cond_5
    if-nez p3, :cond_6

    if-nez v2, :cond_6

    if-nez v1, :cond_6

    .line 88
    invoke-virtual {p0, p1, p2}, Lcom/facebook/login/NativeAppLoginMethodHandler;->handleResultOk(Lcom/facebook/login/LoginClient$Request;Landroid/os/Bundle;)V

    goto :goto_0

    .line 90
    :cond_6
    invoke-virtual {p0, p1, p3, v1, v2}, Lcom/facebook/login/NativeAppLoginMethodHandler;->handleResultError(Lcom/facebook/login/LoginClient$Request;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return v0
.end method

.method abstract tryAuthorize(Lcom/facebook/login/LoginClient$Request;)I
.end method

.method protected tryIntent(Landroid/content/Intent;I)Z
    .locals 2

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 180
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/facebook/login/NativeAppLoginMethodHandler;->loginClient:Lcom/facebook/login/LoginClient;

    invoke-virtual {v1}, Lcom/facebook/login/LoginClient;->getFragment()Landroidx/fragment/app/Fragment;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p1, 0x1

    return p1

    :catch_0
    return v0
.end method
