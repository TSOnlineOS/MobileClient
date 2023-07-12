.class public Lcom/facebook/referrals/ReferralLogger;
.super Ljava/lang/Object;
.source "ReferralLogger.java"


# static fields
.field static final EVENT_EXTRAS_FACEBOOK_VERSION:Ljava/lang/String; = "facebookVersion"

.field static final EVENT_EXTRAS_REQUEST_CODE:Ljava/lang/String; = "request_code"

.field static final EVENT_NAME_REFERRAL_CANCEL:Ljava/lang/String; = "fb_mobile_referral_cancel"

.field static final EVENT_NAME_REFERRAL_ERROR:Ljava/lang/String; = "fb_mobile_referral_error"

.field static final EVENT_NAME_REFERRAL_START:Ljava/lang/String; = "fb_mobile_referral_start"

.field static final EVENT_NAME_REFERRAL_SUCCESS:Ljava/lang/String; = "fb_mobile_referral_success"

.field static final EVENT_PARAM_AUTH_LOGGER_ID:Ljava/lang/String; = "0_auth_logger_id"

.field static final EVENT_PARAM_ERROR_MESSAGE:Ljava/lang/String; = "2_error_message"

.field static final EVENT_PARAM_EXTRAS:Ljava/lang/String; = "3_extras"

.field static final EVENT_PARAM_TIMESTAMP:Ljava/lang/String; = "1_timestamp_ms"

.field static final EVENT_PARAM_VALUE_EMPTY:Ljava/lang/String; = ""

.field static final FACEBOOK_PACKAGE_NAME:Ljava/lang/String; = "com.facebook.katana"


# instance fields
.field private facebookVersion:Ljava/lang/String;

.field private final logger:Lcom/facebook/appevents/InternalAppEventsLogger;

.field private loggerID:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    new-instance v0, Lcom/facebook/appevents/InternalAppEventsLogger;

    invoke-direct {v0, p1, p2}, Lcom/facebook/appevents/InternalAppEventsLogger;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/facebook/referrals/ReferralLogger;->logger:Lcom/facebook/appevents/InternalAppEventsLogger;

    .line 58
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object p2

    invoke-virtual {p2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/facebook/referrals/ReferralLogger;->loggerID:Ljava/lang/String;

    .line 62
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    if-eqz p1, :cond_0

    const-string p2, "com.facebook.katana"

    const/4 v0, 0x0

    .line 64
    invoke-virtual {p1, p2, v0}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 66
    iget-object p1, p1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    iput-object p1, p0, Lcom/facebook/referrals/ReferralLogger;->facebookVersion:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method private getReferralLoggingBundle()Landroid/os/Bundle;
    .locals 4

    .line 75
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 78
    iget-object v1, p0, Lcom/facebook/referrals/ReferralLogger;->loggerID:Ljava/lang/String;

    const-string v2, "0_auth_logger_id"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    const-string v3, "1_timestamp_ms"

    invoke-virtual {v0, v3, v1, v2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string v1, "2_error_message"

    const-string v2, ""

    .line 80
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "3_extras"

    .line 81
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public logCancel()V
    .locals 3

    .line 109
    invoke-direct {p0}, Lcom/facebook/referrals/ReferralLogger;->getReferralLoggingBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 111
    iget-object v1, p0, Lcom/facebook/referrals/ReferralLogger;->logger:Lcom/facebook/appevents/InternalAppEventsLogger;

    const-string v2, "fb_mobile_referral_cancel"

    invoke-virtual {v1, v2, v0}, Lcom/facebook/appevents/InternalAppEventsLogger;->logEventImplicitly(Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method

.method public logError(Ljava/lang/Exception;)V
    .locals 2

    .line 115
    invoke-direct {p0}, Lcom/facebook/referrals/ReferralLogger;->getReferralLoggingBundle()Landroid/os/Bundle;

    move-result-object v0

    if-eqz p1, :cond_0

    .line 116
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 117
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    const-string v1, "2_error_message"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    :cond_0
    iget-object p1, p0, Lcom/facebook/referrals/ReferralLogger;->logger:Lcom/facebook/appevents/InternalAppEventsLogger;

    const-string v1, "fb_mobile_referral_error"

    invoke-virtual {p1, v1, v0}, Lcom/facebook/appevents/InternalAppEventsLogger;->logEventImplicitly(Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method

.method public logStartReferral()V
    .locals 4

    .line 87
    invoke-direct {p0}, Lcom/facebook/referrals/ReferralLogger;->getReferralLoggingBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 89
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "request_code"

    .line 90
    invoke-static {}, Lcom/facebook/referrals/ReferralClient;->getReferralRequestCode()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 91
    iget-object v2, p0, Lcom/facebook/referrals/ReferralLogger;->facebookVersion:Ljava/lang/String;

    if-eqz v2, :cond_0

    const-string v2, "facebookVersion"

    .line 92
    iget-object v3, p0, Lcom/facebook/referrals/ReferralLogger;->facebookVersion:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_0
    const-string v2, "3_extras"

    .line 94
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 99
    :catch_0
    iget-object v1, p0, Lcom/facebook/referrals/ReferralLogger;->logger:Lcom/facebook/appevents/InternalAppEventsLogger;

    const-string v2, "fb_mobile_referral_start"

    invoke-virtual {v1, v2, v0}, Lcom/facebook/appevents/InternalAppEventsLogger;->logEventImplicitly(Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method

.method public logSuccess()V
    .locals 3

    .line 103
    invoke-direct {p0}, Lcom/facebook/referrals/ReferralLogger;->getReferralLoggingBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 105
    iget-object v1, p0, Lcom/facebook/referrals/ReferralLogger;->logger:Lcom/facebook/appevents/InternalAppEventsLogger;

    const-string v2, "fb_mobile_referral_success"

    invoke-virtual {v1, v2, v0}, Lcom/facebook/appevents/InternalAppEventsLogger;->logEventImplicitly(Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method
