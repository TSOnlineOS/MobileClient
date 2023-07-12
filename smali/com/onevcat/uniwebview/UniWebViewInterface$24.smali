.class final Lcom/onevcat/uniwebview/UniWebViewInterface$24;
.super Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;
.source "UniWebViewInterface.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/onevcat/uniwebview/UniWebViewInterface;->setWebViewAlpha(Ljava/lang/String;F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$alpha:F


# direct methods
.method constructor <init>(Ljava/lang/String;F)V
    .locals 0

    .line 460
    iput p2, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$24;->val$alpha:F

    invoke-direct {p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method runWith(Lcom/onevcat/uniwebview/UniWebViewDialog;)V
    .locals 2

    .line 463
    iget v0, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$24;->val$alpha:F

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Lcom/onevcat/uniwebview/UniWebViewDialog;->setWebViewAlpha(FZ)V

    return-void
.end method
