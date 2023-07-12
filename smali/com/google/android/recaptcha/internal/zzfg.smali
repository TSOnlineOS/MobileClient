.class final Lcom/google/android/recaptcha/internal/zzfg;
.super Ljava/lang/Object;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"

# interfaces
.implements Lcom/google/android/recaptcha/internal/zzik;


# instance fields
.field private final zza:Lcom/google/android/recaptcha/internal/zzff;

.field private zzb:I

.field private zzc:I

.field private zzd:I


# direct methods
.method private constructor <init>(Lcom/google/android/recaptcha/internal/zzff;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

    sget-object v0, Lcom/google/android/recaptcha/internal/zzgw;->zzd:[B

    iput-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    iput-object p0, p1, Lcom/google/android/recaptcha/internal/zzff;->zzc:Lcom/google/android/recaptcha/internal/zzfg;

    return-void
.end method

.method private final zzP(Ljava/lang/Object;Lcom/google/android/recaptcha/internal/zzil;Lcom/google/android/recaptcha/internal/zzfz;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzc:I

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    ushr-int/lit8 v1, v1, 0x3

    shl-int/lit8 v1, v1, 0x3

    or-int/lit8 v1, v1, 0x4

    iput v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzc:I

    :try_start_0
    invoke-interface {p2, p1, p0, p3}, Lcom/google/android/recaptcha/internal/zzil;->zzh(Ljava/lang/Object;Lcom/google/android/recaptcha/internal/zzik;Lcom/google/android/recaptcha/internal/zzfz;)V

    iget p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    iget p2, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzc:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne p1, p2, :cond_0

    .line 3
    iput v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzc:I

    return-void

    .line 2
    :cond_0
    :try_start_1
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zzg()Lcom/google/android/recaptcha/internal/zzgy;

    move-result-object p1

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    iput v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzc:I

    .line 3
    throw p1
.end method

.method private final zzQ(Ljava/lang/Object;Lcom/google/android/recaptcha/internal/zzil;Lcom/google/android/recaptcha/internal/zzfz;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzn()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    iget v2, v1, Lcom/google/android/recaptcha/internal/zzff;->zza:I

    iget v3, v1, Lcom/google/android/recaptcha/internal/zzff;->zzb:I

    if-ge v2, v3, :cond_0

    .line 4
    invoke-virtual {v1, v0}, Lcom/google/android/recaptcha/internal/zzff;->zze(I)I

    move-result v0

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    iget v2, v1, Lcom/google/android/recaptcha/internal/zzff;->zza:I

    add-int/lit8 v2, v2, 0x1

    iput v2, v1, Lcom/google/android/recaptcha/internal/zzff;->zza:I

    .line 5
    invoke-interface {p2, p1, p0, p3}, Lcom/google/android/recaptcha/internal/zzil;->zzh(Ljava/lang/Object;Lcom/google/android/recaptcha/internal/zzik;Lcom/google/android/recaptcha/internal/zzfz;)V

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    const/4 p2, 0x0

    .line 6
    invoke-virtual {p1, p2}, Lcom/google/android/recaptcha/internal/zzff;->zzz(I)V

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    iget p2, p1, Lcom/google/android/recaptcha/internal/zzff;->zza:I

    add-int/lit8 p2, p2, -0x1

    iput p2, p1, Lcom/google/android/recaptcha/internal/zzff;->zza:I

    .line 7
    invoke-virtual {p1, v0}, Lcom/google/android/recaptcha/internal/zzff;->zzA(I)V

    return-void

    .line 1
    :cond_0
    new-instance p1, Lcom/google/android/recaptcha/internal/zzgy;

    const-string p2, "Protocol message had too many levels of nesting.  May be malicious.  Use CodedInputStream.setRecursionLimit() to increase the depth limit."

    .line 2
    invoke-direct {p1, p2}, Lcom/google/android/recaptcha/internal/zzgy;-><init>(Ljava/lang/String;)V

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
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v0

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zzj()Lcom/google/android/recaptcha/internal/zzgy;

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
    iget v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zza()Lcom/google/android/recaptcha/internal/zzgx;

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
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zzg()Lcom/google/android/recaptcha/internal/zzgy;

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
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zzg()Lcom/google/android/recaptcha/internal/zzgy;

    move-result-object p0

    throw p0
.end method

.method public static zzq(Lcom/google/android/recaptcha/internal/zzff;)Lcom/google/android/recaptcha/internal/zzfg;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzff;->zzc:Lcom/google/android/recaptcha/internal/zzfg;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    new-instance v0, Lcom/google/android/recaptcha/internal/zzfg;

    invoke-direct {v0, p0}, Lcom/google/android/recaptcha/internal/zzfg;-><init>(Lcom/google/android/recaptcha/internal/zzff;)V

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
    instance-of v0, p1, Lcom/google/android/recaptcha/internal/zzhn;

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eqz v0, :cond_4

    .line 2
    move-object v0, p1

    check-cast v0, Lcom/google/android/recaptcha/internal/zzhn;

    iget p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eq p1, v2, :cond_2

    if-ne p1, v1, :cond_1

    .line 8
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzn()I

    move-result p1

    .line 4
    invoke-static {p1}, Lcom/google/android/recaptcha/internal/zzfg;->zzU(I)V

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 5
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzo()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/recaptcha/internal/zzhn;->zzf(J)V

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result p1

    if-lt p1, v1, :cond_0

    goto :goto_0

    .line 9
    :cond_1
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zza()Lcom/google/android/recaptcha/internal/zzgx;

    move-result-object p1

    throw p1

    .line 2
    :cond_2
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 6
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzo()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/recaptcha/internal/zzhn;->zzf(J)V

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzC()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 8
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzm()I

    move-result p1

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

    return-void

    .line 5
    :cond_4
    iget v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eq v0, v2, :cond_7

    if-ne v0, v1, :cond_6

    .line 15
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 10
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzn()I

    move-result v0

    .line 11
    invoke-static {v0}, Lcom/google/android/recaptcha/internal/zzfg;->zzU(I)V

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v1

    add-int/2addr v1, v0

    .line 9
    :cond_5
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzo()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v0

    if-lt v0, v1, :cond_5

    :goto_0
    return-void

    .line 16
    :cond_6
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zza()Lcom/google/android/recaptcha/internal/zzgx;

    move-result-object p1

    throw p1

    .line 5
    :cond_7
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzo()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 14
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzC()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 15
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzm()I

    move-result v0

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

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
    instance-of v0, p1, Lcom/google/android/recaptcha/internal/zzgg;

    const/4 v1, 0x5

    const/4 v2, 0x2

    if-eqz v0, :cond_5

    .line 2
    move-object v0, p1

    check-cast v0, Lcom/google/android/recaptcha/internal/zzgg;

    iget p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eq p1, v2, :cond_3

    if-ne p1, v1, :cond_2

    :cond_0
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzc()F

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/recaptcha/internal/zzgg;->zze(F)V

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzC()Z

    move-result p1

    if-eqz p1, :cond_1

    return-void

    :cond_1
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 5
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzm()I

    move-result p1

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    if-eq p1, v1, :cond_0

    iput p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

    return-void

    .line 9
    :cond_2
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zza()Lcom/google/android/recaptcha/internal/zzgx;

    move-result-object p1

    throw p1

    .line 5
    :cond_3
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 6
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzn()I

    move-result p1

    .line 7
    invoke-static {p1}, Lcom/google/android/recaptcha/internal/zzfg;->zzT(I)V

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v1

    add-int v3, v1, p1

    :cond_4
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 8
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzc()F

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/recaptcha/internal/zzgg;->zze(F)V

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result p1

    if-lt p1, v3, :cond_4

    goto :goto_0

    :cond_5
    iget v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eq v0, v2, :cond_9

    if-ne v0, v1, :cond_8

    :cond_6
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 10
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzc()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 11
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzC()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzm()I

    move-result v0

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    if-eq v0, v1, :cond_6

    iput v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

    return-void

    .line 16
    :cond_8
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zza()Lcom/google/android/recaptcha/internal/zzgx;

    move-result-object p1

    throw p1

    .line 12
    :cond_9
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzn()I

    move-result v0

    .line 14
    invoke-static {v0}, Lcom/google/android/recaptcha/internal/zzfg;->zzT(I)V

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v1

    add-int/2addr v1, v0

    .line 9
    :cond_a
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 15
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzc()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v0

    if-lt v0, v1, :cond_a

    :goto_0
    return-void
.end method

.method public final zzC(Ljava/util/List;Lcom/google/android/recaptcha/internal/zzil;Lcom/google/android/recaptcha/internal/zzfz;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    and-int/lit8 v1, v0, 0x7

    const/4 v2, 0x3

    if-ne v1, v2, :cond_3

    :cond_0
    invoke-interface {p2}, Lcom/google/android/recaptcha/internal/zzil;->zze()Ljava/lang/Object;

    move-result-object v1

    .line 2
    invoke-direct {p0, v1, p2, p3}, Lcom/google/android/recaptcha/internal/zzfg;->zzP(Ljava/lang/Object;Lcom/google/android/recaptcha/internal/zzil;Lcom/google/android/recaptcha/internal/zzfz;)V

    .line 3
    invoke-interface {p2, v1}, Lcom/google/android/recaptcha/internal/zzil;->zzf(Ljava/lang/Object;)V

    .line 4
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 5
    invoke-virtual {v1}, Lcom/google/android/recaptcha/internal/zzff;->zzC()Z

    move-result v1

    if-nez v1, :cond_2

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 6
    invoke-virtual {v1}, Lcom/google/android/recaptcha/internal/zzff;->zzm()I

    move-result v1

    if-eq v1, v0, :cond_0

    .line 7
    iput v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

    :cond_2
    :goto_0
    return-void

    :cond_3
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zza()Lcom/google/android/recaptcha/internal/zzgx;

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
    instance-of v0, p1, Lcom/google/android/recaptcha/internal/zzgp;

    const/4 v1, 0x2

    if-eqz v0, :cond_4

    .line 2
    move-object v0, p1

    check-cast v0, Lcom/google/android/recaptcha/internal/zzgp;

    iget p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eqz p1, :cond_2

    if-ne p1, v1, :cond_1

    .line 8
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzn()I

    move-result p1

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzh()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/recaptcha/internal/zzgp;->zzg(I)V

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result p1

    if-lt p1, v1, :cond_0

    .line 5
    invoke-direct {p0, v1}, Lcom/google/android/recaptcha/internal/zzfg;->zzR(I)V

    return-void

    .line 9
    :cond_1
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zza()Lcom/google/android/recaptcha/internal/zzgx;

    move-result-object p1

    throw p1

    .line 2
    :cond_2
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 6
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzh()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/recaptcha/internal/zzgp;->zzg(I)V

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzC()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 8
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzm()I

    move-result p1

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

    return-void

    .line 5
    :cond_4
    iget v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eqz v0, :cond_7

    if-ne v0, v1, :cond_6

    .line 15
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 10
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzn()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v1

    add-int/2addr v1, v0

    :cond_5
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 11
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzh()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v0

    if-lt v0, v1, :cond_5

    .line 12
    invoke-direct {p0, v1}, Lcom/google/android/recaptcha/internal/zzfg;->zzR(I)V

    return-void

    .line 16
    :cond_6
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zza()Lcom/google/android/recaptcha/internal/zzgx;

    move-result-object p1

    throw p1

    .line 5
    :cond_7
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzh()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 14
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzC()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 15
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzm()I

    move-result v0

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

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
    instance-of v0, p1, Lcom/google/android/recaptcha/internal/zzhn;

    const/4 v1, 0x2

    if-eqz v0, :cond_4

    .line 2
    move-object v0, p1

    check-cast v0, Lcom/google/android/recaptcha/internal/zzhn;

    iget p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eqz p1, :cond_2

    if-ne p1, v1, :cond_1

    .line 8
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzn()I

    move-result p1

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzp()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/recaptcha/internal/zzhn;->zzf(J)V

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result p1

    if-lt p1, v1, :cond_0

    .line 5
    invoke-direct {p0, v1}, Lcom/google/android/recaptcha/internal/zzfg;->zzR(I)V

    return-void

    .line 9
    :cond_1
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zza()Lcom/google/android/recaptcha/internal/zzgx;

    move-result-object p1

    throw p1

    .line 2
    :cond_2
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 6
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzp()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/recaptcha/internal/zzhn;->zzf(J)V

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzC()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 8
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzm()I

    move-result p1

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

    return-void

    .line 5
    :cond_4
    iget v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eqz v0, :cond_7

    if-ne v0, v1, :cond_6

    .line 15
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 10
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzn()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v1

    add-int/2addr v1, v0

    :cond_5
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 11
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzp()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v0

    if-lt v0, v1, :cond_5

    .line 12
    invoke-direct {p0, v1}, Lcom/google/android/recaptcha/internal/zzfg;->zzR(I)V

    return-void

    .line 16
    :cond_6
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zza()Lcom/google/android/recaptcha/internal/zzgx;

    move-result-object p1

    throw p1

    .line 5
    :cond_7
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzp()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 14
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzC()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 15
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzm()I

    move-result v0

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

    return-void
.end method

.method public final zzF(Ljava/util/List;Lcom/google/android/recaptcha/internal/zzil;Lcom/google/android/recaptcha/internal/zzfz;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    and-int/lit8 v1, v0, 0x7

    const/4 v2, 0x2

    if-ne v1, v2, :cond_3

    :cond_0
    invoke-interface {p2}, Lcom/google/android/recaptcha/internal/zzil;->zze()Ljava/lang/Object;

    move-result-object v1

    .line 2
    invoke-direct {p0, v1, p2, p3}, Lcom/google/android/recaptcha/internal/zzfg;->zzQ(Ljava/lang/Object;Lcom/google/android/recaptcha/internal/zzil;Lcom/google/android/recaptcha/internal/zzfz;)V

    .line 3
    invoke-interface {p2, v1}, Lcom/google/android/recaptcha/internal/zzil;->zzf(Ljava/lang/Object;)V

    .line 4
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 5
    invoke-virtual {v1}, Lcom/google/android/recaptcha/internal/zzff;->zzC()Z

    move-result v1

    if-nez v1, :cond_2

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 6
    invoke-virtual {v1}, Lcom/google/android/recaptcha/internal/zzff;->zzm()I

    move-result v1

    if-eq v1, v0, :cond_0

    .line 7
    iput v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

    :cond_2
    :goto_0
    return-void

    :cond_3
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zza()Lcom/google/android/recaptcha/internal/zzgx;

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
    instance-of v0, p1, Lcom/google/android/recaptcha/internal/zzgp;

    const/4 v1, 0x5

    const/4 v2, 0x2

    if-eqz v0, :cond_5

    .line 2
    move-object v0, p1

    check-cast v0, Lcom/google/android/recaptcha/internal/zzgp;

    iget p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eq p1, v2, :cond_3

    if-ne p1, v1, :cond_2

    :cond_0
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzk()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/recaptcha/internal/zzgp;->zzg(I)V

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzC()Z

    move-result p1

    if-eqz p1, :cond_1

    return-void

    :cond_1
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 5
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzm()I

    move-result p1

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    if-eq p1, v1, :cond_0

    iput p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

    return-void

    .line 9
    :cond_2
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zza()Lcom/google/android/recaptcha/internal/zzgx;

    move-result-object p1

    throw p1

    .line 5
    :cond_3
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 6
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzn()I

    move-result p1

    .line 7
    invoke-static {p1}, Lcom/google/android/recaptcha/internal/zzfg;->zzT(I)V

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v1

    add-int v3, v1, p1

    :cond_4
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 8
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzk()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/recaptcha/internal/zzgp;->zzg(I)V

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result p1

    if-lt p1, v3, :cond_4

    goto :goto_0

    :cond_5
    iget v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eq v0, v2, :cond_9

    if-ne v0, v1, :cond_8

    :cond_6
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 10
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzk()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 11
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzC()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzm()I

    move-result v0

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    if-eq v0, v1, :cond_6

    iput v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

    return-void

    .line 16
    :cond_8
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zza()Lcom/google/android/recaptcha/internal/zzgx;

    move-result-object p1

    throw p1

    .line 12
    :cond_9
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzn()I

    move-result v0

    .line 14
    invoke-static {v0}, Lcom/google/android/recaptcha/internal/zzfg;->zzT(I)V

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v1

    add-int/2addr v1, v0

    .line 9
    :cond_a
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 15
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzk()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

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
    instance-of v0, p1, Lcom/google/android/recaptcha/internal/zzhn;

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eqz v0, :cond_4

    .line 2
    move-object v0, p1

    check-cast v0, Lcom/google/android/recaptcha/internal/zzhn;

    iget p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eq p1, v2, :cond_2

    if-ne p1, v1, :cond_1

    .line 8
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzn()I

    move-result p1

    .line 4
    invoke-static {p1}, Lcom/google/android/recaptcha/internal/zzfg;->zzU(I)V

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 5
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzt()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/recaptcha/internal/zzhn;->zzf(J)V

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result p1

    if-lt p1, v1, :cond_0

    goto :goto_0

    .line 9
    :cond_1
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zza()Lcom/google/android/recaptcha/internal/zzgx;

    move-result-object p1

    throw p1

    .line 2
    :cond_2
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 6
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzt()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/recaptcha/internal/zzhn;->zzf(J)V

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzC()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 8
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzm()I

    move-result p1

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

    return-void

    .line 5
    :cond_4
    iget v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eq v0, v2, :cond_7

    if-ne v0, v1, :cond_6

    .line 15
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 10
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzn()I

    move-result v0

    .line 11
    invoke-static {v0}, Lcom/google/android/recaptcha/internal/zzfg;->zzU(I)V

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v1

    add-int/2addr v1, v0

    .line 9
    :cond_5
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzt()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v0

    if-lt v0, v1, :cond_5

    :goto_0
    return-void

    .line 16
    :cond_6
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zza()Lcom/google/android/recaptcha/internal/zzgx;

    move-result-object p1

    throw p1

    .line 5
    :cond_7
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzt()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 14
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzC()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 15
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzm()I

    move-result v0

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

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
    instance-of v0, p1, Lcom/google/android/recaptcha/internal/zzgp;

    const/4 v1, 0x2

    if-eqz v0, :cond_4

    .line 2
    move-object v0, p1

    check-cast v0, Lcom/google/android/recaptcha/internal/zzgp;

    iget p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eqz p1, :cond_2

    if-ne p1, v1, :cond_1

    .line 8
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzn()I

    move-result p1

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzl()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/recaptcha/internal/zzgp;->zzg(I)V

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result p1

    if-lt p1, v1, :cond_0

    .line 5
    invoke-direct {p0, v1}, Lcom/google/android/recaptcha/internal/zzfg;->zzR(I)V

    return-void

    .line 9
    :cond_1
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zza()Lcom/google/android/recaptcha/internal/zzgx;

    move-result-object p1

    throw p1

    .line 2
    :cond_2
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 6
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzl()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/recaptcha/internal/zzgp;->zzg(I)V

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzC()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 8
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzm()I

    move-result p1

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

    return-void

    .line 5
    :cond_4
    iget v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eqz v0, :cond_7

    if-ne v0, v1, :cond_6

    .line 15
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 10
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzn()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v1

    add-int/2addr v1, v0

    :cond_5
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 11
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzl()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v0

    if-lt v0, v1, :cond_5

    .line 12
    invoke-direct {p0, v1}, Lcom/google/android/recaptcha/internal/zzfg;->zzR(I)V

    return-void

    .line 16
    :cond_6
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zza()Lcom/google/android/recaptcha/internal/zzgx;

    move-result-object p1

    throw p1

    .line 5
    :cond_7
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzl()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 14
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzC()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 15
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzm()I

    move-result v0

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

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
    instance-of v0, p1, Lcom/google/android/recaptcha/internal/zzhn;

    const/4 v1, 0x2

    if-eqz v0, :cond_4

    .line 2
    move-object v0, p1

    check-cast v0, Lcom/google/android/recaptcha/internal/zzhn;

    iget p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eqz p1, :cond_2

    if-ne p1, v1, :cond_1

    .line 8
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzn()I

    move-result p1

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzu()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/recaptcha/internal/zzhn;->zzf(J)V

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result p1

    if-lt p1, v1, :cond_0

    .line 5
    invoke-direct {p0, v1}, Lcom/google/android/recaptcha/internal/zzfg;->zzR(I)V

    return-void

    .line 9
    :cond_1
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zza()Lcom/google/android/recaptcha/internal/zzgx;

    move-result-object p1

    throw p1

    .line 2
    :cond_2
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 6
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzu()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/recaptcha/internal/zzhn;->zzf(J)V

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzC()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 8
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzm()I

    move-result p1

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

    return-void

    .line 5
    :cond_4
    iget v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eqz v0, :cond_7

    if-ne v0, v1, :cond_6

    .line 15
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 10
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzn()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v1

    add-int/2addr v1, v0

    :cond_5
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 11
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzu()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v0

    if-lt v0, v1, :cond_5

    .line 12
    invoke-direct {p0, v1}, Lcom/google/android/recaptcha/internal/zzfg;->zzR(I)V

    return-void

    .line 16
    :cond_6
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zza()Lcom/google/android/recaptcha/internal/zzgx;

    move-result-object p1

    throw p1

    .line 5
    :cond_7
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzu()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 14
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzC()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 15
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzm()I

    move-result v0

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

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
    iget v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    and-int/lit8 v0, v0, 0x7

    const/4 v1, 0x2

    if-ne v0, v1, :cond_6

    .line 2
    instance-of v0, p1, Lcom/google/android/recaptcha/internal/zzhg;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    if-nez p2, :cond_3

    .line 6
    move-object v0, p1

    check-cast v0, Lcom/google/android/recaptcha/internal/zzhg;

    .line 7
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/recaptcha/internal/zzfg;->zzp()Lcom/google/android/recaptcha/internal/zzez;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/google/android/recaptcha/internal/zzhg;->zzi(Lcom/google/android/recaptcha/internal/zzez;)V

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 8
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzC()Z

    move-result p1

    if-eqz p1, :cond_2

    return-void

    :cond_2
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 9
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzm()I

    move-result p1

    iget p2, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    if-eq p1, p2, :cond_1

    iput p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

    return-void

    :cond_3
    :goto_0
    if-eqz p2, :cond_4

    .line 3
    invoke-virtual {p0}, Lcom/google/android/recaptcha/internal/zzfg;->zzs()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_4
    invoke-virtual {p0}, Lcom/google/android/recaptcha/internal/zzfg;->zzr()Ljava/lang/String;

    move-result-object v0

    :goto_1
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 4
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzC()Z

    move-result v0

    if-eqz v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 5
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzm()I

    move-result v0

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    if-eq v0, v1, :cond_3

    iput v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

    return-void

    .line 1
    :cond_6
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zza()Lcom/google/android/recaptcha/internal/zzgx;

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
    instance-of v0, p1, Lcom/google/android/recaptcha/internal/zzgp;

    const/4 v1, 0x2

    if-eqz v0, :cond_4

    .line 2
    move-object v0, p1

    check-cast v0, Lcom/google/android/recaptcha/internal/zzgp;

    iget p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eqz p1, :cond_2

    if-ne p1, v1, :cond_1

    .line 8
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzn()I

    move-result p1

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzn()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/recaptcha/internal/zzgp;->zzg(I)V

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result p1

    if-lt p1, v1, :cond_0

    .line 5
    invoke-direct {p0, v1}, Lcom/google/android/recaptcha/internal/zzfg;->zzR(I)V

    return-void

    .line 9
    :cond_1
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zza()Lcom/google/android/recaptcha/internal/zzgx;

    move-result-object p1

    throw p1

    .line 2
    :cond_2
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 6
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzn()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/recaptcha/internal/zzgp;->zzg(I)V

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzC()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 8
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzm()I

    move-result p1

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

    return-void

    .line 5
    :cond_4
    iget v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eqz v0, :cond_7

    if-ne v0, v1, :cond_6

    .line 15
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 10
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzn()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v1

    add-int/2addr v1, v0

    :cond_5
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 11
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzn()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v0

    if-lt v0, v1, :cond_5

    .line 12
    invoke-direct {p0, v1}, Lcom/google/android/recaptcha/internal/zzfg;->zzR(I)V

    return-void

    .line 16
    :cond_6
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zza()Lcom/google/android/recaptcha/internal/zzgx;

    move-result-object p1

    throw p1

    .line 5
    :cond_7
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzn()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 14
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzC()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 15
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzm()I

    move-result v0

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

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
    instance-of v0, p1, Lcom/google/android/recaptcha/internal/zzhn;

    const/4 v1, 0x2

    if-eqz v0, :cond_4

    .line 2
    move-object v0, p1

    check-cast v0, Lcom/google/android/recaptcha/internal/zzhn;

    iget p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eqz p1, :cond_2

    if-ne p1, v1, :cond_1

    .line 8
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzn()I

    move-result p1

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzv()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/recaptcha/internal/zzhn;->zzf(J)V

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result p1

    if-lt p1, v1, :cond_0

    .line 5
    invoke-direct {p0, v1}, Lcom/google/android/recaptcha/internal/zzfg;->zzR(I)V

    return-void

    .line 9
    :cond_1
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zza()Lcom/google/android/recaptcha/internal/zzgx;

    move-result-object p1

    throw p1

    .line 2
    :cond_2
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 6
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzv()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/recaptcha/internal/zzhn;->zzf(J)V

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzC()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 8
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzm()I

    move-result p1

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

    return-void

    .line 5
    :cond_4
    iget v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eqz v0, :cond_7

    if-ne v0, v1, :cond_6

    .line 15
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 10
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzn()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v1

    add-int/2addr v1, v0

    :cond_5
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 11
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzv()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v0

    if-lt v0, v1, :cond_5

    .line 12
    invoke-direct {p0, v1}, Lcom/google/android/recaptcha/internal/zzfg;->zzR(I)V

    return-void

    .line 16
    :cond_6
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zza()Lcom/google/android/recaptcha/internal/zzgx;

    move-result-object p1

    throw p1

    .line 5
    :cond_7
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzv()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 14
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzC()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 15
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzm()I

    move-result v0

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

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
    invoke-direct {p0, v0}, Lcom/google/android/recaptcha/internal/zzfg;->zzS(I)V

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzD()Z

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
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzC()Z

    move-result v0

    if-nez v0, :cond_1

    iget v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzc:I

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 2
    invoke-virtual {v1, v0}, Lcom/google/android/recaptcha/internal/zzff;->zzE(I)Z

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
    invoke-direct {p0, v0}, Lcom/google/android/recaptcha/internal/zzfg;->zzS(I)V

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzb()D

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
    invoke-direct {p0, v0}, Lcom/google/android/recaptcha/internal/zzfg;->zzS(I)V

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzc()F

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
    iget v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

    if-eqz v0, :cond_0

    iput v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    const/4 v1, 0x0

    iput v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzm()I

    move-result v0

    iput v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    :goto_0
    if-eqz v0, :cond_2

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzc:I

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

    iget v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

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
    invoke-direct {p0, v0}, Lcom/google/android/recaptcha/internal/zzfg;->zzS(I)V

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzf()I

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
    invoke-direct {p0, v0}, Lcom/google/android/recaptcha/internal/zzfg;->zzS(I)V

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzg()I

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
    invoke-direct {p0, v0}, Lcom/google/android/recaptcha/internal/zzfg;->zzS(I)V

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzh()I

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
    invoke-direct {p0, v0}, Lcom/google/android/recaptcha/internal/zzfg;->zzS(I)V

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzk()I

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
    invoke-direct {p0, v0}, Lcom/google/android/recaptcha/internal/zzfg;->zzS(I)V

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzl()I

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
    invoke-direct {p0, v0}, Lcom/google/android/recaptcha/internal/zzfg;->zzS(I)V

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzn()I

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
    invoke-direct {p0, v0}, Lcom/google/android/recaptcha/internal/zzfg;->zzS(I)V

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzo()J

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
    invoke-direct {p0, v0}, Lcom/google/android/recaptcha/internal/zzfg;->zzS(I)V

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzp()J

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
    invoke-direct {p0, v0}, Lcom/google/android/recaptcha/internal/zzfg;->zzS(I)V

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzt()J

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
    invoke-direct {p0, v0}, Lcom/google/android/recaptcha/internal/zzfg;->zzS(I)V

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzu()J

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
    invoke-direct {p0, v0}, Lcom/google/android/recaptcha/internal/zzfg;->zzS(I)V

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzv()J

    move-result-wide v0

    return-wide v0
.end method

.method public final zzp()Lcom/google/android/recaptcha/internal/zzez;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x2

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/recaptcha/internal/zzfg;->zzS(I)V

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzw()Lcom/google/android/recaptcha/internal/zzez;

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
    invoke-direct {p0, v0}, Lcom/google/android/recaptcha/internal/zzfg;->zzS(I)V

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzx()Ljava/lang/String;

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
    invoke-direct {p0, v0}, Lcom/google/android/recaptcha/internal/zzfg;->zzS(I)V

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzy()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final zzt(Ljava/lang/Object;Lcom/google/android/recaptcha/internal/zzil;Lcom/google/android/recaptcha/internal/zzfz;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x3

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/recaptcha/internal/zzfg;->zzS(I)V

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/recaptcha/internal/zzfg;->zzP(Ljava/lang/Object;Lcom/google/android/recaptcha/internal/zzil;Lcom/google/android/recaptcha/internal/zzfz;)V

    return-void
.end method

.method public final zzu(Ljava/lang/Object;Lcom/google/android/recaptcha/internal/zzil;Lcom/google/android/recaptcha/internal/zzfz;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x2

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/recaptcha/internal/zzfg;->zzS(I)V

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/recaptcha/internal/zzfg;->zzQ(Ljava/lang/Object;Lcom/google/android/recaptcha/internal/zzil;Lcom/google/android/recaptcha/internal/zzfz;)V

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
    instance-of v0, p1, Lcom/google/android/recaptcha/internal/zzeo;

    const/4 v1, 0x2

    if-eqz v0, :cond_4

    .line 2
    move-object v0, p1

    check-cast v0, Lcom/google/android/recaptcha/internal/zzeo;

    iget p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eqz p1, :cond_2

    if-ne p1, v1, :cond_1

    .line 8
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzn()I

    move-result p1

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzD()Z

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/recaptcha/internal/zzeo;->zze(Z)V

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result p1

    if-lt p1, v1, :cond_0

    .line 5
    invoke-direct {p0, v1}, Lcom/google/android/recaptcha/internal/zzfg;->zzR(I)V

    return-void

    .line 9
    :cond_1
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zza()Lcom/google/android/recaptcha/internal/zzgx;

    move-result-object p1

    throw p1

    .line 2
    :cond_2
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 6
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzD()Z

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/recaptcha/internal/zzeo;->zze(Z)V

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzC()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 8
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzm()I

    move-result p1

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

    return-void

    .line 5
    :cond_4
    iget v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eqz v0, :cond_7

    if-ne v0, v1, :cond_6

    .line 15
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 10
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzn()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v1

    add-int/2addr v1, v0

    :cond_5
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 11
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzD()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v0

    if-lt v0, v1, :cond_5

    .line 12
    invoke-direct {p0, v1}, Lcom/google/android/recaptcha/internal/zzfg;->zzR(I)V

    return-void

    .line 16
    :cond_6
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zza()Lcom/google/android/recaptcha/internal/zzgx;

    move-result-object p1

    throw p1

    .line 5
    :cond_7
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzD()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 14
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzC()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 15
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzm()I

    move-result v0

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

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
    iget v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    and-int/lit8 v0, v0, 0x7

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/recaptcha/internal/zzfg;->zzp()Lcom/google/android/recaptcha/internal/zzez;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzC()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    :cond_1
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 3
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzm()I

    move-result v0

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    if-eq v0, v1, :cond_0

    .line 4
    iput v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

    return-void

    :cond_2
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zza()Lcom/google/android/recaptcha/internal/zzgx;

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
    instance-of v0, p1, Lcom/google/android/recaptcha/internal/zzft;

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eqz v0, :cond_4

    .line 2
    move-object v0, p1

    check-cast v0, Lcom/google/android/recaptcha/internal/zzft;

    iget p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eq p1, v2, :cond_2

    if-ne p1, v1, :cond_1

    .line 8
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzn()I

    move-result p1

    .line 4
    invoke-static {p1}, Lcom/google/android/recaptcha/internal/zzfg;->zzU(I)V

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 5
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzb()D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/recaptcha/internal/zzft;->zze(D)V

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result p1

    if-lt p1, v1, :cond_0

    goto :goto_0

    .line 9
    :cond_1
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zza()Lcom/google/android/recaptcha/internal/zzgx;

    move-result-object p1

    throw p1

    .line 2
    :cond_2
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 6
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzb()D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/recaptcha/internal/zzft;->zze(D)V

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzC()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 8
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzm()I

    move-result p1

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

    return-void

    .line 5
    :cond_4
    iget v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eq v0, v2, :cond_7

    if-ne v0, v1, :cond_6

    .line 15
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 10
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzn()I

    move-result v0

    .line 11
    invoke-static {v0}, Lcom/google/android/recaptcha/internal/zzfg;->zzU(I)V

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v1

    add-int/2addr v1, v0

    .line 9
    :cond_5
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzb()D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v0

    if-lt v0, v1, :cond_5

    :goto_0
    return-void

    .line 16
    :cond_6
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zza()Lcom/google/android/recaptcha/internal/zzgx;

    move-result-object p1

    throw p1

    .line 5
    :cond_7
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzb()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 14
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzC()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 15
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzm()I

    move-result v0

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

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
    instance-of v0, p1, Lcom/google/android/recaptcha/internal/zzgp;

    const/4 v1, 0x2

    if-eqz v0, :cond_4

    .line 2
    move-object v0, p1

    check-cast v0, Lcom/google/android/recaptcha/internal/zzgp;

    iget p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eqz p1, :cond_2

    if-ne p1, v1, :cond_1

    .line 8
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzn()I

    move-result p1

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzf()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/recaptcha/internal/zzgp;->zzg(I)V

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result p1

    if-lt p1, v1, :cond_0

    .line 5
    invoke-direct {p0, v1}, Lcom/google/android/recaptcha/internal/zzfg;->zzR(I)V

    return-void

    .line 9
    :cond_1
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zza()Lcom/google/android/recaptcha/internal/zzgx;

    move-result-object p1

    throw p1

    .line 2
    :cond_2
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 6
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzf()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/recaptcha/internal/zzgp;->zzg(I)V

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzC()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 8
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzm()I

    move-result p1

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

    return-void

    .line 5
    :cond_4
    iget v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eqz v0, :cond_7

    if-ne v0, v1, :cond_6

    .line 15
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 10
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzn()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v1

    add-int/2addr v1, v0

    :cond_5
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 11
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzf()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v0

    if-lt v0, v1, :cond_5

    .line 12
    invoke-direct {p0, v1}, Lcom/google/android/recaptcha/internal/zzfg;->zzR(I)V

    return-void

    .line 16
    :cond_6
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zza()Lcom/google/android/recaptcha/internal/zzgx;

    move-result-object p1

    throw p1

    .line 5
    :cond_7
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzf()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 14
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzC()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 15
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzm()I

    move-result v0

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

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
    instance-of v0, p1, Lcom/google/android/recaptcha/internal/zzgp;

    const/4 v1, 0x5

    const/4 v2, 0x2

    if-eqz v0, :cond_5

    .line 2
    move-object v0, p1

    check-cast v0, Lcom/google/android/recaptcha/internal/zzgp;

    iget p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eq p1, v2, :cond_3

    if-ne p1, v1, :cond_2

    :cond_0
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzg()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/recaptcha/internal/zzgp;->zzg(I)V

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzC()Z

    move-result p1

    if-eqz p1, :cond_1

    return-void

    :cond_1
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 5
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzm()I

    move-result p1

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    if-eq p1, v1, :cond_0

    iput p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

    return-void

    .line 9
    :cond_2
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zza()Lcom/google/android/recaptcha/internal/zzgx;

    move-result-object p1

    throw p1

    .line 5
    :cond_3
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 6
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzn()I

    move-result p1

    .line 7
    invoke-static {p1}, Lcom/google/android/recaptcha/internal/zzfg;->zzT(I)V

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v1

    add-int v3, v1, p1

    :cond_4
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 8
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzg()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/recaptcha/internal/zzgp;->zzg(I)V

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result p1

    if-lt p1, v3, :cond_4

    goto :goto_0

    :cond_5
    iget v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eq v0, v2, :cond_9

    if-ne v0, v1, :cond_8

    :cond_6
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 10
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzg()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 11
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzC()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzm()I

    move-result v0

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzb:I

    if-eq v0, v1, :cond_6

    iput v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zzd:I

    return-void

    .line 16
    :cond_8
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgy;->zza()Lcom/google/android/recaptcha/internal/zzgx;

    move-result-object p1

    throw p1

    .line 12
    :cond_9
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzn()I

    move-result v0

    .line 14
    invoke-static {v0}, Lcom/google/android/recaptcha/internal/zzfg;->zzT(I)V

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v1}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v1

    add-int/2addr v1, v0

    .line 9
    :cond_a
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    .line 15
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzg()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzfg;->zza:Lcom/google/android/recaptcha/internal/zzff;

    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzff;->zzd()I

    move-result v0

    if-lt v0, v1, :cond_a

    :goto_0
    return-void
.end method
