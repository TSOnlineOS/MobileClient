.class public final Lcom/facebook/appevents/AppEventsLogger$Companion;
.super Ljava/lang/Object;
.source "AppEventsLogger.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/appevents/AppEventsLogger;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000X\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u000f\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0010\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bH\u0007J\u001a\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000b2\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u0004H\u0007J\u0012\u0010\u0008\u001a\u00020\t2\u0008\u0010\r\u001a\u0004\u0018\u00010\u000eH\u0007J\u001c\u0010\u0008\u001a\u00020\t2\u0008\u0010\r\u001a\u0004\u0018\u00010\u000e2\u0008\u0010\u000f\u001a\u0004\u0018\u00010\u0004H\u0007J\u001a\u0010\u0010\u001a\u00020\t2\u0006\u0010\u0011\u001a\u00020\u00122\u0008\u0010\r\u001a\u0004\u0018\u00010\u000eH\u0007J\u0008\u0010\u0013\u001a\u00020\tH\u0007J\u0008\u0010\u0014\u001a\u00020\tH\u0007J\u0012\u0010\u0015\u001a\u00020\t2\u0008\u0010\r\u001a\u0004\u0018\u00010\u000eH\u0007J\u001c\u0010\u0015\u001a\u00020\t2\u0008\u0010\r\u001a\u0004\u0018\u00010\u000e2\u0008\u0010\u000f\u001a\u0004\u0018\u00010\u0004H\u0007J\u0010\u0010\u0016\u001a\u00020\u00042\u0006\u0010\r\u001a\u00020\u000eH\u0007J\n\u0010\u0017\u001a\u0004\u0018\u00010\u0018H\u0007J\u0008\u0010\u0019\u001a\u00020\u0004H\u0007J\n\u0010\u001a\u001a\u0004\u0018\u00010\u0004H\u0007J\u001a\u0010\u001b\u001a\u00020\t2\u0006\u0010\r\u001a\u00020\u000e2\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u0004H\u0007J\u0010\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\r\u001a\u00020\u000eH\u0007J\u001a\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\r\u001a\u00020\u000e2\u0008\u0010\u001e\u001a\u0004\u0018\u00010\u001fH\u0007J\u001a\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\r\u001a\u00020\u000e2\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u0004H\u0007J$\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\r\u001a\u00020\u000e2\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u00042\u0008\u0010\u001e\u001a\u0004\u0018\u00010\u001fH\u0007J\u0008\u0010 \u001a\u00020\tH\u0007J\u0010\u0010!\u001a\u00020\t2\u0006\u0010\"\u001a\u00020\u0018H\u0007J\u0012\u0010#\u001a\u00020\t2\u0008\u0010$\u001a\u0004\u0018\u00010\u0004H\u0007J\u0012\u0010%\u001a\u00020\t2\u0008\u0010&\u001a\u0004\u0018\u00010\u0004H\u0007J\u0012\u0010\'\u001a\u00020\t2\u0008\u0010(\u001a\u0004\u0018\u00010)H\u0007Jl\u0010\'\u001a\u00020\t2\u0008\u0010*\u001a\u0004\u0018\u00010\u00042\u0008\u0010+\u001a\u0004\u0018\u00010\u00042\u0008\u0010,\u001a\u0004\u0018\u00010\u00042\u0008\u0010-\u001a\u0004\u0018\u00010\u00042\u0008\u0010.\u001a\u0004\u0018\u00010\u00042\u0008\u0010/\u001a\u0004\u0018\u00010\u00042\u0008\u00100\u001a\u0004\u0018\u00010\u00042\u0008\u00101\u001a\u0004\u0018\u00010\u00042\u0008\u00102\u001a\u0004\u0018\u00010\u00042\u0008\u00103\u001a\u0004\u0018\u00010\u0004H\u0007J\u0010\u00104\u001a\u00020\t2\u0006\u00105\u001a\u00020\u0004H\u0007J\u001c\u00106\u001a\u00020\t2\u0008\u00107\u001a\u0004\u0018\u00010)2\u0008\u00108\u001a\u0004\u0018\u000109H\u0007J&\u00106\u001a\u00020\t2\u0008\u00107\u001a\u0004\u0018\u00010)2\u0008\u0010:\u001a\u0004\u0018\u00010\u00042\u0008\u00108\u001a\u0004\u0018\u000109H\u0007R\u000e\u0010\u0003\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0007\u001a\u0004\u0018\u00010\u0004X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006;"
    }
    d2 = {
        "Lcom/facebook/appevents/AppEventsLogger$Companion;",
        "",
        "()V",
        "ACTION_APP_EVENTS_FLUSHED",
        "",
        "APP_EVENTS_EXTRA_FLUSH_RESULT",
        "APP_EVENTS_EXTRA_NUM_EVENTS_FLUSHED",
        "TAG",
        "activateApp",
        "",
        "application",
        "Landroid/app/Application;",
        "applicationId",
        "context",
        "Landroid/content/Context;",
        "str",
        "augmentWebView",
        "webView",
        "Landroid/webkit/WebView;",
        "clearUserData",
        "clearUserID",
        "deactivateApp",
        "getAnonymousAppDeviceGUID",
        "getFlushBehavior",
        "Lcom/facebook/appevents/AppEventsLogger$FlushBehavior;",
        "getUserData",
        "getUserID",
        "initializeLib",
        "newLogger",
        "Lcom/facebook/appevents/AppEventsLogger;",
        "accessToken",
        "Lcom/facebook/AccessToken;",
        "onContextStop",
        "setFlushBehavior",
        "flushBehavior",
        "setInstallReferrer",
        "referrer",
        "setPushNotificationsRegistrationId",
        "registrationId",
        "setUserData",
        "userData",
        "Landroid/os/Bundle;",
        "email",
        "firstName",
        "lastName",
        "phone",
        "dateOfBirth",
        "gender",
        "city",
        "state",
        "zip",
        "country",
        "setUserID",
        "userID",
        "updateUserProperties",
        "parameters",
        "callback",
        "Lcom/facebook/GraphRequest$Callback;",
        "applicationID",
        "facebook-core_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x5,
        0x1
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 337
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 337
    invoke-direct {p0}, Lcom/facebook/appevents/AppEventsLogger$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final activateApp(Landroid/app/Application;)V
    .locals 2
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "application"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 352
    sget-object v0, Lcom/facebook/appevents/AppEventsLoggerImpl;->Companion:Lcom/facebook/appevents/AppEventsLoggerImpl$Companion;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/facebook/appevents/AppEventsLoggerImpl$Companion;->activateApp(Landroid/app/Application;Ljava/lang/String;)V

    return-void
.end method

.method public final activateApp(Landroid/app/Application;Ljava/lang/String;)V
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "application"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 370
    sget-object v0, Lcom/facebook/appevents/AppEventsLoggerImpl;->Companion:Lcom/facebook/appevents/AppEventsLoggerImpl$Companion;

    invoke-virtual {v0, p1, p2}, Lcom/facebook/appevents/AppEventsLoggerImpl$Companion;->activateApp(Landroid/app/Application;Ljava/lang/String;)V

    return-void
.end method

.method public final activateApp(Landroid/content/Context;)V
    .locals 2
    .annotation runtime Lkotlin/Deprecated;
        message = "Use {@link AppEventsLogger#activateApp(Application)} "
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 376
    move-object v0, p0

    check-cast v0, Lcom/facebook/appevents/AppEventsLogger$Companion;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/facebook/appevents/AppEventsLogger$Companion;->activateApp(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public final activateApp(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lkotlin/Deprecated;
        message = "Use {@link AppEventsLogger#activateApp(Application)} "
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 382
    sget-object p1, Lcom/facebook/appevents/AppEventsLoggerImpl;->Companion:Lcom/facebook/appevents/AppEventsLoggerImpl$Companion;

    const-string p2, "Please use activateApp(Application) or activateApp(Application, String), activateApp(Context) and activateApp(Context, String) will be removed since v12"

    invoke-virtual {p1, p2}, Lcom/facebook/appevents/AppEventsLoggerImpl$Companion;->functionDEPRECATED(Ljava/lang/String;)V

    return-void
.end method

.method public final augmentWebView(Landroid/webkit/WebView;Landroid/content/Context;)V
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "webView"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 541
    sget-object v0, Lcom/facebook/appevents/AppEventsLoggerImpl;->Companion:Lcom/facebook/appevents/AppEventsLoggerImpl$Companion;

    invoke-virtual {v0, p1, p2}, Lcom/facebook/appevents/AppEventsLoggerImpl$Companion;->augmentWebView(Landroid/webkit/WebView;Landroid/content/Context;)V

    return-void
.end method

.method public final clearUserData()V
    .locals 0
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 628
    invoke-static {}, Lcom/facebook/appevents/UserDataStore;->clear()V

    return-void
.end method

.method public final clearUserID()V
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const/4 v0, 0x0

    .line 564
    invoke-static {v0}, Lcom/facebook/appevents/AnalyticsUserIDStore;->setUserID(Ljava/lang/String;)V

    return-void
.end method

.method public final deactivateApp(Landroid/content/Context;)V
    .locals 1
    .annotation runtime Lkotlin/Deprecated;
        message = "When using {@link AppEventsLogger#activateApp(Application)} deactivate app will be\n        logged automatically."
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 392
    move-object p1, p0

    check-cast p1, Lcom/facebook/appevents/AppEventsLogger$Companion;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0}, Lcom/facebook/appevents/AppEventsLogger$Companion;->deactivateApp(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public final deactivateApp(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lkotlin/Deprecated;
        message = "When using {@link AppEventsLogger#activateApp(Application)} deactivate app will be\n        logged automatically."
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 400
    sget-object p1, Lcom/facebook/appevents/AppEventsLoggerImpl;->Companion:Lcom/facebook/appevents/AppEventsLoggerImpl$Companion;

    const-string p2, "Deactivate app will be logged automatically, AppEventsLogger#deactivateApp will be removed since v12"

    invoke-virtual {p1, p2}, Lcom/facebook/appevents/AppEventsLoggerImpl$Companion;->functionDEPRECATED(Ljava/lang/String;)V

    return-void
.end method

.method public final getAnonymousAppDeviceGUID(Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 657
    sget-object v0, Lcom/facebook/appevents/AppEventsLoggerImpl;->Companion:Lcom/facebook/appevents/AppEventsLoggerImpl$Companion;

    invoke-virtual {v0, p1}, Lcom/facebook/appevents/AppEventsLoggerImpl$Companion;->getAnonymousAppDeviceGUID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final getFlushBehavior()Lcom/facebook/appevents/AppEventsLogger$FlushBehavior;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 493
    sget-object v0, Lcom/facebook/appevents/AppEventsLoggerImpl;->Companion:Lcom/facebook/appevents/AppEventsLoggerImpl$Companion;

    invoke-virtual {v0}, Lcom/facebook/appevents/AppEventsLoggerImpl$Companion;->getFlushBehavior()Lcom/facebook/appevents/AppEventsLogger$FlushBehavior;

    move-result-object v0

    return-object v0
.end method

.method public final getUserData()Ljava/lang/String;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 622
    invoke-static {}, Lcom/facebook/appevents/UserDataStore;->getHashedUserData$facebook_core_release()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getUserID()Ljava/lang/String;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 546
    invoke-static {}, Lcom/facebook/appevents/AnalyticsUserIDStore;->getUserID()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final initializeLib(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 414
    sget-object v0, Lcom/facebook/appevents/AppEventsLoggerImpl;->Companion:Lcom/facebook/appevents/AppEventsLoggerImpl$Companion;

    invoke-virtual {v0, p1, p2}, Lcom/facebook/appevents/AppEventsLoggerImpl$Companion;->initializeLib(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public final newLogger(Landroid/content/Context;)Lcom/facebook/appevents/AppEventsLogger;
    .locals 2
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 428
    new-instance v0, Lcom/facebook/appevents/AppEventsLogger;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1, v1, v1}, Lcom/facebook/appevents/AppEventsLogger;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/facebook/AccessToken;Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v0
.end method

.method public final newLogger(Landroid/content/Context;Lcom/facebook/AccessToken;)Lcom/facebook/appevents/AppEventsLogger;
    .locals 2
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 441
    new-instance v0, Lcom/facebook/appevents/AppEventsLogger;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1, p2, v1}, Lcom/facebook/appevents/AppEventsLogger;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/facebook/AccessToken;Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v0
.end method

.method public final newLogger(Landroid/content/Context;Ljava/lang/String;)Lcom/facebook/appevents/AppEventsLogger;
    .locals 2
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 475
    new-instance v0, Lcom/facebook/appevents/AppEventsLogger;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, v1, v1}, Lcom/facebook/appevents/AppEventsLogger;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/facebook/AccessToken;Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v0
.end method

.method public final newLogger(Landroid/content/Context;Ljava/lang/String;Lcom/facebook/AccessToken;)Lcom/facebook/appevents/AppEventsLogger;
    .locals 2
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 461
    new-instance v0, Lcom/facebook/appevents/AppEventsLogger;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, p3, v1}, Lcom/facebook/appevents/AppEventsLogger;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/facebook/AccessToken;Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v0
.end method

.method public final onContextStop()V
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 515
    sget-object v0, Lcom/facebook/appevents/AppEventsLoggerImpl;->Companion:Lcom/facebook/appevents/AppEventsLoggerImpl$Companion;

    invoke-virtual {v0}, Lcom/facebook/appevents/AppEventsLoggerImpl$Companion;->onContextStop()V

    return-void
.end method

.method public final setFlushBehavior(Lcom/facebook/appevents/AppEventsLogger$FlushBehavior;)V
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "flushBehavior"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 503
    sget-object v0, Lcom/facebook/appevents/AppEventsLoggerImpl;->Companion:Lcom/facebook/appevents/AppEventsLoggerImpl$Companion;

    invoke-virtual {v0, p1}, Lcom/facebook/appevents/AppEventsLoggerImpl$Companion;->setFlushBehavior(Lcom/facebook/appevents/AppEventsLogger$FlushBehavior;)V

    return-void
.end method

.method public final setInstallReferrer(Ljava/lang/String;)V
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 663
    sget-object v0, Lcom/facebook/appevents/AppEventsLoggerImpl;->Companion:Lcom/facebook/appevents/AppEventsLoggerImpl$Companion;

    invoke-virtual {v0, p1}, Lcom/facebook/appevents/AppEventsLoggerImpl$Companion;->setInstallReferrer(Ljava/lang/String;)V

    return-void
.end method

.method public final setPushNotificationsRegistrationId(Ljava/lang/String;)V
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 525
    sget-object v0, Lcom/facebook/appevents/AppEventsLoggerImpl;->Companion:Lcom/facebook/appevents/AppEventsLoggerImpl$Companion;

    invoke-virtual {v0, p1}, Lcom/facebook/appevents/AppEventsLoggerImpl$Companion;->setPushNotificationsRegistrationId(Ljava/lang/String;)V

    return-void
.end method

.method public final setUserData(Landroid/os/Bundle;)V
    .locals 2
    .annotation runtime Lkotlin/Deprecated;
        message = ""
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 580
    sget-object v0, Lcom/facebook/appevents/AppEventsLoggerImpl;->Companion:Lcom/facebook/appevents/AppEventsLoggerImpl$Companion;

    const-string v1, "AppEventsLogger#setUserData(Bundle) is deprecated and it will be removed since v12"

    invoke-virtual {v0, v1}, Lcom/facebook/appevents/AppEventsLoggerImpl$Companion;->functionDEPRECATED(Ljava/lang/String;)V

    .line 582
    invoke-static {p1}, Lcom/facebook/appevents/UserDataStore;->setUserDataAndHash(Landroid/os/Bundle;)V

    return-void
.end method

.method public final setUserData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 615
    invoke-static/range {p1 .. p10}, Lcom/facebook/appevents/UserDataStore;->setUserDataAndHash(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final setUserID(Ljava/lang/String;)V
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "userID"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 558
    invoke-static {p1}, Lcom/facebook/appevents/AnalyticsUserIDStore;->setUserID(Ljava/lang/String;)V

    return-void
.end method

.method public final updateUserProperties(Landroid/os/Bundle;Lcom/facebook/GraphRequest$Callback;)V
    .locals 0
    .annotation runtime Lkotlin/Deprecated;
        message = ""
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 634
    move-object p1, p0

    check-cast p1, Lcom/facebook/appevents/AppEventsLogger$Companion;

    const/4 p2, 0x0

    invoke-virtual {p1, p2, p2, p2}, Lcom/facebook/appevents/AppEventsLogger$Companion;->updateUserProperties(Landroid/os/Bundle;Ljava/lang/String;Lcom/facebook/GraphRequest$Callback;)V

    return-void
.end method

.method public final updateUserProperties(Landroid/os/Bundle;Ljava/lang/String;Lcom/facebook/GraphRequest$Callback;)V
    .locals 0
    .annotation runtime Lkotlin/Deprecated;
        message = ""
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 644
    sget-object p1, Lcom/facebook/appevents/AppEventsLoggerImpl;->Companion:Lcom/facebook/appevents/AppEventsLoggerImpl$Companion;

    const-string p2, "AppEventsLogger#updateUserProperties is deprecated and it will be removed since v12"

    invoke-virtual {p1, p2}, Lcom/facebook/appevents/AppEventsLoggerImpl$Companion;->functionDEPRECATED(Ljava/lang/String;)V

    return-void
.end method
