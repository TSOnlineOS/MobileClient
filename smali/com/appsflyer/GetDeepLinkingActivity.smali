.class public Lcom/appsflyer/GetDeepLinkingActivity;
.super Landroid/app/Activity;
.source "GetDeepLinkingActivity.java"


# static fields
.field private static TAG:Ljava/lang/String; = "AppsFlyerDeepLinkActivity"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private getMainActivityClass()Ljava/lang/Class;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 30
    invoke-virtual {p0}, Lcom/appsflyer/GetDeepLinkingActivity;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 31
    invoke-virtual {p0}, Lcom/appsflyer/GetDeepLinkingActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 33
    :try_start_0
    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 35
    :catch_0
    sget-object v0, Lcom/appsflyer/GetDeepLinkingActivity;->TAG:Ljava/lang/String;

    const-string v1, "Unable to find Main Activity Class"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 18
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    .line 19
    invoke-virtual {p0, p1}, Lcom/appsflyer/GetDeepLinkingActivity;->requestWindowFeature(I)Z

    .line 21
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p0}, Lcom/appsflyer/GetDeepLinkingActivity;->getMainActivityClass()Ljava/lang/Class;

    move-result-object v0

    invoke-direct {p1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 22
    invoke-virtual {p0, p1}, Lcom/appsflyer/GetDeepLinkingActivity;->startActivity(Landroid/content/Intent;)V

    .line 24
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object p1

    invoke-virtual {p0}, Lcom/appsflyer/GetDeepLinkingActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/appsflyer/AppsFlyerLib;->setPluginDeepLinkData(Landroid/content/Intent;)V

    .line 26
    invoke-virtual {p0}, Lcom/appsflyer/GetDeepLinkingActivity;->finish()V

    return-void
.end method
