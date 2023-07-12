.class final Lcom/google/android/gms/measurement/internal/zzgg;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-measurement@@21.2.2"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic zza:Lcom/google/android/gms/measurement/internal/zzac;

.field final synthetic zzb:Lcom/google/android/gms/measurement/internal/zzq;

.field final synthetic zzc:Lcom/google/android/gms/measurement/internal/zzgw;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzgw;Lcom/google/android/gms/measurement/internal/zzac;Lcom/google/android/gms/measurement/internal/zzq;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzgg;->zzc:Lcom/google/android/gms/measurement/internal/zzgw;

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzgg;->zza:Lcom/google/android/gms/measurement/internal/zzac;

    iput-object p3, p0, Lcom/google/android/gms/measurement/internal/zzgg;->zzb:Lcom/google/android/gms/measurement/internal/zzq;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgg;->zzc:Lcom/google/android/gms/measurement/internal/zzgw;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzgw;->zzc(Lcom/google/android/gms/measurement/internal/zzgw;)Lcom/google/android/gms/measurement/internal/zzlg;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzA()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgg;->zza:Lcom/google/android/gms/measurement/internal/zzac;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzac;->zzc:Lcom/google/android/gms/measurement/internal/zzlj;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzlj;->zza()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgg;->zzc:Lcom/google/android/gms/measurement/internal/zzgw;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzgw;->zzc(Lcom/google/android/gms/measurement/internal/zzgw;)Lcom/google/android/gms/measurement/internal/zzlg;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzgg;->zza:Lcom/google/android/gms/measurement/internal/zzac;

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzgg;->zzb:Lcom/google/android/gms/measurement/internal/zzq;

    .line 3
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzO(Lcom/google/android/gms/measurement/internal/zzac;Lcom/google/android/gms/measurement/internal/zzq;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgg;->zzc:Lcom/google/android/gms/measurement/internal/zzgw;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzgw;->zzc(Lcom/google/android/gms/measurement/internal/zzgw;)Lcom/google/android/gms/measurement/internal/zzlg;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzgg;->zza:Lcom/google/android/gms/measurement/internal/zzac;

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzgg;->zzb:Lcom/google/android/gms/measurement/internal/zzq;

    .line 4
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzU(Lcom/google/android/gms/measurement/internal/zzac;Lcom/google/android/gms/measurement/internal/zzq;)V

    return-void
.end method
