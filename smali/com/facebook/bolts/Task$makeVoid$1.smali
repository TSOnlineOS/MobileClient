.class final Lcom/facebook/bolts/Task$makeVoid$1;
.super Ljava/lang/Object;
.source "Task.kt"

# interfaces
.implements Lcom/facebook/bolts/Continuation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/bolts/Task;->makeVoid()Lcom/facebook/bolts/Task;
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
        "\u0000\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0010\u0000\u001a\n\u0012\u0004\u0012\u00020\u0002\u0018\u00010\u0001\"\u0004\u0008\u0000\u0010\u00032\u0014\u0010\u0004\u001a\u0010\u0012\u000c\u0012\n \u0005*\u0004\u0018\u0001H\u0003H\u00030\u0001H\n\u00a2\u0006\u0002\u0008\u0006"
    }
    d2 = {
        "<anonymous>",
        "Lcom/facebook/bolts/Task;",
        "Ljava/lang/Void;",
        "TResult",
        "task",
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


# static fields
.field public static final INSTANCE:Lcom/facebook/bolts/Task$makeVoid$1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/facebook/bolts/Task$makeVoid$1;

    invoke-direct {v0}, Lcom/facebook/bolts/Task$makeVoid$1;-><init>()V

    sput-object v0, Lcom/facebook/bolts/Task$makeVoid$1;->INSTANCE:Lcom/facebook/bolts/Task$makeVoid$1;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final then(Lcom/facebook/bolts/Task;)Lcom/facebook/bolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/bolts/Task<",
            "TTResult;>;)",
            "Lcom/facebook/bolts/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    const-string v0, "task"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 160
    invoke-virtual {p1}, Lcom/facebook/bolts/Task;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 161
    sget-object p1, Lcom/facebook/bolts/Task;->Companion:Lcom/facebook/bolts/Task$Companion;

    invoke-virtual {p1}, Lcom/facebook/bolts/Task$Companion;->cancelled()Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1

    .line 163
    :cond_0
    invoke-virtual {p1}, Lcom/facebook/bolts/Task;->isFaulted()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 164
    sget-object v0, Lcom/facebook/bolts/Task;->Companion:Lcom/facebook/bolts/Task$Companion;

    invoke-virtual {p1}, Lcom/facebook/bolts/Task;->getError()Ljava/lang/Exception;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/facebook/bolts/Task$Companion;->forError(Ljava/lang/Exception;)Lcom/facebook/bolts/Task;

    move-result-object p1

    goto :goto_0

    .line 165
    :cond_1
    sget-object p1, Lcom/facebook/bolts/Task;->Companion:Lcom/facebook/bolts/Task$Companion;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/facebook/bolts/Task$Companion;->forResult(Ljava/lang/Object;)Lcom/facebook/bolts/Task;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method public bridge synthetic then(Lcom/facebook/bolts/Task;)Ljava/lang/Object;
    .locals 0

    .line 38
    invoke-virtual {p0, p1}, Lcom/facebook/bolts/Task$makeVoid$1;->then(Lcom/facebook/bolts/Task;)Lcom/facebook/bolts/Task;

    move-result-object p1

    return-object p1
.end method
