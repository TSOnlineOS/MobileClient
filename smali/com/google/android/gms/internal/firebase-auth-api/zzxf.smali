.class final Lcom/google/android/gms/internal/firebase-auth-api/zzxf;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Lcom/google/android/gms/internal/firebase-auth-api/zzabl;


# instance fields
.field final synthetic zza:Lcom/google/android/gms/internal/firebase-auth-api/zzabl;

.field final synthetic zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzxg;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzxg;Lcom/google/android/gms/internal/firebase-auth-api/zzabl;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzxf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzxg;

    iput-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzxf;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzabl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzxf;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzabl;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzabl;->zza(Ljava/lang/String;)V

    return-void
.end method

.method public final bridge synthetic zzb(Ljava/lang/Object;)V
    .locals 2

    .line 1
    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzaee;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzxf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzxg;

    iget-object v1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzxg;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    iget-object v0, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzxg;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    .line 2
    invoke-static {v1, p1, v0, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzd(Lcom/google/android/gms/internal/firebase-auth-api/zzyh;Lcom/google/android/gms/internal/firebase-auth-api/zzaee;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;Lcom/google/android/gms/internal/firebase-auth-api/zzabk;)V

    return-void
.end method
