.class final Lcom/google/android/gms/internal/firebase-auth-api/zzlc;
.super Lcom/google/android/gms/internal/firebase-auth-api/zzlf;
.source "com.google.firebase:firebase-auth@@22.0.0"


# instance fields
.field final synthetic zza:Lcom/google/android/gms/internal/firebase-auth-api/zzld;


# direct methods
.method constructor <init>(Ljava/lang/Class;Ljava/lang/Class;Lcom/google/android/gms/internal/firebase-auth-api/zzld;)V
    .locals 0

    .line 1
    iput-object p3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzlc;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzld;

    const/4 p3, 0x0

    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzlf;-><init>(Ljava/lang/Class;Ljava/lang/Class;Lcom/google/android/gms/internal/firebase-auth-api/zzle;)V

    return-void
.end method


# virtual methods
.method public final zza(Lcom/google/android/gms/internal/firebase-auth-api/zzbl;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzlc;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzld;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzld;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzbl;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
