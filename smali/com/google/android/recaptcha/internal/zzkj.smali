.class public final Lcom/google/android/recaptcha/internal/zzkj;
.super Lcom/google/android/recaptcha/internal/zzgo;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"

# interfaces
.implements Lcom/google/android/recaptcha/internal/zzhz;


# static fields
.field private static final zzb:Lcom/google/android/recaptcha/internal/zzgu;

.field private static final zzd:Lcom/google/android/recaptcha/internal/zzkj;


# instance fields
.field private zze:I

.field private zzf:Ljava/lang/String;

.field private zzg:Ljava/lang/String;

.field private zzh:Ljava/lang/String;

.field private zzi:Ljava/lang/String;

.field private zzj:Ljava/lang/String;

.field private zzk:Lcom/google/android/recaptcha/internal/zzgt;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/recaptcha/internal/zzkh;

    invoke-direct {v0}, Lcom/google/android/recaptcha/internal/zzkh;-><init>()V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzkj;->zzb:Lcom/google/android/recaptcha/internal/zzgu;

    new-instance v0, Lcom/google/android/recaptcha/internal/zzkj;

    invoke-direct {v0}, Lcom/google/android/recaptcha/internal/zzkj;-><init>()V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzkj;->zzd:Lcom/google/android/recaptcha/internal/zzkj;

    const-class v1, Lcom/google/android/recaptcha/internal/zzkj;

    .line 2
    invoke-static {v1, v0}, Lcom/google/android/recaptcha/internal/zzgo;->zzC(Ljava/lang/Class;Lcom/google/android/recaptcha/internal/zzgo;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/recaptcha/internal/zzgo;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/google/android/recaptcha/internal/zzkj;->zzf:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/recaptcha/internal/zzkj;->zzg:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/recaptcha/internal/zzkj;->zzh:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/recaptcha/internal/zzkj;->zzi:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/recaptcha/internal/zzkj;->zzj:Ljava/lang/String;

    .line 2
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzkj;->zzv()Lcom/google/android/recaptcha/internal/zzgt;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/recaptcha/internal/zzkj;->zzk:Lcom/google/android/recaptcha/internal/zzgt;

    return-void
.end method

.method static synthetic zzG(Lcom/google/android/recaptcha/internal/zzkj;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/android/recaptcha/internal/zzkj;->zzf:Ljava/lang/String;

    return-void
.end method

.method static synthetic zzH(Lcom/google/android/recaptcha/internal/zzkj;Ljava/lang/String;)V
    .locals 0

    const-string p1, "18.1.2"

    iput-object p1, p0, Lcom/google/android/recaptcha/internal/zzkj;->zzg:Ljava/lang/String;

    return-void
.end method

.method static synthetic zzI(Lcom/google/android/recaptcha/internal/zzkj;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/android/recaptcha/internal/zzkj;->zzh:Ljava/lang/String;

    return-void
.end method

.method public static zzf()Lcom/google/android/recaptcha/internal/zzki;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/recaptcha/internal/zzkj;->zzd:Lcom/google/android/recaptcha/internal/zzkj;

    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzgo;->zzp()Lcom/google/android/recaptcha/internal/zzgi;

    move-result-object v0

    check-cast v0, Lcom/google/android/recaptcha/internal/zzki;

    return-object v0
.end method

.method static synthetic zzg()Lcom/google/android/recaptcha/internal/zzkj;
    .locals 1

    sget-object v0, Lcom/google/android/recaptcha/internal/zzkj;->zzd:Lcom/google/android/recaptcha/internal/zzkj;

    return-object v0
.end method

.method static synthetic zzi(Lcom/google/android/recaptcha/internal/zzkj;I)V
    .locals 0

    iput p1, p0, Lcom/google/android/recaptcha/internal/zzkj;->zze:I

    return-void
.end method

.method static synthetic zzj(Lcom/google/android/recaptcha/internal/zzkj;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/android/recaptcha/internal/zzkj;->zzi:Ljava/lang/String;

    return-void
.end method

.method static synthetic zzk(Lcom/google/android/recaptcha/internal/zzkj;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/android/recaptcha/internal/zzkj;->zzj:Ljava/lang/String;

    return-void
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
    sget-object p1, Lcom/google/android/recaptcha/internal/zzkj;->zzd:Lcom/google/android/recaptcha/internal/zzkj;

    return-object p1

    :cond_1
    new-instance p1, Lcom/google/android/recaptcha/internal/zzki;

    .line 3
    invoke-direct {p1, p2}, Lcom/google/android/recaptcha/internal/zzki;-><init>(Lcom/google/android/recaptcha/internal/zzkh;)V

    return-object p1

    :cond_2
    new-instance p1, Lcom/google/android/recaptcha/internal/zzkj;

    .line 4
    invoke-direct {p1}, Lcom/google/android/recaptcha/internal/zzkj;-><init>()V

    return-object p1

    :cond_3
    const/4 p1, 0x7

    new-array p1, p1, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string v4, "zze"

    aput-object v4, p1, v3

    const-string v3, "zzf"

    aput-object v3, p1, p2

    const-string p2, "zzg"

    aput-object p2, p1, v2

    const-string p2, "zzh"

    aput-object p2, p1, v1

    const-string p2, "zzi"

    aput-object p2, p1, v0

    const-string p2, "zzj"

    aput-object p2, p1, p3

    const/4 p2, 0x6

    const-string p3, "zzk"

    aput-object p3, p1, p2

    .line 2
    sget-object p2, Lcom/google/android/recaptcha/internal/zzkj;->zzd:Lcom/google/android/recaptcha/internal/zzkj;

    const-string p3, "\u0000\u0007\u0000\u0000\u0001\u0007\u0007\u0000\u0001\u0000\u0001\u0004\u0002\u0208\u0003\u0208\u0004\u0208\u0005\u0208\u0006\u0208\u0007,"

    invoke-static {p2, p3, p1}, Lcom/google/android/recaptcha/internal/zzkj;->zzz(Lcom/google/android/recaptcha/internal/zzhy;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 1
    :cond_4
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1
.end method
