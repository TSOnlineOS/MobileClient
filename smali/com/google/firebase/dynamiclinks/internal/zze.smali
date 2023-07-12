.class public final Lcom/google/firebase/dynamiclinks/internal/zze;
.super Lcom/google/firebase/dynamiclinks/FirebaseDynamicLinks;


# instance fields
.field private final zzq:Lcom/google/android/gms/common/api/GoogleApi;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/GoogleApi<",
            "Lcom/google/android/gms/common/api/Api$ApiOptions$NoOptions;",
            ">;"
        }
    .end annotation
.end field

.field private final zzr:Lcom/google/firebase/analytics/connector/AnalyticsConnector;


# direct methods
.method private constructor <init>(Lcom/google/android/gms/common/api/GoogleApi;Lcom/google/firebase/analytics/connector/AnalyticsConnector;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/GoogleApi<",
            "Lcom/google/android/gms/common/api/Api$ApiOptions$NoOptions;",
            ">;",
            "Lcom/google/firebase/analytics/connector/AnalyticsConnector;",
            ")V"
        }
    .end annotation

    .line 3
    invoke-direct {p0}, Lcom/google/firebase/dynamiclinks/FirebaseDynamicLinks;-><init>()V

    .line 4
    iput-object p1, p0, Lcom/google/firebase/dynamiclinks/internal/zze;->zzq:Lcom/google/android/gms/common/api/GoogleApi;

    .line 5
    iput-object p2, p0, Lcom/google/firebase/dynamiclinks/internal/zze;->zzr:Lcom/google/firebase/analytics/connector/AnalyticsConnector;

    if-nez p2, :cond_0

    const-string p1, "FDL"

    const-string p2, "FDL logging failed. Add a dependency for Firebase Analytics to your app to enable logging of Dynamic Link events."

    .line 7
    invoke-static {p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method

.method public constructor <init>(Lcom/google/firebase/FirebaseApp;Lcom/google/firebase/analytics/connector/AnalyticsConnector;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/firebase/dynamiclinks/internal/zzc;

    invoke-virtual {p1}, Lcom/google/firebase/FirebaseApp;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/google/firebase/dynamiclinks/internal/zzc;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, v0, p2}, Lcom/google/firebase/dynamiclinks/internal/zze;-><init>(Lcom/google/android/gms/common/api/GoogleApi;Lcom/google/firebase/analytics/connector/AnalyticsConnector;)V

    return-void
.end method

.method public static zzb(Landroid/os/Bundle;)V
    .locals 2

    const-string v0, "dynamicLink"

    .line 23
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    const-string v1, "domainUriPrefix"

    .line 24
    invoke-virtual {p0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_1

    if-eqz v0, :cond_0

    goto :goto_0

    .line 25
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "FDL domain is missing. Set with setDomainUriPrefix() or setDynamicLinkDomain()."

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public final createDynamicLink()Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;
    .locals 1

    .line 20
    new-instance v0, Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;

    invoke-direct {v0, p0}, Lcom/google/firebase/dynamiclinks/DynamicLink$Builder;-><init>(Lcom/google/firebase/dynamiclinks/internal/zze;)V

    return-object v0
.end method

.method public final getDynamicLink(Landroid/content/Intent;)Lcom/google/android/gms/tasks/Task;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Intent;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/firebase/dynamiclinks/PendingDynamicLinkData;",
            ">;"
        }
    .end annotation

    .line 9
    iget-object v0, p0, Lcom/google/firebase/dynamiclinks/internal/zze;->zzq:Lcom/google/android/gms/common/api/GoogleApi;

    new-instance v1, Lcom/google/firebase/dynamiclinks/internal/zzl;

    iget-object v2, p0, Lcom/google/firebase/dynamiclinks/internal/zze;->zzr:Lcom/google/firebase/analytics/connector/AnalyticsConnector;

    .line 10
    invoke-virtual {p1}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/google/firebase/dynamiclinks/internal/zzl;-><init>(Lcom/google/firebase/analytics/connector/AnalyticsConnector;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/common/api/GoogleApi;->doWrite(Lcom/google/android/gms/common/api/internal/TaskApiCall;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    .line 12
    sget-object v1, Lcom/google/firebase/dynamiclinks/internal/DynamicLinkData;->CREATOR:Landroid/os/Parcelable$Creator;

    const-string v2, "com.google.firebase.dynamiclinks.DYNAMIC_LINK_DATA"

    .line 13
    invoke-static {p1, v2, v1}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelableSerializer;->deserializeFromIntentExtra(Landroid/content/Intent;Ljava/lang/String;Landroid/os/Parcelable$Creator;)Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/dynamiclinks/internal/DynamicLinkData;

    if-eqz p1, :cond_0

    .line 14
    new-instance v1, Lcom/google/firebase/dynamiclinks/PendingDynamicLinkData;

    invoke-direct {v1, p1}, Lcom/google/firebase/dynamiclinks/PendingDynamicLinkData;-><init>(Lcom/google/firebase/dynamiclinks/internal/DynamicLinkData;)V

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_1

    .line 17
    invoke-static {v1}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    :cond_1
    return-object v0
.end method

.method public final getDynamicLink(Landroid/net/Uri;)Lcom/google/android/gms/tasks/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/firebase/dynamiclinks/PendingDynamicLinkData;",
            ">;"
        }
    .end annotation

    .line 19
    iget-object v0, p0, Lcom/google/firebase/dynamiclinks/internal/zze;->zzq:Lcom/google/android/gms/common/api/GoogleApi;

    new-instance v1, Lcom/google/firebase/dynamiclinks/internal/zzl;

    iget-object v2, p0, Lcom/google/firebase/dynamiclinks/internal/zze;->zzr:Lcom/google/firebase/analytics/connector/AnalyticsConnector;

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, v2, p1}, Lcom/google/firebase/dynamiclinks/internal/zzl;-><init>(Lcom/google/firebase/analytics/connector/AnalyticsConnector;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/common/api/GoogleApi;->doWrite(Lcom/google/android/gms/common/api/internal/TaskApiCall;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public final zza(Landroid/os/Bundle;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Bundle;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/firebase/dynamiclinks/ShortDynamicLink;",
            ">;"
        }
    .end annotation

    .line 21
    invoke-static {p1}, Lcom/google/firebase/dynamiclinks/internal/zze;->zzb(Landroid/os/Bundle;)V

    .line 22
    iget-object v0, p0, Lcom/google/firebase/dynamiclinks/internal/zze;->zzq:Lcom/google/android/gms/common/api/GoogleApi;

    new-instance v1, Lcom/google/firebase/dynamiclinks/internal/zzj;

    invoke-direct {v1, p1}, Lcom/google/firebase/dynamiclinks/internal/zzj;-><init>(Landroid/os/Bundle;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/common/api/GoogleApi;->doWrite(Lcom/google/android/gms/common/api/internal/TaskApiCall;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method
