.class public final synthetic Lcom/google/firebase/concurrent/-$$Lambda$PausableExecutorServiceImpl$PyFoFMGR18qzP531VTjlxJpywBw;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic f$0:Ljava/lang/Runnable;

.field public final synthetic f$1:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Runnable;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/concurrent/-$$Lambda$PausableExecutorServiceImpl$PyFoFMGR18qzP531VTjlxJpywBw;->f$0:Ljava/lang/Runnable;

    iput-object p2, p0, Lcom/google/firebase/concurrent/-$$Lambda$PausableExecutorServiceImpl$PyFoFMGR18qzP531VTjlxJpywBw;->f$1:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/concurrent/-$$Lambda$PausableExecutorServiceImpl$PyFoFMGR18qzP531VTjlxJpywBw;->f$0:Ljava/lang/Runnable;

    iget-object v1, p0, Lcom/google/firebase/concurrent/-$$Lambda$PausableExecutorServiceImpl$PyFoFMGR18qzP531VTjlxJpywBw;->f$1:Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/google/firebase/concurrent/PausableExecutorServiceImpl;->lambda$submit$0(Ljava/lang/Runnable;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
