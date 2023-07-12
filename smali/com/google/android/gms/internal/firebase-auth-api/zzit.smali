.class final Lcom/google/android/gms/internal/firebase-auth-api/zzit;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Lcom/google/android/gms/internal/firebase-auth-api/zzuo;


# instance fields
.field private final zza:Ljava/lang/String;

.field private final zzb:I

.field private zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzpr;

.field private zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzot;

.field private zze:I

.field private zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzqd;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzsu;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzsu;->zzf()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzit;->zza:Ljava/lang/String;

    .line 2
    sget-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zzct;->zzb:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3
    :try_start_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzsu;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object v0

    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzafx;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzafx;

    move-result-object v1

    .line 4
    invoke-static {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzpu;->zzd(Lcom/google/android/gms/internal/firebase-auth-api/zzaff;Lcom/google/android/gms/internal/firebase-auth-api/zzafx;)Lcom/google/android/gms/internal/firebase-auth-api/zzpu;

    move-result-object v0

    .line 5
    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzcq;->zzc(Lcom/google/android/gms/internal/firebase-auth-api/zzsu;)Lcom/google/android/gms/internal/firebase-auth-api/zzahp;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzpr;

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzit;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzpr;

    .line 6
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzpu;->zza()I

    move-result p1

    iput p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzit;->zzb:I
    :try_end_0
    .catch Lcom/google/android/gms/internal/firebase-auth-api/zzags; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 7
    new-instance v0, Ljava/security/GeneralSecurityException;

    const-string v1, "invalid KeyFormat protobuf, expected AesGcmKeyFormat"

    invoke-direct {v0, v1, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzit;->zza:Ljava/lang/String;

    sget-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zzct;->zza:Ljava/lang/String;

    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v1, "invalid KeyFormat protobuf, expected AesCtrHmacAeadKeyFormat"

    if-eqz v0, :cond_1

    .line 9
    :try_start_1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzsu;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object v0

    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzafx;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzafx;

    move-result-object v2

    .line 10
    invoke-static {v0, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzow;->zzc(Lcom/google/android/gms/internal/firebase-auth-api/zzaff;Lcom/google/android/gms/internal/firebase-auth-api/zzafx;)Lcom/google/android/gms/internal/firebase-auth-api/zzow;

    move-result-object v0

    .line 11
    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzcq;->zzc(Lcom/google/android/gms/internal/firebase-auth-api/zzsu;)Lcom/google/android/gms/internal/firebase-auth-api/zzahp;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzot;

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzit;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzot;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzow;->zzd()Lcom/google/android/gms/internal/firebase-auth-api/zzpc;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzpc;->zza()I

    move-result p1

    iput p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzit;->zze:I

    .line 13
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzow;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zzrt;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzrt;->zza()I

    move-result p1

    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzit;->zze:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzit;->zzb:I
    :try_end_1
    .catch Lcom/google/android/gms/internal/firebase-auth-api/zzags; {:try_start_1 .. :try_end_1} :catch_1

    return-void

    :catch_1
    move-exception p1

    .line 14
    new-instance v0, Ljava/security/GeneralSecurityException;

    invoke-direct {v0, v1, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    .line 13
    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzit;->zza:Ljava/lang/String;

    .line 15
    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzic;->zza:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 16
    :try_start_2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzsu;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object v0

    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzafx;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzafx;

    move-result-object v2

    .line 17
    invoke-static {v0, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzqg;->zzd(Lcom/google/android/gms/internal/firebase-auth-api/zzaff;Lcom/google/android/gms/internal/firebase-auth-api/zzafx;)Lcom/google/android/gms/internal/firebase-auth-api/zzqg;

    move-result-object v0

    .line 18
    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzcq;->zzc(Lcom/google/android/gms/internal/firebase-auth-api/zzsu;)Lcom/google/android/gms/internal/firebase-auth-api/zzahp;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzqd;

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzit;->zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzqd;

    .line 19
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzqg;->zza()I

    move-result p1

    iput p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzit;->zzb:I
    :try_end_2
    .catch Lcom/google/android/gms/internal/firebase-auth-api/zzags; {:try_start_2 .. :try_end_2} :catch_2

    return-void

    :catch_2
    move-exception p1

    .line 20
    new-instance v0, Ljava/security/GeneralSecurityException;

    invoke-direct {v0, v1, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    .line 21
    :cond_2
    new-instance p1, Ljava/security/GeneralSecurityException;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzit;->zza:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "unsupported AEAD DEM key type: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public final zza()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzit;->zzb:I

    return v0
.end method

.method public final zzb([B)Lcom/google/android/gms/internal/firebase-auth-api/zzjo;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    array-length v0, p1

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzit;->zzb:I

    if-ne v0, v1, :cond_3

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzit;->zza:Ljava/lang/String;

    .line 2
    sget-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zzct;->zzb:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 3
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzpr;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzpq;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzit;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzpr;

    .line 4
    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzh(Lcom/google/android/gms/internal/firebase-auth-api/zzagk;)Lcom/google/android/gms/internal/firebase-auth-api/zzagg;

    iget v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzit;->zzb:I

    .line 5
    invoke-static {p1, v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaff;->zzn([BII)Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzpq;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzaff;)Lcom/google/android/gms/internal/firebase-auth-api/zzpq;

    .line 6
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzpr;

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzjo;

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzit;->zza:Ljava/lang/String;

    const-class v2, Lcom/google/android/gms/internal/firebase-auth-api/zzbd;

    .line 7
    invoke-static {v1, p1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzcq;->zzf(Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzahp;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzbd;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzjo;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzbd;)V

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzit;->zza:Ljava/lang/String;

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzct;->zza:Ljava/lang/String;

    .line 8
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzit;->zze:I

    .line 9
    invoke-static {p1, v1, v0}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v0

    iget v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzit;->zze:I

    iget v3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzit;->zzb:I

    .line 10
    invoke-static {p1, v2, v3}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object p1

    .line 11
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzoz;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzoy;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzit;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzot;

    .line 12
    invoke-virtual {v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzot;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zzoz;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzh(Lcom/google/android/gms/internal/firebase-auth-api/zzagk;)Lcom/google/android/gms/internal/firebase-auth-api/zzagg;

    .line 13
    sget-object v3, Lcom/google/android/gms/internal/firebase-auth-api/zzaff;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    .line 14
    array-length v3, v0

    invoke-static {v0, v1, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzaff;->zzn([BII)Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object v0

    .line 13
    invoke-virtual {v2, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzoy;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzaff;)Lcom/google/android/gms/internal/firebase-auth-api/zzoy;

    .line 15
    invoke-virtual {v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzoz;

    .line 16
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzrq;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzrp;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzit;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzot;

    .line 17
    invoke-virtual {v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzot;->zzf()Lcom/google/android/gms/internal/firebase-auth-api/zzrq;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzh(Lcom/google/android/gms/internal/firebase-auth-api/zzagk;)Lcom/google/android/gms/internal/firebase-auth-api/zzagg;

    .line 18
    array-length v3, p1

    invoke-static {p1, v1, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzaff;->zzn([BII)Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object p1

    .line 19
    invoke-virtual {v2, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzrp;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzaff;)Lcom/google/android/gms/internal/firebase-auth-api/zzrp;

    .line 20
    invoke-virtual {v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzrq;

    .line 21
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzot;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzos;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzit;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzot;

    .line 22
    invoke-virtual {v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzot;->zza()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzos;->zzc(I)Lcom/google/android/gms/internal/firebase-auth-api/zzos;

    .line 23
    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzos;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzoz;)Lcom/google/android/gms/internal/firebase-auth-api/zzos;

    .line 24
    invoke-virtual {v1, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzos;->zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzrq;)Lcom/google/android/gms/internal/firebase-auth-api/zzos;

    .line 25
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzot;

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzjo;

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzit;->zza:Ljava/lang/String;

    const-class v2, Lcom/google/android/gms/internal/firebase-auth-api/zzbd;

    .line 26
    invoke-static {v1, p1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzcq;->zzf(Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzahp;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzbd;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzjo;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzbd;)V

    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzit;->zza:Ljava/lang/String;

    .line 27
    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzic;->zza:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 28
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzqd;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzqc;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzit;->zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzqd;

    .line 29
    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzh(Lcom/google/android/gms/internal/firebase-auth-api/zzagk;)Lcom/google/android/gms/internal/firebase-auth-api/zzagg;

    iget v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzit;->zzb:I

    .line 30
    invoke-static {p1, v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaff;->zzn([BII)Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzqc;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzaff;)Lcom/google/android/gms/internal/firebase-auth-api/zzqc;

    .line 31
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzqd;

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzjo;

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzit;->zza:Ljava/lang/String;

    const-class v2, Lcom/google/android/gms/internal/firebase-auth-api/zzbi;

    .line 32
    invoke-static {v1, p1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzcq;->zzf(Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzahp;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzbi;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzjo;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzbi;)V

    return-object v0

    .line 33
    :cond_2
    new-instance p1, Ljava/security/GeneralSecurityException;

    const-string v0, "unknown DEM key type"

    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1
    :cond_3
    new-instance p1, Ljava/security/GeneralSecurityException;

    const-string v0, "Symmetric key has incorrect length"

    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
