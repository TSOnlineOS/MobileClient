.class final Lcom/google/firebase/auth/zzy;
.super Lcom/google/firebase/auth/internal/zzbl;
.source "com.google.firebase:firebase-auth@@22.0.0"


# instance fields
.field final synthetic zza:Ljava/lang/String;

.field final synthetic zzb:Z

.field final synthetic zzc:Lcom/google/firebase/auth/FirebaseUser;

.field final synthetic zzd:Ljava/lang/String;

.field final synthetic zze:Ljava/lang/String;

.field final synthetic zzf:Lcom/google/firebase/auth/FirebaseAuth;


# direct methods
.method constructor <init>(Lcom/google/firebase/auth/FirebaseAuth;Ljava/lang/String;ZLcom/google/firebase/auth/FirebaseUser;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/auth/zzy;->zzf:Lcom/google/firebase/auth/FirebaseAuth;

    iput-object p2, p0, Lcom/google/firebase/auth/zzy;->zza:Ljava/lang/String;

    iput-boolean p3, p0, Lcom/google/firebase/auth/zzy;->zzb:Z

    iput-object p4, p0, Lcom/google/firebase/auth/zzy;->zzc:Lcom/google/firebase/auth/FirebaseUser;

    iput-object p5, p0, Lcom/google/firebase/auth/zzy;->zzd:Ljava/lang/String;

    iput-object p6, p0, Lcom/google/firebase/auth/zzy;->zze:Ljava/lang/String;

    invoke-direct {p0}, Lcom/google/firebase/auth/internal/zzbl;-><init>()V

    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;
    .locals 9

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const-string v1, "FirebaseAuth"

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/firebase/auth/zzy;->zza:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    .line 2
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Logging in as "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " with empty reCAPTCHA token"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/google/firebase/auth/zzy;->zza:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "Got reCAPTCHA token for login with email "

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 3
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2
    :goto_0
    iget-boolean v0, p0, Lcom/google/firebase/auth/zzy;->zzb:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/firebase/auth/zzy;->zzf:Lcom/google/firebase/auth/FirebaseAuth;

    invoke-static {v0}, Lcom/google/firebase/auth/FirebaseAuth;->zzy(Lcom/google/firebase/auth/FirebaseAuth;)Lcom/google/android/gms/internal/firebase-auth-api/zzaac;

    move-result-object v1

    invoke-static {v0}, Lcom/google/firebase/auth/FirebaseAuth;->zzu(Lcom/google/firebase/auth/FirebaseAuth;)Lcom/google/firebase/FirebaseApp;

    move-result-object v2

    iget-object v0, p0, Lcom/google/firebase/auth/zzy;->zzc:Lcom/google/firebase/auth/FirebaseUser;

    .line 4
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lcom/google/firebase/auth/FirebaseUser;

    iget-object v4, p0, Lcom/google/firebase/auth/zzy;->zza:Ljava/lang/String;

    iget-object v5, p0, Lcom/google/firebase/auth/zzy;->zzd:Ljava/lang/String;

    iget-object v6, p0, Lcom/google/firebase/auth/zzy;->zze:Ljava/lang/String;

    new-instance v8, Lcom/google/firebase/auth/zzac;

    iget-object v0, p0, Lcom/google/firebase/auth/zzy;->zzf:Lcom/google/firebase/auth/FirebaseAuth;

    invoke-direct {v8, v0}, Lcom/google/firebase/auth/zzac;-><init>(Lcom/google/firebase/auth/FirebaseAuth;)V

    move-object v7, p1

    .line 5
    invoke-virtual/range {v1 .. v8}, Lcom/google/android/gms/internal/firebase-auth-api/zzaac;->zzs(Lcom/google/firebase/FirebaseApp;Lcom/google/firebase/auth/FirebaseUser;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/firebase/auth/internal/zzbw;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1

    :cond_1
    iget-object v0, p0, Lcom/google/firebase/auth/zzy;->zzf:Lcom/google/firebase/auth/FirebaseAuth;

    invoke-static {v0}, Lcom/google/firebase/auth/FirebaseAuth;->zzy(Lcom/google/firebase/auth/FirebaseAuth;)Lcom/google/android/gms/internal/firebase-auth-api/zzaac;

    move-result-object v1

    invoke-static {v0}, Lcom/google/firebase/auth/FirebaseAuth;->zzu(Lcom/google/firebase/auth/FirebaseAuth;)Lcom/google/firebase/FirebaseApp;

    move-result-object v2

    iget-object v3, p0, Lcom/google/firebase/auth/zzy;->zza:Ljava/lang/String;

    iget-object v4, p0, Lcom/google/firebase/auth/zzy;->zzd:Ljava/lang/String;

    iget-object v5, p0, Lcom/google/firebase/auth/zzy;->zze:Ljava/lang/String;

    new-instance v7, Lcom/google/firebase/auth/zzab;

    invoke-direct {v7, v0}, Lcom/google/firebase/auth/zzab;-><init>(Lcom/google/firebase/auth/FirebaseAuth;)V

    move-object v6, p1

    .line 6
    invoke-virtual/range {v1 .. v7}, Lcom/google/android/gms/internal/firebase-auth-api/zzaac;->zzD(Lcom/google/firebase/FirebaseApp;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/firebase/auth/internal/zzg;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method
