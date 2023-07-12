.class public final synthetic Lcom/google/firebase/appcheck/playintegrity/internal/-$$Lambda$PlayIntegrityAppCheckProvider$1nBHF3Jc9QhGRYlMj1crtGX4Neg;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/google/android/gms/tasks/SuccessContinuation;


# instance fields
.field public final synthetic f$0:Lcom/google/firebase/appcheck/playintegrity/internal/PlayIntegrityAppCheckProvider;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/appcheck/playintegrity/internal/PlayIntegrityAppCheckProvider;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/appcheck/playintegrity/internal/-$$Lambda$PlayIntegrityAppCheckProvider$1nBHF3Jc9QhGRYlMj1crtGX4Neg;->f$0:Lcom/google/firebase/appcheck/playintegrity/internal/PlayIntegrityAppCheckProvider;

    return-void
.end method


# virtual methods
.method public final then(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/appcheck/playintegrity/internal/-$$Lambda$PlayIntegrityAppCheckProvider$1nBHF3Jc9QhGRYlMj1crtGX4Neg;->f$0:Lcom/google/firebase/appcheck/playintegrity/internal/PlayIntegrityAppCheckProvider;

    check-cast p1, Lcom/google/android/play/core/integrity/IntegrityTokenResponse;

    invoke-virtual {v0, p1}, Lcom/google/firebase/appcheck/playintegrity/internal/PlayIntegrityAppCheckProvider;->lambda$getToken$1$PlayIntegrityAppCheckProvider(Lcom/google/android/play/core/integrity/IntegrityTokenResponse;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method
