.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzij;
.super Lcom/google/android/gms/internal/firebase-auth-api/zzlm;
.source "com.google.firebase:firebase-auth@@22.0.0"


# static fields
.field private static final zza:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzij;->zza:[B

    return-void
.end method

.method constructor <init>()V
    .locals 3

    const/4 v0, 0x1

    new-array v0, v0, [Lcom/google/android/gms/internal/firebase-auth-api/zzlg;

    .line 1
    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzih;

    const-class v2, Lcom/google/android/gms/internal/firebase-auth-api/zzbj;

    invoke-direct {v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzih;-><init>(Ljava/lang/Class;)V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-class v1, Lcom/google/android/gms/internal/firebase-auth-api/zzra;

    const-class v2, Lcom/google/android/gms/internal/firebase-auth-api/zzrd;

    invoke-direct {p0, v1, v2, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzlm;-><init>(Ljava/lang/Class;Ljava/lang/Class;[Lcom/google/android/gms/internal/firebase-auth-api/zzlg;)V

    return-void
.end method

.method static bridge synthetic zzh()[B
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzij;->zza:[B

    return-object v0
.end method

.method static bridge synthetic zzi(IIILcom/google/android/gms/internal/firebase-auth-api/zzbu;[BI)Lcom/google/android/gms/internal/firebase-auth-api/zzkh;
    .locals 4

    .line 1
    new-instance p0, Lcom/google/android/gms/internal/firebase-auth-api/zzkh;

    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzqu;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzqt;

    move-result-object p1

    .line 2
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzrg;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzrf;

    move-result-object v0

    const/4 v1, 0x4

    .line 3
    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzrf;->zzb(I)Lcom/google/android/gms/internal/firebase-auth-api/zzrf;

    const/4 v1, 0x5

    .line 4
    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzrf;->zzc(I)Lcom/google/android/gms/internal/firebase-auth-api/zzrf;

    const/4 v1, 0x0

    .line 5
    invoke-static {p4, v1, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaff;->zzn([BII)Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object p4

    .line 6
    invoke-virtual {v0, p4}, Lcom/google/android/gms/internal/firebase-auth-api/zzrf;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzaff;)Lcom/google/android/gms/internal/firebase-auth-api/zzrf;

    .line 7
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object p4

    check-cast p4, Lcom/google/android/gms/internal/firebase-auth-api/zzrg;

    .line 8
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzsu;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzst;

    move-result-object v0

    .line 9
    invoke-virtual {p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzbu;->zzb()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzst;->zzb(Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzst;

    .line 10
    invoke-virtual {p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzbu;->zzc()[B

    move-result-object v2

    .line 11
    array-length v3, v2

    invoke-static {v2, v1, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzaff;->zzn([BII)Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzst;->zzc(Lcom/google/android/gms/internal/firebase-auth-api/zzaff;)Lcom/google/android/gms/internal/firebase-auth-api/zzst;

    .line 12
    invoke-virtual {p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzbu;->zzd()I

    move-result p3

    add-int/lit8 p3, p3, -0x1

    if-eqz p3, :cond_2

    const/4 v1, 0x1

    if-eq p3, v1, :cond_1

    const/4 v1, 0x2

    if-eq p3, v1, :cond_0

    .line 13
    sget-object p3, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    goto :goto_0

    .line 14
    :cond_0
    sget-object p3, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    goto :goto_0

    .line 15
    :cond_1
    sget-object p3, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    goto :goto_0

    .line 16
    :cond_2
    sget-object p3, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    .line 12
    :goto_0
    invoke-virtual {v0, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzst;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zztv;)Lcom/google/android/gms/internal/firebase-auth-api/zzst;

    .line 17
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object p3

    check-cast p3, Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

    .line 18
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzqr;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzqq;

    move-result-object v0

    invoke-virtual {v0, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzqq;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzsu;)Lcom/google/android/gms/internal/firebase-auth-api/zzqq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object p3

    check-cast p3, Lcom/google/android/gms/internal/firebase-auth-api/zzqr;

    .line 19
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzqx;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzqw;

    move-result-object v0

    .line 20
    invoke-virtual {v0, p4}, Lcom/google/android/gms/internal/firebase-auth-api/zzqw;->zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzrg;)Lcom/google/android/gms/internal/firebase-auth-api/zzqw;

    .line 21
    invoke-virtual {v0, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzqw;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzqr;)Lcom/google/android/gms/internal/firebase-auth-api/zzqw;

    .line 22
    invoke-virtual {v0, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzqw;->zzc(I)Lcom/google/android/gms/internal/firebase-auth-api/zzqw;

    .line 23
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object p2

    check-cast p2, Lcom/google/android/gms/internal/firebase-auth-api/zzqx;

    .line 24
    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzqt;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzqx;)Lcom/google/android/gms/internal/firebase-auth-api/zzqt;

    .line 25
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzqu;

    invoke-direct {p0, p1, p5}, Lcom/google/android/gms/internal/firebase-auth-api/zzkh;-><init>(Ljava/lang/Object;I)V

    return-object p0
.end method


# virtual methods
.method public final zza()Lcom/google/android/gms/internal/firebase-auth-api/zzki;
    .locals 2

    const-class v0, Lcom/google/android/gms/internal/firebase-auth-api/zzqu;

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzii;

    invoke-direct {v1, p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzii;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzij;Ljava/lang/Class;)V

    return-object v1
.end method

.method public final zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzso;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzso;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzso;

    return-object v0
.end method

.method public final synthetic zzc(Lcom/google/android/gms/internal/firebase-auth-api/zzaff;)Lcom/google/android/gms/internal/firebase-auth-api/zzahp;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/firebase-auth-api/zzags;
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzafx;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzafx;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzra;->zzd(Lcom/google/android/gms/internal/firebase-auth-api/zzaff;Lcom/google/android/gms/internal/firebase-auth-api/zzafx;)Lcom/google/android/gms/internal/firebase-auth-api/zzra;

    move-result-object p1

    return-object p1
.end method

.method public final zzd()Ljava/lang/String;
    .locals 1

    const-string v0, "type.googleapis.com/google.crypto.tink.EciesAeadHkdfPrivateKey"

    return-object v0
.end method

.method public final bridge synthetic zze(Lcom/google/android/gms/internal/firebase-auth-api/zzahp;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzra;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzra;->zzf()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaff;->zzp()Z

    move-result v0

    if-nez v0, :cond_0

    .line 4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzra;->zza()I

    move-result v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzvu;->zzc(II)V

    .line 5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzra;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zzrd;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzrd;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzqx;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzis;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzqx;)V

    return-void

    .line 3
    :cond_0
    new-instance p1, Ljava/security/GeneralSecurityException;

    const-string v0, "invalid ECIES private key"

    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final synthetic zzg(Lcom/google/android/gms/internal/firebase-auth-api/zzahp;)Lcom/google/android/gms/internal/firebase-auth-api/zzahp;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzra;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzra;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zzrd;

    move-result-object p1

    return-object p1
.end method
