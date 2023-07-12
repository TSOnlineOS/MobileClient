.class final Lcom/google/android/gms/internal/firebase-auth-api/zzyt;
.super Lcom/google/android/gms/internal/firebase-auth-api/zzabg;
.source "com.google.firebase:firebase-auth@@22.0.0"


# instance fields
.field private final zza:Lcom/google/android/gms/internal/firebase-auth-api/zzwc;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/16 p2, 0xa

    .line 1
    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;-><init>(I)V

    const-string p2, "RECAPTCHA_ENTERPRISE"

    .line 2
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzwc;

    invoke-direct {v0, p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzwc;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzyt;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzwc;

    return-void
.end method


# virtual methods
.method public final zza()Ljava/lang/String;
    .locals 1

    const-string v0, "getRecaptchaConfig"

    return-object v0
.end method

.method public final zzb()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzyt;->zzx:Lcom/google/android/gms/internal/firebase-auth-api/zzadd;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zzm(Ljava/lang/Object;)V

    return-void
.end method

.method public final zzc(Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzabf;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzabf;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzabg;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zzk:Lcom/google/android/gms/internal/firebase-auth-api/zzaaw;

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzyt;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzwc;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzyt;->zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzabd;

    invoke-virtual {p2, p1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzm(Lcom/google/android/gms/internal/firebase-auth-api/zzwc;Lcom/google/android/gms/internal/firebase-auth-api/zzaad;)V

    return-void
.end method
