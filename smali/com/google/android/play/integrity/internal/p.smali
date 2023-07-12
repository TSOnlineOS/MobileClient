.class final Lcom/google/android/play/integrity/internal/p;
.super Lcom/google/android/play/integrity/internal/l;
.source "com.google.android.play:integrity@@1.1.0"


# instance fields
.field final synthetic a:Lcom/google/android/play/integrity/internal/v;


# direct methods
.method constructor <init>(Lcom/google/android/play/integrity/internal/v;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/play/integrity/internal/p;->a:Lcom/google/android/play/integrity/internal/v;

    invoke-direct {p0}, Lcom/google/android/play/integrity/internal/l;-><init>()V

    return-void
.end method


# virtual methods
.method public final b()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/play/integrity/internal/p;->a:Lcom/google/android/play/integrity/internal/v;

    invoke-static {v0}, Lcom/google/android/play/integrity/internal/v;->d(Lcom/google/android/play/integrity/internal/v;)Landroid/os/IInterface;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-static {v0}, Lcom/google/android/play/integrity/internal/v;->f(Lcom/google/android/play/integrity/internal/v;)Lcom/google/android/play/integrity/internal/k;

    move-result-object v0

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Object;

    const-string v3, "Unbind from service."

    invoke-virtual {v0, v3, v2}, Lcom/google/android/play/integrity/internal/k;->d(Ljava/lang/String;[Ljava/lang/Object;)I

    iget-object v0, p0, Lcom/google/android/play/integrity/internal/p;->a:Lcom/google/android/play/integrity/internal/v;

    invoke-static {v0}, Lcom/google/android/play/integrity/internal/v;->a(Lcom/google/android/play/integrity/internal/v;)Landroid/content/Context;

    move-result-object v2

    invoke-static {v0}, Lcom/google/android/play/integrity/internal/v;->b(Lcom/google/android/play/integrity/internal/v;)Landroid/content/ServiceConnection;

    move-result-object v0

    .line 2
    invoke-virtual {v2, v0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    iget-object v0, p0, Lcom/google/android/play/integrity/internal/p;->a:Lcom/google/android/play/integrity/internal/v;

    .line 3
    invoke-static {v0, v1}, Lcom/google/android/play/integrity/internal/v;->j(Lcom/google/android/play/integrity/internal/v;Z)V

    iget-object v0, p0, Lcom/google/android/play/integrity/internal/p;->a:Lcom/google/android/play/integrity/internal/v;

    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Lcom/google/android/play/integrity/internal/v;->k(Lcom/google/android/play/integrity/internal/v;Landroid/os/IInterface;)V

    iget-object v0, p0, Lcom/google/android/play/integrity/internal/p;->a:Lcom/google/android/play/integrity/internal/v;

    .line 5
    invoke-static {v0, v1}, Lcom/google/android/play/integrity/internal/v;->i(Lcom/google/android/play/integrity/internal/v;Landroid/content/ServiceConnection;)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/play/integrity/internal/p;->a:Lcom/google/android/play/integrity/internal/v;

    .line 6
    invoke-static {v0}, Lcom/google/android/play/integrity/internal/v;->l(Lcom/google/android/play/integrity/internal/v;)V

    return-void
.end method
