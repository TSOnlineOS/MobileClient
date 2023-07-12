.class final Lcom/google/android/play/integrity/internal/d;
.super Lcom/google/android/play/integrity/internal/e;
.source "com.google.android.play:integrity@@1.1.0"


# instance fields
.field private final a:J


# direct methods
.method constructor <init>(IJ)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/play/integrity/internal/e;-><init>()V

    iput-wide p2, p0, Lcom/google/android/play/integrity/internal/d;->a:J

    return-void
.end method


# virtual methods
.method public final a()I
    .locals 1

    const/4 v0, 0x3

    return v0
.end method

.method public final b()J
    .locals 2

    iget-wide v0, p0, Lcom/google/android/play/integrity/internal/d;->a:J

    return-wide v0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 1
    :cond_0
    instance-of v1, p1, Lcom/google/android/play/integrity/internal/e;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 2
    check-cast p1, Lcom/google/android/play/integrity/internal/e;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/play/integrity/internal/e;->a()I

    iget-wide v3, p0, Lcom/google/android/play/integrity/internal/d;->a:J

    .line 4
    invoke-virtual {p1}, Lcom/google/android/play/integrity/internal/e;->b()J

    move-result-wide v5

    cmp-long p1, v3, v5

    if-nez p1, :cond_1

    return v0

    :cond_1
    return v2
.end method

.method public final hashCode()I
    .locals 4

    iget-wide v0, p0, Lcom/google/android/play/integrity/internal/d;->a:J

    const/16 v2, 0x20

    ushr-long v2, v0, v2

    xor-long/2addr v0, v2

    long-to-int v1, v0

    const v0, -0x2b2d2940

    xor-int/2addr v0, v1

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/google/android/play/integrity/internal/d;->a:J

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "EventRecord{eventType=3, eventTimestamp="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, "}"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
