.class public final synthetic Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultFirebaseAppCheck$13M78FZpHaTlnWa_rQTodrYdaDE;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;

.field public final synthetic f$1:Lcom/google/firebase/appcheck/AppCheckToken;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;Lcom/google/firebase/appcheck/AppCheckToken;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultFirebaseAppCheck$13M78FZpHaTlnWa_rQTodrYdaDE;->f$0:Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;

    iput-object p2, p0, Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultFirebaseAppCheck$13M78FZpHaTlnWa_rQTodrYdaDE;->f$1:Lcom/google/firebase/appcheck/AppCheckToken;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultFirebaseAppCheck$13M78FZpHaTlnWa_rQTodrYdaDE;->f$0:Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;

    iget-object v1, p0, Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultFirebaseAppCheck$13M78FZpHaTlnWa_rQTodrYdaDE;->f$1:Lcom/google/firebase/appcheck/AppCheckToken;

    invoke-virtual {v0, v1}, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->lambda$updateStoredToken$5$DefaultFirebaseAppCheck(Lcom/google/firebase/appcheck/AppCheckToken;)V

    return-void
.end method
