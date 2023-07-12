.class final Lcom/google/android/gms/internal/firebase-auth-api/zzabc;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic zza:Lcom/google/android/gms/internal/firebase-auth-api/zzabe;

.field final synthetic zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzabd;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzabd;Lcom/google/android/gms/internal/firebase-auth-api/zzabe;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabc;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzabd;

    iput-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabc;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzabe;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabc;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzabd;

    iget-object v0, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzabd;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzabg;

    iget-object v0, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zzl:Ljava/util/List;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabc;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzabd;

    iget-object v1, v1, Lcom/google/android/gms/internal/firebase-auth-api/zzabd;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzabg;

    iget-object v1, v1, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zzl:Ljava/util/List;

    .line 2
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabc;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzabe;

    iget-object v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabc;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzabd;

    iget-object v2, v2, Lcom/google/android/gms/internal/firebase-auth-api/zzabd;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzabg;

    iget-object v2, v2, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zzl:Ljava/util/List;

    const/4 v3, 0x0

    .line 3
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/firebase/auth/PhoneAuthProvider$OnVerificationStateChangedCallbacks;

    new-array v3, v3, [Ljava/lang/Object;

    invoke-interface {v1, v2, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzabe;->zza(Lcom/google/firebase/auth/PhoneAuthProvider$OnVerificationStateChangedCallbacks;[Ljava/lang/Object;)V

    .line 4
    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
