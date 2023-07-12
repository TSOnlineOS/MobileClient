.class public final synthetic Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultTokenRefresher$yY-3o43rG4qpE2IaFOaCAIx3ZBY;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/google/android/gms/tasks/OnFailureListener;


# instance fields
.field public final synthetic f$0:Lcom/google/firebase/appcheck/internal/DefaultTokenRefresher;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/appcheck/internal/DefaultTokenRefresher;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultTokenRefresher$yY-3o43rG4qpE2IaFOaCAIx3ZBY;->f$0:Lcom/google/firebase/appcheck/internal/DefaultTokenRefresher;

    return-void
.end method


# virtual methods
.method public final onFailure(Ljava/lang/Exception;)V
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultTokenRefresher$yY-3o43rG4qpE2IaFOaCAIx3ZBY;->f$0:Lcom/google/firebase/appcheck/internal/DefaultTokenRefresher;

    invoke-virtual {v0, p1}, Lcom/google/firebase/appcheck/internal/DefaultTokenRefresher;->lambda$onRefresh$0$DefaultTokenRefresher(Ljava/lang/Exception;)V

    return-void
.end method
