.class public final synthetic Lcom/google/firebase/heartbeatinfo/-$$Lambda$DefaultHeartBeatController$xz0oqEWexFSS5Ebp1Jun2sNrEQs;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic f$0:Lcom/google/firebase/heartbeatinfo/DefaultHeartBeatController;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/heartbeatinfo/DefaultHeartBeatController;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/heartbeatinfo/-$$Lambda$DefaultHeartBeatController$xz0oqEWexFSS5Ebp1Jun2sNrEQs;->f$0:Lcom/google/firebase/heartbeatinfo/DefaultHeartBeatController;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/heartbeatinfo/-$$Lambda$DefaultHeartBeatController$xz0oqEWexFSS5Ebp1Jun2sNrEQs;->f$0:Lcom/google/firebase/heartbeatinfo/DefaultHeartBeatController;

    invoke-virtual {v0}, Lcom/google/firebase/heartbeatinfo/DefaultHeartBeatController;->lambda$getHeartBeatsHeader$1$DefaultHeartBeatController()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
