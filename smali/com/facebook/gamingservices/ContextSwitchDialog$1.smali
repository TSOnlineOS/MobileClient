.class Lcom/facebook/gamingservices/ContextSwitchDialog$1;
.super Ljava/lang/Object;
.source "ContextSwitchDialog.java"

# interfaces
.implements Lcom/facebook/gamingservices/cloudgaming/DaemonRequest$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/gamingservices/ContextSwitchDialog;->showForCloud(Lcom/facebook/gamingservices/model/ContextSwitchContent;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/gamingservices/ContextSwitchDialog;


# direct methods
.method constructor <init>(Lcom/facebook/gamingservices/ContextSwitchDialog;)V
    .locals 0

    .line 115
    iput-object p1, p0, Lcom/facebook/gamingservices/ContextSwitchDialog$1;->this$0:Lcom/facebook/gamingservices/ContextSwitchDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Lcom/facebook/GraphResponse;)V
    .locals 3

    .line 118
    iget-object v0, p0, Lcom/facebook/gamingservices/ContextSwitchDialog$1;->this$0:Lcom/facebook/gamingservices/ContextSwitchDialog;

    invoke-static {v0}, Lcom/facebook/gamingservices/ContextSwitchDialog;->access$000(Lcom/facebook/gamingservices/ContextSwitchDialog;)Lcom/facebook/FacebookCallback;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 119
    invoke-virtual {p1}, Lcom/facebook/GraphResponse;->getError()Lcom/facebook/FacebookRequestError;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 120
    iget-object v0, p0, Lcom/facebook/gamingservices/ContextSwitchDialog$1;->this$0:Lcom/facebook/gamingservices/ContextSwitchDialog;

    invoke-static {v0}, Lcom/facebook/gamingservices/ContextSwitchDialog;->access$000(Lcom/facebook/gamingservices/ContextSwitchDialog;)Lcom/facebook/FacebookCallback;

    move-result-object v0

    new-instance v1, Lcom/facebook/FacebookException;

    invoke-virtual {p1}, Lcom/facebook/GraphResponse;->getError()Lcom/facebook/FacebookRequestError;

    move-result-object p1

    invoke-virtual {p1}, Lcom/facebook/FacebookRequestError;->getErrorMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Lcom/facebook/FacebookException;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/facebook/FacebookCallback;->onError(Lcom/facebook/FacebookException;)V

    goto :goto_0

    .line 122
    :cond_0
    iget-object v0, p0, Lcom/facebook/gamingservices/ContextSwitchDialog$1;->this$0:Lcom/facebook/gamingservices/ContextSwitchDialog;

    invoke-static {v0}, Lcom/facebook/gamingservices/ContextSwitchDialog;->access$000(Lcom/facebook/gamingservices/ContextSwitchDialog;)Lcom/facebook/FacebookCallback;

    move-result-object v0

    new-instance v1, Lcom/facebook/gamingservices/ContextSwitchDialog$Result;

    const/4 v2, 0x0

    invoke-direct {v1, p1, v2}, Lcom/facebook/gamingservices/ContextSwitchDialog$Result;-><init>(Lcom/facebook/GraphResponse;Lcom/facebook/gamingservices/ContextSwitchDialog$1;)V

    invoke-interface {v0, v1}, Lcom/facebook/FacebookCallback;->onSuccess(Ljava/lang/Object;)V

    :cond_1
    :goto_0
    return-void
.end method
