.class final Lcom/google/android/gms/internal/firebase-auth-api/zzjz;
.super Lcom/google/android/gms/internal/firebase-auth-api/zzkc;
.source "com.google.firebase:firebase-auth@@22.0.0"


# instance fields
.field final synthetic zza:Lcom/google/android/gms/internal/firebase-auth-api/zzka;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzvx;Ljava/lang/Class;Lcom/google/android/gms/internal/firebase-auth-api/zzka;)V
    .locals 0

    .line 1
    iput-object p3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzjz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzka;

    const/4 p3, 0x0

    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzkc;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzvx;Ljava/lang/Class;Lcom/google/android/gms/internal/firebase-auth-api/zzkb;)V

    return-void
.end method


# virtual methods
.method public final zza(Lcom/google/android/gms/internal/firebase-auth-api/zzlp;Lcom/google/android/gms/internal/firebase-auth-api/zzcr;)Lcom/google/android/gms/internal/firebase-auth-api/zzbl;
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
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzjz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzka;

    invoke-interface {v0, p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzka;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzlp;Lcom/google/android/gms/internal/firebase-auth-api/zzcr;)Lcom/google/android/gms/internal/firebase-auth-api/zzbl;

    move-result-object p1

    return-object p1
.end method
