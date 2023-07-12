.class public final Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;
.super Lcom/google/firebase/appcheck/AppCheckTokenResult;
.source "DefaultAppCheckTokenResult.java"


# static fields
.field static final DUMMY_TOKEN:Ljava/lang/String; = "eyJlcnJvciI6IlVOS05PV05fRVJST1IifQ=="


# instance fields
.field private final error:Lcom/google/firebase/FirebaseException;

.field private final token:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;Lcom/google/firebase/FirebaseException;)V
    .locals 0

    .line 47
    invoke-direct {p0}, Lcom/google/firebase/appcheck/AppCheckTokenResult;-><init>()V

    .line 48
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 49
    iput-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;->token:Ljava/lang/String;

    .line 50
    iput-object p2, p0, Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;->error:Lcom/google/firebase/FirebaseException;

    return-void
.end method

.method public static constructFromAppCheckToken(Lcom/google/firebase/appcheck/AppCheckToken;)Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;
    .locals 2

    .line 38
    invoke-static {p0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    new-instance v0, Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;

    invoke-virtual {p0}, Lcom/google/firebase/appcheck/AppCheckToken;->getToken()Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;-><init>(Ljava/lang/String;Lcom/google/firebase/FirebaseException;)V

    return-object v0
.end method

.method public static constructFromError(Lcom/google/firebase/FirebaseException;)Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;
    .locals 2

    .line 44
    new-instance v0, Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;

    invoke-static {p0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/FirebaseException;

    const-string v1, "eyJlcnJvciI6IlVOS05PV05fRVJST1IifQ=="

    invoke-direct {v0, v1, p0}, Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;-><init>(Ljava/lang/String;Lcom/google/firebase/FirebaseException;)V

    return-object v0
.end method


# virtual methods
.method public getError()Ljava/lang/Exception;
    .locals 1

    .line 62
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;->error:Lcom/google/firebase/FirebaseException;

    return-object v0
.end method

.method public getToken()Ljava/lang/String;
    .locals 1

    .line 56
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;->token:Ljava/lang/String;

    return-object v0
.end method
