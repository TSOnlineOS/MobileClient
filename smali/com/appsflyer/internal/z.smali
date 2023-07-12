.class public final Lcom/appsflyer/internal/z;
.super Ljava/io/FilterInputStream;
.source ""


# static fields
.field private static final ˏ:S


# instance fields
.field private ʻ:I

.field private ʼ:I

.field private ʽ:I

.field private ˊ:[I

.field private ˋ:[I

.field private ˎ:I

.field private ˏॱ:I

.field private ͺ:I

.field private ॱ:[I

.field private ॱॱ:I

.field private ᐝ:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    const-wide/high16 v0, 0x4014000000000000L    # 5.0

    .line 25
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    sub-double/2addr v0, v2

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    const-wide/high16 v4, 0x402e000000000000L    # 15.0

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    mul-double v0, v0, v2

    double-to-int v0, v0

    int-to-short v0, v0

    sput-short v0, Lcom/appsflyer/internal/z;->ˏ:S

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;[II[BII)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 60
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    const/16 p1, 0x8

    new-array v0, p1, [I

    .line 61
    iput-object v0, p0, Lcom/appsflyer/internal/z;->ˊ:[I

    new-array v0, p1, [I

    .line 62
    iput-object v0, p0, Lcom/appsflyer/internal/z;->ˋ:[I

    new-array v0, p1, [I

    .line 63
    iput-object v0, p0, Lcom/appsflyer/internal/z;->ॱ:[I

    .line 64
    iput p1, p0, Lcom/appsflyer/internal/z;->ˎ:I

    const/4 p1, 0x5

    .line 67
    invoke-static {p5, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    const/16 p5, 0x10

    invoke-static {p1, p5}, Ljava/lang/Math;->min(II)I

    move-result p1

    iput p1, p0, Lcom/appsflyer/internal/z;->ʽ:I

    .line 68
    iput p6, p0, Lcom/appsflyer/internal/z;->ॱॱ:I

    const/4 p1, 0x3

    if-ne p6, p1, :cond_0

    .line 71
    invoke-static {p4}, Lcom/appsflyer/internal/z;->ॱ([B)[I

    move-result-object p4

    iput-object p4, p0, Lcom/appsflyer/internal/z;->ˋ:[I

    :cond_0
    const/4 p4, 0x0

    .line 73
    aget p4, p2, p4

    int-to-long p4, p4

    const-wide v0, 0xffffffffL

    and-long/2addr p4, v0

    const/16 p6, 0x20

    shl-long/2addr p4, p6

    const/4 v2, 0x1

    aget p2, p2, v2

    int-to-long v2, p2

    and-long/2addr v0, v2

    or-long/2addr p4, v0

    if-nez p3, :cond_1

    long-to-int p2, p4

    .line 1189
    iput p2, p0, Lcom/appsflyer/internal/z;->ʻ:I

    shr-long p1, p4, p1

    .line 1190
    sget-short p3, Lcom/appsflyer/internal/z;->ˏ:S

    int-to-long v0, p3

    mul-long v0, v0, p1

    shr-long/2addr v0, p6

    long-to-int v1, v0

    iput v1, p0, Lcom/appsflyer/internal/z;->ʼ:I

    shr-long/2addr p4, p6

    long-to-int p5, p4

    .line 1191
    iput p5, p0, Lcom/appsflyer/internal/z;->ͺ:I

    int-to-long p3, p3

    add-long/2addr p1, p3

    long-to-int p2, p1

    .line 1192
    iput p2, p0, Lcom/appsflyer/internal/z;->ˏॱ:I

    goto :goto_0

    :cond_1
    long-to-int p1, p4

    .line 1180
    iput p1, p0, Lcom/appsflyer/internal/z;->ʻ:I

    mul-int p2, p1, p3

    .line 1181
    iput p2, p0, Lcom/appsflyer/internal/z;->ʼ:I

    xor-int/2addr p1, p3

    .line 1182
    iput p1, p0, Lcom/appsflyer/internal/z;->ͺ:I

    shr-long p1, p4, p6

    long-to-int p2, p1

    .line 1183
    iput p2, p0, Lcom/appsflyer/internal/z;->ˏॱ:I

    .line 75
    :goto_0
    iget-object p1, p0, Ljava/io/FilterInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    move-result p1

    iput p1, p0, Lcom/appsflyer/internal/z;->ᐝ:I

    return-void
.end method

.method private static ॱ([B)[I
    .locals 4

    .line 250
    array-length v0, p0

    .line 251
    new-array v1, v0, [I

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    .line 254
    aget-byte v3, p0, v2

    and-int/lit16 v3, v3, 0xff

    aput v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v1
.end method


# virtual methods
.method public final available()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 156
    iget v0, p0, Lcom/appsflyer/internal/z;->ˎ:I

    rsub-int/lit8 v0, v0, 0x8

    return v0
.end method

.method public final markSupported()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public final read()I
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v0, p0

    .line 1266
    iget v1, v0, Lcom/appsflyer/internal/z;->ˎ:I

    const/16 v2, 0x8

    if-ne v1, v2, :cond_7

    .line 1271
    iget v1, v0, Lcom/appsflyer/internal/z;->ᐝ:I

    const/4 v3, -0x1

    const/4 v4, 0x0

    if-ne v1, v3, :cond_0

    .line 1273
    iget-object v1, v0, Lcom/appsflyer/internal/z;->ˊ:[I

    invoke-static {v1, v3}, Ljava/util/Arrays;->fill([II)V

    goto/16 :goto_3

    .line 1279
    :cond_0
    iget-object v5, v0, Lcom/appsflyer/internal/z;->ˊ:[I

    aput v1, v5, v4

    const/4 v1, 0x1

    const/4 v5, 0x1

    :goto_0
    if-ge v5, v2, :cond_1

    .line 1284
    iget-object v6, v0, Lcom/appsflyer/internal/z;->ˊ:[I

    iget-object v7, v0, Ljava/io/FilterInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v7}, Ljava/io/InputStream;->read()I

    move-result v7

    aput v7, v6, v5

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 2202
    :cond_1
    iget v5, v0, Lcom/appsflyer/internal/z;->ॱॱ:I

    const/4 v6, 0x3

    if-ne v5, v6, :cond_2

    .line 2204
    iget-object v5, v0, Lcom/appsflyer/internal/z;->ˊ:[I

    iget-object v7, v0, Lcom/appsflyer/internal/z;->ॱ:[I

    array-length v8, v5

    invoke-static {v5, v4, v7, v4, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2206
    :cond_2
    iget-object v5, v0, Lcom/appsflyer/internal/z;->ˊ:[I

    aget v7, v5, v4

    shl-int/lit8 v7, v7, 0x18

    const/high16 v8, -0x1000000

    and-int/2addr v7, v8

    aget v9, v5, v1

    shl-int/lit8 v9, v9, 0x10

    const/high16 v10, 0xff0000

    and-int/2addr v9, v10

    add-int/2addr v7, v9

    const/4 v9, 0x2

    aget v11, v5, v9

    shl-int/2addr v11, v2

    const v12, 0xff00

    and-int/2addr v11, v12

    add-int/2addr v7, v11

    aget v11, v5, v6

    and-int/lit16 v11, v11, 0xff

    add-int/2addr v7, v11

    const/4 v11, 0x4

    .line 2210
    aget v13, v5, v11

    shl-int/lit8 v13, v13, 0x18

    and-int/2addr v8, v13

    const/4 v13, 0x5

    aget v14, v5, v13

    shl-int/lit8 v14, v14, 0x10

    and-int/2addr v10, v14

    add-int/2addr v8, v10

    const/4 v10, 0x6

    aget v14, v5, v10

    shl-int/2addr v14, v2

    and-int/2addr v12, v14

    add-int/2addr v8, v12

    const/4 v12, 0x7

    aget v5, v5, v12

    and-int/lit16 v5, v5, 0xff

    add-int/2addr v8, v5

    const/4 v5, 0x0

    .line 2214
    :goto_1
    iget v14, v0, Lcom/appsflyer/internal/z;->ʽ:I

    if-ge v5, v14, :cond_3

    .line 2216
    sget-short v15, Lcom/appsflyer/internal/z;->ˏ:S

    sub-int v16, v14, v5

    mul-int v16, v16, v15

    add-int v16, v7, v16

    shl-int/lit8 v17, v7, 0x4

    iget v3, v0, Lcom/appsflyer/internal/z;->ͺ:I

    add-int v17, v17, v3

    xor-int v3, v16, v17

    ushr-int/lit8 v16, v7, 0x5

    iget v2, v0, Lcom/appsflyer/internal/z;->ˏॱ:I

    add-int v16, v16, v2

    xor-int v2, v3, v16

    sub-int/2addr v8, v2

    sub-int/2addr v14, v5

    mul-int v15, v15, v14

    add-int/2addr v15, v8

    shl-int/lit8 v2, v8, 0x4

    .line 2219
    iget v3, v0, Lcom/appsflyer/internal/z;->ʻ:I

    add-int/2addr v2, v3

    xor-int/2addr v2, v15

    ushr-int/lit8 v3, v8, 0x5

    iget v14, v0, Lcom/appsflyer/internal/z;->ʼ:I

    add-int/2addr v3, v14

    xor-int/2addr v2, v3

    sub-int/2addr v7, v2

    add-int/lit8 v5, v5, 0x1

    const/16 v2, 0x8

    const/4 v3, -0x1

    goto :goto_1

    .line 2223
    :cond_3
    iget-object v2, v0, Lcom/appsflyer/internal/z;->ˊ:[I

    ushr-int/lit8 v3, v7, 0x18

    aput v3, v2, v4

    shr-int/lit8 v3, v7, 0x10

    and-int/lit16 v3, v3, 0xff

    .line 2224
    aput v3, v2, v1

    shr-int/lit8 v1, v7, 0x8

    and-int/lit16 v1, v1, 0xff

    .line 2225
    aput v1, v2, v9

    and-int/lit16 v1, v7, 0xff

    .line 2226
    aput v1, v2, v6

    ushr-int/lit8 v1, v8, 0x18

    .line 2227
    aput v1, v2, v11

    shr-int/lit8 v1, v8, 0x10

    and-int/lit16 v1, v1, 0xff

    .line 2228
    aput v1, v2, v13

    shr-int/lit8 v1, v8, 0x8

    and-int/lit16 v1, v1, 0xff

    .line 2229
    aput v1, v2, v10

    and-int/lit16 v1, v8, 0xff

    .line 2230
    aput v1, v2, v12

    .line 2231
    iget v1, v0, Lcom/appsflyer/internal/z;->ॱॱ:I

    if-ne v1, v6, :cond_5

    const/4 v1, 0x0

    :goto_2
    const/16 v2, 0x8

    if-ge v1, v2, :cond_4

    .line 2243
    iget-object v2, v0, Lcom/appsflyer/internal/z;->ˊ:[I

    aget v3, v2, v1

    iget-object v5, v0, Lcom/appsflyer/internal/z;->ˋ:[I

    aget v5, v5, v1

    xor-int/2addr v3, v5

    and-int/lit16 v3, v3, 0xff

    aput v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 2234
    :cond_4
    iget-object v1, v0, Lcom/appsflyer/internal/z;->ॱ:[I

    iget-object v2, v0, Lcom/appsflyer/internal/z;->ˋ:[I

    array-length v3, v1

    invoke-static {v1, v4, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1290
    :cond_5
    iget-object v1, v0, Ljava/io/FilterInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v1

    iput v1, v0, Lcom/appsflyer/internal/z;->ᐝ:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_6

    .line 1294
    iget-object v1, v0, Lcom/appsflyer/internal/z;->ˊ:[I

    aget v3, v1, v12

    const/16 v5, 0x8

    rsub-int/lit8 v3, v3, 0x8

    .line 1295
    invoke-static {v1, v3, v5, v2}, Ljava/util/Arrays;->fill([IIII)V

    .line 1297
    :cond_6
    :goto_3
    iput v4, v0, Lcom/appsflyer/internal/z;->ˎ:I

    .line 108
    :cond_7
    iget-object v1, v0, Lcom/appsflyer/internal/z;->ˊ:[I

    iget v2, v0, Lcom/appsflyer/internal/z;->ˎ:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/appsflyer/internal/z;->ˎ:I

    aget v1, v1, v2

    return v1
.end method

.method public final read([BII)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-nez p3, :cond_0

    const/4 p1, 0x0

    return p1

    .line 120
    :cond_0
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    return v1

    :cond_1
    int-to-byte v0, v0

    .line 125
    aput-byte v0, p1, p2

    const/4 v0, 0x1

    :goto_0
    if-ge v0, p3, :cond_3

    .line 130
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v2

    if-ne v2, v1, :cond_2

    return v0

    :cond_2
    add-int v3, p2, v0

    int-to-byte v2, v2

    .line 135
    aput-byte v2, p1, v3

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    return v0
.end method

.method public final skip(J)J
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-wide/16 v0, 0x0

    :goto_0
    cmp-long v2, v0, p1

    if-gez v2, :cond_0

    .line 145
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    goto :goto_0

    :cond_0
    return-wide v0
.end method
