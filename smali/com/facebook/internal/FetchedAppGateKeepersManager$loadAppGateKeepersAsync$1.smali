.class final Lcom/facebook/internal/FetchedAppGateKeepersManager$loadAppGateKeepersAsync$1;
.super Ljava/lang/Object;
.source "FetchedAppGateKeepersManager.kt"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/internal/FetchedAppGateKeepersManager;->loadAppGateKeepersAsync(Lcom/facebook/internal/FetchedAppGateKeepersManager$Callback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
        "run"
    }
    k = 0x3
    mv = {
        0x1,
        0x5,
        0x1
    }
.end annotation


# instance fields
.field final synthetic $applicationId:Ljava/lang/String;

.field final synthetic $context:Landroid/content/Context;

.field final synthetic $gateKeepersKey:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/internal/FetchedAppGateKeepersManager$loadAppGateKeepersAsync$1;->$applicationId:Ljava/lang/String;

    iput-object p2, p0, Lcom/facebook/internal/FetchedAppGateKeepersManager$loadAppGateKeepersAsync$1;->$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/facebook/internal/FetchedAppGateKeepersManager$loadAppGateKeepersAsync$1;->$gateKeepersKey:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    invoke-static {p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-static {p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v0, :cond_1

    return-void

    .line 108
    :cond_1
    :try_start_1
    sget-object v0, Lcom/facebook/internal/FetchedAppGateKeepersManager;->INSTANCE:Lcom/facebook/internal/FetchedAppGateKeepersManager;

    iget-object v1, p0, Lcom/facebook/internal/FetchedAppGateKeepersManager$loadAppGateKeepersAsync$1;->$applicationId:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/facebook/internal/FetchedAppGateKeepersManager;->access$getAppGateKeepersQueryResponse(Lcom/facebook/internal/FetchedAppGateKeepersManager;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 109
    invoke-virtual {v0}, Lorg/json/JSONObject;->length()I

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 110
    iget-object v1, p0, Lcom/facebook/internal/FetchedAppGateKeepersManager$loadAppGateKeepersAsync$1;->$applicationId:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/facebook/internal/FetchedAppGateKeepersManager;->parseAppGateKeepersFromJSON$facebook_core_release(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 112
    iget-object v1, p0, Lcom/facebook/internal/FetchedAppGateKeepersManager$loadAppGateKeepersAsync$1;->$context:Landroid/content/Context;

    const-string v3, "com.facebook.internal.preferences.APP_GATEKEEPERS"

    invoke-virtual {v1, v3, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 114
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 115
    iget-object v3, p0, Lcom/facebook/internal/FetchedAppGateKeepersManager$loadAppGateKeepersAsync$1;->$gateKeepersKey:Ljava/lang/String;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v3, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 116
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 118
    sget-object v0, Lcom/facebook/internal/FetchedAppGateKeepersManager;->INSTANCE:Lcom/facebook/internal/FetchedAppGateKeepersManager;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/facebook/internal/FetchedAppGateKeepersManager;->access$setTimestamp$p(Lcom/facebook/internal/FetchedAppGateKeepersManager;Ljava/lang/Long;)V

    .line 120
    :cond_2
    sget-object v0, Lcom/facebook/internal/FetchedAppGateKeepersManager;->INSTANCE:Lcom/facebook/internal/FetchedAppGateKeepersManager;

    invoke-static {v0}, Lcom/facebook/internal/FetchedAppGateKeepersManager;->access$pollCallbacks(Lcom/facebook/internal/FetchedAppGateKeepersManager;)V

    .line 121
    sget-object v0, Lcom/facebook/internal/FetchedAppGateKeepersManager;->INSTANCE:Lcom/facebook/internal/FetchedAppGateKeepersManager;

    invoke-static {v0}, Lcom/facebook/internal/FetchedAppGateKeepersManager;->access$isLoading$p(Lcom/facebook/internal/FetchedAppGateKeepersManager;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 122
    :try_start_2
    invoke-static {v0, p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    return-void

    :catchall_1
    move-exception v0

    invoke-static {v0, p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-void
.end method
