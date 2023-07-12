.class public Lcom/facebook/internal/AppCall;
.super Ljava/lang/Object;
.source "AppCall.java"


# static fields
.field private static currentPendingCall:Lcom/facebook/internal/AppCall;


# instance fields
.field private callId:Ljava/util/UUID;

.field private requestCode:I

.field private requestIntent:Landroid/content/Intent;


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 73
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/facebook/internal/AppCall;-><init>(ILjava/util/UUID;)V

    return-void
.end method

.method public constructor <init>(ILjava/util/UUID;)V
    .locals 0

    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    iput-object p2, p0, Lcom/facebook/internal/AppCall;->callId:Ljava/util/UUID;

    .line 84
    iput p1, p0, Lcom/facebook/internal/AppCall;->requestCode:I

    return-void
.end method

.method public static declared-synchronized finishPendingCall(Ljava/util/UUID;I)Lcom/facebook/internal/AppCall;
    .locals 4

    const-class v0, Lcom/facebook/internal/AppCall;

    monitor-enter v0

    :try_start_0
    invoke-static {v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    monitor-exit v0

    return-object v2

    .line 44
    :cond_0
    :try_start_1
    invoke-static {}, Lcom/facebook/internal/AppCall;->getCurrentPendingCall()Lcom/facebook/internal/AppCall;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 46
    invoke-virtual {v1}, Lcom/facebook/internal/AppCall;->getCallId()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    .line 47
    invoke-virtual {v1}, Lcom/facebook/internal/AppCall;->getRequestCode()I

    move-result p0

    if-eq p0, p1, :cond_1

    goto :goto_0

    .line 51
    :cond_1
    invoke-static {v2}, Lcom/facebook/internal/AppCall;->setCurrentPendingCall(Lcom/facebook/internal/AppCall;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 53
    monitor-exit v0

    return-object v1

    .line 48
    :cond_2
    :goto_0
    monitor-exit v0

    return-object v2

    :catchall_0
    move-exception p0

    .line 53
    :try_start_2
    invoke-static {p0, v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    monitor-exit v0

    return-object v2

    :catchall_1
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static getCurrentPendingCall()Lcom/facebook/internal/AppCall;
    .locals 3

    const-class v0, Lcom/facebook/internal/AppCall;

    invoke-static {v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    return-object v2

    .line 40
    :cond_0
    :try_start_0
    sget-object v0, Lcom/facebook/internal/AppCall;->currentPendingCall:Lcom/facebook/internal/AppCall;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    :catchall_0
    move-exception v1

    invoke-static {v1, v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-object v2
.end method

.method private static declared-synchronized setCurrentPendingCall(Lcom/facebook/internal/AppCall;)Z
    .locals 3

    const-class v0, Lcom/facebook/internal/AppCall;

    monitor-enter v0

    :try_start_0
    invoke-static {v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    monitor-exit v0

    return v2

    .line 57
    :cond_0
    :try_start_1
    invoke-static {}, Lcom/facebook/internal/AppCall;->getCurrentPendingCall()Lcom/facebook/internal/AppCall;

    move-result-object v1

    .line 58
    sput-object p0, Lcom/facebook/internal/AppCall;->currentPendingCall:Lcom/facebook/internal/AppCall;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v1, :cond_1

    const/4 v2, 0x1

    .line 60
    :cond_1
    monitor-exit v0

    return v2

    :catchall_0
    move-exception p0

    :try_start_2
    invoke-static {p0, v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    monitor-exit v0

    return v2

    :catchall_1
    move-exception p0

    monitor-exit v0

    throw p0
.end method


# virtual methods
.method public getCallId()Ljava/util/UUID;
    .locals 2

    invoke-static {p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    .line 102
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/facebook/internal/AppCall;->callId:Ljava/util/UUID;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    :catchall_0
    move-exception v0

    invoke-static {v0, p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-object v1
.end method

.method public getRequestCode()I
    .locals 2

    invoke-static {p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 111
    :cond_0
    :try_start_0
    iget v0, p0, Lcom/facebook/internal/AppCall;->requestCode:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return v0

    :catchall_0
    move-exception v0

    invoke-static {v0, p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return v1
.end method

.method public getRequestIntent()Landroid/content/Intent;
    .locals 2

    invoke-static {p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    .line 93
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/facebook/internal/AppCall;->requestIntent:Landroid/content/Intent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    :catchall_0
    move-exception v0

    invoke-static {v0, p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-object v1
.end method

.method public setPending()Z
    .locals 2

    invoke-static {p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 126
    :cond_0
    :try_start_0
    invoke-static {p0}, Lcom/facebook/internal/AppCall;->setCurrentPendingCall(Lcom/facebook/internal/AppCall;)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return v0

    :catchall_0
    move-exception v0

    invoke-static {v0, p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return v1
.end method

.method public setRequestCode(I)V
    .locals 1

    invoke-static {p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 115
    :cond_0
    :try_start_0
    iput p1, p0, Lcom/facebook/internal/AppCall;->requestCode:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    .line 116
    invoke-static {p1, p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-void
.end method

.method public setRequestIntent(Landroid/content/Intent;)V
    .locals 1

    invoke-static {p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 119
    :cond_0
    :try_start_0
    iput-object p1, p0, Lcom/facebook/internal/AppCall;->requestIntent:Landroid/content/Intent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    .line 120
    invoke-static {p1, p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-void
.end method
