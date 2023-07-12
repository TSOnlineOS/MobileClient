.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzjj;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"


# static fields
.field public static final zza:[B

.field public static final zzb:[B

.field public static final zzc:[B

.field public static final zzd:[B

.field public static final zze:[B

.field public static final zzf:[B

.field public static final zzg:[B

.field public static final zzh:[B

.field public static final zzi:[B

.field public static final zzj:[B

.field public static final zzk:[B

.field public static final zzl:[B

.field private static final zzm:[B

.field private static final zzn:[B

.field private static final zzo:[B


# direct methods
.method static constructor <clinit>()V
    .locals 5

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 1
    invoke-static {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzjj;->zzc(II)[B

    move-result-object v2

    sput-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzjj;->zza:[B

    const/4 v2, 0x2

    const/16 v3, 0x20

    .line 2
    invoke-static {v2, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzjj;->zzc(II)[B

    move-result-object v3

    sput-object v3, Lcom/google/android/gms/internal/firebase-auth-api/zzjj;->zzb:[B

    const/16 v3, 0x10

    .line 3
    invoke-static {v2, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzjj;->zzc(II)[B

    move-result-object v3

    sput-object v3, Lcom/google/android/gms/internal/firebase-auth-api/zzjj;->zzc:[B

    const/16 v3, 0x11

    .line 4
    invoke-static {v2, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzjj;->zzc(II)[B

    move-result-object v3

    sput-object v3, Lcom/google/android/gms/internal/firebase-auth-api/zzjj;->zzd:[B

    const/16 v3, 0x12

    .line 5
    invoke-static {v2, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzjj;->zzc(II)[B

    move-result-object v3

    sput-object v3, Lcom/google/android/gms/internal/firebase-auth-api/zzjj;->zze:[B

    .line 6
    invoke-static {v2, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzjj;->zzc(II)[B

    move-result-object v3

    sput-object v3, Lcom/google/android/gms/internal/firebase-auth-api/zzjj;->zzf:[B

    .line 7
    invoke-static {v2, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzjj;->zzc(II)[B

    move-result-object v3

    sput-object v3, Lcom/google/android/gms/internal/firebase-auth-api/zzjj;->zzg:[B

    const/4 v3, 0x3

    .line 8
    invoke-static {v2, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzjj;->zzc(II)[B

    move-result-object v4

    sput-object v4, Lcom/google/android/gms/internal/firebase-auth-api/zzjj;->zzh:[B

    .line 9
    invoke-static {v2, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzjj;->zzc(II)[B

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzjj;->zzi:[B

    .line 10
    invoke-static {v2, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzjj;->zzc(II)[B

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzjj;->zzj:[B

    .line 11
    invoke-static {v2, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzjj;->zzc(II)[B

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzjj;->zzk:[B

    new-array v0, v1, [B

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzjj;->zzl:[B

    .line 12
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzly;->zza:Ljava/nio/charset/Charset;

    const-string v1, "KEM"

    invoke-virtual {v1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzjj;->zzm:[B

    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzly;->zza:Ljava/nio/charset/Charset;

    const-string v1, "HPKE"

    .line 13
    invoke-virtual {v1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzjj;->zzn:[B

    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzly;->zza:Ljava/nio/charset/Charset;

    const-string v1, "HPKE-v1"

    .line 14
    invoke-virtual {v1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzjj;->zzo:[B

    return-void
.end method

.method static zza(Lcom/google/android/gms/internal/firebase-auth-api/zzse;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzse;->zzf()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_c

    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzse;->zzf()I

    move-result v0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_c

    .line 3
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzse;->zze()I

    move-result v0

    const-string v3, "UNRECOGNIZED"

    const/4 v4, 0x5

    const/4 v5, 0x4

    const/4 v6, 0x3

    if-eq v0, v1, :cond_7

    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzse;->zze()I

    move-result v0

    if-ne v0, v2, :cond_0

    goto :goto_2

    .line 5
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzse;->zzd()I

    move-result v0

    if-eq v0, v1, :cond_2

    .line 6
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzse;->zzd()I

    move-result v0

    if-ne v0, v2, :cond_1

    goto :goto_0

    :cond_1
    return-void

    .line 7
    :cond_2
    :goto_0
    new-instance v0, Ljava/security/GeneralSecurityException;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzse;->zzd()I

    move-result p0

    if-eq p0, v1, :cond_6

    if-eq p0, v6, :cond_5

    if-eq p0, v5, :cond_4

    if-eq p0, v4, :cond_3

    goto :goto_1

    :cond_3
    const-string v3, "CHACHA20_POLY1305"

    goto :goto_1

    :cond_4
    const-string v3, "AES_256_GCM"

    goto :goto_1

    :cond_5
    const-string v3, "AES_128_GCM"

    goto :goto_1

    :cond_6
    const-string v3, "AEAD_UNKNOWN"

    :goto_1
    const-string p0, "Invalid AEAD param: "

    invoke-virtual {p0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 4
    :cond_7
    :goto_2
    new-instance v0, Ljava/security/GeneralSecurityException;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzse;->zze()I

    move-result p0

    if-eq p0, v1, :cond_b

    if-eq p0, v6, :cond_a

    if-eq p0, v5, :cond_9

    if-eq p0, v4, :cond_8

    goto :goto_3

    :cond_8
    const-string v3, "HKDF_SHA512"

    goto :goto_3

    :cond_9
    const-string v3, "HKDF_SHA384"

    goto :goto_3

    :cond_a
    const-string v3, "HKDF_SHA256"

    goto :goto_3

    :cond_b
    const-string v3, "KDF_UNKNOWN"

    :goto_3
    const-string p0, "Invalid KDF param: "

    invoke-virtual {p0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2
    :cond_c
    new-instance v0, Ljava/security/GeneralSecurityException;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzse;->zzf()I

    move-result p0

    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzry;->zza(I)Ljava/lang/String;

    move-result-object p0

    const-string v1, "Invalid KEM param: "

    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static zzb([B[B[B)[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    const/4 v0, 0x4

    new-array v0, v0, [[B

    .line 1
    sget-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zzjj;->zzn:[B

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const/4 v1, 0x1

    aput-object p0, v0, v1

    const/4 p0, 0x2

    aput-object p1, v0, p0

    const/4 p0, 0x3

    aput-object p2, v0, p0

    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzum;->zzb([[B)[B

    move-result-object p0

    return-object p0
.end method

.method public static zzc(II)[B
    .locals 3

    .line 1
    new-array v0, p0, [B

    const/4 v1, 0x0

    :goto_0
    if-ge v1, p0, :cond_0

    sub-int v2, p0, v1

    add-int/lit8 v2, v2, -0x1

    mul-int/lit8 v2, v2, 0x8

    shr-int v2, p1, v2

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method static zzd([B)[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    const/4 v0, 0x2

    new-array v0, v0, [[B

    .line 1
    sget-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zzjj;->zzm:[B

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const/4 v1, 0x1

    aput-object p0, v0, v1

    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzum;->zzb([[B)[B

    move-result-object p0

    return-object p0
.end method

.method static zze(Ljava/lang/String;[B[B)[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    const/4 v0, 0x4

    new-array v0, v0, [[B

    .line 1
    sget-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zzjj;->zzo:[B

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const/4 v1, 0x1

    aput-object p2, v0, v1

    sget-object p2, Lcom/google/android/gms/internal/firebase-auth-api/zzly;->zza:Ljava/nio/charset/Charset;

    invoke-virtual {p0, p2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    const/4 p2, 0x2

    aput-object p0, v0, p2

    const/4 p0, 0x3

    aput-object p1, v0, p0

    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzum;->zzb([[B)[B

    move-result-object p0

    return-object p0
.end method

.method static zzf(Ljava/lang/String;[B[BI)[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    const/4 v0, 0x5

    new-array v0, v0, [[B

    const/4 v1, 0x2

    .line 1
    invoke-static {v1, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzjj;->zzc(II)[B

    move-result-object p3

    const/4 v2, 0x0

    aput-object p3, v0, v2

    sget-object p3, Lcom/google/android/gms/internal/firebase-auth-api/zzjj;->zzo:[B

    const/4 v2, 0x1

    aput-object p3, v0, v2

    aput-object p2, v0, v1

    sget-object p2, Lcom/google/android/gms/internal/firebase-auth-api/zzly;->zza:Ljava/nio/charset/Charset;

    invoke-virtual {p0, p2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    const/4 p2, 0x3

    aput-object p0, v0, p2

    const/4 p0, 0x4

    aput-object p1, v0, p0

    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzum;->zzb([[B)[B

    move-result-object p0

    return-object p0
.end method

.method static zzg(I)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    add-int/lit8 p0, p0, -0x2

    const/4 v0, 0x2

    if-eq p0, v0, :cond_2

    const/4 v1, 0x3

    if-eq p0, v1, :cond_1

    const/4 v0, 0x4

    if-ne p0, v0, :cond_0

    return v1

    .line 1
    :cond_0
    new-instance p0, Ljava/security/GeneralSecurityException;

    const-string v0, "Unrecognized NIST HPKE KEM identifier"

    invoke-direct {p0, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    return v0

    :cond_2
    const/4 p0, 0x1

    return p0
.end method
