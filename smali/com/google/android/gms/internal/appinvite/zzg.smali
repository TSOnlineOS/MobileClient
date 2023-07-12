.class final Lcom/google/android/gms/internal/appinvite/zzg;
.super Lcom/google/android/gms/internal/appinvite/zzh;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/appinvite/zzh<",
        "Lcom/google/android/gms/common/api/Status;",
        ">;"
    }
.end annotation


# instance fields
.field private final zzj:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/appinvite/zzf;Lcom/google/android/gms/common/api/GoogleApiClient;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/appinvite/zzh;-><init>(Lcom/google/android/gms/common/api/GoogleApiClient;)V

    .line 2
    iput-object p3, p0, Lcom/google/android/gms/internal/appinvite/zzg;->zzj:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected final synthetic createFailedResult(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/common/api/Result;
    .locals 0

    return-object p1
.end method

.method protected final synthetic doExecute(Lcom/google/android/gms/common/api/Api$AnyClient;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 4
    check-cast p1, Lcom/google/android/gms/internal/appinvite/zzm;

    .line 5
    new-instance v0, Lcom/google/android/gms/internal/appinvite/zzj;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/appinvite/zzj;-><init>(Lcom/google/android/gms/internal/appinvite/zzg;)V

    .line 6
    iget-object v1, p0, Lcom/google/android/gms/internal/appinvite/zzg;->zzj:Ljava/lang/String;

    .line 7
    :try_start_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/appinvite/zzm;->getService()Landroid/os/IInterface;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/appinvite/zzq;

    invoke-interface {p1, v0, v1}, Lcom/google/android/gms/internal/appinvite/zzq;->zza(Lcom/google/android/gms/internal/appinvite/zzo;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method
