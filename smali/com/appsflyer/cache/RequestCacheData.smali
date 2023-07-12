.class public Lcom/appsflyer/cache/RequestCacheData;
.super Ljava/lang/Object;
.source ""


# instance fields
.field private ˊ:Ljava/lang/String;

.field private ˎ:Ljava/lang/String;

.field private ˏ:Ljava/lang/String;

.field private ॱ:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/appsflyer/cache/RequestCacheData;->ˎ:Ljava/lang/String;

    .line 20
    iput-object p2, p0, Lcom/appsflyer/cache/RequestCacheData;->ॱ:Ljava/lang/String;

    .line 21
    iput-object p3, p0, Lcom/appsflyer/cache/RequestCacheData;->ˏ:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>([C)V
    .locals 2

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    new-instance v0, Ljava/util/Scanner;

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p1}, Ljava/lang/String;-><init>([C)V

    invoke-direct {v0, v1}, Ljava/util/Scanner;-><init>(Ljava/lang/String;)V

    .line 26
    :cond_0
    :goto_0
    invoke-virtual {v0}, Ljava/util/Scanner;->hasNextLine()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 27
    invoke-virtual {v0}, Ljava/util/Scanner;->nextLine()Ljava/lang/String;

    move-result-object p1

    const-string v1, "url="

    .line 28
    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x4

    .line 29
    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/appsflyer/cache/RequestCacheData;->ˎ:Ljava/lang/String;

    goto :goto_0

    :cond_1
    const-string v1, "version="

    .line 30
    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/16 v1, 0x8

    .line 31
    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/appsflyer/cache/RequestCacheData;->ˏ:Ljava/lang/String;

    goto :goto_0

    :cond_2
    const-string v1, "data="

    .line 32
    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x5

    .line 33
    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/appsflyer/cache/RequestCacheData;->ॱ:Ljava/lang/String;

    goto :goto_0

    .line 36
    :cond_3
    invoke-virtual {v0}, Ljava/util/Scanner;->close()V

    return-void
.end method


# virtual methods
.method public getCacheKey()Ljava/lang/String;
    .locals 1

    .line 64
    iget-object v0, p0, Lcom/appsflyer/cache/RequestCacheData;->ˊ:Ljava/lang/String;

    return-object v0
.end method

.method public getPostData()Ljava/lang/String;
    .locals 1

    .line 48
    iget-object v0, p0, Lcom/appsflyer/cache/RequestCacheData;->ॱ:Ljava/lang/String;

    return-object v0
.end method

.method public getRequestURL()Ljava/lang/String;
    .locals 1

    .line 56
    iget-object v0, p0, Lcom/appsflyer/cache/RequestCacheData;->ˎ:Ljava/lang/String;

    return-object v0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 1

    .line 40
    iget-object v0, p0, Lcom/appsflyer/cache/RequestCacheData;->ˏ:Ljava/lang/String;

    return-object v0
.end method

.method public setCacheKey(Ljava/lang/String;)V
    .locals 0

    .line 68
    iput-object p1, p0, Lcom/appsflyer/cache/RequestCacheData;->ˊ:Ljava/lang/String;

    return-void
.end method

.method public setPostData(Ljava/lang/String;)V
    .locals 0

    .line 52
    iput-object p1, p0, Lcom/appsflyer/cache/RequestCacheData;->ॱ:Ljava/lang/String;

    return-void
.end method

.method public setRequestURL(Ljava/lang/String;)V
    .locals 0

    .line 60
    iput-object p1, p0, Lcom/appsflyer/cache/RequestCacheData;->ˎ:Ljava/lang/String;

    return-void
.end method

.method public setVersion(Ljava/lang/String;)V
    .locals 0

    .line 44
    iput-object p1, p0, Lcom/appsflyer/cache/RequestCacheData;->ˏ:Ljava/lang/String;

    return-void
.end method
