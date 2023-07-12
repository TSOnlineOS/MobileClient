.class public Lcom/appsflyer/AppsFlyerProperties;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/appsflyer/AppsFlyerProperties$EmailsCryptType;
    }
.end annotation


# static fields
.field public static final ADDITIONAL_CUSTOM_DATA:Ljava/lang/String; = "additionalCustomData"

.field public static final AF_KEY:Ljava/lang/String; = "AppsFlyerKey"

.field public static final AF_WAITFOR_CUSTOMERID:Ljava/lang/String; = "waitForCustomerId"

.field public static final APP_ID:Ljava/lang/String; = "appid"

.field public static final APP_USER_ID:Ljava/lang/String; = "AppUserId"

.field public static final CHANNEL:Ljava/lang/String; = "channel"

.field public static final COLLECT_ANDROID_ID:Ljava/lang/String; = "collectAndroidId"

.field public static final COLLECT_ANDROID_ID_FORCE_BY_USER:Ljava/lang/String; = "collectAndroidIdForceByUser"

.field public static final COLLECT_FACEBOOK_ATTR_ID:Ljava/lang/String; = "collectFacebookAttrId"

.field public static final COLLECT_FINGER_PRINT:Ljava/lang/String; = "collectFingerPrint"

.field public static final COLLECT_IMEI:Ljava/lang/String; = "collectIMEI"

.field public static final COLLECT_IMEI_FORCE_BY_USER:Ljava/lang/String; = "collectIMEIForceByUser"

.field public static final COLLECT_MAC:Ljava/lang/String; = "collectMAC"

.field public static final CURRENCY_CODE:Ljava/lang/String; = "currencyCode"

.field public static final DEVICE_TRACKING_DISABLED:Ljava/lang/String; = "deviceTrackingDisabled"

.field public static final DISABLE_KEYSTORE:Ljava/lang/String; = "keyPropDisableAFKeystore"

.field public static final DISABLE_LOGS_COMPLETELY:Ljava/lang/String; = "disableLogs"

.field public static final DISABLE_OTHER_SDK:Ljava/lang/String; = "disableOtherSdk"

.field public static final DPM:Ljava/lang/String; = "disableProxy"

.field public static final EMAIL_CRYPT_TYPE:Ljava/lang/String; = "userEmailsCryptType"

.field public static final ENABLE_GPS_FALLBACK:Ljava/lang/String; = "enableGpsFallback"

.field public static final EXTENSION:Ljava/lang/String; = "sdkExtension"

.field public static final IS_MONITOR:Ljava/lang/String; = "shouldMonitor"

.field public static final IS_UPDATE:Ljava/lang/String; = "IS_UPDATE"

.field public static final LAUNCH_PROTECT_ENABLED:Ljava/lang/String; = "launchProtectEnabled"

.field public static final ONELINK_DOMAIN:Ljava/lang/String; = "onelinkDomain"

.field public static final ONELINK_ID:Ljava/lang/String; = "oneLinkSlug"

.field public static final ONELINK_SCHEME:Ljava/lang/String; = "onelinkScheme"

.field public static final USER_EMAIL:Ljava/lang/String; = "userEmail"

.field public static final USER_EMAILS:Ljava/lang/String; = "userEmails"

.field public static final USE_HTTP_FALLBACK:Ljava/lang/String; = "useHttpFallback"

.field private static ˎ:Lcom/appsflyer/AppsFlyerProperties;


# instance fields
.field private ʼ:Z

.field private ˊ:Ljava/lang/String;

.field private ˋ:Z

.field private ˏ:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private ॱ:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 72
    new-instance v0, Lcom/appsflyer/AppsFlyerProperties;

    invoke-direct {v0}, Lcom/appsflyer/AppsFlyerProperties;-><init>()V

    sput-object v0, Lcom/appsflyer/AppsFlyerProperties;->ˎ:Lcom/appsflyer/AppsFlyerProperties;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/appsflyer/AppsFlyerProperties;->ˏ:Ljava/util/Map;

    const/4 v0, 0x0

    .line 77
    iput-boolean v0, p0, Lcom/appsflyer/AppsFlyerProperties;->ʼ:Z

    return-void
.end method

.method public static getInstance()Lcom/appsflyer/AppsFlyerProperties;
    .locals 1

    .line 84
    sget-object v0, Lcom/appsflyer/AppsFlyerProperties;->ˎ:Lcom/appsflyer/AppsFlyerProperties;

    return-object v0
.end method


# virtual methods
.method public getBoolean(Ljava/lang/String;Z)Z
    .locals 0

    .line 124
    invoke-virtual {p0, p1}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    return p2

    .line 128
    :cond_0
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    return p1
.end method

.method public getInt(Ljava/lang/String;I)I
    .locals 0

    .line 140
    invoke-virtual {p0, p1}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    return p2

    .line 144
    :cond_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    return p1
.end method

.method public getLong(Ljava/lang/String;J)J
    .locals 0

    .line 148
    invoke-virtual {p0, p1}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    return-wide p2

    .line 152
    :cond_0
    invoke-static {p1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide p1

    return-wide p1
.end method

.method public getObject(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    .line 156
    iget-object v0, p0, Lcom/appsflyer/AppsFlyerProperties;->ˏ:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getReferrer(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    .line 185
    iget-object v0, p0, Lcom/appsflyer/AppsFlyerProperties;->ˊ:Ljava/lang/String;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    const-string v0, "AF_REFERRER"

    .line 187
    invoke-virtual {p0, v0}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 188
    invoke-virtual {p0, v0}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_1
    const/4 v0, 0x0

    if-nez p1, :cond_2

    return-object v0

    .line 193
    :cond_2
    invoke-static {p1}, Lcom/appsflyer/AppsFlyerLibCore;->ˊ(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    const-string v1, "referrer"

    .line 194
    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getString(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 120
    iget-object v0, p0, Lcom/appsflyer/AppsFlyerProperties;->ˏ:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1
.end method

.method public isEnableLog()Z
    .locals 2

    const-string v0, "shouldLog"

    const/4 v1, 0x1

    .line 203
    invoke-virtual {p0, v0, v1}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method protected isFirstLaunchCalled()Z
    .locals 1

    .line 168
    iget-boolean v0, p0, Lcom/appsflyer/AppsFlyerProperties;->ˋ:Z

    return v0
.end method

.method public isLogsDisabledCompletely()Z
    .locals 2

    const-string v0, "disableLogs"

    const/4 v1, 0x0

    .line 207
    invoke-virtual {p0, v0, v1}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method protected isOnReceiveCalled()Z
    .locals 1

    .line 160
    iget-boolean v0, p0, Lcom/appsflyer/AppsFlyerProperties;->ॱ:Z

    return v0
.end method

.method public isOtherSdkStringDisabled()Z
    .locals 2

    const-string v0, "disableOtherSdk"

    const/4 v1, 0x0

    .line 211
    invoke-virtual {p0, v0, v1}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public loadProperties(Landroid/content/Context;)V
    .locals 4

    .line 1255
    iget-boolean v0, p0, Lcom/appsflyer/AppsFlyerProperties;->ʼ:Z

    if-eqz v0, :cond_0

    return-void

    .line 233
    :cond_0
    invoke-static {p1}, Lcom/appsflyer/AppsFlyerLibCore;->ˊ(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    const/4 v0, 0x0

    const-string v1, "savedProperties"

    .line 234
    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_3

    const-string v0, "Loading properties.."

    .line 236
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 238
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 239
    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object p1

    .line 240
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 241
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 242
    iget-object v2, p0, Lcom/appsflyer/AppsFlyerProperties;->ˏ:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_1

    .line 243
    iget-object v2, p0, Lcom/appsflyer/AppsFlyerProperties;->ˏ:Ljava/util/Map;

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    const/4 p1, 0x1

    .line 246
    iput-boolean p1, p0, Lcom/appsflyer/AppsFlyerProperties;->ʼ:Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    const-string v0, "Failed loading properties"

    .line 248
    invoke-static {v0, p1}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 250
    :goto_1
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Done loading properties: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/appsflyer/AppsFlyerProperties;->ʼ:Z

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    :cond_3
    return-void
.end method

.method public remove(Ljava/lang/String;)V
    .locals 1

    .line 88
    iget-object v0, p0, Lcom/appsflyer/AppsFlyerProperties;->ˏ:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public saveProperties(Landroid/content/SharedPreferences;)V
    .locals 2

    .line 217
    new-instance v0, Lorg/json/JSONObject;

    iget-object v1, p0, Lcom/appsflyer/AppsFlyerProperties;->ˏ:Ljava/util/Map;

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    .line 219
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v1, "savedProperties"

    .line 220
    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 222
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x9

    if-lt v0, v1, :cond_0

    .line 223
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void

    .line 225
    :cond_0
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method public set(Ljava/lang/String;I)V
    .locals 1

    .line 100
    iget-object v0, p0, Lcom/appsflyer/AppsFlyerProperties;->ˏ:Ljava/util/Map;

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public set(Ljava/lang/String;J)V
    .locals 1

    .line 104
    iget-object v0, p0, Lcom/appsflyer/AppsFlyerProperties;->ˏ:Ljava/util/Map;

    invoke-static {p2, p3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public set(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 92
    iget-object v0, p0, Lcom/appsflyer/AppsFlyerProperties;->ˏ:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public set(Ljava/lang/String;Z)V
    .locals 1

    .line 108
    iget-object v0, p0, Lcom/appsflyer/AppsFlyerProperties;->ˏ:Ljava/util/Map;

    invoke-static {p2}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public set(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 1

    .line 96
    iget-object v0, p0, Lcom/appsflyer/AppsFlyerProperties;->ˏ:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public setCustomData(Ljava/lang/String;)V
    .locals 2

    .line 112
    iget-object v0, p0, Lcom/appsflyer/AppsFlyerProperties;->ˏ:Ljava/util/Map;

    const-string v1, "additionalCustomData"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method protected setFirstLaunchCalled()V
    .locals 1

    const/4 v0, 0x1

    .line 176
    iput-boolean v0, p0, Lcom/appsflyer/AppsFlyerProperties;->ˋ:Z

    return-void
.end method

.method protected setFirstLaunchCalled(Z)V
    .locals 0

    .line 172
    iput-boolean p1, p0, Lcom/appsflyer/AppsFlyerProperties;->ˋ:Z

    return-void
.end method

.method protected setOnReceiveCalled()V
    .locals 1

    const/4 v0, 0x1

    .line 164
    iput-boolean v0, p0, Lcom/appsflyer/AppsFlyerProperties;->ॱ:Z

    return-void
.end method

.method protected setReferrer(Ljava/lang/String;)V
    .locals 1

    const-string v0, "AF_REFERRER"

    .line 180
    invoke-virtual {p0, v0, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    iput-object p1, p0, Lcom/appsflyer/AppsFlyerProperties;->ˊ:Ljava/lang/String;

    return-void
.end method

.method public setUserEmails(Ljava/lang/String;)V
    .locals 2

    .line 116
    iget-object v0, p0, Lcom/appsflyer/AppsFlyerProperties;->ˏ:Ljava/util/Map;

    const-string v1, "userEmails"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
