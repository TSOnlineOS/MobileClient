.class public final synthetic Lcom/google/firebase/appcheck/playintegrity/internal/-$$Lambda$PlayIntegrityAppCheckProvider$nZmsGNL8BBwjTp3j7TXZIdoFr_w;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic f$0:Lcom/google/firebase/appcheck/playintegrity/internal/PlayIntegrityAppCheckProvider;

.field public final synthetic f$1:Lcom/google/firebase/appcheck/playintegrity/internal/GeneratePlayIntegrityChallengeRequest;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/appcheck/playintegrity/internal/PlayIntegrityAppCheckProvider;Lcom/google/firebase/appcheck/playintegrity/internal/GeneratePlayIntegrityChallengeRequest;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/appcheck/playintegrity/internal/-$$Lambda$PlayIntegrityAppCheckProvider$nZmsGNL8BBwjTp3j7TXZIdoFr_w;->f$0:Lcom/google/firebase/appcheck/playintegrity/internal/PlayIntegrityAppCheckProvider;

    iput-object p2, p0, Lcom/google/firebase/appcheck/playintegrity/internal/-$$Lambda$PlayIntegrityAppCheckProvider$nZmsGNL8BBwjTp3j7TXZIdoFr_w;->f$1:Lcom/google/firebase/appcheck/playintegrity/internal/GeneratePlayIntegrityChallengeRequest;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/appcheck/playintegrity/internal/-$$Lambda$PlayIntegrityAppCheckProvider$nZmsGNL8BBwjTp3j7TXZIdoFr_w;->f$0:Lcom/google/firebase/appcheck/playintegrity/internal/PlayIntegrityAppCheckProvider;

    iget-object v1, p0, Lcom/google/firebase/appcheck/playintegrity/internal/-$$Lambda$PlayIntegrityAppCheckProvider$nZmsGNL8BBwjTp3j7TXZIdoFr_w;->f$1:Lcom/google/firebase/appcheck/playintegrity/internal/GeneratePlayIntegrityChallengeRequest;

    invoke-virtual {v0, v1}, Lcom/google/firebase/appcheck/playintegrity/internal/PlayIntegrityAppCheckProvider;->lambda$getPlayIntegrityAttestation$3$PlayIntegrityAppCheckProvider(Lcom/google/firebase/appcheck/playintegrity/internal/GeneratePlayIntegrityChallengeRequest;)Lcom/google/firebase/appcheck/playintegrity/internal/GeneratePlayIntegrityChallengeResponse;

    move-result-object v0

    return-object v0
.end method
