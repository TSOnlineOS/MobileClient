.class public Lcom/onevcat/uniwebview/UniWebViewInterface;
.super Ljava/lang/Object;
.source "UniWebViewInterface.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static _getUnityActivity()Landroid/app/Activity;
    .locals 1

    .line 754
    sget-object v0, Lcom/unity3d/player/UnityPlayer;->currentActivity:Landroid/app/Activity;

    return-object v0
.end method

.method private static _sendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 p0, 0x1

    aput-object p1, v0, p0

    const/4 p0, 0x2

    aput-object p2, v0, p0

    const-string p0, "%s@%s@%s"

    .line 758
    invoke-static {p0, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "UniWebViewAndroidStaticListener"

    const-string p2, "OnJavaMessage"

    .line 759
    invoke-static {p1, p2, p0}, Lcom/unity3d/player/UnityPlayer;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 22
    invoke-static {p0, p1, p2}, Lcom/onevcat/uniwebview/UniWebViewInterface;->_sendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100()Landroid/app/Activity;
    .locals 1

    .line 22
    invoke-static {}, Lcom/onevcat/uniwebview/UniWebViewInterface;->_getUnityActivity()Landroid/app/Activity;

    move-result-object v0

    return-object v0
.end method

.method public static addJavaScript(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 316
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v1, "Interface addJavaScript"

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 317
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$15;

    invoke-direct {v0, p0, p1, p2}, Lcom/onevcat/uniwebview/UniWebViewInterface$15;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static addPermissionTrustDomain(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 606
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Interface addPermissionTrustDomain: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 607
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$36;

    invoke-direct {v0, p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$36;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static addSslExceptionDomain(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 626
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Interface addSslExceptionDomain: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 627
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$38;

    invoke-direct {v0, p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$38;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static addUrlScheme(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 336
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v1, "Interface addUrlScheme"

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 337
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$17;

    invoke-direct {v0, p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$17;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static animateTo(Ljava/lang/String;IIIIFFLjava/lang/String;)Z
    .locals 17

    .line 295
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v5, 0x1

    aput-object v3, v2, v5

    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v6, 0x2

    aput-object v3, v2, v6

    invoke-static/range {p4 .. p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v6, 0x3

    aput-object v3, v2, v6

    const-string v3, "Interface animateTo: {%d, %d, %d, %d}"

    invoke-static {v1, v3, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 297
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    invoke-direct {v0, v5}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    new-array v1, v5, [Z

    .line 299
    new-instance v2, Lcom/onevcat/uniwebview/UniWebViewInterface$14;

    move-object v6, v2

    move-object/from16 v7, p0

    move-object v8, v1

    move/from16 v9, p1

    move/from16 v10, p2

    move/from16 v11, p3

    move/from16 v12, p4

    move/from16 v13, p5

    move/from16 v14, p6

    move-object/from16 v15, p7

    move-object/from16 v16, v0

    invoke-direct/range {v6 .. v16}, Lcom/onevcat/uniwebview/UniWebViewInterface$14;-><init>(Ljava/lang/String;[ZIIIIFFLjava/lang/String;Ljava/util/concurrent/CountDownLatch;)V

    invoke-static {v2}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    const-wide/16 v2, 0x64

    .line 308
    :try_start_0
    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v2, v3, v5}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 310
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 312
    :goto_0
    aget-boolean v0, v1, v4

    return v0
.end method

.method public static canGoBack(Ljava/lang/String;)Z
    .locals 4

    .line 495
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v1, "Interface canGoBack"

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 497
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    new-array v1, v1, [Z

    .line 499
    new-instance v2, Lcom/onevcat/uniwebview/UniWebViewInterface$27;

    invoke-direct {v2, p0, v1, v0}, Lcom/onevcat/uniwebview/UniWebViewInterface$27;-><init>(Ljava/lang/String;[ZLjava/util/concurrent/CountDownLatch;)V

    invoke-static {v2}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    const-wide/16 v2, 0x64

    .line 508
    :try_start_0
    sget-object p0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v2, v3, p0}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 510
    invoke-virtual {p0}, Ljava/lang/InterruptedException;->printStackTrace()V

    :goto_0
    const/4 p0, 0x0

    .line 512
    aget-boolean p0, v1, p0

    return p0
.end method

.method public static canGoForward(Ljava/lang/String;)Z
    .locals 4

    .line 516
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v1, "Interface canGoForward"

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 517
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    new-array v1, v1, [Z

    .line 519
    new-instance v2, Lcom/onevcat/uniwebview/UniWebViewInterface$28;

    invoke-direct {v2, p0, v1, v0}, Lcom/onevcat/uniwebview/UniWebViewInterface$28;-><init>(Ljava/lang/String;[ZLjava/util/concurrent/CountDownLatch;)V

    invoke-static {v2}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    const-wide/16 v2, 0x64

    .line 528
    :try_start_0
    sget-object p0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v2, v3, p0}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 530
    invoke-virtual {p0}, Ljava/lang/InterruptedException;->printStackTrace()V

    :goto_0
    const/4 p0, 0x0

    .line 532
    aget-boolean p0, v1, p0

    return p0
.end method

.method public static cleanCache(Ljava/lang/String;)V
    .locals 2

    .line 406
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v1, "Interface cleanCache"

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 407
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$21;

    invoke-direct {v0, p0}, Lcom/onevcat/uniwebview/UniWebViewInterface$21;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static clearCookies()V
    .locals 2

    .line 416
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v1, "Interface clearCookies"

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 417
    invoke-static {}, Lcom/onevcat/uniwebview/UniWebView;->clearCookies()V

    return-void
.end method

.method public static clearHttpAuthUsernamePassword(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 433
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Interface clearHttpAuthUsernamePassword host: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", realm:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 434
    invoke-static {}, Lcom/onevcat/uniwebview/UniWebViewInterface;->_getUnityActivity()Landroid/app/Activity;

    move-result-object v0

    .line 435
    new-instance v1, Lcom/onevcat/uniwebview/UniWebViewInterface$22;

    invoke-direct {v1, v0, p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$22;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static destroy(Ljava/lang/String;)V
    .locals 3

    .line 144
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Interface destroy web view"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 145
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$3;

    invoke-direct {v0, p0}, Lcom/onevcat/uniwebview/UniWebViewInterface$3;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static evaluateJavaScript(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 326
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v1, "Interface evaluateJavaScript"

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 327
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$16;

    invoke-direct {v0, p0, p1, p2}, Lcom/onevcat/uniwebview/UniWebViewInterface$16;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static getCookie(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 426
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v1, "Interface getCookie"

    .line 427
    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 429
    invoke-static {p0, p1}, Lcom/onevcat/uniwebview/UniWebView;->getCookie(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getUrl(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 198
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v1, "Interface getUrl"

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 199
    invoke-static {}, Lcom/onevcat/uniwebview/UniWebViewManager;->getInstance()Lcom/onevcat/uniwebview/UniWebViewManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/onevcat/uniwebview/UniWebViewManager;->getUniWebViewDialog(Ljava/lang/String;)Lcom/onevcat/uniwebview/UniWebViewDialog;

    .line 201
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    const-string v1, ""

    .line 203
    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v1

    .line 204
    new-instance v2, Lcom/onevcat/uniwebview/UniWebViewInterface$8;

    invoke-direct {v2, p0, v1, v0}, Lcom/onevcat/uniwebview/UniWebViewInterface$8;-><init>(Ljava/lang/String;[Ljava/lang/String;Ljava/util/concurrent/CountDownLatch;)V

    invoke-static {v2}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    const-wide/16 v2, 0x64

    .line 213
    :try_start_0
    sget-object p0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v2, v3, p0}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 215
    invoke-virtual {p0}, Ljava/lang/InterruptedException;->printStackTrace()V

    :goto_0
    const/4 p0, 0x0

    .line 217
    aget-object p0, v1, p0

    return-object p0
.end method

.method public static getUserAgent(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 384
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v1, "Interface getUserAgent"

    .line 385
    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 386
    invoke-static {}, Lcom/onevcat/uniwebview/UniWebViewManager;->getInstance()Lcom/onevcat/uniwebview/UniWebViewManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/onevcat/uniwebview/UniWebViewManager;->getUniWebViewDialog(Ljava/lang/String;)Lcom/onevcat/uniwebview/UniWebViewDialog;

    move-result-object v0

    .line 387
    invoke-static {v0, p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getUserAgent(Lcom/onevcat/uniwebview/UniWebViewDialog;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getWebViewAlpha(Ljava/lang/String;)F
    .locals 2

    .line 469
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v1, "Interface getWebViewAlpha"

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 470
    invoke-static {}, Lcom/onevcat/uniwebview/UniWebViewManager;->getInstance()Lcom/onevcat/uniwebview/UniWebViewManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/onevcat/uniwebview/UniWebViewManager;->getUniWebViewDialog(Ljava/lang/String;)Lcom/onevcat/uniwebview/UniWebViewDialog;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 471
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getWebViewAlpha()F

    move-result p0

    goto :goto_0

    :cond_0
    const/high16 p0, 0x3f800000    # 1.0f

    :goto_0
    return p0
.end method

.method public static goBack(Ljava/lang/String;)V
    .locals 2

    .line 536
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v1, "Interface goBack"

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 537
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$29;

    invoke-direct {v0, p0}, Lcom/onevcat/uniwebview/UniWebViewInterface$29;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static goForward(Ljava/lang/String;)V
    .locals 2

    .line 546
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v1, "Interface goForward"

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 547
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$30;

    invoke-direct {v0, p0}, Lcom/onevcat/uniwebview/UniWebViewInterface$30;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static hide(Ljava/lang/String;ZIFLjava/lang/String;)Z
    .locals 11

    .line 272
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v1, "Interface hide"

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 274
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    new-array v1, v1, [Z

    .line 276
    new-instance v10, Lcom/onevcat/uniwebview/UniWebViewInterface$13;

    move-object v2, v10

    move-object v3, p0

    move-object v4, v1

    move v5, p1

    move v6, p2

    move v7, p3

    move-object v8, p4

    move-object v9, v0

    invoke-direct/range {v2 .. v9}, Lcom/onevcat/uniwebview/UniWebViewInterface$13;-><init>(Ljava/lang/String;[ZZIFLjava/lang/String;Ljava/util/concurrent/CountDownLatch;)V

    invoke-static {v10}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    const-wide/16 p0, 0x64

    .line 285
    :try_start_0
    sget-object p2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p0, p1, p2}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 287
    invoke-virtual {p0}, Ljava/lang/InterruptedException;->printStackTrace()V

    :goto_0
    const/4 p0, 0x0

    .line 289
    aget-boolean p0, v1, p0

    return p0
.end method

.method public static init(Ljava/lang/String;IIII)V
    .locals 8

    .line 49
    new-instance v7, Lcom/onevcat/uniwebview/UniWebViewInterface$2;

    move-object v0, v7

    move-object v1, p0

    move-object v2, p0

    move v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/onevcat/uniwebview/UniWebViewInterface$2;-><init>(Ljava/lang/String;Ljava/lang/String;IIII)V

    invoke-static {v7}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static load(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 154
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Interface load: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 155
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$4;

    invoke-direct {v0, p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$4;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static loadHTMLString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 164
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v1, "Interface loadHTMLString"

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 165
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$5;

    invoke-direct {v0, p0, p1, p2}, Lcom/onevcat/uniwebview/UniWebViewInterface$5;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static prepare()V
    .locals 3

    .line 30
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 32
    invoke-static {}, Lcom/onevcat/uniwebview/UniWebViewInterface;->_getUnityActivity()Landroid/app/Activity;

    move-result-object v1

    .line 33
    new-instance v2, Lcom/onevcat/uniwebview/UniWebViewInterface$1;

    invoke-direct {v2, v1, v0}, Lcom/onevcat/uniwebview/UniWebViewInterface$1;-><init>(Landroid/app/Activity;Ljava/util/concurrent/CountDownLatch;)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 42
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 44
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    :goto_0
    return-void
.end method

.method public static print(Ljava/lang/String;)V
    .locals 2

    .line 716
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v1, "Interface print"

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 717
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$47;

    invoke-direct {v0, p0}, Lcom/onevcat/uniwebview/UniWebViewInterface$47;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static reload(Ljava/lang/String;)V
    .locals 2

    .line 174
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v1, "Interface reload"

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 175
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$6;

    invoke-direct {v0, p0}, Lcom/onevcat/uniwebview/UniWebViewInterface$6;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static removePermissionTrustDomain(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 616
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Interface removePermissionTrustDomain: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 617
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$37;

    invoke-direct {v0, p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$37;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static removeSslExceptionDomain(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 636
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Interface addSslExceptionDomain: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 637
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$39;

    invoke-direct {v0, p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$39;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static removeUrlScheme(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 347
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v1, "Interface addUrlScheme"

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 348
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$18;

    invoke-direct {v0, p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$18;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method private static runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V
    .locals 2

    .line 742
    invoke-static {}, Lcom/onevcat/uniwebview/UniWebViewInterface;->_getUnityActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/onevcat/uniwebview/UniWebViewInterface$49;

    invoke-direct {v1, p0}, Lcom/onevcat/uniwebview/UniWebViewInterface$49;-><init>(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static setAllowAutoPlay(Z)V
    .locals 3

    .line 391
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Interface setAllowAutoPlay: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 392
    invoke-static {p0}, Lcom/onevcat/uniwebview/UniWebView;->setAllowAutoPlay(Z)V

    return-void
.end method

.method public static setAllowHTTPAuthPopUpWindow(Ljava/lang/String;Z)V
    .locals 3

    .line 696
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Interface setAllowHTTPAuthPopUpWindow: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 697
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$45;

    invoke-direct {v0, p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$45;-><init>(Ljava/lang/String;Z)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static setAllowJavaScriptOpenWindow(Z)V
    .locals 3

    .line 396
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Interface setAllowJavaScriptOpenWindow: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 397
    invoke-static {p0}, Lcom/onevcat/uniwebview/UniWebView;->setAllowJavaScriptOpenWindow(Z)V

    return-void
.end method

.method public static setBackButtonEnabled(Ljava/lang/String;Z)V
    .locals 2

    .line 646
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v1, "Interface setBackButtonEnabled"

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 647
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$40;

    invoke-direct {v0, p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$40;-><init>(Ljava/lang/String;Z)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static setBackgroundColor(Ljava/lang/String;FFFF)V
    .locals 8

    .line 445
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    const/4 v4, 0x2

    aput-object v3, v2, v4

    invoke-static {p4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    const/4 v4, 0x3

    aput-object v3, v2, v4

    const-string v3, "Interface setBackgroundColor: {%f, %f, %f, %f}"

    invoke-static {v1, v3, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 446
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$23;

    move-object v2, v0

    move-object v3, p0

    move v4, p1

    move v5, p2

    move v6, p3

    move v7, p4

    invoke-direct/range {v2 .. v7}, Lcom/onevcat/uniwebview/UniWebViewInterface$23;-><init>(Ljava/lang/String;FFFF)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static setBouncesEnabled(Ljava/lang/String;Z)V
    .locals 2

    .line 586
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v1, "Interface setBouncesEnabled"

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 587
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$34;

    invoke-direct {v0, p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$34;-><init>(Ljava/lang/String;Z)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static setCalloutEnabled(Ljava/lang/String;Z)V
    .locals 3

    .line 706
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Interface setCalloutEnabled: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 707
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$46;

    invoke-direct {v0, p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$46;-><init>(Ljava/lang/String;Z)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static setCookie(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 421
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v1, "Interface setCookie"

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 422
    invoke-static {p0, p1}, Lcom/onevcat/uniwebview/UniWebView;->setCookie(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static setFrame(Ljava/lang/String;IIII)V
    .locals 8

    .line 221
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

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

    const-string v3, "Interface setFrame: {%d, %d, %d, %d}"

    invoke-static {v1, v3, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 222
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$9;

    move-object v2, v0

    move-object v3, p0

    move v4, p1

    move v5, p2

    move v6, p3

    move v7, p4

    invoke-direct/range {v2 .. v7}, Lcom/onevcat/uniwebview/UniWebViewInterface$9;-><init>(Ljava/lang/String;IIII)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static setHeaderField(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 358
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Interface setHeaderField for key: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", value: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 359
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$19;

    invoke-direct {v0, p0, p1, p2}, Lcom/onevcat/uniwebview/UniWebViewInterface$19;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static setHorizontalScrollBarEnabled(Ljava/lang/String;Z)V
    .locals 3

    .line 566
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Interface setHorizontalScrollBarEnabled: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 567
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$32;

    invoke-direct {v0, p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$32;-><init>(Ljava/lang/String;Z)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static setImmersiveModeEnabled(Ljava/lang/String;Z)V
    .locals 2

    .line 676
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v1, "Interface setImmersiveModeEnabled"

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 677
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$43;

    invoke-direct {v0, p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$43;-><init>(Ljava/lang/String;Z)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static setJavaScriptEnabled(Z)V
    .locals 3

    .line 401
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Interface setJavaScriptEnabled: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 402
    invoke-static {p0}, Lcom/onevcat/uniwebview/UniWebView;->setJavaScriptEnabled(Z)V

    return-void
.end method

.method public static setLoadWithOverviewMode(Ljava/lang/String;Z)V
    .locals 2

    .line 666
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v1, "Interface setLoadWithOverviewMode"

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 667
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$42;

    invoke-direct {v0, p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$42;-><init>(Ljava/lang/String;Z)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static setLogLevel(I)V
    .locals 1

    .line 25
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/onevcat/uniwebview/Logger;->setLevel(I)V

    return-void
.end method

.method public static setOpenLinksInExternalBrowser(Ljava/lang/String;Z)V
    .locals 3

    .line 556
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Interface setOpenLinksInExternalBrowser: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 557
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$31;

    invoke-direct {v0, p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$31;-><init>(Ljava/lang/String;Z)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static setPosition(Ljava/lang/String;II)V
    .locals 5

    .line 231
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    const-string v3, "Interface setPosition: {%d, %d}"

    invoke-static {v1, v3, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 232
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$10;

    invoke-direct {v0, p0, p1, p2}, Lcom/onevcat/uniwebview/UniWebViewInterface$10;-><init>(Ljava/lang/String;II)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static setShowSpinnerWhileLoading(Ljava/lang/String;Z)V
    .locals 3

    .line 475
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Interface setShowSpinnerWhenLoading: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 476
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$25;

    invoke-direct {v0, p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$25;-><init>(Ljava/lang/String;Z)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static setSize(Ljava/lang/String;II)V
    .locals 5

    .line 241
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    const-string v3, "Interface setSize: {%d, %d}"

    invoke-static {v1, v3, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 242
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$11;

    invoke-direct {v0, p0, p1, p2}, Lcom/onevcat/uniwebview/UniWebViewInterface$11;-><init>(Ljava/lang/String;II)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static setSpinnerText(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 485
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Interface setSpinnerText: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 486
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$26;

    invoke-direct {v0, p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$26;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static setUseWideViewPort(Ljava/lang/String;Z)V
    .locals 2

    .line 656
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v1, "Interface setUseWideViewPort"

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 657
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$41;

    invoke-direct {v0, p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$41;-><init>(Ljava/lang/String;Z)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static setUserAgent(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 368
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v1, "Interface setUserAgent"

    .line 369
    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 371
    invoke-static {}, Lcom/onevcat/uniwebview/UniWebViewManager;->getInstance()Lcom/onevcat/uniwebview/UniWebViewManager;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/onevcat/uniwebview/UniWebViewManager;->getUniWebViewDialog(Ljava/lang/String;)Lcom/onevcat/uniwebview/UniWebViewDialog;

    move-result-object v1

    .line 372
    invoke-static {v1, p0, p1}, Lcom/onevcat/uniwebview/UniWebViewDialog;->setUserAgent(Lcom/onevcat/uniwebview/UniWebViewDialog;Ljava/lang/String;Ljava/lang/String;)V

    .line 374
    new-instance v1, Lcom/onevcat/uniwebview/UniWebViewInterface$20;

    invoke-direct {v1, p0, v0, p1, p0}, Lcom/onevcat/uniwebview/UniWebViewInterface$20;-><init>(Ljava/lang/String;Lcom/onevcat/uniwebview/Logger;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v1}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static setVerticalScrollBarEnabled(Ljava/lang/String;Z)V
    .locals 3

    .line 576
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Interface setVerticalScrollBarEnabled: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 577
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$33;

    invoke-direct {v0, p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$33;-><init>(Ljava/lang/String;Z)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static setWebContentsDebuggingEnabled(Z)V
    .locals 3

    .line 686
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Interface setWebContentsDebuggingEnabled: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 687
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$44;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p0}, Lcom/onevcat/uniwebview/UniWebViewInterface$44;-><init>(Ljava/lang/String;Z)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static setWebViewAlpha(Ljava/lang/String;F)V
    .locals 3

    .line 455
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Interface setWebViewAlpha: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 456
    invoke-static {}, Lcom/onevcat/uniwebview/UniWebViewManager;->getInstance()Lcom/onevcat/uniwebview/UniWebViewManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/onevcat/uniwebview/UniWebViewManager;->getUniWebViewDialog(Ljava/lang/String;)Lcom/onevcat/uniwebview/UniWebViewDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 458
    invoke-virtual {v0, p1, v1}, Lcom/onevcat/uniwebview/UniWebViewDialog;->setWebViewAlpha(FZ)V

    .line 460
    :cond_0
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$24;

    invoke-direct {v0, p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$24;-><init>(Ljava/lang/String;F)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static setZoomEnabled(Ljava/lang/String;Z)V
    .locals 2

    .line 596
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v1, "Interface setZoomEnabled"

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 597
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$35;

    invoke-direct {v0, p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$35;-><init>(Ljava/lang/String;Z)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static show(Ljava/lang/String;ZIFLjava/lang/String;)Z
    .locals 11

    .line 251
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v1, "Interface show"

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 253
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    new-array v1, v1, [Z

    .line 255
    new-instance v10, Lcom/onevcat/uniwebview/UniWebViewInterface$12;

    move-object v2, v10

    move-object v3, p0

    move-object v4, v1

    move v5, p1

    move v6, p2

    move v7, p3

    move-object v8, p4

    move-object v9, v0

    invoke-direct/range {v2 .. v9}, Lcom/onevcat/uniwebview/UniWebViewInterface$12;-><init>(Ljava/lang/String;[ZZIFLjava/lang/String;Ljava/util/concurrent/CountDownLatch;)V

    invoke-static {v10}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    const-wide/16 p0, 0x64

    .line 264
    :try_start_0
    sget-object p2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p0, p1, p2}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 266
    invoke-virtual {p0}, Ljava/lang/InterruptedException;->printStackTrace()V

    :goto_0
    const/4 p0, 0x0

    .line 268
    aget-boolean p0, v1, p0

    return p0
.end method

.method public static showWebViewDialog(Ljava/lang/String;Z)V
    .locals 2

    .line 727
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v1, "Interface showWebViewDialog"

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 728
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$48;

    invoke-direct {v0, p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$48;-><init>(Ljava/lang/String;Z)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method

.method public static stop(Ljava/lang/String;)V
    .locals 2

    .line 184
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    const-string v1, "Interface stop"

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 186
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewInterface$7;

    invoke-direct {v0, p0, p0}, Lcom/onevcat/uniwebview/UniWebViewInterface$7;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V

    return-void
.end method
