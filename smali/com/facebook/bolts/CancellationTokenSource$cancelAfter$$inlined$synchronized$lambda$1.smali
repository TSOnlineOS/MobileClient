.class final Lcom/facebook/bolts/CancellationTokenSource$cancelAfter$$inlined$synchronized$lambda$1;
.super Ljava/lang/Object;
.source "CancellationTokenSource.kt"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/bolts/CancellationTokenSource;->cancelAfter(JLjava/util/concurrent/TimeUnit;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nCancellationTokenSource.kt\nKotlin\n*S Kotlin\n*F\n+ 1 CancellationTokenSource.kt\ncom/facebook/bolts/CancellationTokenSource$cancelAfter$2$1\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,196:1\n1#2:197\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002\u00a8\u0006\u0003"
    }
    d2 = {
        "<anonymous>",
        "",
        "run",
        "com/facebook/bolts/CancellationTokenSource$cancelAfter$2$1"
    }
    k = 0x3
    mv = {
        0x1,
        0x5,
        0x1
    }
.end annotation


# instance fields
.field final synthetic $delay$inlined:J

.field final synthetic $timeUnit$inlined:Ljava/util/concurrent/TimeUnit;

.field final synthetic this$0:Lcom/facebook/bolts/CancellationTokenSource;


# direct methods
.method constructor <init>(Lcom/facebook/bolts/CancellationTokenSource;JLjava/util/concurrent/TimeUnit;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/bolts/CancellationTokenSource$cancelAfter$$inlined$synchronized$lambda$1;->this$0:Lcom/facebook/bolts/CancellationTokenSource;

    iput-wide p2, p0, Lcom/facebook/bolts/CancellationTokenSource$cancelAfter$$inlined$synchronized$lambda$1;->$delay$inlined:J

    iput-object p4, p0, Lcom/facebook/bolts/CancellationTokenSource$cancelAfter$$inlined$synchronized$lambda$1;->$timeUnit$inlined:Ljava/util/concurrent/TimeUnit;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    invoke-static {p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-static {p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    if-eqz v0, :cond_1

    return-void

    .line 103
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/facebook/bolts/CancellationTokenSource$cancelAfter$$inlined$synchronized$lambda$1;->this$0:Lcom/facebook/bolts/CancellationTokenSource;

    invoke-static {v0}, Lcom/facebook/bolts/CancellationTokenSource;->access$getLock$p(Lcom/facebook/bolts/CancellationTokenSource;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    iget-object v1, p0, Lcom/facebook/bolts/CancellationTokenSource$cancelAfter$$inlined$synchronized$lambda$1;->this$0:Lcom/facebook/bolts/CancellationTokenSource;

    const/4 v2, 0x0

    check-cast v2, Ljava/util/concurrent/ScheduledFuture;

    invoke-static {v1, v2}, Lcom/facebook/bolts/CancellationTokenSource;->access$setScheduledCancellation$p(Lcom/facebook/bolts/CancellationTokenSource;Ljava/util/concurrent/ScheduledFuture;)V

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    monitor-exit v0

    .line 104
    iget-object v0, p0, Lcom/facebook/bolts/CancellationTokenSource$cancelAfter$$inlined$synchronized$lambda$1;->this$0:Lcom/facebook/bolts/CancellationTokenSource;

    invoke-virtual {v0}, Lcom/facebook/bolts/CancellationTokenSource;->cancel()V

    return-void

    :catchall_0
    move-exception v1

    .line 103
    monitor-exit v0

    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :catchall_1
    move-exception v0

    .line 105
    :try_start_4
    invoke-static {v0, p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    return-void

    :catchall_2
    move-exception v0

    invoke-static {v0, p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-void
.end method
