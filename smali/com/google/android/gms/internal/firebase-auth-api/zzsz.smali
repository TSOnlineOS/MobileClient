.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzsz;
.super Lcom/google/android/gms/internal/firebase-auth-api/zzagg;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Lcom/google/android/gms/internal/firebase-auth-api/zzahq;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zztc;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zztc;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzagk;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzsy;)V
    .locals 0

    .line 2
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zztc;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zztc;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzagk;)V

    return-void
.end method


# virtual methods
.method public final zza()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzsz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zztc;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zztc;->zza()I

    move-result v0

    return v0
.end method

.method public final zzb(Lcom/google/android/gms/internal/firebase-auth-api/zztb;)Lcom/google/android/gms/internal/firebase-auth-api/zzsz;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzm()V

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzsz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    .line 2
    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zztc;

    invoke-static {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zztc;->zzk(Lcom/google/android/gms/internal/firebase-auth-api/zztc;Lcom/google/android/gms/internal/firebase-auth-api/zztb;)V

    return-object p0
.end method

.method public final zzc(I)Lcom/google/android/gms/internal/firebase-auth-api/zzsz;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzm()V

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzsz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    .line 2
    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zztc;

    invoke-static {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zztc;->zzi(Lcom/google/android/gms/internal/firebase-auth-api/zztc;I)V

    return-object p0
.end method

.method public final zzd(I)Lcom/google/android/gms/internal/firebase-auth-api/zztb;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzsz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zztc;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zztc;->zzd(I)Lcom/google/android/gms/internal/firebase-auth-api/zztb;

    move-result-object p1

    return-object p1
.end method

.method public final zze()Ljava/util/List;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzsz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zztc;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zztc;->zzh()Ljava/util/List;

    move-result-object v0

    .line 1
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
