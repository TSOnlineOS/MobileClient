.class Lcom/facebook/gamingservices/ContextChooseDialog$2;
.super Lcom/facebook/share/internal/ResultProcessor;
.source "ContextChooseDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/gamingservices/ContextChooseDialog;->registerCallbackImpl(Lcom/facebook/internal/CallbackManagerImpl;Lcom/facebook/FacebookCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/gamingservices/ContextChooseDialog;

.field final synthetic val$callback:Lcom/facebook/FacebookCallback;


# direct methods
.method constructor <init>(Lcom/facebook/gamingservices/ContextChooseDialog;Lcom/facebook/FacebookCallback;Lcom/facebook/FacebookCallback;)V
    .locals 0

    .line 158
    iput-object p1, p0, Lcom/facebook/gamingservices/ContextChooseDialog$2;->this$0:Lcom/facebook/gamingservices/ContextChooseDialog;

    iput-object p3, p0, Lcom/facebook/gamingservices/ContextChooseDialog$2;->val$callback:Lcom/facebook/FacebookCallback;

    invoke-direct {p0, p2}, Lcom/facebook/share/internal/ResultProcessor;-><init>(Lcom/facebook/FacebookCallback;)V

    return-void
.end method


# virtual methods
.method public onSuccess(Lcom/facebook/internal/AppCall;Landroid/os/Bundle;)V
    .locals 2

    if-eqz p2, :cond_0

    .line 162
    iget-object p1, p0, Lcom/facebook/gamingservices/ContextChooseDialog$2;->val$callback:Lcom/facebook/FacebookCallback;

    new-instance v0, Lcom/facebook/gamingservices/ContextChooseDialog$Result;

    const/4 v1, 0x0

    invoke-direct {v0, p2, v1}, Lcom/facebook/gamingservices/ContextChooseDialog$Result;-><init>(Landroid/os/Bundle;Lcom/facebook/gamingservices/ContextChooseDialog$1;)V

    invoke-interface {p1, v0}, Lcom/facebook/FacebookCallback;->onSuccess(Ljava/lang/Object;)V

    goto :goto_0

    .line 164
    :cond_0
    invoke-virtual {p0, p1}, Lcom/facebook/gamingservices/ContextChooseDialog$2;->onCancel(Lcom/facebook/internal/AppCall;)V

    :goto_0
    return-void
.end method
