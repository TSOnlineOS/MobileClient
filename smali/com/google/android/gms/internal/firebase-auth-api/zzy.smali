.class final Lcom/google/android/gms/internal/firebase-auth-api/zzy;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Lcom/google/android/gms/internal/firebase-auth-api/zzaa;


# instance fields
.field final synthetic zza:Lcom/google/android/gms/internal/firebase-auth-api/zzm;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzm;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzy;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzm;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final bridge synthetic zza(Lcom/google/android/gms/internal/firebase-auth-api/zzab;Ljava/lang/CharSequence;)Ljava/util/Iterator;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzy;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzm;

    invoke-virtual {v0, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzm;->zza(Ljava/lang/CharSequence;)Lcom/google/android/gms/internal/firebase-auth-api/zzl;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzx;

    invoke-direct {v1, p0, p1, p2, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzx;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzy;Lcom/google/android/gms/internal/firebase-auth-api/zzab;Ljava/lang/CharSequence;Lcom/google/android/gms/internal/firebase-auth-api/zzl;)V

    return-object v1
.end method
