.class final Lcom/google/firebase/auth/internal/zzab;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Lcom/google/android/gms/tasks/Continuation;


# instance fields
.field final synthetic zza:Lcom/google/firebase/auth/internal/zzac;


# direct methods
.method constructor <init>(Lcom/google/firebase/auth/internal/zzac;)V
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/auth/internal/zzab;->zza:Lcom/google/firebase/auth/internal/zzac;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final bridge synthetic then(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/tasks/Tasks;->forException(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    goto :goto_0

    .line 3
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/auth/GetTokenResult;

    invoke-virtual {p1}, Lcom/google/firebase/auth/GetTokenResult;->getToken()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/google/firebase/auth/internal/zzab;->zza:Lcom/google/firebase/auth/internal/zzac;

    invoke-static {v0}, Lcom/google/firebase/auth/internal/zzac;->zza(Lcom/google/firebase/auth/internal/zzac;)Lcom/google/firebase/auth/internal/zzx;

    move-result-object v0

    .line 4
    invoke-static {p1, v0}, Lcom/google/firebase/auth/internal/zzag;->zza(Ljava/lang/String;Lcom/google/firebase/auth/internal/zzx;)Lcom/google/firebase/auth/internal/zzag;

    move-result-object p1

    .line 5
    invoke-static {p1}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    :goto_0
    return-object p1
.end method
