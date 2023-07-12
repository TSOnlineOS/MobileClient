.class public final Lcom/google/android/recaptcha/internal/zzld;
.super Lcom/google/android/recaptcha/internal/zzgo;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"

# interfaces
.implements Lcom/google/android/recaptcha/internal/zzhz;


# static fields
.field private static final zzb:Lcom/google/android/recaptcha/internal/zzld;


# instance fields
.field private zzd:I

.field private zze:Ljava/lang/Object;

.field private zzf:Lcom/google/android/recaptcha/internal/zzlg;

.field private zzg:I

.field private zzh:Lcom/google/android/recaptcha/internal/zzkm;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/recaptcha/internal/zzld;

    invoke-direct {v0}, Lcom/google/android/recaptcha/internal/zzld;-><init>()V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzld;->zzb:Lcom/google/android/recaptcha/internal/zzld;

    const-class v1, Lcom/google/android/recaptcha/internal/zzld;

    invoke-static {v1, v0}, Lcom/google/android/recaptcha/internal/zzgo;->zzC(Ljava/lang/Class;Lcom/google/android/recaptcha/internal/zzgo;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/recaptcha/internal/zzgo;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/recaptcha/internal/zzld;->zzd:I

    return-void
.end method

.method static synthetic zzf()Lcom/google/android/recaptcha/internal/zzld;
    .locals 1

    sget-object v0, Lcom/google/android/recaptcha/internal/zzld;->zzb:Lcom/google/android/recaptcha/internal/zzld;

    return-object v0
.end method


# virtual methods
.method protected final zzh(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

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
    sget-object p1, Lcom/google/android/recaptcha/internal/zzld;->zzb:Lcom/google/android/recaptcha/internal/zzld;

    return-object p1

    :cond_1
    new-instance p1, Lcom/google/android/recaptcha/internal/zzlc;

    .line 3
    invoke-direct {p1, p2}, Lcom/google/android/recaptcha/internal/zzlc;-><init>(Lcom/google/android/recaptcha/internal/zzlb;)V

    return-object p1

    :cond_2
    new-instance p1, Lcom/google/android/recaptcha/internal/zzld;

    invoke-direct {p1}, Lcom/google/android/recaptcha/internal/zzld;-><init>()V

    return-object p1

    :cond_3
    new-array p1, p3, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v3, "zze"

    aput-object v3, p1, p3

    const-string p3, "zzd"

    aput-object p3, p1, p2

    const-string p2, "zzf"

    aput-object p2, p1, v2

    const-string p2, "zzg"

    aput-object p2, p1, v1

    const-string p2, "zzh"

    aput-object p2, p1, v0

    .line 2
    sget-object p2, Lcom/google/android/recaptcha/internal/zzld;->zzb:Lcom/google/android/recaptcha/internal/zzld;

    const-string p3, "\u0000\u0017\u0001\u0000\u0001\u0017\u0017\u0000\u0000\u0000\u0001\t\u0002\u000c\u0003\t\u0004?\u0000\u0005?\u0000\u0006?\u0000\u0007?\u0000\u0008?\u0000\t?\u0000\n?\u0000\u000b?\u0000\u000c?\u0000\r?\u0000\u000e?\u0000\u000f?\u0000\u0010?\u0000\u0011?\u0000\u0012?\u0000\u0013?\u0000\u0014?\u0000\u0015?\u0000\u0016?\u0000\u0017?\u0000"

    invoke-static {p2, p3, p1}, Lcom/google/android/recaptcha/internal/zzld;->zzz(Lcom/google/android/recaptcha/internal/zzhy;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 1
    :cond_4
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1
.end method
