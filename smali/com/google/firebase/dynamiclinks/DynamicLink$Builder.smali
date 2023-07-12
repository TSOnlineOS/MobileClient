.class public final Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/dynamiclinks/DynamicLink;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private final zze:Landroid/os/Bundle;

.field private final zzg:Lcom/google/firebase/dynamiclinks/internal/zze;

.field private final zzh:Landroid/os/Bundle;


# direct methods
.method public constructor <init>(Lcom/google/firebase/dynamiclinks/internal/zze;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;->zzg:Lcom/google/firebase/dynamiclinks/internal/zze;

    .line 3
    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;->zze:Landroid/os/Bundle;

    .line 4
    invoke-static {}, Lcom/google/firebase/FirebaseApp;->getInstance()Lcom/google/firebase/FirebaseApp;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 5
    iget-object p1, p0, Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;->zze:Landroid/os/Bundle;

    .line 6
    invoke-static {}, Lcom/google/firebase/FirebaseApp;->getInstance()Lcom/google/firebase/FirebaseApp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/FirebaseApp;->getOptions()Lcom/google/firebase/FirebaseOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/FirebaseOptions;->getApiKey()Ljava/lang/String;

    move-result-object v0

    const-string v1, "apiKey"

    .line 7
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    :cond_0
    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;->zzh:Landroid/os/Bundle;

    .line 9
    iget-object v0, p0, Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;->zze:Landroid/os/Bundle;

    const-string v1, "parameters"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method

.method private final zzb()V
    .locals 2

    .line 45
    iget-object v0, p0, Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;->zze:Landroid/os/Bundle;

    const-string v1, "apiKey"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    return-void

    .line 46
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Missing API key. Set with setApiKey()."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public final buildDynamicLink()Lcom/google/firebase/dynamiclinks/DynamicLink;
    .locals 2

    .line 38
    iget-object v0, p0, Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;->zze:Landroid/os/Bundle;

    invoke-static {v0}, Lcom/google/firebase/dynamiclinks/internal/zze;->zzb(Landroid/os/Bundle;)V

    .line 39
    new-instance v0, Lcom/google/firebase/dynamiclinks/DynamicLink;

    iget-object v1, p0, Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;->zze:Landroid/os/Bundle;

    invoke-direct {v0, v1}, Lcom/google/firebase/dynamiclinks/DynamicLink;-><init>(Landroid/os/Bundle;)V

    return-object v0
.end method

.method public final buildShortDynamicLink()Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/firebase/dynamiclinks/ShortDynamicLink;",
            ">;"
        }
    .end annotation

    .line 40
    invoke-direct {p0}, Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;->zzb()V

    .line 41
    iget-object v0, p0, Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;->zzg:Lcom/google/firebase/dynamiclinks/internal/zze;

    iget-object v1, p0, Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;->zze:Landroid/os/Bundle;

    invoke-virtual {v0, v1}, Lcom/google/firebase/dynamiclinks/internal/zze;->zza(Landroid/os/Bundle;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method public final buildShortDynamicLink(I)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/firebase/dynamiclinks/ShortDynamicLink;",
            ">;"
        }
    .end annotation

    .line 42
    invoke-direct {p0}, Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;->zzb()V

    .line 43
    iget-object v0, p0, Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;->zze:Landroid/os/Bundle;

    const-string v1, "suffix"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 44
    iget-object p1, p0, Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;->zzg:Lcom/google/firebase/dynamiclinks/internal/zze;

    iget-object v0, p0, Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;->zze:Landroid/os/Bundle;

    invoke-virtual {p1, v0}, Lcom/google/firebase/dynamiclinks/internal/zze;->zza(Landroid/os/Bundle;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public final setAndroidParameters(Lcom/google/firebase/dynamiclinks/DynamicLink$AndroidParameters;)Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;
    .locals 1

    .line 26
    iget-object v0, p0, Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;->zzh:Landroid/os/Bundle;

    iget-object p1, p1, Lcom/google/firebase/dynamiclinks/DynamicLink$AndroidParameters;->zzf:Landroid/os/Bundle;

    invoke-virtual {v0, p1}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    return-object p0
.end method

.method public final setDomainUriPrefix(Ljava/lang/String;)Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;
    .locals 3

    const-string v0, "(https:\\/\\/)?[a-z0-9]{3,}\\.app\\.goo\\.gl$"

    .line 21
    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "(https:\\/\\/)?[a-z0-9]{3,}\\.page\\.link$"

    .line 22
    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 23
    :cond_0
    iget-object v0, p0, Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;->zze:Landroid/os/Bundle;

    const-string v1, "https://"

    const-string v2, ""

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "domain"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    :cond_1
    iget-object v0, p0, Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;->zze:Landroid/os/Bundle;

    const-string v1, "domainUriPrefix"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method

.method public final setDynamicLinkDomain(Ljava/lang/String;)Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const-string v0, "(https:\\/\\/)?[a-z0-9]{3,}\\.app\\.goo\\.gl$"

    .line 15
    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "(https:\\/\\/)?[a-z0-9]{3,}\\.page\\.link$"

    .line 16
    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 17
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Use setDomainUriPrefix() instead, setDynamicLinkDomain() is only applicable for *.page.link and *.app.goo.gl domains."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 18
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;->zze:Landroid/os/Bundle;

    const-string v1, "domain"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    iget-object v0, p0, Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;->zze:Landroid/os/Bundle;

    const-string v1, "https://"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_2

    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_2
    new-instance p1, Ljava/lang/String;

    invoke-direct {p1, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_1
    const-string v1, "domainUriPrefix"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method

.method public final setGoogleAnalyticsParameters(Lcom/google/firebase/dynamiclinks/DynamicLink$GoogleAnalyticsParameters;)Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;
    .locals 1

    .line 30
    iget-object v0, p0, Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;->zzh:Landroid/os/Bundle;

    iget-object p1, p1, Lcom/google/firebase/dynamiclinks/DynamicLink$GoogleAnalyticsParameters;->zzf:Landroid/os/Bundle;

    invoke-virtual {v0, p1}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    return-object p0
.end method

.method public final setIosParameters(Lcom/google/firebase/dynamiclinks/DynamicLink$IosParameters;)Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;
    .locals 1

    .line 28
    iget-object v0, p0, Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;->zzh:Landroid/os/Bundle;

    iget-object p1, p1, Lcom/google/firebase/dynamiclinks/DynamicLink$IosParameters;->zzf:Landroid/os/Bundle;

    invoke-virtual {v0, p1}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    return-object p0
.end method

.method public final setItunesConnectAnalyticsParameters(Lcom/google/firebase/dynamiclinks/DynamicLink$ItunesConnectAnalyticsParameters;)Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;
    .locals 1

    .line 32
    iget-object v0, p0, Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;->zzh:Landroid/os/Bundle;

    iget-object p1, p1, Lcom/google/firebase/dynamiclinks/DynamicLink$ItunesConnectAnalyticsParameters;->zzf:Landroid/os/Bundle;

    invoke-virtual {v0, p1}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    return-object p0
.end method

.method public final setLink(Landroid/net/Uri;)Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;
    .locals 2

    .line 13
    iget-object v0, p0, Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;->zzh:Landroid/os/Bundle;

    const-string v1, "link"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    return-object p0
.end method

.method public final setLongLink(Landroid/net/Uri;)Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;
    .locals 2

    .line 11
    iget-object v0, p0, Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;->zze:Landroid/os/Bundle;

    const-string v1, "dynamicLink"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    return-object p0
.end method

.method public final setNavigationInfoParameters(Lcom/google/firebase/dynamiclinks/DynamicLink$NavigationInfoParameters;)Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;
    .locals 1

    .line 36
    iget-object v0, p0, Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;->zzh:Landroid/os/Bundle;

    iget-object p1, p1, Lcom/google/firebase/dynamiclinks/DynamicLink$NavigationInfoParameters;->zzf:Landroid/os/Bundle;

    invoke-virtual {v0, p1}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    return-object p0
.end method

.method public final setSocialMetaTagParameters(Lcom/google/firebase/dynamiclinks/DynamicLink$SocialMetaTagParameters;)Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;
    .locals 1

    .line 34
    iget-object v0, p0, Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;->zzh:Landroid/os/Bundle;

    iget-object p1, p1, Lcom/google/firebase/dynamiclinks/DynamicLink$SocialMetaTagParameters;->zzf:Landroid/os/Bundle;

    invoke-virtual {v0, p1}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    return-object p0
.end method
