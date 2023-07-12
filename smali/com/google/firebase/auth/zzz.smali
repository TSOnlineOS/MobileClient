.class final Lcom/google/firebase/auth/zzz;
.super Lcom/google/firebase/auth/internal/zzbl;
.source "com.google.firebase:firebase-auth@@22.0.0"


# instance fields
.field final synthetic zza:Z

.field final synthetic zzb:Lcom/google/firebase/auth/FirebaseUser;

.field final synthetic zzc:Lcom/google/firebase/auth/EmailAuthCredential;

.field final synthetic zzd:Lcom/google/firebase/auth/FirebaseAuth;


# direct methods
.method constructor <init>(Lcom/google/firebase/auth/FirebaseAuth;ZLcom/google/firebase/auth/FirebaseUser;Lcom/google/firebase/auth/EmailAuthCredential;)V
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/auth/zzz;->zzd:Lcom/google/firebase/auth/FirebaseAuth;

    iput-boolean p2, p0, Lcom/google/firebase/auth/zzz;->zza:Z

    iput-object p3, p0, Lcom/google/firebase/auth/zzz;->zzb:Lcom/google/firebase/auth/FirebaseUser;

    iput-object p4, p0, Lcom/google/firebase/auth/zzz;->zzc:Lcom/google/firebase/auth/EmailAuthCredential;

    invoke-direct {p0}, Lcom/google/firebase/auth/internal/zzbl;-><init>()V

    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;
    .locals 7

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const-string v1, "FirebaseAuth"

    if-eqz v0, :cond_0

    const-string v0, "Email link login/reauth with empty reCAPTCHA token"

    .line 2
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_0
    const-string v0, "Got reCAPTCHA token for login/reauth with email link"

    .line 3
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2
    :goto_0
    iget-boolean v0, p0, Lcom/google/firebase/auth/zzz;->zza:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/firebase/auth/zzz;->zzd:Lcom/google/firebase/auth/FirebaseAuth;

    invoke-static {v0}, Lcom/google/firebase/auth/FirebaseAuth;->zzy(Lcom/google/firebase/auth/FirebaseAuth;)Lcom/google/android/gms/internal/firebase-auth-api/zzaac;

    move-result-object v1

    invoke-static {v0}, Lcom/google/firebase/auth/FirebaseAuth;->zzu(Lcom/google/firebase/auth/FirebaseAuth;)Lcom/google/firebase/FirebaseApp;

    move-result-object v2

    iget-object v0, p0, Lcom/google/firebase/auth/zzz;->zzb:Lcom/google/firebase/auth/FirebaseUser;

    .line 4
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lcom/google/firebase/auth/FirebaseUser;

    iget-object v4, p0, Lcom/google/firebase/auth/zzz;->zzc:Lcom/google/firebase/auth/EmailAuthCredential;

    new-instance v6, Lcom/google/firebase/auth/zzac;

    iget-object v0, p0, Lcom/google/firebase/auth/zzz;->zzd:Lcom/google/firebase/auth/FirebaseAuth;

    invoke-direct {v6, v0}, Lcom/google/firebase/auth/zzac;-><init>(Lcom/google/firebase/auth/FirebaseAuth;)V

    move-object v5, p1

    .line 5
    invoke-virtual/range {v1 .. v6}, Lcom/google/android/gms/internal/firebase-auth-api/zzaac;->zzq(Lcom/google/firebase/FirebaseApp;Lcom/google/firebase/auth/FirebaseUser;Lcom/google/firebase/auth/EmailAuthCredential;Ljava/lang/String;Lcom/google/firebase/auth/internal/zzbw;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1

    :cond_1
    iget-object v0, p0, Lcom/google/firebase/auth/zzz;->zzd:Lcom/google/firebase/auth/FirebaseAuth;

    invoke-static {v0}, Lcom/google/firebase/auth/FirebaseAuth;->zzy(Lcom/google/firebase/auth/FirebaseAuth;)Lcom/google/android/gms/internal/firebase-auth-api/zzaac;

    move-result-object v1

    invoke-static {v0}, Lcom/google/firebase/auth/FirebaseAuth;->zzu(Lcom/google/firebase/auth/FirebaseAuth;)Lcom/google/firebase/FirebaseApp;

    move-result-object v2

    iget-object v3, p0, Lcom/google/firebase/auth/zzz;->zzc:Lcom/google/firebase/auth/EmailAuthCredential;

    new-instance v4, Lcom/google/firebase/auth/zzab;

    invoke-direct {v4, v0}, Lcom/google/firebase/auth/zzab;-><init>(Lcom/google/firebase/auth/FirebaseAuth;)V

    .line 6
    invoke-virtual {v1, v2, v3, p1, v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzaac;->zzE(Lcom/google/firebase/FirebaseApp;Lcom/google/firebase/auth/EmailAuthCredential;Ljava/lang/String;Lcom/google/firebase/auth/internal/zzg;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method
