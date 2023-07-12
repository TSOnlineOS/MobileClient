.class final Lcom/google/android/play/integrity/internal/o;
.super Lcom/google/android/play/integrity/internal/l;
.source "com.google.android.play:integrity@@1.1.0"


# instance fields
.field final synthetic a:Lcom/google/android/play/integrity/internal/l;

.field final synthetic b:Lcom/google/android/play/integrity/internal/v;


# direct methods
.method constructor <init>(Lcom/google/android/play/integrity/internal/v;Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/android/play/integrity/internal/l;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/play/integrity/internal/o;->b:Lcom/google/android/play/integrity/internal/v;

    iput-object p3, p0, Lcom/google/android/play/integrity/internal/o;->a:Lcom/google/android/play/integrity/internal/l;

    invoke-direct {p0, p2}, Lcom/google/android/play/integrity/internal/l;-><init>(Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    return-void
.end method


# virtual methods
.method public final b()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/play/integrity/internal/o;->b:Lcom/google/android/play/integrity/internal/v;

    iget-object v1, p0, Lcom/google/android/play/integrity/internal/o;->a:Lcom/google/android/play/integrity/internal/l;

    invoke-static {v0, v1}, Lcom/google/android/play/integrity/internal/v;->m(Lcom/google/android/play/integrity/internal/v;Lcom/google/android/play/integrity/internal/l;)V

    return-void
.end method
