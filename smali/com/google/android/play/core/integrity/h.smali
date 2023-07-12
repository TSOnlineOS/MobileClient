.class final Lcom/google/android/play/core/integrity/h;
.super Ljava/lang/Object;
.source "com.google.android.play:integrity@@1.1.0"

# interfaces
.implements Lcom/google/android/play/core/integrity/k;


# instance fields
.field private a:Landroid/content/Context;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/play/core/integrity/g;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Lcom/google/android/play/core/integrity/h;
    .locals 0

    if-eqz p1, :cond_0

    .line 1
    iput-object p1, p0, Lcom/google/android/play/core/integrity/h;->a:Landroid/content/Context;

    return-object p0

    :cond_0
    const/4 p1, 0x0

    throw p1
.end method

.method public final b()Lcom/google/android/play/core/integrity/j;
    .locals 3

    .line 2
    iget-object v0, p0, Lcom/google/android/play/core/integrity/h;->a:Landroid/content/Context;

    if-eqz v0, :cond_0

    new-instance v1, Lcom/google/android/play/core/integrity/j;

    const/4 v2, 0x0

    .line 1
    invoke-direct {v1, v0, v2}, Lcom/google/android/play/core/integrity/j;-><init>(Landroid/content/Context;Lcom/google/android/play/core/integrity/i;)V

    return-object v1

    .line 2
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-class v1, Landroid/content/Context;

    invoke-virtual {v1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, " must be set"

    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
