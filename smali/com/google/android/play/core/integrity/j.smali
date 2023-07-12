.class final Lcom/google/android/play/core/integrity/j;
.super Ljava/lang/Object;
.source "com.google.android.play:integrity@@1.1.0"


# instance fields
.field private final a:Lcom/google/android/play/core/integrity/j;

.field private final b:Lcom/google/android/play/integrity/internal/ac;

.field private final c:Lcom/google/android/play/integrity/internal/ac;

.field private final d:Lcom/google/android/play/integrity/internal/ac;

.field private final e:Lcom/google/android/play/integrity/internal/ac;


# direct methods
.method synthetic constructor <init>(Landroid/content/Context;Lcom/google/android/play/core/integrity/i;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p0, p0, Lcom/google/android/play/core/integrity/j;->a:Lcom/google/android/play/core/integrity/j;

    invoke-static {p1}, Lcom/google/android/play/integrity/internal/ab;->b(Ljava/lang/Object;)Lcom/google/android/play/integrity/internal/aa;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/play/core/integrity/j;->b:Lcom/google/android/play/integrity/internal/ac;

    invoke-static {}, Lcom/google/android/play/core/integrity/o;->a()Lcom/google/android/play/core/integrity/p;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/play/integrity/internal/z;->b(Lcom/google/android/play/integrity/internal/ac;)Lcom/google/android/play/integrity/internal/ac;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/play/core/integrity/j;->c:Lcom/google/android/play/integrity/internal/ac;

    iget-object p2, p0, Lcom/google/android/play/core/integrity/j;->b:Lcom/google/android/play/integrity/internal/ac;

    new-instance v0, Lcom/google/android/play/core/integrity/v;

    invoke-direct {v0, p2, p1}, Lcom/google/android/play/core/integrity/v;-><init>(Lcom/google/android/play/integrity/internal/ac;Lcom/google/android/play/integrity/internal/ac;)V

    .line 2
    invoke-static {v0}, Lcom/google/android/play/integrity/internal/z;->b(Lcom/google/android/play/integrity/internal/ac;)Lcom/google/android/play/integrity/internal/ac;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/play/core/integrity/j;->d:Lcom/google/android/play/integrity/internal/ac;

    new-instance p2, Lcom/google/android/play/core/integrity/n;

    invoke-direct {p2, p1}, Lcom/google/android/play/core/integrity/n;-><init>(Lcom/google/android/play/integrity/internal/ac;)V

    .line 3
    invoke-static {p2}, Lcom/google/android/play/integrity/internal/z;->b(Lcom/google/android/play/integrity/internal/ac;)Lcom/google/android/play/integrity/internal/ac;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/play/core/integrity/j;->e:Lcom/google/android/play/integrity/internal/ac;

    return-void
.end method


# virtual methods
.method public final a()Lcom/google/android/play/core/integrity/IntegrityManager;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/play/core/integrity/j;->e:Lcom/google/android/play/integrity/internal/ac;

    invoke-interface {v0}, Lcom/google/android/play/integrity/internal/ac;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/play/core/integrity/IntegrityManager;

    return-object v0
.end method
