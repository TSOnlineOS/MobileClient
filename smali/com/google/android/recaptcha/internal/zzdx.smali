.class final Lcom/google/android/recaptcha/internal/zzdx;
.super Lcom/google/android/recaptcha/internal/zzea;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"


# instance fields
.field final zza:[C


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance p1, Lcom/google/android/recaptcha/internal/zzdw;

    const-string p2, "0123456789ABCDEF"

    invoke-virtual {p2}, Ljava/lang/String;->toCharArray()[C

    move-result-object p2

    const-string v0, "base16()"

    invoke-direct {p1, v0, p2}, Lcom/google/android/recaptcha/internal/zzdw;-><init>(Ljava/lang/String;[C)V

    const/4 p2, 0x0

    .line 2
    invoke-direct {p0, p1, p2}, Lcom/google/android/recaptcha/internal/zzea;-><init>(Lcom/google/android/recaptcha/internal/zzdw;Ljava/lang/Character;)V

    const/16 p2, 0x200

    new-array p2, p2, [C

    iput-object p2, p0, Lcom/google/android/recaptcha/internal/zzdx;->zza:[C

    invoke-static {p1}, Lcom/google/android/recaptcha/internal/zzdw;->zze(Lcom/google/android/recaptcha/internal/zzdw;)[C

    move-result-object p2

    array-length p2, p2

    const/4 v0, 0x0

    const/16 v1, 0x10

    if-ne p2, v1, :cond_0

    const/4 p2, 0x1

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    .line 3
    :goto_0
    invoke-static {p2}, Lcom/google/android/recaptcha/internal/zzdi;->zza(Z)V

    :goto_1
    const/16 p2, 0x100

    if-ge v0, p2, :cond_1

    iget-object p2, p0, Lcom/google/android/recaptcha/internal/zzdx;->zza:[C

    ushr-int/lit8 v1, v0, 0x4

    .line 4
    invoke-virtual {p1, v1}, Lcom/google/android/recaptcha/internal/zzdw;->zza(I)C

    move-result v1

    aput-char v1, p2, v0

    iget-object p2, p0, Lcom/google/android/recaptcha/internal/zzdx;->zza:[C

    or-int/lit16 v1, v0, 0x100

    and-int/lit8 v2, v0, 0xf

    .line 5
    invoke-virtual {p1, v2}, Lcom/google/android/recaptcha/internal/zzdw;->zza(I)C

    move-result v2

    aput-char v2, p2, v1

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    return-void
.end method


# virtual methods
.method final zza([BLjava/lang/CharSequence;)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/recaptcha/internal/zzdz;
        }
    .end annotation

    if-eqz p1, :cond_2

    .line 1
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    move-result v0

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 2
    :goto_0
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-ge v0, v2, :cond_0

    iget-object v2, p0, Lcom/google/android/recaptcha/internal/zzdx;->zzb:Lcom/google/android/recaptcha/internal/zzdw;

    .line 3
    invoke-interface {p2, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-virtual {v2, v3}, Lcom/google/android/recaptcha/internal/zzdw;->zzb(C)I

    move-result v2

    shl-int/lit8 v2, v2, 0x4

    iget-object v3, p0, Lcom/google/android/recaptcha/internal/zzdx;->zzb:Lcom/google/android/recaptcha/internal/zzdw;

    add-int/lit8 v4, v0, 0x1

    invoke-interface {p2, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    invoke-virtual {v3, v4}, Lcom/google/android/recaptcha/internal/zzdw;->zzb(C)I

    move-result v3

    or-int/2addr v2, v3

    add-int/lit8 v3, v1, 0x1

    int-to-byte v2, v2

    .line 4
    aput-byte v2, p1, v1

    add-int/lit8 v0, v0, 0x2

    move v1, v3

    goto :goto_0

    :cond_0
    return v1

    :cond_1
    new-instance p1, Lcom/google/android/recaptcha/internal/zzdz;

    .line 5
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    move-result p2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Invalid input length "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/google/android/recaptcha/internal/zzdz;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    const/4 p1, 0x0

    .line 6
    throw p1
.end method

.method final zzb(Ljava/lang/Appendable;[BII)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    array-length p3, p2

    const/4 v0, 0x0

    invoke-static {v0, p4, p3}, Lcom/google/android/recaptcha/internal/zzdi;->zzd(III)V

    :goto_0
    if-ge v0, p4, :cond_0

    .line 2
    aget-byte p3, p2, v0

    and-int/lit16 p3, p3, 0xff

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzdx;->zza:[C

    aget-char v1, v1, p3

    .line 3
    invoke-interface {p1, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzdx;->zza:[C

    or-int/lit16 p3, p3, 0x100

    aget-char p3, v1, p3

    .line 4
    invoke-interface {p1, p3}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
