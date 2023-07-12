.class final Lcom/google/android/gms/measurement/internal/zzkq;
.super Lcom/google/android/gms/measurement/internal/zzap;
.source "com.google.android.gms:play-services-measurement@@21.2.2"


# instance fields
.field final synthetic zza:Lcom/google/android/gms/measurement/internal/zzkr;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzkr;Lcom/google/android/gms/measurement/internal/zzgz;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkq;->zza:Lcom/google/android/gms/measurement/internal/zzkr;

    invoke-direct {p0, p2}, Lcom/google/android/gms/measurement/internal/zzap;-><init>(Lcom/google/android/gms/measurement/internal/zzgz;)V

    return-void
.end method


# virtual methods
.method public final zzc()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkq;->zza:Lcom/google/android/gms/measurement/internal/zzkr;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkr;->zza()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkq;->zza:Lcom/google/android/gms/measurement/internal/zzkr;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v0

    const-string v1, "Starting upload from DelayedRunnable"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzes;->zza(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkq;->zza:Lcom/google/android/gms/measurement/internal/zzkr;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzkr;->zzf:Lcom/google/android/gms/measurement/internal/zzlg;

    .line 4
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzX()V

    return-void
.end method
