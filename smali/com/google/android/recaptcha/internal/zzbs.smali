.class public final Lcom/google/android/recaptcha/internal/zzbs;
.super Ljava/lang/Object;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"

# interfaces
.implements Lcom/google/android/recaptcha/internal/zzby;


# static fields
.field public static final zza:Lcom/google/android/recaptcha/internal/zzbs;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/recaptcha/internal/zzbs;

    invoke-direct {v0}, Lcom/google/android/recaptcha/internal/zzbs;-><init>()V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzbs;->zza:Lcom/google/android/recaptcha/internal/zzbs;

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

    const/4 v1, 0x4

    const/4 v2, 0x0

    const/4 v3, 0x2

    if-ne v0, v3, :cond_4

    const/4 v0, 0x0

    .line 4
    aget-object v0, p3, v0

    .line 5
    instance-of v3, v0, Ljava/lang/String;

    const/4 v4, 0x1

    if-eq v4, v3, :cond_0

    move-object v0, v2

    .line 4
    :cond_0
    check-cast v0, Ljava/lang/String;

    const/4 v3, 0x5

    if-eqz v0, :cond_3

    .line 7
    aget-object p3, p3, v4

    .line 8
    instance-of v5, p3, Ljava/lang/String;

    if-eq v4, v5, :cond_1

    move-object p3, v2

    .line 7
    :cond_1
    check-cast p3, Ljava/lang/String;

    if-eqz p3, :cond_2

    .line 8
    invoke-virtual {p2}, Lcom/google/android/recaptcha/internal/zzbl;->zzc()Lcom/google/android/recaptcha/internal/zzbm;

    move-result-object p2

    invoke-virtual {v0, p3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 10
    invoke-virtual {p2, p1, p3}, Lcom/google/android/recaptcha/internal/zzbm;->zzf(ILjava/lang/Object;)V

    return-void

    .line 7
    :cond_2
    new-instance p1, Lcom/google/android/recaptcha/internal/zzt;

    .line 9
    invoke-direct {p1, v1, v3, v2}, Lcom/google/android/recaptcha/internal/zzt;-><init>(IILjava/lang/Throwable;)V

    .line 8
    throw p1

    .line 4
    :cond_3
    new-instance p1, Lcom/google/android/recaptcha/internal/zzt;

    .line 6
    invoke-direct {p1, v1, v3, v2}, Lcom/google/android/recaptcha/internal/zzt;-><init>(IILjava/lang/Throwable;)V

    .line 5
    throw p1

    .line 1
    :cond_4
    new-instance p1, Lcom/google/android/recaptcha/internal/zzt;

    const/4 p2, 0x3

    .line 2
    invoke-direct {p1, v1, p2, v2}, Lcom/google/android/recaptcha/internal/zzt;-><init>(IILjava/lang/Throwable;)V

    .line 3
    throw p1
.end method
