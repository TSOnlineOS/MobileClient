.class public final synthetic Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultFirebaseAppCheck$wUF2g9mXGI5mF9oSwE8b0KkXXrQ;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/google/android/gms/tasks/Continuation;


# instance fields
.field public final synthetic f$0:Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;

.field public final synthetic f$1:Z


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultFirebaseAppCheck$wUF2g9mXGI5mF9oSwE8b0KkXXrQ;->f$0:Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;

    iput-boolean p2, p0, Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultFirebaseAppCheck$wUF2g9mXGI5mF9oSwE8b0KkXXrQ;->f$1:Z

    return-void
.end method


# virtual methods
.method public final then(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultFirebaseAppCheck$wUF2g9mXGI5mF9oSwE8b0KkXXrQ;->f$0:Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;

    iget-boolean v1, p0, Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultFirebaseAppCheck$wUF2g9mXGI5mF9oSwE8b0KkXXrQ;->f$1:Z

    invoke-virtual {v0, v1, p1}, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->lambda$getAppCheckToken$3$DefaultFirebaseAppCheck(ZLcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method
