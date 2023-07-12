.class public final Lcom/google/android/recaptcha/internal/zzlg;
.super Lcom/google/android/recaptcha/internal/zzgo;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"

# interfaces
.implements Lcom/google/android/recaptcha/internal/zzhz;


# static fields
.field private static final zzb:Lcom/google/android/recaptcha/internal/zzlg;


# instance fields
.field private zzd:Lcom/google/android/recaptcha/internal/zzfw;

.field private zze:Lcom/google/android/recaptcha/internal/zzjd;

.field private zzf:Lcom/google/android/recaptcha/internal/zzfw;

.field private zzg:Lcom/google/android/recaptcha/internal/zzjd;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/recaptcha/internal/zzlg;

    invoke-direct {v0}, Lcom/google/android/recaptcha/internal/zzlg;-><init>()V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzlg;->zzb:Lcom/google/android/recaptcha/internal/zzlg;

    const-class v1, Lcom/google/android/recaptcha/internal/zzlg;

    invoke-static {v1, v0}, Lcom/google/android/recaptcha/internal/zzgo;->zzC(Ljava/lang/Class;Lcom/google/android/recaptcha/internal/zzgo;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/recaptcha/internal/zzgo;-><init>()V

    return-void
.end method

.method static synthetic zzG(Lcom/google/android/recaptcha/internal/zzlg;Lcom/google/android/recaptcha/internal/zzfw;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/android/recaptcha/internal/zzlg;->zzf:Lcom/google/android/recaptcha/internal/zzfw;

    return-void
.end method

.method public static zzf()Lcom/google/android/recaptcha/internal/zzlf;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/recaptcha/internal/zzlg;->zzb:Lcom/google/android/recaptcha/internal/zzlg;

    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzgo;->zzp()Lcom/google/android/recaptcha/internal/zzgi;

    move-result-object v0

    check-cast v0, Lcom/google/android/recaptcha/internal/zzlf;

    return-object v0
.end method

.method static synthetic zzg()Lcom/google/android/recaptcha/internal/zzlg;
    .locals 1

    sget-object v0, Lcom/google/android/recaptcha/internal/zzlg;->zzb:Lcom/google/android/recaptcha/internal/zzlg;

    return-object v0
.end method

.method static synthetic zzi(Lcom/google/android/recaptcha/internal/zzlg;Lcom/google/android/recaptcha/internal/zzfw;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/android/recaptcha/internal/zzlg;->zzd:Lcom/google/android/recaptcha/internal/zzfw;

    return-void
.end method

.method static synthetic zzj(Lcom/google/android/recaptcha/internal/zzlg;Lcom/google/android/recaptcha/internal/zzjd;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/android/recaptcha/internal/zzlg;->zzg:Lcom/google/android/recaptcha/internal/zzjd;

    return-void
.end method

.method static synthetic zzk(Lcom/google/android/recaptcha/internal/zzlg;Lcom/google/android/recaptcha/internal/zzjd;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/android/recaptcha/internal/zzlg;->zze:Lcom/google/android/recaptcha/internal/zzjd;

    return-void
.end method


# virtual methods
.method protected final zzh(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    add-int/lit8 p1, p1, -0x1

    const/4 p2, 0x1

    if-eqz p1, :cond_4

    const/4 p3, 0x4

    const/4 v0, 0x3

    const/4 v1, 0x2

    if-eq p1, v1, :cond_3

    if-eq p1, v0, :cond_2

    const/4 p2, 0x0

    if-eq p1, p3, :cond_1

    const/4 p3, 0x5

    if-eq p1, p3, :cond_0

    return-object p2

    .line 1
    :cond_0
    sget-object p1, Lcom/google/android/recaptcha/internal/zzlg;->zzb:Lcom/google/android/recaptcha/internal/zzlg;

    return-object p1

    :cond_1
    new-instance p1, Lcom/google/android/recaptcha/internal/zzlf;

    .line 3
    invoke-direct {p1, p2}, Lcom/google/android/recaptcha/internal/zzlf;-><init>(Lcom/google/android/recaptcha/internal/zzle;)V

    return-object p1

    :cond_2
    new-instance p1, Lcom/google/android/recaptcha/internal/zzlg;

    invoke-direct {p1}, Lcom/google/android/recaptcha/internal/zzlg;-><init>()V

    return-object p1

    :cond_3
    new-array p1, p3, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v2, "zzd"

    aput-object v2, p1, p3

    const-string p3, "zze"

    aput-object p3, p1, p2

    const-string p2, "zzf"

    aput-object p2, p1, v1

    const-string p2, "zzg"

    aput-object p2, p1, v0

    .line 2
    sget-object p2, Lcom/google/android/recaptcha/internal/zzlg;->zzb:Lcom/google/android/recaptcha/internal/zzlg;

    const-string p3, "\u0000\u0004\u0000\u0000\u0001\u0004\u0004\u0000\u0000\u0000\u0001\t\u0002\t\u0003\t\u0004\t"

    invoke-static {p2, p3, p1}, Lcom/google/android/recaptcha/internal/zzlg;->zzz(Lcom/google/android/recaptcha/internal/zzhy;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 1
    :cond_4
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1
.end method
