.class final Lcom/google/android/gms/internal/firebase-auth-api/zzyd;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Lcom/google/android/gms/internal/firebase-auth-api/zzabl;


# instance fields
.field final synthetic zza:Ljava/lang/String;

.field final synthetic zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

.field final synthetic zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzyh;Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzyd;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    iput-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzyd;->zza:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzyd;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/google/firebase/auth/internal/zzai;->zza(Ljava/lang/String;)Lcom/google/android/gms/common/api/Status;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzyd;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    .line 2
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;->zzh(Lcom/google/android/gms/common/api/Status;)V

    return-void
.end method

.method public final bridge synthetic zzb(Ljava/lang/Object;)V
    .locals 3

    .line 1
    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzade;

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzadq;

    .line 2
    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzadq;-><init>()V

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzade;->zze()Ljava/lang/String;

    move-result-object v1

    .line 4
    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzadq;->zze(Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzadq;

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzyd;->zza:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzadq;->zzd(Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzadq;

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzyd;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    iget-object v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzyd;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    .line 5
    invoke-static {v1, v2, p1, v0, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zze(Lcom/google/android/gms/internal/firebase-auth-api/zzyh;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;Lcom/google/android/gms/internal/firebase-auth-api/zzade;Lcom/google/android/gms/internal/firebase-auth-api/zzadq;Lcom/google/android/gms/internal/firebase-auth-api/zzabk;)V

    return-void
.end method
