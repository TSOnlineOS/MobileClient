.class public Lcom/facebook/referrals/ReferralManager;
.super Ljava/lang/Object;
.source "ReferralManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/referrals/ReferralManager$FragmentStartActivityDelegate;,
        Lcom/facebook/referrals/ReferralManager$ActivityStartActivityDelegate;
    }
.end annotation


# static fields
.field private static volatile instance:Lcom/facebook/referrals/ReferralManager;


# instance fields
.field private logger:Lcom/facebook/referrals/ReferralLogger;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    invoke-static {}, Lcom/facebook/internal/Validate;->sdkInitialized()V

    return-void
.end method

.method public static getInstance()Lcom/facebook/referrals/ReferralManager;
    .locals 2

    .line 58
    sget-object v0, Lcom/facebook/referrals/ReferralManager;->instance:Lcom/facebook/referrals/ReferralManager;

    if-nez v0, :cond_1

    .line 59
    const-class v0, Lcom/facebook/referrals/ReferralManager;

    monitor-enter v0

    .line 60
    :try_start_0
    sget-object v1, Lcom/facebook/referrals/ReferralManager;->instance:Lcom/facebook/referrals/ReferralManager;

    if-nez v1, :cond_0

    .line 61
    new-instance v1, Lcom/facebook/referrals/ReferralManager;

    invoke-direct {v1}, Lcom/facebook/referrals/ReferralManager;-><init>()V

    sput-object v1, Lcom/facebook/referrals/ReferralManager;->instance:Lcom/facebook/referrals/ReferralManager;

    .line 63
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 66
    :cond_1
    :goto_0
    sget-object v0, Lcom/facebook/referrals/ReferralManager;->instance:Lcom/facebook/referrals/ReferralManager;

    return-object v0
.end method

.method private getLogger(Landroid/content/Context;)Lcom/facebook/referrals/ReferralLogger;
    .locals 2

    if-eqz p1, :cond_0

    goto :goto_0

    .line 218
    :cond_0
    invoke-static {}, Lcom/facebook/FacebookSdk;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    :goto_0
    if-nez p1, :cond_1

    const/4 p1, 0x0

    return-object p1

    .line 222
    :cond_1
    iget-object v0, p0, Lcom/facebook/referrals/ReferralManager;->logger:Lcom/facebook/referrals/ReferralLogger;

    if-nez v0, :cond_2

    .line 223
    new-instance v0, Lcom/facebook/referrals/ReferralLogger;

    invoke-static {}, Lcom/facebook/FacebookSdk;->getApplicationId()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/facebook/referrals/ReferralLogger;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/facebook/referrals/ReferralManager;->logger:Lcom/facebook/referrals/ReferralLogger;

    .line 225
    :cond_2
    iget-object p1, p0, Lcom/facebook/referrals/ReferralManager;->logger:Lcom/facebook/referrals/ReferralLogger;

    return-object p1
.end method

.method private static resolveIntent(Landroid/content/Intent;)Z
    .locals 2

    .line 230
    invoke-static {}, Lcom/facebook/FacebookSdk;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object p0

    if-eqz p0, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method private startReferralImpl(Lcom/facebook/referrals/StartActivityDelegate;)V
    .locals 2

    .line 129
    invoke-interface {p1}, Lcom/facebook/referrals/StartActivityDelegate;->getActivityContext()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/facebook/referrals/ReferralManager;->getLogger(Landroid/content/Context;)Lcom/facebook/referrals/ReferralLogger;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 131
    invoke-virtual {v0}, Lcom/facebook/referrals/ReferralLogger;->logStartReferral()V

    .line 134
    :cond_0
    invoke-direct {p0, p1}, Lcom/facebook/referrals/ReferralManager;->tryFacebookActivity(Lcom/facebook/referrals/StartActivityDelegate;)Z

    move-result p1

    if-nez p1, :cond_2

    .line 137
    new-instance p1, Lcom/facebook/FacebookException;

    const-string v1, "Failed to open Referral dialog: FacebookActivity could not be started. Please make sure you added FacebookActivity to the AndroidManifest."

    invoke-direct {p1, v1}, Lcom/facebook/FacebookException;-><init>(Ljava/lang/String;)V

    if-eqz v0, :cond_1

    .line 142
    invoke-virtual {v0, p1}, Lcom/facebook/referrals/ReferralLogger;->logError(Ljava/lang/Exception;)V

    .line 145
    :cond_1
    throw p1

    :cond_2
    return-void
.end method

.method private tryFacebookActivity(Lcom/facebook/referrals/StartActivityDelegate;)Z
    .locals 3

    .line 199
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 200
    invoke-static {}, Lcom/facebook/FacebookSdk;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/facebook/FacebookActivity;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    const-string v1, "ReferralFragment"

    .line 201
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 203
    invoke-static {v0}, Lcom/facebook/referrals/ReferralManager;->resolveIntent(Landroid/content/Intent;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    return v2

    .line 208
    :cond_0
    :try_start_0
    sget-object v1, Lcom/facebook/internal/CallbackManagerImpl$RequestCodeOffset;->Referral:Lcom/facebook/internal/CallbackManagerImpl$RequestCodeOffset;

    .line 209
    invoke-virtual {v1}, Lcom/facebook/internal/CallbackManagerImpl$RequestCodeOffset;->toRequestCode()I

    move-result v1

    .line 208
    invoke-interface {p1, v0, v1}, Lcom/facebook/referrals/StartActivityDelegate;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p1, 0x1

    return p1

    :catch_0
    return v2
.end method


# virtual methods
.method onActivityResult(ILandroid/content/Intent;Lcom/facebook/FacebookCallback;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/content/Intent;",
            "Lcom/facebook/FacebookCallback<",
            "Lcom/facebook/referrals/ReferralResult;",
            ">;)Z"
        }
    .end annotation

    const-string v0, "error_message"

    const-string v1, "fb_referral_codes"

    const/4 v2, -0x1

    const/4 v3, 0x0

    if-ne p1, v2, :cond_0

    if-eqz p2, :cond_0

    .line 156
    :try_start_0
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 157
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 158
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 159
    new-instance p2, Lorg/json/JSONArray;

    invoke-direct {p2, p1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 160
    invoke-static {p2}, Lcom/facebook/internal/Utility;->convertJSONArrayToList(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object p1

    .line 161
    new-instance p2, Lcom/facebook/referrals/ReferralResult;

    invoke-direct {p2, p1}, Lcom/facebook/referrals/ReferralResult;-><init>(Ljava/util/List;)V

    move-object p1, v3

    goto :goto_2

    :cond_0
    if-nez p1, :cond_2

    if-eqz p2, :cond_1

    .line 164
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 165
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 166
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 167
    new-instance p2, Lcom/facebook/FacebookException;

    invoke-direct {p2, p1}, Lcom/facebook/FacebookException;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    move-object p1, v3

    move-object p2, p1

    goto :goto_2

    .line 170
    :cond_2
    new-instance p2, Lcom/facebook/FacebookException;

    const-string p1, "Unexpected call to ReferralManager.onActivityResult"

    invoke-direct {p2, p1}, Lcom/facebook/FacebookException;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    move-object p1, p2

    goto :goto_1

    .line 173
    :catch_0
    new-instance p1, Lcom/facebook/FacebookException;

    const-string p2, "Unable to parse referral codes from response"

    invoke-direct {p1, p2}, Lcom/facebook/FacebookException;-><init>(Ljava/lang/String;)V

    :goto_1
    move-object p2, v3

    .line 176
    :goto_2
    invoke-direct {p0, v3}, Lcom/facebook/referrals/ReferralManager;->getLogger(Landroid/content/Context;)Lcom/facebook/referrals/ReferralLogger;

    move-result-object v0

    if-eqz v0, :cond_5

    if-eqz p2, :cond_3

    .line 179
    invoke-virtual {v0}, Lcom/facebook/referrals/ReferralLogger;->logSuccess()V

    goto :goto_3

    :cond_3
    if-eqz p1, :cond_4

    .line 181
    invoke-virtual {v0, p1}, Lcom/facebook/referrals/ReferralLogger;->logError(Ljava/lang/Exception;)V

    goto :goto_3

    .line 183
    :cond_4
    invoke-virtual {v0}, Lcom/facebook/referrals/ReferralLogger;->logCancel()V

    :cond_5
    :goto_3
    if-eqz p2, :cond_6

    .line 188
    invoke-interface {p3, p2}, Lcom/facebook/FacebookCallback;->onSuccess(Ljava/lang/Object;)V

    goto :goto_4

    :cond_6
    if-eqz p1, :cond_7

    .line 190
    invoke-interface {p3, p1}, Lcom/facebook/FacebookCallback;->onError(Lcom/facebook/FacebookException;)V

    goto :goto_4

    .line 192
    :cond_7
    invoke-interface {p3}, Lcom/facebook/FacebookCallback;->onCancel()V

    :goto_4
    const/4 p1, 0x1

    return p1
.end method

.method public registerCallback(Lcom/facebook/CallbackManager;Lcom/facebook/FacebookCallback;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/CallbackManager;",
            "Lcom/facebook/FacebookCallback<",
            "Lcom/facebook/referrals/ReferralResult;",
            ">;)V"
        }
    .end annotation

    .line 113
    instance-of v0, p1, Lcom/facebook/internal/CallbackManagerImpl;

    if-eqz v0, :cond_0

    .line 117
    check-cast p1, Lcom/facebook/internal/CallbackManagerImpl;

    .line 119
    invoke-static {}, Lcom/facebook/referrals/ReferralClient;->getReferralRequestCode()I

    move-result v0

    new-instance v1, Lcom/facebook/referrals/ReferralManager$1;

    invoke-direct {v1, p0, p2}, Lcom/facebook/referrals/ReferralManager$1;-><init>(Lcom/facebook/referrals/ReferralManager;Lcom/facebook/FacebookCallback;)V

    .line 118
    invoke-virtual {p1, v0, v1}, Lcom/facebook/internal/CallbackManagerImpl;->registerCallback(ILcom/facebook/internal/CallbackManagerImpl$Callback;)V

    return-void

    .line 114
    :cond_0
    new-instance p1, Lcom/facebook/FacebookException;

    const-string p2, "Unexpected CallbackManager, please use the provided Factory."

    invoke-direct {p1, p2}, Lcom/facebook/FacebookException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public startReferral(Landroid/app/Activity;)V
    .locals 1

    .line 75
    new-instance v0, Lcom/facebook/referrals/ReferralManager$ActivityStartActivityDelegate;

    invoke-direct {v0, p1}, Lcom/facebook/referrals/ReferralManager$ActivityStartActivityDelegate;-><init>(Landroid/app/Activity;)V

    invoke-direct {p0, v0}, Lcom/facebook/referrals/ReferralManager;->startReferralImpl(Lcom/facebook/referrals/StartActivityDelegate;)V

    return-void
.end method

.method public startReferral(Landroid/app/Fragment;)V
    .locals 2

    .line 93
    new-instance v0, Lcom/facebook/referrals/ReferralManager$FragmentStartActivityDelegate;

    new-instance v1, Lcom/facebook/internal/FragmentWrapper;

    invoke-direct {v1, p1}, Lcom/facebook/internal/FragmentWrapper;-><init>(Landroid/app/Fragment;)V

    invoke-direct {v0, v1}, Lcom/facebook/referrals/ReferralManager$FragmentStartActivityDelegate;-><init>(Lcom/facebook/internal/FragmentWrapper;)V

    invoke-direct {p0, v0}, Lcom/facebook/referrals/ReferralManager;->startReferralImpl(Lcom/facebook/referrals/StartActivityDelegate;)V

    return-void
.end method

.method public startReferral(Landroidx/fragment/app/Fragment;)V
    .locals 2

    .line 84
    new-instance v0, Lcom/facebook/referrals/ReferralManager$FragmentStartActivityDelegate;

    new-instance v1, Lcom/facebook/internal/FragmentWrapper;

    invoke-direct {v1, p1}, Lcom/facebook/internal/FragmentWrapper;-><init>(Landroidx/fragment/app/Fragment;)V

    invoke-direct {v0, v1}, Lcom/facebook/referrals/ReferralManager$FragmentStartActivityDelegate;-><init>(Lcom/facebook/internal/FragmentWrapper;)V

    invoke-direct {p0, v0}, Lcom/facebook/referrals/ReferralManager;->startReferralImpl(Lcom/facebook/referrals/StartActivityDelegate;)V

    return-void
.end method

.method public startReferral(Lcom/facebook/internal/FragmentWrapper;)V
    .locals 1

    .line 102
    new-instance v0, Lcom/facebook/referrals/ReferralManager$FragmentStartActivityDelegate;

    invoke-direct {v0, p1}, Lcom/facebook/referrals/ReferralManager$FragmentStartActivityDelegate;-><init>(Lcom/facebook/internal/FragmentWrapper;)V

    invoke-direct {p0, v0}, Lcom/facebook/referrals/ReferralManager;->startReferralImpl(Lcom/facebook/referrals/StartActivityDelegate;)V

    return-void
.end method
