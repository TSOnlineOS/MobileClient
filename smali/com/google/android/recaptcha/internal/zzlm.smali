.class public final Lcom/google/android/recaptcha/internal/zzlm;
.super Lcom/google/android/recaptcha/internal/zzgo;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"

# interfaces
.implements Lcom/google/android/recaptcha/internal/zzhz;


# static fields
.field private static final zzb:Lcom/google/android/recaptcha/internal/zzlm;


# instance fields
.field private zzd:I

.field private zze:Z

.field private zzf:Lcom/google/android/recaptcha/internal/zzfw;

.field private zzg:Lcom/google/android/recaptcha/internal/zzjd;

.field private zzh:I

.field private zzi:Lcom/google/android/recaptcha/internal/zzkm;

.field private zzj:Lcom/google/android/recaptcha/internal/zzgv;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/recaptcha/internal/zzlm;

    invoke-direct {v0}, Lcom/google/android/recaptcha/internal/zzlm;-><init>()V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzlm;->zzb:Lcom/google/android/recaptcha/internal/zzlm;

    const-class v1, Lcom/google/android/recaptcha/internal/zzlm;

    .line 2
    invoke-static {v1, v0}, Lcom/google/android/recaptcha/internal/zzgo;->zzC(Ljava/lang/Class;Lcom/google/android/recaptcha/internal/zzgo;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/recaptcha/internal/zzgo;-><init>()V

    .line 2
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzlm;->zzw()Lcom/google/android/recaptcha/internal/zzgv;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/recaptcha/internal/zzlm;->zzj:Lcom/google/android/recaptcha/internal/zzgv;

    return-void
.end method

.method static synthetic zzf()Lcom/google/android/recaptcha/internal/zzlm;
    .locals 1

    sget-object v0, Lcom/google/android/recaptcha/internal/zzlm;->zzb:Lcom/google/android/recaptcha/internal/zzlm;

    return-object v0
.end method


# virtual methods
.method protected final zzh(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    add-int/lit8 p1, p1, -0x1

    const/4 p2, 0x1

    if-eqz p1, :cond_4

    const/4 p3, 0x5

    const/4 v0, 0x4

    const/4 v1, 0x3

    const/4 v2, 0x2

    if-eq p1, v2, :cond_3

    if-eq p1, v1, :cond_2

    const/4 p2, 0x0

    if-eq p1, v0, :cond_1

    if-eq p1, p3, :cond_0

    return-object p2

    .line 1
    :cond_0
    sget-object p1, Lcom/google/android/recaptcha/internal/zzlm;->zzb:Lcom/google/android/recaptcha/internal/zzlm;

    return-object p1

    :cond_1
    new-instance p1, Lcom/google/android/recaptcha/internal/zzll;

    .line 3
    invoke-direct {p1, p2}, Lcom/google/android/recaptcha/internal/zzll;-><init>(Lcom/google/android/recaptcha/internal/zzlk;)V

    return-object p1

    :cond_2
    new-instance p1, Lcom/google/android/recaptcha/internal/zzlm;

    .line 4
    invoke-direct {p1}, Lcom/google/android/recaptcha/internal/zzlm;-><init>()V

    return-object p1

    :cond_3
    const/16 p1, 0x8

    new-array p1, p1, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string v4, "zzd"

    aput-object v4, p1, v3

    const-string v3, "zze"

    aput-object v3, p1, p2

    const-string p2, "zzf"

    aput-object p2, p1, v2

    const-string p2, "zzg"

    aput-object p2, p1, v1

    const-string p2, "zzh"

    aput-object p2, p1, v0

    const-string p2, "zzi"

    aput-object p2, p1, p3

    const/4 p2, 0x6

    const-string p3, "zzj"

    aput-object p3, p1, p2

    const/4 p2, 0x7

    .line 2
    const-class p3, Lcom/google/android/recaptcha/internal/zzld;

    aput-object p3, p1, p2

    sget-object p2, Lcom/google/android/recaptcha/internal/zzlm;->zzb:Lcom/google/android/recaptcha/internal/zzlm;

    const-string p3, "\u0000\u0007\u0000\u0000\u0001\u0007\u0007\u0000\u0001\u0000\u0001\u0004\u0002\u0007\u0003\t\u0004\t\u0005\u000c\u0006\t\u0007\u001b"

    invoke-static {p2, p3, p1}, Lcom/google/android/recaptcha/internal/zzlm;->zzz(Lcom/google/android/recaptcha/internal/zzhy;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 1
    :cond_4
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1
.end method
