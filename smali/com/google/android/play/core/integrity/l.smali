.class final Lcom/google/android/play/core/integrity/l;
.super Ljava/lang/Object;
.source "com.google.android.play:integrity@@1.1.0"


# static fields
.field private static a:Lcom/google/android/play/core/integrity/j;


# direct methods
.method static declared-synchronized a(Landroid/content/Context;)Lcom/google/android/play/core/integrity/j;
    .locals 3

    const-class v0, Lcom/google/android/play/core/integrity/l;

    monitor-enter v0

    .line 1
    :try_start_0
    sget-object v1, Lcom/google/android/play/core/integrity/l;->a:Lcom/google/android/play/core/integrity/j;

    if-nez v1, :cond_1

    new-instance v1, Lcom/google/android/play/core/integrity/h;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/google/android/play/core/integrity/h;-><init>(Lcom/google/android/play/core/integrity/g;)V

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    if-eqz v2, :cond_0

    move-object p0, v2

    .line 2
    :cond_0
    invoke-virtual {v1, p0}, Lcom/google/android/play/core/integrity/h;->a(Landroid/content/Context;)Lcom/google/android/play/core/integrity/h;

    .line 3
    invoke-interface {v1}, Lcom/google/android/play/core/integrity/k;->b()Lcom/google/android/play/core/integrity/j;

    move-result-object p0

    sput-object p0, Lcom/google/android/play/core/integrity/l;->a:Lcom/google/android/play/core/integrity/j;

    :cond_1
    sget-object p0, Lcom/google/android/play/core/integrity/l;->a:Lcom/google/android/play/core/integrity/j;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method
