.class public final Lcom/google/firebase/auth/FirebaseAuthUserCollisionException;
.super Lcom/google/firebase/auth/FirebaseAuthException;
.source "com.google.firebase:firebase-auth@@22.0.0"


# instance fields
.field private zza:Lcom/google/firebase/auth/AuthCredential;

.field private zzb:Ljava/lang/String;

.field private zzc:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/google/firebase/auth/FirebaseAuthException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getEmail()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/auth/FirebaseAuthUserCollisionException;->zzb:Ljava/lang/String;

    return-object v0
.end method

.method public getUpdatedCredential()Lcom/google/firebase/auth/AuthCredential;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/auth/FirebaseAuthUserCollisionException;->zza:Lcom/google/firebase/auth/AuthCredential;

    return-object v0
.end method

.method public final zza(Lcom/google/firebase/auth/AuthCredential;)Lcom/google/firebase/auth/FirebaseAuthUserCollisionException;
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/auth/FirebaseAuthUserCollisionException;->zza:Lcom/google/firebase/auth/AuthCredential;

    return-object p0
.end method

.method public final zzb(Ljava/lang/String;)Lcom/google/firebase/auth/FirebaseAuthUserCollisionException;
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/auth/FirebaseAuthUserCollisionException;->zzb:Ljava/lang/String;

    return-object p0
.end method

.method public final zzc(Ljava/lang/String;)Lcom/google/firebase/auth/FirebaseAuthUserCollisionException;
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/auth/FirebaseAuthUserCollisionException;->zzc:Ljava/lang/String;

    return-object p0
.end method
