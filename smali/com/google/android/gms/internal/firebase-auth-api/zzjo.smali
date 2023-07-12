.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzjo;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"


# instance fields
.field private final zza:Lcom/google/android/gms/internal/firebase-auth-api/zzbd;

.field private final zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzbi;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzbd;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzjo;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzbd;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzjo;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzbi;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzbi;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzjo;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzbd;

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzjo;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzbi;

    return-void
.end method


# virtual methods
.method public final zza([B[B)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzjo;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzbd;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzbd;->zza([B[B)[B

    move-result-object p1

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzjo;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzbi;

    .line 2
    invoke-interface {v0, p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzbi;->zza([B[B)[B

    move-result-object p1

    return-object p1
.end method
