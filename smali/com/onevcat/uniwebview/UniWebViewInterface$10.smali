.class final Lcom/onevcat/uniwebview/UniWebViewInterface$10;
.super Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;
.source "UniWebViewInterface.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/onevcat/uniwebview/UniWebViewInterface;->setPosition(Ljava/lang/String;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$x:I

.field final synthetic val$y:I


# direct methods
.method constructor <init>(Ljava/lang/String;II)V
    .locals 0

    .line 232
    iput p2, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$10;->val$x:I

    iput p3, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$10;->val$y:I

    invoke-direct {p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method runWith(Lcom/onevcat/uniwebview/UniWebViewDialog;)V
    .locals 2

    .line 235
    iget v0, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$10;->val$x:I

    iget v1, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$10;->val$y:I

    invoke-virtual {p1, v0, v1}, Lcom/onevcat/uniwebview/UniWebViewDialog;->setPosition(II)V

    return-void
.end method
