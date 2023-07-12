.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzuq;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Lcom/google/android/gms/internal/firebase-auth-api/zzbk;


# instance fields
.field private final zza:Lcom/google/android/gms/internal/firebase-auth-api/zzus;

.field private final zzb:Ljava/lang/String;

.field private final zzc:[B

.field private final zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzuo;


# direct methods
.method public constructor <init>(Ljava/security/interfaces/ECPublicKey;[BLjava/lang/String;ILcom/google/android/gms/internal/firebase-auth-api/zzuo;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-interface {p1}, Ljava/security/interfaces/ECPublicKey;->getW()Ljava/security/spec/ECPoint;

    move-result-object p4

    invoke-interface {p1}, Ljava/security/interfaces/ECPublicKey;->getParams()Ljava/security/spec/ECParameterSpec;

    move-result-object v0

    invoke-virtual {v0}, Ljava/security/spec/ECParameterSpec;->getCurve()Ljava/security/spec/EllipticCurve;

    move-result-object v0

    invoke-static {p4, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzjx;->zzb(Ljava/security/spec/ECPoint;Ljava/security/spec/EllipticCurve;)V

    new-instance p4, Lcom/google/android/gms/internal/firebase-auth-api/zzus;

    invoke-direct {p4, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzus;-><init>(Ljava/security/interfaces/ECPublicKey;)V

    iput-object p4, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzuq;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzus;

    iput-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzuq;->zzc:[B

    iput-object p3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzuq;->zzb:Ljava/lang/String;

    iput-object p5, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzuq;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzuo;

    return-void
.end method
