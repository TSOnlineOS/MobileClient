.class final Lcom/google/android/gms/measurement/internal/zzer;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-measurement-impl@@21.2.2"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic zza:I

.field final synthetic zzb:Ljava/lang/String;

.field final synthetic zzc:Ljava/lang/Object;

.field final synthetic zzd:Ljava/lang/Object;

.field final synthetic zze:Ljava/lang/Object;

.field final synthetic zzf:Lcom/google/android/gms/measurement/internal/zzeu;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzeu;ILjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzer;->zzf:Lcom/google/android/gms/measurement/internal/zzeu;

    iput p2, p0, Lcom/google/android/gms/measurement/internal/zzer;->zza:I

    iput-object p3, p0, Lcom/google/android/gms/measurement/internal/zzer;->zzb:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/gms/measurement/internal/zzer;->zzc:Ljava/lang/Object;

    iput-object p5, p0, Lcom/google/android/gms/measurement/internal/zzer;->zzd:Ljava/lang/Object;

    iput-object p6, p0, Lcom/google/android/gms/measurement/internal/zzer;->zze:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzer;->zzf:Lcom/google/android/gms/measurement/internal/zzeu;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzeu;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzm()Lcom/google/android/gms/measurement/internal/zzfj;

    move-result-object v0

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgy;->zzy()Z

    move-result v1

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzer;->zzf:Lcom/google/android/gms/measurement/internal/zzeu;

    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzeu;->zza(Lcom/google/android/gms/measurement/internal/zzeu;)C

    move-result v2

    if-nez v2, :cond_1

    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 3
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzge;->zzf()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v1

    .line 4
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzag;->zzy()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzer;->zzf:Lcom/google/android/gms/measurement/internal/zzeu;

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 5
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzge;->zzay()Lcom/google/android/gms/measurement/internal/zzab;

    const/16 v2, 0x43

    .line 6
    invoke-static {v1, v2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzt(Lcom/google/android/gms/measurement/internal/zzeu;C)V

    goto :goto_0

    .line 15
    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzer;->zzf:Lcom/google/android/gms/measurement/internal/zzeu;

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 7
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzge;->zzay()Lcom/google/android/gms/measurement/internal/zzab;

    const/16 v2, 0x63

    .line 8
    invoke-static {v1, v2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzt(Lcom/google/android/gms/measurement/internal/zzeu;C)V

    .line 6
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzer;->zzf:Lcom/google/android/gms/measurement/internal/zzeu;

    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzb(Lcom/google/android/gms/measurement/internal/zzeu;)J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-gez v6, :cond_2

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 9
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzge;->zzf()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v2

    .line 10
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzag;->zzh()J

    const-wide/32 v2, 0x12cc8

    invoke-static {v1, v2, v3}, Lcom/google/android/gms/measurement/internal/zzeu;->zzs(Lcom/google/android/gms/measurement/internal/zzeu;J)V

    :cond_2
    iget v1, p0, Lcom/google/android/gms/measurement/internal/zzer;->zza:I

    const-string v2, "01VDIWEA?"

    .line 11
    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzer;->zzf:Lcom/google/android/gms/measurement/internal/zzeu;

    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzeu;->zza(Lcom/google/android/gms/measurement/internal/zzeu;)C

    move-result v3

    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzb(Lcom/google/android/gms/measurement/internal/zzeu;)J

    move-result-wide v4

    const/4 v2, 0x1

    iget-object v6, p0, Lcom/google/android/gms/measurement/internal/zzer;->zzb:Ljava/lang/String;

    iget-object v7, p0, Lcom/google/android/gms/measurement/internal/zzer;->zzc:Ljava/lang/Object;

    iget-object v8, p0, Lcom/google/android/gms/measurement/internal/zzer;->zzd:Ljava/lang/Object;

    iget-object v9, p0, Lcom/google/android/gms/measurement/internal/zzer;->zze:Ljava/lang/Object;

    .line 12
    invoke-static {v2, v6, v7, v8, v9}, Lcom/google/android/gms/measurement/internal/zzeu;->zzo(ZLjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "2"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ":"

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0x400

    if-le v2, v3, :cond_3

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzer;->zzb:Ljava/lang/String;

    const/4 v2, 0x0

    .line 13
    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 14
    :cond_3
    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzfj;->zzb:Lcom/google/android/gms/measurement/internal/zzfh;

    if-eqz v0, :cond_4

    const-wide/16 v2, 0x1

    .line 15
    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/gms/measurement/internal/zzfh;->zzb(Ljava/lang/String;J)V

    :cond_4
    return-void

    :cond_5
    const/4 v0, 0x6

    .line 8
    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzer;->zzf:Lcom/google/android/gms/measurement/internal/zzeu;

    .line 16
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzr()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Persisted config not initialized. Not logging error/warn"

    invoke-static {v0, v1, v2}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    return-void
.end method
