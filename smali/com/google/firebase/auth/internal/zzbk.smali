.class final Lcom/google/firebase/auth/internal/zzbk;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Lcom/google/android/gms/tasks/Continuation;


# instance fields
.field final synthetic zza:Ljava/lang/String;

.field final synthetic zzb:Lcom/google/firebase/auth/internal/zzbr;

.field final synthetic zzc:Lcom/google/android/recaptcha/RecaptchaAction;

.field final synthetic zzd:Lcom/google/android/gms/tasks/Continuation;


# direct methods
.method constructor <init>(Ljava/lang/String;Lcom/google/firebase/auth/internal/zzbr;Lcom/google/android/recaptcha/RecaptchaAction;Lcom/google/android/gms/tasks/Continuation;)V
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/auth/internal/zzbk;->zza:Ljava/lang/String;

    iput-object p2, p0, Lcom/google/firebase/auth/internal/zzbk;->zzb:Lcom/google/firebase/auth/internal/zzbr;

    iput-object p3, p0, Lcom/google/firebase/auth/internal/zzbk;->zzc:Lcom/google/android/recaptcha/RecaptchaAction;

    iput-object p4, p0, Lcom/google/firebase/auth/internal/zzbk;->zzd:Lcom/google/android/gms/tasks/Continuation;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final bridge synthetic then(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-nez v0, :cond_1

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Exception;

    .line 3
    sget v1, Lcom/google/android/gms/internal/firebase-auth-api/zzaag;->zzb:I

    .line 4
    instance-of v1, v0, Lcom/google/firebase/auth/FirebaseAuthException;

    if-eqz v1, :cond_1

    .line 5
    check-cast v0, Lcom/google/firebase/auth/FirebaseAuthException;

    .line 6
    invoke-virtual {v0}, Lcom/google/firebase/auth/FirebaseAuthException;->getErrorCode()Ljava/lang/String;

    move-result-object v0

    const-string v1, "INVALID_RECAPTCHA_TOKEN"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p1, 0x4

    const-string v0, "RecaptchaCallWrapper"

    .line 7
    invoke-static {v0, p1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/google/firebase/auth/internal/zzbk;->zza:Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "Invalid token - Refreshing Recaptcha Enterprise config and fetching new token for tenant "

    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 8
    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object p1, p0, Lcom/google/firebase/auth/internal/zzbk;->zzb:Lcom/google/firebase/auth/internal/zzbr;

    iget-object v0, p0, Lcom/google/firebase/auth/internal/zzbk;->zza:Ljava/lang/String;

    const/4 v1, 0x1

    .line 9
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iget-object v2, p0, Lcom/google/firebase/auth/internal/zzbk;->zzc:Lcom/google/android/recaptcha/RecaptchaAction;

    invoke-virtual {p1, v0, v1, v2}, Lcom/google/firebase/auth/internal/zzbr;->zza(Ljava/lang/String;Ljava/lang/Boolean;Lcom/google/android/recaptcha/RecaptchaAction;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    iget-object v0, p0, Lcom/google/firebase/auth/internal/zzbk;->zzd:Lcom/google/android/gms/tasks/Continuation;

    .line 10
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/Task;->continueWithTask(Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    :cond_1
    return-object p1
.end method
