.class public final Lcom/appsflyer/AFExecutor$2$1;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/appsflyer/AFExecutor$2;->newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# static fields
.field private static ˊ:Ljava/lang/String;

.field private static ˋ:Ljava/lang/String;


# instance fields
.field private synthetic ˎ:Ljava/lang/Runnable;

.field private synthetic ˏ:Lcom/appsflyer/AFExecutor$2;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1006
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Lcom/appsflyer/AFExecutor$2;Ljava/lang/Runnable;)V
    .locals 0

    .line 28
    iput-object p1, p0, Lcom/appsflyer/AFExecutor$2$1;->ˏ:Lcom/appsflyer/AFExecutor$2;

    iput-object p2, p0, Lcom/appsflyer/AFExecutor$2$1;->ˎ:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static ˋ(Ljava/lang/String;)V
    .locals 3

    .line 1029
    sput-object p0, Lcom/appsflyer/AFExecutor$2$1;->ˊ:Ljava/lang/String;

    .line 1031
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    .line 1033
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_2

    if-eqz v1, :cond_1

    .line 1034
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ne v1, v2, :cond_0

    goto :goto_1

    :cond_0
    const-string v2, "*"

    .line 1037
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 1035
    :cond_1
    :goto_1
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1040
    :cond_2
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    sput-object p0, Lcom/appsflyer/AFExecutor$2$1;->ˋ:Ljava/lang/String;

    return-void
.end method

.method public static ˏ(Ljava/lang/String;)V
    .locals 2

    .line 1045
    sget-object v0, Lcom/appsflyer/AFExecutor$2$1;->ˊ:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 1046
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "AppsFlyerKey"

    invoke-virtual {v0, v1}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFExecutor$2$1;->ˋ(Ljava/lang/String;)V

    .line 1049
    :cond_0
    sget-object v0, Lcom/appsflyer/AFExecutor$2$1;->ˊ:Ljava/lang/String;

    if-eqz v0, :cond_1

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1050
    sget-object v0, Lcom/appsflyer/AFExecutor$2$1;->ˊ:Ljava/lang/String;

    sget-object v1, Lcom/appsflyer/AFExecutor$2$1;->ˋ:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    :cond_1
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 31
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_0

    const-string v0, "AppsFlyer"

    .line 32
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-static {v0}, Landroid/net/TrafficStats;->setThreadStatsTag(I)V

    .line 33
    :cond_0
    iget-object v0, p0, Lcom/appsflyer/AFExecutor$2$1;->ˎ:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    return-void
.end method
