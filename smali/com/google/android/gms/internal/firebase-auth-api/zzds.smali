.class final Lcom/google/android/gms/internal/firebase-auth-api/zzds;
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
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzoz;

    .line 2
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzug;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzoz;->zzg()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaff;->zzq()[B

    move-result-object v1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzoz;->zzf()Lcom/google/android/gms/internal/firebase-auth-api/zzpf;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzpf;->zza()I

    move-result p1

    invoke-direct {v0, v1, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzug;-><init>([BI)V

    return-object v0
.end method
