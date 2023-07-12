.class public final synthetic Lcom/google/android/gms/internal/firebase-auth-api/zzek;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Lcom/google/android/gms/internal/firebase-auth-api/zzka;


# static fields
.field public static final synthetic zza:Lcom/google/android/gms/internal/firebase-auth-api/zzek;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzek;

    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzek;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzek;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzek;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final zza(Lcom/google/android/gms/internal/firebase-auth-api/zzlp;Lcom/google/android/gms/internal/firebase-auth-api/zzcr;)Lcom/google/android/gms/internal/firebase-auth-api/zzbl;
    .locals 6

    sget v0, Lcom/google/android/gms/internal/firebase-auth-api/zzel;->zza:I

    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzln;

    .line 1
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzln;->zzg()Ljava/lang/String;

    move-result-object v0

    const-string v1, "type.googleapis.com/google.crypto.tink.AesEaxKey"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

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
    invoke-static {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzpi;->zzd(Lcom/google/android/gms/internal/firebase-auth-api/zzaff;Lcom/google/android/gms/internal/firebase-auth-api/zzafx;)Lcom/google/android/gms/internal/firebase-auth-api/zzpi;

    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzpi;->zza()I

    move-result v1

    if-nez v1, :cond_4

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzed;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzed;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzec;)V

    .line 6
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzpi;->zzf()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzaff;->zzd()I

    move-result v3

    invoke-virtual {v1, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzed;->zzb(I)Lcom/google/android/gms/internal/firebase-auth-api/zzed;

    .line 7
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzpi;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zzpo;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzpo;->zza()I

    move-result v3

    invoke-virtual {v1, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzed;->zza(I)Lcom/google/android/gms/internal/firebase-auth-api/zzed;

    const/16 v3, 0x10

    .line 8
    invoke-virtual {v1, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzed;->zzc(I)Lcom/google/android/gms/internal/firebase-auth-api/zzed;

    move-object v3, p1

    check-cast v3, Lcom/google/android/gms/internal/firebase-auth-api/zzln;

    invoke-virtual {v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzln;->zzc()Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    move-result-object v3

    .line 9
    sget-object v4, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    invoke-virtual {v3}, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->ordinal()I

    move-result v4

    const/4 v5, 0x1

    if-eq v4, v5, :cond_3

    const/4 v5, 0x2

    if-eq v4, v5, :cond_2

    const/4 v5, 0x3

    if-eq v4, v5, :cond_1

    const/4 v5, 0x4

    if-ne v4, v5, :cond_0

    goto :goto_0

    .line 18
    :cond_0
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 19
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

    .line 17
    :cond_1
    sget-object v3, Lcom/google/android/gms/internal/firebase-auth-api/zzee;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzee;

    goto :goto_1

    .line 20
    :cond_2
    :goto_0
    sget-object v3, Lcom/google/android/gms/internal/firebase-auth-api/zzee;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzee;

    goto :goto_1

    .line 9
    :cond_3
    sget-object v3, Lcom/google/android/gms/internal/firebase-auth-api/zzee;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzee;

    .line 10
    :goto_1
    invoke-virtual {v1, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzed;->zzd(Lcom/google/android/gms/internal/firebase-auth-api/zzee;)Lcom/google/android/gms/internal/firebase-auth-api/zzed;

    .line 11
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzed;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zzeg;

    move-result-object v1

    new-instance v3, Lcom/google/android/gms/internal/firebase-auth-api/zzdw;

    invoke-direct {v3, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzdw;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzdv;)V

    .line 12
    invoke-virtual {v3, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzdw;->zzc(Lcom/google/android/gms/internal/firebase-auth-api/zzeg;)Lcom/google/android/gms/internal/firebase-auth-api/zzdw;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzpi;->zzf()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaff;->zzq()[B

    move-result-object v0

    .line 14
    invoke-static {v0, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzvy;->zzb([BLcom/google/android/gms/internal/firebase-auth-api/zzcr;)Lcom/google/android/gms/internal/firebase-auth-api/zzvy;

    move-result-object p2

    .line 15
    invoke-virtual {v3, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzdw;->zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzvy;)Lcom/google/android/gms/internal/firebase-auth-api/zzdw;

    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzln;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzln;->zzf()Ljava/lang/Integer;

    move-result-object p1

    .line 16
    invoke-virtual {v3, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzdw;->zza(Ljava/lang/Integer;)Lcom/google/android/gms/internal/firebase-auth-api/zzdw;

    .line 17
    invoke-virtual {v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzdw;->zzd()Lcom/google/android/gms/internal/firebase-auth-api/zzdy;

    move-result-object p1

    return-object p1

    .line 20
    :cond_4
    new-instance p1, Ljava/security/GeneralSecurityException;

    const-string p2, "Only version 0 keys are accepted"

    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Lcom/google/android/gms/internal/firebase-auth-api/zzags; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    :catch_0
    new-instance p1, Ljava/security/GeneralSecurityException;

    const-string p2, "Parsing AesEaxcKey failed"

    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1
    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Wrong type URL in call to AesEaxParameters.parseParameters"

    .line 2
    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
