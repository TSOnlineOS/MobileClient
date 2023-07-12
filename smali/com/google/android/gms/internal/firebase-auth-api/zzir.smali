.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzir;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"


# static fields
.field public static final zza:Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

.field public static final zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

.field public static final zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

.field private static final zzd:[B


# direct methods
.method static constructor <clinit>()V
    .locals 7

    const/4 v0, 0x0

    new-array v0, v0, [B

    .line 1
    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzir;->zzd:[B

    sget-object v4, Lcom/google/android/gms/internal/firebase-auth-api/zzcv;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

    sget-object v5, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    sget-object v6, Lcom/google/android/gms/internal/firebase-auth-api/zzir;->zzd:[B

    const/4 v1, 0x4

    const/4 v2, 0x5

    const/4 v3, 0x3

    .line 2
    invoke-static/range {v1 .. v6}, Lcom/google/android/gms/internal/firebase-auth-api/zzir;->zza(IIILcom/google/android/gms/internal/firebase-auth-api/zzsu;Lcom/google/android/gms/internal/firebase-auth-api/zztv;[B)Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzir;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

    sget-object v4, Lcom/google/android/gms/internal/firebase-auth-api/zzcv;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

    sget-object v5, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    sget-object v6, Lcom/google/android/gms/internal/firebase-auth-api/zzir;->zzd:[B

    const/4 v3, 0x4

    .line 3
    invoke-static/range {v1 .. v6}, Lcom/google/android/gms/internal/firebase-auth-api/zzir;->zza(IIILcom/google/android/gms/internal/firebase-auth-api/zzsu;Lcom/google/android/gms/internal/firebase-auth-api/zztv;[B)Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzir;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

    sget-object v4, Lcom/google/android/gms/internal/firebase-auth-api/zzcv;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

    sget-object v5, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    sget-object v6, Lcom/google/android/gms/internal/firebase-auth-api/zzir;->zzd:[B

    const/4 v3, 0x3

    .line 4
    invoke-static/range {v1 .. v6}, Lcom/google/android/gms/internal/firebase-auth-api/zzir;->zza(IIILcom/google/android/gms/internal/firebase-auth-api/zzsu;Lcom/google/android/gms/internal/firebase-auth-api/zztv;[B)Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzir;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

    return-void
.end method

.method public static zza(IIILcom/google/android/gms/internal/firebase-auth-api/zzsu;Lcom/google/android/gms/internal/firebase-auth-api/zztv;[B)Lcom/google/android/gms/internal/firebase-auth-api/zzsu;
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzqu;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzqt;

    move-result-object p0

    .line 2
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzrg;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzrf;

    move-result-object p1

    const/4 v0, 0x4

    .line 3
    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzrf;->zzb(I)Lcom/google/android/gms/internal/firebase-auth-api/zzrf;

    const/4 v0, 0x5

    .line 4
    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzrf;->zzc(I)Lcom/google/android/gms/internal/firebase-auth-api/zzrf;

    const/4 v0, 0x0

    .line 5
    invoke-static {p5, v0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaff;->zzn([BII)Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object p5

    .line 6
    invoke-virtual {p1, p5}, Lcom/google/android/gms/internal/firebase-auth-api/zzrf;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzaff;)Lcom/google/android/gms/internal/firebase-auth-api/zzrf;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzrg;

    .line 8
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzqr;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzqq;

    move-result-object p5

    .line 9
    invoke-virtual {p5, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzqq;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzsu;)Lcom/google/android/gms/internal/firebase-auth-api/zzqq;

    .line 10
    invoke-virtual {p5}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object p3

    check-cast p3, Lcom/google/android/gms/internal/firebase-auth-api/zzqr;

    .line 11
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzqx;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzqw;

    move-result-object p5

    .line 12
    invoke-virtual {p5, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzqw;->zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzrg;)Lcom/google/android/gms/internal/firebase-auth-api/zzqw;

    .line 13
    invoke-virtual {p5, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzqw;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzqr;)Lcom/google/android/gms/internal/firebase-auth-api/zzqw;

    .line 14
    invoke-virtual {p5, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzqw;->zzc(I)Lcom/google/android/gms/internal/firebase-auth-api/zzqw;

    .line 15
    invoke-virtual {p5}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzqx;

    .line 16
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzqt;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzqx;)Lcom/google/android/gms/internal/firebase-auth-api/zzqt;

    .line 17
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/firebase-auth-api/zzqu;

    .line 18
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzsu;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzst;

    move-result-object p1

    new-instance p2, Lcom/google/android/gms/internal/firebase-auth-api/zzij;

    invoke-direct {p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzij;-><init>()V

    const-string p2, "type.googleapis.com/google.crypto.tink.EciesAeadHkdfPrivateKey"

    .line 19
    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzst;->zzb(Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzst;

    .line 20
    invoke-virtual {p1, p4}, Lcom/google/android/gms/internal/firebase-auth-api/zzst;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zztv;)Lcom/google/android/gms/internal/firebase-auth-api/zzst;

    .line 21
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaep;->zzo()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzst;->zzc(Lcom/google/android/gms/internal/firebase-auth-api/zzaff;)Lcom/google/android/gms/internal/firebase-auth-api/zzst;

    .line 22
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

    return-object p0
.end method
