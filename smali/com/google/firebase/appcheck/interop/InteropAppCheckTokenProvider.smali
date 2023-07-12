.class public interface abstract Lcom/google/firebase/appcheck/interop/InteropAppCheckTokenProvider;
.super Ljava/lang/Object;
.source "InteropAppCheckTokenProvider.java"


# virtual methods
.method public abstract addAppCheckTokenListener(Lcom/google/firebase/appcheck/interop/AppCheckTokenListener;)V
.end method

.method public abstract getToken(Z)Lcom/google/android/gms/tasks/Task;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/firebase/appcheck/AppCheckTokenResult;",
            ">;"
        }
    .end annotation
.end method

.method public abstract removeAppCheckTokenListener(Lcom/google/firebase/appcheck/interop/AppCheckTokenListener;)V
.end method
