.class public final Lcom/google/android/recaptcha/internal/zzco;
.super Ljava/lang/Object;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"

# interfaces
.implements Lcom/google/android/recaptcha/internal/zzby;


# static fields
.field public static final zza:Lcom/google/android/recaptcha/internal/zzco;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/recaptcha/internal/zzco;

    invoke-direct {v0}, Lcom/google/android/recaptcha/internal/zzco;-><init>()V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzco;->zza:Lcom/google/android/recaptcha/internal/zzco;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final varargs zza(ILcom/google/android/recaptcha/internal/zzbl;[Ljava/lang/Object;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/recaptcha/internal/zzt;
        }
    .end annotation

    .line 1
    array-length v0, p3

    const/4 v1, 0x4

    const/4 v2, 0x0

    const/4 v3, 0x2

    if-ne v0, v3, :cond_4

    const/4 v0, 0x0

    .line 2
    aget-object v0, p3, v0

    .line 3
    instance-of v3, v0, Ljava/lang/Object;

    const/4 v4, 0x1

    if-eq v4, v3, :cond_0

    move-object v0, v2

    :cond_0
    const/4 v3, 0x5

    if-eqz v0, :cond_3

    .line 5
    aget-object p3, p3, v4

    .line 6
    instance-of v5, p3, Ljava/lang/Object;

    if-eq v4, v5, :cond_1

    move-object p3, v2

    :cond_1
    if-eqz p3, :cond_2

    invoke-virtual {p2}, Lcom/google/android/recaptcha/internal/zzbl;->zzc()Lcom/google/android/recaptcha/internal/zzbm;

    move-result-object p2

    .line 8
    invoke-virtual {p0, v0, p3}, Lcom/google/android/recaptcha/internal/zzco;->zzb(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    invoke-virtual {p2, p1, p3}, Lcom/google/android/recaptcha/internal/zzbm;->zzf(ILjava/lang/Object;)V

    return-void

    .line 6
    :cond_2
    new-instance p1, Lcom/google/android/recaptcha/internal/zzt;

    .line 7
    invoke-direct {p1, v1, v3, v2}, Lcom/google/android/recaptcha/internal/zzt;-><init>(IILjava/lang/Throwable;)V

    .line 6
    throw p1

    .line 3
    :cond_3
    new-instance p1, Lcom/google/android/recaptcha/internal/zzt;

    .line 4
    invoke-direct {p1, v1, v3, v2}, Lcom/google/android/recaptcha/internal/zzt;-><init>(IILjava/lang/Throwable;)V

    .line 3
    throw p1

    .line 8
    :cond_4
    new-instance p1, Lcom/google/android/recaptcha/internal/zzt;

    const/4 p2, 0x3

    .line 9
    invoke-direct {p1, v1, p2, v2}, Lcom/google/android/recaptcha/internal/zzt;-><init>(IILjava/lang/Throwable;)V

    .line 10
    throw p1
.end method

.method public final zzb(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/recaptcha/internal/zzt;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Ljava/lang/Byte;

    if-eqz v0, :cond_0

    instance-of v1, p2, Ljava/lang/Byte;

    if-eqz v1, :cond_0

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->byteValue()B

    move-result p1

    check-cast p2, Ljava/lang/Number;

    invoke-virtual {p2}, Ljava/lang/Number;->byteValue()B

    move-result p2

    xor-int/2addr p1, p2

    int-to-byte p1, p1

    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    goto/16 :goto_e

    .line 2
    :cond_0
    instance-of v1, p1, Ljava/lang/Short;

    if-eqz v1, :cond_1

    instance-of v2, p2, Ljava/lang/Short;

    if-eqz v2, :cond_1

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->shortValue()S

    move-result p1

    check-cast p2, Ljava/lang/Number;

    invoke-virtual {p2}, Ljava/lang/Number;->shortValue()S

    move-result p2

    xor-int/2addr p1, p2

    int-to-short p1, p1

    invoke-static {p1}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object p1

    goto/16 :goto_e

    .line 3
    :cond_1
    instance-of v2, p1, Ljava/lang/Integer;

    if-eqz v2, :cond_2

    instance-of v3, p2, Ljava/lang/Integer;

    if-eqz v3, :cond_2

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    check-cast p2, Ljava/lang/Number;

    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    move-result p2

    xor-int/2addr p1, p2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    goto/16 :goto_e

    .line 4
    :cond_2
    instance-of v3, p1, Ljava/lang/Long;

    if-eqz v3, :cond_3

    instance-of v4, p2, Ljava/lang/Long;

    if-eqz v4, :cond_3

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    check-cast p2, Ljava/lang/Number;

    invoke-virtual {p2}, Ljava/lang/Number;->longValue()J

    move-result-wide p1

    xor-long/2addr p1, v0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    goto/16 :goto_e

    .line 5
    :cond_3
    instance-of v4, p1, Ljava/lang/String;

    const/4 v5, 0x0

    if-eqz v4, :cond_7

    instance-of v4, p2, Ljava/lang/Byte;

    if-eqz v4, :cond_5

    .line 93
    check-cast p1, Ljava/lang/String;

    sget-object v0, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    new-instance v0, Ljava/util/ArrayList;

    .line 94
    array-length v1, p1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    :goto_0
    if-ge v5, v1, :cond_4

    .line 95
    aget-byte v2, p1, v5

    .line 93
    move-object v3, p2

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->byteValue()B

    move-result v3

    xor-int/2addr v2, v3

    int-to-byte v2, v2

    invoke-static {v2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v2

    .line 96
    invoke-interface {v0, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 93
    :cond_4
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->toByteArray(Ljava/util/Collection;)[B

    move-result-object p1

    check-cast p1, Ljava/io/Serializable;

    goto/16 :goto_e

    .line 6
    :cond_5
    instance-of v4, p2, Ljava/lang/Integer;

    if-eqz v4, :cond_7

    .line 89
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object p1

    new-instance v0, Ljava/util/ArrayList;

    .line 90
    array-length v1, p1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    :goto_1
    if-ge v5, v1, :cond_6

    .line 91
    aget-char v2, p1, v5

    .line 89
    move-object v3, p2

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    move-result v3

    xor-int/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 92
    invoke-interface {v0, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 89
    :cond_6
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->toIntArray(Ljava/util/Collection;)[I

    move-result-object p1

    check-cast p1, Ljava/io/Serializable;

    goto/16 :goto_e

    :cond_7
    if-eqz v0, :cond_9

    .line 7
    instance-of v0, p2, [B

    if-eqz v0, :cond_9

    .line 84
    check-cast p2, [B

    array-length v0, p2

    new-instance v1, Ljava/util/ArrayList;

    .line 85
    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v2, 0x0

    :goto_2
    if-ge v2, v0, :cond_8

    .line 86
    aget-byte v3, p2, v2

    .line 84
    move-object v4, p1

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->byteValue()B

    move-result v4

    xor-int/2addr v3, v4

    int-to-byte v3, v3

    invoke-static {v3}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v3

    .line 87
    invoke-interface {v1, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_8
    new-array p1, v5, [Ljava/lang/Byte;

    .line 88
    invoke-interface {v1, p1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/io/Serializable;

    goto/16 :goto_e

    :cond_9
    if-eqz v1, :cond_b

    .line 8
    instance-of v0, p2, [S

    if-eqz v0, :cond_b

    .line 79
    check-cast p2, [S

    array-length v0, p2

    new-instance v1, Ljava/util/ArrayList;

    .line 80
    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v2, 0x0

    :goto_3
    if-ge v2, v0, :cond_a

    .line 81
    aget-short v3, p2, v2

    .line 79
    move-object v4, p1

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->shortValue()S

    move-result v4

    xor-int/2addr v3, v4

    int-to-short v3, v3

    invoke-static {v3}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v3

    .line 82
    invoke-interface {v1, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    :cond_a
    new-array p1, v5, [Ljava/lang/Short;

    .line 83
    invoke-interface {v1, p1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/io/Serializable;

    goto/16 :goto_e

    :cond_b
    if-eqz v2, :cond_d

    .line 9
    instance-of v0, p2, [I

    if-eqz v0, :cond_d

    .line 74
    check-cast p2, [I

    array-length v0, p2

    new-instance v1, Ljava/util/ArrayList;

    .line 75
    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v2, 0x0

    :goto_4
    if-ge v2, v0, :cond_c

    .line 76
    aget v3, p2, v2

    .line 74
    move-object v4, p1

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->intValue()I

    move-result v4

    xor-int/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 77
    invoke-interface {v1, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    :cond_c
    new-array p1, v5, [Ljava/lang/Integer;

    .line 78
    invoke-interface {v1, p1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/io/Serializable;

    goto/16 :goto_e

    :cond_d
    if-eqz v3, :cond_f

    .line 10
    instance-of v0, p2, [J

    if-eqz v0, :cond_f

    .line 69
    check-cast p2, [J

    array-length v0, p2

    new-instance v1, Ljava/util/ArrayList;

    .line 70
    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v2, 0x0

    :goto_5
    if-ge v2, v0, :cond_e

    .line 71
    aget-wide v3, p2, v2

    .line 69
    move-object v6, p1

    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->longValue()J

    move-result-wide v6

    xor-long/2addr v3, v6

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    .line 72
    invoke-interface {v1, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    :cond_e
    new-array p1, v5, [Ljava/lang/Long;

    .line 73
    invoke-interface {v1, p1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/io/Serializable;

    goto/16 :goto_e

    .line 11
    :cond_f
    instance-of v0, p1, [B

    if-eqz v0, :cond_11

    instance-of v1, p2, Ljava/lang/Byte;

    if-eqz v1, :cond_11

    .line 64
    check-cast p1, [B

    array-length v0, p1

    new-instance v1, Ljava/util/ArrayList;

    .line 65
    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v2, 0x0

    :goto_6
    if-ge v2, v0, :cond_10

    .line 66
    aget-byte v3, p1, v2

    .line 64
    move-object v4, p2

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->byteValue()B

    move-result v4

    xor-int/2addr v3, v4

    int-to-byte v3, v3

    invoke-static {v3}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v3

    .line 67
    invoke-interface {v1, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_10
    new-array p1, v5, [Ljava/lang/Byte;

    .line 68
    invoke-interface {v1, p1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/io/Serializable;

    goto/16 :goto_e

    .line 12
    :cond_11
    instance-of v1, p1, [S

    if-eqz v1, :cond_13

    instance-of v2, p2, Ljava/lang/Short;

    if-eqz v2, :cond_13

    .line 59
    check-cast p1, [S

    array-length v0, p1

    new-instance v1, Ljava/util/ArrayList;

    .line 60
    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v2, 0x0

    :goto_7
    if-ge v2, v0, :cond_12

    .line 61
    aget-short v3, p1, v2

    .line 59
    move-object v4, p2

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->shortValue()S

    move-result v4

    xor-int/2addr v3, v4

    int-to-short v3, v3

    invoke-static {v3}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v3

    .line 62
    invoke-interface {v1, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    :cond_12
    new-array p1, v5, [Ljava/lang/Short;

    .line 63
    invoke-interface {v1, p1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/io/Serializable;

    goto/16 :goto_e

    .line 13
    :cond_13
    instance-of v2, p1, [I

    if-eqz v2, :cond_15

    instance-of v3, p2, Ljava/lang/Integer;

    if-eqz v3, :cond_15

    .line 54
    check-cast p1, [I

    array-length v0, p1

    new-instance v1, Ljava/util/ArrayList;

    .line 55
    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v2, 0x0

    :goto_8
    if-ge v2, v0, :cond_14

    .line 56
    aget v3, p1, v2

    .line 54
    move-object v4, p2

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->intValue()I

    move-result v4

    xor-int/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 57
    invoke-interface {v1, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_14
    new-array p1, v5, [Ljava/lang/Integer;

    .line 58
    invoke-interface {v1, p1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/io/Serializable;

    goto/16 :goto_e

    .line 14
    :cond_15
    instance-of v3, p1, [J

    if-eqz v3, :cond_17

    instance-of v4, p2, Ljava/lang/Long;

    if-eqz v4, :cond_17

    .line 49
    check-cast p1, [J

    array-length v0, p1

    new-instance v1, Ljava/util/ArrayList;

    .line 50
    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v2, 0x0

    :goto_9
    if-ge v2, v0, :cond_16

    .line 51
    aget-wide v3, p1, v2

    .line 49
    move-object v6, p2

    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->longValue()J

    move-result-wide v6

    xor-long/2addr v3, v6

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    .line 52
    invoke-interface {v1, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    :cond_16
    new-array p1, v5, [Ljava/lang/Long;

    .line 53
    invoke-interface {v1, p1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/io/Serializable;

    goto/16 :goto_e

    :cond_17
    const/16 v4, 0xa

    if-eqz v0, :cond_19

    .line 15
    instance-of v0, p2, [B

    if-eqz v0, :cond_19

    .line 42
    check-cast p1, [B

    array-length v0, p1

    check-cast p2, [B

    array-length v1, p2

    .line 43
    invoke-static {p0, v0, v1}, Lcom/google/android/recaptcha/internal/zzbx;->zzb(Lcom/google/android/recaptcha/internal/zzby;II)V

    .line 44
    invoke-static {v5, v0}, Lkotlin/ranges/RangesKt;->until(II)Lkotlin/ranges/IntRange;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    .line 45
    invoke-static {v0, v4}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 46
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_18

    move-object v2, v0

    check-cast v2, Lkotlin/collections/IntIterator;

    invoke-virtual {v2}, Lkotlin/collections/IntIterator;->nextInt()I

    move-result v2

    .line 44
    aget-byte v3, p1, v2

    aget-byte v2, p2, v2

    xor-int/2addr v2, v3

    int-to-byte v2, v2

    invoke-static {v2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v2

    .line 47
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_a

    :cond_18
    new-array p1, v5, [Ljava/lang/Byte;

    .line 48
    invoke-interface {v1, p1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/io/Serializable;

    goto/16 :goto_e

    :cond_19
    if-eqz v1, :cond_1b

    .line 16
    instance-of v0, p2, [S

    if-eqz v0, :cond_1b

    .line 35
    check-cast p1, [S

    array-length v0, p1

    check-cast p2, [S

    array-length v1, p2

    .line 36
    invoke-static {p0, v0, v1}, Lcom/google/android/recaptcha/internal/zzbx;->zzb(Lcom/google/android/recaptcha/internal/zzby;II)V

    .line 37
    invoke-static {v5, v0}, Lkotlin/ranges/RangesKt;->until(II)Lkotlin/ranges/IntRange;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    .line 38
    invoke-static {v0, v4}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 39
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    move-object v2, v0

    check-cast v2, Lkotlin/collections/IntIterator;

    invoke-virtual {v2}, Lkotlin/collections/IntIterator;->nextInt()I

    move-result v2

    .line 37
    aget-short v3, p1, v2

    aget-short v2, p2, v2

    xor-int/2addr v2, v3

    int-to-short v2, v2

    invoke-static {v2}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v2

    .line 40
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_b

    :cond_1a
    new-array p1, v5, [Ljava/lang/Short;

    .line 41
    invoke-interface {v1, p1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/io/Serializable;

    goto/16 :goto_e

    :cond_1b
    if-eqz v2, :cond_1d

    .line 17
    instance-of v0, p2, [I

    if-eqz v0, :cond_1d

    .line 28
    check-cast p1, [I

    array-length v0, p1

    check-cast p2, [I

    array-length v1, p2

    .line 29
    invoke-static {p0, v0, v1}, Lcom/google/android/recaptcha/internal/zzbx;->zzb(Lcom/google/android/recaptcha/internal/zzby;II)V

    .line 30
    invoke-static {v5, v0}, Lkotlin/ranges/RangesKt;->until(II)Lkotlin/ranges/IntRange;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    .line 31
    invoke-static {v0, v4}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 32
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c

    move-object v2, v0

    check-cast v2, Lkotlin/collections/IntIterator;

    invoke-virtual {v2}, Lkotlin/collections/IntIterator;->nextInt()I

    move-result v2

    .line 30
    aget v3, p1, v2

    aget v2, p2, v2

    xor-int/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 33
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_c

    :cond_1c
    new-array p1, v5, [Ljava/lang/Integer;

    .line 34
    invoke-interface {v1, p1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/io/Serializable;

    goto :goto_e

    :cond_1d
    if-eqz v3, :cond_1f

    .line 18
    instance-of v0, p2, [J

    if-eqz v0, :cond_1f

    .line 21
    check-cast p1, [J

    array-length v0, p1

    check-cast p2, [J

    array-length v1, p2

    .line 22
    invoke-static {p0, v0, v1}, Lcom/google/android/recaptcha/internal/zzbx;->zzb(Lcom/google/android/recaptcha/internal/zzby;II)V

    .line 23
    invoke-static {v5, v0}, Lkotlin/ranges/RangesKt;->until(II)Lkotlin/ranges/IntRange;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    .line 24
    invoke-static {v0, v4}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 25
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1e

    move-object v2, v0

    check-cast v2, Lkotlin/collections/IntIterator;

    invoke-virtual {v2}, Lkotlin/collections/IntIterator;->nextInt()I

    move-result v2

    .line 23
    aget-wide v3, p1, v2

    aget-wide v6, p2, v2

    xor-long v2, v3, v6

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    .line 26
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_d

    :cond_1e
    new-array p1, v5, [Ljava/lang/Long;

    .line 27
    invoke-interface {v1, p1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/io/Serializable;

    :goto_e
    return-object p1

    .line 26
    :cond_1f
    new-instance p1, Lcom/google/android/recaptcha/internal/zzt;

    const/4 p2, 0x4

    const/4 v0, 0x5

    const/4 v1, 0x0

    .line 19
    invoke-direct {p1, p2, v0, v1}, Lcom/google/android/recaptcha/internal/zzt;-><init>(IILjava/lang/Throwable;)V

    .line 20
    throw p1
.end method
