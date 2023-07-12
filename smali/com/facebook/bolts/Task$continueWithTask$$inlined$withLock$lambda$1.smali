.class final Lcom/facebook/bolts/Task$continueWithTask$$inlined$withLock$lambda$1;
.super Ljava/lang/Object;
.source "Task.kt"

# interfaces
.implements Lcom/facebook/bolts/Continuation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/bolts/Task;->continueWithTask(Lcom/facebook/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)Lcom/facebook/bolts/Task;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<TTaskResult:",
        "Ljava/lang/Object;",
        "TContinuationResult:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/facebook/bolts/Continuation;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0010\u0000\u001a\u0004\u0018\u00010\u0001\"\u0004\u0008\u0000\u0010\u0002\"\u0004\u0008\u0001\u0010\u00032\u0014\u0010\u0004\u001a\u0010\u0012\u000c\u0012\n \u0006*\u0004\u0018\u0001H\u0003H\u00030\u0005H\n\u00a2\u0006\u0002\u0008\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "<anonymous>",
        "Ljava/lang/Void;",
        "TContinuationResult",
        "TResult",
        "task",
        "Lcom/facebook/bolts/Task;",
        "kotlin.jvm.PlatformType",
        "then",
        "com/facebook/bolts/Task$continueWithTask$1$1"
    }
    k = 0x3
    mv = {
        0x1,
        0x5,
        0x1
    }
.end annotation


# instance fields
.field final synthetic $completed$inlined:Lkotlin/jvm/internal/Ref$BooleanRef;

.field final synthetic $continuation$inlined:Lcom/facebook/bolts/Continuation;

.field final synthetic $ct$inlined:Lcom/facebook/bolts/CancellationToken;

.field final synthetic $executor$inlined:Ljava/util/concurrent/Executor;

.field final synthetic $tcs$inlined:Lcom/facebook/bolts/TaskCompletionSource;

.field final synthetic this$0:Lcom/facebook/bolts/Task;


# direct methods
.method constructor <init>(Lcom/facebook/bolts/Task;Lkotlin/jvm/internal/Ref$BooleanRef;Lcom/facebook/bolts/TaskCompletionSource;Lcom/facebook/bolts/Continuation;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/bolts/Task$continueWithTask$$inlined$withLock$lambda$1;->this$0:Lcom/facebook/bolts/Task;

    iput-object p2, p0, Lcom/facebook/bolts/Task$continueWithTask$$inlined$withLock$lambda$1;->$completed$inlined:Lkotlin/jvm/internal/Ref$BooleanRef;

    iput-object p3, p0, Lcom/facebook/bolts/Task$continueWithTask$$inlined$withLock$lambda$1;->$tcs$inlined:Lcom/facebook/bolts/TaskCompletionSource;

    iput-object p4, p0, Lcom/facebook/bolts/Task$continueWithTask$$inlined$withLock$lambda$1;->$continuation$inlined:Lcom/facebook/bolts/Continuation;

    iput-object p5, p0, Lcom/facebook/bolts/Task$continueWithTask$$inlined$withLock$lambda$1;->$executor$inlined:Ljava/util/concurrent/Executor;

    iput-object p6, p0, Lcom/facebook/bolts/Task$continueWithTask$$inlined$withLock$lambda$1;->$ct$inlined:Lcom/facebook/bolts/CancellationToken;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic then(Lcom/facebook/bolts/Task;)Ljava/lang/Object;
    .locals 0

    .line 38
    invoke-virtual {p0, p1}, Lcom/facebook/bolts/Task$continueWithTask$$inlined$withLock$lambda$1;->then(Lcom/facebook/bolts/Task;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public final then(Lcom/facebook/bolts/Task;)Ljava/lang/Void;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/bolts/Task<",
            "TTResult;>;)",
            "Ljava/lang/Void;"
        }
    .end annotation

    const-string v0, "task"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 314
    sget-object v1, Lcom/facebook/bolts/Task;->Companion:Lcom/facebook/bolts/Task$Companion;

    iget-object v2, p0, Lcom/facebook/bolts/Task$continueWithTask$$inlined$withLock$lambda$1;->$tcs$inlined:Lcom/facebook/bolts/TaskCompletionSource;

    iget-object v3, p0, Lcom/facebook/bolts/Task$continueWithTask$$inlined$withLock$lambda$1;->$continuation$inlined:Lcom/facebook/bolts/Continuation;

    iget-object v5, p0, Lcom/facebook/bolts/Task$continueWithTask$$inlined$withLock$lambda$1;->$executor$inlined:Ljava/util/concurrent/Executor;

    iget-object v6, p0, Lcom/facebook/bolts/Task$continueWithTask$$inlined$withLock$lambda$1;->$ct$inlined:Lcom/facebook/bolts/CancellationToken;

    move-object v4, p1

    invoke-static/range {v1 .. v6}, Lcom/facebook/bolts/Task$Companion;->access$completeAfterTask(Lcom/facebook/bolts/Task$Companion;Lcom/facebook/bolts/TaskCompletionSource;Lcom/facebook/bolts/Continuation;Lcom/facebook/bolts/Task;Ljava/util/concurrent/Executor;Lcom/facebook/bolts/CancellationToken;)V

    const/4 p1, 0x0

    return-object p1
.end method
