.class public final Lcom/google/android/recaptcha/internal/zzar;
.super Ljava/lang/Object;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"


# static fields
.field public static final zza:Lcom/google/android/recaptcha/internal/zzar;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/recaptcha/internal/zzar;

    invoke-direct {v0}, Lcom/google/android/recaptcha/internal/zzar;-><init>()V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzar;->zza:Lcom/google/android/recaptcha/internal/zzar;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final zza(Lcom/google/android/recaptcha/internal/zzn;Lcom/google/android/recaptcha/internal/zzn;)Lcom/google/android/recaptcha/internal/zzlg;
    .locals 3

    .line 1
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzlg;->zzf()Lcom/google/android/recaptcha/internal/zzlf;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/android/recaptcha/internal/zzn;->zzb()J

    move-result-wide v1

    .line 2
    invoke-static {v1, v2}, Lcom/google/android/recaptcha/internal/zzka;->zzb(J)Lcom/google/android/recaptcha/internal/zzjd;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/recaptcha/internal/zzlf;->zzp(Lcom/google/android/recaptcha/internal/zzjd;)Lcom/google/android/recaptcha/internal/zzlf;

    sget-object v1, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    .line 3
    invoke-virtual {p0, v1}, Lcom/google/android/recaptcha/internal/zzn;->zza(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v1

    invoke-static {v1, v2}, Lcom/google/android/recaptcha/internal/zzjy;->zzb(J)Lcom/google/android/recaptcha/internal/zzfw;

    move-result-object p0

    .line 4
    invoke-virtual {v0, p0}, Lcom/google/android/recaptcha/internal/zzlf;->zzq(Lcom/google/android/recaptcha/internal/zzfw;)Lcom/google/android/recaptcha/internal/zzlf;

    .line 5
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzn;->zzb()J

    move-result-wide v1

    invoke-static {v1, v2}, Lcom/google/android/recaptcha/internal/zzka;->zzb(J)Lcom/google/android/recaptcha/internal/zzjd;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/google/android/recaptcha/internal/zzlf;->zzd(Lcom/google/android/recaptcha/internal/zzjd;)Lcom/google/android/recaptcha/internal/zzlf;

    sget-object p0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    .line 6
    invoke-virtual {p1, p0}, Lcom/google/android/recaptcha/internal/zzn;->zza(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide p0

    invoke-static {p0, p1}, Lcom/google/android/recaptcha/internal/zzjy;->zzb(J)Lcom/google/android/recaptcha/internal/zzfw;

    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Lcom/google/android/recaptcha/internal/zzlf;->zze(Lcom/google/android/recaptcha/internal/zzfw;)Lcom/google/android/recaptcha/internal/zzlf;

    .line 8
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzgi;->zzh()Lcom/google/android/recaptcha/internal/zzgo;

    move-result-object p0

    check-cast p0, Lcom/google/android/recaptcha/internal/zzlg;

    return-object p0
.end method
