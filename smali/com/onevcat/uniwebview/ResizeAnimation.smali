.class public Lcom/onevcat/uniwebview/ResizeAnimation;
.super Landroid/view/animation/Animation;
.source "ResizeAnimation.java"


# instance fields
.field private deltaHeight:I

.field private deltaWidth:I

.field private fillEnabled:Z

.field private originalHeight:I

.field private originalWidth:I

.field private startHeight:I

.field private startWidth:I

.field private view:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;IIII)V
    .locals 1

    .line 30
    invoke-direct {p0}, Landroid/view/animation/Animation;-><init>()V

    const/4 v0, 0x0

    .line 26
    iput-boolean v0, p0, Lcom/onevcat/uniwebview/ResizeAnimation;->fillEnabled:Z

    .line 31
    iput-object p1, p0, Lcom/onevcat/uniwebview/ResizeAnimation;->view:Landroid/view/View;

    .line 32
    iput p2, p0, Lcom/onevcat/uniwebview/ResizeAnimation;->startWidth:I

    sub-int/2addr p3, p2

    .line 33
    iput p3, p0, Lcom/onevcat/uniwebview/ResizeAnimation;->deltaWidth:I

    .line 35
    iput p4, p0, Lcom/onevcat/uniwebview/ResizeAnimation;->startHeight:I

    sub-int/2addr p5, p4

    .line 36
    iput p5, p0, Lcom/onevcat/uniwebview/ResizeAnimation;->deltaHeight:I

    .line 38
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p2

    iput p2, p0, Lcom/onevcat/uniwebview/ResizeAnimation;->originalHeight:I

    .line 39
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result p1

    iput p1, p0, Lcom/onevcat/uniwebview/ResizeAnimation;->originalWidth:I

    return-void
.end method


# virtual methods
.method protected applyTransformation(FLandroid/view/animation/Transformation;)V
    .locals 4

    float-to-double v0, p1

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    cmpl-double p2, v0, v2

    if-nez p2, :cond_0

    .line 53
    iget-boolean p2, p0, Lcom/onevcat/uniwebview/ResizeAnimation;->fillEnabled:Z

    if-nez p2, :cond_0

    .line 55
    iget-object p1, p0, Lcom/onevcat/uniwebview/ResizeAnimation;->view:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget p2, p0, Lcom/onevcat/uniwebview/ResizeAnimation;->originalHeight:I

    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 56
    iget-object p1, p0, Lcom/onevcat/uniwebview/ResizeAnimation;->view:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget p2, p0, Lcom/onevcat/uniwebview/ResizeAnimation;->originalWidth:I

    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    goto :goto_0

    .line 60
    :cond_0
    iget p2, p0, Lcom/onevcat/uniwebview/ResizeAnimation;->deltaHeight:I

    if-eqz p2, :cond_1

    .line 61
    iget-object p2, p0, Lcom/onevcat/uniwebview/ResizeAnimation;->view:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p2

    iget v0, p0, Lcom/onevcat/uniwebview/ResizeAnimation;->startHeight:I

    int-to-float v0, v0

    iget v1, p0, Lcom/onevcat/uniwebview/ResizeAnimation;->deltaHeight:I

    int-to-float v1, v1

    mul-float v1, v1, p1

    add-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 62
    :cond_1
    iget p2, p0, Lcom/onevcat/uniwebview/ResizeAnimation;->deltaWidth:I

    if-eqz p2, :cond_2

    .line 63
    iget-object p2, p0, Lcom/onevcat/uniwebview/ResizeAnimation;->view:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p2

    iget v0, p0, Lcom/onevcat/uniwebview/ResizeAnimation;->startWidth:I

    int-to-float v0, v0

    iget v1, p0, Lcom/onevcat/uniwebview/ResizeAnimation;->deltaWidth:I

    int-to-float v1, v1

    mul-float v1, v1, p1

    add-float/2addr v0, v1

    float-to-int p1, v0

    iput p1, p2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 66
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/onevcat/uniwebview/ResizeAnimation;->view:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->requestLayout()V

    return-void
.end method

.method public setFillEnabled(Z)V
    .locals 0

    .line 45
    iput-boolean p1, p0, Lcom/onevcat/uniwebview/ResizeAnimation;->fillEnabled:Z

    .line 46
    invoke-super {p0, p1}, Landroid/view/animation/Animation;->setFillEnabled(Z)V

    return-void
.end method
