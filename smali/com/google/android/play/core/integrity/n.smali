.class public final Lcom/google/android/play/core/integrity/n;
.super Ljava/lang/Object;
.source "com.google.android.play:integrity@@1.1.0"

# interfaces
.implements Lcom/google/android/play/integrity/internal/aa;


# instance fields
.field private final a:Lcom/google/android/play/integrity/internal/ac;


# direct methods
.method public constructor <init>(Lcom/google/android/play/integrity/internal/ac;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/play/core/integrity/n;->a:Lcom/google/android/play/integrity/internal/ac;

    return-void
.end method


# virtual methods
.method public final bridge synthetic a()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/play/core/integrity/n;->a:Lcom/google/android/play/integrity/internal/ac;

    invoke-interface {v0}, Lcom/google/android/play/integrity/internal/ac;->a()Ljava/lang/Object;

    move-result-object v0

    new-instance v1, Lcom/google/android/play/core/integrity/m;

    .line 2
    check-cast v0, Lcom/google/android/play/core/integrity/t;

    invoke-direct {v1, v0}, Lcom/google/android/play/core/integrity/m;-><init>(Lcom/google/android/play/core/integrity/t;)V

    return-object v1
.end method
