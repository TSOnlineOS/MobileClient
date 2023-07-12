.class public final Lcom/facebook/bolts/CancellationTokenSource;
.super Ljava/lang/Object;
.source "CancellationTokenSource.kt"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nCancellationTokenSource.kt\nKotlin\n*S Kotlin\n*F\n+ 1 CancellationTokenSource.kt\ncom/facebook/bolts/CancellationTokenSource\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,196:1\n1#2:197\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000h\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000e\n\u0002\u0008\u0004\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0006\u0010\u0015\u001a\u00020\u0016J\u000e\u0010\u0017\u001a\u00020\u00162\u0006\u0010\u0018\u001a\u00020\u0019J\u0018\u0010\u0017\u001a\u00020\u00162\u0006\u0010\u0018\u001a\u00020\u00192\u0006\u0010\u001a\u001a\u00020\u001bH\u0002J\u0008\u0010\u001c\u001a\u00020\u0016H\u0002J\u0008\u0010\u001d\u001a\u00020\u0016H\u0016J\u0016\u0010\u001e\u001a\u00020\u00162\u000c\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\u001fH\u0002J\u0017\u0010 \u001a\u00020\u000e2\u0008\u0010!\u001a\u0004\u0018\u00010\"H\u0000\u00a2\u0006\u0002\u0008#J\r\u0010$\u001a\u00020\u0016H\u0000\u00a2\u0006\u0002\u0008%J\u0008\u0010&\u001a\u00020\u0016H\u0002J\u0008\u0010\'\u001a\u00020(H\u0016J\u0015\u0010)\u001a\u00020\u00162\u0006\u0010*\u001a\u00020\u000eH\u0000\u00a2\u0006\u0002\u0008+R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0011\u0010\u0008\u001a\u00020\u00048F\u00a2\u0006\u0006\u001a\u0004\u0008\u0008\u0010\tR\u000e\u0010\n\u001a\u00020\u000bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\rX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000f\u001a\u0008\u0012\u0002\u0008\u0003\u0018\u00010\u0010X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0011\u0010\u0011\u001a\u00020\u00128F\u00a2\u0006\u0006\u001a\u0004\u0008\u0013\u0010\u0014\u00a8\u0006,"
    }
    d2 = {
        "Lcom/facebook/bolts/CancellationTokenSource;",
        "Ljava/io/Closeable;",
        "()V",
        "cancellationRequested",
        "",
        "closed",
        "executor",
        "Ljava/util/concurrent/ScheduledExecutorService;",
        "isCancellationRequested",
        "()Z",
        "lock",
        "",
        "registrations",
        "",
        "Lcom/facebook/bolts/CancellationTokenRegistration;",
        "scheduledCancellation",
        "Ljava/util/concurrent/ScheduledFuture;",
        "token",
        "Lcom/facebook/bolts/CancellationToken;",
        "getToken",
        "()Lcom/facebook/bolts/CancellationToken;",
        "cancel",
        "",
        "cancelAfter",
        "delay",
        "",
        "timeUnit",
        "Ljava/util/concurrent/TimeUnit;",
        "cancelScheduledCancellation",
        "close",
        "notifyListeners",
        "",
        "register",
        "action",
        "Ljava/lang/Runnable;",
        "register$facebook_core_release",
        "throwIfCancellationRequested",
        "throwIfCancellationRequested$facebook_core_release",
        "throwIfClosed",
        "toString",
        "",
        "unregister",
        "registration",
        "unregister$facebook_core_release",
        "facebook-core_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x5,
        0x1
    }
.end annotation


# instance fields
.field private cancellationRequested:Z

.field private closed:Z

.field private final executor:Ljava/util/concurrent/ScheduledExecutorService;

.field private final lock:Ljava/lang/Object;

.field private final registrations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/facebook/bolts/CancellationTokenRegistration;",
            ">;"
        }
    .end annotation
.end field

.field private scheduledCancellation:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/facebook/bolts/CancellationTokenSource;->lock:Ljava/lang/Object;

    .line 37
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/facebook/bolts/CancellationTokenSource;->registrations:Ljava/util/List;

    .line 38
    sget-object v0, Lcom/facebook/bolts/BoltsExecutors;->Companion:Lcom/facebook/bolts/BoltsExecutors$Companion;

    invoke-virtual {v0}, Lcom/facebook/bolts/BoltsExecutors$Companion;->scheduled$facebook_core_release()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/bolts/CancellationTokenSource;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    return-void
.end method

.method public static final synthetic access$getLock$p(Lcom/facebook/bolts/CancellationTokenSource;)Ljava/lang/Object;
    .locals 0

    .line 35
    iget-object p0, p0, Lcom/facebook/bolts/CancellationTokenSource;->lock:Ljava/lang/Object;

    return-object p0
.end method

.method public static final synthetic access$getScheduledCancellation$p(Lcom/facebook/bolts/CancellationTokenSource;)Ljava/util/concurrent/ScheduledFuture;
    .locals 0

    .line 35
    iget-object p0, p0, Lcom/facebook/bolts/CancellationTokenSource;->scheduledCancellation:Ljava/util/concurrent/ScheduledFuture;

    return-object p0
.end method

.method public static final synthetic access$setScheduledCancellation$p(Lcom/facebook/bolts/CancellationTokenSource;Ljava/util/concurrent/ScheduledFuture;)V
    .locals 0

    .line 35
    iput-object p1, p0, Lcom/facebook/bolts/CancellationTokenSource;->scheduledCancellation:Ljava/util/concurrent/ScheduledFuture;

    return-void
.end method

.method private final cancelAfter(JLjava/util/concurrent/TimeUnit;)V
    .locals 4

    const/4 v0, -0x1

    int-to-long v0, v0

    cmp-long v2, p1, v0

    if-ltz v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_4

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-nez v2, :cond_1

    .line 91
    invoke-virtual {p0}, Lcom/facebook/bolts/CancellationTokenSource;->cancel()V

    return-void

    .line 94
    :cond_1
    iget-object v0, p0, Lcom/facebook/bolts/CancellationTokenSource;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 95
    :try_start_0
    iget-boolean v1, p0, Lcom/facebook/bolts/CancellationTokenSource;->cancellationRequested:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_2

    .line 96
    monitor-exit v0

    return-void

    .line 98
    :cond_2
    :try_start_1
    invoke-direct {p0}, Lcom/facebook/bolts/CancellationTokenSource;->cancelScheduledCancellation()V

    const-wide/16 v1, -0x1

    cmp-long v3, p1, v1

    if-eqz v3, :cond_3

    .line 101
    iget-object v1, p0, Lcom/facebook/bolts/CancellationTokenSource;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    .line 102
    new-instance v2, Lcom/facebook/bolts/CancellationTokenSource$cancelAfter$$inlined$synchronized$lambda$1;

    invoke-direct {v2, p0, p1, p2, p3}, Lcom/facebook/bolts/CancellationTokenSource$cancelAfter$$inlined$synchronized$lambda$1;-><init>(Lcom/facebook/bolts/CancellationTokenSource;JLjava/util/concurrent/TimeUnit;)V

    check-cast v2, Ljava/lang/Runnable;

    .line 101
    invoke-interface {v1, v2, p1, p2, p3}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/bolts/CancellationTokenSource;->scheduledCancellation:Ljava/util/concurrent/ScheduledFuture;

    .line 109
    :cond_3
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 94
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0

    throw p1

    :cond_4
    const-string p1, "Delay must be >= -1"

    .line 89
    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    check-cast p2, Ljava/lang/Throwable;

    throw p2
.end method

.method private final cancelScheduledCancellation()V
    .locals 2

    .line 191
    iget-object v0, p0, Lcom/facebook/bolts/CancellationTokenSource;->scheduledCancellation:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    .line 192
    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    const/4 v0, 0x0

    .line 193
    check-cast v0, Ljava/util/concurrent/ScheduledFuture;

    iput-object v0, p0, Lcom/facebook/bolts/CancellationTokenSource;->scheduledCancellation:Ljava/util/concurrent/ScheduledFuture;

    :cond_0
    return-void
.end method

.method private final notifyListeners(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/facebook/bolts/CancellationTokenRegistration;",
            ">;)V"
        }
    .end annotation

    .line 168
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/bolts/CancellationTokenRegistration;

    .line 169
    invoke-virtual {v0}, Lcom/facebook/bolts/CancellationTokenRegistration;->runAction$facebook_core_release()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private final throwIfClosed()V
    .locals 2

    .line 186
    iget-boolean v0, p0, Lcom/facebook/bolts/CancellationTokenSource;->closed:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Object already closed"

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    check-cast v0, Ljava/lang/Throwable;

    throw v0
.end method


# virtual methods
.method public final cancel()V
    .locals 3

    .line 64
    iget-object v0, p0, Lcom/facebook/bolts/CancellationTokenSource;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 65
    :try_start_0
    invoke-direct {p0}, Lcom/facebook/bolts/CancellationTokenSource;->throwIfClosed()V

    .line 66
    iget-boolean v1, p0, Lcom/facebook/bolts/CancellationTokenSource;->cancellationRequested:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    .line 67
    monitor-exit v0

    return-void

    .line 69
    :cond_0
    :try_start_1
    invoke-direct {p0}, Lcom/facebook/bolts/CancellationTokenSource;->cancelScheduledCancellation()V

    const/4 v1, 0x1

    .line 70
    iput-boolean v1, p0, Lcom/facebook/bolts/CancellationTokenSource;->cancellationRequested:Z

    .line 71
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/facebook/bolts/CancellationTokenSource;->registrations:Ljava/util/List;

    check-cast v2, Ljava/util/Collection;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    check-cast v1, Ljava/util/List;

    .line 72
    sget-object v2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 64
    monitor-exit v0

    .line 73
    invoke-direct {p0, v1}, Lcom/facebook/bolts/CancellationTokenSource;->notifyListeners(Ljava/util/List;)V

    return-void

    :catchall_0
    move-exception v1

    .line 64
    monitor-exit v0

    throw v1
.end method

.method public final cancelAfter(J)V
    .locals 1

    .line 85
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-direct {p0, p1, p2, v0}, Lcom/facebook/bolts/CancellationTokenSource;->cancelAfter(JLjava/util/concurrent/TimeUnit;)V

    return-void
.end method

.method public close()V
    .locals 3

    .line 113
    iget-object v0, p0, Lcom/facebook/bolts/CancellationTokenSource;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 114
    :try_start_0
    iget-boolean v1, p0, Lcom/facebook/bolts/CancellationTokenSource;->closed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    .line 115
    monitor-exit v0

    return-void

    .line 117
    :cond_0
    :try_start_1
    invoke-direct {p0}, Lcom/facebook/bolts/CancellationTokenSource;->cancelScheduledCancellation()V

    .line 118
    iget-object v1, p0, Lcom/facebook/bolts/CancellationTokenSource;->registrations:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/bolts/CancellationTokenRegistration;

    .line 119
    invoke-virtual {v2}, Lcom/facebook/bolts/CancellationTokenRegistration;->close()V

    goto :goto_0

    .line 121
    :cond_1
    iget-object v1, p0, Lcom/facebook/bolts/CancellationTokenSource;->registrations:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    const/4 v1, 0x1

    .line 122
    iput-boolean v1, p0, Lcom/facebook/bolts/CancellationTokenSource;->closed:Z

    .line 123
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 113
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public final getToken()Lcom/facebook/bolts/CancellationToken;
    .locals 2

    .line 55
    iget-object v0, p0, Lcom/facebook/bolts/CancellationTokenSource;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 56
    :try_start_0
    invoke-direct {p0}, Lcom/facebook/bolts/CancellationTokenSource;->throwIfClosed()V

    .line 57
    new-instance v1, Lcom/facebook/bolts/CancellationToken;

    invoke-direct {v1, p0}, Lcom/facebook/bolts/CancellationToken;-><init>(Lcom/facebook/bolts/CancellationTokenSource;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    .line 55
    monitor-exit v0

    throw v1
.end method

.method public final isCancellationRequested()Z
    .locals 2

    .line 46
    iget-object v0, p0, Lcom/facebook/bolts/CancellationTokenSource;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 47
    :try_start_0
    invoke-direct {p0}, Lcom/facebook/bolts/CancellationTokenSource;->throwIfClosed()V

    .line 48
    iget-boolean v1, p0, Lcom/facebook/bolts/CancellationTokenSource;->cancellationRequested:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    .line 46
    monitor-exit v0

    throw v1
.end method

.method public final register$facebook_core_release(Ljava/lang/Runnable;)Lcom/facebook/bolts/CancellationTokenRegistration;
    .locals 2

    .line 128
    iget-object v0, p0, Lcom/facebook/bolts/CancellationTokenSource;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 129
    :try_start_0
    invoke-direct {p0}, Lcom/facebook/bolts/CancellationTokenSource;->throwIfClosed()V

    .line 130
    new-instance v1, Lcom/facebook/bolts/CancellationTokenRegistration;

    invoke-direct {v1, p0, p1}, Lcom/facebook/bolts/CancellationTokenRegistration;-><init>(Lcom/facebook/bolts/CancellationTokenSource;Ljava/lang/Runnable;)V

    .line 131
    iget-boolean p1, p0, Lcom/facebook/bolts/CancellationTokenSource;->cancellationRequested:Z

    if-eqz p1, :cond_0

    .line 132
    invoke-virtual {v1}, Lcom/facebook/bolts/CancellationTokenRegistration;->runAction$facebook_core_release()V

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    goto :goto_0

    .line 134
    :cond_0
    iget-object p1, p0, Lcom/facebook/bolts/CancellationTokenSource;->registrations:Ljava/util/List;

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 128
    :goto_0
    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception p1

    monitor-exit v0

    throw p1
.end method

.method public final throwIfCancellationRequested$facebook_core_release()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/CancellationException;
        }
    .end annotation

    .line 146
    iget-object v0, p0, Lcom/facebook/bolts/CancellationTokenSource;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 147
    :try_start_0
    invoke-direct {p0}, Lcom/facebook/bolts/CancellationTokenSource;->throwIfClosed()V

    .line 148
    iget-boolean v1, p0, Lcom/facebook/bolts/CancellationTokenSource;->cancellationRequested:Z

    if-nez v1, :cond_0

    .line 151
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 146
    monitor-exit v0

    return-void

    .line 149
    :cond_0
    :try_start_1
    new-instance v1, Ljava/util/concurrent/CancellationException;

    invoke-direct {v1}, Ljava/util/concurrent/CancellationException;-><init>()V

    check-cast v1, Ljava/lang/Throwable;

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v1

    .line 146
    monitor-exit v0

    throw v1
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 174
    sget-object v0, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 175
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v1, 0x3

    new-array v2, v1, [Ljava/lang/Object;

    .line 177
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    .line 178
    invoke-virtual {p0}, Lcom/facebook/bolts/CancellationTokenSource;->hashCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    .line 179
    invoke-virtual {p0}, Lcom/facebook/bolts/CancellationTokenSource;->isCancellationRequested()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x2

    aput-object v3, v2, v4

    .line 174
    invoke-static {v2, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v1

    const-string v2, "%s@%s[cancellationRequested=%s]"

    invoke-static {v0, v2, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "java.lang.String.format(locale, format, *args)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method

.method public final unregister$facebook_core_release(Lcom/facebook/bolts/CancellationTokenRegistration;)V
    .locals 2

    const-string v0, "registration"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 155
    iget-object v0, p0, Lcom/facebook/bolts/CancellationTokenSource;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 156
    :try_start_0
    invoke-direct {p0}, Lcom/facebook/bolts/CancellationTokenSource;->throwIfClosed()V

    .line 157
    iget-object v1, p0, Lcom/facebook/bolts/CancellationTokenSource;->registrations:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 155
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0

    throw p1
.end method
