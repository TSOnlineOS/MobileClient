.class public abstract Lcom/google/android/gms/internal/firebase-auth-api/zzkc;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"


# instance fields
.field private final zza:Lcom/google/android/gms/internal/firebase-auth-api/zzvx;

.field private final zzb:Ljava/lang/Class;


# direct methods
.method synthetic constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzvx;Ljava/lang/Class;Lcom/google/android/gms/internal/firebase-auth-api/zzkb;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzkc;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzvx;

    iput-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzkc;->zzb:Ljava/lang/Class;

    return-void
.end method

.method public static zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzka;Lcom/google/android/gms/internal/firebase-auth-api/zzvx;Ljava/lang/Class;)Lcom/google/android/gms/internal/firebase-auth-api/zzkc;
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzjz;

    invoke-direct {v0, p1, p2, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzjz;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzvx;Ljava/lang/Class;Lcom/google/android/gms/internal/firebase-auth-api/zzka;)V

    return-object v0
.end method


# virtual methods
.method public abstract zza(Lcom/google/android/gms/internal/firebase-auth-api/zzlp;Lcom/google/android/gms/internal/firebase-auth-api/zzcr;)Lcom/google/android/gms/internal/firebase-auth-api/zzbl;
    .param p2    # Lcom/google/android/gms/internal/firebase-auth-api/zzcr;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation
.end method

.method public final zzc()Lcom/google/android/gms/internal/firebase-auth-api/zzvx;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzkc;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzvx;

    return-object v0
.end method

.method public final zzd()Ljava/lang/Class;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzkc;->zzb:Ljava/lang/Class;

    return-object v0
.end method
