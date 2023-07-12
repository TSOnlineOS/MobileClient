.class public final synthetic Lcom/google/firebase/concurrent/-$$Lambda$LimitedConcurrencyExecutorService$9KF9WLB-RidGd1c-Yq1hkMnV91I;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic f$0:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Runnable;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/concurrent/-$$Lambda$LimitedConcurrencyExecutorService$9KF9WLB-RidGd1c-Yq1hkMnV91I;->f$0:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/concurrent/-$$Lambda$LimitedConcurrencyExecutorService$9KF9WLB-RidGd1c-Yq1hkMnV91I;->f$0:Ljava/lang/Runnable;

    invoke-static {v0}, Lcom/google/firebase/concurrent/LimitedConcurrencyExecutorService;->lambda$submit$1(Ljava/lang/Runnable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
