.class public final synthetic Lcom/google/firebase/concurrent/-$$Lambda$DelegatingScheduledExecutorService$HRYO0wCPB5QdzTdHZ2vXRM6sx7A;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/util/concurrent/Callable;

.field public final synthetic f$1:Lcom/google/firebase/concurrent/DelegatingScheduledFuture$Completer;


# direct methods
.method public synthetic constructor <init>(Ljava/util/concurrent/Callable;Lcom/google/firebase/concurrent/DelegatingScheduledFuture$Completer;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/concurrent/-$$Lambda$DelegatingScheduledExecutorService$HRYO0wCPB5QdzTdHZ2vXRM6sx7A;->f$0:Ljava/util/concurrent/Callable;

    iput-object p2, p0, Lcom/google/firebase/concurrent/-$$Lambda$DelegatingScheduledExecutorService$HRYO0wCPB5QdzTdHZ2vXRM6sx7A;->f$1:Lcom/google/firebase/concurrent/DelegatingScheduledFuture$Completer;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/concurrent/-$$Lambda$DelegatingScheduledExecutorService$HRYO0wCPB5QdzTdHZ2vXRM6sx7A;->f$0:Ljava/util/concurrent/Callable;

    iget-object v1, p0, Lcom/google/firebase/concurrent/-$$Lambda$DelegatingScheduledExecutorService$HRYO0wCPB5QdzTdHZ2vXRM6sx7A;->f$1:Lcom/google/firebase/concurrent/DelegatingScheduledFuture$Completer;

    invoke-static {v0, v1}, Lcom/google/firebase/concurrent/DelegatingScheduledExecutorService;->lambda$schedule$3(Ljava/util/concurrent/Callable;Lcom/google/firebase/concurrent/DelegatingScheduledFuture$Completer;)V

    return-void
.end method
