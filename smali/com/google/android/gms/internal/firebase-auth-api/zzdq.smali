.class public final synthetic Lcom/google/android/gms/internal/firebase-auth-api/zzdq;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Lcom/google/android/gms/internal/firebase-auth-api/zzka;


# static fields
.field public static final synthetic zza:Lcom/google/android/gms/internal/firebase-auth-api/zzdq;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzdq;

    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzdq;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzdq;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzdq;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final zza(Lcom/google/android/gms/internal/firebase-auth-api/zzlp;Lcom/google/android/gms/internal/firebase-auth-api/zzcr;)Lcom/google/android/gms/internal/firebase-auth-api/zzbl;
    .locals 10

    sget v0, Lcom/google/android/gms/internal/firebase-auth-api/zzdr;->zza:I

    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzln;

    .line 1
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzln;->zzg()Ljava/lang/String;

    move-result-object v0

    const-string v1, "type.googleapis.com/google.crypto.tink.AesCtrHmacAeadKey"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 2
    :try_start_0
    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzln;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzln;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object v0

    .line 3
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzafx;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzafx;

    move-result-object v1

    .line 4
    invoke-static {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzot;->zzd(Lcom/google/android/gms/internal/firebase-auth-api/zzaff;Lcom/google/android/gms/internal/firebase-auth-api/zzafx;)Lcom/google/android/gms/internal/firebase-auth-api/zzot;

    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzot;->zza()I

    move-result v1

    if-nez v1, :cond_9

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzdi;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzdi;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzdh;)V

    .line 6
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzot;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zzoz;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzoz;->zzg()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzaff;->zzd()I

    move-result v3

    invoke-virtual {v1, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzdi;->zza(I)Lcom/google/android/gms/internal/firebase-auth-api/zzdi;

    .line 7
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzot;->zzf()Lcom/google/android/gms/internal/firebase-auth-api/zzrq;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzrq;->zzg()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzaff;->zzd()I

    move-result v3

    invoke-virtual {v1, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzdi;->zzc(I)Lcom/google/android/gms/internal/firebase-auth-api/zzdi;

    .line 8
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzot;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zzoz;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzoz;->zzf()Lcom/google/android/gms/internal/firebase-auth-api/zzpf;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzpf;->zza()I

    move-result v3

    invoke-virtual {v1, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzdi;->zzd(I)Lcom/google/android/gms/internal/firebase-auth-api/zzdi;

    .line 9
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzot;->zzf()Lcom/google/android/gms/internal/firebase-auth-api/zzrq;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzrq;->zzf()Lcom/google/android/gms/internal/firebase-auth-api/zzrw;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzrw;->zza()I

    move-result v3

    invoke-virtual {v1, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzdi;->zze(I)Lcom/google/android/gms/internal/firebase-auth-api/zzdi;

    .line 10
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzot;->zzf()Lcom/google/android/gms/internal/firebase-auth-api/zzrq;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzrq;->zzf()Lcom/google/android/gms/internal/firebase-auth-api/zzrw;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzrw;->zzf()I

    move-result v3

    .line 11
    sget-object v4, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    add-int/lit8 v4, v3, -0x2

    const/4 v5, 0x4

    const/4 v6, 0x3

    const/4 v7, 0x2

    const/4 v8, 0x1

    if-eq v4, v8, :cond_4

    if-eq v4, v7, :cond_3

    if-eq v4, v6, :cond_2

    if-eq v4, v5, :cond_1

    const/4 v9, 0x5

    if-ne v4, v9, :cond_0

    .line 26
    sget-object v3, Lcom/google/android/gms/internal/firebase-auth-api/zzdj;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzdj;

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/security/GeneralSecurityException;

    invoke-static {v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzrn;->zza(I)I

    move-result p2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unable to parse HashType: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 23
    :cond_1
    sget-object v3, Lcom/google/android/gms/internal/firebase-auth-api/zzdj;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzdj;

    goto :goto_0

    :cond_2
    sget-object v3, Lcom/google/android/gms/internal/firebase-auth-api/zzdj;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzdj;

    goto :goto_0

    :cond_3
    sget-object v3, Lcom/google/android/gms/internal/firebase-auth-api/zzdj;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzdj;

    goto :goto_0

    .line 11
    :cond_4
    sget-object v3, Lcom/google/android/gms/internal/firebase-auth-api/zzdj;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzdj;

    .line 10
    :goto_0
    invoke-virtual {v1, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzdi;->zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzdj;)Lcom/google/android/gms/internal/firebase-auth-api/zzdi;

    move-object v3, p1

    check-cast v3, Lcom/google/android/gms/internal/firebase-auth-api/zzln;

    invoke-virtual {v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzln;->zzc()Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    move-result-object v3

    .line 12
    invoke-virtual {v3}, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->ordinal()I

    move-result v4

    if-eq v4, v8, :cond_8

    if-eq v4, v7, :cond_7

    if-eq v4, v6, :cond_6

    if-ne v4, v5, :cond_5

    goto :goto_1

    .line 24
    :cond_5
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 25
    invoke-virtual {v3}, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zza()I

    move-result p2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unable to parse OutputPrefixType: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 23
    :cond_6
    sget-object v3, Lcom/google/android/gms/internal/firebase-auth-api/zzdk;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzdk;

    goto :goto_2

    :cond_7
    :goto_1
    sget-object v3, Lcom/google/android/gms/internal/firebase-auth-api/zzdk;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzdk;

    goto :goto_2

    .line 12
    :cond_8
    sget-object v3, Lcom/google/android/gms/internal/firebase-auth-api/zzdk;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzdk;

    .line 13
    :goto_2
    invoke-virtual {v1, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzdi;->zzf(Lcom/google/android/gms/internal/firebase-auth-api/zzdk;)Lcom/google/android/gms/internal/firebase-auth-api/zzdi;

    .line 14
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzdi;->zzg()Lcom/google/android/gms/internal/firebase-auth-api/zzdm;

    move-result-object v1

    new-instance v3, Lcom/google/android/gms/internal/firebase-auth-api/zzdb;

    invoke-direct {v3, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzdb;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzda;)V

    .line 15
    invoke-virtual {v3, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzdb;->zzd(Lcom/google/android/gms/internal/firebase-auth-api/zzdm;)Lcom/google/android/gms/internal/firebase-auth-api/zzdb;

    .line 16
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzot;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zzoz;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzoz;->zzg()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaff;->zzq()[B

    move-result-object v1

    .line 17
    invoke-static {v1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzvy;->zzb([BLcom/google/android/gms/internal/firebase-auth-api/zzcr;)Lcom/google/android/gms/internal/firebase-auth-api/zzvy;

    move-result-object v1

    .line 18
    invoke-virtual {v3, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzdb;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzvy;)Lcom/google/android/gms/internal/firebase-auth-api/zzdb;

    .line 19
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzot;->zzf()Lcom/google/android/gms/internal/firebase-auth-api/zzrq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzrq;->zzg()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaff;->zzq()[B

    move-result-object v0

    .line 20
    invoke-static {v0, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzvy;->zzb([BLcom/google/android/gms/internal/firebase-auth-api/zzcr;)Lcom/google/android/gms/internal/firebase-auth-api/zzvy;

    move-result-object p2

    .line 21
    invoke-virtual {v3, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzdb;->zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzvy;)Lcom/google/android/gms/internal/firebase-auth-api/zzdb;

    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzln;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzln;->zzf()Ljava/lang/Integer;

    move-result-object p1

    .line 22
    invoke-virtual {v3, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzdb;->zzc(Ljava/lang/Integer;)Lcom/google/android/gms/internal/firebase-auth-api/zzdb;

    .line 23
    invoke-virtual {v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzdb;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zzdd;

    move-result-object p1

    return-object p1

    .line 27
    :cond_9
    new-instance p1, Ljava/security/GeneralSecurityException;

    const-string p2, "Only version 0 keys are accepted"

    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Lcom/google/android/gms/internal/firebase-auth-api/zzags; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    :catch_0
    new-instance p1, Ljava/security/GeneralSecurityException;

    const-string p2, "Parsing AesCtrHmacAeadKey failed"

    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1
    :cond_a
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Wrong type URL in call to AesCtrHmacAeadProtoSerialization.parseKey"

    .line 2
    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
