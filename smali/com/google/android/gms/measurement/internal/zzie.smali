.class final Lcom/google/android/gms/measurement/internal/zzie;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-measurement-impl@@21.2.2"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic zza:Lcom/google/android/gms/measurement/internal/zzai;

.field final synthetic zzb:J

.field final synthetic zzc:I

.field final synthetic zzd:J

.field final synthetic zze:Z

.field final synthetic zzf:Lcom/google/android/gms/measurement/internal/zzai;

.field final synthetic zzg:Lcom/google/android/gms/measurement/internal/zzij;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzij;Lcom/google/android/gms/measurement/internal/zzai;JIJZLcom/google/android/gms/measurement/internal/zzai;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzie;->zzg:Lcom/google/android/gms/measurement/internal/zzij;

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzie;->zza:Lcom/google/android/gms/measurement/internal/zzai;

    iput-wide p3, p0, Lcom/google/android/gms/measurement/internal/zzie;->zzb:J

    iput p5, p0, Lcom/google/android/gms/measurement/internal/zzie;->zzc:I

    iput-wide p6, p0, Lcom/google/android/gms/measurement/internal/zzie;->zzd:J

    iput-boolean p8, p0, Lcom/google/android/gms/measurement/internal/zzie;->zze:Z

    iput-object p9, p0, Lcom/google/android/gms/measurement/internal/zzie;->zzf:Lcom/google/android/gms/measurement/internal/zzai;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzie;->zzg:Lcom/google/android/gms/measurement/internal/zzij;

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzie;->zza:Lcom/google/android/gms/measurement/internal/zzai;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzij;->zzV(Lcom/google/android/gms/measurement/internal/zzai;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzie;->zzg:Lcom/google/android/gms/measurement/internal/zzij;

    iget-wide v1, p0, Lcom/google/android/gms/measurement/internal/zzie;->zzb:J

    const/4 v3, 0x0

    .line 2
    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/gms/measurement/internal/zzij;->zzL(JZ)V

    iget-object v4, p0, Lcom/google/android/gms/measurement/internal/zzie;->zzg:Lcom/google/android/gms/measurement/internal/zzij;

    iget-object v5, p0, Lcom/google/android/gms/measurement/internal/zzie;->zza:Lcom/google/android/gms/measurement/internal/zzai;

    iget v6, p0, Lcom/google/android/gms/measurement/internal/zzie;->zzc:I

    iget-wide v7, p0, Lcom/google/android/gms/measurement/internal/zzie;->zzd:J

    iget-boolean v10, p0, Lcom/google/android/gms/measurement/internal/zzie;->zze:Z

    const/4 v9, 0x1

    .line 3
    invoke-static/range {v4 .. v10}, Lcom/google/android/gms/measurement/internal/zzij;->zzw(Lcom/google/android/gms/measurement/internal/zzij;Lcom/google/android/gms/measurement/internal/zzai;IJZZ)V

    .line 4
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzqr;->zzc()Z

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzie;->zzg:Lcom/google/android/gms/measurement/internal/zzij;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 5
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzf()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v0

    .line 6
    sget-object v1, Lcom/google/android/gms/measurement/internal/zzeh;->zzan:Lcom/google/android/gms/measurement/internal/zzeg;

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/measurement/internal/zzag;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzeg;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzie;->zzg:Lcom/google/android/gms/measurement/internal/zzij;

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzie;->zza:Lcom/google/android/gms/measurement/internal/zzai;

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzie;->zzf:Lcom/google/android/gms/measurement/internal/zzai;

    .line 7
    invoke-static {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzij;->zzv(Lcom/google/android/gms/measurement/internal/zzij;Lcom/google/android/gms/measurement/internal/zzai;Lcom/google/android/gms/measurement/internal/zzai;)V

    :cond_0
    return-void
.end method
