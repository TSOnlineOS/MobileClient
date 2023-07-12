.class public final Lcom/google/android/play/core/integrity/v;
.super Ljava/lang/Object;
.source "com.google.android.play:integrity@@1.1.0"

# interfaces
.implements Lcom/google/android/play/integrity/internal/aa;


# instance fields
.field private final a:Lcom/google/android/play/integrity/internal/ac;

.field private final b:Lcom/google/android/play/integrity/internal/ac;


# direct methods
.method public constructor <init>(Lcom/google/android/play/integrity/internal/ac;Lcom/google/android/play/integrity/internal/ac;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/play/core/integrity/v;->a:Lcom/google/android/play/integrity/internal/ac;

    iput-object p2, p0, Lcom/google/android/play/core/integrity/v;->b:Lcom/google/android/play/integrity/internal/ac;

    return-void
.end method


# virtual methods
.method public final bridge synthetic a()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/play/core/integrity/v;->a:Lcom/google/android/play/integrity/internal/ac;

    invoke-interface {v0}, Lcom/google/android/play/integrity/internal/ac;->a()Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/play/core/integrity/v;->b:Lcom/google/android/play/integrity/internal/ac;

    invoke-interface {v1}, Lcom/google/android/play/integrity/internal/ac;->a()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/play/integrity/internal/k;

    new-instance v2, Lcom/google/android/play/core/integrity/t;

    check-cast v0, Landroid/content/Context;

    .line 2
    invoke-direct {v2, v0, v1}, Lcom/google/android/play/core/integrity/t;-><init>(Landroid/content/Context;Lcom/google/android/play/integrity/internal/k;)V

    return-object v2
.end method
