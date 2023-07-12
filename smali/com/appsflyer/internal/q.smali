.class public final Lcom/appsflyer/internal/q;
.super Landroid/os/AsyncTask;
.source ""


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field private ʻ:Z

.field private ʼ:Ljava/net/URL;

.field private ʽ:Ljava/lang/String;

.field ˊ:Z

.field public ˋ:Ljava/lang/String;

.field ˎ:Ljava/net/HttpURLConnection;

.field public ˏ:Z

.field public ॱ:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private ॱॱ:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private ᐝ:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Z)V
    .locals 2

    .line 38
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    const/4 v0, 0x0

    .line 28
    iput-boolean v0, p0, Lcom/appsflyer/internal/q;->ʻ:Z

    const-string v1, ""

    .line 29
    iput-object v1, p0, Lcom/appsflyer/internal/q;->ʽ:Ljava/lang/String;

    .line 30
    iput-boolean v0, p0, Lcom/appsflyer/internal/q;->ᐝ:Z

    .line 39
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/appsflyer/internal/q;->ॱॱ:Ljava/lang/ref/WeakReference;

    const/4 p1, 0x1

    .line 40
    iput-boolean p1, p0, Lcom/appsflyer/internal/q;->ˏ:Z

    .line 41
    iput-boolean p1, p0, Lcom/appsflyer/internal/q;->ˊ:Z

    .line 42
    iput-boolean p2, p0, Lcom/appsflyer/internal/q;->ʻ:Z

    return-void
.end method


# virtual methods
.method protected final synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 24
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/appsflyer/internal/q;->ˊ([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected final onCancelled()V
    .locals 0

    return-void
.end method

.method protected final synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 24
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/appsflyer/internal/q;->ˎ(Ljava/lang/String;)V

    return-void
.end method

.method public final onPreExecute()V
    .locals 2

    .line 46
    iget-object v0, p0, Lcom/appsflyer/internal/q;->ˋ:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 47
    new-instance v0, Lorg/json/JSONObject;

    iget-object v1, p0, Lcom/appsflyer/internal/q;->ॱ:Ljava/util/Map;

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 48
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/appsflyer/internal/q;->ˋ:Ljava/lang/String;

    :cond_0
    return-void
.end method

.method public final varargs ˊ([Ljava/lang/String;)Ljava/lang/String;
    .locals 8

    .line 54
    iget-boolean v0, p0, Lcom/appsflyer/internal/q;->ʻ:Z

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    const/4 v0, 0x1

    .line 59
    :try_start_0
    new-instance v1, Ljava/net/URL;

    const/4 v2, 0x0

    aget-object p1, p1, v2

    invoke-direct {v1, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/appsflyer/internal/q;->ʼ:Ljava/net/URL;

    .line 60
    iget-boolean p1, p0, Lcom/appsflyer/internal/q;->ˏ:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v1, "UTF-8"

    if-eqz p1, :cond_3

    .line 1068
    :try_start_1
    sget-object p1, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez p1, :cond_1

    .line 1069
    new-instance p1, Lcom/appsflyer/internal/x;

    invoke-direct {p1}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object p1, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 1071
    :cond_1
    sget-object p1, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 61
    iget-object v3, p0, Lcom/appsflyer/internal/q;->ʼ:Ljava/net/URL;

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/appsflyer/internal/q;->ˋ:Ljava/lang/String;

    const-string v5, "server_request"

    new-array v6, v0, [Ljava/lang/String;

    aput-object v4, v6, v2

    .line 1183
    invoke-virtual {p1, v5, v3, v6}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 62
    iget-object p1, p0, Lcom/appsflyer/internal/q;->ˋ:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p1

    array-length p1, p1

    .line 63
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "call = "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/appsflyer/internal/q;->ʼ:Ljava/net/URL;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, "; size = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " byte"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-le p1, v0, :cond_2

    const-string p1, "s"

    goto :goto_0

    :cond_2
    const-string p1, ""

    :goto_0
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "; body = "

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/appsflyer/internal/q;->ˋ:Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/appsflyer/AFExecutor$2$1;->ˏ(Ljava/lang/String;)V

    .line 66
    :cond_3
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xe

    if-lt p1, v3, :cond_4

    const-string p1, "AppsFlyer"

    .line 68
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result p1

    invoke-static {p1}, Landroid/net/TrafficStats;->setThreadStatsTag(I)V

    .line 70
    :cond_4
    iget-object p1, p0, Lcom/appsflyer/internal/q;->ʼ:Ljava/net/URL;

    invoke-virtual {p1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p1

    check-cast p1, Ljava/net/HttpURLConnection;

    iput-object p1, p0, Lcom/appsflyer/internal/q;->ˎ:Ljava/net/HttpURLConnection;

    const/16 v3, 0x7530

    .line 71
    invoke-virtual {p1, v3}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 72
    iget-object p1, p0, Lcom/appsflyer/internal/q;->ˎ:Ljava/net/HttpURLConnection;

    invoke-virtual {p1, v3}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 73
    iget-object p1, p0, Lcom/appsflyer/internal/q;->ˎ:Ljava/net/HttpURLConnection;

    const-string v3, "POST"

    invoke-virtual {p1, v3}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 74
    iget-object p1, p0, Lcom/appsflyer/internal/q;->ˎ:Ljava/net/HttpURLConnection;

    invoke-virtual {p1, v0}, Ljava/net/URLConnection;->setDoInput(Z)V

    .line 75
    iget-object p1, p0, Lcom/appsflyer/internal/q;->ˎ:Ljava/net/HttpURLConnection;

    invoke-virtual {p1, v0}, Ljava/net/URLConnection;->setDoOutput(Z)V

    .line 76
    iget-object p1, p0, Lcom/appsflyer/internal/q;->ˎ:Ljava/net/HttpURLConnection;

    const-string v3, "Content-Type"

    const-string v4, "application/json"

    invoke-virtual {p1, v3, v4}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    iget-object p1, p0, Lcom/appsflyer/internal/q;->ˎ:Ljava/net/HttpURLConnection;

    invoke-virtual {p1}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p1

    .line 79
    new-instance v3, Ljava/io/BufferedWriter;

    new-instance v4, Ljava/io/OutputStreamWriter;

    invoke-direct {v4, p1, v1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 80
    iget-object v1, p0, Lcom/appsflyer/internal/q;->ˋ:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 81
    invoke-virtual {v3}, Ljava/io/Writer;->flush()V

    .line 82
    invoke-virtual {v3}, Ljava/io/Writer;->close()V

    .line 83
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V

    .line 84
    iget-object p1, p0, Lcom/appsflyer/internal/q;->ˎ:Ljava/net/HttpURLConnection;

    invoke-virtual {p1}, Ljava/net/URLConnection;->connect()V

    .line 86
    iget-object p1, p0, Lcom/appsflyer/internal/q;->ˎ:Ljava/net/HttpURLConnection;

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result p1

    .line 87
    iget-boolean v1, p0, Lcom/appsflyer/internal/q;->ˊ:Z

    if-eqz v1, :cond_5

    .line 88
    invoke-static {}, Lcom/appsflyer/AppsFlyerLibCore;->getInstance()Lcom/appsflyer/AppsFlyerLibCore;

    iget-object v1, p0, Lcom/appsflyer/internal/q;->ˎ:Ljava/net/HttpURLConnection;

    invoke-static {v1}, Lcom/appsflyer/AppsFlyerLibCore;->ॱ(Ljava/net/HttpURLConnection;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/appsflyer/internal/q;->ʽ:Ljava/lang/String;

    .line 90
    :cond_5
    iget-boolean v1, p0, Lcom/appsflyer/internal/q;->ˏ:Z

    if-eqz v1, :cond_7

    .line 2068
    sget-object v1, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v1, :cond_6

    .line 2069
    new-instance v1, Lcom/appsflyer/internal/x;

    invoke-direct {v1}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v1, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 2071
    :cond_6
    sget-object v1, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 91
    iget-object v3, p0, Lcom/appsflyer/internal/q;->ʼ:Ljava/net/URL;

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/appsflyer/internal/q;->ʽ:Ljava/lang/String;

    const-string v5, "server_response"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/String;

    .line 2187
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v2

    aput-object v4, v6, v0

    invoke-virtual {v1, v5, v3, v6}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    :cond_7
    const/16 v1, 0xc8

    if-ne p1, v1, :cond_8

    const-string p1, "Status 200 ok"

    .line 95
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 96
    iget-object p1, p0, Lcom/appsflyer/internal/q;->ॱॱ:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/Context;

    .line 97
    iget-object v1, p0, Lcom/appsflyer/internal/q;->ʼ:Ljava/net/URL;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/appsflyer/AppsFlyerLibCore;->ˏ:Ljava/lang/String;

    invoke-static {v2}, Lcom/appsflyer/ServerConfigHandler;->getUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_9

    if-eqz p1, :cond_9

    .line 98
    invoke-static {p1}, Lcom/appsflyer/AppsFlyerLibCore;->ˊ(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    .line 99
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v1, "sentRegisterRequestToAF"

    .line 100
    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 101
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    const-string p1, "Successfully registered for Uninstall Tracking"

    .line 102
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    goto :goto_1

    .line 105
    :cond_8
    iput-boolean v0, p0, Lcom/appsflyer/internal/q;->ᐝ:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p1

    .line 108
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Error while calling "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/appsflyer/internal/q;->ʼ:Ljava/net/URL;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p1}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 109
    iput-boolean v0, p0, Lcom/appsflyer/internal/q;->ᐝ:Z

    .line 112
    :cond_9
    :goto_1
    iget-object p1, p0, Lcom/appsflyer/internal/q;->ʽ:Ljava/lang/String;

    return-object p1
.end method

.method public final ˎ(Ljava/lang/String;)V
    .locals 1

    .line 119
    iget-boolean v0, p0, Lcom/appsflyer/internal/q;->ᐝ:Z

    if-eqz v0, :cond_0

    .line 120
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "Connection error: "

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    return-void

    .line 122
    :cond_0
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "Connection call succeeded: "

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    return-void
.end method
