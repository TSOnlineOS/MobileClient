.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzbu;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"


# instance fields
.field private final zza:Lcom/google/android/gms/internal/firebase-auth-api/zzsu;


# direct methods
.method private constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzsu;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzbu;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

    return-void
.end method

.method public static zze(Ljava/lang/String;[BI)Lcom/google/android/gms/internal/firebase-auth-api/zzbu;
    .locals 3

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzbu;

    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzsu;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzst;

    move-result-object v1

    .line 2
    invoke-virtual {v1, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzst;->zzb(Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzst;

    .line 3
    sget-object p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaff;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    .line 4
    array-length p0, p1

    const/4 v2, 0x0

    invoke-static {p1, v2, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaff;->zzn([BII)Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object p0

    .line 3
    invoke-virtual {v1, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzst;->zzc(Lcom/google/android/gms/internal/firebase-auth-api/zzaff;)Lcom/google/android/gms/internal/firebase-auth-api/zzst;

    add-int/lit8 p2, p2, -0x1

    if-eqz p2, :cond_2

    const/4 p0, 0x1

    if-eq p2, p0, :cond_1

    const/4 p0, 0x2

    if-eq p2, p0, :cond_0

    .line 5
    sget-object p0, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    goto :goto_0

    :cond_0
    sget-object p0, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    goto :goto_0

    :cond_1
    sget-object p0, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    goto :goto_0

    :cond_2
    sget-object p0, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    .line 6
    :goto_0
    invoke-virtual {v1, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzst;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zztv;)Lcom/google/android/gms/internal/firebase-auth-api/zzst;

    .line 7
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzbu;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzsu;)V

    return-object v0
.end method


# virtual methods
.method final zza()Lcom/google/android/gms/internal/firebase-auth-api/zzsu;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzbu;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

    return-object v0
.end method

.method public final zzb()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzbu;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzsu;->zzf()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final zzc()[B
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzbu;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzsu;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaff;->zzq()[B

    move-result-object v0

    return-object v0
.end method

.method public final zzd()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzbu;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzsu;->zzd()Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    move-result-object v0

    .line 2
    sget-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->ordinal()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    return v1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Unknown output prefix type"

    .line 3
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    return v1
.end method
