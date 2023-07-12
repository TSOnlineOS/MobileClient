.class Lcom/onevcat/uniwebview/UniWebViewDialog;
.super Landroid/app/Dialog;
.source "UniWebViewDialog.java"

# interfaces
.implements Lcom/onevcat/uniwebview/OnKeyboardVisibilityListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;
    }
.end annotation


# static fields
.field static final ANIMATION_EDGE_BOTTOM:I = 0x3

.field static final ANIMATION_EDGE_LEFT:I = 0x2

.field static final ANIMATION_EDGE_NONE:I = 0x0

.field static final ANIMATION_EDGE_RIGHT:I = 0x4

.field static final ANIMATION_EDGE_TOP:I = 0x1

.field static defaultUserAgent:Ljava/lang/String;

.field static presetUserAgent:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private activity:Landroid/app/Activity;

.field private animating:Z

.field private backButtonEnabled:Z

.field private chromeClient:Lcom/onevcat/uniwebview/UniWebViewChromeClient;

.field private headers:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private height:I

.field private immersiveMode:Z

.field private isLoading:Z

.field final listener:Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;

.field private loadingInterrupted:Z

.field private openLinksInExternalBrowser:Z

.field private permissionTrustDomains:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private schemes:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private showHTTPAuthPopUpWindow:Z

.field private showSpinnerWhileLoading:Z

.field private spinner:Landroid/app/ProgressDialog;

.field private spinnerText:Ljava/lang/String;

.field private sslExceptionDomains:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field touchFromAnotherDialog:Z

.field private uniWebView:Lcom/onevcat/uniwebview/UniWebView;

.field private userAgent:Ljava/lang/String;

.field videoContainer:Landroid/widget/FrameLayout;

.field private webViewAlpha:F

.field webViewContainer:Landroid/widget/FrameLayout;

.field private webViewShowing:Z

.field private webViewVisible:Z

.field private width:I

.field private x:I

.field private y:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 101
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/onevcat/uniwebview/UniWebViewDialog;->presetUserAgent:Ljava/util/HashMap;

    const-string v0, ""

    .line 102
    sput-object v0, Lcom/onevcat/uniwebview/UniWebViewDialog;->defaultUserAgent:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Landroid/app/Activity;Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;)V
    .locals 3

    const v0, 0x103006c

    .line 136
    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    const/4 v0, 0x1

    .line 60
    iput-boolean v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->immersiveMode:Z

    .line 61
    iput-boolean v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->showHTTPAuthPopUpWindow:Z

    const-string v1, "Loading..."

    .line 66
    iput-object v1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->spinnerText:Ljava/lang/String;

    .line 85
    iput-boolean v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->backButtonEnabled:Z

    const/high16 v0, 0x3f800000    # 1.0f

    .line 87
    iput v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->webViewAlpha:F

    const/4 v0, 0x0

    .line 92
    iput-boolean v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->webViewShowing:Z

    .line 95
    iput-boolean v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->webViewVisible:Z

    .line 119
    sget-object v1, Lcom/onevcat/uniwebview/UniWebViewDialog;->defaultUserAgent:Ljava/lang/String;

    iput-object v1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->userAgent:Ljava/lang/String;

    .line 159
    iput-boolean v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->touchFromAnotherDialog:Z

    .line 138
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v1

    const-string v2, "Creating new UniWebView dialog."

    invoke-virtual {v1, v2}, Lcom/onevcat/uniwebview/Logger;->debug(Ljava/lang/String;)V

    .line 140
    iput-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->activity:Landroid/app/Activity;

    .line 141
    iput-object p2, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->listener:Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;

    .line 143
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->schemes:Ljava/util/HashSet;

    const-string p2, "uniwebview"

    .line 144
    invoke-virtual {p1, p2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 146
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->permissionTrustDomains:Ljava/util/HashSet;

    .line 147
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->sslExceptionDomains:Ljava/util/HashSet;

    .line 148
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->headers:Ljava/util/HashMap;

    .line 150
    invoke-direct {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->prepareWindow()V

    .line 151
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->hideSystemUI()V

    .line 152
    invoke-direct {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->addWebViewContent()V

    .line 154
    invoke-virtual {p0, v0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->setBouncesEnabled(Z)V

    .line 155
    invoke-direct {p0, p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->setKeyboardVisibilityListener(Lcom/onevcat/uniwebview/OnKeyboardVisibilityListener;)V

    return-void
.end method

.method static synthetic access$000(Lcom/onevcat/uniwebview/UniWebViewDialog;ZLjava/lang/String;)V
    .locals 0

    .line 47
    invoke-direct {p0, p1, p2}, Lcom/onevcat/uniwebview/UniWebViewDialog;->finishShowDialog(ZLjava/lang/String;)V

    return-void
.end method

.method static synthetic access$102(Lcom/onevcat/uniwebview/UniWebViewDialog;Z)Z
    .locals 0

    .line 47
    iput-boolean p1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->animating:Z

    return p1
.end method

.method static synthetic access$200(Lcom/onevcat/uniwebview/UniWebViewDialog;Ljava/lang/String;)Ljava/lang/StringBuffer;
    .locals 0

    .line 47
    invoke-direct {p0, p1}, Lcom/onevcat/uniwebview/UniWebViewDialog;->removeUTFCharacters(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$300(Lcom/onevcat/uniwebview/UniWebViewDialog;)Landroid/app/Activity;
    .locals 0

    .line 47
    iget-object p0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->activity:Landroid/app/Activity;

    return-object p0
.end method

.method private addWebViewContent()V
    .locals 10

    .line 635
    new-instance v0, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->webViewContainer:Landroid/widget/FrameLayout;

    const/4 v1, 0x0

    .line 636
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 638
    new-instance v0, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->videoContainer:Landroid/widget/FrameLayout;

    const/4 v2, 0x4

    .line 639
    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 642
    new-instance v0, Lcom/onevcat/uniwebview/UniWebView;

    iget-object v2, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->activity:Landroid/app/Activity;

    invoke-direct {v0, v2}, Lcom/onevcat/uniwebview/UniWebView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->uniWebView:Lcom/onevcat/uniwebview/UniWebView;

    .line 644
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewDialog$6;

    iget-object v2, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->activity:Landroid/app/Activity;

    invoke-direct {v0, p0, v2}, Lcom/onevcat/uniwebview/UniWebViewDialog$6;-><init>(Lcom/onevcat/uniwebview/UniWebViewDialog;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->uniWebView:Lcom/onevcat/uniwebview/UniWebView;

    .line 652
    new-instance v2, Lcom/onevcat/uniwebview/UniWebViewClient;

    invoke-direct {v2, p0}, Lcom/onevcat/uniwebview/UniWebViewClient;-><init>(Lcom/onevcat/uniwebview/UniWebViewDialog;)V

    invoke-virtual {v0, v2}, Lcom/onevcat/uniwebview/UniWebView;->setClient(Lcom/onevcat/uniwebview/UniWebViewClient;)V

    .line 654
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;

    iget-object v4, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->activity:Landroid/app/Activity;

    iget-object v5, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->webViewContainer:Landroid/widget/FrameLayout;

    iget-object v6, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->videoContainer:Landroid/widget/FrameLayout;

    iget-object v8, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->uniWebView:Lcom/onevcat/uniwebview/UniWebView;

    const/4 v7, 0x0

    move-object v3, v0

    move-object v9, p0

    invoke-direct/range {v3 .. v9}, Lcom/onevcat/uniwebview/UniWebViewChromeClient;-><init>(Landroid/app/Activity;Landroid/view/View;Landroid/view/ViewGroup;Landroid/view/View;Lcom/onevcat/uniwebview/UniWebView;Lcom/onevcat/uniwebview/UniWebViewDialog;)V

    iput-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->chromeClient:Lcom/onevcat/uniwebview/UniWebViewChromeClient;

    .line 656
    iget-object v2, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->uniWebView:Lcom/onevcat/uniwebview/UniWebView;

    invoke-virtual {v2, v0}, Lcom/onevcat/uniwebview/UniWebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 658
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->uniWebView:Lcom/onevcat/uniwebview/UniWebView;

    new-instance v2, Lcom/onevcat/uniwebview/UniWebViewDialog$7;

    invoke-direct {v2, p0}, Lcom/onevcat/uniwebview/UniWebViewDialog$7;-><init>(Lcom/onevcat/uniwebview/UniWebViewDialog;)V

    invoke-virtual {v0, v2}, Lcom/onevcat/uniwebview/UniWebView;->setDownloadListener(Landroid/webkit/DownloadListener;)V

    .line 668
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->uniWebView:Lcom/onevcat/uniwebview/UniWebView;

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/UniWebView;->setVisibility(I)V

    .line 669
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->uniWebView:Lcom/onevcat/uniwebview/UniWebView;

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/UniWebView;->setBackgroundColor(I)V

    .line 672
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->spinner:Landroid/app/ProgressDialog;

    const/4 v1, 0x1

    .line 673
    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setCanceledOnTouchOutside(Z)V

    .line 674
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->spinner:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->requestWindowFeature(I)Z

    .line 675
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->spinner:Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->spinnerText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 677
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 678
    iget-object v1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->videoContainer:Landroid/widget/FrameLayout;

    invoke-virtual {p0, v1, v0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 681
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    iget v1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->width:I

    iget v2, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->height:I

    invoke-direct {v0, v1, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 682
    iget-object v1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->webViewContainer:Landroid/widget/FrameLayout;

    iget v2, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->x:I

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->setX(F)V

    .line 683
    iget-object v1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->webViewContainer:Landroid/widget/FrameLayout;

    iget v2, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->y:I

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->setY(F)V

    .line 684
    iget-object v1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->webViewContainer:Landroid/widget/FrameLayout;

    invoke-virtual {p0, v1, v0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 685
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->webViewContainer:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->uniWebView:Lcom/onevcat/uniwebview/UniWebView;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    const/high16 v0, 0x3f800000    # 1.0f

    .line 687
    invoke-virtual {p0, v0, v0, v0, v0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->setBackgroundColor(FFFF)V

    return-void
.end method

.method private animatedShow(ZZIFLjava/lang/String;)V
    .locals 2

    const/4 v0, 0x1

    .line 342
    iput-boolean v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->animating:Z

    .line 345
    new-instance v0, Landroid/view/animation/AnimationSet;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    const/high16 v1, 0x447a0000    # 1000.0f

    mul-float p4, p4, v1

    float-to-int p4, p4

    .line 348
    invoke-direct {p0, p1, p2, p4}, Lcom/onevcat/uniwebview/UniWebViewDialog;->fadeAnimation(ZZI)Landroid/view/animation/Animation;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 350
    invoke-virtual {v0, p2}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 353
    :cond_0
    invoke-direct {p0, p1, p3, p4}, Lcom/onevcat/uniwebview/UniWebViewDialog;->moveAnimation(ZII)Landroid/view/animation/Animation;

    move-result-object p2

    if-eqz p2, :cond_1

    .line 355
    invoke-virtual {v0, p2}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 359
    :cond_1
    iget-object p2, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->webViewContainer:Landroid/widget/FrameLayout;

    invoke-virtual {p2, v0}, Landroid/widget/FrameLayout;->startAnimation(Landroid/view/animation/Animation;)V

    .line 362
    new-instance p2, Landroid/os/Handler;

    invoke-direct {p2}, Landroid/os/Handler;-><init>()V

    .line 363
    new-instance p3, Lcom/onevcat/uniwebview/UniWebViewDialog$2;

    invoke-direct {p3, p0, p1, p5}, Lcom/onevcat/uniwebview/UniWebViewDialog$2;-><init>(Lcom/onevcat/uniwebview/UniWebViewDialog;ZLjava/lang/String;)V

    int-to-long p4, p4

    invoke-virtual {p2, p3, p4, p5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private displaySize()Landroid/graphics/Point;
    .locals 3

    .line 896
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 897
    new-instance v1, Landroid/graphics/Point;

    invoke-direct {v1}, Landroid/graphics/Point;-><init>()V

    .line 898
    iget-boolean v2, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->immersiveMode:Z

    if-eqz v2, :cond_0

    .line 899
    invoke-virtual {v0, v1}, Landroid/view/Display;->getRealSize(Landroid/graphics/Point;)V

    return-object v1

    .line 902
    :cond_0
    invoke-virtual {v0, v1}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    return-object v1
.end method

.method private fadeAnimation(ZZI)Landroid/view/animation/Animation;
    .locals 1

    if-nez p2, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    const/4 p2, 0x0

    if-eqz p1, :cond_1

    const/4 v0, 0x0

    goto :goto_0

    .line 912
    :cond_1
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getWebViewAlpha()F

    move-result v0

    :goto_0
    if-eqz p1, :cond_2

    .line 913
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getWebViewAlpha()F

    move-result p2

    .line 914
    :cond_2
    new-instance p1, Landroid/view/animation/AlphaAnimation;

    invoke-direct {p1, v0, p2}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    const/4 p2, 0x1

    .line 915
    invoke-virtual {p1, p2}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    int-to-long p2, p3

    .line 916
    invoke-virtual {p1, p2, p3}, Landroid/view/animation/Animation;->setDuration(J)V

    return-object p1
.end method

.method private finishShowDialog(ZLjava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 375
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->listener:Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;

    invoke-interface {p1, p0, p2}, Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;->onShowTransitionFinished(Lcom/onevcat/uniwebview/UniWebViewDialog;Ljava/lang/String;)V

    goto :goto_0

    .line 377
    :cond_0
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->webViewContainer:Landroid/widget/FrameLayout;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 378
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->listener:Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;

    invoke-interface {p1, p0, p2}, Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;->onHideTransitionFinished(Lcom/onevcat/uniwebview/UniWebViewDialog;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method private getUserAgent()Ljava/lang/String;
    .locals 1

    .line 120
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->userAgent:Ljava/lang/String;

    return-object v0
.end method

.method static getUserAgent(Lcom/onevcat/uniwebview/UniWebViewDialog;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    if-eqz p0, :cond_0

    .line 105
    invoke-direct {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getUserAgent()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 107
    :cond_0
    sget-object p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->presetUserAgent:Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_1

    goto :goto_0

    .line 108
    :cond_1
    sget-object p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->defaultUserAgent:Ljava/lang/String;

    :goto_0
    return-object p0
.end method

.method private immersiveShow(Landroid/app/Dialog;Landroid/view/Window;)V
    .locals 2

    .line 868
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x8

    .line 869
    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setFlags(II)V

    .line 870
    invoke-virtual {p1}, Landroid/app/Dialog;->show()V

    .line 872
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    if-eqz p2, :cond_0

    .line 874
    invoke-virtual {p2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p2

    invoke-virtual {p2}, Landroid/view/View;->getWindowSystemUiVisibility()I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/view/View;->setSystemUiVisibility(I)V

    goto :goto_0

    .line 876
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getWindowSystemUiVisibility()I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 879
    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    return-void
.end method

.method private isEventInside(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 172
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->uniWebView:Lcom/onevcat/uniwebview/UniWebView;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v1

    float-to-int v1, v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result p1

    float-to-int p1, p1

    invoke-direct {p0, v0, v1, p1}, Lcom/onevcat/uniwebview/UniWebViewDialog;->isViewContains(Landroid/view/View;II)Z

    move-result p1

    return p1
.end method

.method private isViewContains(Landroid/view/View;II)Z
    .locals 5

    const/4 v0, 0x2

    new-array v0, v0, [I

    .line 177
    invoke-virtual {p1, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    const/4 v1, 0x0

    .line 178
    aget v2, v0, v1

    const/4 v3, 0x1

    .line 179
    aget v0, v0, v3

    .line 180
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v4

    .line 181
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    if-lt p2, v2, :cond_1

    add-int/2addr v2, v4

    if-gt p2, v2, :cond_1

    if-lt p3, v0, :cond_1

    add-int/2addr v0, p1

    if-le p3, v0, :cond_0

    goto :goto_0

    :cond_0
    return v3

    :cond_1
    :goto_0
    return v1
.end method

.method private moveAnimation(ZII)Landroid/view/animation/Animation;
    .locals 6

    const/4 v0, 0x0

    if-nez p2, :cond_0

    return-object v0

    .line 926
    :cond_0
    invoke-direct {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->displaySize()Landroid/graphics/Point;

    move-result-object v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne p2, v2, :cond_1

    .line 929
    iget p2, v1, Landroid/graphics/Point;->y:I

    neg-int p2, p2

    goto :goto_1

    :cond_1
    const/4 v4, 0x2

    if-ne p2, v4, :cond_2

    .line 931
    iget p2, v1, Landroid/graphics/Point;->x:I

    neg-int p2, p2

    :goto_0
    move v3, p2

    const/4 p2, 0x0

    goto :goto_1

    :cond_2
    const/4 v4, 0x3

    if-ne p2, v4, :cond_3

    .line 935
    iget p2, v1, Landroid/graphics/Point;->y:I

    goto :goto_1

    :cond_3
    const/4 v4, 0x4

    if-ne p2, v4, :cond_8

    .line 937
    iget p2, v1, Landroid/graphics/Point;->x:I

    goto :goto_0

    .line 943
    :goto_1
    new-instance v0, Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x0

    if-eqz p1, :cond_4

    int-to-float v4, v3

    goto :goto_2

    :cond_4
    const/4 v4, 0x0

    :goto_2
    if-eqz p1, :cond_5

    const/4 v3, 0x0

    goto :goto_3

    :cond_5
    int-to-float v3, v3

    :goto_3
    if-eqz p1, :cond_6

    int-to-float v5, p2

    goto :goto_4

    :cond_6
    const/4 v5, 0x0

    :goto_4
    if-eqz p1, :cond_7

    goto :goto_5

    :cond_7
    int-to-float v1, p2

    :goto_5
    invoke-direct {v0, v4, v3, v5, v1}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    .line 944
    invoke-virtual {v0, v2}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    int-to-long p1, p3

    .line 945
    invoke-virtual {v0, p1, p2}, Landroid/view/animation/Animation;->setDuration(J)V

    :cond_8
    return-object v0
.end method

.method private moveToAnimation(IIII)Landroid/view/animation/Animation;
    .locals 2

    .line 950
    new-instance v0, Landroid/view/animation/TranslateAnimation;

    iget v1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->x:I

    sub-int/2addr p1, v1

    int-to-float p1, p1

    iget v1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->y:I

    sub-int/2addr p2, v1

    int-to-float p2, p2

    const/4 v1, 0x0

    invoke-direct {v0, v1, p1, v1, p2}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    const/4 p1, 0x1

    .line 951
    invoke-virtual {v0, p1}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    int-to-long p1, p3

    .line 952
    invoke-virtual {v0, p1, p2}, Landroid/view/animation/Animation;->setDuration(J)V

    int-to-long p1, p4

    .line 953
    invoke-virtual {v0, p1, p2}, Landroid/view/animation/Animation;->setStartOffset(J)V

    return-object v0
.end method

.method private prepareWindow()V
    .locals 3

    .line 617
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v1, "Preparing window layout for web view dialog."

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->verbose(Ljava/lang/String;)V

    .line 618
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 619
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    const/16 v1, 0x20

    .line 620
    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    const/16 v1, 0x30

    .line 621
    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    const/16 v1, 0x400

    .line 622
    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setFlags(II)V

    const/high16 v1, 0x1000000

    .line 623
    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setFlags(II)V

    .line 625
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_0

    .line 626
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->layoutInDisplayCutoutMode:I

    .line 627
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    .line 628
    iput v0, v1, Landroid/view/WindowManager$LayoutParams;->layoutInDisplayCutoutMode:I

    .line 629
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    :cond_0
    return-void
.end method

.method private removeUTFCharacters(Ljava/lang/String;)Ljava/lang/StringBuffer;
    .locals 3

    const-string v0, "\\\\u(\\p{XDigit}{4})"

    .line 966
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    .line 967
    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 968
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    invoke-direct {v1, p1}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 969
    :goto_0
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    .line 970
    invoke-virtual {v0, p1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p1

    const/16 v2, 0x10

    invoke-static {p1, v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result p1

    int-to-char p1, p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object p1

    .line 971
    invoke-static {p1}, Ljava/util/regex/Matcher;->quoteReplacement(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Ljava/util/regex/Matcher;->appendReplacement(Ljava/lang/StringBuffer;Ljava/lang/String;)Ljava/util/regex/Matcher;

    goto :goto_0

    .line 973
    :cond_0
    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->appendTail(Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    return-object v1
.end method

.method private setKeyboardVisibilityListener(Lcom/onevcat/uniwebview/OnKeyboardVisibilityListener;)V
    .locals 3

    const v0, 0x1020002

    .line 771
    invoke-virtual {p0, v0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 772
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    new-instance v2, Lcom/onevcat/uniwebview/UniWebViewDialog$8;

    invoke-direct {v2, p0, v0, p1}, Lcom/onevcat/uniwebview/UniWebViewDialog$8;-><init>(Lcom/onevcat/uniwebview/UniWebViewDialog;Landroid/view/View;Lcom/onevcat/uniwebview/OnKeyboardVisibilityListener;)V

    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    return-void
.end method

.method static setUserAgent(Lcom/onevcat/uniwebview/UniWebViewDialog;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    if-eqz p0, :cond_0

    .line 113
    invoke-direct {p0, p2}, Lcom/onevcat/uniwebview/UniWebViewDialog;->setUserAgent(Ljava/lang/String;)V

    .line 114
    sget-object p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->presetUserAgent:Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 116
    :cond_0
    sget-object p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->presetUserAgent:Ljava/util/HashMap;

    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_0
    return-void
.end method

.method private setUserAgent(Ljava/lang/String;)V
    .locals 2

    .line 122
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_0

    .line 123
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getWebView()Lcom/onevcat/uniwebview/UniWebView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/onevcat/uniwebview/UniWebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/webkit/WebSettings;->setUserAgentString(Ljava/lang/String;)V

    .line 125
    :cond_0
    iput-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->userAgent:Ljava/lang/String;

    return-void
.end method

.method private showDialog()V
    .locals 2

    .line 883
    iget-boolean v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->webViewShowing:Z

    if-eqz v0, :cond_0

    .line 884
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->webViewContainer:Landroid/widget/FrameLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 886
    iput-boolean v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->webViewShowing:Z

    .line 887
    iget-boolean v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->immersiveMode:Z

    if-eqz v0, :cond_1

    .line 888
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-direct {p0, p0, v0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->immersiveShow(Landroid/app/Dialog;Landroid/view/Window;)V

    goto :goto_0

    .line 890
    :cond_1
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->show()V

    :goto_0
    return-void
.end method

.method private sizeToAnimation(IIII)Landroid/view/animation/Animation;
    .locals 7

    .line 958
    new-instance v6, Lcom/onevcat/uniwebview/ResizeAnimation;

    iget-object v1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->webViewContainer:Landroid/widget/FrameLayout;

    iget v2, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->width:I

    iget v4, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->height:I

    move-object v0, v6

    move v3, p1

    move v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/onevcat/uniwebview/ResizeAnimation;-><init>(Landroid/view/View;IIII)V

    const/4 p1, 0x1

    .line 959
    invoke-virtual {v6, p1}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    int-to-long p1, p3

    .line 960
    invoke-virtual {v6, p1, p2}, Landroid/view/animation/Animation;->setDuration(J)V

    int-to-long p1, p4

    .line 961
    invoke-virtual {v6, p1, p2}, Landroid/view/animation/Animation;->setStartOffset(J)V

    return-object v6
.end method


# virtual methods
.method addJavaScript(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    if-nez p1, :cond_0

    .line 469
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object p1

    const-string p2, "Trying to add null as js string. Aborting..."

    invoke-virtual {p1, p2}, Lcom/onevcat/uniwebview/Logger;->critical(Ljava/lang/String;)V

    return-void

    .line 473
    :cond_0
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Adding javascript string to web view. Requesting string: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->debug(Ljava/lang/String;)V

    .line 474
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->uniWebView:Lcom/onevcat/uniwebview/UniWebView;

    new-instance v1, Lcom/onevcat/uniwebview/UniWebViewDialog$4;

    invoke-direct {v1, p0, p2}, Lcom/onevcat/uniwebview/UniWebViewDialog$4;-><init>(Lcom/onevcat/uniwebview/UniWebViewDialog;Ljava/lang/String;)V

    invoke-virtual {v0, p1, v1}, Lcom/onevcat/uniwebview/UniWebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    return-void
.end method

.method animateTo(IIIIFFLjava/lang/String;)Z
    .locals 13

    move-object v7, p0

    .line 384
    iget-boolean v0, v7, Lcom/onevcat/uniwebview/UniWebViewDialog;->animating:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 385
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v2, "Trying to animate but another transition animation is not finished yet. Ignore this one."

    invoke-virtual {v0, v2}, Lcom/onevcat/uniwebview/Logger;->critical(Ljava/lang/String;)V

    return v1

    :cond_0
    const/4 v8, 0x1

    .line 389
    iput-boolean v8, v7, Lcom/onevcat/uniwebview/UniWebViewDialog;->animating:Z

    const/high16 v0, 0x447a0000    # 1000.0f

    mul-float v2, p5, v0

    float-to-int v9, v2

    mul-float v0, v0, p6

    float-to-int v10, v0

    .line 394
    new-instance v0, Landroid/view/animation/AnimationSet;

    invoke-direct {v0, v1}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    move v2, p1

    move v3, p2

    .line 395
    invoke-direct {p0, p1, p2, v9, v10}, Lcom/onevcat/uniwebview/UniWebViewDialog;->moveToAnimation(IIII)Landroid/view/animation/Animation;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    move/from16 v4, p3

    move/from16 v5, p4

    .line 396
    invoke-direct {p0, v4, v5, v9, v10}, Lcom/onevcat/uniwebview/UniWebViewDialog;->sizeToAnimation(IIII)Landroid/view/animation/Animation;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 398
    iget-object v1, v7, Lcom/onevcat/uniwebview/UniWebViewDialog;->webViewContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->startAnimation(Landroid/view/animation/Animation;)V

    .line 400
    new-instance v11, Landroid/os/Handler;

    invoke-direct {v11}, Landroid/os/Handler;-><init>()V

    .line 401
    new-instance v12, Lcom/onevcat/uniwebview/UniWebViewDialog$3;

    move-object v0, v12

    move-object v1, p0

    move-object/from16 v6, p7

    invoke-direct/range {v0 .. v6}, Lcom/onevcat/uniwebview/UniWebViewDialog$3;-><init>(Lcom/onevcat/uniwebview/UniWebViewDialog;IIIILjava/lang/String;)V

    add-int/2addr v9, v10

    int-to-long v0, v9

    invoke-virtual {v11, v12, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return v8
.end method

.method clearHttpAuthUsernamePassword(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 863
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getWebView()Lcom/onevcat/uniwebview/UniWebView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p2, v1, v1}, Lcom/onevcat/uniwebview/UniWebView;->setHttpAuthUsernamePassword(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method destroy()V
    .locals 2

    .line 535
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->uniWebView:Lcom/onevcat/uniwebview/UniWebView;

    const-string v1, "about:blank"

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/UniWebView;->loadUrl(Ljava/lang/String;)V

    .line 536
    invoke-static {}, Lcom/onevcat/uniwebview/UniWebViewManager;->getInstance()Lcom/onevcat/uniwebview/UniWebViewManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/onevcat/uniwebview/UniWebViewManager;->removeShowingDialog(Lcom/onevcat/uniwebview/UniWebViewDialog;)V

    .line 539
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/CookieManager;->flush()V

    .line 541
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->dismiss()V

    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 4

    .line 211
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "dispatchKeyEvent: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->verbose(Ljava/lang/String;)V

    .line 212
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_0

    .line 213
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    .line 214
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Key down event for: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/onevcat/uniwebview/Logger;->verbose(Ljava/lang/String;)V

    .line 215
    iget-object v1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->listener:Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;

    invoke-interface {v1, p0, v0}, Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;->onDialogKeyDown(Lcom/onevcat/uniwebview/UniWebViewDialog;I)V

    .line 217
    :cond_0
    invoke-super {p0, p1}, Landroid/app/Dialog;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method evaluateJavaScript(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    if-nez p1, :cond_0

    .line 491
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object p1

    const-string p2, "Trying to evaluate null as js string. Aborting..."

    invoke-virtual {p1, p2}, Lcom/onevcat/uniwebview/Logger;->critical(Ljava/lang/String;)V

    return-void

    .line 494
    :cond_0
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Evaluating javascript string in web view. Requesting string: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->debug(Ljava/lang/String;)V

    .line 495
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->uniWebView:Lcom/onevcat/uniwebview/UniWebView;

    new-instance v1, Lcom/onevcat/uniwebview/UniWebViewDialog$5;

    invoke-direct {v1, p0, p2}, Lcom/onevcat/uniwebview/UniWebViewDialog$5;-><init>(Lcom/onevcat/uniwebview/UniWebViewDialog;Ljava/lang/String;)V

    invoke-virtual {v0, p1, v1}, Lcom/onevcat/uniwebview/UniWebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    return-void
.end method

.method getAnimating()Z
    .locals 1

    .line 226
    iget-boolean v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->animating:Z

    return v0
.end method

.method getHeaders()Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 859
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->headers:Ljava/util/HashMap;

    return-object v0
.end method

.method getImmersiveMode()Z
    .locals 1

    .line 767
    iget-boolean v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->immersiveMode:Z

    return v0
.end method

.method getPermissionTrustDomains()Ljava/util/HashSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 763
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->permissionTrustDomains:Ljava/util/HashSet;

    return-object v0
.end method

.method getSchemes()Ljava/util/HashSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 229
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->schemes:Ljava/util/HashSet;

    return-object v0
.end method

.method public getShowHTTPAuthPopUpWindow()Z
    .locals 1

    .line 978
    iget-boolean v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->showHTTPAuthPopUpWindow:Z

    return v0
.end method

.method getSslExceptionDomains()Ljava/util/HashSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 759
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->sslExceptionDomains:Ljava/util/HashSet;

    return-object v0
.end method

.method getUrl()Ljava/lang/String;
    .locals 1

    .line 128
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getWebView()Lcom/onevcat/uniwebview/UniWebView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/onevcat/uniwebview/UniWebView;->getUrl()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getWebView()Lcom/onevcat/uniwebview/UniWebView;
    .locals 1

    .line 755
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->uniWebView:Lcom/onevcat/uniwebview/UniWebView;

    return-object v0
.end method

.method getWebViewAlpha()F
    .locals 1

    .line 834
    iget v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->webViewAlpha:F

    return v0
.end method

.method goBack()Z
    .locals 1

    .line 517
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->uniWebView:Lcom/onevcat/uniwebview/UniWebView;

    invoke-virtual {v0}, Lcom/onevcat/uniwebview/UniWebView;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 518
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->uniWebView:Lcom/onevcat/uniwebview/UniWebView;

    invoke-virtual {v0}, Lcom/onevcat/uniwebview/UniWebView;->goBack()V

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method goBackground()V
    .locals 1

    .line 545
    iget-boolean v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->isLoading:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 546
    iput-boolean v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->loadingInterrupted:Z

    .line 547
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->uniWebView:Lcom/onevcat/uniwebview/UniWebView;

    invoke-virtual {v0}, Lcom/onevcat/uniwebview/UniWebView;->stopLoading()V

    .line 550
    :cond_0
    iget-boolean v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->webViewShowing:Z

    if-eqz v0, :cond_2

    .line 551
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->chromeClient:Lcom/onevcat/uniwebview/UniWebViewChromeClient;

    invoke-virtual {v0}, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->getAlertDialog()Landroid/app/AlertDialog;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 553
    invoke-virtual {v0}, Landroid/app/AlertDialog;->hide()V

    .line 555
    :cond_1
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->hide()V

    .line 556
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->uniWebView:Lcom/onevcat/uniwebview/UniWebView;

    invoke-virtual {v0}, Lcom/onevcat/uniwebview/UniWebView;->onPause()V

    :cond_2
    return-void
.end method

.method goForeground()V
    .locals 1

    .line 561
    iget-boolean v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->loadingInterrupted:Z

    if-eqz v0, :cond_0

    .line 562
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->uniWebView:Lcom/onevcat/uniwebview/UniWebView;

    invoke-virtual {v0}, Lcom/onevcat/uniwebview/UniWebView;->reload()V

    const/4 v0, 0x0

    .line 563
    iput-boolean v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->loadingInterrupted:Z

    .line 566
    :cond_0
    iget-boolean v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->webViewShowing:Z

    if-eqz v0, :cond_2

    .line 567
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->show()V

    .line 569
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->chromeClient:Lcom/onevcat/uniwebview/UniWebViewChromeClient;

    invoke-virtual {v0}, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->getAlertDialog()Landroid/app/AlertDialog;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 571
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 574
    :cond_1
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->uniWebView:Lcom/onevcat/uniwebview/UniWebView;

    invoke-virtual {v0}, Lcom/onevcat/uniwebview/UniWebView;->onResume()V

    :cond_2
    return-void
.end method

.method goForward()Z
    .locals 1

    .line 526
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->uniWebView:Lcom/onevcat/uniwebview/UniWebView;

    invoke-virtual {v0}, Lcom/onevcat/uniwebview/UniWebView;->canGoForward()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 527
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->uniWebView:Lcom/onevcat/uniwebview/UniWebView;

    invoke-virtual {v0}, Lcom/onevcat/uniwebview/UniWebView;->goForward()V

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method hideSpinner()V
    .locals 2

    .line 597
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v1, "Hide spinner."

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->verbose(Ljava/lang/String;)V

    .line 598
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->spinner:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->hide()V

    return-void
.end method

.method hideSystemUI()V
    .locals 2

    .line 720
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    .line 724
    iget-boolean v1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->immersiveMode:Z

    if-eqz v1, :cond_0

    const/16 v1, 0x1706

    goto :goto_0

    :cond_0
    const/4 v1, 0x4

    .line 734
    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    return-void
.end method

.method isCanGoBack()Z
    .locals 1

    .line 130
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getWebView()Lcom/onevcat/uniwebview/UniWebView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/onevcat/uniwebview/UniWebView;->canGoBack()Z

    move-result v0

    return v0
.end method

.method isCanGoForward()Z
    .locals 1

    .line 131
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getWebView()Lcom/onevcat/uniwebview/UniWebView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/onevcat/uniwebview/UniWebView;->canGoForward()Z

    move-result v0

    return v0
.end method

.method isShowSpinnerWhileLoading()Z
    .locals 1

    .line 742
    iget-boolean v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->showSpinnerWhileLoading:Z

    return v0
.end method

.method load(Ljava/lang/String;)V
    .locals 3

    .line 414
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "UniWebView will load url: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ". With headers: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->headers:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 415
    invoke-virtual {p0, p1, v0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->shouldOverride(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 417
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->uniWebView:Lcom/onevcat/uniwebview/UniWebView;

    iget-object v1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->headers:Ljava/util/HashMap;

    invoke-virtual {v0, p1, v1}, Lcom/onevcat/uniwebview/UniWebView;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    :cond_0
    return-void
.end method

.method loadHTMLString(Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    .line 462
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "UniWebView will load html string with base url: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 463
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Input html content: \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->verbose(Ljava/lang/String;)V

    .line 464
    iget-object v2, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->uniWebView:Lcom/onevcat/uniwebview/UniWebView;

    const-string v5, "text/html"

    const-string v6, "UTF-8"

    const/4 v7, 0x0

    move-object v3, p2

    move-object v4, p1

    invoke-virtual/range {v2 .. v7}, Lcom/onevcat/uniwebview/UniWebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 3

    .line 191
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onKeyDown, key code: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->verbose(Ljava/lang/String;)V

    const/4 v0, 0x4

    if-eq p1, v0, :cond_0

    .line 193
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v1, "Not back key. Delegating to super..."

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->verbose(Ljava/lang/String;)V

    .line 194
    invoke-super {p0, p1, p2}, Landroid/app/Dialog;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1

    .line 197
    :cond_0
    iget-boolean p1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->backButtonEnabled:Z

    const/4 p2, 0x1

    if-nez p1, :cond_1

    .line 198
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object p1

    const-string v0, "Back button is not enabled. Ignore."

    invoke-virtual {p1, v0}, Lcom/onevcat/uniwebview/Logger;->verbose(Ljava/lang/String;)V

    return p2

    .line 202
    :cond_1
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->goBack()Z

    move-result p1

    if-nez p1, :cond_2

    .line 203
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object p1

    const-string v0, "No back page for the web view. Trying to close current web view..."

    invoke-virtual {p1, v0}, Lcom/onevcat/uniwebview/Logger;->verbose(Ljava/lang/String;)V

    .line 204
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->listener:Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;

    invoke-interface {p1, p0}, Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;->onDialogClosedByBackButton(Lcom/onevcat/uniwebview/UniWebViewDialog;)V

    :cond_2
    return p2
.end method

.method protected onStop()V
    .locals 1

    .line 222
    invoke-super {p0}, Landroid/app/Dialog;->onStop()V

    .line 223
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->listener:Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;

    invoke-interface {v0, p0}, Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;->onDialogClose(Lcom/onevcat/uniwebview/UniWebViewDialog;)V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 163
    iget-boolean v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->touchFromAnotherDialog:Z

    if-nez v0, :cond_0

    .line 164
    invoke-static {}, Lcom/onevcat/uniwebview/UniWebViewManager;->getInstance()Lcom/onevcat/uniwebview/UniWebViewManager;

    move-result-object v0

    iget-object v1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->activity:Landroid/app/Activity;

    invoke-virtual {v0, p0, v1, p1}, Lcom/onevcat/uniwebview/UniWebViewManager;->handleTouchEvent(Lcom/onevcat/uniwebview/UniWebViewDialog;Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result p1

    return p1

    .line 166
    :cond_0
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->webViewContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getVisibility()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_2

    .line 167
    invoke-direct {p0, p1}, Lcom/onevcat/uniwebview/UniWebViewDialog;->isEventInside(Landroid/view/MotionEvent;)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_1

    :cond_2
    const/4 v1, 0x0

    :goto_1
    return v1
.end method

.method public onVisibilityChanged(Z)V
    .locals 1

    if-nez p1, :cond_0

    .line 798
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    .line 799
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewDialog$9;

    invoke-direct {v0, p0}, Lcom/onevcat/uniwebview/UniWebViewDialog$9;-><init>(Lcom/onevcat/uniwebview/UniWebViewDialog;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method openUrlExternal(Ljava/lang/String;)Z
    .locals 4

    .line 695
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->uniWebView:Lcom/onevcat/uniwebview/UniWebView;

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lcom/onevcat/uniwebview/UniWebView;->getHitTestResult()Landroid/webkit/WebView$HitTestResult;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 700
    :cond_0
    iget-boolean v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->openLinksInExternalBrowser:Z

    if-nez v0, :cond_1

    .line 701
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object p1

    const-string v0, "UniWebView should open links in current web view."

    invoke-virtual {p1, v0}, Lcom/onevcat/uniwebview/Logger;->verbose(Ljava/lang/String;)V

    return v1

    .line 705
    :cond_1
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->uniWebView:Lcom/onevcat/uniwebview/UniWebView;

    invoke-virtual {v0}, Lcom/onevcat/uniwebview/UniWebView;->getHitTestResult()Landroid/webkit/WebView$HitTestResult;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebView$HitTestResult;->getType()I

    move-result v0

    if-nez v0, :cond_2

    .line 706
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object p1

    const-string v0, "UniWebView getHitTestResult unknown. Do not open url externally."

    invoke-virtual {p1, v0}, Lcom/onevcat/uniwebview/Logger;->debug(Ljava/lang/String;)V

    return v1

    .line 710
    :cond_2
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v1, "UniWebView is opening links in external browser."

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->verbose(Ljava/lang/String;)V

    .line 712
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 713
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 714
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    const/4 p1, 0x1

    return p1

    .line 696
    :cond_3
    :goto_0
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to open url due to dialog or webview being null. Url: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/onevcat/uniwebview/Logger;->critical(Ljava/lang/String;)V

    return v1
.end method

.method print()V
    .locals 4

    .line 749
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "print"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/print/PrintManager;

    .line 750
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getWebView()Lcom/onevcat/uniwebview/UniWebView;

    move-result-object v1

    iget-object v2, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->uniWebView:Lcom/onevcat/uniwebview/UniWebView;

    invoke-virtual {v2}, Lcom/onevcat/uniwebview/UniWebView;->getUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/onevcat/uniwebview/UniWebView;->createPrintDocumentAdapter(Ljava/lang/String;)Landroid/print/PrintDocumentAdapter;

    move-result-object v1

    .line 751
    new-instance v2, Landroid/print/PrintAttributes$Builder;

    invoke-direct {v2}, Landroid/print/PrintAttributes$Builder;-><init>()V

    invoke-virtual {v2}, Landroid/print/PrintAttributes$Builder;->build()Landroid/print/PrintAttributes;

    move-result-object v2

    const-string v3, "UniWebView Printing"

    invoke-virtual {v0, v3, v1, v2}, Landroid/print/PrintManager;->print(Ljava/lang/String;Landroid/print/PrintDocumentAdapter;Landroid/print/PrintAttributes;)Landroid/print/PrintJob;

    return-void
.end method

.method setBackButtonEnabled(Z)V
    .locals 0

    .line 826
    iput-boolean p1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->backButtonEnabled:Z

    return-void
.end method

.method setBackgroundColor(FFFF)V
    .locals 1

    const/high16 v0, 0x437f0000    # 255.0f

    mul-float p1, p1, v0

    float-to-int p1, p1

    mul-float p2, p2, v0

    float-to-int p2, p2

    mul-float p3, p3, v0

    float-to-int p3, p3

    mul-float p4, p4, v0

    float-to-int p4, p4

    .line 607
    invoke-static {p4, p1, p2, p3}, Landroid/graphics/Color;->argb(IIII)I

    move-result p1

    .line 608
    iget-object p2, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->webViewContainer:Landroid/widget/FrameLayout;

    new-instance p3, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {p3, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p2, p3}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 609
    iget-object p2, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->videoContainer:Landroid/widget/FrameLayout;

    new-instance p3, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {p3, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p2, p3}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method setBouncesEnabled(Z)V
    .locals 1

    if-eqz p1, :cond_0

    .line 815
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->uniWebView:Lcom/onevcat/uniwebview/UniWebView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/onevcat/uniwebview/UniWebView;->setOverScrollMode(I)V

    goto :goto_0

    .line 817
    :cond_0
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->uniWebView:Lcom/onevcat/uniwebview/UniWebView;

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Lcom/onevcat/uniwebview/UniWebView;->setOverScrollMode(I)V

    :goto_0
    return-void
.end method

.method setCalloutEnabled(Z)V
    .locals 1

    .line 822
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->uniWebView:Lcom/onevcat/uniwebview/UniWebView;

    iput-boolean p1, v0, Lcom/onevcat/uniwebview/UniWebView;->calloutEnabled:Z

    return-void
.end method

.method setFrame(IIII)V
    .locals 5

    .line 233
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    .line 234
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x2

    aput-object v3, v2, v4

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x3

    aput-object v3, v2, v4

    const-string v3, "Setting web dialog frame to {%d, %d, %d, %d}"

    invoke-static {v1, v3, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 233
    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->verbose(Ljava/lang/String;)V

    .line 237
    invoke-virtual {p0, p1, p2}, Lcom/onevcat/uniwebview/UniWebViewDialog;->setPosition(II)V

    .line 238
    invoke-virtual {p0, p3, p4}, Lcom/onevcat/uniwebview/UniWebViewDialog;->setSize(II)V

    return-void
.end method

.method setHeaderField(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_2

    .line 846
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    if-nez p2, :cond_1

    .line 852
    iget-object p2, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->headers:Ljava/util/HashMap;

    invoke-virtual {p2, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 854
    :cond_1
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->headers:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_0
    return-void

    .line 847
    :cond_2
    :goto_1
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object p1

    const-string p2, "Trying to set null or empty key for header field. Please check you have set correct key."

    invoke-virtual {p1, p2}, Lcom/onevcat/uniwebview/Logger;->critical(Ljava/lang/String;)V

    return-void
.end method

.method setImmersiveMode(Z)V
    .locals 0

    .line 809
    iput-boolean p1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->immersiveMode:Z

    .line 810
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->hideSystemUI()V

    return-void
.end method

.method setLoading(Z)V
    .locals 0

    .line 738
    iput-boolean p1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->isLoading:Z

    return-void
.end method

.method setOpenLinksInExternalBrowser(Z)V
    .locals 0

    .line 613
    iput-boolean p1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->openLinksInExternalBrowser:Z

    return-void
.end method

.method setPosition(II)V
    .locals 3

    .line 242
    iput p1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->x:I

    .line 243
    iput p2, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->y:I

    .line 245
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 246
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    const/16 v2, 0x33

    .line 247
    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    const/4 v2, 0x0

    .line 248
    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 249
    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 251
    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 253
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->webViewContainer:Landroid/widget/FrameLayout;

    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/widget/FrameLayout;->setX(F)V

    .line 254
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->webViewContainer:Landroid/widget/FrameLayout;

    int-to-float p2, p2

    invoke-virtual {p1, p2}, Landroid/widget/FrameLayout;->setY(F)V

    return-void
.end method

.method setShow(ZZIFLjava/lang/String;)Z
    .locals 4

    .line 280
    iget-boolean v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->webViewVisible:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    .line 281
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object p1

    const-string p2, "Showing web view is ignored since it is already visible."

    invoke-virtual {p1, p2}, Lcom/onevcat/uniwebview/Logger;->critical(Ljava/lang/String;)V

    return v1

    .line 286
    :cond_0
    iget-boolean v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->webViewVisible:Z

    if-nez v0, :cond_1

    if-nez p1, :cond_1

    .line 287
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object p1

    const-string p2, "Hiding web view is ignored since it is already invisible."

    invoke-virtual {p1, p2}, Lcom/onevcat/uniwebview/Logger;->critical(Ljava/lang/String;)V

    return v1

    .line 291
    :cond_1
    iget-boolean v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->animating:Z

    if-eqz v0, :cond_2

    .line 292
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object p1

    const-string p2, "Trying to animate but another transition animation is not finished yet. Ignore this one."

    invoke-virtual {p1, p2}, Lcom/onevcat/uniwebview/Logger;->critical(Ljava/lang/String;)V

    return v1

    .line 296
    :cond_2
    iget-boolean v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->webViewShowing:Z

    const/4 v2, 0x1

    if-eqz v0, :cond_4

    .line 297
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->webViewContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getVisibility()I

    move-result v0

    if-nez v0, :cond_3

    const/4 v0, 0x1

    goto :goto_0

    :cond_3
    const/4 v0, 0x0

    :goto_0
    if-ne p1, v0, :cond_4

    return v1

    :cond_4
    if-eqz p1, :cond_5

    .line 304
    iput-boolean v2, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->webViewVisible:Z

    .line 305
    invoke-direct {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->showDialog()V

    .line 306
    invoke-static {}, Lcom/onevcat/uniwebview/UniWebViewManager;->getInstance()Lcom/onevcat/uniwebview/UniWebViewManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/onevcat/uniwebview/UniWebViewManager;->addShowingDialog(Lcom/onevcat/uniwebview/UniWebViewDialog;)V

    .line 308
    iget-boolean v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->showSpinnerWhileLoading:Z

    if-eqz v0, :cond_6

    iget-boolean v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->isLoading:Z

    if-eqz v0, :cond_6

    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->showSpinner()V

    goto :goto_1

    .line 311
    :cond_5
    iput-boolean v1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->webViewVisible:Z

    .line 313
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->activity:Landroid/app/Activity;

    const-string v3, "input_method"

    invoke-virtual {v0, v3}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 314
    iget-object v3, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->uniWebView:Lcom/onevcat/uniwebview/UniWebView;

    invoke-virtual {v3}, Lcom/onevcat/uniwebview/UniWebView;->getWindowToken()Landroid/os/IBinder;

    move-result-object v3

    invoke-virtual {v0, v3, v1}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 316
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->hideSpinner()V

    :cond_6
    :goto_1
    if-nez p2, :cond_7

    if-nez p3, :cond_7

    .line 326
    new-instance p2, Landroid/os/Handler;

    invoke-direct {p2}, Landroid/os/Handler;-><init>()V

    .line 327
    new-instance p3, Lcom/onevcat/uniwebview/UniWebViewDialog$1;

    invoke-direct {p3, p0, p1, p5}, Lcom/onevcat/uniwebview/UniWebViewDialog$1;-><init>(Lcom/onevcat/uniwebview/UniWebViewDialog;ZLjava/lang/String;)V

    const-wide/16 p4, 0x1

    invoke-virtual {p2, p3, p4, p5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_2

    .line 336
    :cond_7
    invoke-direct/range {p0 .. p5}, Lcom/onevcat/uniwebview/UniWebViewDialog;->animatedShow(ZZIFLjava/lang/String;)V

    :goto_2
    return v2
.end method

.method public setShowHTTPAuthPopUpWindow(Z)V
    .locals 0

    .line 982
    iput-boolean p1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->showHTTPAuthPopUpWindow:Z

    return-void
.end method

.method setShowSpinnerWhileLoading(Z)V
    .locals 0

    .line 745
    iput-boolean p1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->showSpinnerWhileLoading:Z

    return-void
.end method

.method setSize(II)V
    .locals 1

    const/4 v0, 0x0

    .line 259
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->width:I

    .line 260
    invoke-static {v0, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->height:I

    .line 262
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    .line 263
    invoke-direct {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->displaySize()Landroid/graphics/Point;

    move-result-object p2

    .line 265
    iget v0, p2, Landroid/graphics/Point;->x:I

    iget p2, p2, Landroid/graphics/Point;->y:I

    invoke-virtual {p1, v0, p2}, Landroid/view/Window;->setLayout(II)V

    .line 267
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->webViewContainer:Landroid/widget/FrameLayout;

    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    .line 268
    iget p2, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->width:I

    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 269
    iget p2, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->height:I

    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 270
    iget-object p2, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->webViewContainer:Landroid/widget/FrameLayout;

    invoke-virtual {p2, p1}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method setSpinnerText(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 580
    iput-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->spinnerText:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const-string v0, "Loading..."

    .line 582
    iput-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->spinnerText:Ljava/lang/String;

    .line 584
    :goto_0
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->spinner:Landroid/app/ProgressDialog;

    invoke-virtual {v0, p1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    return-void
.end method

.method setWebViewAlpha(FZ)V
    .locals 3

    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v2, p1, v1

    if-lez v2, :cond_0

    const/high16 p1, 0x3f800000    # 1.0f

    goto :goto_0

    :cond_0
    cmpg-float v1, p1, v0

    if-gez v1, :cond_1

    const/4 p1, 0x0

    .line 839
    :cond_1
    :goto_0
    iput p1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->webViewAlpha:F

    if-eqz p2, :cond_2

    .line 841
    iget-object p2, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->webViewContainer:Landroid/widget/FrameLayout;

    invoke-virtual {p2, p1}, Landroid/widget/FrameLayout;->setAlpha(F)V

    :cond_2
    return-void
.end method

.method setZoomEnabled(Z)V
    .locals 1

    .line 830
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->uniWebView:Lcom/onevcat/uniwebview/UniWebView;

    invoke-virtual {v0}, Lcom/onevcat/uniwebview/UniWebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    return-void
.end method

.method shouldOverride(Ljava/lang/String;Z)Z
    .locals 5

    .line 427
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    .line 428
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "shouldOverrideUrlLoading for: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 429
    new-instance v1, Lcom/onevcat/uniwebview/URLLoadingResponser;

    iget-object v2, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->activity:Landroid/app/Activity;

    invoke-direct {v1, v2, p0, p1}, Lcom/onevcat/uniwebview/URLLoadingResponser;-><init>(Landroid/content/Context;Lcom/onevcat/uniwebview/UniWebViewDialog;Ljava/lang/String;)V

    .line 431
    invoke-virtual {v1}, Lcom/onevcat/uniwebview/URLLoadingResponser;->canResponseBuiltinScheme()Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_0

    const-string p1, "Url handled internally in UniWebView."

    .line 432
    invoke-virtual {v0, p1}, Lcom/onevcat/uniwebview/Logger;->debug(Ljava/lang/String;)V

    return v3

    .line 436
    :cond_0
    invoke-virtual {v1}, Lcom/onevcat/uniwebview/URLLoadingResponser;->handleWithIntent()Z

    move-result v2

    if-eqz v2, :cond_1

    const-string p1, "Url handled by intent."

    .line 437
    invoke-virtual {v0, p1}, Lcom/onevcat/uniwebview/Logger;->debug(Ljava/lang/String;)V

    return v3

    .line 441
    :cond_1
    invoke-virtual {v1}, Lcom/onevcat/uniwebview/URLLoadingResponser;->canResponseDefinedScheme()Z

    move-result v2

    const-string v4, "Url redirected to Unity: "

    if-eqz v2, :cond_2

    .line 442
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Lcom/onevcat/uniwebview/Logger;->debug(Ljava/lang/String;)V

    .line 443
    iget-object p2, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->listener:Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;

    invoke-interface {p2, p0, p1}, Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;->onSendMessageReceived(Lcom/onevcat/uniwebview/UniWebViewDialog;Ljava/lang/String;)V

    return v3

    :cond_2
    if-eqz p2, :cond_3

    .line 447
    invoke-virtual {p0, p1}, Lcom/onevcat/uniwebview/UniWebViewDialog;->openUrlExternal(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_3

    .line 448
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/onevcat/uniwebview/Logger;->debug(Ljava/lang/String;)V

    return v3

    .line 452
    :cond_3
    invoke-virtual {v1}, Lcom/onevcat/uniwebview/URLLoadingResponser;->handleWithThirdPartyApp()Z

    move-result p2

    if-eqz p2, :cond_4

    .line 453
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Url handled by a third party app: "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/onevcat/uniwebview/Logger;->debug(Ljava/lang/String;)V

    return v3

    .line 457
    :cond_4
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Url is opening without overridden: "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/onevcat/uniwebview/Logger;->debug(Ljava/lang/String;)V

    const/4 p1, 0x0

    return p1
.end method

.method showSpinner()V
    .locals 2

    .line 588
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v1, "Show spinner for loading."

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->verbose(Ljava/lang/String;)V

    .line 589
    iget-boolean v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->immersiveMode:Z

    if-eqz v0, :cond_0

    .line 590
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->spinner:Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/onevcat/uniwebview/UniWebViewDialog;->immersiveShow(Landroid/app/Dialog;Landroid/view/Window;)V

    goto :goto_0

    .line 592
    :cond_0
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->spinner:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    :goto_0
    return-void
.end method

.method stop()V
    .locals 2

    .line 422
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->uniWebView:Lcom/onevcat/uniwebview/UniWebView;

    invoke-virtual {v0}, Lcom/onevcat/uniwebview/UniWebView;->stopLoading()V

    .line 423
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->uniWebView:Lcom/onevcat/uniwebview/UniWebView;

    invoke-virtual {v0}, Lcom/onevcat/uniwebview/UniWebView;->getClient()Lcom/onevcat/uniwebview/UniWebViewClient;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/UniWebViewClient;->setUserStopped(Z)V

    return-void
.end method

.method updateFrame()V
    .locals 2

    .line 274
    iget v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->x:I

    iget v1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->y:I

    invoke-virtual {p0, v0, v1}, Lcom/onevcat/uniwebview/UniWebViewDialog;->setPosition(II)V

    .line 275
    iget v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->width:I

    iget v1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog;->height:I

    invoke-virtual {p0, v0, v1}, Lcom/onevcat/uniwebview/UniWebViewDialog;->setSize(II)V

    return-void
.end method
