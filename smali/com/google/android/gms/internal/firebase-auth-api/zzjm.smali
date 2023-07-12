.class final Lcom/google/android/gms/internal/firebase-auth-api/zzjm;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Lcom/google/android/gms/internal/firebase-auth-api/zzjb;


# instance fields
.field private final zza:Lcom/google/android/gms/internal/firebase-auth-api/zziw;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zziw;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzjm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zziw;

    return-void
.end method


# virtual methods
.method public final zza([BLcom/google/android/gms/internal/firebase-auth-api/zzjc;)[B
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    invoke-interface {p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzjc;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzvx;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzvx;->zzc()[B

    move-result-object v0

    .line 2
    invoke-static {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzvv;->zza([B[B)[B

    move-result-object v3

    invoke-interface {p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzjc;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzvx;

    move-result-object p2

    .line 3
    invoke-virtual {p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzvx;->zzc()[B

    move-result-object p2

    const/4 v0, 0x2

    new-array v0, v0, [[B

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const/4 p1, 0x1

    aput-object p2, v0, p1

    .line 4
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzum;->zzb([[B)[B

    move-result-object v5

    .line 5
    sget-object p1, Lcom/google/android/gms/internal/firebase-auth-api/zzjj;->zzb:[B

    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzjj;->zzd([B)[B

    move-result-object v7

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzjm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zziw;

    .line 6
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zziw;->zza()I

    move-result v8

    const/4 v2, 0x0

    const-string v4, "eae_prk"

    const-string v6, "shared_secret"

    .line 7
    invoke-virtual/range {v1 .. v8}, Lcom/google/android/gms/internal/firebase-auth-api/zziw;->zzb([B[BLjava/lang/String;[BLjava/lang/String;[BI)[B

    move-result-object p1

    return-object p1
.end method

.method public final zzb()[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzjm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zziw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zziw;->zzc()[B

    move-result-object v0

    sget-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zzjj;->zzf:[B

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzjj;->zzb:[B

    return-object v0

    :cond_0
    new-instance v0, Ljava/security/GeneralSecurityException;

    const-string v1, "Could not determine HPKE KEM ID"

    invoke-direct {v0, v1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
