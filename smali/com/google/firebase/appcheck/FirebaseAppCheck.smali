.class public abstract Lcom/google/firebase/appcheck/FirebaseAppCheck;
.super Ljava/lang/Object;
.source "FirebaseAppCheck.java"

# interfaces
.implements Lcom/google/firebase/appcheck/interop/InteropAppCheckTokenProvider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/appcheck/FirebaseAppCheck$AppCheckListener;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/google/firebase/appcheck/FirebaseAppCheck;
    .locals 1

    .line 29
    invoke-static {}, Lcom/google/firebase/FirebaseApp;->getInstance()Lcom/google/firebase/FirebaseApp;

    move-result-object v0

    invoke-static {v0}, Lcom/google/firebase/appcheck/FirebaseAppCheck;->getInstance(Lcom/google/firebase/FirebaseApp;)Lcom/google/firebase/appcheck/FirebaseAppCheck;

    move-result-object v0

    return-object v0
.end method

.method public static getInstance(Lcom/google/firebase/FirebaseApp;)Lcom/google/firebase/appcheck/FirebaseAppCheck;
    .locals 1

    .line 38
    const-class v0, Lcom/google/firebase/appcheck/FirebaseAppCheck;

    invoke-virtual {p0, v0}, Lcom/google/firebase/FirebaseApp;->get(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/appcheck/FirebaseAppCheck;

    return-object p0
.end method


# virtual methods
.method public abstract addAppCheckListener(Lcom/google/firebase/appcheck/FirebaseAppCheck$AppCheckListener;)V
.end method

.method public abstract getAppCheckToken(Z)Lcom/google/android/gms/tasks/Task;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/firebase/appcheck/AppCheckToken;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getLimitedUseAppCheckToken()Lcom/google/android/gms/tasks/Task;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/firebase/appcheck/AppCheckToken;",
            ">;"
        }
    .end annotation
.end method

.method public abstract installAppCheckProviderFactory(Lcom/google/firebase/appcheck/AppCheckProviderFactory;)V
.end method

.method public abstract installAppCheckProviderFactory(Lcom/google/firebase/appcheck/AppCheckProviderFactory;Z)V
.end method

.method public abstract removeAppCheckListener(Lcom/google/firebase/appcheck/FirebaseAppCheck$AppCheckListener;)V
.end method

.method public abstract setTokenAutoRefreshEnabled(Z)V
.end method
