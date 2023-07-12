.class public final Lcom/appsflyer/internal/b$b$a;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/appsflyer/internal/b$b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field private final ˊ:Ljava/lang/Object;

.field public ˎ:Ljava/lang/String;

.field public ˏ:J


# direct methods
.method constructor <init>()V
    .locals 0

    .line 492
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(JLjava/lang/String;)V
    .locals 2

    .line 1015
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1011
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/appsflyer/internal/b$b$a;->ˊ:Ljava/lang/Object;

    const-wide/16 v0, 0x0

    .line 1012
    iput-wide v0, p0, Lcom/appsflyer/internal/b$b$a;->ˏ:J

    const-string v0, ""

    .line 1013
    iput-object v0, p0, Lcom/appsflyer/internal/b$b$a;->ˎ:Ljava/lang/String;

    .line 1016
    iput-wide p1, p0, Lcom/appsflyer/internal/b$b$a;->ˏ:J

    .line 1017
    iput-object p3, p0, Lcom/appsflyer/internal/b$b$a;->ˎ:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 1021
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-direct {p0, v0, v1, p1}, Lcom/appsflyer/internal/b$b$a;-><init>(JLjava/lang/String;)V

    return-void
.end method

.method static ˋ([B)[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x0

    .line 514
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_0

    .line 515
    aget-byte v1, p0, v0

    rem-int/lit8 v2, v0, 0x2

    add-int/lit8 v2, v2, 0x2a

    xor-int/2addr v1, v2

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public static ˎ(Ljava/lang/String;)Lcom/appsflyer/internal/b$b$a;
    .locals 5

    const-string v0, ""

    const-wide/16 v1, 0x0

    if-nez p0, :cond_0

    .line 1037
    new-instance p0, Lcom/appsflyer/internal/b$b$a;

    invoke-direct {p0, v1, v2, v0}, Lcom/appsflyer/internal/b$b$a;-><init>(JLjava/lang/String;)V

    return-object p0

    :cond_0
    const-string v3, ","

    .line 1029
    invoke-virtual {p0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 1030
    array-length v3, p0

    const/4 v4, 0x2

    if-ge v3, v4, :cond_1

    .line 2037
    new-instance p0, Lcom/appsflyer/internal/b$b$a;

    invoke-direct {p0, v1, v2, v0}, Lcom/appsflyer/internal/b$b$a;-><init>(JLjava/lang/String;)V

    return-object p0

    .line 1033
    :cond_1
    new-instance v0, Lcom/appsflyer/internal/b$b$a;

    const/4 v1, 0x0

    aget-object v1, p0, v1

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    const/4 v3, 0x1

    aget-object p0, p0, v3

    invoke-direct {v0, v1, v2, p0}, Lcom/appsflyer/internal/b$b$a;-><init>(JLjava/lang/String;)V

    return-object v0
.end method

.method static ˎ([B)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 521
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 522
    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-byte v3, p0, v2

    .line 523
    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    .line 524
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_0

    .line 525
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "0"

    invoke-virtual {v4, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 526
    :cond_0
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 528
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .locals 3

    .line 2067
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v1, p0, Lcom/appsflyer/internal/b$b$a;->ˏ:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/appsflyer/internal/b$b$a;->ˎ:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final ˊ(JLjava/lang/String;)Z
    .locals 8

    .line 2051
    iget-object v0, p0, Lcom/appsflyer/internal/b$b$a;->ˊ:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    if-eqz p3, :cond_1

    .line 2052
    :try_start_0
    iget-object v2, p0, Lcom/appsflyer/internal/b$b$a;->ˎ:Ljava/lang/String;

    invoke-virtual {p3, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 2062
    iget-wide v2, p0, Lcom/appsflyer/internal/b$b$a;->ˏ:J

    sub-long v2, p1, v2

    const-wide/16 v4, 0x7d0

    const/4 v6, 0x1

    cmp-long v7, v2, v4

    if-lez v7, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    if-eqz v2, :cond_1

    .line 2053
    iput-wide p1, p0, Lcom/appsflyer/internal/b$b$a;->ˏ:J

    .line 2054
    iput-object p3, p0, Lcom/appsflyer/internal/b$b$a;->ˎ:Ljava/lang/String;

    .line 2055
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return v6

    :catchall_0
    move-exception p1

    .line 2058
    monitor-exit v0

    throw p1

    .line 2057
    :cond_1
    monitor-exit v0

    return v1
.end method
