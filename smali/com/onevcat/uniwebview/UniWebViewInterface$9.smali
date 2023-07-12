.class final Lcom/onevcat/uniwebview/UniWebViewInterface$9;
.super Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;
.source "UniWebViewInterface.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/onevcat/uniwebview/UniWebViewInterface;->setFrame(Ljava/lang/String;IIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$height:I

.field final synthetic val$width:I

.field final synthetic val$x:I

.field final synthetic val$y:I


# direct methods
.method constructor <init>(Ljava/lang/String;IIII)V
    .locals 0

    .line 222
    iput p2, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$9;->val$x:I

    iput p3, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$9;->val$y:I

    iput p4, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$9;->val$width:I

    iput p5, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$9;->val$height:I

    invoke-direct {p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public runWith(Lcom/onevcat/uniwebview/UniWebViewDialog;)V
    .locals 4

    .line 225
    iget v0, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$9;->val$x:I

    iget v1, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$9;->val$y:I

    iget v2, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$9;->val$width:I

    iget v3, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$9;->val$height:I

    invoke-virtual {p1, v0, v1, v2, v3}, Lcom/onevcat/uniwebview/UniWebViewDialog;->setFrame(IIII)V

    return-void
.end method
