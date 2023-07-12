.class final Lcom/google/android/gms/internal/firebase-auth-api/zzxx;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Lcom/google/android/gms/internal/firebase-auth-api/zzabl;


# instance fields
.field final synthetic zza:Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

.field final synthetic zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzyh;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzxx;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    iput-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzxx;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/google/firebase/auth/internal/zzai;->zza(Ljava/lang/String;)Lcom/google/android/gms/common/api/Status;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzxx;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    .line 2
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;->zzh(Lcom/google/android/gms/common/api/Status;)V

    return-void
.end method

.method public final bridge synthetic zzb(Ljava/lang/Object;)V
    .locals 2

    .line 1
    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzade;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzade;->zze()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzack;

    .line 3
    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzack;-><init>(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzxx;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzyh;)Lcom/google/android/gms/internal/firebase-auth-api/zzabm;

    move-result-object p1

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzxw;

    invoke-direct {v1, p0, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzxw;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzxx;Lcom/google/android/gms/internal/firebase-auth-api/zzabl;)V

    .line 4
    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzabm;->zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzack;Lcom/google/android/gms/internal/firebase-auth-api/zzabl;)V

    return-void
.end method
