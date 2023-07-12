.class public final synthetic Lcom/google/firebase/appcheck/debug/internal/-$$Lambda$DebugAppCheckProvider$tmNLEz8iopXb3RbYkO5HTfkYjoQ;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic f$0:Lcom/google/firebase/appcheck/debug/internal/DebugAppCheckProvider;

.field public final synthetic f$1:Lcom/google/firebase/appcheck/debug/internal/ExchangeDebugTokenRequest;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/appcheck/debug/internal/DebugAppCheckProvider;Lcom/google/firebase/appcheck/debug/internal/ExchangeDebugTokenRequest;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/appcheck/debug/internal/-$$Lambda$DebugAppCheckProvider$tmNLEz8iopXb3RbYkO5HTfkYjoQ;->f$0:Lcom/google/firebase/appcheck/debug/internal/DebugAppCheckProvider;

    iput-object p2, p0, Lcom/google/firebase/appcheck/debug/internal/-$$Lambda$DebugAppCheckProvider$tmNLEz8iopXb3RbYkO5HTfkYjoQ;->f$1:Lcom/google/firebase/appcheck/debug/internal/ExchangeDebugTokenRequest;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/appcheck/debug/internal/-$$Lambda$DebugAppCheckProvider$tmNLEz8iopXb3RbYkO5HTfkYjoQ;->f$0:Lcom/google/firebase/appcheck/debug/internal/DebugAppCheckProvider;

    iget-object v1, p0, Lcom/google/firebase/appcheck/debug/internal/-$$Lambda$DebugAppCheckProvider$tmNLEz8iopXb3RbYkO5HTfkYjoQ;->f$1:Lcom/google/firebase/appcheck/debug/internal/ExchangeDebugTokenRequest;

    invoke-virtual {v0, v1}, Lcom/google/firebase/appcheck/debug/internal/DebugAppCheckProvider;->lambda$getToken$1$DebugAppCheckProvider(Lcom/google/firebase/appcheck/debug/internal/ExchangeDebugTokenRequest;)Lcom/google/firebase/appcheck/internal/AppCheckTokenResponse;

    move-result-object v0

    return-object v0
.end method
