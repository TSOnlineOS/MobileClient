.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzby;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"


# instance fields
.field private final zza:Lcom/google/android/gms/internal/firebase-auth-api/zztc;

.field private final zzb:Ljava/util/List;

.field private final zzc:Lcom/google/android/gms/internal/firebase-auth-api/zznz;


# direct methods
.method private constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zztc;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzby;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zztc;

    iput-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzby;->zzb:Ljava/util/List;

    sget-object p1, Lcom/google/android/gms/internal/firebase-auth-api/zznz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zznz;

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzby;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zznz;

    return-void
.end method

.method static final zza(Lcom/google/android/gms/internal/firebase-auth-api/zztc;)Lcom/google/android/gms/internal/firebase-auth-api/zzby;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzby;->zzl(Lcom/google/android/gms/internal/firebase-auth-api/zztc;)V

    .line 2
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzby;->zzk(Lcom/google/android/gms/internal/firebase-auth-api/zztc;)Ljava/util/List;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzby;

    .line 3
    invoke-direct {v1, p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzby;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zztc;Ljava/util/List;)V

    return-object v1
.end method

.method public static final zzh(Lcom/google/android/gms/internal/firebase-auth-api/zzbe;Lcom/google/android/gms/internal/firebase-auth-api/zzbd;)Lcom/google/android/gms/internal/firebase-auth-api/zzby;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;,
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    new-array v0, v0, [B

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzbe;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzrl;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzrl;->zzd()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object v1

    .line 2
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaff;->zzd()I

    move-result v1

    if-eqz v1, :cond_0

    .line 3
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzrl;->zzd()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object p0

    .line 4
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaff;->zzq()[B

    move-result-object p0

    invoke-interface {p1, p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzbd;->zza([B[B)[B

    move-result-object p0

    .line 5
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzafx;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzafx;

    move-result-object p1

    .line 6
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zztc;->zzg([BLcom/google/android/gms/internal/firebase-auth-api/zzafx;)Lcom/google/android/gms/internal/firebase-auth-api/zztc;

    move-result-object p0

    .line 7
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzby;->zzl(Lcom/google/android/gms/internal/firebase-auth-api/zztc;)V
    :try_end_0
    .catch Lcom/google/android/gms/internal/firebase-auth-api/zzags; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzby;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zztc;)Lcom/google/android/gms/internal/firebase-auth-api/zzby;

    move-result-object p0

    return-object p0

    .line 8
    :catch_0
    new-instance p0, Ljava/security/GeneralSecurityException;

    const-string p1, "invalid keyset, corrupted key material"

    invoke-direct {p0, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 3
    :cond_0
    new-instance p0, Ljava/security/GeneralSecurityException;

    const-string p1, "empty keyset"

    invoke-direct {p0, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static zzi(Lcom/google/android/gms/internal/firebase-auth-api/zztb;)Lcom/google/android/gms/internal/firebase-auth-api/zzln;
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zza()I

    move-result v0

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    move-result-object v1

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    if-ne v1, v2, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 3
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzsp;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzsp;->zzf()Ljava/lang/String;

    move-result-object v1

    .line 4
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzsp;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzsp;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object v2

    .line 5
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzsp;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzsp;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzso;

    move-result-object v3

    .line 6
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    move-result-object p0

    .line 7
    invoke-static {v1, v2, v3, p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzln;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaff;Lcom/google/android/gms/internal/firebase-auth-api/zzso;Lcom/google/android/gms/internal/firebase-auth-api/zztv;Ljava/lang/Integer;)Lcom/google/android/gms/internal/firebase-auth-api/zzln;

    move-result-object p0
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzlx;

    const-string v1, "Creating a protokey serialization failed"

    .line 8
    invoke-direct {v0, v1, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzlx;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method private static zzj(Lcom/google/android/gms/internal/firebase-auth-api/zztb;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 1
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzsp;

    move-result-object p0

    sget v0, Lcom/google/android/gms/internal/firebase-auth-api/zzcq;->zza:I

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzsp;->zzf()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzsp;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object p0

    invoke-static {v0, p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzcq;->zze(Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaff;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 3
    invoke-virtual {p0}, Ljava/security/GeneralSecurityException;->getMessage()Ljava/lang/String;

    move-result-object p1

    const-string v0, "No key manager found for key type "

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 4
    invoke-virtual {p0}, Ljava/security/GeneralSecurityException;->getMessage()Ljava/lang/String;

    move-result-object p1

    const-string v0, " not supported by key manager of type "

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    .line 5
    :cond_0
    throw p0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private static zzk(Lcom/google/android/gms/internal/firebase-auth-api/zztc;)Ljava/util/List;
    .locals 10

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zztc;->zza()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zztc;->zzh()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/firebase-auth-api/zztb;

    .line 3
    invoke-virtual {v2}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zza()I

    move-result v6

    .line 4
    invoke-static {v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzby;->zzi(Lcom/google/android/gms/internal/firebase-auth-api/zztb;)Lcom/google/android/gms/internal/firebase-auth-api/zzln;

    move-result-object v3

    .line 5
    :try_start_0
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzkt;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzkt;

    move-result-object v4

    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzcr;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzcr;

    move-result-object v5

    .line 6
    invoke-virtual {v4, v3, v5}, Lcom/google/android/gms/internal/firebase-auth-api/zzkt;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzln;Lcom/google/android/gms/internal/firebase-auth-api/zzcr;)Lcom/google/android/gms/internal/firebase-auth-api/zzbl;

    move-result-object v4

    new-instance v9, Lcom/google/android/gms/internal/firebase-auth-api/zzbx;

    .line 7
    invoke-virtual {v2}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zzk()I

    move-result v2

    add-int/lit8 v2, v2, -0x2

    const/4 v3, 0x1

    if-eq v2, v3, :cond_2

    const/4 v5, 0x2

    if-eq v2, v5, :cond_1

    const/4 v5, 0x3

    if-ne v2, v5, :cond_0

    .line 8
    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzbt;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzbt;

    goto :goto_1

    .line 9
    :cond_0
    new-instance v2, Ljava/security/GeneralSecurityException;

    const-string v3, "Unknown key status"

    invoke-direct {v2, v3}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 8
    :cond_1
    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzbt;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzbt;

    goto :goto_1

    .line 7
    :cond_2
    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzbt;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzbt;

    :goto_1
    move-object v5, v2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zztc;->zzb()I

    move-result v2

    if-ne v6, v2, :cond_3

    const/4 v7, 0x1

    goto :goto_2

    :cond_3
    const/4 v2, 0x0

    const/4 v7, 0x0

    :goto_2
    const/4 v8, 0x0

    move-object v3, v9

    invoke-direct/range {v3 .. v8}, Lcom/google/android/gms/internal/firebase-auth-api/zzbx;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzbl;Lcom/google/android/gms/internal/firebase-auth-api/zzbt;IZLcom/google/android/gms/internal/firebase-auth-api/zzbw;)V

    .line 8
    invoke-interface {v0, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 v2, 0x0

    .line 10
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 11
    :cond_4
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method private static zzl(Lcom/google/android/gms/internal/firebase-auth-api/zztc;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    if-eqz p0, :cond_0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zztc;->zza()I

    move-result p0

    if-lez p0, :cond_0

    return-void

    .line 2
    :cond_0
    new-instance p0, Ljava/security/GeneralSecurityException;

    const-string v0, "empty keyset"

    invoke-direct {p0, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static final zzm(Lcom/google/android/gms/internal/firebase-auth-api/zzbl;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 1
    :try_start_0
    sget v0, Lcom/google/android/gms/internal/firebase-auth-api/zzcq;->zza:I

    .line 2
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzks;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzks;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzks;->zzc(Lcom/google/android/gms/internal/firebase-auth-api/zzbl;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzby;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zztc;

    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzcs;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zztc;)Lcom/google/android/gms/internal/firebase-auth-api/zzth;

    move-result-object v0

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagk;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzby;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzby;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zztc;

    if-eqz v0, :cond_3

    .line 2
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zztc;->zzc()Lcom/google/android/gms/internal/firebase-auth-api/zzsz;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzby;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zztc;

    .line 3
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zztc;->zzh()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/firebase-auth-api/zztb;

    .line 4
    invoke-virtual {v2}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzsp;

    move-result-object v3

    .line 5
    invoke-virtual {v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzsp;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzso;

    move-result-object v4

    sget-object v5, Lcom/google/android/gms/internal/firebase-auth-api/zzso;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzso;

    if-ne v4, v5, :cond_1

    .line 6
    invoke-virtual {v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzsp;->zzf()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzsp;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object v3

    .line 7
    invoke-static {v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzcq;->zza(Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzbm;

    move-result-object v5

    instance-of v6, v5, Lcom/google/android/gms/internal/firebase-auth-api/zzcn;

    if-eqz v6, :cond_0

    .line 8
    check-cast v5, Lcom/google/android/gms/internal/firebase-auth-api/zzcn;

    invoke-interface {v5, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzcn;->zzf(Lcom/google/android/gms/internal/firebase-auth-api/zzaff;)Lcom/google/android/gms/internal/firebase-auth-api/zzsp;

    move-result-object v3

    .line 9
    invoke-virtual {v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzsp;->zzf()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzsp;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object v5

    .line 10
    invoke-static {v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzcq;->zza(Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzbm;

    move-result-object v4

    .line 11
    invoke-interface {v4, v5}, Lcom/google/android/gms/internal/firebase-auth-api/zzbm;->zzc(Lcom/google/android/gms/internal/firebase-auth-api/zzaff;)Ljava/lang/Object;

    .line 12
    invoke-virtual {v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzagk;->zzu()Lcom/google/android/gms/internal/firebase-auth-api/zzagg;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/firebase-auth-api/zzta;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzta;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzsp;)Lcom/google/android/gms/internal/firebase-auth-api/zzta;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/firebase-auth-api/zztb;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzsz;->zzb(Lcom/google/android/gms/internal/firebase-auth-api/zztb;)Lcom/google/android/gms/internal/firebase-auth-api/zzsz;

    goto :goto_0

    .line 14
    :cond_0
    new-instance v0, Ljava/security/GeneralSecurityException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "manager for key type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " is not a PrivateKeyManager"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 13
    :cond_1
    new-instance v0, Ljava/security/GeneralSecurityException;

    const-string v1, "The keyset contains a non-private key"

    invoke-direct {v0, v1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 12
    :cond_2
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzby;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zztc;

    .line 15
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zztc;->zzb()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzsz;->zzc(I)Lcom/google/android/gms/internal/firebase-auth-api/zzsz;

    .line 16
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zztc;

    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzby;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zztc;)Lcom/google/android/gms/internal/firebase-auth-api/zzby;

    move-result-object v0

    return-object v0

    .line 1
    :cond_3
    new-instance v0, Ljava/security/GeneralSecurityException;

    const-string v1, "cleartext keyset is not available"

    invoke-direct {v0, v1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method final zzc()Lcom/google/android/gms/internal/firebase-auth-api/zztc;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzby;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zztc;

    return-object v0
.end method

.method public final zzd()Lcom/google/android/gms/internal/firebase-auth-api/zzth;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzby;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zztc;

    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzcs;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zztc;)Lcom/google/android/gms/internal/firebase-auth-api/zzth;

    move-result-object v0

    return-object v0
.end method

.method public final zze(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzcq;->zzd(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    if-eqz v0, :cond_11

    .line 2
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzby;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zztc;

    .line 3
    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzcs;->zza:Ljava/nio/charset/Charset;

    .line 4
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zztc;->zzb()I

    move-result v2

    .line 5
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zztc;->zzh()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    const/4 v9, 0x3

    if-eqz v8, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/google/android/gms/internal/firebase-auth-api/zztb;

    .line 6
    invoke-virtual {v8}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zzk()I

    move-result v10

    if-ne v10, v9, :cond_0

    .line 7
    invoke-virtual {v8}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zzi()Z

    move-result v9

    if-eqz v9, :cond_6

    .line 8
    invoke-virtual {v8}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    move-result-object v9

    sget-object v10, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    if-eq v9, v10, :cond_5

    .line 9
    invoke-virtual {v8}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zzk()I

    move-result v9

    const/4 v10, 0x2

    if-eq v9, v10, :cond_4

    .line 10
    invoke-virtual {v8}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zza()I

    move-result v9

    if-ne v9, v2, :cond_2

    if-nez v6, :cond_1

    const/4 v6, 0x1

    goto :goto_1

    .line 15
    :cond_1
    new-instance p1, Ljava/security/GeneralSecurityException;

    const-string v0, "keyset contains multiple primary keys"

    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 11
    :cond_2
    :goto_1
    invoke-virtual {v8}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzsp;

    move-result-object v8

    invoke-virtual {v8}, Lcom/google/android/gms/internal/firebase-auth-api/zzsp;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzso;

    move-result-object v8

    sget-object v9, Lcom/google/android/gms/internal/firebase-auth-api/zzso;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzso;

    if-eq v8, v9, :cond_3

    const/4 v8, 0x0

    goto :goto_2

    :cond_3
    const/4 v8, 0x1

    :goto_2
    and-int/2addr v7, v8

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 16
    :cond_4
    new-instance p1, Ljava/security/GeneralSecurityException;

    new-array v0, v4, [Ljava/lang/Object;

    .line 17
    invoke-virtual {v8}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zza()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v3

    const-string v1, "key %d has unknown status"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 13
    :cond_5
    new-instance p1, Ljava/security/GeneralSecurityException;

    new-array v0, v4, [Ljava/lang/Object;

    .line 14
    invoke-virtual {v8}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zza()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v3

    const-string v1, "key %d has unknown prefix"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 12
    :cond_6
    new-instance p1, Ljava/security/GeneralSecurityException;

    new-array v0, v4, [Ljava/lang/Object;

    invoke-virtual {v8}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zza()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v3

    const-string v1, "key %d has no key data"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_7
    if-eqz v5, :cond_10

    if-nez v6, :cond_9

    if-eqz v7, :cond_8

    goto :goto_3

    .line 34
    :cond_8
    new-instance p1, Ljava/security/GeneralSecurityException;

    const-string v0, "keyset doesn\'t contain a valid primary key"

    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 18
    :cond_9
    :goto_3
    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzcg;

    const/4 v2, 0x0

    .line 19
    invoke-direct {v1, v0, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzcg;-><init>(Ljava/lang/Class;Lcom/google/android/gms/internal/firebase-auth-api/zzcf;)V

    iget-object v4, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzby;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zznz;

    .line 20
    invoke-virtual {v1, v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzcg;->zzc(Lcom/google/android/gms/internal/firebase-auth-api/zznz;)Lcom/google/android/gms/internal/firebase-auth-api/zzcg;

    :goto_4
    iget-object v4, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzby;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zztc;

    .line 21
    invoke-virtual {v4}, Lcom/google/android/gms/internal/firebase-auth-api/zztc;->zza()I

    move-result v4

    if-ge v3, v4, :cond_f

    iget-object v4, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzby;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zztc;

    .line 22
    invoke-virtual {v4, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zztc;->zzd(I)Lcom/google/android/gms/internal/firebase-auth-api/zztb;

    move-result-object v4

    .line 23
    invoke-virtual {v4}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zzk()I

    move-result v5

    if-ne v5, v9, :cond_e

    .line 24
    invoke-static {v4, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzby;->zzj(Lcom/google/android/gms/internal/firebase-auth-api/zztb;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v5

    iget-object v6, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzby;->zzb:Ljava/util/List;

    .line 25
    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_a

    iget-object v6, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzby;->zzb:Ljava/util/List;

    .line 26
    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/android/gms/internal/firebase-auth-api/zzbx;

    invoke-virtual {v6}, Lcom/google/android/gms/internal/firebase-auth-api/zzbx;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzbl;

    move-result-object v6

    invoke-static {v6, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzby;->zzm(Lcom/google/android/gms/internal/firebase-auth-api/zzbl;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v6

    goto :goto_5

    :cond_a
    move-object v6, v2

    :goto_5
    if-nez v6, :cond_c

    if-eqz v5, :cond_b

    goto :goto_6

    .line 30
    :cond_b
    new-instance p1, Ljava/security/GeneralSecurityException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 31
    invoke-virtual {v4}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzsp;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzsp;->zzf()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to get primitive "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " for key of type "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 27
    :cond_c
    :goto_6
    invoke-virtual {v4}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zza()I

    move-result v7

    iget-object v8, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzby;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zztc;

    invoke-virtual {v8}, Lcom/google/android/gms/internal/firebase-auth-api/zztc;->zzb()I

    move-result v8

    if-ne v7, v8, :cond_d

    .line 28
    invoke-virtual {v1, v6, v5, v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzcg;->zzb(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/firebase-auth-api/zztb;)Lcom/google/android/gms/internal/firebase-auth-api/zzcg;

    goto :goto_7

    .line 29
    :cond_d
    invoke-virtual {v1, v6, v5, v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzcg;->zza(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/firebase-auth-api/zztb;)Lcom/google/android/gms/internal/firebase-auth-api/zzcg;

    :cond_e
    :goto_7
    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    .line 32
    :cond_f
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzcg;->zzd()Lcom/google/android/gms/internal/firebase-auth-api/zzcl;

    move-result-object v0

    .line 33
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzks;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzks;

    move-result-object v1

    invoke-virtual {v1, v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzks;->zzd(Lcom/google/android/gms/internal/firebase-auth-api/zzcl;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 18
    :cond_10
    new-instance p1, Ljava/security/GeneralSecurityException;

    const-string v0, "keyset must contain at least one ENABLED key"

    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 2
    :cond_11
    new-instance v0, Ljava/security/GeneralSecurityException;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "No wrapper found for "

    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final zzf(Lcom/google/android/gms/internal/firebase-auth-api/zzca;Lcom/google/android/gms/internal/firebase-auth-api/zzbd;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;,
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    new-array v1, v0, [B

    .line 1
    iget-object v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzby;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zztc;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaep;->zzq()[B

    move-result-object v3

    invoke-interface {p2, v3, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzbd;->zzb([B[B)[B

    move-result-object v3

    .line 2
    :try_start_0
    invoke-interface {p2, v3, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzbd;->zza([B[B)[B

    move-result-object p2

    .line 3
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzafx;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzafx;

    move-result-object v1

    .line 4
    invoke-static {p2, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zztc;->zzg([BLcom/google/android/gms/internal/firebase-auth-api/zzafx;)Lcom/google/android/gms/internal/firebase-auth-api/zztc;

    move-result-object p2

    .line 5
    invoke-virtual {p2, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzagk;->equals(Ljava/lang/Object;)Z

    move-result p2
    :try_end_0
    .catch Lcom/google/android/gms/internal/firebase-auth-api/zzags; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz p2, :cond_0

    .line 13
    array-length p2, v3

    .line 6
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzrl;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzrk;

    move-result-object v1

    .line 7
    invoke-static {v3, v0, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaff;->zzn([BII)Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object p2

    .line 8
    invoke-virtual {v1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzrk;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzaff;)Lcom/google/android/gms/internal/firebase-auth-api/zzrk;

    .line 9
    invoke-static {v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzcs;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zztc;)Lcom/google/android/gms/internal/firebase-auth-api/zzth;

    move-result-object p2

    invoke-virtual {v1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzrk;->zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzth;)Lcom/google/android/gms/internal/firebase-auth-api/zzrk;

    .line 10
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object p2

    check-cast p2, Lcom/google/android/gms/internal/firebase-auth-api/zzrl;

    .line 11
    invoke-interface {p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzca;->zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzrl;)V

    return-void

    .line 12
    :cond_0
    :try_start_1
    new-instance p1, Ljava/security/GeneralSecurityException;

    const-string p2, "cannot encrypt keyset"

    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catch Lcom/google/android/gms/internal/firebase-auth-api/zzags; {:try_start_1 .. :try_end_1} :catch_0

    .line 13
    :catch_0
    new-instance p1, Ljava/security/GeneralSecurityException;

    const-string p2, "invalid keyset, corrupted key material"

    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final zzg(Lcom/google/android/gms/internal/firebase-auth-api/zzca;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzby;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zztc;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zztc;->zzh()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/firebase-auth-api/zztb;

    .line 2
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzsp;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzsp;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzso;

    move-result-object v2

    sget-object v3, Lcom/google/android/gms/internal/firebase-auth-api/zzso;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzso;

    if-eq v2, v3, :cond_0

    .line 3
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzsp;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzsp;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzso;

    move-result-object v2

    sget-object v3, Lcom/google/android/gms/internal/firebase-auth-api/zzso;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzso;

    if-eq v2, v3, :cond_0

    .line 4
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzsp;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzsp;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzso;

    move-result-object v2

    sget-object v3, Lcom/google/android/gms/internal/firebase-auth-api/zzso;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzso;

    if-eq v2, v3, :cond_0

    goto :goto_0

    .line 6
    :cond_0
    new-instance p1, Ljava/security/GeneralSecurityException;

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    .line 7
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzsp;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzsp;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzso;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzso;->name()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v2

    const/4 v2, 0x1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzsp;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzsp;->zzf()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v2

    const-string v1, "keyset contains key material of type %s for type url %s"

    .line 8
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzby;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zztc;

    .line 5
    invoke-interface {p1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzca;->zzc(Lcom/google/android/gms/internal/firebase-auth-api/zztc;)V

    return-void
.end method
