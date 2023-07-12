.class Lcom/onevcat/uniwebview/UniWebViewClient;
.super Landroid/webkit/WebViewClient;
.source "UniWebViewClient.java"


# instance fields
.field private dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

.field private httpStatusCode:I

.field private loadingSuccess:Z

.field private sslErrored:Z

.field private userStopped:Z


# direct methods
.method constructor <init>(Lcom/onevcat/uniwebview/UniWebViewDialog;)V
    .locals 1

    .line 36
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    const/16 v0, 0xc8

    .line 34
    iput v0, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->httpStatusCode:I

    .line 37
    iput-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    return-void
.end method

.method private showHttpAuthDialog(Landroid/webkit/WebView;Landroid/webkit/HttpAuthHandler;Ljava/lang/String;Ljava/lang/String;)V
    .locals 10

    .line 169
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    invoke-virtual {v0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 170
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 172
    new-instance v4, Landroid/widget/EditText;

    invoke-direct {v4, v0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    const-string v2, "User Name"

    .line 173
    invoke-virtual {v4, v2}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 175
    new-instance v5, Landroid/widget/EditText;

    invoke-direct {v5, v0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    const-string v2, "Password"

    .line 176
    invoke-virtual {v5, v2}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 177
    invoke-static {}, Landroid/text/method/PasswordTransformationMethod;->getInstance()Landroid/text/method/PasswordTransformationMethod;

    move-result-object v2

    invoke-virtual {v5, v2}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    const/4 v2, 0x1

    .line 179
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 181
    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 182
    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 184
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v0, "Authorization Required"

    .line 185
    invoke-virtual {v2, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 186
    invoke-virtual {v0, p3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 187
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/4 v1, 0x0

    .line 188
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/onevcat/uniwebview/UniWebViewClient$2;

    move-object v2, v1

    move-object v3, p0

    move-object v6, p1

    move-object v7, p3

    move-object v8, p4

    move-object v9, p2

    invoke-direct/range {v2 .. v9}, Lcom/onevcat/uniwebview/UniWebViewClient$2;-><init>(Lcom/onevcat/uniwebview/UniWebViewClient;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/HttpAuthHandler;)V

    const-string p1, "OK"

    .line 189
    invoke-virtual {v0, p1, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance p3, Lcom/onevcat/uniwebview/UniWebViewClient$1;

    invoke-direct {p3, p0, p2}, Lcom/onevcat/uniwebview/UniWebViewClient$1;-><init>(Lcom/onevcat/uniwebview/UniWebViewClient;Landroid/webkit/HttpAuthHandler;)V

    const-string p2, "Cancel"

    .line 199
    invoke-virtual {p1, p2, p3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 204
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog;->show()V

    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 3

    .line 61
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 63
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->setLoading(Z)V

    .line 65
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    invoke-virtual {p1}, Lcom/onevcat/uniwebview/UniWebViewDialog;->hideSpinner()V

    .line 66
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    invoke-virtual {p1}, Lcom/onevcat/uniwebview/UniWebViewDialog;->hideSystemUI()V

    .line 68
    iget-boolean p1, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->loadingSuccess:Z

    if-eqz p1, :cond_2

    .line 69
    iget-boolean p1, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->sslErrored:Z

    const-string v0, " Error Code: "

    const-string v1, "WebClient onReceivedError for url: "

    if-eqz p1, :cond_0

    .line 70
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object p1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v0, -0x4b2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " Error: ssl error"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/onevcat/uniwebview/Logger;->critical(Ljava/lang/String;)V

    .line 71
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    iget-object p1, p1, Lcom/onevcat/uniwebview/UniWebViewDialog;->listener:Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;

    iget-object v1, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    const-string v2, "ssl error"

    invoke-interface {p1, v1, v0, v2, p2}, Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;->onReceivedError(Lcom/onevcat/uniwebview/UniWebViewDialog;ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 72
    :cond_0
    iget-boolean p1, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->userStopped:Z

    if-eqz p1, :cond_1

    .line 73
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object p1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v0, 0x3e7

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " Error: Operation cancelled."

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/onevcat/uniwebview/Logger;->critical(Ljava/lang/String;)V

    .line 74
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    iget-object p1, p1, Lcom/onevcat/uniwebview/UniWebViewDialog;->listener:Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;

    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    const/16 v1, -0x3e7

    const-string v2, "Operation cancelled."

    invoke-interface {p1, v0, v1, v2, p2}, Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;->onReceivedError(Lcom/onevcat/uniwebview/UniWebViewDialog;ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 76
    :cond_1
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "WebClient onPageFinished: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ". Status Code:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->httpStatusCode:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " Loading success: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->loadingSuccess:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 77
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    iget-object p1, p1, Lcom/onevcat/uniwebview/UniWebViewDialog;->listener:Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;

    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    iget v1, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->httpStatusCode:I

    invoke-interface {p1, v0, v1, p2}, Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;->onPageFinished(Lcom/onevcat/uniwebview/UniWebViewDialog;ILjava/lang/String;)V

    :cond_2
    :goto_0
    return-void
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 1

    .line 42
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 43
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object p1

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "WebClient onPageStarted: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 45
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    const/4 p3, 0x1

    invoke-virtual {p1, p3}, Lcom/onevcat/uniwebview/UniWebViewDialog;->setLoading(Z)V

    .line 47
    iput-boolean p3, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->loadingSuccess:Z

    const/4 p1, 0x0

    .line 48
    iput-boolean p1, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->userStopped:Z

    .line 49
    iput-boolean p1, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->sslErrored:Z

    const/16 p1, 0xc8

    .line 50
    iput p1, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->httpStatusCode:I

    .line 52
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    invoke-virtual {p1}, Lcom/onevcat/uniwebview/UniWebViewDialog;->isShowSpinnerWhileLoading()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    invoke-virtual {p1}, Lcom/onevcat/uniwebview/UniWebViewDialog;->isShowing()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 53
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    invoke-virtual {p1}, Lcom/onevcat/uniwebview/UniWebViewDialog;->showSpinner()V

    .line 55
    :cond_0
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    invoke-virtual {p1}, Lcom/onevcat/uniwebview/UniWebViewDialog;->hideSystemUI()V

    .line 56
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    iget-object p1, p1, Lcom/onevcat/uniwebview/UniWebViewDialog;->listener:Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;

    iget-object p3, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    invoke-interface {p1, p3, p2}, Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;->onPageStarted(Lcom/onevcat/uniwebview/UniWebViewDialog;Ljava/lang/String;)V

    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 92
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    .line 93
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "WebClient onReceivedError for url: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " Error Code: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " Error: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/onevcat/uniwebview/Logger;->critical(Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 95
    iput-boolean p1, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->loadingSuccess:Z

    .line 97
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    invoke-virtual {p1}, Lcom/onevcat/uniwebview/UniWebViewDialog;->hideSpinner()V

    .line 98
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    invoke-virtual {p1}, Lcom/onevcat/uniwebview/UniWebViewDialog;->hideSystemUI()V

    .line 100
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    iget-object p1, p1, Lcom/onevcat/uniwebview/UniWebViewDialog;->listener:Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;

    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    invoke-interface {p1, v0, p2, p3, p4}, Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;->onReceivedError(Lcom/onevcat/uniwebview/UniWebViewDialog;ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onReceivedHttpAuthRequest(Landroid/webkit/WebView;Landroid/webkit/HttpAuthHandler;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 149
    invoke-virtual {p2}, Landroid/webkit/HttpAuthHandler;->useHttpAuthUsernamePassword()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    .line 150
    invoke-virtual {p1, p3, p4}, Landroid/webkit/WebView;->getHttpAuthUsernamePassword(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 151
    array-length v2, v0

    const/4 v3, 0x2

    if-ne v2, v3, :cond_0

    const/4 v1, 0x0

    .line 152
    aget-object v1, v0, v1

    const/4 v2, 0x1

    .line 153
    aget-object v0, v0, v2

    goto :goto_0

    :cond_0
    move-object v0, v1

    :goto_0
    if-eqz v1, :cond_1

    if-eqz v0, :cond_1

    .line 158
    invoke-virtual {p2, v1, v0}, Landroid/webkit/HttpAuthHandler;->proceed(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 160
    :cond_1
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    invoke-virtual {v0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getShowHTTPAuthPopUpWindow()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 161
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/onevcat/uniwebview/UniWebViewClient;->showHttpAuthDialog(Landroid/webkit/WebView;Landroid/webkit/HttpAuthHandler;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 163
    :cond_2
    invoke-virtual {p2}, Landroid/webkit/HttpAuthHandler;->cancel()V

    :goto_1
    return-void
.end method

.method public onReceivedHttpError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceResponse;)V
    .locals 0

    .line 84
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->isForMainFrame()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 85
    invoke-virtual {p3}, Landroid/webkit/WebResourceResponse;->getStatusCode()I

    move-result p1

    iput p1, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->httpStatusCode:I

    :cond_0
    return-void
.end method

.method public onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V
    .locals 4

    .line 123
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "WebClient onReceivedSslError. Error url: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Landroid/net/http/SslError;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " Error type: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Landroid/net/http/SslError;->getPrimaryError()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/onevcat/uniwebview/Logger;->critical(Ljava/lang/String;)V

    const/4 p1, 0x1

    .line 126
    :try_start_0
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v1, "Trying to process SSL error..."

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->verbose(Ljava/lang/String;)V

    .line 127
    new-instance v0, Ljava/net/URL;

    invoke-virtual {p3}, Landroid/net/http/SslError;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 128
    invoke-virtual {v0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v0

    .line 129
    iget-object v1, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    invoke-virtual {v1}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getSslExceptionDomains()Ljava/util/HashSet;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 130
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Found domain \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\' in sslExceptionDomains, proceeding url..."

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/onevcat/uniwebview/Logger;->verbose(Ljava/lang/String;)V

    .line 131
    invoke-virtual {p2}, Landroid/webkit/SslErrorHandler;->proceed()V

    goto :goto_0

    .line 133
    :cond_0
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Domain \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\' is not in exception. Refuse proceeding url."

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/onevcat/uniwebview/Logger;->verbose(Ljava/lang/String;)V

    .line 134
    iput-boolean p1, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->sslErrored:Z

    .line 135
    invoke-virtual {p2}, Landroid/webkit/SslErrorHandler;->cancel()V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 138
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Url \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Landroid/net/http/SslError;->getUrl()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, "\' is malformed. Refuse proceeding url. Exception: "

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v1, p3}, Lcom/onevcat/uniwebview/Logger;->verbose(Ljava/lang/String;)V

    .line 139
    iput-boolean p1, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->sslErrored:Z

    .line 140
    invoke-virtual {p2}, Landroid/webkit/SslErrorHandler;->cancel()V

    :goto_0
    return-void
.end method

.method public setUserStopped(Z)V
    .locals 0

    .line 208
    iput-boolean p1, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->userStopped:Z

    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 3

    .line 106
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "WebClient shouldOverrideUrlLoading: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 107
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    iget-object v0, v0, Lcom/onevcat/uniwebview/UniWebViewDialog;->listener:Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;

    iget-object v1, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    invoke-interface {v0, v1, p2}, Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;->shouldOverrideUrlLoading(Lcom/onevcat/uniwebview/UniWebViewDialog;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "file://"

    .line 110
    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 111
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object p1

    const-string p2, "Loading a local file. The local file loading will never be overridden."

    invoke-virtual {p1, p2}, Lcom/onevcat/uniwebview/Logger;->debug(Ljava/lang/String;)V

    const/4 p1, 0x0

    return p1

    .line 115
    :cond_0
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Adding customized header to request. "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    invoke-virtual {v2}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getHeaders()Ljava/util/HashMap;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/HashMap;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->debug(Ljava/lang/String;)V

    .line 116
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewClient;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    invoke-virtual {v0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getHeaders()Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    :cond_1
    const/4 p1, 0x1

    return p1
.end method
