.class final Lcom/google/android/gms/measurement/internal/zzkm;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-measurement-impl@@21.2.2"


# instance fields
.field protected zza:J

.field protected zzb:J

.field final synthetic zzc:Lcom/google/android/gms/measurement/internal/zzko;

.field private final zzd:Lcom/google/android/gms/measurement/internal/zzap;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/measurement/internal/zzko;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkm;->zzc:Lcom/google/android/gms/measurement/internal/zzko;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzkl;

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzkm;->zzc:Lcom/google/android/gms/measurement/internal/zzko;

    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzko;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/measurement/internal/zzkl;-><init>(Lcom/google/android/gms/measurement/internal/zzkm;Lcom/google/android/gms/measurement/internal/zzgz;)V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkm;->zzd:Lcom/google/android/gms/measurement/internal/zzap;

    iget-object p1, p1, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzge;->zzax()Lcom/google/android/gms/common/util/Clock;

    move-result-object p1

    .line 3
    invoke-interface {p1}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gms/measurement/internal/zzkm;->zza:J

    iput-wide v0, p0, Lcom/google/android/gms/measurement/internal/zzkm;->zzb:J

    return-void
.end method


# virtual methods
.method final zza()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkm;->zzd:Lcom/google/android/gms/measurement/internal/zzap;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzap;->zzb()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/google/android/gms/measurement/internal/zzkm;->zza:J

    iput-wide v0, p0, Lcom/google/android/gms/measurement/internal/zzkm;->zzb:J

    return-void
.end method

.method final zzb(J)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkm;->zzd:Lcom/google/android/gms/measurement/internal/zzap;

    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzap;->zzb()V

    return-void
.end method

.method final zzc(J)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkm;->zzc:Lcom/google/android/gms/measurement/internal/zzko;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkm;->zzd:Lcom/google/android/gms/measurement/internal/zzap;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzap;->zzb()V

    iput-wide p1, p0, Lcom/google/android/gms/measurement/internal/zzkm;->zza:J

    iput-wide p1, p0, Lcom/google/android/gms/measurement/internal/zzkm;->zzb:J

    return-void
.end method

.method public final zzd(ZZJ)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkm;->zzc:Lcom/google/android/gms/measurement/internal/zzko;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkm;->zzc:Lcom/google/android/gms/measurement/internal/zzko;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzf;->zza()V

    .line 3
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzpe;->zzc()Z

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkm;->zzc:Lcom/google/android/gms/measurement/internal/zzko;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 4
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzf()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v0

    .line 5
    sget-object v1, Lcom/google/android/gms/measurement/internal/zzeh;->zzaf:Lcom/google/android/gms/measurement/internal/zzeg;

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/measurement/internal/zzag;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzeg;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkm;->zzc:Lcom/google/android/gms/measurement/internal/zzko;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzko;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 9
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzJ()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkm;->zzc:Lcom/google/android/gms/measurement/internal/zzko;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 10
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzm()Lcom/google/android/gms/measurement/internal/zzfj;

    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzfj;->zzj:Lcom/google/android/gms/measurement/internal/zzff;

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzkm;->zzc:Lcom/google/android/gms/measurement/internal/zzko;

    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 12
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzge;->zzax()Lcom/google/android/gms/common/util/Clock;

    move-result-object v1

    .line 11
    invoke-interface {v1}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzff;->zzb(J)V

    goto :goto_0

    .line 28
    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkm;->zzc:Lcom/google/android/gms/measurement/internal/zzko;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 6
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzm()Lcom/google/android/gms/measurement/internal/zzfj;

    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzfj;->zzj:Lcom/google/android/gms/measurement/internal/zzff;

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzkm;->zzc:Lcom/google/android/gms/measurement/internal/zzko;

    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 8
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzge;->zzax()Lcom/google/android/gms/common/util/Clock;

    move-result-object v1

    .line 7
    invoke-interface {v1}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzff;->zzb(J)V

    .line 11
    :cond_1
    :goto_0
    iget-wide v0, p0, Lcom/google/android/gms/measurement/internal/zzkm;->zza:J

    sub-long v0, p3, v0

    if-nez p1, :cond_3

    const-wide/16 v2, 0x3e8

    cmp-long p1, v0, v2

    if-ltz p1, :cond_2

    goto :goto_1

    .line 25
    :cond_2
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkm;->zzc:Lcom/google/android/gms/measurement/internal/zzko;

    iget-object p1, p1, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 26
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object p1

    .line 27
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object p1

    .line 28
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    const-string p3, "Screen exposed for less than 1000 ms. Event not sent. time"

    invoke-virtual {p1, p3, p2}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    const/4 p1, 0x0

    return p1

    :cond_3
    :goto_1
    if-nez p2, :cond_4

    .line 11
    iget-wide v0, p0, Lcom/google/android/gms/measurement/internal/zzkm;->zzb:J

    sub-long v0, p3, v0

    iput-wide p3, p0, Lcom/google/android/gms/measurement/internal/zzkm;->zzb:J

    :cond_4
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkm;->zzc:Lcom/google/android/gms/measurement/internal/zzko;

    iget-object p1, p1, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 13
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object p1

    .line 14
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object p1

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const-string v3, "Recording user engagement, ms"

    invoke-virtual {p1, v3, v2}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance p1, Landroid/os/Bundle;

    .line 15
    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "_et"

    .line 16
    invoke-virtual {p1, v2, v0, v1}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkm;->zzc:Lcom/google/android/gms/measurement/internal/zzko;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 17
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzf()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzag;->zzu()Z

    move-result v0

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzkm;->zzc:Lcom/google/android/gms/measurement/internal/zzko;

    iget-object v2, v2, Lcom/google/android/gms/measurement/internal/zze;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 19
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzge;->zzs()Lcom/google/android/gms/measurement/internal/zziy;

    move-result-object v2

    .line 20
    invoke-virtual {v2, v0}, Lcom/google/android/gms/measurement/internal/zziy;->zzj(Z)Lcom/google/android/gms/measurement/internal/zziq;

    move-result-object v0

    .line 21
    invoke-static {v0, p1, v1}, Lcom/google/android/gms/measurement/internal/zzlo;->zzK(Lcom/google/android/gms/measurement/internal/zziq;Landroid/os/Bundle;Z)V

    if-nez p2, :cond_5

    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzkm;->zzc:Lcom/google/android/gms/measurement/internal/zzko;

    iget-object p2, p2, Lcom/google/android/gms/measurement/internal/zze;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 22
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzge;->zzq()Lcom/google/android/gms/measurement/internal/zzij;

    move-result-object p2

    const-string v0, "auto"

    const-string v2, "_e"

    .line 23
    invoke-virtual {p2, v0, v2, p1}, Lcom/google/android/gms/measurement/internal/zzij;->zzG(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    :cond_5
    iput-wide p3, p0, Lcom/google/android/gms/measurement/internal/zzkm;->zza:J

    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkm;->zzd:Lcom/google/android/gms/measurement/internal/zzap;

    .line 24
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzap;->zzb()V

    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkm;->zzd:Lcom/google/android/gms/measurement/internal/zzap;

    const-wide/32 p2, 0x36ee80

    .line 25
    invoke-virtual {p1, p2, p3}, Lcom/google/android/gms/measurement/internal/zzap;->zzd(J)V

    return v1
.end method
