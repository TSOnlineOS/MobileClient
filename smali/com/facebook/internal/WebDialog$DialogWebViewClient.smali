.class Lcom/facebook/internal/WebDialog$DialogWebViewClient;
.super Landroid/webkit/WebViewClient;
.source "WebDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/internal/WebDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DialogWebViewClient"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/internal/WebDialog;


# direct methods
.method private constructor <init>(Lcom/facebook/internal/WebDialog;)V
    .locals 0

    .line 649
    iput-object p1, p0, Lcom/facebook/internal/WebDialog$DialogWebViewClient;->this$0:Lcom/facebook/internal/WebDialog;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/facebook/internal/WebDialog;Lcom/facebook/internal/WebDialog$1;)V
    .locals 0

    .line 649
    invoke-direct {p0, p1}, Lcom/facebook/internal/WebDialog$DialogWebViewClient;-><init>(Lcom/facebook/internal/WebDialog;)V

    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 0

    .line 743
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 744
    iget-object p1, p0, Lcom/facebook/internal/WebDialog$DialogWebViewClient;->this$0:Lcom/facebook/internal/WebDialog;

    invoke-static {p1}, Lcom/facebook/internal/WebDialog;->access$200(Lcom/facebook/internal/WebDialog;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 745
    iget-object p1, p0, Lcom/facebook/internal/WebDialog$DialogWebViewClient;->this$0:Lcom/facebook/internal/WebDialog;

    invoke-static {p1}, Lcom/facebook/internal/WebDialog;->access$300(Lcom/facebook/internal/WebDialog;)Landroid/app/ProgressDialog;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/ProgressDialog;->dismiss()V

    .line 751
    :cond_0
    iget-object p1, p0, Lcom/facebook/internal/WebDialog$DialogWebViewClient;->this$0:Lcom/facebook/internal/WebDialog;

    invoke-static {p1}, Lcom/facebook/internal/WebDialog;->access$400(Lcom/facebook/internal/WebDialog;)Landroid/widget/FrameLayout;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    .line 752
    iget-object p1, p0, Lcom/facebook/internal/WebDialog$DialogWebViewClient;->this$0:Lcom/facebook/internal/WebDialog;

    invoke-static {p1}, Lcom/facebook/internal/WebDialog;->access$500(Lcom/facebook/internal/WebDialog;)Landroid/webkit/WebView;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 753
    iget-object p1, p0, Lcom/facebook/internal/WebDialog$DialogWebViewClient;->this$0:Lcom/facebook/internal/WebDialog;

    invoke-static {p1}, Lcom/facebook/internal/WebDialog;->access$600(Lcom/facebook/internal/WebDialog;)Landroid/widget/ImageView;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 754
    iget-object p1, p0, Lcom/facebook/internal/WebDialog$DialogWebViewClient;->this$0:Lcom/facebook/internal/WebDialog;

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lcom/facebook/internal/WebDialog;->access$702(Lcom/facebook/internal/WebDialog;Z)Z

    return-void
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 2

    .line 734
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Webview loading URL: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FacebookSDK.WebDialog"

    invoke-static {v1, v0}, Lcom/facebook/internal/Utility;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 735
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 736
    iget-object p1, p0, Lcom/facebook/internal/WebDialog$DialogWebViewClient;->this$0:Lcom/facebook/internal/WebDialog;

    invoke-static {p1}, Lcom/facebook/internal/WebDialog;->access$200(Lcom/facebook/internal/WebDialog;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 737
    iget-object p1, p0, Lcom/facebook/internal/WebDialog$DialogWebViewClient;->this$0:Lcom/facebook/internal/WebDialog;

    invoke-static {p1}, Lcom/facebook/internal/WebDialog;->access$300(Lcom/facebook/internal/WebDialog;)Landroid/app/ProgressDialog;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/ProgressDialog;->show()V

    :cond_0
    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 716
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    .line 717
    iget-object p1, p0, Lcom/facebook/internal/WebDialog$DialogWebViewClient;->this$0:Lcom/facebook/internal/WebDialog;

    new-instance v0, Lcom/facebook/FacebookDialogException;

    invoke-direct {v0, p3, p2, p4}, Lcom/facebook/FacebookDialogException;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    invoke-virtual {p1, v0}, Lcom/facebook/internal/WebDialog;->sendErrorToListener(Ljava/lang/Throwable;)V

    return-void
.end method

.method public onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V
    .locals 1

    .line 725
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V

    .line 727
    invoke-virtual {p2}, Landroid/webkit/SslErrorHandler;->cancel()V

    .line 728
    iget-object p1, p0, Lcom/facebook/internal/WebDialog$DialogWebViewClient;->this$0:Lcom/facebook/internal/WebDialog;

    new-instance p2, Lcom/facebook/FacebookDialogException;

    const/4 p3, 0x0

    const/16 v0, -0xb

    invoke-direct {p2, p3, v0, p3}, Lcom/facebook/FacebookDialogException;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    invoke-virtual {p1, p2}, Lcom/facebook/internal/WebDialog;->sendErrorToListener(Ljava/lang/Throwable;)V

    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 5

    .line 652
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Redirect URL: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "FacebookSDK.WebDialog"

    invoke-static {v0, p1}, Lcom/facebook/internal/Utility;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 653
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    .line 655
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    .line 656
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    const-string v0, "^/(v\\d+\\.\\d+/)??dialog/.*"

    invoke-static {v0, p1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 658
    :goto_0
    iget-object v0, p0, Lcom/facebook/internal/WebDialog$DialogWebViewClient;->this$0:Lcom/facebook/internal/WebDialog;

    invoke-static {v0}, Lcom/facebook/internal/WebDialog;->access$100(Lcom/facebook/internal/WebDialog;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 659
    iget-object p1, p0, Lcom/facebook/internal/WebDialog$DialogWebViewClient;->this$0:Lcom/facebook/internal/WebDialog;

    invoke-virtual {p1, p2}, Lcom/facebook/internal/WebDialog;->parseResponseUri(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    const-string p2, "error"

    .line 661
    invoke-virtual {p1, p2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    if-nez p2, :cond_1

    const-string p2, "error_type"

    .line 663
    invoke-virtual {p1, p2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    :cond_1
    const-string v0, "error_msg"

    .line 666
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_2

    const-string v0, "error_message"

    .line 668
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_2
    if-nez v0, :cond_3

    const-string v0, "error_description"

    .line 671
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_3
    const-string v1, "error_code"

    .line 673
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 675
    invoke-static {v1}, Lcom/facebook/internal/Utility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    const/4 v4, -0x1

    if-nez v3, :cond_4

    .line 677
    :try_start_0
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    :cond_4
    const/4 v1, -0x1

    .line 683
    :goto_1
    invoke-static {p2}, Lcom/facebook/internal/Utility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 684
    invoke-static {v0}, Lcom/facebook/internal/Utility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    if-ne v1, v4, :cond_5

    .line 686
    iget-object p2, p0, Lcom/facebook/internal/WebDialog$DialogWebViewClient;->this$0:Lcom/facebook/internal/WebDialog;

    invoke-virtual {p2, p1}, Lcom/facebook/internal/WebDialog;->sendSuccessToListener(Landroid/os/Bundle;)V

    goto :goto_2

    :cond_5
    if-eqz p2, :cond_7

    const-string p1, "access_denied"

    .line 688
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_6

    const-string p1, "OAuthAccessDeniedException"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    .line 689
    :cond_6
    iget-object p1, p0, Lcom/facebook/internal/WebDialog$DialogWebViewClient;->this$0:Lcom/facebook/internal/WebDialog;

    invoke-virtual {p1}, Lcom/facebook/internal/WebDialog;->cancel()V

    goto :goto_2

    :cond_7
    const/16 p1, 0x1069

    if-ne v1, p1, :cond_8

    .line 691
    iget-object p1, p0, Lcom/facebook/internal/WebDialog$DialogWebViewClient;->this$0:Lcom/facebook/internal/WebDialog;

    invoke-virtual {p1}, Lcom/facebook/internal/WebDialog;->cancel()V

    goto :goto_2

    .line 693
    :cond_8
    new-instance p1, Lcom/facebook/FacebookRequestError;

    invoke-direct {p1, v1, p2, v0}, Lcom/facebook/FacebookRequestError;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 695
    iget-object p2, p0, Lcom/facebook/internal/WebDialog$DialogWebViewClient;->this$0:Lcom/facebook/internal/WebDialog;

    new-instance v1, Lcom/facebook/FacebookServiceException;

    invoke-direct {v1, p1, v0}, Lcom/facebook/FacebookServiceException;-><init>(Lcom/facebook/FacebookRequestError;Ljava/lang/String;)V

    invoke-virtual {p2, v1}, Lcom/facebook/internal/WebDialog;->sendErrorToListener(Ljava/lang/Throwable;)V

    :goto_2
    return v2

    :cond_9
    const-string v0, "fbconnect://cancel"

    .line 698
    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 699
    iget-object p1, p0, Lcom/facebook/internal/WebDialog$DialogWebViewClient;->this$0:Lcom/facebook/internal/WebDialog;

    invoke-virtual {p1}, Lcom/facebook/internal/WebDialog;->cancel()V

    return v2

    :cond_a
    if-nez p1, :cond_c

    const-string p1, "touch"

    .line 701
    invoke-virtual {p2, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_b

    goto :goto_3

    .line 706
    :cond_b
    :try_start_1
    iget-object p1, p0, Lcom/facebook/internal/WebDialog$DialogWebViewClient;->this$0:Lcom/facebook/internal/WebDialog;

    invoke-virtual {p1}, Lcom/facebook/internal/WebDialog;->getContext()Landroid/content/Context;

    move-result-object p1

    new-instance v0, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    invoke-direct {v0, v3, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Landroid/content/ActivityNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    return v2

    :catch_1
    :cond_c
    :goto_3
    return v1
.end method
