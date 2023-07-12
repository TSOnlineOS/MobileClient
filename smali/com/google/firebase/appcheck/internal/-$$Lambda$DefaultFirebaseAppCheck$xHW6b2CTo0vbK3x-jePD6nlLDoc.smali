.class public final synthetic Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultFirebaseAppCheck$xHW6b2CTo0vbK3x-jePD6nlLDoc;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/google/android/gms/tasks/SuccessContinuation;


# instance fields
.field public final synthetic f$0:Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultFirebaseAppCheck$xHW6b2CTo0vbK3x-jePD6nlLDoc;->f$0:Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;

    return-void
.end method


# virtual methods
.method public final then(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultFirebaseAppCheck$xHW6b2CTo0vbK3x-jePD6nlLDoc;->f$0:Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;

    check-cast p1, Lcom/google/firebase/appcheck/AppCheckToken;

    invoke-virtual {v0, p1}, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->lambda$fetchTokenFromProvider$4$DefaultFirebaseAppCheck(Lcom/google/firebase/appcheck/AppCheckToken;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method
