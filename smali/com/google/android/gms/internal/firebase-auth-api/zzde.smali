.class final Lcom/google/android/gms/internal/firebase-auth-api/zzde;
.super Lcom/google/android/gms/internal/firebase-auth-api/zzlg;
.source "com.google.firebase:firebase-auth@@22.0.0"


# direct methods
.method constructor <init>(Ljava/lang/Class;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzlg;-><init>(Ljava/lang/Class;)V

    return-void
.end method


# virtual methods
.method public final bridge synthetic zza(Lcom/google/android/gms/internal/firebase-auth-api/zzahp;)Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzot;

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzuu;

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzdu;

    .line 2
    invoke-direct {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzdu;-><init>()V

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzot;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zzoz;

    move-result-object v2

    const-class v3, Lcom/google/android/gms/internal/firebase-auth-api/zzvm;

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzkj;->zzl(Lcom/google/android/gms/internal/firebase-auth-api/zzahp;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/firebase-auth-api/zzvm;

    new-instance v2, Lcom/google/android/gms/internal/firebase-auth-api/zznc;

    invoke-direct {v2}, Lcom/google/android/gms/internal/firebase-auth-api/zznc;-><init>()V

    .line 4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzot;->zzf()Lcom/google/android/gms/internal/firebase-auth-api/zzrq;

    move-result-object v3

    const-class v4, Lcom/google/android/gms/internal/firebase-auth-api/zzcd;

    invoke-virtual {v2, v3, v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzkj;->zzl(Lcom/google/android/gms/internal/firebase-auth-api/zzahp;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/firebase-auth-api/zzcd;

    .line 5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzot;->zzf()Lcom/google/android/gms/internal/firebase-auth-api/zzrq;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzrq;->zzf()Lcom/google/android/gms/internal/firebase-auth-api/zzrw;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzrw;->zza()I

    move-result p1

    invoke-direct {v0, v1, v2, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzuu;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzvm;Lcom/google/android/gms/internal/firebase-auth-api/zzcd;I)V

    return-object v0
.end method
