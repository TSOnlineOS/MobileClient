.class final Lcom/google/android/gms/internal/firebase-auth-api/zzme;
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
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzok;

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzvq;

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzvn;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzok;->zzf()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaff;->zzq()[B

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzvn;-><init>([B)V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzok;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zzoq;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzoq;->zza()I

    move-result p1

    invoke-direct {v0, v1, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzvq;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzoh;I)V

    return-object v0
.end method
