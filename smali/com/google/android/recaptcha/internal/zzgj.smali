.class public Lcom/google/android/recaptcha/internal/zzgj;
.super Lcom/google/android/recaptcha/internal/zzgi;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"

# interfaces
.implements Lcom/google/android/recaptcha/internal/zzhz;


# direct methods
.method protected constructor <init>(Lcom/google/android/recaptcha/internal/zzgk;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/google/android/recaptcha/internal/zzgi;-><init>(Lcom/google/android/recaptcha/internal/zzgo;)V

    return-void
.end method


# virtual methods
.method public final zzd()Lcom/google/android/recaptcha/internal/zzgk;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzgj;->zza:Lcom/google/android/recaptcha/internal/zzgo;

    check-cast v0, Lcom/google/android/recaptcha/internal/zzgk;

    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzgo;->zzF()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzgj;->zza:Lcom/google/android/recaptcha/internal/zzgo;

    .line 2
    check-cast v0, Lcom/google/android/recaptcha/internal/zzgk;

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzgj;->zza:Lcom/google/android/recaptcha/internal/zzgo;

    .line 3
    check-cast v0, Lcom/google/android/recaptcha/internal/zzgk;

    iget-object v0, v0, Lcom/google/android/recaptcha/internal/zzgk;->zzb:Lcom/google/android/recaptcha/internal/zzge;

    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzge;->zzg()V

    .line 4
    invoke-super {p0}, Lcom/google/android/recaptcha/internal/zzgi;->zzi()Lcom/google/android/recaptcha/internal/zzgo;

    move-result-object v0

    check-cast v0, Lcom/google/android/recaptcha/internal/zzgk;

    return-object v0
.end method

.method public final bridge synthetic zzi()Lcom/google/android/recaptcha/internal/zzgo;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/recaptcha/internal/zzgj;->zzd()Lcom/google/android/recaptcha/internal/zzgk;

    move-result-object v0

    return-object v0
.end method

.method public final bridge synthetic zzk()Lcom/google/android/recaptcha/internal/zzhy;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/recaptcha/internal/zzgj;->zzd()Lcom/google/android/recaptcha/internal/zzgk;

    move-result-object v0

    return-object v0
.end method

.method protected final zzn()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/google/android/recaptcha/internal/zzgi;->zzn()V

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzgj;->zza:Lcom/google/android/recaptcha/internal/zzgo;

    .line 2
    check-cast v0, Lcom/google/android/recaptcha/internal/zzgk;

    iget-object v0, v0, Lcom/google/android/recaptcha/internal/zzgk;->zzb:Lcom/google/android/recaptcha/internal/zzge;

    invoke-static {}, Lcom/google/android/recaptcha/internal/zzge;->zzd()Lcom/google/android/recaptcha/internal/zzge;

    move-result-object v1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzgj;->zza:Lcom/google/android/recaptcha/internal/zzgo;

    .line 3
    check-cast v0, Lcom/google/android/recaptcha/internal/zzgk;

    iget-object v1, v0, Lcom/google/android/recaptcha/internal/zzgk;->zzb:Lcom/google/android/recaptcha/internal/zzge;

    invoke-virtual {v1}, Lcom/google/android/recaptcha/internal/zzge;->zzc()Lcom/google/android/recaptcha/internal/zzge;

    move-result-object v1

    iput-object v1, v0, Lcom/google/android/recaptcha/internal/zzgk;->zzb:Lcom/google/android/recaptcha/internal/zzge;

    :cond_0
    return-void
.end method
