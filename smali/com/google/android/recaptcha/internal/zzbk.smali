.class public final Lcom/google/android/recaptcha/internal/zzbk;
.super Ljava/lang/Object;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"


# static fields
.field public static final zza:Lcom/google/android/recaptcha/internal/zzbk;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/recaptcha/internal/zzbk;

    invoke-direct {v0}, Lcom/google/android/recaptcha/internal/zzbk;-><init>()V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzbk;->zza:Lcom/google/android/recaptcha/internal/zzbk;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final zza(Ljava/lang/Object;)Ljava/lang/Class;
    .locals 5

    .line 1
    instance-of v0, p0, Ljava/lang/Class;

    if-eqz v0, :cond_0

    check-cast p0, Ljava/lang/Class;

    goto/16 :goto_1

    .line 2
    :cond_0
    instance-of v0, p0, Ljava/lang/Integer;

    const/16 v1, 0x8

    const/4 v2, 0x0

    const/4 v3, 0x6

    if-eqz v0, :cond_b

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    const/4 v0, 0x1

    const/4 v4, 0x4

    if-ne p0, v0, :cond_1

    sget-object p0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    goto :goto_0

    :cond_1
    const/4 v0, 0x2

    if-ne p0, v0, :cond_2

    .line 4
    sget-object p0, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    goto :goto_0

    :cond_2
    const/4 v0, 0x3

    if-ne p0, v0, :cond_3

    sget-object p0, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    goto :goto_0

    :cond_3
    if-ne p0, v4, :cond_4

    sget-object p0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    goto :goto_0

    :cond_4
    const/4 v0, 0x5

    if-ne p0, v0, :cond_5

    sget-object p0, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    goto :goto_0

    :cond_5
    if-ne p0, v3, :cond_6

    sget-object p0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    goto :goto_0

    :cond_6
    const/4 v0, 0x7

    if-ne p0, v0, :cond_7

    sget-object p0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    goto :goto_0

    :cond_7
    if-ne p0, v1, :cond_8

    sget-object p0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    goto :goto_0

    :cond_8
    const/16 v0, 0x9

    if-ne p0, v0, :cond_9

    const-class p0, Lcom/google/android/recaptcha/internal/zzcr;

    goto :goto_0

    :cond_9
    move-object p0, v2

    :goto_0
    if-eqz p0, :cond_a

    goto :goto_1

    .line 2
    :cond_a
    new-instance p0, Lcom/google/android/recaptcha/internal/zzt;

    .line 3
    invoke-direct {p0, v4, v3, v2}, Lcom/google/android/recaptcha/internal/zzt;-><init>(IILjava/lang/Throwable;)V

    .line 4
    throw p0

    .line 5
    :cond_b
    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_d

    .line 6
    check-cast p0, Ljava/lang/String;

    invoke-static {p0}, Lcom/google/android/recaptcha/internal/zzbj;->zzc(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 5
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    return-object p0

    :catch_0
    move-exception p0

    new-instance v0, Lcom/google/android/recaptcha/internal/zzt;

    .line 7
    invoke-direct {v0, v3, v1, p0}, Lcom/google/android/recaptcha/internal/zzt;-><init>(IILjava/lang/Throwable;)V

    throw v0

    .line 11
    :cond_c
    new-instance p0, Lcom/google/android/recaptcha/internal/zzt;

    const/16 v0, 0x2f

    .line 8
    invoke-direct {p0, v3, v0, v2}, Lcom/google/android/recaptcha/internal/zzt;-><init>(IILjava/lang/Throwable;)V

    .line 9
    throw p0

    .line 7
    :cond_d
    new-instance p0, Lcom/google/android/recaptcha/internal/zzt;

    .line 10
    invoke-direct {p0, v3, v1, v2}, Lcom/google/android/recaptcha/internal/zzt;-><init>(IILjava/lang/Throwable;)V

    .line 11
    throw p0
.end method
