.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzwn;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"


# instance fields
.field final zza:Ljava/lang/String;

.field final zzb:Ljava/util/List;

.field final zzc:Lcom/google/firebase/auth/zze;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/List;Lcom/google/firebase/auth/zze;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzwn;->zza:Ljava/lang/String;

    iput-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzwn;->zzb:Ljava/util/List;

    iput-object p3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzwn;->zzc:Lcom/google/firebase/auth/zze;

    return-void
.end method


# virtual methods
.method public final zza()Lcom/google/firebase/auth/zze;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzwn;->zzc:Lcom/google/firebase/auth/zze;

    return-object v0
.end method

.method public final zzb()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzwn;->zza:Ljava/lang/String;

    return-object v0
.end method

.method public final zzc()Ljava/util/List;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzwn;->zzb:Ljava/util/List;

    invoke-static {v0}, Lcom/google/firebase/auth/internal/zzbc;->zzb(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
