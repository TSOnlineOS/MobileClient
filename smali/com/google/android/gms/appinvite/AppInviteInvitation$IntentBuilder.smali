.class public final Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/appinvite/AppInviteInvitation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "IntentBuilder"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder$PlatformMode;
    }
.end annotation


# static fields
.field public static final MAX_CALL_TO_ACTION_TEXT_LENGTH:I = 0x14

.field public static final MAX_EMAIL_HTML_CONTENT:I = 0x7d000

.field public static final MAX_MESSAGE_LENGTH:I = 0x64

.field public static final MIN_CALL_TO_ACTION_TEXT_LENGTH:I = 0x2


# instance fields
.field private final intent:Landroid/content/Intent;

.field private zzg:Ljava/lang/String;

.field private zzh:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/CharSequence;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.google.android.gms.appinvite.ACTION_APP_INVITE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;->intent:Landroid/content/Intent;

    const-string v1, "com.google.android.gms.appinvite.TITLE"

    .line 4
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/Intent;

    .line 5
    iget-object p1, p0, Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;->intent:Landroid/content/Intent;

    const-string v0, "com.google.android.gms"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    return-void
.end method


# virtual methods
.method public final build()Landroid/content/Intent;
    .locals 3

    .line 79
    iget-object v0, p0, Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;->zzg:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 80
    iget-object v0, p0, Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;->zzh:Ljava/lang/String;

    const-string v1, "Email html content must be set when email subject is set."

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    .line 81
    iget-object v0, p0, Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;->intent:Landroid/content/Intent;

    .line 82
    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "Custom image must not be set when email html content is set."

    .line 83
    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 84
    iget-object v0, p0, Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;->intent:Landroid/content/Intent;

    const-string v1, "com.google.android.gms.appinvite.BUTTON_TEXT"

    .line 85
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getCharSequenceExtra(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const-string v1, "Call to action text must not be set when email html content is set."

    .line 86
    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 87
    iget-object v0, p0, Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;->intent:Landroid/content/Intent;

    iget-object v1, p0, Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;->zzg:Ljava/lang/String;

    const-string v2, "com.google.android.gms.appinvite.EMAIL_SUBJECT"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 88
    iget-object v0, p0, Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;->intent:Landroid/content/Intent;

    iget-object v1, p0, Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;->zzh:Ljava/lang/String;

    const-string v2, "com.google.android.gms.appinvite.EMAIL_CONTENT"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_1

    .line 89
    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;->zzh:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 91
    :goto_1
    iget-object v0, p0, Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;->intent:Landroid/content/Intent;

    return-object v0

    .line 90
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Email subject must be set when email html content is set."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final setAccount(Landroid/accounts/Account;)Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;
    .locals 3

    const-string v0, "com.google.android.gms.appinvite.ACCOUNT_NAME"

    if-eqz p1, :cond_0

    .line 7
    iget-object v1, p1, Landroid/accounts/Account;->type:Ljava/lang/String;

    const-string v2, "com.google"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 8
    iget-object v1, p0, Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v1, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    goto :goto_0

    .line 9
    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {p1, v0}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    :goto_0
    return-object p0
.end method

.method public final setAdditionalReferralParameters(Ljava/util/Map;)Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;"
        }
    .end annotation

    const-string v0, "com.google.android.gms.appinvite.REFERRAL_PARAMETERS_URI"

    if-eqz p1, :cond_0

    .line 28
    iget-object v1, p0, Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;->intent:Landroid/content/Intent;

    invoke-static {p1}, Lcom/google/android/gms/appinvite/AppInviteInvitation;->zzb(Ljava/util/Map;)Landroid/os/Bundle;

    move-result-object p1

    invoke-virtual {v1, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    goto :goto_0

    .line 29
    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {p1, v0}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    :goto_0
    return-object p0
.end method

.method public final setAndroidMinimumVersionCode(I)Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;
    .locals 2

    .line 33
    iget-object v0, p0, Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;->intent:Landroid/content/Intent;

    const-string v1, "com.google.android.gms.appinvite.appMinimumVersionCode"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    return-object p0
.end method

.method public final setCallToActionText(Ljava/lang/CharSequence;)Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;
    .locals 4

    const/16 v0, 0x14

    const/4 v1, 0x2

    if-eqz p1, :cond_0

    .line 65
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-lt v2, v1, :cond_0

    .line 66
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-gt v2, v0, :cond_0

    .line 70
    iget-object v0, p0, Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;->intent:Landroid/content/Intent;

    const-string v1, "com.google.android.gms.appinvite.BUTTON_TEXT"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/Intent;

    return-object p0

    .line 67
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    .line 68
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v2, v3

    const/4 v1, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v2, v1

    const-string v0, "Text must be between %d and %d chars in length."

    .line 69
    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final setCustomImage(Landroid/net/Uri;)Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;
    .locals 9

    .line 35
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    invoke-virtual {p1}, Landroid/net/Uri;->isAbsolute()Z

    move-result v0

    const-string v1, "Image uri is not an absolute uri. Did you forget to add a scheme to the Uri?"

    .line 38
    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 39
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.resource"

    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v1, :cond_1

    const-string v1, "content"

    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "file"

    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    :goto_1
    if-nez v1, :cond_3

    const-string v4, "http"

    .line 45
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    const-string v4, "https"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    goto :goto_2

    :cond_2
    const/4 v4, 0x0

    goto :goto_3

    :cond_3
    :goto_2
    const/4 v4, 0x1

    :goto_3
    const-string v5, "Image uri must be a content URI with scheme \"android.resource\", \"content\" or \"file\", or a network url with scheme \"http\" or \"https\"."

    .line 46
    invoke-static {v4, v5}, Lcom/google/android/gms/common/internal/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    if-nez v1, :cond_8

    .line 48
    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    if-nez v4, :cond_4

    goto :goto_4

    :cond_4
    const-string v6, "."

    .line 51
    invoke-virtual {v4, v6}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v7

    const/4 v8, -0x1

    if-ne v7, v8, :cond_5

    goto :goto_4

    .line 54
    :cond_5
    invoke-virtual {v4, v6}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v5

    add-int/2addr v5, v3

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 55
    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    .line 57
    :goto_4
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_6

    invoke-static {v5}, Lcom/google/android/gms/appinvite/AppInviteInvitation;->zzb(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_7

    :cond_6
    const/4 v2, 0x1

    :cond_7
    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const-string v5, " images are not supported. Only jpg, jpeg, or png images are supported."

    invoke-virtual {v4, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 58
    invoke-static {v2, v4}, Lcom/google/android/gms/common/internal/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 59
    :cond_8
    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    .line 60
    iget-object v0, p0, Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    if-eqz v1, :cond_9

    .line 62
    iget-object p1, p0, Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {p1, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    :cond_9
    return-object p0
.end method

.method public final setDeepLink(Landroid/net/Uri;)Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;
    .locals 2

    const-string v0, "com.google.android.gms.appinvite.DEEP_LINK_URL"

    if-eqz p1, :cond_0

    .line 24
    iget-object v1, p0, Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v1, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    goto :goto_0

    .line 25
    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {p1, v0}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    :goto_0
    return-object p0
.end method

.method public final setEmailHtmlContent(Ljava/lang/String;)Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;
    .locals 3

    if-eqz p1, :cond_1

    .line 18
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    array-length v0, v0

    const v1, 0x7d000

    if-gt v0, v1, :cond_0

    goto :goto_0

    .line 19
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    .line 20
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v2

    const-string v1, "Email html content must be %d bytes or less."

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 21
    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;->zzh:Ljava/lang/String;

    return-object p0
.end method

.method public final setEmailSubject(Ljava/lang/String;)Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;
    .locals 0

    .line 16
    iput-object p1, p0, Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;->zzg:Ljava/lang/String;

    return-object p0
.end method

.method public final setGoogleAnalyticsTrackingId(Ljava/lang/String;)Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;
    .locals 2

    .line 31
    iget-object v0, p0, Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;->intent:Landroid/content/Intent;

    const-string v1, "com.google.android.gms.appinvite.GOOGLE_ANALYTICS_TRACKING_ID"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    return-object p0
.end method

.method public final setMessage(Ljava/lang/CharSequence;)Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;
    .locals 3

    if-eqz p1, :cond_1

    .line 11
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/16 v1, 0x64

    if-gt v0, v1, :cond_0

    goto :goto_0

    .line 12
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    .line 13
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v2

    const-string v1, "Message must be %d chars or less."

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 14
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;->intent:Landroid/content/Intent;

    const-string v1, "com.google.android.gms.appinvite.MESSAGE"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/Intent;

    return-object p0
.end method

.method public final setOtherPlatformsTargetApplication(ILjava/lang/String;)Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    const/4 v0, 0x1

    if-eq p1, v0, :cond_1

    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    .line 75
    iget-object p1, p0, Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;->intent:Landroid/content/Intent;

    const-string v0, "com.google.android.gms.appinvite.androidTargetApplication"

    invoke-virtual {p1, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0

    .line 77
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "targetPlatform must be either PROJECT_PLATFORM_IOS or PROJECT_PLATFORM_ANDROID."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 73
    :cond_1
    iget-object p1, p0, Lcom/google/android/gms/appinvite/AppInviteInvitation$IntentBuilder;->intent:Landroid/content/Intent;

    const-string v0, "com.google.android.gms.appinvite.iosTargetApplication"

    invoke-virtual {p1, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :goto_0
    return-object p0
.end method
