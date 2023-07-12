.class final Lcom/google/firebase/auth/internal/zzbu;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Lcom/google/android/gms/common/api/internal/BackgroundDetector$BackgroundStateChangeListener;


# instance fields
.field final synthetic zza:Lcom/google/firebase/auth/internal/zzbv;


# direct methods
.method constructor <init>(Lcom/google/firebase/auth/internal/zzbv;)V
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/auth/internal/zzbu;->zza:Lcom/google/firebase/auth/internal/zzbv;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onBackgroundStateChanged(Z)V
    .locals 1

    if-eqz p1, :cond_0

    .line 1
    iget-object p1, p0, Lcom/google/firebase/auth/internal/zzbu;->zza:Lcom/google/firebase/auth/internal/zzbv;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/google/firebase/auth/internal/zzbv;->zzb(Lcom/google/firebase/auth/internal/zzbv;Z)V

    iget-object p1, p0, Lcom/google/firebase/auth/internal/zzbu;->zza:Lcom/google/firebase/auth/internal/zzbv;

    .line 2
    invoke-virtual {p1}, Lcom/google/firebase/auth/internal/zzbv;->zzc()V

    return-void

    :cond_0
    iget-object p1, p0, Lcom/google/firebase/auth/internal/zzbu;->zza:Lcom/google/firebase/auth/internal/zzbv;

    const/4 v0, 0x0

    .line 3
    invoke-static {p1, v0}, Lcom/google/firebase/auth/internal/zzbv;->zzb(Lcom/google/firebase/auth/internal/zzbv;Z)V

    iget-object p1, p0, Lcom/google/firebase/auth/internal/zzbu;->zza:Lcom/google/firebase/auth/internal/zzbv;

    .line 4
    invoke-static {p1}, Lcom/google/firebase/auth/internal/zzbv;->zzf(Lcom/google/firebase/auth/internal/zzbv;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/google/firebase/auth/internal/zzbu;->zza:Lcom/google/firebase/auth/internal/zzbv;

    invoke-static {p1}, Lcom/google/firebase/auth/internal/zzbv;->zza(Lcom/google/firebase/auth/internal/zzbv;)Lcom/google/firebase/auth/internal/zzam;

    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/google/firebase/auth/internal/zzam;->zzc()V

    :cond_1
    return-void
.end method
