.class public final synthetic Lkotlinx/coroutines/-$$Lambda$ThreadPoolDispatcherKt$75qNBDtr7Q5r4C6Qw0YyznZk3QY;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/util/concurrent/ThreadFactory;


# instance fields
.field public final synthetic f$0:I

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/String;Ljava/util/concurrent/atomic/AtomicInteger;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lkotlinx/coroutines/-$$Lambda$ThreadPoolDispatcherKt$75qNBDtr7Q5r4C6Qw0YyznZk3QY;->f$0:I

    iput-object p2, p0, Lkotlinx/coroutines/-$$Lambda$ThreadPoolDispatcherKt$75qNBDtr7Q5r4C6Qw0YyznZk3QY;->f$1:Ljava/lang/String;

    iput-object p3, p0, Lkotlinx/coroutines/-$$Lambda$ThreadPoolDispatcherKt$75qNBDtr7Q5r4C6Qw0YyznZk3QY;->f$2:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method


# virtual methods
.method public final newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .locals 3

    iget v0, p0, Lkotlinx/coroutines/-$$Lambda$ThreadPoolDispatcherKt$75qNBDtr7Q5r4C6Qw0YyznZk3QY;->f$0:I

    iget-object v1, p0, Lkotlinx/coroutines/-$$Lambda$ThreadPoolDispatcherKt$75qNBDtr7Q5r4C6Qw0YyznZk3QY;->f$1:Ljava/lang/String;

    iget-object v2, p0, Lkotlinx/coroutines/-$$Lambda$ThreadPoolDispatcherKt$75qNBDtr7Q5r4C6Qw0YyznZk3QY;->f$2:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-static {v0, v1, v2, p1}, Lkotlinx/coroutines/ThreadPoolDispatcherKt;->lambda$75qNBDtr7Q5r4C6Qw0YyznZk3QY(ILjava/lang/String;Ljava/util/concurrent/atomic/AtomicInteger;Ljava/lang/Runnable;)Ljava/lang/Thread;

    move-result-object p1

    return-object p1
.end method
