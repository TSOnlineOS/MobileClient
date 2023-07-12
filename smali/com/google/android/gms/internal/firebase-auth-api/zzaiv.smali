.class abstract Lcom/google/android/gms/internal/firebase-auth-api/zzaiv;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method abstract zza(Ljava/lang/Object;)I
.end method

.method abstract zzb(Ljava/lang/Object;)I
.end method

.method abstract zzc(Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method abstract zzd(Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method abstract zze(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method abstract zzf()Ljava/lang/Object;
.end method

.method abstract zzg(Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method abstract zzh(Ljava/lang/Object;II)V
.end method

.method abstract zzi(Ljava/lang/Object;IJ)V
.end method

.method abstract zzj(Ljava/lang/Object;ILjava/lang/Object;)V
.end method

.method abstract zzk(Ljava/lang/Object;ILcom/google/android/gms/internal/firebase-auth-api/zzaff;)V
.end method

.method abstract zzl(Ljava/lang/Object;IJ)V
.end method

.method abstract zzm(Ljava/lang/Object;)V
.end method

.method abstract zzn(Ljava/lang/Object;Ljava/lang/Object;)V
.end method

.method abstract zzo(Ljava/lang/Object;Ljava/lang/Object;)V
.end method

.method final zzp(Ljava/lang/Object;Lcom/google/android/gms/internal/firebase-auth-api/zzaia;)Z
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2
    invoke-interface {p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaia;->zzd()I

    move-result v0

    ushr-int/lit8 v1, v0, 0x3

    and-int/lit8 v0, v0, 0x7

    const/4 v2, 0x1

    if-eqz v0, :cond_8

    if-eq v0, v2, :cond_7

    const/4 v3, 0x2

    if-eq v0, v3, :cond_6

    const/4 v3, 0x4

    const/4 v4, 0x3

    if-eq v0, v4, :cond_2

    if-eq v0, v3, :cond_1

    const/4 v3, 0x5

    if-ne v0, v3, :cond_0

    .line 1
    invoke-interface {p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaia;->zzf()I

    move-result p2

    invoke-virtual {p0, p1, v1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaiv;->zzh(Ljava/lang/Object;II)V

    return v2

    .line 9
    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzagr;

    move-result-object p1

    throw p1

    :cond_1
    const/4 p1, 0x0

    return p1

    .line 2
    :cond_2
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaiv;->zzf()Ljava/lang/Object;

    move-result-object v0

    shl-int/lit8 v4, v1, 0x3

    :cond_3
    invoke-interface {p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaia;->zzc()I

    move-result v5

    const v6, 0x7fffffff

    if-eq v5, v6, :cond_4

    .line 3
    invoke-virtual {p0, v0, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaiv;->zzp(Ljava/lang/Object;Lcom/google/android/gms/internal/firebase-auth-api/zzaia;)Z

    move-result v5

    if-nez v5, :cond_3

    :cond_4
    or-int/2addr v3, v4

    invoke-interface {p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaia;->zzd()I

    move-result p2

    if-ne v3, p2, :cond_5

    .line 5
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaiv;->zzg(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, p1, v1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaiv;->zzj(Ljava/lang/Object;ILjava/lang/Object;)V

    return v2

    .line 4
    :cond_5
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzags;

    move-result-object p1

    throw p1

    .line 6
    :cond_6
    invoke-interface {p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaia;->zzp()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object p2

    invoke-virtual {p0, p1, v1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaiv;->zzk(Ljava/lang/Object;ILcom/google/android/gms/internal/firebase-auth-api/zzaff;)V

    return v2

    .line 7
    :cond_7
    invoke-interface {p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaia;->zzk()J

    move-result-wide v3

    invoke-virtual {p0, p1, v1, v3, v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzaiv;->zzi(Ljava/lang/Object;IJ)V

    return v2

    .line 8
    :cond_8
    invoke-interface {p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaia;->zzl()J

    move-result-wide v3

    invoke-virtual {p0, p1, v1, v3, v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzaiv;->zzl(Ljava/lang/Object;IJ)V

    return v2
.end method

.method abstract zzq(Lcom/google/android/gms/internal/firebase-auth-api/zzaia;)Z
.end method

.method abstract zzr(Ljava/lang/Object;Lcom/google/android/gms/internal/firebase-auth-api/zzaft;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
