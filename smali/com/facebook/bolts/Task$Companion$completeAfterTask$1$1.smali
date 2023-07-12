.class final Lcom/facebook/bolts/Task$Companion$completeAfterTask$1$1;
.super Ljava/lang/Object;
.source "Task.kt"

# interfaces
.implements Lcom/facebook/bolts/Continuation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/bolts/Task$Companion$completeAfterTask$1;->run()V
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
        "\u0000\u0012\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0010\u0000\u001a\u0004\u0018\u00010\u0001\"\u0004\u0008\u0000\u0010\u0002\"\u0004\u0008\u0001\u0010\u0003\"\u0004\u0008\u0002\u0010\u00032\u0014\u0010\u0004\u001a\u0010\u0012\u000c\u0012\n \u0006*\u0004\u0018\u0001H\u0002H\u00020\u0005H\n\u00a2\u0006\u0002\u0008\u0007"
    }
    d2 = {
        "<anonymous>",
        "Ljava/lang/Void;",
        "TContinuationResult",
        "TResult",
        "task",
        "Lcom/facebook/bolts/Task;",
        "kotlin.jvm.PlatformType",
        "then"
    }
    k = 0x3
    mv = {
        0x1,
        0x5,
        0x1
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/bolts/Task$Companion$completeAfterTask$1;


# direct methods
.method constructor <init>(Lcom/facebook/bolts/Task$Companion$completeAfterTask$1;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/bolts/Task$Companion$completeAfterTask$1$1;->this$0:Lcom/facebook/bolts/Task$Companion$completeAfterTask$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic then(Lcom/facebook/bolts/Task;)Ljava/lang/Object;
    .locals 0

    .line 526
    invoke-virtual {p0, p1}, Lcom/facebook/bolts/Task$Companion$completeAfterTask$1$1;->then(Lcom/facebook/bolts/Task;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public final then(Lcom/facebook/bolts/Task;)Ljava/lang/Void;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/bolts/Task<",
            "TTContinuationResult;>;)",
            "Ljava/lang/Void;"
        }
    .end annotation

    const-string v0, "task"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 950
    iget-object v0, p0, Lcom/facebook/bolts/Task$Companion$completeAfterTask$1$1;->this$0:Lcom/facebook/bolts/Task$Companion$completeAfterTask$1;

    iget-object v0, v0, Lcom/facebook/bolts/Task$Companion$completeAfterTask$1;->$ct:Lcom/facebook/bolts/CancellationToken;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/facebook/bolts/Task$Companion$completeAfterTask$1$1;->this$0:Lcom/facebook/bolts/Task$Companion$completeAfterTask$1;

    iget-object v0, v0, Lcom/facebook/bolts/Task$Companion$completeAfterTask$1;->$ct:Lcom/facebook/bolts/CancellationToken;

    invoke-virtual {v0}, Lcom/facebook/bolts/CancellationToken;->isCancellationRequested()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 951
    iget-object p1, p0, Lcom/facebook/bolts/Task$Companion$completeAfterTask$1$1;->this$0:Lcom/facebook/bolts/Task$Companion$completeAfterTask$1;

    iget-object p1, p1, Lcom/facebook/bolts/Task$Companion$completeAfterTask$1;->$tcs:Lcom/facebook/bolts/TaskCompletionSource;

    invoke-virtual {p1}, Lcom/facebook/bolts/TaskCompletionSource;->setCancelled()V

    return-object v1

    .line 954
    :cond_0
    invoke-virtual {p1}, Lcom/facebook/bolts/Task;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 955
    iget-object p1, p0, Lcom/facebook/bolts/Task$Companion$completeAfterTask$1$1;->this$0:Lcom/facebook/bolts/Task$Companion$completeAfterTask$1;

    iget-object p1, p1, Lcom/facebook/bolts/Task$Companion$completeAfterTask$1;->$tcs:Lcom/facebook/bolts/TaskCompletionSource;

    invoke-virtual {p1}, Lcom/facebook/bolts/TaskCompletionSource;->setCancelled()V

    goto :goto_0

    .line 956
    :cond_1
    invoke-virtual {p1}, Lcom/facebook/bolts/Task;->isFaulted()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 957
    iget-object v0, p0, Lcom/facebook/bolts/Task$Companion$completeAfterTask$1$1;->this$0:Lcom/facebook/bolts/Task$Companion$completeAfterTask$1;

    iget-object v0, v0, Lcom/facebook/bolts/Task$Companion$completeAfterTask$1;->$tcs:Lcom/facebook/bolts/TaskCompletionSource;

    invoke-virtual {p1}, Lcom/facebook/bolts/Task;->getError()Ljava/lang/Exception;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/facebook/bolts/TaskCompletionSource;->setError(Ljava/lang/Exception;)V

    goto :goto_0

    .line 959
    :cond_2
    iget-object v0, p0, Lcom/facebook/bolts/Task$Companion$completeAfterTask$1$1;->this$0:Lcom/facebook/bolts/Task$Companion$completeAfterTask$1;

    iget-object v0, v0, Lcom/facebook/bolts/Task$Companion$completeAfterTask$1;->$tcs:Lcom/facebook/bolts/TaskCompletionSource;

    invoke-virtual {p1}, Lcom/facebook/bolts/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/facebook/bolts/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    :goto_0
    return-object v1
.end method
