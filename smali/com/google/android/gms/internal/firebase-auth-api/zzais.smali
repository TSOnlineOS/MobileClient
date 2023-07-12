.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzais;
.super Lcom/google/android/gms/internal/firebase-auth-api/zzagg;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Lcom/google/android/gms/internal/firebase-auth-api/zzahq;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzait;->zzd()Lcom/google/android/gms/internal/firebase-auth-api/zzait;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzagk;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzair;)V
    .locals 0

    .line 2
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzait;->zzd()Lcom/google/android/gms/internal/firebase-auth-api/zzait;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzagk;)V

    return-void
.end method


# virtual methods
.method public final zza(I)Lcom/google/android/gms/internal/firebase-auth-api/zzais;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagk;->zzL()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzn()V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzais;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    .line 3
    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzait;

    invoke-static {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzait;->zzf(Lcom/google/android/gms/internal/firebase-auth-api/zzait;I)V

    return-object p0
.end method

.method public final zzb(J)Lcom/google/android/gms/internal/firebase-auth-api/zzais;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagk;->zzL()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzn()V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzais;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    .line 3
    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzait;

    invoke-static {v0, p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzait;->zze(Lcom/google/android/gms/internal/firebase-auth-api/zzait;J)V

    return-object p0
.end method
