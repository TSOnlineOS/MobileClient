.class public Lcom/appsflyer/AFExecutor;
.super Ljava/lang/Object;
.source ""


# static fields
.field private static ˋ:Lcom/appsflyer/AFExecutor;


# instance fields
.field ˊ:Ljava/util/concurrent/Executor;

.field private ˎ:Ljava/util/concurrent/ScheduledExecutorService;

.field ˏ:Ljava/util/concurrent/ScheduledExecutorService;

.field private final ॱ:Ljava/util/concurrent/ThreadFactory;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    new-instance v0, Lcom/appsflyer/AFExecutor$2;

    invoke-direct {v0, p0}, Lcom/appsflyer/AFExecutor$2;-><init>(Lcom/appsflyer/AFExecutor;)V

    iput-object v0, p0, Lcom/appsflyer/AFExecutor;->ॱ:Ljava/util/concurrent/ThreadFactory;

    return-void
.end method

.method public static getInstance()Lcom/appsflyer/AFExecutor;
    .locals 1

    .line 47
    sget-object v0, Lcom/appsflyer/AFExecutor;->ˋ:Lcom/appsflyer/AFExecutor;

    if-nez v0, :cond_0

    .line 48
    new-instance v0, Lcom/appsflyer/AFExecutor;

    invoke-direct {v0}, Lcom/appsflyer/AFExecutor;-><init>()V

    sput-object v0, Lcom/appsflyer/AFExecutor;->ˋ:Lcom/appsflyer/AFExecutor;

    .line 50
    :cond_0
    sget-object v0, Lcom/appsflyer/AFExecutor;->ˋ:Lcom/appsflyer/AFExecutor;

    return-object v0
.end method

.method static ˋ(Ljava/util/concurrent/ExecutorService;)V
    .locals 4

    const-string v0, "killing non-finished tasks"

    :try_start_0
    const-string v1, "shut downing executor ..."

    .line 117
    invoke-static {v1}, Lcom/appsflyer/AFLogger;->afRDLog(Ljava/lang/String;)V

    .line 118
    invoke-interface {p0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    const-wide/16 v1, 0xa

    .line 119
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {p0, v1, v2, v3}, Ljava/util/concurrent/ExecutorService;->awaitTermination(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 124
    invoke-interface {p0}, Ljava/util/concurrent/ExecutorService;->isTerminated()Z

    move-result v1

    if-nez v1, :cond_0

    .line 125
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afRDLog(Ljava/lang/String;)V

    .line 127
    :cond_0
    invoke-interface {p0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    return-void

    :catchall_0
    move-exception v1

    goto :goto_0

    :catch_0
    :try_start_1
    const-string v1, "InterruptedException!!!"

    .line 121
    invoke-static {v1}, Lcom/appsflyer/AFLogger;->afRDLog(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 124
    invoke-interface {p0}, Ljava/util/concurrent/ExecutorService;->isTerminated()Z

    move-result v1

    if-nez v1, :cond_1

    .line 125
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afRDLog(Ljava/lang/String;)V

    .line 127
    :cond_1
    invoke-interface {p0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    return-void

    .line 124
    :goto_0
    invoke-interface {p0}, Ljava/util/concurrent/ExecutorService;->isTerminated()Z

    move-result v2

    if-nez v2, :cond_2

    .line 125
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afRDLog(Ljava/lang/String;)V

    .line 127
    :cond_2
    invoke-interface {p0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    throw v1
.end method


# virtual methods
.method public getSerialExecutor()Ljava/util/concurrent/ScheduledExecutorService;
    .locals 1

    .line 54
    iget-object v0, p0, Lcom/appsflyer/AFExecutor;->ˎ:Ljava/util/concurrent/ScheduledExecutorService;

    if-nez v0, :cond_0

    .line 55
    iget-object v0, p0, Lcom/appsflyer/AFExecutor;->ॱ:Ljava/util/concurrent/ThreadFactory;

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/appsflyer/AFExecutor;->ˎ:Ljava/util/concurrent/ScheduledExecutorService;

    .line 57
    :cond_0
    iget-object v0, p0, Lcom/appsflyer/AFExecutor;->ˎ:Ljava/util/concurrent/ScheduledExecutorService;

    return-object v0
.end method

.method public getThreadPoolExecutor()Ljava/util/concurrent/Executor;
    .locals 2

    .line 63
    iget-object v0, p0, Lcom/appsflyer/AFExecutor;->ˊ:Ljava/util/concurrent/Executor;

    if-eqz v0, :cond_1

    instance-of v1, v0, Ljava/util/concurrent/ThreadPoolExecutor;

    if-eqz v1, :cond_0

    check-cast v0, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 65
    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->isShutdown()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/appsflyer/AFExecutor;->ˊ:Ljava/util/concurrent/Executor;

    check-cast v0, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 66
    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->isTerminated()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/appsflyer/AFExecutor;->ˊ:Ljava/util/concurrent/Executor;

    check-cast v0, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 67
    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->isTerminating()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    if-eqz v0, :cond_3

    .line 70
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_2

    const/4 v0, 0x2

    .line 71
    iget-object v1, p0, Lcom/appsflyer/AFExecutor;->ॱ:Ljava/util/concurrent/ThreadFactory;

    invoke-static {v0, v1}, Ljava/util/concurrent/Executors;->newFixedThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/appsflyer/AFExecutor;->ˊ:Ljava/util/concurrent/Executor;

    goto :goto_2

    .line 73
    :cond_2
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    return-object v0

    .line 77
    :cond_3
    :goto_2
    iget-object v0, p0, Lcom/appsflyer/AFExecutor;->ˊ:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method final ˏ()Ljava/util/concurrent/ScheduledThreadPoolExecutor;
    .locals 2

    .line 82
    iget-object v0, p0, Lcom/appsflyer/AFExecutor;->ˏ:Ljava/util/concurrent/ScheduledExecutorService;

    if-eqz v0, :cond_1

    .line 84
    invoke-interface {v0}, Ljava/util/concurrent/ScheduledExecutorService;->isShutdown()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/appsflyer/AFExecutor;->ˏ:Ljava/util/concurrent/ScheduledExecutorService;

    .line 85
    invoke-interface {v0}, Ljava/util/concurrent/ScheduledExecutorService;->isTerminated()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    if-eqz v0, :cond_2

    const/4 v0, 0x2

    .line 88
    iget-object v1, p0, Lcom/appsflyer/AFExecutor;->ॱ:Ljava/util/concurrent/ThreadFactory;

    .line 89
    invoke-static {v0, v1}, Ljava/util/concurrent/Executors;->newScheduledThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/appsflyer/AFExecutor;->ˏ:Ljava/util/concurrent/ScheduledExecutorService;

    .line 92
    :cond_2
    iget-object v0, p0, Lcom/appsflyer/AFExecutor;->ˏ:Ljava/util/concurrent/ScheduledExecutorService;

    check-cast v0, Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    return-object v0
.end method
