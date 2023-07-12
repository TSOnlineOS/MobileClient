.class public final Lcom/google/android/recaptcha/internal/zzbr;
.super Ljava/lang/Object;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"

# interfaces
.implements Lcom/google/android/recaptcha/internal/zzby;


# static fields
.field public static final zza:Lcom/google/android/recaptcha/internal/zzbr;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/recaptcha/internal/zzbr;

    invoke-direct {v0}, Lcom/google/android/recaptcha/internal/zzbr;-><init>()V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzbr;->zza:Lcom/google/android/recaptcha/internal/zzbr;

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
    array-length p1, p3

    const/4 v0, 0x3

    const/4 v1, 0x4

    const/4 v2, 0x0

    if-ne p1, v0, :cond_8

    const/4 p1, 0x0

    .line 2
    aget-object p1, p3, p1

    .line 3
    instance-of v0, p1, Ljava/lang/Integer;

    const/4 v3, 0x1

    if-eq v3, v0, :cond_0

    move-object p1, v2

    :cond_0
    check-cast p1, Ljava/lang/Integer;

    const/4 v0, 0x5

    if-eqz p1, :cond_7

    .line 2
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    if-eqz p1, :cond_6

    .line 7
    aget-object v4, p3, v3

    .line 8
    instance-of v5, v4, Ljava/lang/Object;

    if-eq v3, v5, :cond_1

    move-object v4, v2

    :cond_1
    if-eqz v4, :cond_5

    const/4 v5, 0x2

    .line 10
    aget-object p3, p3, v5

    .line 11
    instance-of v5, p3, Ljava/lang/Object;

    if-eq v3, v5, :cond_2

    move-object p3, v2

    :cond_2
    if-eqz p3, :cond_4

    .line 13
    invoke-static {v4, p3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_3

    invoke-virtual {p2}, Lcom/google/android/recaptcha/internal/zzbl;->zzb()I

    move-result p3

    add-int/2addr p3, p1

    .line 14
    invoke-virtual {p2, p3}, Lcom/google/android/recaptcha/internal/zzbl;->zzg(I)V

    :cond_3
    return-void

    .line 11
    :cond_4
    new-instance p1, Lcom/google/android/recaptcha/internal/zzt;

    .line 12
    invoke-direct {p1, v1, v0, v2}, Lcom/google/android/recaptcha/internal/zzt;-><init>(IILjava/lang/Throwable;)V

    .line 11
    throw p1

    .line 8
    :cond_5
    new-instance p1, Lcom/google/android/recaptcha/internal/zzt;

    .line 9
    invoke-direct {p1, v1, v0, v2}, Lcom/google/android/recaptcha/internal/zzt;-><init>(IILjava/lang/Throwable;)V

    .line 8
    throw p1

    .line 2
    :cond_6
    new-instance p1, Lcom/google/android/recaptcha/internal/zzt;

    const/4 p2, 0x6

    .line 5
    invoke-direct {p1, v1, p2, v2}, Lcom/google/android/recaptcha/internal/zzt;-><init>(IILjava/lang/Throwable;)V

    .line 6
    throw p1

    .line 3
    :cond_7
    new-instance p1, Lcom/google/android/recaptcha/internal/zzt;

    .line 4
    invoke-direct {p1, v1, v0, v2}, Lcom/google/android/recaptcha/internal/zzt;-><init>(IILjava/lang/Throwable;)V

    .line 3
    throw p1

    .line 14
    :cond_8
    new-instance p1, Lcom/google/android/recaptcha/internal/zzt;

    .line 15
    invoke-direct {p1, v1, v0, v2}, Lcom/google/android/recaptcha/internal/zzt;-><init>(IILjava/lang/Throwable;)V

    .line 16
    throw p1
.end method
