.class final Lcom/google/android/gms/internal/firebase-auth-api/zzzq;
.super Lcom/google/android/gms/internal/firebase-auth-api/zzabg;
.source "com.google.firebase:firebase-auth@@22.0.0"


# instance fields
.field private final zzB:Z

.field private final zzC:Z

.field private final zzD:Ljava/lang/String;

.field private final zzE:Ljava/lang/String;

.field private final zzF:Z

.field private final zza:Ljava/lang/String;

.field private final zzb:Ljava/lang/String;

.field private final zzc:Ljava/lang/String;

.field private final zzd:J


# direct methods
.method public constructor <init>(Lcom/google/firebase/auth/internal/zzag;Ljava/lang/String;Ljava/lang/String;JZZLjava/lang/String;Ljava/lang/String;Z)V
    .locals 1

    const/16 v0, 0x8

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;-><init>(I)V

    .line 2
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    invoke-virtual {p1}, Lcom/google/firebase/auth/internal/zzag;->zzc()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzzq;->zza:Ljava/lang/String;

    iput-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzzq;->zzb:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzzq;->zzc:Ljava/lang/String;

    iput-wide p4, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzzq;->zzd:J

    iput-boolean p6, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzzq;->zzB:Z

    iput-boolean p7, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzzq;->zzC:Z

    iput-object p8, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzzq;->zzD:Ljava/lang/String;

    iput-object p9, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzzq;->zzE:Ljava/lang/String;

    iput-boolean p10, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzzq;->zzF:Z

    return-void
.end method


# virtual methods
.method public final zza()Ljava/lang/String;
    .locals 1

    const-string v0, "startMfaEnrollmentWithPhoneNumber"

    return-object v0
.end method

.method public final zzb()V
    .locals 0

    return-void
.end method

.method public final zzc(Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;)V
    .locals 13

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzabf;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzabf;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzabg;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zzk:Lcom/google/android/gms/internal/firebase-auth-api/zzaaw;

    iget-object v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzzq;->zza:Ljava/lang/String;

    iget-object v3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzzq;->zzb:Ljava/lang/String;

    iget-object v4, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzzq;->zzc:Ljava/lang/String;

    iget-wide v5, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzzq;->zzd:J

    iget-boolean v7, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzzq;->zzB:Z

    iget-boolean v8, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzzq;->zzC:Z

    iget-object v9, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzzq;->zzD:Ljava/lang/String;

    iget-object v10, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzzq;->zzE:Ljava/lang/String;

    iget-boolean v11, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzzq;->zzF:Z

    iget-object v12, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzzq;->zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzabd;

    move-object v1, p2

    invoke-virtual/range {v1 .. v12}, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzB(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JZZLjava/lang/String;Ljava/lang/String;ZLcom/google/android/gms/internal/firebase-auth-api/zzaad;)V

    return-void
.end method
