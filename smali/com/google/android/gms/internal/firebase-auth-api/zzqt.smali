.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzqt;
.super Lcom/google/android/gms/internal/firebase-auth-api/zzagg;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Lcom/google/android/gms/internal/firebase-auth-api/zzahq;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzqu;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzqu;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzagk;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzqs;)V
    .locals 0

    .line 2
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzqu;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzqu;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzagk;)V

    return-void
.end method


# virtual methods
.method public final zza(Lcom/google/android/gms/internal/firebase-auth-api/zzqx;)Lcom/google/android/gms/internal/firebase-auth-api/zzqt;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzm()V

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzqt;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    .line 2
    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzqu;

    invoke-static {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzqu;->zze(Lcom/google/android/gms/internal/firebase-auth-api/zzqu;Lcom/google/android/gms/internal/firebase-auth-api/zzqx;)V

    return-object p0
.end method