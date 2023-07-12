.class Lcom/onevcat/uniwebview/UniWebViewInterface$2$1;
.super Ljava/lang/Object;
.source "UniWebViewInterface.java"

# interfaces
.implements Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/onevcat/uniwebview/UniWebViewInterface$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/onevcat/uniwebview/UniWebViewInterface$2;


# direct methods
.method constructor <init>(Lcom/onevcat/uniwebview/UniWebViewInterface$2;)V
    .locals 0

    .line 52
    iput-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$2$1;->this$0:Lcom/onevcat/uniwebview/UniWebViewInterface$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAddJavaScriptFinished(Lcom/onevcat/uniwebview/UniWebViewDialog;Ljava/lang/String;)V
    .locals 2

    .line 103
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object p1

    const-string v0, "onAddJavaScriptFinished"

    invoke-virtual {p1, v0}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 104
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "js result: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/onevcat/uniwebview/Logger;->debug(Ljava/lang/String;)V

    .line 105
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$2$1;->this$0:Lcom/onevcat/uniwebview/UniWebViewInterface$2;

    iget-object p1, p1, Lcom/onevcat/uniwebview/UniWebViewInterface$2;->val$name:Ljava/lang/String;

    const-string v0, "AddJavaScriptFinished"

    invoke-static {p1, v0, p2}, Lcom/onevcat/uniwebview/UniWebViewInterface;->access$000(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onAnimationFinished(Lcom/onevcat/uniwebview/UniWebViewDialog;Ljava/lang/String;)V
    .locals 2

    .line 117
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onAnimationFinished, animation id: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 118
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$2$1;->this$0:Lcom/onevcat/uniwebview/UniWebViewInterface$2;

    iget-object p1, p1, Lcom/onevcat/uniwebview/UniWebViewInterface$2;->val$name:Ljava/lang/String;

    const-string v0, "AnimateToFinished"

    invoke-static {p1, v0, p2}, Lcom/onevcat/uniwebview/UniWebViewInterface;->access$000(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onDialogClose(Lcom/onevcat/uniwebview/UniWebViewDialog;)V
    .locals 1

    .line 97
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object p1

    const-string v0, "onDialogClose"

    invoke-virtual {p1, v0}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 98
    invoke-static {}, Lcom/onevcat/uniwebview/UniWebViewManager;->getInstance()Lcom/onevcat/uniwebview/UniWebViewManager;

    move-result-object p1

    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$2$1;->this$0:Lcom/onevcat/uniwebview/UniWebViewInterface$2;

    iget-object v0, v0, Lcom/onevcat/uniwebview/UniWebViewInterface$2;->val$name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/onevcat/uniwebview/UniWebViewManager;->removeUniWebView(Ljava/lang/String;)V

    return-void
.end method

.method public onDialogClosedByBackButton(Lcom/onevcat/uniwebview/UniWebViewDialog;)V
    .locals 2

    .line 85
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object p1

    const-string v0, "onDialogClosedByBackButton"

    invoke-virtual {p1, v0}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 86
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$2$1;->this$0:Lcom/onevcat/uniwebview/UniWebViewInterface$2;

    iget-object p1, p1, Lcom/onevcat/uniwebview/UniWebViewInterface$2;->val$name:Ljava/lang/String;

    const-string v0, "WebViewDone"

    const-string v1, ""

    invoke-static {p1, v0, v1}, Lcom/onevcat/uniwebview/UniWebViewInterface;->access$000(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onDialogKeyDown(Lcom/onevcat/uniwebview/UniWebViewDialog;I)V
    .locals 2

    .line 91
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onDialogKeyDown, key: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 92
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$2$1;->this$0:Lcom/onevcat/uniwebview/UniWebViewInterface$2;

    iget-object p1, p1, Lcom/onevcat/uniwebview/UniWebViewInterface$2;->val$name:Ljava/lang/String;

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p2

    const-string v0, "WebViewKeyDown"

    invoke-static {p1, v0, p2}, Lcom/onevcat/uniwebview/UniWebViewInterface;->access$000(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onHideTransitionFinished(Lcom/onevcat/uniwebview/UniWebViewDialog;Ljava/lang/String;)V
    .locals 1

    .line 129
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object p1

    const-string v0, "onHideTransitionFinished"

    invoke-virtual {p1, v0}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 130
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$2$1;->this$0:Lcom/onevcat/uniwebview/UniWebViewInterface$2;

    iget-object p1, p1, Lcom/onevcat/uniwebview/UniWebViewInterface$2;->val$name:Ljava/lang/String;

    const-string v0, "HideTransitionFinished"

    invoke-static {p1, v0, p2}, Lcom/onevcat/uniwebview/UniWebViewInterface;->access$000(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onJavaScriptFinished(Lcom/onevcat/uniwebview/UniWebViewDialog;Ljava/lang/String;)V
    .locals 2

    .line 110
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object p1

    const-string v0, "onEvalJavaScriptFinished"

    invoke-virtual {p1, v0}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 111
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "js result: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/onevcat/uniwebview/Logger;->debug(Ljava/lang/String;)V

    .line 112
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$2$1;->this$0:Lcom/onevcat/uniwebview/UniWebViewInterface$2;

    iget-object p1, p1, Lcom/onevcat/uniwebview/UniWebViewInterface$2;->val$name:Ljava/lang/String;

    const-string v0, "EvalJavaScriptFinished"

    invoke-static {p1, v0, p2}, Lcom/onevcat/uniwebview/UniWebViewInterface;->access$000(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onPageFinished(Lcom/onevcat/uniwebview/UniWebViewDialog;ILjava/lang/String;)V
    .locals 2

    .line 55
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onPageFinished: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 56
    new-instance p1, Lcom/onevcat/uniwebview/UniWebViewResultPayload;

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p2

    const-string v0, ""

    invoke-direct {p1, v0, p2, p3}, Lcom/onevcat/uniwebview/UniWebViewResultPayload;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    iget-object p2, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$2$1;->this$0:Lcom/onevcat/uniwebview/UniWebViewInterface$2;

    iget-object p2, p2, Lcom/onevcat/uniwebview/UniWebViewInterface$2;->val$name:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/onevcat/uniwebview/UniWebViewResultPayload;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p3, "PageFinished"

    invoke-static {p2, p3, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface;->access$000(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onPageStarted(Lcom/onevcat/uniwebview/UniWebViewDialog;Ljava/lang/String;)V
    .locals 2

    .line 62
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onPageStarted: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 63
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$2$1;->this$0:Lcom/onevcat/uniwebview/UniWebViewInterface$2;

    iget-object p1, p1, Lcom/onevcat/uniwebview/UniWebViewInterface$2;->val$name:Ljava/lang/String;

    const-string v0, "PageStarted"

    invoke-static {p1, v0, p2}, Lcom/onevcat/uniwebview/UniWebViewInterface;->access$000(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onReceivedError(Lcom/onevcat/uniwebview/UniWebViewDialog;ILjava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 68
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onReceivedError: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, " Error Code: "

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p4, "Error Description: "

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p1, p4}, Lcom/onevcat/uniwebview/Logger;->critical(Ljava/lang/String;)V

    .line 69
    new-instance p1, Lcom/onevcat/uniwebview/UniWebViewResultPayload;

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p2

    const-string p4, ""

    invoke-direct {p1, p4, p2, p3}, Lcom/onevcat/uniwebview/UniWebViewResultPayload;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    iget-object p2, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$2$1;->this$0:Lcom/onevcat/uniwebview/UniWebViewInterface$2;

    iget-object p2, p2, Lcom/onevcat/uniwebview/UniWebViewInterface$2;->val$name:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/onevcat/uniwebview/UniWebViewResultPayload;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p3, "PageErrorReceived"

    invoke-static {p2, p3, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface;->access$000(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onSendMessageReceived(Lcom/onevcat/uniwebview/UniWebViewDialog;Ljava/lang/String;)V
    .locals 1

    .line 80
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$2$1;->this$0:Lcom/onevcat/uniwebview/UniWebViewInterface$2;

    iget-object p1, p1, Lcom/onevcat/uniwebview/UniWebViewInterface$2;->val$name:Ljava/lang/String;

    const-string v0, "MessageReceived"

    invoke-static {p1, v0, p2}, Lcom/onevcat/uniwebview/UniWebViewInterface;->access$000(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onShowTransitionFinished(Lcom/onevcat/uniwebview/UniWebViewDialog;Ljava/lang/String;)V
    .locals 1

    .line 123
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object p1

    const-string v0, "onShowTransitionFinished"

    invoke-virtual {p1, v0}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 124
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$2$1;->this$0:Lcom/onevcat/uniwebview/UniWebViewInterface$2;

    iget-object p1, p1, Lcom/onevcat/uniwebview/UniWebViewInterface$2;->val$name:Ljava/lang/String;

    const-string v0, "ShowTransitionFinished"

    invoke-static {p1, v0, p2}, Lcom/onevcat/uniwebview/UniWebViewInterface;->access$000(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public shouldOverrideUrlLoading(Lcom/onevcat/uniwebview/UniWebViewDialog;Ljava/lang/String;)Z
    .locals 1

    const/4 v0, 0x1

    .line 75
    invoke-virtual {p1, p2, v0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->shouldOverride(Ljava/lang/String;Z)Z

    move-result p1

    return p1
.end method
