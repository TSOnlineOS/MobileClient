.class final Lcom/google/android/gms/internal/firebase-auth-api/zzfc;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"


# static fields
.field public static final synthetic zza:I

.field private static final zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzvx;

.field private static final zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzlb;

.field private static final zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzkx;

.field private static final zze:Lcom/google/android/gms/internal/firebase-auth-api/zzkg;

.field private static final zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzkc;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const-string v0, "type.googleapis.com/google.crypto.tink.AesGcmKey"

    .line 1
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzly;->zzb(Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzvx;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzfc;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzvx;

    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzey;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzey;

    const-class v1, Lcom/google/android/gms/internal/firebase-auth-api/zzex;

    const-class v2, Lcom/google/android/gms/internal/firebase-auth-api/zzlo;

    invoke-static {v0, v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzlb;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzkz;Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/android/gms/internal/firebase-auth-api/zzlb;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzfc;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzlb;

    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzez;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzez;

    sget-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zzfc;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzvx;

    const-class v2, Lcom/google/android/gms/internal/firebase-auth-api/zzlo;

    invoke-static {v0, v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzkx;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzkv;Lcom/google/android/gms/internal/firebase-auth-api/zzvx;Ljava/lang/Class;)Lcom/google/android/gms/internal/firebase-auth-api/zzkx;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzfc;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzkx;

    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzfa;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzfa;

    const-class v2, Lcom/google/android/gms/internal/firebase-auth-api/zzep;

    const-class v3, Lcom/google/android/gms/internal/firebase-auth-api/zzln;

    invoke-static {v0, v2, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzkg;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzke;Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/android/gms/internal/firebase-auth-api/zzkg;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzfc;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzkg;

    const-class v0, Lcom/google/android/gms/internal/firebase-auth-api/zzln;

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzfb;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzfb;

    invoke-static {v2, v1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzkc;->zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzka;Lcom/google/android/gms/internal/firebase-auth-api/zzvx;Ljava/lang/Class;)Lcom/google/android/gms/internal/firebase-auth-api/zzkc;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzfc;->zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzkc;

    return-void
.end method

.method public static zza(Lcom/google/android/gms/internal/firebase-auth-api/zzkt;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzfc;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzlb;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzkt;->zzf(Lcom/google/android/gms/internal/firebase-auth-api/zzlb;)V

    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzfc;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzkx;

    .line 2
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzkt;->zze(Lcom/google/android/gms/internal/firebase-auth-api/zzkx;)V

    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzfc;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzkg;

    .line 3
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzkt;->zzd(Lcom/google/android/gms/internal/firebase-auth-api/zzkg;)V

    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzfc;->zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzkc;

    .line 4
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzkt;->zzc(Lcom/google/android/gms/internal/firebase-auth-api/zzkc;)V

    return-void
.end method
