.class public final Lcom/google/android/recaptcha/internal/zzlr;
.super Lcom/google/android/recaptcha/internal/zzgo;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"

# interfaces
.implements Lcom/google/android/recaptcha/internal/zzhz;


# static fields
.field private static final zzb:Lcom/google/android/recaptcha/internal/zzlr;


# instance fields
.field private zzd:Lcom/google/android/recaptcha/internal/zzlp;

.field private zze:Lcom/google/android/recaptcha/internal/zzlp;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/recaptcha/internal/zzlr;

    invoke-direct {v0}, Lcom/google/android/recaptcha/internal/zzlr;-><init>()V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzlr;->zzb:Lcom/google/android/recaptcha/internal/zzlr;

    const-class v1, Lcom/google/android/recaptcha/internal/zzlr;

    invoke-static {v1, v0}, Lcom/google/android/recaptcha/internal/zzgo;->zzC(Ljava/lang/Class;Lcom/google/android/recaptcha/internal/zzgo;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/recaptcha/internal/zzgo;-><init>()V

    return-void
.end method

.method static synthetic zzi()Lcom/google/android/recaptcha/internal/zzlr;
    .locals 1

    sget-object v0, Lcom/google/android/recaptcha/internal/zzlr;->zzb:Lcom/google/android/recaptcha/internal/zzlr;

    return-object v0
.end method

.method public static zzj(Ljava/io/InputStream;)Lcom/google/android/recaptcha/internal/zzlr;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/google/android/recaptcha/internal/zzlr;->zzb:Lcom/google/android/recaptcha/internal/zzlr;

    invoke-static {v0, p0}, Lcom/google/android/recaptcha/internal/zzgo;->zzt(Lcom/google/android/recaptcha/internal/zzgo;Ljava/io/InputStream;)Lcom/google/android/recaptcha/internal/zzgo;

    move-result-object p0

    check-cast p0, Lcom/google/android/recaptcha/internal/zzlr;

    return-object p0
.end method


# virtual methods
.method public final zzf()Lcom/google/android/recaptcha/internal/zzlp;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzlr;->zzd:Lcom/google/android/recaptcha/internal/zzlp;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/google/android/recaptcha/internal/zzlp;->zzg()Lcom/google/android/recaptcha/internal/zzlp;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public final zzg()Lcom/google/android/recaptcha/internal/zzlp;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzlr;->zze:Lcom/google/android/recaptcha/internal/zzlp;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/google/android/recaptcha/internal/zzlp;->zzg()Lcom/google/android/recaptcha/internal/zzlp;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method protected final zzh(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

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
    sget-object p1, Lcom/google/android/recaptcha/internal/zzlr;->zzb:Lcom/google/android/recaptcha/internal/zzlr;

    return-object p1

    :cond_1
    new-instance p1, Lcom/google/android/recaptcha/internal/zzlq;

    .line 3
    invoke-direct {p1, p3}, Lcom/google/android/recaptcha/internal/zzlq;-><init>(Lcom/google/android/recaptcha/internal/zzln;)V

    return-object p1

    :cond_2
    new-instance p1, Lcom/google/android/recaptcha/internal/zzlr;

    invoke-direct {p1}, Lcom/google/android/recaptcha/internal/zzlr;-><init>()V

    return-object p1

    :cond_3
    new-array p1, p3, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "zzd"

    aput-object v0, p1, p3

    const-string p3, "zze"

    aput-object p3, p1, p2

    .line 2
    sget-object p2, Lcom/google/android/recaptcha/internal/zzlr;->zzb:Lcom/google/android/recaptcha/internal/zzlr;

    const-string p3, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001\t\u0002\t"

    invoke-static {p2, p3, p1}, Lcom/google/android/recaptcha/internal/zzlr;->zzz(Lcom/google/android/recaptcha/internal/zzhy;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 1
    :cond_4
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1
.end method
