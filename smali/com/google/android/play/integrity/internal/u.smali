.class final Lcom/google/android/play/integrity/internal/u;
.super Ljava/lang/Object;
.source "com.google.android.play:integrity@@1.1.0"

# interfaces
.implements Landroid/content/ServiceConnection;


# instance fields
.field final synthetic a:Lcom/google/android/play/integrity/internal/v;


# direct methods
.method synthetic constructor <init>(Lcom/google/android/play/integrity/internal/v;Lcom/google/android/play/integrity/internal/t;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/play/integrity/internal/u;->a:Lcom/google/android/play/integrity/internal/v;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/play/integrity/internal/u;->a:Lcom/google/android/play/integrity/internal/v;

    invoke-static {v0}, Lcom/google/android/play/integrity/internal/v;->f(Lcom/google/android/play/integrity/internal/v;)Lcom/google/android/play/integrity/internal/k;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string p1, "ServiceConnectionImpl.onServiceConnected(%s)"

    invoke-virtual {v0, p1, v1}, Lcom/google/android/play/integrity/internal/k;->d(Ljava/lang/String;[Ljava/lang/Object;)I

    iget-object p1, p0, Lcom/google/android/play/integrity/internal/u;->a:Lcom/google/android/play/integrity/internal/v;

    new-instance v0, Lcom/google/android/play/integrity/internal/r;

    invoke-direct {v0, p0, p2}, Lcom/google/android/play/integrity/internal/r;-><init>(Lcom/google/android/play/integrity/internal/u;Landroid/os/IBinder;)V

    .line 2
    invoke-virtual {p1}, Lcom/google/android/play/integrity/internal/v;->c()Landroid/os/Handler;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/play/integrity/internal/u;->a:Lcom/google/android/play/integrity/internal/v;

    invoke-static {v0}, Lcom/google/android/play/integrity/internal/v;->f(Lcom/google/android/play/integrity/internal/v;)Lcom/google/android/play/integrity/internal/k;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string p1, "ServiceConnectionImpl.onServiceDisconnected(%s)"

    invoke-virtual {v0, p1, v1}, Lcom/google/android/play/integrity/internal/k;->d(Ljava/lang/String;[Ljava/lang/Object;)I

    iget-object p1, p0, Lcom/google/android/play/integrity/internal/u;->a:Lcom/google/android/play/integrity/internal/v;

    new-instance v0, Lcom/google/android/play/integrity/internal/s;

    invoke-direct {v0, p0}, Lcom/google/android/play/integrity/internal/s;-><init>(Lcom/google/android/play/integrity/internal/u;)V

    .line 2
    invoke-virtual {p1}, Lcom/google/android/play/integrity/internal/v;->c()Landroid/os/Handler;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
