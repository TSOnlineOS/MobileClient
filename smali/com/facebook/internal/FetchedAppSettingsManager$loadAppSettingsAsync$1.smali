.class final Lcom/facebook/internal/FetchedAppSettingsManager$loadAppSettingsAsync$1;
.super Ljava/lang/Object;
.source "FetchedAppSettingsManager.kt"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/internal/FetchedAppSettingsManager;->loadAppSettingsAsync()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
        "run"
    }
    k = 0x3
    mv = {
        0x1,
        0x5,
        0x1
    }
.end annotation


# instance fields
.field final synthetic $applicationId:Ljava/lang/String;

.field final synthetic $context:Landroid/content/Context;

.field final synthetic $settingsKey:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/internal/FetchedAppSettingsManager$loadAppSettingsAsync$1;->$context:Landroid/content/Context;

    iput-object p2, p0, Lcom/facebook/internal/FetchedAppSettingsManager$loadAppSettingsAsync$1;->$settingsKey:Ljava/lang/String;

    iput-object p3, p0, Lcom/facebook/internal/FetchedAppSettingsManager$loadAppSettingsAsync$1;->$applicationId:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    invoke-static {p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-static {p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v0, :cond_1

    return-void

    .line 123
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/facebook/internal/FetchedAppSettingsManager$loadAppSettingsAsync$1;->$context:Landroid/content/Context;

    const-string v1, "com.facebook.internal.preferences.APP_SETTINGS"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 124
    iget-object v1, p0, Lcom/facebook/internal/FetchedAppSettingsManager$loadAppSettingsAsync$1;->$settingsKey:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 125
    move-object v3, v2

    check-cast v3, Lcom/facebook/internal/FetchedAppSettings;

    .line 126
    invoke-static {v1}, Lcom/facebook/internal/Utility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    if-eqz v1, :cond_2

    .line 128
    check-cast v2, Lorg/json/JSONObject;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 130
    :try_start_2
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-object v2, v4

    goto :goto_0

    :catch_0
    move-exception v1

    :try_start_3
    const-string v4, "FacebookSDK"

    .line 132
    check-cast v1, Ljava/lang/Exception;

    invoke-static {v4, v1}, Lcom/facebook/internal/Utility;->logd(Ljava/lang/String;Ljava/lang/Exception;)V

    :goto_0
    if-eqz v2, :cond_3

    .line 135
    sget-object v1, Lcom/facebook/internal/FetchedAppSettingsManager;->INSTANCE:Lcom/facebook/internal/FetchedAppSettingsManager;

    iget-object v3, p0, Lcom/facebook/internal/FetchedAppSettingsManager$loadAppSettingsAsync$1;->$applicationId:Ljava/lang/String;

    invoke-virtual {v1, v3, v2}, Lcom/facebook/internal/FetchedAppSettingsManager;->parseAppSettingsFromJSON$facebook_core_release(Ljava/lang/String;Lorg/json/JSONObject;)Lcom/facebook/internal/FetchedAppSettings;

    move-result-object v3

    goto :goto_1

    :cond_2
    const-string v0, "Required value was null."

    .line 127
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    check-cast v1, Ljava/lang/Throwable;

    throw v1

    .line 138
    :cond_3
    :goto_1
    sget-object v1, Lcom/facebook/internal/FetchedAppSettingsManager;->INSTANCE:Lcom/facebook/internal/FetchedAppSettingsManager;

    iget-object v2, p0, Lcom/facebook/internal/FetchedAppSettingsManager$loadAppSettingsAsync$1;->$applicationId:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/facebook/internal/FetchedAppSettingsManager;->access$getAppSettingsQueryResponse(Lcom/facebook/internal/FetchedAppSettingsManager;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 140
    sget-object v2, Lcom/facebook/internal/FetchedAppSettingsManager;->INSTANCE:Lcom/facebook/internal/FetchedAppSettingsManager;

    iget-object v4, p0, Lcom/facebook/internal/FetchedAppSettingsManager$loadAppSettingsAsync$1;->$applicationId:Ljava/lang/String;

    invoke-virtual {v2, v4, v1}, Lcom/facebook/internal/FetchedAppSettingsManager;->parseAppSettingsFromJSON$facebook_core_release(Ljava/lang/String;Lorg/json/JSONObject;)Lcom/facebook/internal/FetchedAppSettings;

    .line 141
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v2, p0, Lcom/facebook/internal/FetchedAppSettingsManager$loadAppSettingsAsync$1;->$settingsKey:Ljava/lang/String;

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_4
    const/4 v0, 0x1

    if-eqz v3, :cond_5

    .line 146
    invoke-virtual {v3}, Lcom/facebook/internal/FetchedAppSettings;->getSdkUpdateMessage()Ljava/lang/String;

    move-result-object v1

    .line 147
    sget-object v2, Lcom/facebook/internal/FetchedAppSettingsManager;->INSTANCE:Lcom/facebook/internal/FetchedAppSettingsManager;

    invoke-static {v2}, Lcom/facebook/internal/FetchedAppSettingsManager;->access$getPrintedSDKUpdatedMessage$p(Lcom/facebook/internal/FetchedAppSettingsManager;)Z

    move-result v2

    if-nez v2, :cond_5

    if-eqz v1, :cond_5

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_5

    .line 148
    sget-object v2, Lcom/facebook/internal/FetchedAppSettingsManager;->INSTANCE:Lcom/facebook/internal/FetchedAppSettingsManager;

    invoke-static {v2, v0}, Lcom/facebook/internal/FetchedAppSettingsManager;->access$setPrintedSDKUpdatedMessage$p(Lcom/facebook/internal/FetchedAppSettingsManager;Z)V

    .line 149
    sget-object v2, Lcom/facebook/internal/FetchedAppSettingsManager;->INSTANCE:Lcom/facebook/internal/FetchedAppSettingsManager;

    invoke-static {v2}, Lcom/facebook/internal/FetchedAppSettingsManager;->access$getTAG$p(Lcom/facebook/internal/FetchedAppSettingsManager;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    :cond_5
    iget-object v1, p0, Lcom/facebook/internal/FetchedAppSettingsManager$loadAppSettingsAsync$1;->$applicationId:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/facebook/internal/FetchedAppGateKeepersManager;->queryAppGateKeepers(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 157
    invoke-static {}, Lcom/facebook/appevents/internal/AutomaticAnalyticsLogger;->logActivateAppEvent()V

    .line 159
    sget-object v0, Lcom/facebook/internal/FetchedAppSettingsManager;->INSTANCE:Lcom/facebook/internal/FetchedAppSettingsManager;

    invoke-static {v0}, Lcom/facebook/internal/FetchedAppSettingsManager;->access$getLoadingState$p(Lcom/facebook/internal/FetchedAppSettingsManager;)Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object v0

    .line 160
    sget-object v1, Lcom/facebook/internal/FetchedAppSettingsManager;->INSTANCE:Lcom/facebook/internal/FetchedAppSettingsManager;

    invoke-static {v1}, Lcom/facebook/internal/FetchedAppSettingsManager;->access$getFetchedAppSettings$p(Lcom/facebook/internal/FetchedAppSettingsManager;)Ljava/util/Map;

    move-result-object v1

    iget-object v2, p0, Lcom/facebook/internal/FetchedAppSettingsManager$loadAppSettingsAsync$1;->$applicationId:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    sget-object v1, Lcom/facebook/internal/FetchedAppSettingsManager$FetchAppSettingState;->SUCCESS:Lcom/facebook/internal/FetchedAppSettingsManager$FetchAppSettingState;

    goto :goto_2

    .line 161
    :cond_6
    sget-object v1, Lcom/facebook/internal/FetchedAppSettingsManager$FetchAppSettingState;->ERROR:Lcom/facebook/internal/FetchedAppSettingsManager$FetchAppSettingState;

    .line 159
    :goto_2
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 162
    sget-object v0, Lcom/facebook/internal/FetchedAppSettingsManager;->INSTANCE:Lcom/facebook/internal/FetchedAppSettingsManager;

    invoke-static {v0}, Lcom/facebook/internal/FetchedAppSettingsManager;->access$pollCallbacks(Lcom/facebook/internal/FetchedAppSettingsManager;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 163
    :try_start_4
    invoke-static {v0, p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    return-void

    :catchall_1
    move-exception v0

    invoke-static {v0, p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-void
.end method
