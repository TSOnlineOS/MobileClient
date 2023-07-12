.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzaah;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"


# instance fields
.field private zza:Ljava/lang/String;

.field private zzb:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static zza(Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzaah;
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaah;

    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaah;-><init>()V

    iput-object p0, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaah;->zza:Ljava/lang/String;

    return-object v0
.end method

.method public static zzb(Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzaah;
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaah;

    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaah;-><init>()V

    iput-object p0, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaah;->zzb:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public final zzc()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaah;->zza:Ljava/lang/String;

    return-object v0
.end method

.method public final zzd()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaah;->zzb:Ljava/lang/String;

    return-object v0
.end method
