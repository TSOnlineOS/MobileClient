.class public final Lcom/appsflyer/internal/k;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/hardware/SensorEventListener;


# instance fields
.field private final ʻ:I

.field private ʼ:D

.field private ʽ:J

.field private final ˊ:[[F

.field private final ˋ:Ljava/lang/String;

.field private final ˎ:Ljava/lang/String;

.field private final ˏ:[J

.field private final ॱ:I


# direct methods
.method private constructor <init>(ILjava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x2

    new-array v1, v0, [[F

    .line 31
    iput-object v1, p0, Lcom/appsflyer/internal/k;->ˊ:[[F

    new-array v0, v0, [J

    .line 32
    iput-object v0, p0, Lcom/appsflyer/internal/k;->ˏ:[J

    .line 38
    iput p1, p0, Lcom/appsflyer/internal/k;->ॱ:I

    const-string v0, ""

    if-nez p2, :cond_0

    move-object p2, v0

    .line 39
    :cond_0
    iput-object p2, p0, Lcom/appsflyer/internal/k;->ˋ:Ljava/lang/String;

    if-nez p3, :cond_1

    move-object p3, v0

    .line 40
    :cond_1
    iput-object p3, p0, Lcom/appsflyer/internal/k;->ˎ:Ljava/lang/String;

    .line 41
    iget-object p2, p0, Lcom/appsflyer/internal/k;->ˋ:Ljava/lang/String;

    add-int/lit8 p1, p1, 0x1f

    mul-int/lit8 p1, p1, 0x1f

    .line 2052
    invoke-virtual {p2}, Ljava/lang/Object;->hashCode()I

    move-result p2

    add-int/2addr p1, p2

    mul-int/lit8 p1, p1, 0x1f

    .line 2053
    invoke-virtual {p3}, Ljava/lang/Object;->hashCode()I

    move-result p2

    add-int/2addr p1, p2

    .line 41
    iput p1, p0, Lcom/appsflyer/internal/k;->ʻ:I

    return-void
.end method

.method private static ˊ([F[F)D
    .locals 8

    .line 70
    array-length v0, p0

    array-length v1, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    const-wide/16 v1, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v0, :cond_0

    .line 73
    aget v4, p0, v3

    aget v5, p1, v3

    sub-float/2addr v4, v5

    float-to-double v4, v4

    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    invoke-static {v4, v5, v6, v7}, Ljava/lang/StrictMath;->pow(DD)D

    move-result-wide v4

    add-double/2addr v1, v4

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 75
    :cond_0
    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide p0

    return-wide p0
.end method

.method private static ˊ([F)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([F)",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    .line 84
    new-instance v0, Ljava/util/ArrayList;

    array-length v1, p0

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 85
    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget v3, p0, v2

    .line 86
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private ˊ(ILjava/lang/String;Ljava/lang/String;)Z
    .locals 1

    .line 139
    iget v0, p0, Lcom/appsflyer/internal/k;->ॱ:I

    if-ne v0, p1, :cond_0

    iget-object p1, p0, Lcom/appsflyer/internal/k;->ˋ:Ljava/lang/String;

    .line 140
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/appsflyer/internal/k;->ˎ:Ljava/lang/String;

    .line 141
    invoke-virtual {p1, p3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method static ˏ(Landroid/hardware/Sensor;)Lcom/appsflyer/internal/k;
    .locals 3

    .line 58
    invoke-virtual {p0}, Landroid/hardware/Sensor;->getType()I

    move-result v0

    invoke-virtual {p0}, Landroid/hardware/Sensor;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Landroid/hardware/Sensor;->getVendor()Ljava/lang/String;

    move-result-object p0

    .line 2062
    new-instance v2, Lcom/appsflyer/internal/k;

    invoke-direct {v2, v0, v1, p0}, Lcom/appsflyer/internal/k;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    return-object v2
.end method

.method private ॱ()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 188
    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 189
    iget v1, p0, Lcom/appsflyer/internal/k;->ॱ:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "sT"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    iget-object v1, p0, Lcom/appsflyer/internal/k;->ˋ:Ljava/lang/String;

    const-string v2, "sN"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    iget-object v1, p0, Lcom/appsflyer/internal/k;->ˎ:Ljava/lang/String;

    const-string v2, "sV"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 192
    iget-object v1, p0, Lcom/appsflyer/internal/k;->ˊ:[[F

    const/4 v2, 0x0

    aget-object v1, v1, v2

    if-eqz v1, :cond_0

    .line 194
    invoke-static {v1}, Lcom/appsflyer/internal/k;->ˊ([F)Ljava/util/List;

    move-result-object v1

    const-string v2, "sVS"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    :cond_0
    iget-object v1, p0, Lcom/appsflyer/internal/k;->ˊ:[[F

    const/4 v2, 0x1

    aget-object v1, v1, v2

    if-eqz v1, :cond_1

    .line 198
    invoke-static {v1}, Lcom/appsflyer/internal/k;->ˊ([F)Ljava/util/List;

    move-result-object v1

    const-string v2, "sVE"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    return-object v0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 2

    if-ne p1, p0, :cond_0

    const/4 p1, 0x1

    return p1

    .line 241
    :cond_0
    instance-of v0, p1, Lcom/appsflyer/internal/k;

    if-eqz v0, :cond_1

    .line 242
    check-cast p1, Lcom/appsflyer/internal/k;

    .line 243
    iget v0, p1, Lcom/appsflyer/internal/k;->ॱ:I

    iget-object v1, p1, Lcom/appsflyer/internal/k;->ˋ:Ljava/lang/String;

    iget-object p1, p1, Lcom/appsflyer/internal/k;->ˎ:Ljava/lang/String;

    invoke-direct {p0, v0, v1, p1}, Lcom/appsflyer/internal/k;->ˊ(ILjava/lang/String;Ljava/lang/String;)Z

    move-result p1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public final hashCode()I
    .locals 1

    .line 229
    iget v0, p0, Lcom/appsflyer/internal/k;->ʻ:I

    return v0
.end method

.method public final onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0

    return-void
.end method

.method public final onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 12

    if-eqz p1, :cond_4

    .line 93
    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    if-eqz v0, :cond_4

    iget-object v0, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    .line 2079
    invoke-virtual {v0}, Landroid/hardware/Sensor;->getName()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-virtual {v0}, Landroid/hardware/Sensor;->getVendor()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_4

    .line 94
    iget-object v0, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v0}, Landroid/hardware/Sensor;->getType()I

    move-result v0

    iget-object v3, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v3}, Landroid/hardware/Sensor;->getName()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    .line 95
    invoke-virtual {v4}, Landroid/hardware/Sensor;->getVendor()Ljava/lang/String;

    move-result-object v4

    iget-wide v5, p1, Landroid/hardware/SensorEvent;->timestamp:J

    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 2108
    invoke-direct {p0, v0, v3, v4}, Lcom/appsflyer/internal/k;->ˊ(ILjava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 2146
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 2147
    iget-object v0, p0, Lcom/appsflyer/internal/k;->ˊ:[[F

    aget-object v7, v0, v1

    if-nez v7, :cond_1

    .line 2149
    array-length v2, p1

    invoke-static {p1, v2}, Ljava/util/Arrays;->copyOf([FI)[F

    move-result-object p1

    aput-object p1, v0, v1

    .line 2150
    iget-object p1, p0, Lcom/appsflyer/internal/k;->ˏ:[J

    aput-wide v3, p1, v1

    return-void

    .line 2152
    :cond_1
    aget-object v0, v0, v2

    if-nez v0, :cond_2

    .line 2154
    array-length v0, p1

    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([FI)[F

    move-result-object p1

    .line 2155
    iget-object v0, p0, Lcom/appsflyer/internal/k;->ˊ:[[F

    aput-object p1, v0, v2

    .line 2156
    iget-object v0, p0, Lcom/appsflyer/internal/k;->ˏ:[J

    aput-wide v3, v0, v2

    .line 2157
    invoke-static {v7, p1}, Lcom/appsflyer/internal/k;->ˊ([F[F)D

    move-result-wide v0

    iput-wide v0, p0, Lcom/appsflyer/internal/k;->ʼ:D

    return-void

    :cond_2
    const-wide/32 v8, 0x2faf080

    .line 2161
    iget-wide v10, p0, Lcom/appsflyer/internal/k;->ʽ:J

    sub-long v10, v5, v10

    cmp-long v1, v8, v10

    if-gtz v1, :cond_4

    .line 2162
    iput-wide v5, p0, Lcom/appsflyer/internal/k;->ʽ:J

    .line 2163
    invoke-static {v0, p1}, Ljava/util/Arrays;->equals([F[F)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 2165
    iget-object p1, p0, Lcom/appsflyer/internal/k;->ˏ:[J

    aput-wide v3, p1, v2

    return-void

    .line 2167
    :cond_3
    invoke-static {v7, p1}, Lcom/appsflyer/internal/k;->ˊ([F[F)D

    move-result-wide v0

    .line 2168
    iget-wide v5, p0, Lcom/appsflyer/internal/k;->ʼ:D

    cmpl-double v7, v0, v5

    if-lez v7, :cond_4

    .line 2169
    iget-object v5, p0, Lcom/appsflyer/internal/k;->ˊ:[[F

    array-length v6, p1

    invoke-static {p1, v6}, Ljava/util/Arrays;->copyOf([FI)[F

    move-result-object p1

    aput-object p1, v5, v2

    .line 2170
    iget-object p1, p0, Lcom/appsflyer/internal/k;->ˏ:[J

    aput-wide v3, p1, v2

    .line 2171
    iput-wide v0, p0, Lcom/appsflyer/internal/k;->ʼ:D

    :cond_4
    return-void
.end method

.method final ˏ(Ljava/util/Map;Z)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/appsflyer/internal/k;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;Z)V"
        }
    .end annotation

    .line 2224
    iget-object v0, p0, Lcom/appsflyer/internal/k;->ˊ:[[F

    const/4 v1, 0x0

    aget-object v0, v0, v1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_3

    .line 129
    invoke-direct {p0}, Lcom/appsflyer/internal/k;->ॱ()Ljava/util/Map;

    move-result-object v0

    invoke-interface {p1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p2, :cond_4

    const/4 p1, 0x0

    :goto_1
    const/4 p2, 0x2

    if-ge p1, p2, :cond_1

    .line 3209
    iget-object p2, p0, Lcom/appsflyer/internal/k;->ˊ:[[F

    const/4 v0, 0x0

    aput-object v0, p2, p1

    add-int/lit8 p1, p1, 0x1

    goto :goto_1

    :cond_1
    :goto_2
    const-wide/16 v2, 0x0

    if-ge v1, p2, :cond_2

    .line 3212
    iget-object p1, p0, Lcom/appsflyer/internal/k;->ˏ:[J

    aput-wide v2, p1, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_2
    const-wide/16 p1, 0x0

    .line 3214
    iput-wide p1, p0, Lcom/appsflyer/internal/k;->ʼ:D

    .line 3215
    iput-wide v2, p0, Lcom/appsflyer/internal/k;->ʽ:J

    return-void

    .line 133
    :cond_3
    invoke-interface {p1, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_4

    .line 134
    invoke-direct {p0}, Lcom/appsflyer/internal/k;->ॱ()Ljava/util/Map;

    move-result-object p2

    invoke-interface {p1, p0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4
    return-void
.end method
