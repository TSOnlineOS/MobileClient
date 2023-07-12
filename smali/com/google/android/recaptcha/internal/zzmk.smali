.class public final Lcom/google/android/recaptcha/internal/zzmk;
.super Lcom/google/android/recaptcha/internal/zzgi;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"

# interfaces
.implements Lcom/google/android/recaptcha/internal/zzhz;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzmn;->zzg()Lcom/google/android/recaptcha/internal/zzmn;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/recaptcha/internal/zzgi;-><init>(Lcom/google/android/recaptcha/internal/zzgo;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/recaptcha/internal/zzlv;)V
    .locals 0

    .line 2
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzmn;->zzg()Lcom/google/android/recaptcha/internal/zzmn;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/google/android/recaptcha/internal/zzgi;-><init>(Lcom/google/android/recaptcha/internal/zzgo;)V

    return-void
.end method


# virtual methods
.method public final zzd(Ljava/lang/Iterable;)Lcom/google/android/recaptcha/internal/zzmk;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/recaptcha/internal/zzgi;->zzm()V

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzmk;->zza:Lcom/google/android/recaptcha/internal/zzgo;

    .line 2
    check-cast v0, Lcom/google/android/recaptcha/internal/zzmn;

    invoke-static {v0, p1}, Lcom/google/android/recaptcha/internal/zzmn;->zzj(Lcom/google/android/recaptcha/internal/zzmn;Ljava/lang/Iterable;)V

    return-object p0
.end method

.method public final zze(Lcom/google/android/recaptcha/internal/zzmm;)Lcom/google/android/recaptcha/internal/zzmk;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/recaptcha/internal/zzgi;->zzm()V

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzmk;->zza:Lcom/google/android/recaptcha/internal/zzgo;

    .line 2
    check-cast v0, Lcom/google/android/recaptcha/internal/zzmn;

    invoke-static {v0, p1}, Lcom/google/android/recaptcha/internal/zzmn;->zzi(Lcom/google/android/recaptcha/internal/zzmn;Lcom/google/android/recaptcha/internal/zzmm;)V

    return-object p0
.end method
