.class final Lcom/google/android/gms/internal/appinvite/zzl;
.super Lcom/google/android/gms/internal/appinvite/zze;


# instance fields
.field private final synthetic zzo:Lcom/google/android/gms/internal/appinvite/zzi;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/appinvite/zzi;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/internal/appinvite/zzl;->zzo:Lcom/google/android/gms/internal/appinvite/zzi;

    invoke-direct {p0}, Lcom/google/android/gms/internal/appinvite/zze;-><init>()V

    return-void
.end method


# virtual methods
.method public final zza(Lcom/google/android/gms/common/api/Status;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 2
    iget-object v0, p0, Lcom/google/android/gms/internal/appinvite/zzl;->zzo:Lcom/google/android/gms/internal/appinvite/zzi;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/appinvite/zzi;->setResult(Lcom/google/android/gms/common/api/Result;)V

    return-void
.end method
