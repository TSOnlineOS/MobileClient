.class final Lcom/google/android/gms/internal/firebase-auth-api/zzzj;
.super Lcom/google/android/gms/internal/firebase-auth-api/zzabg;
.source "com.google.firebase:firebase-auth@@22.0.0"


# instance fields
.field private final zza:Lcom/google/android/gms/internal/firebase-auth-api/zzwh;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    const/16 v0, 0x9

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;-><init>(I)V

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzwh;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwh;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzzj;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzwh;

    return-void
.end method


# virtual methods
.method public final zza()Ljava/lang/String;
    .locals 1

    const-string v0, "setFirebaseUIVersion"

    return-object v0
.end method

.method public final zzb()V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zzm(Ljava/lang/Object;)V

    return-void
.end method

.method public final zzc(Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzabf;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzabf;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzabg;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zzk:Lcom/google/android/gms/internal/firebase-auth-api/zzaaw;

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzzj;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzwh;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzzj;->zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzabd;

    invoke-virtual {p2, p1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzu(Lcom/google/android/gms/internal/firebase-auth-api/zzwh;Lcom/google/android/gms/internal/firebase-auth-api/zzaad;)V

    return-void
.end method
