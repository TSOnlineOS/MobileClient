.class public final Lcom/google/android/recaptcha/internal/zzmd;
.super Lcom/google/android/recaptcha/internal/zzgo;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"

# interfaces
.implements Lcom/google/android/recaptcha/internal/zzhz;


# static fields
.field private static final zzb:Lcom/google/android/recaptcha/internal/zzmd;


# instance fields
.field private zzd:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/recaptcha/internal/zzmd;

    invoke-direct {v0}, Lcom/google/android/recaptcha/internal/zzmd;-><init>()V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzmd;->zzb:Lcom/google/android/recaptcha/internal/zzmd;

    const-class v1, Lcom/google/android/recaptcha/internal/zzmd;

    invoke-static {v1, v0}, Lcom/google/android/recaptcha/internal/zzgo;->zzC(Ljava/lang/Class;Lcom/google/android/recaptcha/internal/zzgo;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/recaptcha/internal/zzgo;-><init>()V

    return-void
.end method

.method static synthetic zzf()Lcom/google/android/recaptcha/internal/zzmd;
    .locals 1

    sget-object v0, Lcom/google/android/recaptcha/internal/zzmd;->zzb:Lcom/google/android/recaptcha/internal/zzmd;

    return-object v0
.end method

.method public static zzg([B)Lcom/google/android/recaptcha/internal/zzmd;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/recaptcha/internal/zzgy;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/google/android/recaptcha/internal/zzmd;->zzb:Lcom/google/android/recaptcha/internal/zzmd;

    invoke-static {v0, p0}, Lcom/google/android/recaptcha/internal/zzgo;->zzu(Lcom/google/android/recaptcha/internal/zzgo;[B)Lcom/google/android/recaptcha/internal/zzgo;

    move-result-object p0

    check-cast p0, Lcom/google/android/recaptcha/internal/zzmd;

    return-object p0
.end method


# virtual methods
.method protected final zzh(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    add-int/lit8 p1, p1, -0x1

    const/4 p2, 0x1

    if-eqz p1, :cond_4

    const/4 p3, 0x2

    if-eq p1, p3, :cond_3

    const/4 p2, 0x3

    if-eq p1, p2, :cond_2

    const/4 p2, 0x4

    const/4 p3, 0x0

    if-eq p1, p2, :cond_1

    const/4 p2, 0x5

    if-eq p1, p2, :cond_0

    return-object p3

    .line 1
    :cond_0
    sget-object p1, Lcom/google/android/recaptcha/internal/zzmd;->zzb:Lcom/google/android/recaptcha/internal/zzmd;

    return-object p1

    :cond_1
    new-instance p1, Lcom/google/android/recaptcha/internal/zzmc;

    .line 3
    invoke-direct {p1, p3}, Lcom/google/android/recaptcha/internal/zzmc;-><init>(Lcom/google/android/recaptcha/internal/zzlv;)V

    return-object p1

    :cond_2
    new-instance p1, Lcom/google/android/recaptcha/internal/zzmd;

    invoke-direct {p1}, Lcom/google/android/recaptcha/internal/zzmd;-><init>()V

    return-object p1

    :cond_3
    new-array p1, p2, [Ljava/lang/Object;

    const/4 p2, 0x0

    const-string p3, "zzd"

    aput-object p3, p1, p2

    .line 2
    sget-object p2, Lcom/google/android/recaptcha/internal/zzmd;->zzb:Lcom/google/android/recaptcha/internal/zzmd;

    const-string p3, "\u0000\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0000\u0000\u0001\u000c"

    invoke-static {p2, p3, p1}, Lcom/google/android/recaptcha/internal/zzmd;->zzz(Lcom/google/android/recaptcha/internal/zzhy;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 1
    :cond_4
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1
.end method

.method public final zzi()Lcom/google/android/recaptcha/internal/zzmf;
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/recaptcha/internal/zzmd;->zzd:I

    invoke-static {v0}, Lcom/google/android/recaptcha/internal/zzmf;->zzb(I)Lcom/google/android/recaptcha/internal/zzmf;

    move-result-object v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/google/android/recaptcha/internal/zzmf;->zzk:Lcom/google/android/recaptcha/internal/zzmf;

    :cond_0
    return-object v0
.end method
