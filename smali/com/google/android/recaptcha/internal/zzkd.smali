.class public final Lcom/google/android/recaptcha/internal/zzkd;
.super Lcom/google/android/recaptcha/internal/zzgo;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"

# interfaces
.implements Lcom/google/android/recaptcha/internal/zzhz;


# static fields
.field private static final zzb:Lcom/google/android/recaptcha/internal/zzkd;


# instance fields
.field private zzd:Lcom/google/android/recaptcha/internal/zzgv;

.field private zze:Lcom/google/android/recaptcha/internal/zzfw;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/recaptcha/internal/zzkd;

    invoke-direct {v0}, Lcom/google/android/recaptcha/internal/zzkd;-><init>()V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzkd;->zzb:Lcom/google/android/recaptcha/internal/zzkd;

    const-class v1, Lcom/google/android/recaptcha/internal/zzkd;

    .line 2
    invoke-static {v1, v0}, Lcom/google/android/recaptcha/internal/zzgo;->zzC(Ljava/lang/Class;Lcom/google/android/recaptcha/internal/zzgo;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/recaptcha/internal/zzgo;-><init>()V

    .line 2
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzkd;->zzw()Lcom/google/android/recaptcha/internal/zzgv;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/recaptcha/internal/zzkd;->zzd:Lcom/google/android/recaptcha/internal/zzgv;

    return-void
.end method

.method static synthetic zzf()Lcom/google/android/recaptcha/internal/zzkd;
    .locals 1

    sget-object v0, Lcom/google/android/recaptcha/internal/zzkd;->zzb:Lcom/google/android/recaptcha/internal/zzkd;

    return-object v0
.end method


# virtual methods
.method protected final zzh(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    add-int/lit8 p1, p1, -0x1

    const/4 p2, 0x1

    if-eqz p1, :cond_4

    const/4 p3, 0x3

    const/4 v0, 0x2

    if-eq p1, v0, :cond_3

    if-eq p1, p3, :cond_2

    const/4 p2, 0x4

    const/4 p3, 0x0

    if-eq p1, p2, :cond_1

    const/4 p2, 0x5

    if-eq p1, p2, :cond_0

    return-object p3

    .line 1
    :cond_0
    sget-object p1, Lcom/google/android/recaptcha/internal/zzkd;->zzb:Lcom/google/android/recaptcha/internal/zzkd;

    return-object p1

    :cond_1
    new-instance p1, Lcom/google/android/recaptcha/internal/zzkc;

    .line 3
    invoke-direct {p1, p3}, Lcom/google/android/recaptcha/internal/zzkc;-><init>(Lcom/google/android/recaptcha/internal/zzkb;)V

    return-object p1

    :cond_2
    new-instance p1, Lcom/google/android/recaptcha/internal/zzkd;

    .line 4
    invoke-direct {p1}, Lcom/google/android/recaptcha/internal/zzkd;-><init>()V

    return-object p1

    :cond_3
    new-array p1, p3, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v1, "zzd"

    aput-object v1, p1, p3

    .line 2
    const-class p3, Lcom/google/android/recaptcha/internal/zzlm;

    aput-object p3, p1, p2

    const-string p2, "zze"

    aput-object p2, p1, v0

    sget-object p2, Lcom/google/android/recaptcha/internal/zzkd;->zzb:Lcom/google/android/recaptcha/internal/zzkd;

    const-string p3, "\u0000\u0002\u0000\u0000\u000c\r\u0002\u0000\u0001\u0000\u000c\u001b\r\t"

    invoke-static {p2, p3, p1}, Lcom/google/android/recaptcha/internal/zzkd;->zzz(Lcom/google/android/recaptcha/internal/zzhy;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 1
    :cond_4
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1
.end method
