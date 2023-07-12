.class public Lcom/onevcat/uniwebview/VideoEnabledWebView;
.super Landroid/webkit/WebView;
.source "VideoEnabledWebView.java"


# instance fields
.field private videoEnabledWebChromeClient:Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 42
    invoke-direct {p0, p1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 48
    invoke-direct {p0, p1, p2}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 54
    invoke-direct {p0, p1, p2, p3}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method static synthetic access$000(Lcom/onevcat/uniwebview/VideoEnabledWebView;)Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;
    .locals 0

    .line 18
    iget-object p0, p0, Lcom/onevcat/uniwebview/VideoEnabledWebView;->videoEnabledWebChromeClient:Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;

    return-object p0
.end method


# virtual methods
.method public isVideoFullscreen()Z
    .locals 1

    .line 64
    iget-object v0, p0, Lcom/onevcat/uniwebview/VideoEnabledWebView;->videoEnabledWebChromeClient:Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->isVideoFullscreen()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public notifyVideoEnd()V
    .locals 2

    const-string v0, "___"

    const-string v1, "GOT IT"

    .line 24
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/onevcat/uniwebview/VideoEnabledWebView$1;

    invoke-direct {v1, p0}, Lcom/onevcat/uniwebview/VideoEnabledWebView$1;-><init>(Lcom/onevcat/uniwebview/VideoEnabledWebView;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public setWebChromeClient(Landroid/webkit/WebChromeClient;)V
    .locals 2

    .line 73
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/VideoEnabledWebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 75
    instance-of v0, p1, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;

    if-eqz v0, :cond_0

    .line 77
    move-object v0, p1

    check-cast v0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;

    iput-object v0, p0, Lcom/onevcat/uniwebview/VideoEnabledWebView;->videoEnabledWebChromeClient:Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;

    .line 80
    :cond_0
    invoke-super {p0, p1}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    return-void
.end method
