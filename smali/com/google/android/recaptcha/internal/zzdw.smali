.class final Lcom/google/android/recaptcha/internal/zzdw;
.super Ljava/lang/Object;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"


# instance fields
.field final zza:I

.field final zzb:I

.field final zzc:I

.field final zzd:I

.field private final zze:Ljava/lang/String;

.field private final zzf:[C

.field private final zzg:[B

.field private final zzh:[Z

.field private final zzi:Z


# direct methods
.method constructor <init>(Ljava/lang/String;[C)V
    .locals 9

    const/16 v0, 0x80

    new-array v1, v0, [B

    const/4 v2, -0x1

    .line 1
    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([BB)V

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 2
    :goto_0
    array-length v5, p2

    if-ge v4, v5, :cond_2

    .line 3
    aget-char v5, p2, v4

    const/4 v6, 0x1

    if-ge v5, v0, :cond_0

    const/4 v7, 0x1

    goto :goto_1

    :cond_0
    const/4 v7, 0x0

    :goto_1
    const-string v8, "Non-ASCII character: %s"

    .line 4
    invoke-static {v7, v8, v5}, Lcom/google/android/recaptcha/internal/zzdi;->zzc(ZLjava/lang/String;C)V

    .line 5
    aget-byte v7, v1, v5

    if-ne v7, v2, :cond_1

    goto :goto_2

    :cond_1
    const/4 v6, 0x0

    :goto_2
    const-string v7, "Duplicate character: %s"

    invoke-static {v6, v7, v5}, Lcom/google/android/recaptcha/internal/zzdi;->zzc(ZLjava/lang/String;C)V

    int-to-byte v6, v4

    .line 6
    aput-byte v6, v1, v5

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 7
    :cond_2
    invoke-direct {p0, p1, p2, v1, v3}, Lcom/google/android/recaptcha/internal/zzdw;-><init>(Ljava/lang/String;[C[BZ)V

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;[C[BZ)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/recaptcha/internal/zzdw;->zze:Ljava/lang/String;

    if-eqz p2, :cond_1

    iput-object p2, p0, Lcom/google/android/recaptcha/internal/zzdw;->zzf:[C

    :try_start_0
    array-length p1, p2

    .line 8
    sget-object p4, Ljava/math/RoundingMode;->UNNECESSARY:Ljava/math/RoundingMode;

    invoke-static {p1, p4}, Lcom/google/android/recaptcha/internal/zzed;->zzb(ILjava/math/RoundingMode;)I

    move-result p4

    iput p4, p0, Lcom/google/android/recaptcha/internal/zzdw;->zzb:I
    :try_end_0
    .catch Ljava/lang/ArithmeticException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    invoke-static {p4}, Ljava/lang/Integer;->numberOfTrailingZeros(I)I

    move-result p2

    rsub-int/lit8 p4, p2, 0x3

    const/4 v0, 0x1

    shl-int p4, v0, p4

    iput p4, p0, Lcom/google/android/recaptcha/internal/zzdw;->zzc:I

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzdw;->zzb:I

    shr-int p2, v1, p2

    iput p2, p0, Lcom/google/android/recaptcha/internal/zzdw;->zzd:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/google/android/recaptcha/internal/zzdw;->zza:I

    iput-object p3, p0, Lcom/google/android/recaptcha/internal/zzdw;->zzg:[B

    .line 11
    new-array p1, p4, [Z

    const/4 p2, 0x0

    const/4 p3, 0x0

    :goto_0
    iget p4, p0, Lcom/google/android/recaptcha/internal/zzdw;->zzd:I

    if-ge p3, p4, :cond_0

    mul-int/lit8 p4, p3, 0x8

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzdw;->zzb:I

    sget-object v2, Ljava/math/RoundingMode;->CEILING:Ljava/math/RoundingMode;

    .line 12
    invoke-static {p4, v1, v2}, Lcom/google/android/recaptcha/internal/zzed;->zza(IILjava/math/RoundingMode;)I

    move-result p4

    aput-boolean v0, p1, p4

    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    .line 13
    :cond_0
    iput-object p1, p0, Lcom/google/android/recaptcha/internal/zzdw;->zzh:[Z

    iput-boolean p2, p0, Lcom/google/android/recaptcha/internal/zzdw;->zzi:Z

    return-void

    :catch_0
    move-exception p1

    .line 12
    array-length p2, p2

    new-instance p3, Ljava/lang/IllegalArgumentException;

    new-instance p4, Ljava/lang/StringBuilder;

    .line 9
    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Illegal alphabet length "

    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p3, p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p3

    :cond_1
    const/4 p1, 0x0

    .line 13
    throw p1
.end method

.method static bridge synthetic zze(Lcom/google/android/recaptcha/internal/zzdw;)[C
    .locals 0

    iget-object p0, p0, Lcom/google/android/recaptcha/internal/zzdw;->zzf:[C

    return-object p0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/CheckForNull;
        .end annotation
    .end param

    .line 1
    instance-of v0, p1, Lcom/google/android/recaptcha/internal/zzdw;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2
    check-cast p1, Lcom/google/android/recaptcha/internal/zzdw;

    .line 3
    iget-boolean v0, p1, Lcom/google/android/recaptcha/internal/zzdw;->zzi:Z

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzdw;->zzf:[C

    iget-object p1, p1, Lcom/google/android/recaptcha/internal/zzdw;->zzf:[C

    invoke-static {v0, p1}, Ljava/util/Arrays;->equals([C[C)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    return v1
.end method

.method public final hashCode()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzdw;->zzf:[C

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([C)I

    move-result v0

    add-int/lit16 v0, v0, 0x4d5

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzdw;->zze:Ljava/lang/String;

    return-object v0
.end method

.method final zza(I)C
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzdw;->zzf:[C

    aget-char p1, v0, p1

    return p1
.end method

.method final zzb(C)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/recaptcha/internal/zzdz;
        }
    .end annotation

    const-string v0, "Unrecognized character: 0x"

    const/16 v1, 0x7f

    if-gt p1, v1, :cond_3

    .line 1
    iget-object v2, p0, Lcom/google/android/recaptcha/internal/zzdw;->zzg:[B

    aget-byte v2, v2, p1

    const/4 v3, -0x1

    if-ne v2, v3, :cond_2

    const/16 v2, 0x20

    if-le p1, v2, :cond_1

    if-ne p1, v1, :cond_0

    goto :goto_0

    .line 2
    :cond_0
    new-instance v0, Lcom/google/android/recaptcha/internal/zzdz;

    new-instance v1, Ljava/lang/StringBuilder;

    .line 3
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unrecognized character: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/google/android/recaptcha/internal/zzdz;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1
    :cond_1
    :goto_0
    new-instance v1, Lcom/google/android/recaptcha/internal/zzdz;

    .line 2
    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Lcom/google/android/recaptcha/internal/zzdz;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_2
    return v2

    .line 1
    :cond_3
    new-instance v1, Lcom/google/android/recaptcha/internal/zzdz;

    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Lcom/google/android/recaptcha/internal/zzdz;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method final zzc(I)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzdw;->zzh:[Z

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzdw;->zzc:I

    rem-int/2addr p1, v1

    aget-boolean p1, v0, p1

    return p1
.end method

.method public final zzd(C)Z
    .locals 1

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzdw;->zzg:[B

    const/16 v0, 0x3d

    aget-byte p1, p1, v0

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
