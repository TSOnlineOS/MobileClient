.class public final Lcom/google/android/recaptcha/internal/zzck;
.super Ljava/lang/Object;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"

# interfaces
.implements Lcom/google/android/recaptcha/internal/zzby;


# static fields
.field public static final zza:Lcom/google/android/recaptcha/internal/zzck;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/recaptcha/internal/zzck;

    invoke-direct {v0}, Lcom/google/android/recaptcha/internal/zzck;-><init>()V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzck;->zza:Lcom/google/android/recaptcha/internal/zzck;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final varargs zza(ILcom/google/android/recaptcha/internal/zzbl;[Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/recaptcha/internal/zzt;
        }
    .end annotation

    .line 1
    array-length p1, p3

    const/4 v0, 0x4

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne p1, v1, :cond_2

    const/4 p1, 0x0

    .line 2
    aget-object p1, p3, p1

    .line 3
    instance-of p3, p1, Ljava/lang/String;

    if-eq v1, p3, :cond_0

    move-object p1, v2

    .line 2
    :cond_0
    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_1

    .line 5
    invoke-virtual {p2, p1}, Lcom/google/android/recaptcha/internal/zzbl;->zzf(Ljava/lang/String;)V

    return-void

    .line 2
    :cond_1
    new-instance p1, Lcom/google/android/recaptcha/internal/zzt;

    const/4 p2, 0x5

    .line 4
    invoke-direct {p1, v0, p2, v2}, Lcom/google/android/recaptcha/internal/zzt;-><init>(IILjava/lang/Throwable;)V

    .line 3
    throw p1

    .line 5
    :cond_2
    new-instance p1, Lcom/google/android/recaptcha/internal/zzt;

    const/4 p2, 0x3

    .line 6
    invoke-direct {p1, v0, p2, v2}, Lcom/google/android/recaptcha/internal/zzt;-><init>(IILjava/lang/Throwable;)V

    .line 7
    throw p1
.end method
