.class public final synthetic Lcom/google/firebase/appcheck/debug/internal/-$$Lambda$DebugAppCheckProvider$fTkU0bBlF7qb-ZmdPezevnz-fuQ;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/google/firebase/FirebaseApp;

.field public final synthetic f$1:Lcom/google/android/gms/tasks/TaskCompletionSource;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/FirebaseApp;Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/appcheck/debug/internal/-$$Lambda$DebugAppCheckProvider$fTkU0bBlF7qb-ZmdPezevnz-fuQ;->f$0:Lcom/google/firebase/FirebaseApp;

    iput-object p2, p0, Lcom/google/firebase/appcheck/debug/internal/-$$Lambda$DebugAppCheckProvider$fTkU0bBlF7qb-ZmdPezevnz-fuQ;->f$1:Lcom/google/android/gms/tasks/TaskCompletionSource;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/appcheck/debug/internal/-$$Lambda$DebugAppCheckProvider$fTkU0bBlF7qb-ZmdPezevnz-fuQ;->f$0:Lcom/google/firebase/FirebaseApp;

    iget-object v1, p0, Lcom/google/firebase/appcheck/debug/internal/-$$Lambda$DebugAppCheckProvider$fTkU0bBlF7qb-ZmdPezevnz-fuQ;->f$1:Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-static {v0, v1}, Lcom/google/firebase/appcheck/debug/internal/DebugAppCheckProvider;->lambda$determineDebugSecret$0(Lcom/google/firebase/FirebaseApp;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    return-void
.end method
