.class public Lcom/facebook/login/CustomTabPrefetchHelper;
.super Landroidx/browser/customtabs/CustomTabsServiceConnection;
.source "CustomTabPrefetchHelper.java"


# static fields
.field private static client:Landroidx/browser/customtabs/CustomTabsClient;

.field private static session:Landroidx/browser/customtabs/CustomTabsSession;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Landroidx/browser/customtabs/CustomTabsServiceConnection;-><init>()V

    return-void
.end method

.method public static getPreparedSessionOnce()Landroidx/browser/customtabs/CustomTabsSession;
    .locals 2

    .line 55
    sget-object v0, Lcom/facebook/login/CustomTabPrefetchHelper;->session:Landroidx/browser/customtabs/CustomTabsSession;

    const/4 v1, 0x0

    .line 56
    sput-object v1, Lcom/facebook/login/CustomTabPrefetchHelper;->session:Landroidx/browser/customtabs/CustomTabsSession;

    return-object v0
.end method

.method public static mayLaunchUrl(Landroid/net/Uri;)V
    .locals 2

    .line 46
    sget-object v0, Lcom/facebook/login/CustomTabPrefetchHelper;->session:Landroidx/browser/customtabs/CustomTabsSession;

    if-nez v0, :cond_0

    .line 47
    invoke-static {}, Lcom/facebook/login/CustomTabPrefetchHelper;->prepareSession()V

    .line 49
    :cond_0
    sget-object v0, Lcom/facebook/login/CustomTabPrefetchHelper;->session:Landroidx/browser/customtabs/CustomTabsSession;

    if-eqz v0, :cond_1

    const/4 v1, 0x0

    .line 50
    invoke-virtual {v0, p0, v1, v1}, Landroidx/browser/customtabs/CustomTabsSession;->mayLaunchUrl(Landroid/net/Uri;Landroid/os/Bundle;Ljava/util/List;)Z

    :cond_1
    return-void
.end method

.method private static prepareSession()V
    .locals 2

    .line 38
    sget-object v0, Lcom/facebook/login/CustomTabPrefetchHelper;->session:Landroidx/browser/customtabs/CustomTabsSession;

    if-nez v0, :cond_0

    .line 39
    sget-object v0, Lcom/facebook/login/CustomTabPrefetchHelper;->client:Landroidx/browser/customtabs/CustomTabsClient;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 40
    invoke-virtual {v0, v1}, Landroidx/browser/customtabs/CustomTabsClient;->newSession(Landroidx/browser/customtabs/CustomTabsCallback;)Landroidx/browser/customtabs/CustomTabsSession;

    move-result-object v0

    sput-object v0, Lcom/facebook/login/CustomTabPrefetchHelper;->session:Landroidx/browser/customtabs/CustomTabsSession;

    :cond_0
    return-void
.end method


# virtual methods
.method public onCustomTabsServiceConnected(Landroid/content/ComponentName;Landroidx/browser/customtabs/CustomTabsClient;)V
    .locals 2

    .line 62
    sput-object p2, Lcom/facebook/login/CustomTabPrefetchHelper;->client:Landroidx/browser/customtabs/CustomTabsClient;

    const-wide/16 v0, 0x0

    .line 63
    invoke-virtual {p2, v0, v1}, Landroidx/browser/customtabs/CustomTabsClient;->warmup(J)Z

    .line 64
    invoke-static {}, Lcom/facebook/login/CustomTabPrefetchHelper;->prepareSession()V

    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 0

    return-void
.end method
