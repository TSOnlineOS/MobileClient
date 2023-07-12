.class public final Lcom/google/android/recaptcha/internal/zzkf;
.super Lcom/google/android/recaptcha/internal/zzgi;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"

# interfaces
.implements Lcom/google/android/recaptcha/internal/zzhz;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzkg;->zzg()Lcom/google/android/recaptcha/internal/zzkg;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/recaptcha/internal/zzgi;-><init>(Lcom/google/android/recaptcha/internal/zzgo;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/recaptcha/internal/zzke;)V
    .locals 0

    .line 2
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzkg;->zzg()Lcom/google/android/recaptcha/internal/zzkg;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/google/android/recaptcha/internal/zzgi;-><init>(Lcom/google/android/recaptcha/internal/zzgo;)V

    return-void
.end method


# virtual methods
.method public final zzd(Lcom/google/android/recaptcha/internal/zzfw;)Lcom/google/android/recaptcha/internal/zzkf;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/recaptcha/internal/zzgi;->zzm()V

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzkf;->zza:Lcom/google/android/recaptcha/internal/zzgo;

    .line 2
    check-cast v0, Lcom/google/android/recaptcha/internal/zzkg;

    invoke-static {v0, p1}, Lcom/google/android/recaptcha/internal/zzkg;->zzi(Lcom/google/android/recaptcha/internal/zzkg;Lcom/google/android/recaptcha/internal/zzfw;)V

    return-object p0
.end method

.method public final zze(I)Lcom/google/android/recaptcha/internal/zzkf;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/recaptcha/internal/zzgi;->zzm()V

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzkf;->zza:Lcom/google/android/recaptcha/internal/zzgo;

    .line 2
    check-cast v0, Lcom/google/android/recaptcha/internal/zzkg;

    invoke-static {v0, p1}, Lcom/google/android/recaptcha/internal/zzkg;->zzj(Lcom/google/android/recaptcha/internal/zzkg;I)V

    return-object p0
.end method
