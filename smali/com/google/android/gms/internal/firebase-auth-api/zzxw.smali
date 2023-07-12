.class final Lcom/google/android/gms/internal/firebase-auth-api/zzxw;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Lcom/google/android/gms/internal/firebase-auth-api/zzabl;


# instance fields
.field final synthetic zza:Lcom/google/android/gms/internal/firebase-auth-api/zzabl;

.field final synthetic zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzxx;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzxx;Lcom/google/android/gms/internal/firebase-auth-api/zzabl;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzxw;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzxx;

    iput-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzxw;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzabl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzxw;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzabl;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzabl;->zza(Ljava/lang/String;)V

    return-void
.end method

.method public final bridge synthetic zzb(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Void;

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzxw;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzxx;

    iget-object p1, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzxx;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;->zzd()V

    return-void
.end method
