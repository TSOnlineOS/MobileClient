.class final Lcom/google/android/gms/internal/firebase-auth-api/zziz;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Lcom/google/android/gms/internal/firebase-auth-api/zzbj;


# static fields
.field private static final zza:[B


# instance fields
.field private final zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzjc;

.field private final zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzjb;

.field private final zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzix;

.field private final zze:I

.field private final zzf:Lcom/google/android/gms/internal/firebase-auth-api/zziw;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zziz;->zza:[B

    return-void
.end method

.method private constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzjc;Lcom/google/android/gms/internal/firebase-auth-api/zzjb;Lcom/google/android/gms/internal/firebase-auth-api/zziw;Lcom/google/android/gms/internal/firebase-auth-api/zzix;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zziz;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzjc;

    iput-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zziz;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzjb;

    iput-object p3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zziz;->zzf:Lcom/google/android/gms/internal/firebase-auth-api/zziw;

    iput-object p4, p0, Lcom/google/android/gms/internal/firebase-auth-api/zziz;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzix;

    iput p5, p0, Lcom/google/android/gms/internal/firebase-auth-api/zziz;->zze:I

    return-void
.end method

.method static zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzsh;)Lcom/google/android/gms/internal/firebase-auth-api/zziz;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzsh;->zzk()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 3
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzsh;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zzsk;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzsk;->zzl()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 5
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzsh;->zzf()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaff;->zzp()Z

    move-result v0

    if-nez v0, :cond_7

    .line 7
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzsh;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zzsk;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzsk;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzse;

    move-result-object v0

    .line 8
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzjd;->zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzse;)Lcom/google/android/gms/internal/firebase-auth-api/zzjb;

    move-result-object v3

    .line 9
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzjd;->zzc(Lcom/google/android/gms/internal/firebase-auth-api/zzse;)Lcom/google/android/gms/internal/firebase-auth-api/zziw;

    move-result-object v4

    .line 10
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzjd;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzse;)Lcom/google/android/gms/internal/firebase-auth-api/zzix;

    move-result-object v5

    .line 11
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzse;->zzf()I

    move-result v0

    add-int/lit8 v1, v0, -0x2

    const/4 v2, 0x4

    const/4 v6, 0x3

    const/4 v7, 0x2

    const/4 v8, 0x1

    if-eq v1, v8, :cond_3

    if-eq v1, v7, :cond_2

    if-eq v1, v6, :cond_1

    if-ne v1, v2, :cond_0

    const/16 v0, 0x85

    goto :goto_0

    .line 18
    :cond_0
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzry;->zza(I)Ljava/lang/String;

    move-result-object p0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Unable to determine KEM-encoding length for "

    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 19
    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    const/16 v0, 0x61

    goto :goto_0

    :cond_2
    const/16 v0, 0x41

    goto :goto_0

    :cond_3
    const/16 v0, 0x20

    .line 12
    :goto_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzsh;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zzsk;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzsk;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzse;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzse;->zzf()I

    move-result v1

    add-int/lit8 v1, v1, -0x2

    if-eq v1, v8, :cond_6

    if-eq v1, v7, :cond_5

    if-eq v1, v6, :cond_5

    if-ne v1, v2, :cond_4

    goto :goto_1

    .line 18
    :cond_4
    new-instance p0, Ljava/security/GeneralSecurityException;

    const-string v0, "Unrecognized HPKE KEM identifier"

    invoke-direct {p0, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 13
    :cond_5
    :goto_1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzsh;->zzf()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaff;->zzq()[B

    move-result-object v1

    .line 14
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzsh;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zzsk;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzsk;->zzg()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaff;->zzq()[B

    move-result-object v2

    .line 15
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzsh;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zzsk;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzsk;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzse;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzse;->zzf()I

    move-result p0

    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzjj;->zzg(I)I

    move-result p0

    .line 16
    invoke-static {v1, v2, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzjl;->zzc([B[BI)Lcom/google/android/gms/internal/firebase-auth-api/zzjl;

    move-result-object p0

    goto :goto_2

    .line 17
    :cond_6
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzsh;->zzf()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaff;->zzq()[B

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzjn;->zzc([B)Lcom/google/android/gms/internal/firebase-auth-api/zzjn;

    move-result-object p0

    :goto_2
    move-object v2, p0

    .line 16
    new-instance p0, Lcom/google/android/gms/internal/firebase-auth-api/zziz;

    move-object v1, p0

    move v6, v0

    invoke-direct/range {v1 .. v6}, Lcom/google/android/gms/internal/firebase-auth-api/zziz;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzjc;Lcom/google/android/gms/internal/firebase-auth-api/zzjb;Lcom/google/android/gms/internal/firebase-auth-api/zziw;Lcom/google/android/gms/internal/firebase-auth-api/zzix;I)V

    return-object p0

    .line 5
    :cond_7
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "HpkePrivateKey.private_key is empty."

    .line 6
    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 3
    :cond_8
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "HpkePrivateKey.public_key is missing params field."

    .line 4
    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 1
    :cond_9
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "HpkePrivateKey is missing public_key field."

    .line 2
    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public final zza([B[B)[B
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    array-length p2, p1

    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zziz;->zze:I

    if-lt p2, v0, :cond_0

    const/4 v1, 0x0

    new-array v7, v1, [B

    .line 3
    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v2

    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zziz;->zze:I

    .line 4
    invoke-static {p1, v0, p2}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object p1

    iget-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zziz;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzjc;

    iget-object v4, p0, Lcom/google/android/gms/internal/firebase-auth-api/zziz;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzjb;

    iget-object v5, p0, Lcom/google/android/gms/internal/firebase-auth-api/zziz;->zzf:Lcom/google/android/gms/internal/firebase-auth-api/zziw;

    iget-object v6, p0, Lcom/google/android/gms/internal/firebase-auth-api/zziz;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzix;

    .line 5
    invoke-interface {v4, v2, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzjb;->zza([BLcom/google/android/gms/internal/firebase-auth-api/zzjc;)[B

    move-result-object v3

    .line 6
    invoke-static/range {v2 .. v7}, Lcom/google/android/gms/internal/firebase-auth-api/zziy;->zzb([B[BLcom/google/android/gms/internal/firebase-auth-api/zzjb;Lcom/google/android/gms/internal/firebase-auth-api/zziw;Lcom/google/android/gms/internal/firebase-auth-api/zzix;[B)Lcom/google/android/gms/internal/firebase-auth-api/zziy;

    move-result-object p2

    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zziz;->zza:[B

    .line 7
    invoke-virtual {p2, p1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zziy;->zza([B[B)[B

    move-result-object p1

    return-object p1

    .line 2
    :cond_0
    new-instance p1, Ljava/security/GeneralSecurityException;

    const-string p2, "Ciphertext is too short."

    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
