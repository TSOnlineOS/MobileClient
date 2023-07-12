.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzim;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"


# static fields
.field static final zza:Lcom/google/android/gms/internal/firebase-auth-api/zzty;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

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
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzil;

    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzil;-><init>()V

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzij;

    .line 2
    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzij;-><init>()V

    .line 3
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzty;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzty;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzim;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzty;

    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzty;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzty;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzim;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzty;

    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzty;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzty;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzim;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzty;

    .line 4
    :try_start_0
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzim;->zza()V
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 3
    new-instance v1, Ljava/lang/ExceptionInInitializerError;

    .line 5
    invoke-direct {v1, v0}, Ljava/lang/ExceptionInInitializerError;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static zza()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzio;->zze()V

    .line 2
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zziq;->zzd()V

    .line 3
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzct;->zza()V

    .line 4
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzhk;->zzb()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzij;

    .line 5
    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzij;-><init>()V

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzil;

    invoke-direct {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzil;-><init>()V

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzcq;->zzh(Lcom/google/android/gms/internal/firebase-auth-api/zzlm;Lcom/google/android/gms/internal/firebase-auth-api/zzkj;Z)V

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzjg;

    .line 6
    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzjg;-><init>()V

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzji;

    invoke-direct {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzji;-><init>()V

    invoke-static {v0, v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzcq;->zzh(Lcom/google/android/gms/internal/firebase-auth-api/zzlm;Lcom/google/android/gms/internal/firebase-auth-api/zzkj;Z)V

    return-void
.end method
