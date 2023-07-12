.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzgz;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"


# static fields
.field private static final zza:Ljava/lang/ThreadLocal;


# instance fields
.field private final zzb:Ljavax/crypto/SecretKey;

.field private final zzc:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzgy;

    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzgy;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzgz;->zza:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>([BZ)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x2

    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzhj;->zza(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3
    array-length v0, p1

    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzvu;->zzb(I)V

    .line 4
    new-instance v0, Ljavax/crypto/spec/SecretKeySpec;

    const-string v1, "AES"

    invoke-direct {v0, p1, v1}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzgz;->zzb:Ljavax/crypto/SecretKey;

    iput-boolean p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzgz;->zzc:Z

    return-void

    .line 2
    :cond_0
    new-instance p1, Ljava/security/GeneralSecurityException;

    const-string p2, "Can not use AES-GCM in FIPS-mode, as BoringCrypto module is not available."

    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public final zza([B[B[B)[B
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    array-length p3, p1

    const/16 v0, 0xc

    if-ne p3, v0, :cond_9

    .line 2
    iget-boolean p3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzgz;->zzc:Z

    const/4 v1, 0x1

    if-eq v1, p3, :cond_0

    const/16 v2, 0x10

    goto :goto_0

    :cond_0
    const/16 v2, 0x1c

    .line 3
    :goto_0
    array-length v3, p2

    if-lt v3, v2, :cond_8

    const/4 v2, 0x0

    if-eqz p3, :cond_2

    .line 5
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p3

    invoke-static {p2, v2, v0}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-virtual {p3, v4}, Ljava/nio/ByteBuffer;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_1

    goto :goto_1

    .line 14
    :cond_1
    new-instance p1, Ljava/security/GeneralSecurityException;

    const-string p2, "iv does not match prepended iv"

    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    :goto_1
    const-string p3, "java.vendor"

    .line 6
    invoke-static {p3}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    const-string v4, "The Android Project"

    const/4 v5, 0x0

    if-eq p3, v4, :cond_3

    if-eqz p3, :cond_4

    .line 7
    invoke-virtual {p3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_4

    :cond_3
    sget p3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 8
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    :cond_4
    if-eqz v5, :cond_5

    .line 9
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result p3

    const/16 v4, 0x13

    if-gt p3, v4, :cond_5

    .line 11
    new-instance p3, Ljavax/crypto/spec/IvParameterSpec;

    invoke-direct {p3, p1, v2, v0}, Ljavax/crypto/spec/IvParameterSpec;-><init>([BII)V

    goto :goto_2

    .line 10
    :cond_5
    new-instance p3, Ljavax/crypto/spec/GCMParameterSpec;

    const/16 v4, 0x80

    invoke-direct {p3, v4, p1, v2, v0}, Ljavax/crypto/spec/GCMParameterSpec;-><init>(I[BII)V

    .line 11
    :goto_2
    sget-object p1, Lcom/google/android/gms/internal/firebase-auth-api/zzgz;->zza:Ljava/lang/ThreadLocal;

    .line 12
    invoke-virtual {p1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljavax/crypto/Cipher;

    const/4 v4, 0x2

    iget-object v5, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzgz;->zzb:Ljavax/crypto/SecretKey;

    invoke-virtual {p1, v4, v5, p3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    iget-boolean p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzgz;->zzc:Z

    if-eq v1, p1, :cond_6

    const/4 v0, 0x0

    :cond_6
    if-eqz p1, :cond_7

    add-int/lit8 v3, v3, -0xc

    :cond_7
    sget-object p1, Lcom/google/android/gms/internal/firebase-auth-api/zzgz;->zza:Ljava/lang/ThreadLocal;

    .line 13
    invoke-virtual {p1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljavax/crypto/Cipher;

    invoke-virtual {p1, p2, v0, v3}, Ljavax/crypto/Cipher;->doFinal([BII)[B

    move-result-object p1

    return-object p1

    .line 4
    :cond_8
    new-instance p1, Ljava/security/GeneralSecurityException;

    const-string p2, "ciphertext too short"

    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 2
    :cond_9
    new-instance p1, Ljava/security/GeneralSecurityException;

    const-string p2, "iv is wrong size"

    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
