.class Lcom/onevcat/uniwebview/Logger;
.super Ljava/lang/Object;
.source "Logger.java"


# static fields
.field static final CRITICAL:I = 0x50

.field static final DEBUG:I = 0xa

.field static final INFO:I = 0x14

.field static final OFF:I = 0x63

.field static final VERBOSE:I

.field private static instance:Lcom/onevcat/uniwebview/Logger;


# instance fields
.field private level:I

.field private tag:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/onevcat/uniwebview/Logger;->tag:Ljava/lang/String;

    .line 24
    iput p2, p0, Lcom/onevcat/uniwebview/Logger;->level:I

    return-void
.end method

.method static getInstance()Lcom/onevcat/uniwebview/Logger;
    .locals 3

    .line 29
    sget-object v0, Lcom/onevcat/uniwebview/Logger;->instance:Lcom/onevcat/uniwebview/Logger;

    if-nez v0, :cond_0

    .line 30
    new-instance v0, Lcom/onevcat/uniwebview/Logger;

    const/16 v1, 0x50

    const-string v2, "UniWebView"

    invoke-direct {v0, v2, v1}, Lcom/onevcat/uniwebview/Logger;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/onevcat/uniwebview/Logger;->instance:Lcom/onevcat/uniwebview/Logger;

    .line 32
    :cond_0
    sget-object v0, Lcom/onevcat/uniwebview/Logger;->instance:Lcom/onevcat/uniwebview/Logger;

    return-object v0
.end method

.method private log(ILjava/lang/String;)V
    .locals 2

    .line 41
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/Logger;->getLevel()I

    move-result v0

    if-lt p1, v0, :cond_1

    const/16 v0, 0x50

    const-string v1, "<UniWebView-Android> "

    if-ne p1, v0, :cond_0

    .line 43
    iget-object p1, p0, Lcom/onevcat/uniwebview/Logger;->tag:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 45
    :cond_0
    iget-object p1, p0, Lcom/onevcat/uniwebview/Logger;->tag:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method critical(Ljava/lang/String;)V
    .locals 1

    const/16 v0, 0x50

    .line 38
    invoke-direct {p0, v0, p1}, Lcom/onevcat/uniwebview/Logger;->log(ILjava/lang/String;)V

    return-void
.end method

.method debug(Ljava/lang/String;)V
    .locals 1

    const/16 v0, 0xa

    .line 36
    invoke-direct {p0, v0, p1}, Lcom/onevcat/uniwebview/Logger;->log(ILjava/lang/String;)V

    return-void
.end method

.method public getLevel()I
    .locals 1

    .line 51
    iget v0, p0, Lcom/onevcat/uniwebview/Logger;->level:I

    return v0
.end method

.method info(Ljava/lang/String;)V
    .locals 1

    const/16 v0, 0x14

    .line 37
    invoke-direct {p0, v0, p1}, Lcom/onevcat/uniwebview/Logger;->log(ILjava/lang/String;)V

    return-void
.end method

.method public setLevel(I)V
    .locals 2

    .line 55
    iput p1, p0, Lcom/onevcat/uniwebview/Logger;->level:I

    .line 56
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Setting logging level to "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0x63

    invoke-direct {p0, v0, p1}, Lcom/onevcat/uniwebview/Logger;->log(ILjava/lang/String;)V

    return-void
.end method

.method verbose(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 35
    invoke-direct {p0, v0, p1}, Lcom/onevcat/uniwebview/Logger;->log(ILjava/lang/String;)V

    return-void
.end method
