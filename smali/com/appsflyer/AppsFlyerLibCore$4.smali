.class final Lcom/appsflyer/AppsFlyerLibCore$4;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lcom/appsflyer/internal/p$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/appsflyer/AppsFlyerLibCore;->ॱ(Landroid/app/Application;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private synthetic ˎ:Lcom/appsflyer/AppsFlyerLibCore;


# direct methods
.method constructor <init>(Lcom/appsflyer/AppsFlyerLibCore;)V
    .locals 0

    .line 429
    iput-object p1, p0, Lcom/appsflyer/AppsFlyerLibCore$4;->ˎ:Lcom/appsflyer/AppsFlyerLibCore;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final ˋ(Landroid/app/Activity;)V
    .locals 3

    .line 432
    invoke-static {p1}, Lcom/appsflyer/AppsFlyerLibCore;->ˊ(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "appsFlyerCount"

    const/4 v2, 0x0

    .line 3855
    invoke-static {v0, v1, v2}, Lcom/appsflyer/AppsFlyerLibCore;->ˊ(Landroid/content/SharedPreferences;Ljava/lang/String;Z)I

    move-result v0

    const/4 v1, 0x2

    if-le v1, v0, :cond_0

    .line 433
    invoke-static {p1}, Lcom/appsflyer/internal/o;->ˏ(Landroid/content/Context;)Lcom/appsflyer/internal/o;

    move-result-object v0

    .line 4128
    iget-object v1, v0, Lcom/appsflyer/internal/o;->ˏ:Landroid/os/Handler;

    iget-object v2, v0, Lcom/appsflyer/internal/o;->ʻ:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 4130
    iget-object v1, v0, Lcom/appsflyer/internal/o;->ˏ:Landroid/os/Handler;

    iget-object v0, v0, Lcom/appsflyer/internal/o;->ʽ:Ljava/lang/Runnable;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    const-string v0, "onBecameForeground"

    .line 5015
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 5016
    invoke-static {}, Lcom/appsflyer/AppsFlyerLibCore;->getInstance()Lcom/appsflyer/AppsFlyerLibCore;

    move-result-object v0

    .line 5207
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, v0, Lcom/appsflyer/AppsFlyerLibCore;->ʽ:J

    .line 5017
    invoke-static {}, Lcom/appsflyer/AppsFlyerLibCore;->getInstance()Lcom/appsflyer/AppsFlyerLibCore;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1, v1}, Lcom/appsflyer/AppsFlyerLibCore;->ॱ(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;)V

    .line 5019
    invoke-static {}, Lcom/appsflyer/AFLogger;->resetDeltaTime()V

    return-void
.end method

.method public final ˎ(Ljava/lang/ref/WeakReference;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;)V"
        }
    .end annotation

    .line 439
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    invoke-static {v0}, Lcom/appsflyer/AFDeepLinkManager$2;->ˏ(Landroid/content/Context;)V

    .line 440
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/Context;

    invoke-static {p1}, Lcom/appsflyer/internal/o;->ˏ(Landroid/content/Context;)Lcom/appsflyer/internal/o;

    move-result-object p1

    .line 6137
    iget-object v0, p1, Lcom/appsflyer/internal/o;->ˏ:Landroid/os/Handler;

    iget-object p1, p1, Lcom/appsflyer/internal/o;->ʻ:Ljava/lang/Runnable;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
