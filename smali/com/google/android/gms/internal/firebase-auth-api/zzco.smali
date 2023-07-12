.class final Lcom/google/android/gms/internal/firebase-auth-api/zzco;
.super Lcom/google/android/gms/internal/firebase-auth-api/zzbo;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Lcom/google/android/gms/internal/firebase-auth-api/zzcn;


# instance fields
.field private final zza:Lcom/google/android/gms/internal/firebase-auth-api/zzlm;

.field private final zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzkj;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzlm;Lcom/google/android/gms/internal/firebase-auth-api/zzkj;Ljava/lang/Class;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzbo;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzkj;Ljava/lang/Class;)V

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzco;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzlm;

    iput-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzco;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzkj;

    return-void
.end method


# virtual methods
.method public final zzf(Lcom/google/android/gms/internal/firebase-auth-api/zzaff;)Lcom/google/android/gms/internal/firebase-auth-api/zzsp;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzco;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzlm;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzlm;->zzc(Lcom/google/android/gms/internal/firebase-auth-api/zzaff;)Lcom/google/android/gms/internal/firebase-auth-api/zzahp;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzco;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzlm;

    .line 2
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzlm;->zze(Lcom/google/android/gms/internal/firebase-auth-api/zzahp;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzco;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzlm;

    .line 3
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzlm;->zzg(Lcom/google/android/gms/internal/firebase-auth-api/zzahp;)Lcom/google/android/gms/internal/firebase-auth-api/zzahp;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzco;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzkj;

    .line 4
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzkj;->zze(Lcom/google/android/gms/internal/firebase-auth-api/zzahp;)V

    .line 5
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzsp;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzsm;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzco;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzkj;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzkj;->zzd()Ljava/lang/String;

    move-result-object v1

    .line 6
    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzsm;->zzb(Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzsm;

    .line 7
    invoke-interface {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzahp;->zzo()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzsm;->zzc(Lcom/google/android/gms/internal/firebase-auth-api/zzaff;)Lcom/google/android/gms/internal/firebase-auth-api/zzsm;

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzco;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzkj;

    .line 8
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzkj;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzso;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzsm;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzso;)Lcom/google/android/gms/internal/firebase-auth-api/zzsm;

    .line 9
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzsp;
    :try_end_0
    .catch Lcom/google/android/gms/internal/firebase-auth-api/zzags; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 10
    new-instance v0, Ljava/security/GeneralSecurityException;

    const-string v1, "expected serialized proto of type "

    invoke-direct {v0, v1, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method
