.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzvy;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"


# instance fields
.field private final zza:Lcom/google/android/gms/internal/firebase-auth-api/zzvx;


# direct methods
.method private constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzvx;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzvy;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzvx;

    return-void
.end method

.method public static zzb([BLcom/google/android/gms/internal/firebase-auth-api/zzcr;)Lcom/google/android/gms/internal/firebase-auth-api/zzvy;
    .locals 0

    .line 1
    new-instance p1, Lcom/google/android/gms/internal/firebase-auth-api/zzvy;

    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzvx;->zzb([B)Lcom/google/android/gms/internal/firebase-auth-api/zzvx;

    move-result-object p0

    invoke-direct {p1, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzvy;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzvx;)V

    return-object p1
.end method


# virtual methods
.method public final zza()I
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzvy;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzvx;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzvx;->zza()I

    move-result v0

    return v0
.end method
