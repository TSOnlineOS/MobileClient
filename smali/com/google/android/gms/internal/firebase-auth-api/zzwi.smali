.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzwi;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"


# instance fields
.field private final zza:Lcom/google/firebase/auth/EmailAuthCredential;

.field private final zzb:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/google/firebase/auth/EmailAuthCredential;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzwi;->zza:Lcom/google/firebase/auth/EmailAuthCredential;

    iput-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzwi;->zzb:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final zza()Lcom/google/firebase/auth/EmailAuthCredential;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzwi;->zza:Lcom/google/firebase/auth/EmailAuthCredential;

    return-object v0
.end method

.method public final zzb()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzwi;->zzb:Ljava/lang/String;

    return-object v0
.end method
