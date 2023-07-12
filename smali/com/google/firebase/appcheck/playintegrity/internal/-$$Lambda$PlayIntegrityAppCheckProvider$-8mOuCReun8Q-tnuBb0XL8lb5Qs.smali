.class public final synthetic Lcom/google/firebase/appcheck/playintegrity/internal/-$$Lambda$PlayIntegrityAppCheckProvider$-8mOuCReun8Q-tnuBb0XL8lb5Qs;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/google/android/gms/tasks/SuccessContinuation;


# static fields
.field public static final synthetic INSTANCE:Lcom/google/firebase/appcheck/playintegrity/internal/-$$Lambda$PlayIntegrityAppCheckProvider$-8mOuCReun8Q-tnuBb0XL8lb5Qs;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/firebase/appcheck/playintegrity/internal/-$$Lambda$PlayIntegrityAppCheckProvider$-8mOuCReun8Q-tnuBb0XL8lb5Qs;

    invoke-direct {v0}, Lcom/google/firebase/appcheck/playintegrity/internal/-$$Lambda$PlayIntegrityAppCheckProvider$-8mOuCReun8Q-tnuBb0XL8lb5Qs;-><init>()V

    sput-object v0, Lcom/google/firebase/appcheck/playintegrity/internal/-$$Lambda$PlayIntegrityAppCheckProvider$-8mOuCReun8Q-tnuBb0XL8lb5Qs;->INSTANCE:Lcom/google/firebase/appcheck/playintegrity/internal/-$$Lambda$PlayIntegrityAppCheckProvider$-8mOuCReun8Q-tnuBb0XL8lb5Qs;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final then(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;
    .locals 0

    check-cast p1, Lcom/google/firebase/appcheck/internal/AppCheckTokenResponse;

    invoke-static {p1}, Lcom/google/firebase/appcheck/playintegrity/internal/PlayIntegrityAppCheckProvider;->lambda$getToken$2(Lcom/google/firebase/appcheck/internal/AppCheckTokenResponse;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method
