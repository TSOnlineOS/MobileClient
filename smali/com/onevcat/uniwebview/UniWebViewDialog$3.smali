.class Lcom/onevcat/uniwebview/UniWebViewDialog$3;
.super Ljava/lang/Object;
.source "UniWebViewDialog.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/onevcat/uniwebview/UniWebViewDialog;->animateTo(IIIIFFLjava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/onevcat/uniwebview/UniWebViewDialog;

.field final synthetic val$height:I

.field final synthetic val$identifier:Ljava/lang/String;

.field final synthetic val$width:I

.field final synthetic val$x:I

.field final synthetic val$y:I


# direct methods
.method constructor <init>(Lcom/onevcat/uniwebview/UniWebViewDialog;IIIILjava/lang/String;)V
    .locals 0

    .line 401
    iput-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$3;->this$0:Lcom/onevcat/uniwebview/UniWebViewDialog;

    iput p2, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$3;->val$x:I

    iput p3, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$3;->val$y:I

    iput p4, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$3;->val$width:I

    iput p5, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$3;->val$height:I

    iput-object p6, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$3;->val$identifier:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 404
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$3;->this$0:Lcom/onevcat/uniwebview/UniWebViewDialog;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/onevcat/uniwebview/UniWebViewDialog;->access$102(Lcom/onevcat/uniwebview/UniWebViewDialog;Z)Z

    .line 405
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$3;->this$0:Lcom/onevcat/uniwebview/UniWebViewDialog;

    iget v1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$3;->val$x:I

    iget v2, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$3;->val$y:I

    iget v3, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$3;->val$width:I

    iget v4, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$3;->val$height:I

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/onevcat/uniwebview/UniWebViewDialog;->setFrame(IIII)V

    .line 406
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$3;->this$0:Lcom/onevcat/uniwebview/UniWebViewDialog;

    iget-object v0, v0, Lcom/onevcat/uniwebview/UniWebViewDialog;->webViewContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->clearAnimation()V

    .line 407
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$3;->this$0:Lcom/onevcat/uniwebview/UniWebViewDialog;

    iget-object v0, v0, Lcom/onevcat/uniwebview/UniWebViewDialog;->listener:Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;

    iget-object v1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$3;->this$0:Lcom/onevcat/uniwebview/UniWebViewDialog;

    iget-object v2, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$3;->val$identifier:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;->onAnimationFinished(Lcom/onevcat/uniwebview/UniWebViewDialog;Ljava/lang/String;)V

    return-void
.end method
