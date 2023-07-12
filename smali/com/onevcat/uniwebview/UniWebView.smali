.class Lcom/onevcat/uniwebview/UniWebView;
.super Lcom/onevcat/uniwebview/VideoEnabledWebView;
.source "UniWebView.java"


# static fields
.field private static allowAutoPlay:Z = false

.field private static allowJavaScriptOpenWindow:Z = false

.field private static javaScriptEnabled:Z = true


# instance fields
.field private activity:Landroid/app/Activity;

.field calloutEnabled:Z

.field private client:Lcom/onevcat/uniwebview/UniWebViewClient;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .locals 4

    .line 49
    invoke-direct {p0, p1}, Lcom/onevcat/uniwebview/VideoEnabledWebView;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x1

    .line 45
    iput-boolean v0, p0, Lcom/onevcat/uniwebview/UniWebView;->calloutEnabled:Z

    .line 50
    move-object v1, p1

    check-cast v1, Landroid/app/Activity;

    iput-object v1, p0, Lcom/onevcat/uniwebview/UniWebView;->activity:Landroid/app/Activity;

    .line 51
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    .line 52
    invoke-virtual {v1, v0}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 53
    invoke-virtual {v1, v0}, Landroid/webkit/WebSettings;->setDatabaseEnabled(Z)V

    .line 54
    invoke-virtual {v1, v0}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    .line 55
    invoke-virtual {v1, v0}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    .line 56
    invoke-virtual {v1, v0}, Landroid/webkit/WebSettings;->setGeolocationEnabled(Z)V

    const/4 v2, 0x0

    .line 57
    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setDisplayZoomControls(Z)V

    .line 58
    invoke-virtual {v1, v0}, Landroid/webkit/WebSettings;->setAllowFileAccessFromFileURLs(Z)V

    .line 59
    invoke-virtual {v1, v0}, Landroid/webkit/WebSettings;->setAllowUniversalAccessFromFileURLs(Z)V

    .line 61
    sget-boolean v3, Lcom/onevcat/uniwebview/UniWebView;->allowAutoPlay:Z

    xor-int/2addr v3, v0

    invoke-virtual {v1, v3}, Landroid/webkit/WebSettings;->setMediaPlaybackRequiresUserGesture(Z)V

    .line 62
    sget-boolean v3, Lcom/onevcat/uniwebview/UniWebView;->allowJavaScriptOpenWindow:Z

    invoke-virtual {v1, v3}, Landroid/webkit/WebSettings;->setJavaScriptCanOpenWindowsAutomatically(Z)V

    .line 63
    sget-boolean v3, Lcom/onevcat/uniwebview/UniWebView;->javaScriptEnabled:Z

    invoke-virtual {v1, v3}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    const/4 v3, 0x2

    .line 64
    invoke-virtual {v1, v3}, Landroid/webkit/WebSettings;->setMixedContentMode(I)V

    .line 66
    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object p1

    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p1

    .line 67
    invoke-virtual {v1, p1}, Landroid/webkit/WebSettings;->setAppCachePath(Ljava/lang/String;)V

    .line 68
    invoke-virtual {v1, v0}, Landroid/webkit/WebSettings;->setAppCacheEnabled(Z)V

    .line 70
    invoke-virtual {p0, v2}, Lcom/onevcat/uniwebview/UniWebView;->setScrollBarStyle(I)V

    .line 72
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v0, -0x1

    invoke-direct {p1, v0, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 74
    invoke-virtual {p0, p1}, Lcom/onevcat/uniwebview/UniWebView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method static synthetic access$000(Lcom/onevcat/uniwebview/UniWebView;)Landroid/app/Activity;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/onevcat/uniwebview/UniWebView;->activity:Landroid/app/Activity;

    return-object p0
.end method

.method static clearCookies()V
    .locals 2

    .line 78
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v0

    const/4 v1, 0x0

    .line 79
    invoke-virtual {v0, v1}, Landroid/webkit/CookieManager;->removeAllCookies(Landroid/webkit/ValueCallback;)V

    .line 80
    invoke-virtual {v0}, Landroid/webkit/CookieManager;->flush()V

    .line 81
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v1, "Cookie manager flushed."

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->verbose(Ljava/lang/String;)V

    return-void
.end method

.method static getCookie(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    .line 96
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    .line 99
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v1

    .line 100
    invoke-virtual {v1, p0}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    if-nez v1, :cond_0

    .line 102
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "The content for url is not found in cookie. Url: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/onevcat/uniwebview/Logger;->debug(Ljava/lang/String;)V

    return-object v2

    .line 106
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Cookie string is found: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ", for url: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/onevcat/uniwebview/Logger;->verbose(Ljava/lang/String;)V

    .line 107
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Trying to parse cookie to find for key: "

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/onevcat/uniwebview/Logger;->verbose(Ljava/lang/String;)V

    const-string p0, ";"

    .line 109
    invoke-virtual {v1, p0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 110
    array-length v1, p0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_2

    aget-object v4, p0, v3

    .line 111
    invoke-virtual {v4, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1

    const-string v5, "="

    const/4 v6, 0x2

    .line 112
    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v4

    .line 113
    array-length v5, v4

    if-lt v5, v6, :cond_1

    const/4 v2, 0x1

    .line 114
    aget-object v2, v4, v2

    .line 115
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Found cookie value: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ", for key: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/onevcat/uniwebview/Logger;->verbose(Ljava/lang/String;)V

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    return-object v2
.end method

.method static setAllowAutoPlay(Z)V
    .locals 0

    .line 38
    sput-boolean p0, Lcom/onevcat/uniwebview/UniWebView;->allowAutoPlay:Z

    return-void
.end method

.method static setAllowJavaScriptOpenWindow(Z)V
    .locals 0

    .line 39
    sput-boolean p0, Lcom/onevcat/uniwebview/UniWebView;->allowJavaScriptOpenWindow:Z

    return-void
.end method

.method static setCookie(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 85
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    .line 87
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v1

    .line 88
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cookie set for url: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ". Content: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/onevcat/uniwebview/Logger;->verbose(Ljava/lang/String;)V

    .line 90
    invoke-virtual {v1, p0, p1}, Landroid/webkit/CookieManager;->setCookie(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    invoke-virtual {v1}, Landroid/webkit/CookieManager;->flush()V

    const-string p0, "Cookie manager flushed."

    .line 92
    invoke-virtual {v0, p0}, Lcom/onevcat/uniwebview/Logger;->verbose(Ljava/lang/String;)V

    return-void
.end method

.method static setJavaScriptEnabled(Z)V
    .locals 0

    .line 40
    sput-boolean p0, Lcom/onevcat/uniwebview/UniWebView;->javaScriptEnabled:Z

    return-void
.end method


# virtual methods
.method public getClient()Lcom/onevcat/uniwebview/UniWebViewClient;
    .locals 1

    .line 124
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebView;->client:Lcom/onevcat/uniwebview/UniWebViewClient;

    return-object v0
.end method

.method public getCustomizeHeaders()Ljava/util/HashMap;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 133
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Stub!"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected onCreateContextMenu(Landroid/view/ContextMenu;)V
    .locals 4

    .line 139
    iget-boolean v0, p0, Lcom/onevcat/uniwebview/UniWebView;->calloutEnabled:Z

    if-nez v0, :cond_0

    return-void

    .line 143
    :cond_0
    invoke-super {p0, p1}, Lcom/onevcat/uniwebview/VideoEnabledWebView;->onCreateContextMenu(Landroid/view/ContextMenu;)V

    .line 145
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebView;->getHitTestResult()Landroid/webkit/WebView$HitTestResult;

    move-result-object v0

    .line 146
    invoke-virtual {v0}, Landroid/webkit/WebView$HitTestResult;->getType()I

    move-result v1

    const/4 v2, 0x5

    if-eq v1, v2, :cond_1

    const/16 v2, 0x8

    if-ne v1, v2, :cond_3

    .line 148
    :cond_1
    invoke-virtual {v0}, Landroid/webkit/WebView$HitTestResult;->getExtra()Ljava/lang/String;

    move-result-object v0

    .line 149
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "http://"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "https://"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    return-void

    .line 153
    :cond_2
    invoke-interface {p1, v0}, Landroid/view/ContextMenu;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    const/4 v1, 0x1

    const/4 v2, 0x0

    const-string v3, "Save Image"

    .line 154
    invoke-interface {p1, v2, v1, v2, v3}, Landroid/view/ContextMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p1

    new-instance v1, Lcom/onevcat/uniwebview/UniWebView$1;

    invoke-direct {v1, p0, v0}, Lcom/onevcat/uniwebview/UniWebView$1;-><init>(Lcom/onevcat/uniwebview/UniWebView;Ljava/lang/String;)V

    invoke-interface {p1, v1}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    :cond_3
    return-void
.end method

.method public setClient(Lcom/onevcat/uniwebview/UniWebViewClient;)V
    .locals 0

    .line 128
    iput-object p1, p0, Lcom/onevcat/uniwebview/UniWebView;->client:Lcom/onevcat/uniwebview/UniWebViewClient;

    .line 129
    invoke-virtual {p0, p1}, Lcom/onevcat/uniwebview/UniWebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    return-void
.end method
