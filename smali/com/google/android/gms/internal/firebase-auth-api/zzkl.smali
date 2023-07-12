.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzkl;
.super Lcom/google/android/gms/internal/firebase-auth-api/zzbl;
.source "com.google.firebase:firebase-auth@@22.0.0"


# instance fields
.field private final zza:Lcom/google/android/gms/internal/firebase-auth-api/zzln;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzln;Lcom/google/android/gms/internal/firebase-auth-api/zzcr;)V
    .locals 1
    .param p2    # Lcom/google/android/gms/internal/firebase-auth-api/zzcr;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzbl;-><init>()V

    sget-object p2, Lcom/google/android/gms/internal/firebase-auth-api/zzkk;->zzb:[I

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzln;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzso;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzso;->ordinal()I

    move-result v0

    aget p2, p2, v0

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzkl;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzln;

    return-void
.end method
