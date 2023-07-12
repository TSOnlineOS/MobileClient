.class Lcom/onevcat/uniwebview/UniWebViewDialog$5;
.super Ljava/lang/Object;
.source "UniWebViewDialog.java"

# interfaces
.implements Landroid/webkit/ValueCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/onevcat/uniwebview/UniWebViewDialog;->evaluateJavaScript(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/webkit/ValueCallback<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/onevcat/uniwebview/UniWebViewDialog;

.field final synthetic val$identifier:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/onevcat/uniwebview/UniWebViewDialog;Ljava/lang/String;)V
    .locals 0

    .line 495
    iput-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$5;->this$0:Lcom/onevcat/uniwebview/UniWebViewDialog;

    iput-object p2, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$5;->val$identifier:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onReceiveValue(Ljava/lang/Object;)V
    .locals 0

    .line 495
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/onevcat/uniwebview/UniWebViewDialog$5;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 3

    .line 498
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Receive a call back of evaluating js interface: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    const-string v0, "null"

    .line 499
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    const-string v1, "0"

    const-string v2, ""

    if-eqz v0, :cond_0

    .line 500
    new-instance p1, Lcom/onevcat/uniwebview/UniWebViewResultPayload;

    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$5;->val$identifier:Ljava/lang/String;

    invoke-direct {p1, v0, v1, v2}, Lcom/onevcat/uniwebview/UniWebViewResultPayload;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 501
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$5;->this$0:Lcom/onevcat/uniwebview/UniWebViewDialog;

    iget-object v0, v0, Lcom/onevcat/uniwebview/UniWebViewDialog;->listener:Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;

    iget-object v1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$5;->this$0:Lcom/onevcat/uniwebview/UniWebViewDialog;

    invoke-virtual {p1}, Lcom/onevcat/uniwebview/UniWebViewResultPayload;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;->onJavaScriptFinished(Lcom/onevcat/uniwebview/UniWebViewDialog;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const-string v0, "^\"|\"$"

    .line 504
    invoke-virtual {p1, v0, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 507
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$5;->this$0:Lcom/onevcat/uniwebview/UniWebViewDialog;

    invoke-static {v0, p1}, Lcom/onevcat/uniwebview/UniWebViewDialog;->access$200(Lcom/onevcat/uniwebview/UniWebViewDialog;Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    .line 509
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewResultPayload;

    iget-object v2, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$5;->val$identifier:Ljava/lang/String;

    invoke-direct {v0, v2, v1, p1}, Lcom/onevcat/uniwebview/UniWebViewResultPayload;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 510
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$5;->this$0:Lcom/onevcat/uniwebview/UniWebViewDialog;

    iget-object p1, p1, Lcom/onevcat/uniwebview/UniWebViewDialog;->listener:Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;

    iget-object v1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$5;->this$0:Lcom/onevcat/uniwebview/UniWebViewDialog;

    invoke-virtual {v0}, Lcom/onevcat/uniwebview/UniWebViewResultPayload;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v1, v0}, Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;->onJavaScriptFinished(Lcom/onevcat/uniwebview/UniWebViewDialog;Ljava/lang/String;)V

    :goto_0
    return-void
.end method
