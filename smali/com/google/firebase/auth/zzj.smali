.class final Lcom/google/firebase/auth/zzj;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Lcom/google/android/gms/tasks/OnCompleteListener;


# instance fields
.field final synthetic zza:Lcom/google/firebase/auth/PhoneAuthOptions;

.field final synthetic zzb:Ljava/lang/String;

.field final synthetic zzc:Lcom/google/firebase/auth/FirebaseAuth;


# direct methods
.method constructor <init>(Lcom/google/firebase/auth/FirebaseAuth;Lcom/google/firebase/auth/PhoneAuthOptions;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/auth/zzj;->zzc:Lcom/google/firebase/auth/FirebaseAuth;

    iput-object p2, p0, Lcom/google/firebase/auth/zzj;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    iput-object p3, p0, Lcom/google/firebase/auth/zzj;->zzb:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onComplete(Lcom/google/android/gms/tasks/Task;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_2

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object v0

    instance-of v2, v0, Lcom/google/firebase/auth/FirebaseAuthMissingActivityForRecaptchaException;

    if-eqz v2, :cond_0

    .line 3
    check-cast v0, Lcom/google/firebase/auth/FirebaseAuthMissingActivityForRecaptchaException;

    iget-object p1, p0, Lcom/google/firebase/auth/zzj;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    iget-object v1, p0, Lcom/google/firebase/auth/zzj;->zzb:Ljava/lang/String;

    invoke-static {v0, p1, v1}, Lcom/google/firebase/auth/FirebaseAuth;->zzW(Lcom/google/firebase/auth/FirebaseAuthMissingActivityForRecaptchaException;Lcom/google/firebase/auth/PhoneAuthOptions;Ljava/lang/String;)V

    return-void

    .line 4
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_1
    const-string p1, ""

    :goto_0
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "Error while validating application identity: "

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "FirebaseAuth"

    .line 5
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const-string p1, "Proceeding without any application identifier."

    .line 6
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object p1, v1

    goto :goto_1

    .line 7
    :cond_2
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/auth/internal/zze;

    invoke-virtual {v0}, Lcom/google/firebase/auth/internal/zze;->zzb()Ljava/lang/String;

    move-result-object v1

    .line 8
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/auth/internal/zze;

    invoke-virtual {p1}, Lcom/google/firebase/auth/internal/zze;->zza()Ljava/lang/String;

    move-result-object p1

    .line 6
    :goto_1
    iget-object v0, p0, Lcom/google/firebase/auth/zzj;->zzc:Lcom/google/firebase/auth/FirebaseAuth;

    iget-object v2, p0, Lcom/google/firebase/auth/zzj;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    .line 9
    invoke-virtual {v0, v2, v1, p1}, Lcom/google/firebase/auth/FirebaseAuth;->zzU(Lcom/google/firebase/auth/PhoneAuthOptions;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
