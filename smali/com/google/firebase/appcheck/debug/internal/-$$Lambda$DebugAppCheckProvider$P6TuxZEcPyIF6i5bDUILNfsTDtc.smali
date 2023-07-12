.class public final synthetic Lcom/google/firebase/appcheck/debug/internal/-$$Lambda$DebugAppCheckProvider$P6TuxZEcPyIF6i5bDUILNfsTDtc;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/google/android/gms/tasks/SuccessContinuation;


# static fields
.field public static final synthetic INSTANCE:Lcom/google/firebase/appcheck/debug/internal/-$$Lambda$DebugAppCheckProvider$P6TuxZEcPyIF6i5bDUILNfsTDtc;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/firebase/appcheck/debug/internal/-$$Lambda$DebugAppCheckProvider$P6TuxZEcPyIF6i5bDUILNfsTDtc;

    invoke-direct {v0}, Lcom/google/firebase/appcheck/debug/internal/-$$Lambda$DebugAppCheckProvider$P6TuxZEcPyIF6i5bDUILNfsTDtc;-><init>()V

    sput-object v0, Lcom/google/firebase/appcheck/debug/internal/-$$Lambda$DebugAppCheckProvider$P6TuxZEcPyIF6i5bDUILNfsTDtc;->INSTANCE:Lcom/google/firebase/appcheck/debug/internal/-$$Lambda$DebugAppCheckProvider$P6TuxZEcPyIF6i5bDUILNfsTDtc;

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

    invoke-static {p1}, Lcom/google/firebase/appcheck/debug/internal/DebugAppCheckProvider;->lambda$getToken$3(Lcom/google/firebase/appcheck/internal/AppCheckTokenResponse;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method
