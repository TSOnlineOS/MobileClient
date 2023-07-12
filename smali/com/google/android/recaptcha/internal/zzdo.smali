.class public final Lcom/google/android/recaptcha/internal/zzdo;
.super Lcom/google/android/recaptcha/internal/zzds;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field final zza:I

.field private final zzb:Ljava/util/Queue;


# direct methods
.method private constructor <init>(I)V
    .locals 3

    .line 2
    invoke-direct {p0}, Lcom/google/android/recaptcha/internal/zzds;-><init>()V

    if-ltz p1, :cond_0

    new-instance v0, Ljava/util/ArrayDeque;

    .line 1
    invoke-direct {v0, p1}, Ljava/util/ArrayDeque;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/recaptcha/internal/zzdo;->zzb:Ljava/util/Queue;

    iput p1, p0, Lcom/google/android/recaptcha/internal/zzdo;->zza:I

    return-void

    .line 2
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v1, v2

    const-string p1, "maxSize (%s) must >= 0"

    invoke-static {p1, v1}, Lcom/google/android/recaptcha/internal/zzdl;->zza(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static zza(I)Lcom/google/android/recaptcha/internal/zzdo;
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/recaptcha/internal/zzdo;

    invoke-direct {v0, p0}, Lcom/google/android/recaptcha/internal/zzdo;-><init>(I)V

    return-object v0
.end method


# virtual methods
.method public final add(Ljava/lang/Object;)Z
    .locals 3

    if-eqz p1, :cond_2

    .line 1
    iget v0, p0, Lcom/google/android/recaptcha/internal/zzdo;->zza:I

    const/4 v1, 0x1

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/recaptcha/internal/zzdq;->size()I

    move-result v0

    iget v2, p0, Lcom/google/android/recaptcha/internal/zzdo;->zza:I

    if-ne v0, v2, :cond_1

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzdo;->zzb:Ljava/util/Queue;

    .line 2
    invoke-interface {v0}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    .line 4
    :cond_1
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzdo;->zzb:Ljava/util/Queue;

    .line 3
    invoke-interface {v0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    return v1

    :cond_2
    const/4 p1, 0x0

    .line 4
    throw p1
.end method

.method public final addAll(Ljava/util/Collection;)Z
    .locals 3

    .line 1
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v0

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzdo;->zza:I

    if-lt v0, v1, :cond_2

    .line 3
    invoke-virtual {p0}, Lcom/google/android/recaptcha/internal/zzdq;->clear()V

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzdo;->zza:I

    sub-int/2addr v0, v1

    if-eqz p1, :cond_1

    if-ltz v0, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    const-string v2, "number to skip cannot be negative"

    .line 4
    invoke-static {v1, v2}, Lcom/google/android/recaptcha/internal/zzdi;->zzb(ZLjava/lang/Object;)V

    new-instance v1, Lcom/google/android/recaptcha/internal/zzdu;

    invoke-direct {v1, p1, v0}, Lcom/google/android/recaptcha/internal/zzdu;-><init>(Ljava/lang/Iterable;I)V

    .line 5
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/google/android/recaptcha/internal/zzdv;->zza(Ljava/util/Collection;Ljava/util/Iterator;)Z

    move-result p1

    return p1

    :cond_1
    const/4 p1, 0x0

    .line 6
    throw p1

    .line 2
    :cond_2
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/google/android/recaptcha/internal/zzdv;->zza(Ljava/util/Collection;Ljava/util/Iterator;)Z

    move-result p1

    return p1
.end method

.method public final offer(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/recaptcha/internal/zzdq;->add(Ljava/lang/Object;)Z

    const/4 p1, 0x1

    return p1
.end method

.method protected final synthetic zzb()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzdo;->zzb:Ljava/util/Queue;

    return-object v0
.end method

.method protected final synthetic zzc()Ljava/util/Collection;
    .locals 1

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzdo;->zzb:Ljava/util/Queue;

    return-object v0
.end method

.method protected final zzd()Ljava/util/Queue;
    .locals 1

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzdo;->zzb:Ljava/util/Queue;

    return-object v0
.end method
