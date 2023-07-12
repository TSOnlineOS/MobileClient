.class final Lcom/google/android/gms/internal/firebase-auth-api/zzafm;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Lcom/google/android/gms/internal/firebase-auth-api/zzaia;


# instance fields
.field private final zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

.field private zzb:I

.field private zzc:I

.field private zzd:I


# direct methods
.method private constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzafl;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzagq;->zzd:[B

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    iput-object p0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzafm;

    return-void
.end method

.method private final zzP(Ljava/lang/Object;Lcom/google/android/gms/internal/firebase-auth-api/zzaib;Lcom/google/android/gms/internal/firebase-auth-api/zzafx;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzc:I

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    ushr-int/lit8 v1, v1, 0x3

    shl-int/lit8 v1, v1, 0x3

    or-int/lit8 v1, v1, 0x4

    iput v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzc:I

    :try_start_0
    invoke-interface {p2, p1, p0, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzaib;->zzh(Ljava/lang/Object;Lcom/google/android/gms/internal/firebase-auth-api/zzaia;Lcom/google/android/gms/internal/firebase-auth-api/zzafx;)V

    iget p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    iget p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzc:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne p1, p2, :cond_0

    .line 3
    iput v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzc:I

    return-void

    .line 2
    :cond_0
    :try_start_1
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zzg()Lcom/google/android/gms/internal/firebase-auth-api/zzags;

    move-result-object p1

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    iput v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzc:I

    .line 3
    throw p1
.end method

.method private final zzQ(Ljava/lang/Object;Lcom/google/android/gms/internal/firebase-auth-api/zzaib;Lcom/google/android/gms/internal/firebase-auth-api/zzafx;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzn()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    iget v2, v1, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zza:I

    iget v3, v1, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzb:I

    if-ge v2, v3, :cond_0

    .line 4
    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zze(I)I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    iget v2, v1, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zza:I

    add-int/lit8 v2, v2, 0x1

    iput v2, v1, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zza:I

    .line 5
    invoke-interface {p2, p1, p0, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzaib;->zzh(Ljava/lang/Object;Lcom/google/android/gms/internal/firebase-auth-api/zzaia;Lcom/google/android/gms/internal/firebase-auth-api/zzafx;)V

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    const/4 p2, 0x0

    .line 6
    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzz(I)V

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    iget p2, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zza:I

    add-int/lit8 p2, p2, -0x1

    iput p2, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zza:I

    .line 7
    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzA(I)V

    return-void

    .line 1
    :cond_0
    new-instance p1, Lcom/google/android/gms/internal/firebase-auth-api/zzags;

    const-string p2, "Protocol message had too many levels of nesting.  May be malicious.  Use CodedInputStream.setRecursionLimit() to increase the depth limit."

    .line 2
    invoke-direct {p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;-><init>(Ljava/lang/String;)V

    .line 3
    throw p1
.end method

.method private final zzR(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v0

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zzj()Lcom/google/android/gms/internal/firebase-auth-api/zzags;

    move-result-object p1

    throw p1
.end method

.method private final zzS(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzagr;

    move-result-object p1

    throw p1
.end method

.method private static final zzT(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    and-int/lit8 p0, p0, 0x3

    if-nez p0, :cond_0

    return-void

    .line 1
    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zzg()Lcom/google/android/gms/internal/firebase-auth-api/zzags;

    move-result-object p0

    throw p0
.end method

.method private static final zzU(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    and-int/lit8 p0, p0, 0x7

    if-nez p0, :cond_0

    return-void

    .line 1
    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zzg()Lcom/google/android/gms/internal/firebase-auth-api/zzags;

    move-result-object p0

    throw p0
.end method

.method public static zzq(Lcom/google/android/gms/internal/firebase-auth-api/zzafl;)Lcom/google/android/gms/internal/firebase-auth-api/zzafm;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzafm;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzafl;)V

    return-object v0
.end method


# virtual methods
.method public final zzA(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzahe;

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eqz v0, :cond_4

    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzahe;

    iget p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eq p1, v2, :cond_2

    if-ne p1, v1, :cond_1

    .line 7
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzn()I

    move-result p1

    .line 3
    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzU(I)V

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzo()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzahe;->zzf(J)V

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result p1

    if-lt p1, v1, :cond_0

    goto :goto_0

    .line 8
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzagr;

    move-result-object p1

    throw p1

    .line 1
    :cond_2
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzo()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzahe;->zzf(J)V

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 6
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzC()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzm()I

    move-result p1

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    return-void

    .line 4
    :cond_4
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eq v0, v2, :cond_7

    if-ne v0, v1, :cond_6

    .line 14
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 9
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzn()I

    move-result v0

    .line 10
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzU(I)V

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v1

    add-int/2addr v1, v0

    .line 8
    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 11
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzo()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v0

    if-lt v0, v1, :cond_5

    :goto_0
    return-void

    .line 15
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzagr;

    move-result-object p1

    throw p1

    .line 4
    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzo()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzC()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 14
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzm()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    return-void
.end method

.method public final zzB(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzage;

    const/4 v1, 0x5

    const/4 v2, 0x2

    if-eqz v0, :cond_5

    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzage;

    iget p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eq p1, v2, :cond_3

    if-ne p1, v1, :cond_2

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzc()F

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzage;->zze(F)V

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzC()Z

    move-result p1

    if-eqz p1, :cond_1

    return-void

    :cond_1
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzm()I

    move-result p1

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    if-eq p1, v1, :cond_0

    iput p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    return-void

    .line 8
    :cond_2
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzagr;

    move-result-object p1

    throw p1

    .line 4
    :cond_3
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzn()I

    move-result p1

    .line 6
    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzT(I)V

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v1

    add-int v3, v1, p1

    :cond_4
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzc()F

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzage;->zze(F)V

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result p1

    if-lt p1, v3, :cond_4

    goto :goto_0

    :cond_5
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eq v0, v2, :cond_9

    if-ne v0, v1, :cond_8

    :cond_6
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 9
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzc()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 10
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzC()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 11
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzm()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    if-eq v0, v1, :cond_6

    iput v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    return-void

    .line 15
    :cond_8
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzagr;

    move-result-object p1

    throw p1

    .line 11
    :cond_9
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzn()I

    move-result v0

    .line 13
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzT(I)V

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v1

    add-int/2addr v1, v0

    .line 8
    :cond_a
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 14
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzc()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v0

    if-lt v0, v1, :cond_a

    :goto_0
    return-void
.end method

.method public final zzC(Ljava/util/List;Lcom/google/android/gms/internal/firebase-auth-api/zzaib;Lcom/google/android/gms/internal/firebase-auth-api/zzafx;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    and-int/lit8 v1, v0, 0x7

    const/4 v2, 0x3

    if-ne v1, v2, :cond_3

    :cond_0
    invoke-interface {p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaib;->zze()Ljava/lang/Object;

    move-result-object v1

    .line 2
    invoke-direct {p0, v1, p2, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzP(Ljava/lang/Object;Lcom/google/android/gms/internal/firebase-auth-api/zzaib;Lcom/google/android/gms/internal/firebase-auth-api/zzafx;)V

    .line 3
    invoke-interface {p2, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaib;->zzf(Ljava/lang/Object;)V

    .line 4
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 5
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzC()Z

    move-result v1

    if-nez v1, :cond_2

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 6
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzm()I

    move-result v1

    if-eq v1, v0, :cond_0

    .line 7
    iput v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    :cond_2
    :goto_0
    return-void

    :cond_3
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzagr;

    move-result-object p1

    throw p1
.end method

.method public final zzD(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzagl;

    const/4 v1, 0x2

    if-eqz v0, :cond_4

    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzagl;

    iget p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eqz p1, :cond_2

    if-ne p1, v1, :cond_1

    .line 7
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzn()I

    move-result p1

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzh()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagl;->zzf(I)V

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result p1

    if-lt p1, v1, :cond_0

    .line 4
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzR(I)V

    return-void

    .line 8
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzagr;

    move-result-object p1

    throw p1

    .line 1
    :cond_2
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzh()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagl;->zzf(I)V

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 6
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzC()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzm()I

    move-result p1

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    return-void

    .line 4
    :cond_4
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eqz v0, :cond_7

    if-ne v0, v1, :cond_6

    .line 14
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 9
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzn()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v1

    add-int/2addr v1, v0

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 10
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzh()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v0

    if-lt v0, v1, :cond_5

    .line 11
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzR(I)V

    return-void

    .line 15
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzagr;

    move-result-object p1

    throw p1

    .line 4
    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzh()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzC()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 14
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzm()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    return-void
.end method

.method public final zzE(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzahe;

    const/4 v1, 0x2

    if-eqz v0, :cond_4

    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzahe;

    iget p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eqz p1, :cond_2

    if-ne p1, v1, :cond_1

    .line 7
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzn()I

    move-result p1

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzp()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzahe;->zzf(J)V

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result p1

    if-lt p1, v1, :cond_0

    .line 4
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzR(I)V

    return-void

    .line 8
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzagr;

    move-result-object p1

    throw p1

    .line 1
    :cond_2
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzp()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzahe;->zzf(J)V

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 6
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzC()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzm()I

    move-result p1

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    return-void

    .line 4
    :cond_4
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eqz v0, :cond_7

    if-ne v0, v1, :cond_6

    .line 14
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 9
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzn()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v1

    add-int/2addr v1, v0

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 10
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzp()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v0

    if-lt v0, v1, :cond_5

    .line 11
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzR(I)V

    return-void

    .line 15
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzagr;

    move-result-object p1

    throw p1

    .line 4
    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzp()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzC()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 14
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzm()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    return-void
.end method

.method public final zzF(Ljava/util/List;Lcom/google/android/gms/internal/firebase-auth-api/zzaib;Lcom/google/android/gms/internal/firebase-auth-api/zzafx;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    and-int/lit8 v1, v0, 0x7

    const/4 v2, 0x2

    if-ne v1, v2, :cond_3

    :cond_0
    invoke-interface {p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaib;->zze()Ljava/lang/Object;

    move-result-object v1

    .line 2
    invoke-direct {p0, v1, p2, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzQ(Ljava/lang/Object;Lcom/google/android/gms/internal/firebase-auth-api/zzaib;Lcom/google/android/gms/internal/firebase-auth-api/zzafx;)V

    .line 3
    invoke-interface {p2, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaib;->zzf(Ljava/lang/Object;)V

    .line 4
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 5
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzC()Z

    move-result v1

    if-nez v1, :cond_2

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 6
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzm()I

    move-result v1

    if-eq v1, v0, :cond_0

    .line 7
    iput v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    :cond_2
    :goto_0
    return-void

    :cond_3
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzagr;

    move-result-object p1

    throw p1
.end method

.method public final zzG(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzagl;

    const/4 v1, 0x5

    const/4 v2, 0x2

    if-eqz v0, :cond_5

    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzagl;

    iget p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eq p1, v2, :cond_3

    if-ne p1, v1, :cond_2

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzk()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagl;->zzf(I)V

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzC()Z

    move-result p1

    if-eqz p1, :cond_1

    return-void

    :cond_1
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzm()I

    move-result p1

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    if-eq p1, v1, :cond_0

    iput p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    return-void

    .line 8
    :cond_2
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzagr;

    move-result-object p1

    throw p1

    .line 4
    :cond_3
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzn()I

    move-result p1

    .line 6
    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzT(I)V

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v1

    add-int v3, v1, p1

    :cond_4
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzk()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagl;->zzf(I)V

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result p1

    if-lt p1, v3, :cond_4

    goto :goto_0

    :cond_5
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eq v0, v2, :cond_9

    if-ne v0, v1, :cond_8

    :cond_6
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 9
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzk()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 10
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzC()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 11
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzm()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    if-eq v0, v1, :cond_6

    iput v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    return-void

    .line 15
    :cond_8
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzagr;

    move-result-object p1

    throw p1

    .line 11
    :cond_9
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzn()I

    move-result v0

    .line 13
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzT(I)V

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v1

    add-int/2addr v1, v0

    .line 8
    :cond_a
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 14
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzk()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v0

    if-lt v0, v1, :cond_a

    :goto_0
    return-void
.end method

.method public final zzH(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzahe;

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eqz v0, :cond_4

    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzahe;

    iget p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eq p1, v2, :cond_2

    if-ne p1, v1, :cond_1

    .line 7
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzn()I

    move-result p1

    .line 3
    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzU(I)V

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzt()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzahe;->zzf(J)V

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result p1

    if-lt p1, v1, :cond_0

    goto :goto_0

    .line 8
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzagr;

    move-result-object p1

    throw p1

    .line 1
    :cond_2
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzt()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzahe;->zzf(J)V

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 6
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzC()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzm()I

    move-result p1

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    return-void

    .line 4
    :cond_4
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eq v0, v2, :cond_7

    if-ne v0, v1, :cond_6

    .line 14
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 9
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzn()I

    move-result v0

    .line 10
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzU(I)V

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v1

    add-int/2addr v1, v0

    .line 8
    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 11
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzt()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v0

    if-lt v0, v1, :cond_5

    :goto_0
    return-void

    .line 15
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzagr;

    move-result-object p1

    throw p1

    .line 4
    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzt()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzC()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 14
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzm()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    return-void
.end method

.method public final zzI(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzagl;

    const/4 v1, 0x2

    if-eqz v0, :cond_4

    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzagl;

    iget p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eqz p1, :cond_2

    if-ne p1, v1, :cond_1

    .line 7
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzn()I

    move-result p1

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzl()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagl;->zzf(I)V

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result p1

    if-lt p1, v1, :cond_0

    .line 4
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzR(I)V

    return-void

    .line 8
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzagr;

    move-result-object p1

    throw p1

    .line 1
    :cond_2
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzl()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagl;->zzf(I)V

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 6
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzC()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzm()I

    move-result p1

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    return-void

    .line 4
    :cond_4
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eqz v0, :cond_7

    if-ne v0, v1, :cond_6

    .line 14
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 9
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzn()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v1

    add-int/2addr v1, v0

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 10
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzl()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v0

    if-lt v0, v1, :cond_5

    .line 11
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzR(I)V

    return-void

    .line 15
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzagr;

    move-result-object p1

    throw p1

    .line 4
    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzl()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzC()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 14
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzm()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    return-void
.end method

.method public final zzJ(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzahe;

    const/4 v1, 0x2

    if-eqz v0, :cond_4

    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzahe;

    iget p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eqz p1, :cond_2

    if-ne p1, v1, :cond_1

    .line 7
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzn()I

    move-result p1

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzu()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzahe;->zzf(J)V

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result p1

    if-lt p1, v1, :cond_0

    .line 4
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzR(I)V

    return-void

    .line 8
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzagr;

    move-result-object p1

    throw p1

    .line 1
    :cond_2
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzu()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzahe;->zzf(J)V

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 6
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzC()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzm()I

    move-result p1

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    return-void

    .line 4
    :cond_4
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eqz v0, :cond_7

    if-ne v0, v1, :cond_6

    .line 14
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 9
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzn()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v1

    add-int/2addr v1, v0

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 10
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzu()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v0

    if-lt v0, v1, :cond_5

    .line 11
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzR(I)V

    return-void

    .line 15
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzagr;

    move-result-object p1

    throw p1

    .line 4
    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzu()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzC()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 14
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzm()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    return-void
.end method

.method public final zzK(Ljava/util/List;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    and-int/lit8 v0, v0, 0x7

    const/4 v1, 0x2

    if-ne v0, v1, :cond_6

    instance-of v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzagx;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    if-nez p2, :cond_3

    .line 5
    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzagx;

    .line 6
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzp()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagx;->zzi(Lcom/google/android/gms/internal/firebase-auth-api/zzaff;)V

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzC()Z

    move-result p1

    if-eqz p1, :cond_2

    return-void

    :cond_2
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 8
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzm()I

    move-result p1

    iget p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    if-eq p1, p2, :cond_1

    iput p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    return-void

    :cond_3
    :goto_0
    if-eqz p2, :cond_4

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzs()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_4
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzr()Ljava/lang/String;

    move-result-object v0

    :goto_1
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzC()Z

    move-result v0

    if-eqz v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 4
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzm()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    if-eq v0, v1, :cond_3

    iput v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    return-void

    .line 1
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzagr;

    move-result-object p1

    throw p1
.end method

.method public final zzL(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzagl;

    const/4 v1, 0x2

    if-eqz v0, :cond_4

    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzagl;

    iget p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eqz p1, :cond_2

    if-ne p1, v1, :cond_1

    .line 7
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzn()I

    move-result p1

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzn()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagl;->zzf(I)V

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result p1

    if-lt p1, v1, :cond_0

    .line 4
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzR(I)V

    return-void

    .line 8
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzagr;

    move-result-object p1

    throw p1

    .line 1
    :cond_2
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzn()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagl;->zzf(I)V

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 6
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzC()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzm()I

    move-result p1

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    return-void

    .line 4
    :cond_4
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eqz v0, :cond_7

    if-ne v0, v1, :cond_6

    .line 14
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 9
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzn()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v1

    add-int/2addr v1, v0

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 10
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzn()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v0

    if-lt v0, v1, :cond_5

    .line 11
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzR(I)V

    return-void

    .line 15
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzagr;

    move-result-object p1

    throw p1

    .line 4
    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzn()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzC()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 14
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzm()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    return-void
.end method

.method public final zzM(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzahe;

    const/4 v1, 0x2

    if-eqz v0, :cond_4

    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzahe;

    iget p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eqz p1, :cond_2

    if-ne p1, v1, :cond_1

    .line 7
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzn()I

    move-result p1

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzv()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzahe;->zzf(J)V

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result p1

    if-lt p1, v1, :cond_0

    .line 4
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzR(I)V

    return-void

    .line 8
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzagr;

    move-result-object p1

    throw p1

    .line 1
    :cond_2
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzv()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzahe;->zzf(J)V

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 6
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzC()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzm()I

    move-result p1

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    return-void

    .line 4
    :cond_4
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eqz v0, :cond_7

    if-ne v0, v1, :cond_6

    .line 14
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 9
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzn()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v1

    add-int/2addr v1, v0

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 10
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzv()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v0

    if-lt v0, v1, :cond_5

    .line 11
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzR(I)V

    return-void

    .line 15
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzagr;

    move-result-object p1

    throw p1

    .line 4
    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzv()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzC()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 14
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzm()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    return-void
.end method

.method public final zzN()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzS(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzD()Z

    move-result v0

    return v0
.end method

.method public final zzO()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzC()Z

    move-result v0

    if-nez v0, :cond_1

    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzc:I

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 2
    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzE(I)Z

    move-result v0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public final zza()D
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzS(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzb()D

    move-result-wide v0

    return-wide v0
.end method

.method public final zzb()F
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x5

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzS(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzc()F

    move-result v0

    return v0
.end method

.method public final zzc()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    if-eqz v0, :cond_0

    iput v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    const/4 v1, 0x0

    iput v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzm()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    :goto_0
    if-eqz v0, :cond_2

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzc:I

    if-ne v0, v1, :cond_1

    goto :goto_1

    :cond_1
    ushr-int/lit8 v0, v0, 0x3

    return v0

    :cond_2
    :goto_1
    const v0, 0x7fffffff

    return v0
.end method

.method public final zzd()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    return v0
.end method

.method public final zze()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzS(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzf()I

    move-result v0

    return v0
.end method

.method public final zzf()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x5

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzS(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzg()I

    move-result v0

    return v0
.end method

.method public final zzg()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzS(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzh()I

    move-result v0

    return v0
.end method

.method public final zzh()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x5

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzS(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzk()I

    move-result v0

    return v0
.end method

.method public final zzi()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzS(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzl()I

    move-result v0

    return v0
.end method

.method public final zzj()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzS(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzn()I

    move-result v0

    return v0
.end method

.method public final zzk()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzS(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzo()J

    move-result-wide v0

    return-wide v0
.end method

.method public final zzl()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzS(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzp()J

    move-result-wide v0

    return-wide v0
.end method

.method public final zzm()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzS(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzt()J

    move-result-wide v0

    return-wide v0
.end method

.method public final zzn()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzS(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzu()J

    move-result-wide v0

    return-wide v0
.end method

.method public final zzo()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzS(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzv()J

    move-result-wide v0

    return-wide v0
.end method

.method public final zzp()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x2

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzS(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzw()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object v0

    return-object v0
.end method

.method public final zzr()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x2

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzS(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzx()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final zzs()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x2

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzS(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzy()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final zzt(Ljava/lang/Object;Lcom/google/android/gms/internal/firebase-auth-api/zzaib;Lcom/google/android/gms/internal/firebase-auth-api/zzafx;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x3

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzS(I)V

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzP(Ljava/lang/Object;Lcom/google/android/gms/internal/firebase-auth-api/zzaib;Lcom/google/android/gms/internal/firebase-auth-api/zzafx;)V

    return-void
.end method

.method public final zzu(Ljava/lang/Object;Lcom/google/android/gms/internal/firebase-auth-api/zzaib;Lcom/google/android/gms/internal/firebase-auth-api/zzafx;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x2

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzS(I)V

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzQ(Ljava/lang/Object;Lcom/google/android/gms/internal/firebase-auth-api/zzaib;Lcom/google/android/gms/internal/firebase-auth-api/zzafx;)V

    return-void
.end method

.method public final zzv(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzaeu;

    const/4 v1, 0x2

    if-eqz v0, :cond_4

    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaeu;

    iget p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eqz p1, :cond_2

    if-ne p1, v1, :cond_1

    .line 7
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzn()I

    move-result p1

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzD()Z

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaeu;->zze(Z)V

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result p1

    if-lt p1, v1, :cond_0

    .line 4
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzR(I)V

    return-void

    .line 8
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzagr;

    move-result-object p1

    throw p1

    .line 1
    :cond_2
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzD()Z

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaeu;->zze(Z)V

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 6
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzC()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzm()I

    move-result p1

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    return-void

    .line 4
    :cond_4
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eqz v0, :cond_7

    if-ne v0, v1, :cond_6

    .line 14
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 9
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzn()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v1

    add-int/2addr v1, v0

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 10
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzD()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v0

    if-lt v0, v1, :cond_5

    .line 11
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzR(I)V

    return-void

    .line 15
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzagr;

    move-result-object p1

    throw p1

    .line 4
    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzD()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzC()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 14
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzm()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    return-void
.end method

.method public final zzw(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    and-int/lit8 v0, v0, 0x7

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzp()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzC()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzm()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    if-eq v0, v1, :cond_0

    .line 4
    iput v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    return-void

    :cond_2
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzagr;

    move-result-object p1

    throw p1
.end method

.method public final zzx(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzafu;

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eqz v0, :cond_4

    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzafu;

    iget p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eq p1, v2, :cond_2

    if-ne p1, v1, :cond_1

    .line 7
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzn()I

    move-result p1

    .line 3
    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzU(I)V

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzb()D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzafu;->zze(D)V

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result p1

    if-lt p1, v1, :cond_0

    goto :goto_0

    .line 8
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzagr;

    move-result-object p1

    throw p1

    .line 1
    :cond_2
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzb()D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzafu;->zze(D)V

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 6
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzC()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzm()I

    move-result p1

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    return-void

    .line 4
    :cond_4
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eq v0, v2, :cond_7

    if-ne v0, v1, :cond_6

    .line 14
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 9
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzn()I

    move-result v0

    .line 10
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzU(I)V

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v1

    add-int/2addr v1, v0

    .line 8
    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 11
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzb()D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v0

    if-lt v0, v1, :cond_5

    :goto_0
    return-void

    .line 15
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzagr;

    move-result-object p1

    throw p1

    .line 4
    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzb()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzC()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 14
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzm()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    return-void
.end method

.method public final zzy(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzagl;

    const/4 v1, 0x2

    if-eqz v0, :cond_4

    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzagl;

    iget p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eqz p1, :cond_2

    if-ne p1, v1, :cond_1

    .line 7
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzn()I

    move-result p1

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzf()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagl;->zzf(I)V

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result p1

    if-lt p1, v1, :cond_0

    .line 4
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzR(I)V

    return-void

    .line 8
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzagr;

    move-result-object p1

    throw p1

    .line 1
    :cond_2
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzf()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagl;->zzf(I)V

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 6
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzC()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzm()I

    move-result p1

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    return-void

    .line 4
    :cond_4
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eqz v0, :cond_7

    if-ne v0, v1, :cond_6

    .line 14
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 9
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzn()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v1

    add-int/2addr v1, v0

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 10
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzf()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v0

    if-lt v0, v1, :cond_5

    .line 11
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzR(I)V

    return-void

    .line 15
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzagr;

    move-result-object p1

    throw p1

    .line 4
    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzf()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzC()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 14
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzm()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    return-void
.end method

.method public final zzz(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzagl;

    const/4 v1, 0x5

    const/4 v2, 0x2

    if-eqz v0, :cond_5

    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzagl;

    iget p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eq p1, v2, :cond_3

    if-ne p1, v1, :cond_2

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzg()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagl;->zzf(I)V

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzC()Z

    move-result p1

    if-eqz p1, :cond_1

    return-void

    :cond_1
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzm()I

    move-result p1

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    if-eq p1, v1, :cond_0

    iput p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    return-void

    .line 8
    :cond_2
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzagr;

    move-result-object p1

    throw p1

    .line 4
    :cond_3
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzn()I

    move-result p1

    .line 6
    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzT(I)V

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v1

    add-int v3, v1, p1

    :cond_4
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzg()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagl;->zzf(I)V

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result p1

    if-lt p1, v3, :cond_4

    goto :goto_0

    :cond_5
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eq v0, v2, :cond_9

    if-ne v0, v1, :cond_8

    :cond_6
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 9
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzg()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 10
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzC()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 11
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzm()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzb:I

    if-eq v0, v1, :cond_6

    iput v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzd:I

    return-void

    .line 15
    :cond_8
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzagr;

    move-result-object p1

    throw p1

    .line 11
    :cond_9
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzn()I

    move-result v0

    .line 13
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zzT(I)V

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v1

    add-int/2addr v1, v0

    .line 8
    :cond_a
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    .line 14
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzg()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafm;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzafl;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafl;->zzd()I

    move-result v0

    if-lt v0, v1, :cond_a

    :goto_0
    return-void
.end method
