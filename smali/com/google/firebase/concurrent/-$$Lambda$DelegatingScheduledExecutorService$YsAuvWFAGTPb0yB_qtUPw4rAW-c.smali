.class public final synthetic Lcom/google/firebase/concurrent/-$$Lambda$DelegatingScheduledExecutorService$YsAuvWFAGTPb0yB_qtUPw4rAW-c;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/google/firebase/concurrent/DelegatingScheduledFuture$Resolver;


# instance fields
.field public final synthetic f$0:Lcom/google/firebase/concurrent/DelegatingScheduledExecutorService;

.field public final synthetic f$1:Ljava/util/concurrent/Callable;

.field public final synthetic f$2:J

.field public final synthetic f$3:Ljava/util/concurrent/TimeUnit;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/concurrent/DelegatingScheduledExecutorService;Ljava/util/concurrent/Callable;JLjava/util/concurrent/TimeUnit;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/concurrent/-$$Lambda$DelegatingScheduledExecutorService$YsAuvWFAGTPb0yB_qtUPw4rAW-c;->f$0:Lcom/google/firebase/concurrent/DelegatingScheduledExecutorService;

    iput-object p2, p0, Lcom/google/firebase/concurrent/-$$Lambda$DelegatingScheduledExecutorService$YsAuvWFAGTPb0yB_qtUPw4rAW-c;->f$1:Ljava/util/concurrent/Callable;

    iput-wide p3, p0, Lcom/google/firebase/concurrent/-$$Lambda$DelegatingScheduledExecutorService$YsAuvWFAGTPb0yB_qtUPw4rAW-c;->f$2:J

    iput-object p5, p0, Lcom/google/firebase/concurrent/-$$Lambda$DelegatingScheduledExecutorService$YsAuvWFAGTPb0yB_qtUPw4rAW-c;->f$3:Ljava/util/concurrent/TimeUnit;

    return-void
.end method


# virtual methods
.method public final addCompleter(Lcom/google/firebase/concurrent/DelegatingScheduledFuture$Completer;)Ljava/util/concurrent/ScheduledFuture;
    .locals 6

    iget-object v0, p0, Lcom/google/firebase/concurrent/-$$Lambda$DelegatingScheduledExecutorService$YsAuvWFAGTPb0yB_qtUPw4rAW-c;->f$0:Lcom/google/firebase/concurrent/DelegatingScheduledExecutorService;

    iget-object v1, p0, Lcom/google/firebase/concurrent/-$$Lambda$DelegatingScheduledExecutorService$YsAuvWFAGTPb0yB_qtUPw4rAW-c;->f$1:Ljava/util/concurrent/Callable;

    iget-wide v2, p0, Lcom/google/firebase/concurrent/-$$Lambda$DelegatingScheduledExecutorService$YsAuvWFAGTPb0yB_qtUPw4rAW-c;->f$2:J

    iget-object v4, p0, Lcom/google/firebase/concurrent/-$$Lambda$DelegatingScheduledExecutorService$YsAuvWFAGTPb0yB_qtUPw4rAW-c;->f$3:Ljava/util/concurrent/TimeUnit;

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Lcom/google/firebase/concurrent/DelegatingScheduledExecutorService;->lambda$schedule$5$DelegatingScheduledExecutorService(Ljava/util/concurrent/Callable;JLjava/util/concurrent/TimeUnit;Lcom/google/firebase/concurrent/DelegatingScheduledFuture$Completer;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p1

    return-object p1
.end method
