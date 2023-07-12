.class public final Lcom/google/android/recaptcha/internal/zzkg;
.super Lcom/google/android/recaptcha/internal/zzgo;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"

# interfaces
.implements Lcom/google/android/recaptcha/internal/zzhz;


# static fields
.field private static final zzb:Lcom/google/android/recaptcha/internal/zzkg;


# instance fields
.field private zzd:I

.field private zze:Lcom/google/android/recaptcha/internal/zzfw;

.field private zzf:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/recaptcha/internal/zzkg;

    invoke-direct {v0}, Lcom/google/android/recaptcha/internal/zzkg;-><init>()V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzkg;->zzb:Lcom/google/android/recaptcha/internal/zzkg;

    const-class v1, Lcom/google/android/recaptcha/internal/zzkg;

    invoke-static {v1, v0}, Lcom/google/android/recaptcha/internal/zzgo;->zzC(Ljava/lang/Class;Lcom/google/android/recaptcha/internal/zzgo;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/recaptcha/internal/zzgo;-><init>()V

    return-void
.end method

.method public static zzf()Lcom/google/android/recaptcha/internal/zzkf;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/recaptcha/internal/zzkg;->zzb:Lcom/google/android/recaptcha/internal/zzkg;

    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzgo;->zzp()Lcom/google/android/recaptcha/internal/zzgi;

    move-result-object v0

    check-cast v0, Lcom/google/android/recaptcha/internal/zzkf;

    return-object v0
.end method

.method static synthetic zzg()Lcom/google/android/recaptcha/internal/zzkg;
    .locals 1

    sget-object v0, Lcom/google/android/recaptcha/internal/zzkg;->zzb:Lcom/google/android/recaptcha/internal/zzkg;

    return-object v0
.end method

.method static synthetic zzi(Lcom/google/android/recaptcha/internal/zzkg;Lcom/google/android/recaptcha/internal/zzfw;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/android/recaptcha/internal/zzkg;->zze:Lcom/google/android/recaptcha/internal/zzfw;

    iget p1, p0, Lcom/google/android/recaptcha/internal/zzkg;->zzd:I

    or-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/google/android/recaptcha/internal/zzkg;->zzd:I

    return-void
.end method

.method static synthetic zzj(Lcom/google/android/recaptcha/internal/zzkg;I)V
    .locals 0

    iput p1, p0, Lcom/google/android/recaptcha/internal/zzkg;->zzf:I

    return-void
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
    sget-object p1, Lcom/google/android/recaptcha/internal/zzkg;->zzb:Lcom/google/android/recaptcha/internal/zzkg;

    return-object p1

    :cond_1
    new-instance p1, Lcom/google/android/recaptcha/internal/zzkf;

    .line 3
    invoke-direct {p1, p3}, Lcom/google/android/recaptcha/internal/zzkf;-><init>(Lcom/google/android/recaptcha/internal/zzke;)V

    return-object p1

    :cond_2
    new-instance p1, Lcom/google/android/recaptcha/internal/zzkg;

    invoke-direct {p1}, Lcom/google/android/recaptcha/internal/zzkg;-><init>()V

    return-object p1

    :cond_3
    new-array p1, p3, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v1, "zzd"

    aput-object v1, p1, p3

    const-string p3, "zze"

    aput-object p3, p1, p2

    const-string p2, "zzf"

    aput-object p2, p1, v0

    .line 2
    sget-object p2, Lcom/google/android/recaptcha/internal/zzkg;->zzb:Lcom/google/android/recaptcha/internal/zzkg;

    const-string p3, "\u0000\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001\u1009\u0000\u0002\u0004"

    invoke-static {p2, p3, p1}, Lcom/google/android/recaptcha/internal/zzkg;->zzz(Lcom/google/android/recaptcha/internal/zzhy;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 1
    :cond_4
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1
.end method
