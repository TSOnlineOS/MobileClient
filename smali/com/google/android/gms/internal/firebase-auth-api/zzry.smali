.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzry;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"


# static fields
.field private static final zza:Lcom/google/android/gms/internal/firebase-auth-api/zzagn;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzrx;

    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzrx;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzry;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzagn;

    return-void
.end method

.method public static synthetic zza(I)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x2

    if-eq p0, v0, :cond_4

    const/4 v0, 0x3

    if-eq p0, v0, :cond_3

    const/4 v0, 0x4

    if-eq p0, v0, :cond_2

    const/4 v0, 0x5

    if-eq p0, v0, :cond_1

    const/4 v0, 0x6

    if-eq p0, v0, :cond_0

    const-string p0, "UNRECOGNIZED"

    return-object p0

    :cond_0
    const-string p0, "DHKEM_P521_HKDF_SHA512"

    return-object p0

    :cond_1
    const-string p0, "DHKEM_P384_HKDF_SHA384"

    return-object p0

    :cond_2
    const-string p0, "DHKEM_P256_HKDF_SHA256"

    return-object p0

    :cond_3
    const-string p0, "DHKEM_X25519_HKDF_SHA256"

    return-object p0

    :cond_4
    const-string p0, "KEM_UNKNOWN"

    return-object p0
.end method
