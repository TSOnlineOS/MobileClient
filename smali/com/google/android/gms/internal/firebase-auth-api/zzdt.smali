.class final Lcom/google/android/gms/internal/firebase-auth-api/zzdt;
.super Lcom/google/android/gms/internal/firebase-auth-api/zzki;
.source "com.google.firebase:firebase-auth@@22.0.0"


# instance fields
.field final synthetic zza:Lcom/google/android/gms/internal/firebase-auth-api/zzdu;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzdu;Ljava/lang/Class;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdt;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzdu;

    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzki;-><init>(Ljava/lang/Class;)V

    return-void
.end method

.method public static final zzf(Lcom/google/android/gms/internal/firebase-auth-api/zzpc;)Lcom/google/android/gms/internal/firebase-auth-api/zzoz;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzoz;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzoy;

    move-result-object v0

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzpc;->zzf()Lcom/google/android/gms/internal/firebase-auth-api/zzpf;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzoy;->zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzpf;)Lcom/google/android/gms/internal/firebase-auth-api/zzoy;

    .line 3
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzpc;->zza()I

    move-result p0

    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzvs;->zza(I)[B

    move-result-object p0

    array-length v1, p0

    const/4 v2, 0x0

    .line 4
    invoke-static {p0, v2, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaff;->zzn([BII)Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object p0

    .line 3
    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzoy;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzaff;)Lcom/google/android/gms/internal/firebase-auth-api/zzoy;

    .line 5
    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzoy;->zzc(I)Lcom/google/android/gms/internal/firebase-auth-api/zzoy;

    .line 6
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/firebase-auth-api/zzoz;

    return-object p0
.end method


# virtual methods
.method public final bridge synthetic zza(Lcom/google/android/gms/internal/firebase-auth-api/zzahp;)Lcom/google/android/gms/internal/firebase-auth-api/zzahp;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzpc;

    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzdt;->zzf(Lcom/google/android/gms/internal/firebase-auth-api/zzpc;)Lcom/google/android/gms/internal/firebase-auth-api/zzoz;

    move-result-object p1

    return-object p1
.end method

.method public final synthetic zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzaff;)Lcom/google/android/gms/internal/firebase-auth-api/zzahp;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/firebase-auth-api/zzags;
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzafx;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzafx;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzpc;->zze(Lcom/google/android/gms/internal/firebase-auth-api/zzaff;Lcom/google/android/gms/internal/firebase-auth-api/zzafx;)Lcom/google/android/gms/internal/firebase-auth-api/zzpc;

    move-result-object p1

    return-object p1
.end method

.method public final bridge synthetic zzd(Lcom/google/android/gms/internal/firebase-auth-api/zzahp;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzpc;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzdt;->zze(Lcom/google/android/gms/internal/firebase-auth-api/zzpc;)V

    return-void
.end method

.method public final zze(Lcom/google/android/gms/internal/firebase-auth-api/zzpc;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzpc;->zza()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzvu;->zzb(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdt;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzdu;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzpc;->zzf()Lcom/google/android/gms/internal/firebase-auth-api/zzpf;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzdu;->zzg(Lcom/google/android/gms/internal/firebase-auth-api/zzdu;Lcom/google/android/gms/internal/firebase-auth-api/zzpf;)V

    return-void
.end method
