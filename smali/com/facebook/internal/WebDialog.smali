.class public Lcom/facebook/internal/WebDialog;
.super Landroid/app/Dialog;
.source "WebDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/internal/WebDialog$UploadStagingResourcesTask;,
        Lcom/facebook/internal/WebDialog$Builder;,
        Lcom/facebook/internal/WebDialog$DialogWebViewClient;,
        Lcom/facebook/internal/WebDialog$OnCompleteListener;,
        Lcom/facebook/internal/WebDialog$InitCallback;
    }
.end annotation


# static fields
.field private static final API_EC_DIALOG_CANCEL:I = 0x1069

.field private static final BACKGROUND_GRAY:I = -0x34000000

.field private static final DEFAULT_THEME:I

.field static final DISABLE_SSL_CHECK_FOR_TESTING:Z = false

.field private static final DISPLAY_TOUCH:Ljava/lang/String; = "touch"

.field private static final LOG_TAG:Ljava/lang/String; = "FacebookSDK.WebDialog"

.field private static final MAX_PADDING_SCREEN_HEIGHT:I = 0x500

.field private static final MAX_PADDING_SCREEN_WIDTH:I = 0x320

.field private static final MIN_SCALE_FACTOR:D = 0.5

.field private static final NO_PADDING_SCREEN_HEIGHT:I = 0x320

.field private static final NO_PADDING_SCREEN_WIDTH:I = 0x1e0

.field private static final PLATFORM_DIALOG_PATH_REGEX:Ljava/lang/String; = "^/(v\\d+\\.\\d+/)??dialog/.*"

.field private static initCallback:Lcom/facebook/internal/WebDialog$InitCallback;

.field private static volatile webDialogTheme:I


# instance fields
.field private contentFrameLayout:Landroid/widget/FrameLayout;

.field private crossImageView:Landroid/widget/ImageView;

.field private expectedRedirectUrl:Ljava/lang/String;

.field private isDetached:Z

.field private isPageFinished:Z

.field private listenerCalled:Z

.field private onCompleteListener:Lcom/facebook/internal/WebDialog$OnCompleteListener;

.field private spinner:Landroid/app/ProgressDialog;

.field private uploadTask:Lcom/facebook/internal/WebDialog$UploadStagingResourcesTask;

.field private url:Ljava/lang/String;

.field private webView:Landroid/webkit/WebView;

.field private windowParams:Landroid/view/WindowManager$LayoutParams;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 116
    sget v0, Lcom/facebook/common/R$style;->com_facebook_activity_theme:I

    sput v0, Lcom/facebook/internal/WebDialog;->DEFAULT_THEME:I

    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 224
    invoke-static {}, Lcom/facebook/internal/WebDialog;->getWebDialogTheme()I

    move-result v0

    invoke-direct {p0, p1, p2, v0}, Lcom/facebook/internal/WebDialog;-><init>(Landroid/content/Context;Ljava/lang/String;I)V

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 0

    if-nez p3, :cond_0

    .line 237
    invoke-static {}, Lcom/facebook/internal/WebDialog;->getWebDialogTheme()I

    move-result p3

    :cond_0
    invoke-direct {p0, p1, p3}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    const-string p1, "fbconnect://success"

    .line 119
    iput-object p1, p0, Lcom/facebook/internal/WebDialog;->expectedRedirectUrl:Ljava/lang/String;

    const/4 p1, 0x0

    .line 126
    iput-boolean p1, p0, Lcom/facebook/internal/WebDialog;->listenerCalled:Z

    .line 127
    iput-boolean p1, p0, Lcom/facebook/internal/WebDialog;->isDetached:Z

    .line 128
    iput-boolean p1, p0, Lcom/facebook/internal/WebDialog;->isPageFinished:Z

    .line 238
    iput-object p2, p0, Lcom/facebook/internal/WebDialog;->url:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;ILcom/facebook/internal/WebDialog$OnCompleteListener;)V
    .locals 7

    .line 252
    sget-object v5, Lcom/facebook/login/LoginTargetApp;->FACEBOOK:Lcom/facebook/login/LoginTargetApp;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/facebook/internal/WebDialog;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;ILcom/facebook/login/LoginTargetApp;Lcom/facebook/internal/WebDialog$OnCompleteListener;)V

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;ILcom/facebook/login/LoginTargetApp;Lcom/facebook/internal/WebDialog$OnCompleteListener;)V
    .locals 3

    if-nez p4, :cond_0

    .line 272
    invoke-static {}, Lcom/facebook/internal/WebDialog;->getWebDialogTheme()I

    move-result p4

    :cond_0
    invoke-direct {p0, p1, p4}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    const-string p4, "fbconnect://success"

    .line 119
    iput-object p4, p0, Lcom/facebook/internal/WebDialog;->expectedRedirectUrl:Ljava/lang/String;

    const/4 v0, 0x0

    .line 126
    iput-boolean v0, p0, Lcom/facebook/internal/WebDialog;->listenerCalled:Z

    .line 127
    iput-boolean v0, p0, Lcom/facebook/internal/WebDialog;->isDetached:Z

    .line 128
    iput-boolean v0, p0, Lcom/facebook/internal/WebDialog;->isPageFinished:Z

    if-nez p3, :cond_1

    .line 275
    new-instance p3, Landroid/os/Bundle;

    invoke-direct {p3}, Landroid/os/Bundle;-><init>()V

    .line 278
    :cond_1
    invoke-static {p1}, Lcom/facebook/internal/Utility;->isChromeOS(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_2

    const-string p4, "fbconnect://chrome_os_success"

    .line 280
    :cond_2
    iput-object p4, p0, Lcom/facebook/internal/WebDialog;->expectedRedirectUrl:Ljava/lang/String;

    const-string p1, "redirect_uri"

    .line 286
    invoke-virtual {p3, p1, p4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "display"

    const-string p4, "touch"

    .line 288
    invoke-virtual {p3, p1, p4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    invoke-static {}, Lcom/facebook/FacebookSdk;->getApplicationId()Ljava/lang/String;

    move-result-object p1

    const-string p4, "client_id"

    invoke-virtual {p3, p4, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 292
    sget-object p1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const/4 p4, 0x1

    new-array v1, p4, [Ljava/lang/Object;

    .line 294
    invoke-static {}, Lcom/facebook/FacebookSdk;->getSdkVersion()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v0

    const-string v0, "android-%s"

    invoke-static {p1, v0, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "sdk"

    .line 292
    invoke-virtual {p3, v0, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 296
    iput-object p6, p0, Lcom/facebook/internal/WebDialog;->onCompleteListener:Lcom/facebook/internal/WebDialog$OnCompleteListener;

    const-string p1, "share"

    .line 298
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    const-string p1, "media"

    .line 299
    invoke-virtual {p3, p1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 300
    new-instance p1, Lcom/facebook/internal/WebDialog$UploadStagingResourcesTask;

    invoke-direct {p1, p0, p2, p3}, Lcom/facebook/internal/WebDialog$UploadStagingResourcesTask;-><init>(Lcom/facebook/internal/WebDialog;Ljava/lang/String;Landroid/os/Bundle;)V

    iput-object p1, p0, Lcom/facebook/internal/WebDialog;->uploadTask:Lcom/facebook/internal/WebDialog$UploadStagingResourcesTask;

    goto :goto_1

    .line 303
    :cond_3
    sget-object p1, Lcom/facebook/internal/WebDialog$5;->$SwitchMap$com$facebook$login$LoginTargetApp:[I

    invoke-virtual {p5}, Lcom/facebook/login/LoginTargetApp;->ordinal()I

    move-result p5

    aget p1, p1, p5

    if-eq p1, p4, :cond_4

    .line 314
    invoke-static {}, Lcom/facebook/internal/ServerProtocol;->getDialogAuthority()Ljava/lang/String;

    move-result-object p1

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    .line 315
    invoke-static {}, Lcom/facebook/FacebookSdk;->getGraphApiVersion()Ljava/lang/String;

    move-result-object p5

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p5, "/"

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p5, "dialog/"

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 313
    invoke-static {p1, p2, p3}, Lcom/facebook/internal/Utility;->buildUri(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/net/Uri;

    move-result-object p1

    goto :goto_0

    .line 307
    :cond_4
    invoke-static {}, Lcom/facebook/internal/ServerProtocol;->getInstagramDialogAuthority()Ljava/lang/String;

    move-result-object p1

    const-string p2, "oauth/authorize"

    .line 306
    invoke-static {p1, p2, p3}, Lcom/facebook/internal/Utility;->buildUri(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/net/Uri;

    move-result-object p1

    .line 318
    :goto_0
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/internal/WebDialog;->url:Ljava/lang/String;

    :goto_1
    return-void
.end method

.method static synthetic access$100(Lcom/facebook/internal/WebDialog;)Ljava/lang/String;
    .locals 0

    .line 93
    iget-object p0, p0, Lcom/facebook/internal/WebDialog;->expectedRedirectUrl:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/facebook/internal/WebDialog;I)V
    .locals 0

    .line 93
    invoke-direct {p0, p1}, Lcom/facebook/internal/WebDialog;->setUpWebView(I)V

    return-void
.end method

.method static synthetic access$200(Lcom/facebook/internal/WebDialog;)Z
    .locals 0

    .line 93
    iget-boolean p0, p0, Lcom/facebook/internal/WebDialog;->isDetached:Z

    return p0
.end method

.method static synthetic access$300(Lcom/facebook/internal/WebDialog;)Landroid/app/ProgressDialog;
    .locals 0

    .line 93
    iget-object p0, p0, Lcom/facebook/internal/WebDialog;->spinner:Landroid/app/ProgressDialog;

    return-object p0
.end method

.method static synthetic access$400(Lcom/facebook/internal/WebDialog;)Landroid/widget/FrameLayout;
    .locals 0

    .line 93
    iget-object p0, p0, Lcom/facebook/internal/WebDialog;->contentFrameLayout:Landroid/widget/FrameLayout;

    return-object p0
.end method

.method static synthetic access$500(Lcom/facebook/internal/WebDialog;)Landroid/webkit/WebView;
    .locals 0

    .line 93
    iget-object p0, p0, Lcom/facebook/internal/WebDialog;->webView:Landroid/webkit/WebView;

    return-object p0
.end method

.method static synthetic access$600(Lcom/facebook/internal/WebDialog;)Landroid/widget/ImageView;
    .locals 0

    .line 93
    iget-object p0, p0, Lcom/facebook/internal/WebDialog;->crossImageView:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$702(Lcom/facebook/internal/WebDialog;Z)Z
    .locals 0

    .line 93
    iput-boolean p1, p0, Lcom/facebook/internal/WebDialog;->isPageFinished:Z

    return p1
.end method

.method static synthetic access$902(Lcom/facebook/internal/WebDialog;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 93
    iput-object p1, p0, Lcom/facebook/internal/WebDialog;->url:Ljava/lang/String;

    return-object p1
.end method

.method private createCrossImage()V
    .locals 2

    .line 579
    new-instance v0, Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/facebook/internal/WebDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/facebook/internal/WebDialog;->crossImageView:Landroid/widget/ImageView;

    .line 581
    new-instance v1, Lcom/facebook/internal/WebDialog$2;

    invoke-direct {v1, p0}, Lcom/facebook/internal/WebDialog$2;-><init>(Lcom/facebook/internal/WebDialog;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 588
    invoke-virtual {p0}, Lcom/facebook/internal/WebDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/facebook/common/R$drawable;->com_facebook_close:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 589
    iget-object v1, p0, Lcom/facebook/internal/WebDialog;->crossImageView:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 593
    iget-object v0, p0, Lcom/facebook/internal/WebDialog;->crossImageView:Landroid/widget/ImageView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    return-void
.end method

.method private getScaledSize(IFII)I
    .locals 4

    int-to-float v0, p1

    div-float/2addr v0, p2

    float-to-int p2, v0

    const-wide/high16 v0, 0x3fe0000000000000L    # 0.5

    if-gt p2, p3, :cond_0

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    goto :goto_0

    :cond_0
    if-lt p2, p4, :cond_1

    goto :goto_0

    :cond_1
    sub-int p2, p4, p2

    int-to-double v2, p2

    sub-int/2addr p4, p3

    int-to-double p2, p4

    div-double/2addr v2, p2

    mul-double v2, v2, v0

    add-double/2addr v0, v2

    :goto_0
    int-to-double p1, p1

    mul-double p1, p1, v0

    double-to-int p1, p1

    return p1
.end method

.method public static getWebDialogTheme()I
    .locals 1

    .line 188
    invoke-static {}, Lcom/facebook/internal/Validate;->sdkInitialized()V

    .line 189
    sget v0, Lcom/facebook/internal/WebDialog;->webDialogTheme:I

    return v0
.end method

.method protected static initDefaultTheme(Landroid/content/Context;)V
    .locals 2

    if-nez p0, :cond_0

    return-void

    .line 148
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 149
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const/16 v1, 0x80

    invoke-virtual {v0, p0, v1}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object p0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz p0, :cond_2

    .line 154
    iget-object v0, p0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    if-nez v0, :cond_1

    goto :goto_0

    .line 158
    :cond_1
    sget v0, Lcom/facebook/internal/WebDialog;->webDialogTheme:I

    if-nez v0, :cond_2

    .line 159
    iget-object p0, p0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v0, "com.facebook.sdk.WebDialogTheme"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p0

    invoke-static {p0}, Lcom/facebook/internal/WebDialog;->setWebDialogTheme(I)V

    :catch_0
    :cond_2
    :goto_0
    return-void
.end method

.method public static newInstance(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;ILcom/facebook/internal/WebDialog$OnCompleteListener;)Lcom/facebook/internal/WebDialog;
    .locals 8

    .line 165
    invoke-static {p0}, Lcom/facebook/internal/WebDialog;->initDefaultTheme(Landroid/content/Context;)V

    .line 167
    new-instance v7, Lcom/facebook/internal/WebDialog;

    sget-object v5, Lcom/facebook/login/LoginTargetApp;->FACEBOOK:Lcom/facebook/login/LoginTargetApp;

    move-object v0, v7

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move-object v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/facebook/internal/WebDialog;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;ILcom/facebook/login/LoginTargetApp;Lcom/facebook/internal/WebDialog$OnCompleteListener;)V

    return-object v7
.end method

.method public static newInstance(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;ILcom/facebook/login/LoginTargetApp;Lcom/facebook/internal/WebDialog$OnCompleteListener;)Lcom/facebook/internal/WebDialog;
    .locals 8

    .line 177
    invoke-static {p0}, Lcom/facebook/internal/WebDialog;->initDefaultTheme(Landroid/content/Context;)V

    .line 179
    new-instance v7, Lcom/facebook/internal/WebDialog;

    move-object v0, v7

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/facebook/internal/WebDialog;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;ILcom/facebook/login/LoginTargetApp;Lcom/facebook/internal/WebDialog$OnCompleteListener;)V

    return-object v7
.end method

.method public static setInitCallback(Lcom/facebook/internal/WebDialog$InitCallback;)V
    .locals 0

    .line 646
    sput-object p0, Lcom/facebook/internal/WebDialog;->initCallback:Lcom/facebook/internal/WebDialog$InitCallback;

    return-void
.end method

.method private setUpWebView(I)V
    .locals 6

    .line 598
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/facebook/internal/WebDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 599
    new-instance v1, Lcom/facebook/internal/WebDialog$3;

    .line 600
    invoke-virtual {p0}, Lcom/facebook/internal/WebDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/facebook/internal/WebDialog$3;-><init>(Lcom/facebook/internal/WebDialog;Landroid/content/Context;)V

    iput-object v1, p0, Lcom/facebook/internal/WebDialog;->webView:Landroid/webkit/WebView;

    .line 612
    sget-object v2, Lcom/facebook/internal/WebDialog;->initCallback:Lcom/facebook/internal/WebDialog$InitCallback;

    if-eqz v2, :cond_0

    .line 613
    invoke-interface {v2, v1}, Lcom/facebook/internal/WebDialog$InitCallback;->onInit(Landroid/webkit/WebView;)V

    .line 615
    :cond_0
    iget-object v1, p0, Lcom/facebook/internal/WebDialog;->webView:Landroid/webkit/WebView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setVerticalScrollBarEnabled(Z)V

    .line 616
    iget-object v1, p0, Lcom/facebook/internal/WebDialog;->webView:Landroid/webkit/WebView;

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setHorizontalScrollBarEnabled(Z)V

    .line 617
    iget-object v1, p0, Lcom/facebook/internal/WebDialog;->webView:Landroid/webkit/WebView;

    new-instance v3, Lcom/facebook/internal/WebDialog$DialogWebViewClient;

    const/4 v4, 0x0

    invoke-direct {v3, p0, v4}, Lcom/facebook/internal/WebDialog$DialogWebViewClient;-><init>(Lcom/facebook/internal/WebDialog;Lcom/facebook/internal/WebDialog$1;)V

    invoke-virtual {v1, v3}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 618
    iget-object v1, p0, Lcom/facebook/internal/WebDialog;->webView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 619
    iget-object v1, p0, Lcom/facebook/internal/WebDialog;->webView:Landroid/webkit/WebView;

    iget-object v4, p0, Lcom/facebook/internal/WebDialog;->url:Ljava/lang/String;

    invoke-virtual {v1, v4}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 620
    iget-object v1, p0, Lcom/facebook/internal/WebDialog;->webView:Landroid/webkit/WebView;

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v5, -0x1

    invoke-direct {v4, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v4}, Landroid/webkit/WebView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 623
    iget-object v1, p0, Lcom/facebook/internal/WebDialog;->webView:Landroid/webkit/WebView;

    const/4 v4, 0x4

    invoke-virtual {v1, v4}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 624
    iget-object v1, p0, Lcom/facebook/internal/WebDialog;->webView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setSavePassword(Z)V

    .line 625
    iget-object v1, p0, Lcom/facebook/internal/WebDialog;->webView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setSaveFormData(Z)V

    .line 626
    iget-object v1, p0, Lcom/facebook/internal/WebDialog;->webView:Landroid/webkit/WebView;

    invoke-virtual {v1, v3}, Landroid/webkit/WebView;->setFocusable(Z)V

    .line 627
    iget-object v1, p0, Lcom/facebook/internal/WebDialog;->webView:Landroid/webkit/WebView;

    invoke-virtual {v1, v3}, Landroid/webkit/WebView;->setFocusableInTouchMode(Z)V

    .line 628
    iget-object v1, p0, Lcom/facebook/internal/WebDialog;->webView:Landroid/webkit/WebView;

    new-instance v2, Lcom/facebook/internal/WebDialog$4;

    invoke-direct {v2, p0}, Lcom/facebook/internal/WebDialog$4;-><init>(Lcom/facebook/internal/WebDialog;)V

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 639
    invoke-virtual {v0, p1, p1, p1, p1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 640
    iget-object p1, p0, Lcom/facebook/internal/WebDialog;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const/high16 p1, -0x34000000    # -3.3554432E7f

    .line 641
    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 642
    iget-object p1, p0, Lcom/facebook/internal/WebDialog;->contentFrameLayout:Landroid/widget/FrameLayout;

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    return-void
.end method

.method public static setWebDialogTheme(I)V
    .locals 0

    if-eqz p0, :cond_0

    goto :goto_0

    .line 198
    :cond_0
    sget p0, Lcom/facebook/internal/WebDialog;->DEFAULT_THEME:I

    :goto_0
    sput p0, Lcom/facebook/internal/WebDialog;->webDialogTheme:I

    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .line 573
    iget-object v0, p0, Lcom/facebook/internal/WebDialog;->onCompleteListener:Lcom/facebook/internal/WebDialog$OnCompleteListener;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/facebook/internal/WebDialog;->listenerCalled:Z

    if-nez v0, :cond_0

    .line 574
    new-instance v0, Lcom/facebook/FacebookOperationCanceledException;

    invoke-direct {v0}, Lcom/facebook/FacebookOperationCanceledException;-><init>()V

    invoke-virtual {p0, v0}, Lcom/facebook/internal/WebDialog;->sendErrorToListener(Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public dismiss()V
    .locals 1

    .line 356
    iget-object v0, p0, Lcom/facebook/internal/WebDialog;->webView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    .line 357
    invoke-virtual {v0}, Landroid/webkit/WebView;->stopLoading()V

    .line 359
    :cond_0
    iget-boolean v0, p0, Lcom/facebook/internal/WebDialog;->isDetached:Z

    if-nez v0, :cond_1

    .line 360
    iget-object v0, p0, Lcom/facebook/internal/WebDialog;->spinner:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 361
    iget-object v0, p0, Lcom/facebook/internal/WebDialog;->spinner:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 364
    :cond_1
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    return-void
.end method

.method public getOnCompleteListener()Lcom/facebook/internal/WebDialog$OnCompleteListener;
    .locals 1

    .line 337
    iget-object v0, p0, Lcom/facebook/internal/WebDialog;->onCompleteListener:Lcom/facebook/internal/WebDialog$OnCompleteListener;

    return-object v0
.end method

.method protected getWebView()Landroid/webkit/WebView;
    .locals 1

    .line 492
    iget-object v0, p0, Lcom/facebook/internal/WebDialog;->webView:Landroid/webkit/WebView;

    return-object v0
.end method

.method protected isListenerCalled()Z
    .locals 1

    .line 484
    iget-boolean v0, p0, Lcom/facebook/internal/WebDialog;->listenerCalled:Z

    return v0
.end method

.method protected isPageFinished()Z
    .locals 1

    .line 488
    iget-boolean v0, p0, Lcom/facebook/internal/WebDialog;->isPageFinished:Z

    return v0
.end method

.method public onAttachedToWindow()V
    .locals 2

    const/4 v0, 0x0

    .line 395
    iput-boolean v0, p0, Lcom/facebook/internal/WebDialog;->isDetached:Z

    .line 397
    invoke-virtual {p0}, Lcom/facebook/internal/WebDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/internal/Utility;->mustFixWindowParamsForAutofill(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/facebook/internal/WebDialog;->windowParams:Landroid/view/WindowManager$LayoutParams;

    if-eqz v0, :cond_0

    iget-object v0, v0, Landroid/view/WindowManager$LayoutParams;->token:Landroid/os/IBinder;

    if-nez v0, :cond_0

    .line 400
    iget-object v0, p0, Lcom/facebook/internal/WebDialog;->windowParams:Landroid/view/WindowManager$LayoutParams;

    invoke-virtual {p0}, Lcom/facebook/internal/WebDialog;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    iget-object v1, v1, Landroid/view/WindowManager$LayoutParams;->token:Landroid/os/IBinder;

    iput-object v1, v0, Landroid/view/WindowManager$LayoutParams;->token:Landroid/os/IBinder;

    .line 401
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Set token on onAttachedToWindow(): "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/facebook/internal/WebDialog;->windowParams:Landroid/view/WindowManager$LayoutParams;

    iget-object v1, v1, Landroid/view/WindowManager$LayoutParams;->token:Landroid/os/IBinder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FacebookSDK.WebDialog"

    invoke-static {v1, v0}, Lcom/facebook/internal/Utility;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 404
    :cond_0
    invoke-super {p0}, Landroid/app/Dialog;->onAttachedToWindow()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 420
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 422
    new-instance p1, Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/facebook/internal/WebDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/facebook/internal/WebDialog;->spinner:Landroid/app/ProgressDialog;

    const/4 v0, 0x1

    .line 423
    invoke-virtual {p1, v0}, Landroid/app/ProgressDialog;->requestWindowFeature(I)Z

    .line 424
    iget-object p1, p0, Lcom/facebook/internal/WebDialog;->spinner:Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/facebook/internal/WebDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/facebook/common/R$string;->com_facebook_loading:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 426
    iget-object p1, p0, Lcom/facebook/internal/WebDialog;->spinner:Landroid/app/ProgressDialog;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/app/ProgressDialog;->setCanceledOnTouchOutside(Z)V

    .line 427
    iget-object p1, p0, Lcom/facebook/internal/WebDialog;->spinner:Landroid/app/ProgressDialog;

    new-instance v1, Lcom/facebook/internal/WebDialog$1;

    invoke-direct {v1, p0}, Lcom/facebook/internal/WebDialog$1;-><init>(Lcom/facebook/internal/WebDialog;)V

    invoke-virtual {p1, v1}, Landroid/app/ProgressDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 435
    invoke-virtual {p0, v0}, Lcom/facebook/internal/WebDialog;->requestWindowFeature(I)Z

    .line 436
    new-instance p1, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Lcom/facebook/internal/WebDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p1, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/facebook/internal/WebDialog;->contentFrameLayout:Landroid/widget/FrameLayout;

    .line 439
    invoke-virtual {p0}, Lcom/facebook/internal/WebDialog;->resize()V

    .line 440
    invoke-virtual {p0}, Lcom/facebook/internal/WebDialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 v1, 0x11

    invoke-virtual {p1, v1}, Landroid/view/Window;->setGravity(I)V

    .line 443
    invoke-virtual {p0}, Lcom/facebook/internal/WebDialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 v1, 0x10

    invoke-virtual {p1, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 449
    invoke-direct {p0}, Lcom/facebook/internal/WebDialog;->createCrossImage()V

    .line 451
    iget-object p1, p0, Lcom/facebook/internal/WebDialog;->url:Ljava/lang/String;

    if-eqz p1, :cond_0

    .line 455
    iget-object p1, p0, Lcom/facebook/internal/WebDialog;->crossImageView:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p1

    .line 456
    div-int/lit8 p1, p1, 0x2

    add-int/2addr p1, v0

    invoke-direct {p0, p1}, Lcom/facebook/internal/WebDialog;->setUpWebView(I)V

    .line 462
    :cond_0
    iget-object p1, p0, Lcom/facebook/internal/WebDialog;->contentFrameLayout:Landroid/widget/FrameLayout;

    iget-object v0, p0, Lcom/facebook/internal/WebDialog;->crossImageView:Landroid/widget/ImageView;

    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    const/4 v2, -0x2

    invoke-direct {v1, v2, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 467
    iget-object p1, p0, Lcom/facebook/internal/WebDialog;->contentFrameLayout:Landroid/widget/FrameLayout;

    invoke-virtual {p0, p1}, Lcom/facebook/internal/WebDialog;->setContentView(Landroid/view/View;)V

    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    const/4 v0, 0x1

    .line 389
    iput-boolean v0, p0, Lcom/facebook/internal/WebDialog;->isDetached:Z

    .line 390
    invoke-super {p0}, Landroid/app/Dialog;->onDetachedFromWindow()V

    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1

    const/4 v0, 0x4

    if-ne p1, v0, :cond_1

    .line 343
    iget-object v0, p0, Lcom/facebook/internal/WebDialog;->webView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 344
    iget-object p1, p0, Lcom/facebook/internal/WebDialog;->webView:Landroid/webkit/WebView;

    invoke-virtual {p1}, Landroid/webkit/WebView;->goBack()V

    const/4 p1, 0x1

    return p1

    .line 347
    :cond_0
    invoke-virtual {p0}, Lcom/facebook/internal/WebDialog;->cancel()V

    .line 351
    :cond_1
    invoke-super {p0, p1, p2}, Landroid/app/Dialog;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method protected onStart()V
    .locals 2

    .line 369
    invoke-super {p0}, Landroid/app/Dialog;->onStart()V

    .line 370
    iget-object v0, p0, Lcom/facebook/internal/WebDialog;->uploadTask:Lcom/facebook/internal/WebDialog$UploadStagingResourcesTask;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/facebook/internal/WebDialog$UploadStagingResourcesTask;->getStatus()Landroid/os/AsyncTask$Status;

    move-result-object v0

    sget-object v1, Landroid/os/AsyncTask$Status;->PENDING:Landroid/os/AsyncTask$Status;

    if-ne v0, v1, :cond_0

    .line 371
    iget-object v0, p0, Lcom/facebook/internal/WebDialog;->uploadTask:Lcom/facebook/internal/WebDialog$UploadStagingResourcesTask;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/facebook/internal/WebDialog$UploadStagingResourcesTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 372
    iget-object v0, p0, Lcom/facebook/internal/WebDialog;->spinner:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    goto :goto_0

    .line 374
    :cond_0
    invoke-virtual {p0}, Lcom/facebook/internal/WebDialog;->resize()V

    :goto_0
    return-void
.end method

.method protected onStop()V
    .locals 2

    .line 380
    iget-object v0, p0, Lcom/facebook/internal/WebDialog;->uploadTask:Lcom/facebook/internal/WebDialog$UploadStagingResourcesTask;

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    .line 381
    invoke-virtual {v0, v1}, Lcom/facebook/internal/WebDialog$UploadStagingResourcesTask;->cancel(Z)Z

    .line 382
    iget-object v0, p0, Lcom/facebook/internal/WebDialog;->spinner:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 384
    :cond_0
    invoke-super {p0}, Landroid/app/Dialog;->onStop()V

    return-void
.end method

.method public onWindowAttributesChanged(Landroid/view/WindowManager$LayoutParams;)V
    .locals 1

    .line 409
    iget-object v0, p1, Landroid/view/WindowManager$LayoutParams;->token:Landroid/os/IBinder;

    if-nez v0, :cond_0

    .line 412
    iput-object p1, p0, Lcom/facebook/internal/WebDialog;->windowParams:Landroid/view/WindowManager$LayoutParams;

    .line 415
    :cond_0
    invoke-super {p0, p1}, Landroid/app/Dialog;->onWindowAttributesChanged(Landroid/view/WindowManager$LayoutParams;)V

    return-void
.end method

.method protected parseResponseUri(Ljava/lang/String;)Landroid/os/Bundle;
    .locals 1

    .line 475
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    .line 477
    invoke-virtual {p1}, Landroid/net/Uri;->getQuery()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/internal/Utility;->parseUrlQueryString(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 478
    invoke-virtual {p1}, Landroid/net/Uri;->getFragment()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/facebook/internal/Utility;->parseUrlQueryString(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    return-object v0
.end method

.method public resize()V
    .locals 6

    .line 496
    invoke-virtual {p0}, Lcom/facebook/internal/WebDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "window"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    .line 497
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 498
    new-instance v1, Landroid/util/DisplayMetrics;

    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    .line 499
    invoke-virtual {v0, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 503
    iget v0, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v2, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    if-ge v0, v2, :cond_0

    iget v0, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    goto :goto_0

    :cond_0
    iget v0, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 505
    :goto_0
    iget v2, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v3, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    if-ge v2, v3, :cond_1

    iget v2, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    goto :goto_1

    :cond_1
    iget v2, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 508
    :goto_1
    iget v3, v1, Landroid/util/DisplayMetrics;->density:F

    const/16 v4, 0x1e0

    const/16 v5, 0x320

    .line 510
    invoke-direct {p0, v0, v3, v4, v5}, Lcom/facebook/internal/WebDialog;->getScaledSize(IFII)I

    move-result v0

    iget v3, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 509
    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 513
    iget v3, v1, Landroid/util/DisplayMetrics;->density:F

    const/16 v4, 0x500

    .line 515
    invoke-direct {p0, v2, v3, v5, v4}, Lcom/facebook/internal/WebDialog;->getScaledSize(IFII)I

    move-result v2

    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 514
    invoke-static {v2, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 519
    invoke-virtual {p0}, Lcom/facebook/internal/WebDialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Landroid/view/Window;->setLayout(II)V

    return-void
.end method

.method protected sendErrorToListener(Ljava/lang/Throwable;)V
    .locals 2

    .line 559
    iget-object v0, p0, Lcom/facebook/internal/WebDialog;->onCompleteListener:Lcom/facebook/internal/WebDialog$OnCompleteListener;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/facebook/internal/WebDialog;->listenerCalled:Z

    if-nez v0, :cond_1

    const/4 v0, 0x1

    .line 560
    iput-boolean v0, p0, Lcom/facebook/internal/WebDialog;->listenerCalled:Z

    .line 562
    instance-of v0, p1, Lcom/facebook/FacebookException;

    if-eqz v0, :cond_0

    .line 563
    check-cast p1, Lcom/facebook/FacebookException;

    goto :goto_0

    .line 565
    :cond_0
    new-instance v0, Lcom/facebook/FacebookException;

    invoke-direct {v0, p1}, Lcom/facebook/FacebookException;-><init>(Ljava/lang/Throwable;)V

    move-object p1, v0

    .line 567
    :goto_0
    iget-object v0, p0, Lcom/facebook/internal/WebDialog;->onCompleteListener:Lcom/facebook/internal/WebDialog$OnCompleteListener;

    const/4 v1, 0x0

    invoke-interface {v0, v1, p1}, Lcom/facebook/internal/WebDialog$OnCompleteListener;->onComplete(Landroid/os/Bundle;Lcom/facebook/FacebookException;)V

    .line 568
    invoke-virtual {p0}, Lcom/facebook/internal/WebDialog;->dismiss()V

    :cond_1
    return-void
.end method

.method protected sendSuccessToListener(Landroid/os/Bundle;)V
    .locals 2

    .line 551
    iget-object v0, p0, Lcom/facebook/internal/WebDialog;->onCompleteListener:Lcom/facebook/internal/WebDialog$OnCompleteListener;

    if-eqz v0, :cond_0

    iget-boolean v1, p0, Lcom/facebook/internal/WebDialog;->listenerCalled:Z

    if-nez v1, :cond_0

    const/4 v1, 0x1

    .line 552
    iput-boolean v1, p0, Lcom/facebook/internal/WebDialog;->listenerCalled:Z

    const/4 v1, 0x0

    .line 553
    invoke-interface {v0, p1, v1}, Lcom/facebook/internal/WebDialog$OnCompleteListener;->onComplete(Landroid/os/Bundle;Lcom/facebook/FacebookException;)V

    .line 554
    invoke-virtual {p0}, Lcom/facebook/internal/WebDialog;->dismiss()V

    :cond_0
    return-void
.end method

.method protected setExpectedRedirectUrl(Ljava/lang/String;)V
    .locals 0

    .line 471
    iput-object p1, p0, Lcom/facebook/internal/WebDialog;->expectedRedirectUrl:Ljava/lang/String;

    return-void
.end method

.method public setOnCompleteListener(Lcom/facebook/internal/WebDialog$OnCompleteListener;)V
    .locals 0

    .line 328
    iput-object p1, p0, Lcom/facebook/internal/WebDialog;->onCompleteListener:Lcom/facebook/internal/WebDialog$OnCompleteListener;

    return-void
.end method
