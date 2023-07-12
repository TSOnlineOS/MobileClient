.class public Lcom/appsflyer/AFLogger;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/appsflyer/AFLogger$LogLevel;
    }
.end annotation


# static fields
.field private static ˏ:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 18
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sput-wide v0, Lcom/appsflyer/AFLogger;->ˏ:J

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static afDebugLog(Ljava/lang/String;)V
    .locals 4

    .line 12050
    sget-object v0, Lcom/appsflyer/AFLogger$LogLevel;->DEBUG:Lcom/appsflyer/AFLogger$LogLevel;

    .line 12085
    invoke-virtual {v0}, Lcom/appsflyer/AFLogger$LogLevel;->getLevel()I

    move-result v0

    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v1

    .line 12132
    sget-object v2, Lcom/appsflyer/AFLogger$LogLevel;->NONE:Lcom/appsflyer/AFLogger$LogLevel;

    invoke-virtual {v2}, Lcom/appsflyer/AFLogger$LogLevel;->getLevel()I

    move-result v2

    const-string v3, "logLevel"

    invoke-virtual {v1, v3, v2}, Lcom/appsflyer/AppsFlyerProperties;->getInt(Ljava/lang/String;I)I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-gt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    .line 13035
    invoke-static {p0, v3}, Lcom/appsflyer/AFLogger;->ˏ(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    const-string v1, "AppsFlyer_4.10.0"

    .line 12051
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 13068
    :cond_1
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v0, :cond_2

    .line 13069
    new-instance v0, Lcom/appsflyer/internal/x;

    invoke-direct {v0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 13071
    :cond_2
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 12054
    invoke-static {p0, v2}, Lcom/appsflyer/AFLogger;->ˏ(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x0

    new-array v2, v2, [Ljava/lang/String;

    aput-object p0, v2, v3

    const-string p0, "D"

    .line 13191
    invoke-virtual {v0, v1, p0, v2}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    return-void
.end method

.method public static afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    const/4 v0, 0x0

    .line 108
    invoke-static {p0, p1, v0}, Lcom/appsflyer/AFLogger;->ˊ(Ljava/lang/String;Ljava/lang/Throwable;Z)V

    return-void
.end method

.method public static afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;Z)V
    .locals 0

    .line 112
    invoke-static {p0, p1, p2}, Lcom/appsflyer/AFLogger;->ˊ(Ljava/lang/String;Ljava/lang/Throwable;Z)V

    return-void
.end method

.method public static afInfoLog(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x1

    .line 104
    invoke-static {p0, v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;Z)V

    return-void
.end method

.method public static afInfoLog(Ljava/lang/String;Z)V
    .locals 4

    .line 21
    sget-object v0, Lcom/appsflyer/AFLogger$LogLevel;->INFO:Lcom/appsflyer/AFLogger$LogLevel;

    .line 1085
    invoke-virtual {v0}, Lcom/appsflyer/AFLogger$LogLevel;->getLevel()I

    move-result v0

    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v1

    .line 1132
    sget-object v2, Lcom/appsflyer/AFLogger$LogLevel;->NONE:Lcom/appsflyer/AFLogger$LogLevel;

    invoke-virtual {v2}, Lcom/appsflyer/AFLogger$LogLevel;->getLevel()I

    move-result v2

    const-string v3, "logLevel"

    invoke-virtual {v1, v3, v2}, Lcom/appsflyer/AppsFlyerProperties;->getInt(Ljava/lang/String;I)I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-gt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    .line 2035
    invoke-static {p0, v3}, Lcom/appsflyer/AFLogger;->ˏ(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    const-string v1, "AppsFlyer_4.10.0"

    .line 22
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    if-eqz p1, :cond_3

    .line 2068
    sget-object p1, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez p1, :cond_2

    .line 2069
    new-instance p1, Lcom/appsflyer/internal/x;

    invoke-direct {p1}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object p1, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 2071
    :cond_2
    sget-object p1, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 25
    invoke-static {p0, v2}, Lcom/appsflyer/AFLogger;->ˏ(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x0

    new-array v1, v2, [Ljava/lang/String;

    aput-object p0, v1, v3

    const-string p0, "I"

    .line 2191
    invoke-virtual {p1, v0, p0, v1}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    :cond_3
    return-void
.end method

.method public static afRDLog(Ljava/lang/String;)V
    .locals 4

    .line 77
    sget-object v0, Lcom/appsflyer/AFLogger$LogLevel;->VERBOSE:Lcom/appsflyer/AFLogger$LogLevel;

    .line 8085
    invoke-virtual {v0}, Lcom/appsflyer/AFLogger$LogLevel;->getLevel()I

    move-result v0

    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v1

    .line 8132
    sget-object v2, Lcom/appsflyer/AFLogger$LogLevel;->NONE:Lcom/appsflyer/AFLogger$LogLevel;

    invoke-virtual {v2}, Lcom/appsflyer/AFLogger$LogLevel;->getLevel()I

    move-result v2

    const-string v3, "logLevel"

    invoke-virtual {v1, v3, v2}, Lcom/appsflyer/AppsFlyerProperties;->getInt(Ljava/lang/String;I)I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-gt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    .line 9035
    invoke-static {p0, v3}, Lcom/appsflyer/AFLogger;->ˏ(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    const-string v1, "AppsFlyer_4.10.0"

    .line 78
    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 9068
    :cond_1
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v0, :cond_2

    .line 9069
    new-instance v0, Lcom/appsflyer/internal/x;

    invoke-direct {v0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 9071
    :cond_2
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 81
    invoke-static {p0, v2}, Lcom/appsflyer/AFLogger;->ˏ(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x0

    new-array v2, v2, [Ljava/lang/String;

    aput-object p0, v2, v3

    const-string p0, "V"

    .line 9191
    invoke-virtual {v0, v1, p0, v2}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    return-void
.end method

.method public static afWarnLog(Ljava/lang/String;)V
    .locals 0

    .line 116
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->ˋ(Ljava/lang/String;)V

    return-void
.end method

.method public static resetDeltaTime()V
    .locals 2

    .line 30
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sput-wide v0, Lcom/appsflyer/AFLogger;->ˏ:J

    return-void
.end method

.method static ˊ(Ljava/lang/String;)V
    .locals 4

    .line 10096
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    invoke-virtual {v0}, Lcom/appsflyer/AppsFlyerProperties;->isLogsDisabledCompletely()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 11035
    invoke-static {p0, v1}, Lcom/appsflyer/AFLogger;->ˏ(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    const-string v2, "AppsFlyer_4.10.0"

    .line 90
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 11068
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v0, :cond_1

    .line 11069
    new-instance v0, Lcom/appsflyer/internal/x;

    invoke-direct {v0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 11071
    :cond_1
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    const/4 v2, 0x0

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    aput-object p0, v3, v1

    const-string p0, "F"

    .line 11191
    invoke-virtual {v0, v2, p0, v3}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    return-void
.end method

.method private static ˊ(Ljava/lang/String;Ljava/lang/Throwable;Z)V
    .locals 4

    .line 59
    sget-object v0, Lcom/appsflyer/AFLogger$LogLevel;->ERROR:Lcom/appsflyer/AFLogger$LogLevel;

    .line 4085
    invoke-virtual {v0}, Lcom/appsflyer/AFLogger$LogLevel;->getLevel()I

    move-result v0

    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v1

    .line 4132
    sget-object v2, Lcom/appsflyer/AFLogger$LogLevel;->NONE:Lcom/appsflyer/AFLogger$LogLevel;

    invoke-virtual {v2}, Lcom/appsflyer/AFLogger$LogLevel;->getLevel()I

    move-result v2

    const-string v3, "logLevel"

    invoke-virtual {v1, v3, v2}, Lcom/appsflyer/AppsFlyerProperties;->getInt(Ljava/lang/String;I)I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-gt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    if-eqz p2, :cond_1

    .line 5035
    invoke-static {p0, v2}, Lcom/appsflyer/AFLogger;->ˏ(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    const-string p2, "AppsFlyer_4.10.0"

    .line 60
    invoke-static {p2, p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 5068
    :cond_1
    sget-object p0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez p0, :cond_2

    .line 5069
    new-instance p0, Lcom/appsflyer/internal/x;

    invoke-direct {p0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object p0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 5071
    :cond_2
    sget-object p0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 5178
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p2

    .line 5179
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    if-nez p2, :cond_3

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    :cond_3
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    :goto_1
    if-nez p2, :cond_4

    invoke-virtual {p1}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object p1

    goto :goto_2

    :cond_4
    invoke-virtual {p2}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object p1

    :goto_2
    if-nez p1, :cond_5

    new-array p1, v3, [Ljava/lang/String;

    aput-object v1, p1, v2

    goto :goto_4

    .line 5293
    :cond_5
    array-length p2, p1

    add-int/2addr p2, v3

    new-array p2, p2, [Ljava/lang/String;

    .line 5294
    aput-object v1, p2, v2

    .line 5295
    :goto_3
    array-length v1, p1

    if-ge v3, v1, :cond_6

    .line 5296
    aget-object v1, p1, v3

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, p2, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    :cond_6
    move-object p1, p2

    :goto_4
    const-string p2, "exception"

    .line 5179
    invoke-virtual {p0, p2, v0, p1}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    return-void
.end method

.method static ˋ(Ljava/lang/String;)V
    .locals 4

    .line 68
    sget-object v0, Lcom/appsflyer/AFLogger$LogLevel;->WARNING:Lcom/appsflyer/AFLogger$LogLevel;

    .line 6085
    invoke-virtual {v0}, Lcom/appsflyer/AFLogger$LogLevel;->getLevel()I

    move-result v0

    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v1

    .line 6132
    sget-object v2, Lcom/appsflyer/AFLogger$LogLevel;->NONE:Lcom/appsflyer/AFLogger$LogLevel;

    invoke-virtual {v2}, Lcom/appsflyer/AFLogger$LogLevel;->getLevel()I

    move-result v2

    const-string v3, "logLevel"

    invoke-virtual {v1, v3, v2}, Lcom/appsflyer/AppsFlyerProperties;->getInt(Ljava/lang/String;I)I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-gt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    .line 7035
    invoke-static {p0, v3}, Lcom/appsflyer/AFLogger;->ˏ(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    const-string v1, "AppsFlyer_4.10.0"

    .line 69
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 7068
    :cond_1
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v0, :cond_2

    .line 7069
    new-instance v0, Lcom/appsflyer/internal/x;

    invoke-direct {v0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 7071
    :cond_2
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 72
    invoke-static {p0, v2}, Lcom/appsflyer/AFLogger;->ˏ(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x0

    new-array v2, v2, [Ljava/lang/String;

    aput-object p0, v2, v3

    const-string p0, "W"

    .line 7191
    invoke-virtual {v0, v1, p0, v2}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    return-void
.end method

.method private static ˏ(J)Ljava/lang/String;
    .locals 8

    .line 120
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p0, p1}, Ljava/util/concurrent/TimeUnit;->toHours(J)J

    move-result-wide v0

    .line 121
    sget-object v2, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v0, v1}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v2

    sub-long/2addr p0, v2

    .line 122
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, p0, p1}, Ljava/util/concurrent/TimeUnit;->toMinutes(J)J

    move-result-wide v2

    .line 123
    sget-object v4, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v4, v2, v3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v4

    sub-long/2addr p0, v4

    .line 124
    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v4, p0, p1}, Ljava/util/concurrent/TimeUnit;->toSeconds(J)J

    move-result-wide v4

    .line 125
    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v6, v4, v5}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v6

    sub-long/2addr p0, v6

    .line 126
    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v6, p0, p1}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide p0

    .line 128
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v6

    const/4 v7, 0x4

    new-array v7, v7, [Ljava/lang/Object;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const/4 v1, 0x0

    aput-object v0, v7, v1

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const/4 v1, 0x1

    aput-object v0, v7, v1

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const/4 v1, 0x2

    aput-object v0, v7, v1

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    const/4 p1, 0x3

    aput-object p0, v7, p1

    const-string p0, "%02d:%02d:%02d:%03d"

    invoke-static {v6, p0, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static ˏ(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 4

    if-nez p1, :cond_1

    .line 41
    sget-object p1, Lcom/appsflyer/AFLogger$LogLevel;->VERBOSE:Lcom/appsflyer/AFLogger$LogLevel;

    invoke-virtual {p1}, Lcom/appsflyer/AFLogger$LogLevel;->getLevel()I

    move-result p1

    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    .line 3132
    sget-object v1, Lcom/appsflyer/AFLogger$LogLevel;->NONE:Lcom/appsflyer/AFLogger$LogLevel;

    invoke-virtual {v1}, Lcom/appsflyer/AFLogger$LogLevel;->getLevel()I

    move-result v1

    const-string v2, "logLevel"

    invoke-virtual {v0, v2, v1}, Lcom/appsflyer/AppsFlyerProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    if-gt p1, v0, :cond_0

    goto :goto_0

    :cond_0
    return-object p0

    .line 42
    :cond_1
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "("

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-wide v2, Lcom/appsflyer/AFLogger;->ˏ:J

    sub-long/2addr v0, v2

    invoke-static {v0, v1}, Lcom/appsflyer/AFLogger;->ˏ(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ") ["

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "] "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
