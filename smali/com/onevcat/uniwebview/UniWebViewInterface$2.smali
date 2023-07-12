.class final Lcom/onevcat/uniwebview/UniWebViewInterface$2;
.super Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;
.source "UniWebViewInterface.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/onevcat/uniwebview/UniWebViewInterface;->init(Ljava/lang/String;IIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$height:I

.field final synthetic val$name:Ljava/lang/String;

.field final synthetic val$width:I

.field final synthetic val$x:I

.field final synthetic val$y:I


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;IIII)V
    .locals 0

    .line 49
    iput-object p2, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$2;->val$name:Ljava/lang/String;

    iput p3, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$2;->val$x:I

    iput p4, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$2;->val$y:I

    iput p5, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$2;->val$width:I

    iput p6, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$2;->val$height:I

    invoke-direct {p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 52
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$2$1;

    invoke-direct {v0, p0}, Lcom/onevcat/uniwebview/UniWebViewInterface$2$1;-><init>(Lcom/onevcat/uniwebview/UniWebViewInterface$2;)V

    .line 134
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Interface init: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$2;->val$name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 135
    new-instance v1, Lcom/onevcat/uniwebview/UniWebViewDialog;

    invoke-static {}, Lcom/onevcat/uniwebview/UniWebViewInterface;->access$100()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/onevcat/uniwebview/UniWebViewDialog;-><init>(Landroid/app/Activity;Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;)V

    .line 136
    iget v0, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$2;->val$x:I

    iget v2, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$2;->val$y:I

    iget v3, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$2;->val$width:I

    iget v4, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$2;->val$height:I

    invoke-virtual {v1, v0, v2, v3, v4}, Lcom/onevcat/uniwebview/UniWebViewDialog;->setFrame(IIII)V

    .line 138
    invoke-static {}, Lcom/onevcat/uniwebview/UniWebViewManager;->getInstance()Lcom/onevcat/uniwebview/UniWebViewManager;

    move-result-object v0

    iget-object v2, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$2;->val$name:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Lcom/onevcat/uniwebview/UniWebViewManager;->setUniWebView(Ljava/lang/String;Lcom/onevcat/uniwebview/UniWebViewDialog;)V

    return-void
.end method
