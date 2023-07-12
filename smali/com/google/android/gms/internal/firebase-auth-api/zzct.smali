.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzct;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"


# static fields
.field public static final zza:Ljava/lang/String;

.field public static final zzb:Ljava/lang/String;

.field static final zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzty;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field static final zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzty;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field static final zze:Lcom/google/android/gms/internal/firebase-auth-api/zzty;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzdg;

    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzdg;-><init>()V

    const-string v0, "type.googleapis.com/google.crypto.tink.AesCtrHmacAeadKey"

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzct;->zza:Ljava/lang/String;

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzes;

    .line 2
    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzes;-><init>()V

    const-string v0, "type.googleapis.com/google.crypto.tink.AesGcmKey"

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzct;->zzb:Ljava/lang/String;

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzfj;

    .line 3
    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzfj;-><init>()V

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzeb;

    .line 4
    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzeb;-><init>()V

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzgh;

    .line 5
    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzgh;-><init>()V

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzgl;

    .line 6
    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzgl;-><init>()V

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzfx;

    .line 7
    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzfx;-><init>()V

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzgp;

    .line 8
    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzgp;-><init>()V

    .line 9
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzty;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzty;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzct;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzty;

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzct;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzty;

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzct;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzty;

    .line 10
    :try_start_0
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzct;->zza()V
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 9
    new-instance v1, Ljava/lang/ExceptionInInitializerError;

    .line 11
    invoke-direct {v1, v0}, Ljava/lang/ExceptionInInitializerError;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static zza()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzcz;->zze()V

    .line 2
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzno;->zza()V

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzdg;

    .line 3
    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzdg;-><init>()V

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzcq;->zzi(Lcom/google/android/gms/internal/firebase-auth-api/zzkj;Z)V

    .line 4
    sget v0, Lcom/google/android/gms/internal/firebase-auth-api/zzdr;->zza:I

    .line 5
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzkt;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzkt;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzdr;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzkt;)V

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzes;

    .line 6
    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzes;-><init>()V

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzcq;->zzi(Lcom/google/android/gms/internal/firebase-auth-api/zzkj;Z)V

    .line 7
    sget v0, Lcom/google/android/gms/internal/firebase-auth-api/zzfc;->zza:I

    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzkt;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzkt;

    move-result-object v0

    .line 8
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzfc;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzkt;)V

    .line 9
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzhk;->zzb()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzeb;

    .line 10
    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzeb;-><init>()V

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzcq;->zzi(Lcom/google/android/gms/internal/firebase-auth-api/zzkj;Z)V

    .line 11
    sget v0, Lcom/google/android/gms/internal/firebase-auth-api/zzel;->zza:I

    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzkt;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzkt;

    move-result-object v0

    .line 12
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzel;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzkt;)V

    .line 13
    invoke-static {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzfj;->zzg(Z)V

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzfx;

    .line 14
    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzfx;-><init>()V

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzcq;->zzi(Lcom/google/android/gms/internal/firebase-auth-api/zzkj;Z)V

    .line 15
    sget v0, Lcom/google/android/gms/internal/firebase-auth-api/zzge;->zza:I

    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzkt;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzkt;

    move-result-object v0

    .line 16
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzge;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzkt;)V

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzgh;

    .line 17
    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzgh;-><init>()V

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzcq;->zzi(Lcom/google/android/gms/internal/firebase-auth-api/zzkj;Z)V

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzgl;

    .line 18
    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzgl;-><init>()V

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzcq;->zzi(Lcom/google/android/gms/internal/firebase-auth-api/zzkj;Z)V

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzgp;

    .line 19
    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzgp;-><init>()V

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzcq;->zzi(Lcom/google/android/gms/internal/firebase-auth-api/zzkj;Z)V

    .line 20
    sget v0, Lcom/google/android/gms/internal/firebase-auth-api/zzgw;->zza:I

    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzkt;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzkt;

    move-result-object v0

    .line 21
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzgw;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzkt;)V

    return-void
.end method
