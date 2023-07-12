.class final Lcom/onevcat/uniwebview/UniWebViewInterface$23;
.super Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;
.source "UniWebViewInterface.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/onevcat/uniwebview/UniWebViewInterface;->setBackgroundColor(Ljava/lang/String;FFFF)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$a:F

.field final synthetic val$b:F

.field final synthetic val$g:F

.field final synthetic val$r:F


# direct methods
.method constructor <init>(Ljava/lang/String;FFFF)V
    .locals 0

    .line 446
    iput p2, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$23;->val$r:F

    iput p3, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$23;->val$g:F

    iput p4, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$23;->val$b:F

    iput p5, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$23;->val$a:F

    invoke-direct {p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method runWith(Lcom/onevcat/uniwebview/UniWebViewDialog;)V
    .locals 4

    .line 449
    iget v0, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$23;->val$r:F

    iget v1, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$23;->val$g:F

    iget v2, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$23;->val$b:F

    iget v3, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$23;->val$a:F

    invoke-virtual {p1, v0, v1, v2, v3}, Lcom/onevcat/uniwebview/UniWebViewDialog;->setBackgroundColor(FFFF)V

    return-void
.end method
