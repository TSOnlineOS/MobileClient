.class final Lcom/google/android/gms/measurement/internal/zzif;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-measurement-impl@@21.2.2"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic zza:Lcom/google/android/gms/measurement/internal/zzai;

.field final synthetic zzb:I

.field final synthetic zzc:J

.field final synthetic zzd:Z

.field final synthetic zze:Lcom/google/android/gms/measurement/internal/zzai;

.field final synthetic zzf:Lcom/google/android/gms/measurement/internal/zzij;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzij;Lcom/google/android/gms/measurement/internal/zzai;IJZLcom/google/android/gms/measurement/internal/zzai;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzif;->zzf:Lcom/google/android/gms/measurement/internal/zzij;

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzif;->zza:Lcom/google/android/gms/measurement/internal/zzai;

    iput p3, p0, Lcom/google/android/gms/measurement/internal/zzif;->zzb:I

    iput-wide p4, p0, Lcom/google/android/gms/measurement/internal/zzif;->zzc:J

    iput-boolean p6, p0, Lcom/google/android/gms/measurement/internal/zzif;->zzd:Z

    iput-object p7, p0, Lcom/google/android/gms/measurement/internal/zzif;->zze:Lcom/google/android/gms/measurement/internal/zzai;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzif;->zzf:Lcom/google/android/gms/measurement/internal/zzij;

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzif;->zza:Lcom/google/android/gms/measurement/internal/zzai;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzij;->zzV(Lcom/google/android/gms/measurement/internal/zzai;)V

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzif;->zzf:Lcom/google/android/gms/measurement/internal/zzij;

    iget-object v3, p0, Lcom/google/android/gms/measurement/internal/zzif;->zza:Lcom/google/android/gms/measurement/internal/zzai;

    iget v4, p0, Lcom/google/android/gms/measurement/internal/zzif;->zzb:I

    iget-wide v5, p0, Lcom/google/android/gms/measurement/internal/zzif;->zzc:J

    iget-boolean v8, p0, Lcom/google/android/gms/measurement/internal/zzif;->zzd:Z

    const/4 v7, 0x0

    .line 2
    invoke-static/range {v2 .. v8}, Lcom/google/android/gms/measurement/internal/zzij;->zzw(Lcom/google/android/gms/measurement/internal/zzij;Lcom/google/android/gms/measurement/internal/zzai;IJZZ)V

    .line 3
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzqr;->zzc()Z

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzif;->zzf:Lcom/google/android/gms/measurement/internal/zzij;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 4
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzf()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v0

    .line 5
    sget-object v1, Lcom/google/android/gms/measurement/internal/zzeh;->zzan:Lcom/google/android/gms/measurement/internal/zzeg;

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/measurement/internal/zzag;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzeg;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzif;->zzf:Lcom/google/android/gms/measurement/internal/zzij;

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzif;->zza:Lcom/google/android/gms/measurement/internal/zzai;

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzif;->zze:Lcom/google/android/gms/measurement/internal/zzai;

    .line 6
    invoke-static {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzij;->zzv(Lcom/google/android/gms/measurement/internal/zzij;Lcom/google/android/gms/measurement/internal/zzai;Lcom/google/android/gms/measurement/internal/zzai;)V

    :cond_0
    return-void
.end method
