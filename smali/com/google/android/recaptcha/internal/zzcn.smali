.class public final Lcom/google/android/recaptcha/internal/zzcn;
.super Ljava/lang/Object;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"

# interfaces
.implements Lcom/google/android/recaptcha/internal/zzby;


# static fields
.field public static final zza:Lcom/google/android/recaptcha/internal/zzcn;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/recaptcha/internal/zzcn;

    invoke-direct {v0}, Lcom/google/android/recaptcha/internal/zzcn;-><init>()V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzcn;->zza:Lcom/google/android/recaptcha/internal/zzcn;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final varargs zza(ILcom/google/android/recaptcha/internal/zzbl;[Ljava/lang/Object;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/recaptcha/internal/zzt;
        }
    .end annotation

    .line 1
    array-length v0, p3

    const/4 v1, 0x4

    const/4 v2, 0x0

    const/4 v3, 0x2

    if-ne v0, v3, :cond_5

    const/4 v0, 0x0

    .line 2
    aget-object v3, p3, v0

    .line 3
    instance-of v4, v3, [I

    const/4 v5, 0x1

    if-eq v5, v4, :cond_0

    move-object v3, v2

    .line 2
    :cond_0
    check-cast v3, [I

    const/4 v4, 0x5

    if-eqz v3, :cond_4

    .line 5
    aget-object p3, p3, v5

    .line 6
    instance-of v6, p3, Ljava/lang/String;

    if-eq v5, v6, :cond_1

    move-object p3, v2

    .line 5
    :cond_1
    check-cast p3, Ljava/lang/String;

    if-eqz p3, :cond_3

    .line 6
    invoke-virtual {p2}, Lcom/google/android/recaptcha/internal/zzbl;->zzc()Lcom/google/android/recaptcha/internal/zzbm;

    move-result-object p2

    new-instance v2, Ljava/lang/StringBuilder;

    .line 8
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    :try_start_0
    array-length v4, v3

    :goto_0
    if-ge v0, v4, :cond_2

    .line 9
    aget v5, v3, v0

    .line 10
    invoke-virtual {p3, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    .line 11
    invoke-virtual {p2, p1, p3}, Lcom/google/android/recaptcha/internal/zzbm;->zzf(ILjava/lang/Object;)V

    return-void

    :catch_0
    move-exception p1

    new-instance p2, Lcom/google/android/recaptcha/internal/zzt;

    const/16 p3, 0x16

    .line 12
    invoke-direct {p2, v1, p3, p1}, Lcom/google/android/recaptcha/internal/zzt;-><init>(IILjava/lang/Throwable;)V

    throw p2

    .line 5
    :cond_3
    new-instance p1, Lcom/google/android/recaptcha/internal/zzt;

    .line 7
    invoke-direct {p1, v1, v4, v2}, Lcom/google/android/recaptcha/internal/zzt;-><init>(IILjava/lang/Throwable;)V

    .line 6
    throw p1

    .line 2
    :cond_4
    new-instance p1, Lcom/google/android/recaptcha/internal/zzt;

    .line 4
    invoke-direct {p1, v1, v4, v2}, Lcom/google/android/recaptcha/internal/zzt;-><init>(IILjava/lang/Throwable;)V

    .line 3
    throw p1

    .line 12
    :cond_5
    new-instance p1, Lcom/google/android/recaptcha/internal/zzt;

    const/4 p2, 0x3

    .line 13
    invoke-direct {p1, v1, p2, v2}, Lcom/google/android/recaptcha/internal/zzt;-><init>(IILjava/lang/Throwable;)V

    .line 14
    throw p1
.end method
