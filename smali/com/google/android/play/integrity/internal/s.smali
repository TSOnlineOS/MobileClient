.class final Lcom/google/android/play/integrity/internal/s;
.super Lcom/google/android/play/integrity/internal/l;
.source "com.google.android.play:integrity@@1.1.0"


# instance fields
.field final synthetic a:Lcom/google/android/play/integrity/internal/u;


# direct methods
.method constructor <init>(Lcom/google/android/play/integrity/internal/u;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/play/integrity/internal/s;->a:Lcom/google/android/play/integrity/internal/u;

    invoke-direct {p0}, Lcom/google/android/play/integrity/internal/l;-><init>()V

    return-void
.end method


# virtual methods
.method public final b()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/play/integrity/internal/s;->a:Lcom/google/android/play/integrity/internal/u;

    iget-object v0, v0, Lcom/google/android/play/integrity/internal/u;->a:Lcom/google/android/play/integrity/internal/v;

    invoke-static {v0}, Lcom/google/android/play/integrity/internal/v;->o(Lcom/google/android/play/integrity/internal/v;)V

    iget-object v0, p0, Lcom/google/android/play/integrity/internal/s;->a:Lcom/google/android/play/integrity/internal/u;

    iget-object v0, v0, Lcom/google/android/play/integrity/internal/u;->a:Lcom/google/android/play/integrity/internal/v;

    const/4 v1, 0x0

    .line 2
    invoke-static {v0, v1}, Lcom/google/android/play/integrity/internal/v;->k(Lcom/google/android/play/integrity/internal/v;Landroid/os/IInterface;)V

    iget-object v0, p0, Lcom/google/android/play/integrity/internal/s;->a:Lcom/google/android/play/integrity/internal/u;

    iget-object v0, v0, Lcom/google/android/play/integrity/internal/u;->a:Lcom/google/android/play/integrity/internal/v;

    const/4 v1, 0x0

    .line 3
    invoke-static {v0, v1}, Lcom/google/android/play/integrity/internal/v;->j(Lcom/google/android/play/integrity/internal/v;Z)V

    return-void
.end method
