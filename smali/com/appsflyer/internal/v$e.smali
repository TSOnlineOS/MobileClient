.class public final Lcom/appsflyer/internal/v$e;
.super Landroid/os/AsyncTask;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/appsflyer/internal/v;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "e"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field private final ˊ:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private ˋ:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/ref/WeakReference;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;)V"
        }
    .end annotation

    .line 138
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 139
    iput-object p1, p0, Lcom/appsflyer/internal/v$e;->ˊ:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method private varargs ˊ()Ljava/lang/String;
    .locals 3

    const/4 v0, 0x0

    .line 152
    :try_start_0
    iget-object v1, p0, Lcom/appsflyer/internal/v$e;->ˋ:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 153
    iget-object v1, p0, Lcom/appsflyer/internal/v$e;->ˊ:Ljava/lang/ref/WeakReference;

    iget-object v2, p0, Lcom/appsflyer/internal/v$e;->ˋ:Ljava/lang/String;

    .line 1016
    invoke-static {v1, v2}, Lcom/appsflyer/internal/v;->ˋ(Ljava/lang/ref/WeakReference;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    return-object v0

    :catchall_0
    move-exception v1

    const-string v2, "Error registering for uninstall feature"

    .line 157
    invoke-static {v2, v1}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object v0
.end method


# virtual methods
.method protected final synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 134
    invoke-direct {p0}, Lcom/appsflyer/internal/v$e;->ˊ()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected final synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 4

    .line 134
    check-cast p1, Ljava/lang/String;

    .line 1164
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1166
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "afUninstallToken"

    invoke-virtual {v0, v1}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1167
    new-instance v1, Lcom/appsflyer/internal/b$b$a;

    invoke-direct {v1, p1}, Lcom/appsflyer/internal/b$b$a;-><init>(Ljava/lang/String;)V

    if-nez v0, :cond_0

    .line 1169
    iget-object p1, p0, Lcom/appsflyer/internal/v$e;->ˊ:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/Context;

    invoke-static {p1, v1}, Lcom/appsflyer/internal/v;->ॱ(Landroid/content/Context;Lcom/appsflyer/internal/b$b$a;)V

    return-void

    .line 1171
    :cond_0
    invoke-static {v0}, Lcom/appsflyer/internal/b$b$a;->ˎ(Ljava/lang/String;)Lcom/appsflyer/internal/b$b$a;

    move-result-object p1

    .line 2071
    iget-wide v2, v1, Lcom/appsflyer/internal/b$b$a;->ˏ:J

    .line 2075
    iget-object v0, v1, Lcom/appsflyer/internal/b$b$a;->ˎ:Ljava/lang/String;

    .line 2042
    invoke-virtual {p1, v2, v3, v0}, Lcom/appsflyer/internal/b$b$a;->ˊ(JLjava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1176
    iget-object v0, p0, Lcom/appsflyer/internal/v$e;->ˊ:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/appsflyer/internal/v;->ॱ(Landroid/content/Context;Lcom/appsflyer/internal/b$b$a;)V

    :cond_1
    return-void
.end method

.method protected final onPreExecute()V
    .locals 2

    .line 144
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    .line 145
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "gcmProjectNumber"

    invoke-virtual {v0, v1}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/appsflyer/internal/v$e;->ˋ:Ljava/lang/String;

    return-void
.end method
