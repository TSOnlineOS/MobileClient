.class final Lcom/google/android/gms/internal/appinvite/zzk;
.super Lcom/google/android/gms/internal/appinvite/zzh;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/appinvite/zzh<",
        "Lcom/google/android/gms/appinvite/AppInviteInvitationResult;",
        ">;"
    }
.end annotation


# instance fields
.field private final zzl:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private final zzm:Z

.field private final zzn:Landroid/content/Intent;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/appinvite/zzf;Lcom/google/android/gms/common/api/GoogleApiClient;Landroid/app/Activity;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/appinvite/zzh;-><init>(Lcom/google/android/gms/common/api/GoogleApiClient;)V

    .line 2
    iput-boolean p4, p0, Lcom/google/android/gms/internal/appinvite/zzk;->zzm:Z

    .line 3
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/google/android/gms/internal/appinvite/zzk;->zzl:Ljava/lang/ref/WeakReference;

    if-eqz p3, :cond_0

    .line 4
    invoke-virtual {p3}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-object p1, p0, Lcom/google/android/gms/internal/appinvite/zzk;->zzn:Landroid/content/Intent;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/appinvite/zzk;)Z
    .locals 0

    .line 17
    iget-boolean p0, p0, Lcom/google/android/gms/internal/appinvite/zzk;->zzm:Z

    return p0
.end method

.method static synthetic zzb(Lcom/google/android/gms/internal/appinvite/zzk;)Ljava/lang/ref/WeakReference;
    .locals 0

    .line 18
    iget-object p0, p0, Lcom/google/android/gms/internal/appinvite/zzk;->zzl:Ljava/lang/ref/WeakReference;

    return-object p0
.end method


# virtual methods
.method protected final synthetic createFailedResult(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/common/api/Result;
    .locals 2

    .line 15
    new-instance v0, Lcom/google/android/gms/internal/appinvite/zzp;

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    invoke-direct {v0, p1, v1}, Lcom/google/android/gms/internal/appinvite/zzp;-><init>(Lcom/google/android/gms/common/api/Status;Landroid/content/Intent;)V

    return-object v0
.end method

.method protected final synthetic doExecute(Lcom/google/android/gms/common/api/Api$AnyClient;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 6
    check-cast p1, Lcom/google/android/gms/internal/appinvite/zzm;

    .line 7
    iget-object v0, p0, Lcom/google/android/gms/internal/appinvite/zzk;->zzn:Landroid/content/Intent;

    invoke-static {v0}, Lcom/google/android/gms/appinvite/AppInviteReferral;->hasReferral(Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 8
    new-instance v0, Lcom/google/android/gms/internal/appinvite/zzp;

    sget-object v1, Lcom/google/android/gms/common/api/Status;->RESULT_SUCCESS:Lcom/google/android/gms/common/api/Status;

    iget-object v2, p0, Lcom/google/android/gms/internal/appinvite/zzk;->zzn:Landroid/content/Intent;

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/appinvite/zzp;-><init>(Lcom/google/android/gms/common/api/Status;Landroid/content/Intent;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/appinvite/zzk;->setResult(Lcom/google/android/gms/common/api/Result;)V

    const/4 v0, 0x0

    .line 9
    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/appinvite/zzm;->zza(Lcom/google/android/gms/internal/appinvite/zzo;)V

    return-void

    .line 11
    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/appinvite/zzn;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/appinvite/zzn;-><init>(Lcom/google/android/gms/internal/appinvite/zzk;)V

    .line 12
    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/appinvite/zzm;->zza(Lcom/google/android/gms/internal/appinvite/zzo;)V

    return-void
.end method
