.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzqi;
.super Lcom/google/android/gms/internal/firebase-auth-api/zzagg;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Lcom/google/android/gms/internal/firebase-auth-api/zzahq;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzqj;->zzc()Lcom/google/android/gms/internal/firebase-auth-api/zzqj;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzagk;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzqh;)V
    .locals 0

    .line 2
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzqj;->zzc()Lcom/google/android/gms/internal/firebase-auth-api/zzqj;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzagk;)V

    return-void
.end method


# virtual methods
.method public final zza(Lcom/google/android/gms/internal/firebase-auth-api/zzaff;)Lcom/google/android/gms/internal/firebase-auth-api/zzqi;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzm()V

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzqi;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    .line 2
    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzqj;

    invoke-static {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzqj;->zzg(Lcom/google/android/gms/internal/firebase-auth-api/zzqj;Lcom/google/android/gms/internal/firebase-auth-api/zzaff;)V

    return-object p0
.end method

.method public final zzb(I)Lcom/google/android/gms/internal/firebase-auth-api/zzqi;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzm()V

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzqi;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    .line 2
    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzqj;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzqj;->zzf(Lcom/google/android/gms/internal/firebase-auth-api/zzqj;I)V

    return-object p0
.end method
