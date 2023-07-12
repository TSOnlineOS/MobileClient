.class final Lcom/google/android/play/integrity/internal/r;
.super Lcom/google/android/play/integrity/internal/l;
.source "com.google.android.play:integrity@@1.1.0"


# instance fields
.field final synthetic a:Landroid/os/IBinder;

.field final synthetic b:Lcom/google/android/play/integrity/internal/u;


# direct methods
.method constructor <init>(Lcom/google/android/play/integrity/internal/u;Landroid/os/IBinder;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/play/integrity/internal/r;->b:Lcom/google/android/play/integrity/internal/u;

    iput-object p2, p0, Lcom/google/android/play/integrity/internal/r;->a:Landroid/os/IBinder;

    invoke-direct {p0}, Lcom/google/android/play/integrity/internal/l;-><init>()V

    return-void
.end method


# virtual methods
.method public final b()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/play/integrity/internal/r;->b:Lcom/google/android/play/integrity/internal/u;

    iget-object v0, v0, Lcom/google/android/play/integrity/internal/u;->a:Lcom/google/android/play/integrity/internal/v;

    iget-object v1, p0, Lcom/google/android/play/integrity/internal/r;->a:Landroid/os/IBinder;

    invoke-static {v1}, Lcom/google/android/play/integrity/internal/g;->b(Landroid/os/IBinder;)Lcom/google/android/play/integrity/internal/h;

    move-result-object v1

    .line 2
    invoke-static {v0, v1}, Lcom/google/android/play/integrity/internal/v;->k(Lcom/google/android/play/integrity/internal/v;Landroid/os/IInterface;)V

    iget-object v0, p0, Lcom/google/android/play/integrity/internal/r;->b:Lcom/google/android/play/integrity/internal/u;

    iget-object v0, v0, Lcom/google/android/play/integrity/internal/u;->a:Lcom/google/android/play/integrity/internal/v;

    .line 3
    invoke-static {v0}, Lcom/google/android/play/integrity/internal/v;->n(Lcom/google/android/play/integrity/internal/v;)V

    iget-object v0, p0, Lcom/google/android/play/integrity/internal/r;->b:Lcom/google/android/play/integrity/internal/u;

    iget-object v0, v0, Lcom/google/android/play/integrity/internal/u;->a:Lcom/google/android/play/integrity/internal/v;

    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Lcom/google/android/play/integrity/internal/v;->j(Lcom/google/android/play/integrity/internal/v;Z)V

    iget-object v0, p0, Lcom/google/android/play/integrity/internal/r;->b:Lcom/google/android/play/integrity/internal/u;

    iget-object v0, v0, Lcom/google/android/play/integrity/internal/u;->a:Lcom/google/android/play/integrity/internal/v;

    invoke-static {v0}, Lcom/google/android/play/integrity/internal/v;->g(Lcom/google/android/play/integrity/internal/v;)Ljava/util/List;

    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;

    .line 6
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/android/play/integrity/internal/r;->b:Lcom/google/android/play/integrity/internal/u;

    iget-object v0, v0, Lcom/google/android/play/integrity/internal/u;->a:Lcom/google/android/play/integrity/internal/v;

    invoke-static {v0}, Lcom/google/android/play/integrity/internal/v;->g(Lcom/google/android/play/integrity/internal/v;)Ljava/util/List;

    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/List;->clear()V

    return-void
.end method
