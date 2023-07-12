.class public final Lcom/google/android/recaptcha/internal/zzbp;
.super Ljava/lang/Object;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"

# interfaces
.implements Lcom/google/android/recaptcha/internal/zzby;


# static fields
.field public static final zza:Lcom/google/android/recaptcha/internal/zzbp;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/recaptcha/internal/zzbp;

    invoke-direct {v0}, Lcom/google/android/recaptcha/internal/zzbp;-><init>()V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzbp;->zza:Lcom/google/android/recaptcha/internal/zzbp;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final varargs zza(ILcom/google/android/recaptcha/internal/zzbl;[Ljava/lang/Object;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/recaptcha/internal/zzt;
        }
    .end annotation

    .line 1
    array-length v0, p3

    const/4 v1, 0x0

    const/4 v2, 0x4

    const/4 v3, 0x2

    if-ne v0, v3, :cond_7

    const/4 v0, 0x0

    .line 4
    aget-object v0, p3, v0

    .line 5
    instance-of v3, v0, Ljava/lang/Object;

    const/4 v4, 0x1

    if-eq v4, v3, :cond_0

    move-object v0, v1

    :cond_0
    const/4 v3, 0x5

    if-eqz v0, :cond_6

    .line 7
    aget-object p3, p3, v4

    .line 8
    instance-of v5, p3, Ljava/lang/Integer;

    if-eq v4, v5, :cond_1

    move-object p3, v1

    :cond_1
    check-cast p3, Ljava/lang/Integer;

    if-eqz p3, :cond_5

    .line 7
    invoke-virtual {p3}, Ljava/lang/Number;->intValue()I

    move-result p3

    .line 10
    :try_start_0
    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_2

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0, p3}, Ljava/lang/String;->charAt(I)C

    move-result p3

    invoke-static {p3}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object p3

    goto :goto_0

    .line 11
    :cond_2
    instance-of v1, v0, Ljava/util/List;

    if-eqz v1, :cond_3

    check-cast v0, Ljava/util/List;

    invoke-interface {v0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p3

    goto :goto_0

    .line 12
    :cond_3
    invoke-static {v0, p3}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object p3

    .line 10
    :goto_0
    invoke-virtual {p2}, Lcom/google/android/recaptcha/internal/zzbl;->zzc()Lcom/google/android/recaptcha/internal/zzbm;

    move-result-object p2

    .line 13
    invoke-virtual {p2, p1, p3}, Lcom/google/android/recaptcha/internal/zzbm;->zzf(ILjava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 14
    instance-of p2, p1, Ljava/lang/ArrayIndexOutOfBoundsException;

    if-eqz p2, :cond_4

    .line 16
    new-instance p2, Lcom/google/android/recaptcha/internal/zzt;

    const/16 p3, 0x16

    .line 15
    invoke-direct {p2, v2, p3, p1}, Lcom/google/android/recaptcha/internal/zzt;-><init>(IILjava/lang/Throwable;)V

    throw p2

    .line 12
    :cond_4
    new-instance p2, Lcom/google/android/recaptcha/internal/zzt;

    const/16 p3, 0x17

    .line 16
    invoke-direct {p2, v2, p3, p1}, Lcom/google/android/recaptcha/internal/zzt;-><init>(IILjava/lang/Throwable;)V

    throw p2

    .line 8
    :cond_5
    new-instance p1, Lcom/google/android/recaptcha/internal/zzt;

    .line 9
    invoke-direct {p1, v2, v3, v1}, Lcom/google/android/recaptcha/internal/zzt;-><init>(IILjava/lang/Throwable;)V

    .line 8
    throw p1

    .line 5
    :cond_6
    new-instance p1, Lcom/google/android/recaptcha/internal/zzt;

    .line 6
    invoke-direct {p1, v2, v3, v1}, Lcom/google/android/recaptcha/internal/zzt;-><init>(IILjava/lang/Throwable;)V

    .line 5
    throw p1

    .line 1
    :cond_7
    new-instance p1, Lcom/google/android/recaptcha/internal/zzt;

    const/4 p2, 0x3

    .line 2
    invoke-direct {p1, v2, p2, v1}, Lcom/google/android/recaptcha/internal/zzt;-><init>(IILjava/lang/Throwable;)V

    .line 3
    throw p1
.end method
