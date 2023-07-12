.class final Lcom/google/android/gms/internal/firebase-auth-api/zzxi;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Lcom/google/android/gms/internal/firebase-auth-api/zzabl;


# instance fields
.field final synthetic zza:Lcom/google/android/gms/internal/firebase-auth-api/zzabl;

.field final synthetic zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzade;

.field final synthetic zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzxj;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzxj;Lcom/google/android/gms/internal/firebase-auth-api/zzabl;Lcom/google/android/gms/internal/firebase-auth-api/zzade;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzxi;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzxj;

    iput-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzxi;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzabl;

    iput-object p3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzxi;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzade;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/google/firebase/auth/internal/zzai;->zza(Ljava/lang/String;)Lcom/google/android/gms/common/api/Status;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzxi;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzxj;

    iget-object v0, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzxj;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    .line 2
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;->zzh(Lcom/google/android/gms/common/api/Status;)V

    return-void
.end method

.method public final bridge synthetic zzb(Ljava/lang/Object;)V
    .locals 6

    .line 1
    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzacu;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzacu;->zzb()Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 3
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 5
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    move-object v3, p1

    check-cast v3, Lcom/google/android/gms/internal/firebase-auth-api/zzacv;

    new-instance v4, Lcom/google/android/gms/internal/firebase-auth-api/zzadq;

    .line 6
    invoke-direct {v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzadq;-><init>()V

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzxi;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzade;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzade;->zze()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v4, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzadq;->zze(Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzadq;

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzxi;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzxj;

    iget-object p1, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzxj;->zza:Ljava/lang/String;

    .line 8
    invoke-virtual {v4, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzadq;->zzb(Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzadq;

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzxi;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzxj;

    iget-object v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzxj;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    iget-object v1, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzxj;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    iget-object v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzxi;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzade;

    iget-object v5, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzxi;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzabl;

    .line 9
    invoke-static/range {v0 .. v5}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzf(Lcom/google/android/gms/internal/firebase-auth-api/zzyh;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;Lcom/google/android/gms/internal/firebase-auth-api/zzade;Lcom/google/android/gms/internal/firebase-auth-api/zzacv;Lcom/google/android/gms/internal/firebase-auth-api/zzadq;Lcom/google/android/gms/internal/firebase-auth-api/zzabk;)V

    return-void

    .line 3
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzxi;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzabl;

    const-string v0, "No users."

    .line 4
    invoke-interface {p1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzabl;->zza(Ljava/lang/String;)V

    return-void
.end method
