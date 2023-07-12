.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzic;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"


# static fields
.field public static final zza:Ljava/lang/String;

.field static final zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzty;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field static final zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzty;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzhr;

    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzhr;-><init>()V

    const-string v0, "type.googleapis.com/google.crypto.tink.AesSivKey"

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzic;->zza:Ljava/lang/String;

    .line 2
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzty;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzty;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzic;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzty;

    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzty;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzty;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzic;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzty;

    .line 3
    :try_start_0
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzig;->zze()V

    .line 4
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzhk;->zzb()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzhr;

    .line 5
    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzhr;-><init>()V

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzcq;->zzi(Lcom/google/android/gms/internal/firebase-auth-api/zzkj;Z)V

    .line 6
    sget v0, Lcom/google/android/gms/internal/firebase-auth-api/zzib;->zza:I

    .line 7
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzkt;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzkt;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzib;->zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzkt;)V
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/ExceptionInInitializerError;

    .line 8
    invoke-direct {v1, v0}, Ljava/lang/ExceptionInInitializerError;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
