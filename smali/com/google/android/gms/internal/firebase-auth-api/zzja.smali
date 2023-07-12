.class final Lcom/google/android/gms/internal/firebase-auth-api/zzja;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Lcom/google/android/gms/internal/firebase-auth-api/zzbk;


# instance fields
.field private final zza:Lcom/google/android/gms/internal/firebase-auth-api/zzsk;

.field private final zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzjb;

.field private final zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzix;

.field private final zzd:Lcom/google/android/gms/internal/firebase-auth-api/zziw;


# direct methods
.method private constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzsk;Lcom/google/android/gms/internal/firebase-auth-api/zzjb;Lcom/google/android/gms/internal/firebase-auth-api/zziw;Lcom/google/android/gms/internal/firebase-auth-api/zzix;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzja;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzsk;

    iput-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzja;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzjb;

    iput-object p3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzja;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zziw;

    iput-object p4, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzja;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzix;

    return-void
.end method

.method static zza(Lcom/google/android/gms/internal/firebase-auth-api/zzsk;)Lcom/google/android/gms/internal/firebase-auth-api/zzja;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzsk;->zzg()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaff;->zzp()Z

    move-result v0

    if-nez v0, :cond_0

    .line 3
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzsk;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzse;

    move-result-object v0

    .line 4
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzjd;->zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzse;)Lcom/google/android/gms/internal/firebase-auth-api/zzjb;

    move-result-object v1

    .line 5
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzjd;->zzc(Lcom/google/android/gms/internal/firebase-auth-api/zzse;)Lcom/google/android/gms/internal/firebase-auth-api/zziw;

    move-result-object v2

    .line 6
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzjd;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzse;)Lcom/google/android/gms/internal/firebase-auth-api/zzix;

    move-result-object v0

    new-instance v3, Lcom/google/android/gms/internal/firebase-auth-api/zzja;

    invoke-direct {v3, p0, v1, v2, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzja;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzsk;Lcom/google/android/gms/internal/firebase-auth-api/zzjb;Lcom/google/android/gms/internal/firebase-auth-api/zziw;Lcom/google/android/gms/internal/firebase-auth-api/zzix;)V

    return-object v3

    .line 1
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "HpkePublicKey.public_key is empty."

    .line 2
    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
