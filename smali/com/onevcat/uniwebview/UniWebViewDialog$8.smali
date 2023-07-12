.class Lcom/onevcat/uniwebview/UniWebViewDialog$8;
.super Ljava/lang/Object;
.source "UniWebViewDialog.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/onevcat/uniwebview/UniWebViewDialog;->setKeyboardVisibilityListener(Lcom/onevcat/uniwebview/OnKeyboardVisibilityListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final EstimatedKeyboardDP:I

.field private alreadyOpen:Z

.field private final defaultKeyboardHeightDP:I

.field private final rect:Landroid/graphics/Rect;

.field final synthetic this$0:Lcom/onevcat/uniwebview/UniWebViewDialog;

.field final synthetic val$onKeyboardVisibilityListener:Lcom/onevcat/uniwebview/OnKeyboardVisibilityListener;

.field final synthetic val$parentView:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/onevcat/uniwebview/UniWebViewDialog;Landroid/view/View;Lcom/onevcat/uniwebview/OnKeyboardVisibilityListener;)V
    .locals 0

    .line 772
    iput-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$8;->this$0:Lcom/onevcat/uniwebview/UniWebViewDialog;

    iput-object p2, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$8;->val$parentView:Landroid/view/View;

    iput-object p3, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$8;->val$onKeyboardVisibilityListener:Lcom/onevcat/uniwebview/OnKeyboardVisibilityListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 p1, 0x64

    .line 775
    iput p1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$8;->defaultKeyboardHeightDP:I

    .line 776
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p3, 0x15

    if-lt p2, p3, :cond_0

    const/16 p2, 0x30

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    add-int/2addr p2, p1

    iput p2, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$8;->EstimatedKeyboardDP:I

    .line 777
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$8;->rect:Landroid/graphics/Rect;

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 5

    .line 781
    iget v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$8;->EstimatedKeyboardDP:I

    int-to-float v0, v0

    iget-object v1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$8;->val$parentView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v2, v0, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    float-to-int v0, v0

    .line 782
    iget-object v1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$8;->val$parentView:Landroid/view/View;

    iget-object v3, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$8;->rect:Landroid/graphics/Rect;

    invoke-virtual {v1, v3}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 783
    iget-object v1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$8;->val$parentView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    iget-object v3, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$8;->rect:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    iget-object v4, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$8;->rect:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->top:I

    sub-int/2addr v3, v4

    sub-int/2addr v1, v3

    if-lt v1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 786
    :goto_0
    iget-boolean v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$8;->alreadyOpen:Z

    if-ne v2, v0, :cond_1

    return-void

    .line 789
    :cond_1
    iput-boolean v2, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$8;->alreadyOpen:Z

    .line 790
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$8;->val$onKeyboardVisibilityListener:Lcom/onevcat/uniwebview/OnKeyboardVisibilityListener;

    invoke-interface {v0, v2}, Lcom/onevcat/uniwebview/OnKeyboardVisibilityListener;->onVisibilityChanged(Z)V

    return-void
.end method
