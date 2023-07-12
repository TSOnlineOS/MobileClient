.class final Lcom/google/android/gms/internal/firebase-auth-api/zzib;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"


# static fields
.field public static final synthetic zza:I

.field private static final zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzvx;

.field private static final zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzlb;

.field private static final zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzkx;

.field private static final zze:Lcom/google/android/gms/internal/firebase-auth-api/zzkg;

.field private static final zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzkc;

.field private static final zzg:Ljava/util/Map;

.field private static final zzh:Ljava/util/Map;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const-string v0, "type.googleapis.com/google.crypto.tink.AesSivKey"

    .line 1
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzly;->zzb(Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzvx;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzib;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzvx;

    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzhx;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzhx;

    const-class v1, Lcom/google/android/gms/internal/firebase-auth-api/zzhw;

    const-class v2, Lcom/google/android/gms/internal/firebase-auth-api/zzlo;

    invoke-static {v0, v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzlb;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzkz;Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/android/gms/internal/firebase-auth-api/zzlb;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzib;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzlb;

    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzhy;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzhy;

    sget-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zzib;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzvx;

    const-class v2, Lcom/google/android/gms/internal/firebase-auth-api/zzlo;

    invoke-static {v0, v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzkx;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzkv;Lcom/google/android/gms/internal/firebase-auth-api/zzvx;Ljava/lang/Class;)Lcom/google/android/gms/internal/firebase-auth-api/zzkx;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzib;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzkx;

    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzhz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzhz;

    const-class v2, Lcom/google/android/gms/internal/firebase-auth-api/zzho;

    const-class v3, Lcom/google/android/gms/internal/firebase-auth-api/zzln;

    invoke-static {v0, v2, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzkg;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzke;Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/android/gms/internal/firebase-auth-api/zzkg;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzib;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzkg;

    const-class v0, Lcom/google/android/gms/internal/firebase-auth-api/zzln;

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzia;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzia;

    invoke-static {v2, v1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzkc;->zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzka;Lcom/google/android/gms/internal/firebase-auth-api/zzvx;Ljava/lang/Class;)Lcom/google/android/gms/internal/firebase-auth-api/zzkc;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzib;->zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzkc;

    new-instance v0, Ljava/util/HashMap;

    .line 2
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sget-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zzhu;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzhu;

    .line 3
    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zzhu;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzhu;

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    .line 4
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zzhu;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzhu;

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    .line 5
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzib;->zzg:Ljava/util/Map;

    new-instance v0, Ljava/util/EnumMap;

    const-class v1, Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    .line 7
    invoke-direct {v0, v1}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    sget-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzhu;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzhu;

    .line 8
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzhu;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzhu;

    .line 9
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzhu;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzhu;

    .line 10
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzhu;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzhu;

    .line 11
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzib;->zzh:Ljava/util/Map;

    return-void
.end method

.method public static synthetic zza(Lcom/google/android/gms/internal/firebase-auth-api/zzln;Lcom/google/android/gms/internal/firebase-auth-api/zzcr;)Lcom/google/android/gms/internal/firebase-auth-api/zzho;
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzln;->zzg()Ljava/lang/String;

    move-result-object v0

    const-string v1, "type.googleapis.com/google.crypto.tink.AesSivKey"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzln;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object v0

    .line 3
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzafx;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzafx;

    move-result-object v1

    .line 4
    invoke-static {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzqd;->zzd(Lcom/google/android/gms/internal/firebase-auth-api/zzaff;Lcom/google/android/gms/internal/firebase-auth-api/zzafx;)Lcom/google/android/gms/internal/firebase-auth-api/zzqd;

    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzqd;->zza()I

    move-result v1

    if-nez v1, :cond_1

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzht;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzht;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzhs;)V

    .line 6
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzqd;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzaff;->zzd()I

    move-result v3

    invoke-virtual {v1, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzht;->zza(I)Lcom/google/android/gms/internal/firebase-auth-api/zzht;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzln;->zzc()Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    move-result-object v3

    sget-object v4, Lcom/google/android/gms/internal/firebase-auth-api/zzib;->zzh:Ljava/util/Map;

    .line 7
    invoke-interface {v4, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    sget-object v4, Lcom/google/android/gms/internal/firebase-auth-api/zzib;->zzh:Ljava/util/Map;

    .line 8
    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/internal/firebase-auth-api/zzhu;

    .line 9
    invoke-virtual {v1, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzht;->zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzhu;)Lcom/google/android/gms/internal/firebase-auth-api/zzht;

    .line 10
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzht;->zzc()Lcom/google/android/gms/internal/firebase-auth-api/zzhw;

    move-result-object v1

    new-instance v3, Lcom/google/android/gms/internal/firebase-auth-api/zzhm;

    invoke-direct {v3, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzhm;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzhl;)V

    .line 11
    invoke-virtual {v3, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzhm;->zzc(Lcom/google/android/gms/internal/firebase-auth-api/zzhw;)Lcom/google/android/gms/internal/firebase-auth-api/zzhm;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzqd;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaff;->zzq()[B

    move-result-object v0

    .line 13
    invoke-static {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzvy;->zzb([BLcom/google/android/gms/internal/firebase-auth-api/zzcr;)Lcom/google/android/gms/internal/firebase-auth-api/zzvy;

    move-result-object p1

    .line 14
    invoke-virtual {v3, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzhm;->zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzvy;)Lcom/google/android/gms/internal/firebase-auth-api/zzhm;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzln;->zzf()Ljava/lang/Integer;

    move-result-object p0

    .line 15
    invoke-virtual {v3, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzhm;->zza(Ljava/lang/Integer;)Lcom/google/android/gms/internal/firebase-auth-api/zzhm;

    .line 16
    invoke-virtual {v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzhm;->zzd()Lcom/google/android/gms/internal/firebase-auth-api/zzho;

    move-result-object p0

    return-object p0

    .line 17
    :cond_0
    new-instance p0, Ljava/security/GeneralSecurityException;

    .line 18
    invoke-virtual {v3}, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zza()I

    move-result p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unable to parse OutputPrefixType: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 19
    :cond_1
    new-instance p0, Ljava/security/GeneralSecurityException;

    const-string p1, "Only version 0 keys are accepted"

    invoke-direct {p0, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_0
    .catch Lcom/google/android/gms/internal/firebase-auth-api/zzags; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    :catch_0
    new-instance p0, Ljava/security/GeneralSecurityException;

    const-string p1, "Parsing AesSivKey failed"

    invoke-direct {p0, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 1
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Wrong type URL in call to AesSivParameters.parseParameters"

    .line 2
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzkt;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzib;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzlb;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzkt;->zzf(Lcom/google/android/gms/internal/firebase-auth-api/zzlb;)V

    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzib;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzkx;

    .line 2
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzkt;->zze(Lcom/google/android/gms/internal/firebase-auth-api/zzkx;)V

    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzib;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzkg;

    .line 3
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzkt;->zzd(Lcom/google/android/gms/internal/firebase-auth-api/zzkg;)V

    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzib;->zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzkc;

    .line 4
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzkt;->zzc(Lcom/google/android/gms/internal/firebase-auth-api/zzkc;)V

    return-void
.end method
