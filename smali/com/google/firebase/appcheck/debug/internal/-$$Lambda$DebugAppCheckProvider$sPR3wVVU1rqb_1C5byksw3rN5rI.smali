.class public final synthetic Lcom/google/firebase/appcheck/debug/internal/-$$Lambda$DebugAppCheckProvider$sPR3wVVU1rqb_1C5byksw3rN5rI;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/google/android/gms/tasks/SuccessContinuation;


# instance fields
.field public final synthetic f$0:Lcom/google/firebase/appcheck/debug/internal/DebugAppCheckProvider;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/appcheck/debug/internal/DebugAppCheckProvider;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/appcheck/debug/internal/-$$Lambda$DebugAppCheckProvider$sPR3wVVU1rqb_1C5byksw3rN5rI;->f$0:Lcom/google/firebase/appcheck/debug/internal/DebugAppCheckProvider;

    return-void
.end method


# virtual methods
.method public final then(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/appcheck/debug/internal/-$$Lambda$DebugAppCheckProvider$sPR3wVVU1rqb_1C5byksw3rN5rI;->f$0:Lcom/google/firebase/appcheck/debug/internal/DebugAppCheckProvider;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {v0, p1}, Lcom/google/firebase/appcheck/debug/internal/DebugAppCheckProvider;->lambda$getToken$2$DebugAppCheckProvider(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method
