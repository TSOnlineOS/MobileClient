.class public final Lcom/google/android/recaptcha/internal/zzma;
.super Lcom/google/android/recaptcha/internal/zzgi;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"

# interfaces
.implements Lcom/google/android/recaptcha/internal/zzhz;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzmb;->zzg()Lcom/google/android/recaptcha/internal/zzmb;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/recaptcha/internal/zzgi;-><init>(Lcom/google/android/recaptcha/internal/zzgo;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/recaptcha/internal/zzlv;)V
    .locals 0

    .line 2
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzmb;->zzg()Lcom/google/android/recaptcha/internal/zzmb;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/google/android/recaptcha/internal/zzgi;-><init>(Lcom/google/android/recaptcha/internal/zzgo;)V

    return-void
.end method


# virtual methods
.method public final zzd(Ljava/lang/String;)Lcom/google/android/recaptcha/internal/zzma;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/recaptcha/internal/zzgi;->zzm()V

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzma;->zza:Lcom/google/android/recaptcha/internal/zzgo;

    .line 2
    check-cast v0, Lcom/google/android/recaptcha/internal/zzmb;

    invoke-static {v0, p1}, Lcom/google/android/recaptcha/internal/zzmb;->zzj(Lcom/google/android/recaptcha/internal/zzmb;Ljava/lang/String;)V

    return-object p0
.end method

.method public final zze(Ljava/lang/String;)Lcom/google/android/recaptcha/internal/zzma;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/recaptcha/internal/zzgi;->zzm()V

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzma;->zza:Lcom/google/android/recaptcha/internal/zzgo;

    .line 2
    check-cast v0, Lcom/google/android/recaptcha/internal/zzmb;

    invoke-static {v0, p1}, Lcom/google/android/recaptcha/internal/zzmb;->zzi(Lcom/google/android/recaptcha/internal/zzmb;Ljava/lang/String;)V

    return-object p0
.end method
