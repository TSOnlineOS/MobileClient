.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzcv;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"


# static fields
.field public static final zza:Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

.field public static final zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

.field public static final zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

.field public static final zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

.field public static final zze:Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

.field public static final zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

.field public static final zzg:Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

.field public static final zzh:Lcom/google/android/gms/internal/firebase-auth-api/zzsu;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const/16 v0, 0x10

    .line 1
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzcv;->zzb(I)Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

    move-result-object v1

    sput-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zzcv;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

    const/16 v1, 0x20

    .line 2
    invoke-static {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzcv;->zzb(I)Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

    move-result-object v2

    sput-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzcv;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

    .line 3
    invoke-static {v0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzcv;->zza(II)Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

    move-result-object v2

    sput-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzcv;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

    .line 4
    invoke-static {v1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzcv;->zza(II)Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

    move-result-object v2

    sput-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzcv;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

    const/4 v2, 0x5

    .line 5
    invoke-static {v0, v0, v1, v0, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzcv;->zzc(IIIII)Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

    move-result-object v3

    sput-object v3, Lcom/google/android/gms/internal/firebase-auth-api/zzcv;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

    .line 6
    invoke-static {v1, v0, v1, v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzcv;->zzc(IIIII)Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzcv;->zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

    .line 7
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzsu;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzst;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzfx;

    invoke-direct {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzfx;-><init>()V

    const-string v1, "type.googleapis.com/google.crypto.tink.ChaCha20Poly1305Key"

    .line 8
    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzst;->zzb(Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzst;

    sget-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    .line 9
    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzst;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zztv;)Lcom/google/android/gms/internal/firebase-auth-api/zzst;

    .line 10
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzcv;->zzg:Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

    .line 11
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzsu;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzst;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzgp;

    invoke-direct {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzgp;-><init>()V

    const-string v1, "type.googleapis.com/google.crypto.tink.XChaCha20Poly1305Key"

    .line 12
    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzst;->zzb(Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzst;

    sget-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    .line 13
    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzst;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zztv;)Lcom/google/android/gms/internal/firebase-auth-api/zzst;

    .line 14
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzcv;->zzh:Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

    return-void
.end method

.method public static zza(II)Lcom/google/android/gms/internal/firebase-auth-api/zzsu;
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzpl;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzpk;

    move-result-object p1

    .line 2
    invoke-virtual {p1, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzpk;->zza(I)Lcom/google/android/gms/internal/firebase-auth-api/zzpk;

    .line 3
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzpo;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzpn;

    move-result-object p0

    const/16 v0, 0x10

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzpn;->zza(I)Lcom/google/android/gms/internal/firebase-auth-api/zzpn;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/firebase-auth-api/zzpo;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzpk;->zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzpo;)Lcom/google/android/gms/internal/firebase-auth-api/zzpk;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/firebase-auth-api/zzpl;

    .line 5
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzsu;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzst;

    move-result-object p1

    .line 6
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaep;->zzo()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzst;->zzc(Lcom/google/android/gms/internal/firebase-auth-api/zzaff;)Lcom/google/android/gms/internal/firebase-auth-api/zzst;

    new-instance p0, Lcom/google/android/gms/internal/firebase-auth-api/zzeb;

    invoke-direct {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzeb;-><init>()V

    const-string p0, "type.googleapis.com/google.crypto.tink.AesEaxKey"

    .line 7
    invoke-virtual {p1, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzst;->zzb(Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzst;

    sget-object p0, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    .line 8
    invoke-virtual {p1, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzst;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zztv;)Lcom/google/android/gms/internal/firebase-auth-api/zzst;

    .line 9
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

    return-object p0
.end method

.method public static zzb(I)Lcom/google/android/gms/internal/firebase-auth-api/zzsu;
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzpu;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzpt;

    move-result-object v0

    .line 2
    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzpt;->zza(I)Lcom/google/android/gms/internal/firebase-auth-api/zzpt;

    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/firebase-auth-api/zzpu;

    .line 4
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzsu;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzst;

    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaep;->zzo()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzst;->zzc(Lcom/google/android/gms/internal/firebase-auth-api/zzaff;)Lcom/google/android/gms/internal/firebase-auth-api/zzst;

    new-instance p0, Lcom/google/android/gms/internal/firebase-auth-api/zzes;

    invoke-direct {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzes;-><init>()V

    const-string p0, "type.googleapis.com/google.crypto.tink.AesGcmKey"

    .line 6
    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzst;->zzb(Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzst;

    sget-object p0, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    .line 7
    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzst;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zztv;)Lcom/google/android/gms/internal/firebase-auth-api/zzst;

    .line 8
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

    return-object p0
.end method

.method public static zzc(IIIII)Lcom/google/android/gms/internal/firebase-auth-api/zzsu;
    .locals 0

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzpc;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzpb;

    move-result-object p1

    .line 2
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzpf;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzpe;

    move-result-object p2

    const/16 p4, 0x10

    invoke-virtual {p2, p4}, Lcom/google/android/gms/internal/firebase-auth-api/zzpe;->zza(I)Lcom/google/android/gms/internal/firebase-auth-api/zzpe;

    invoke-virtual {p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object p2

    check-cast p2, Lcom/google/android/gms/internal/firebase-auth-api/zzpf;

    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzpb;->zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzpf;)Lcom/google/android/gms/internal/firebase-auth-api/zzpb;

    .line 3
    invoke-virtual {p1, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzpb;->zza(I)Lcom/google/android/gms/internal/firebase-auth-api/zzpb;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/firebase-auth-api/zzpc;

    .line 5
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzrt;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzrs;

    move-result-object p1

    .line 6
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzrw;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzrv;

    move-result-object p2

    const/4 p4, 0x5

    invoke-virtual {p2, p4}, Lcom/google/android/gms/internal/firebase-auth-api/zzrv;->zzb(I)Lcom/google/android/gms/internal/firebase-auth-api/zzrv;

    invoke-virtual {p2, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzrv;->zza(I)Lcom/google/android/gms/internal/firebase-auth-api/zzrv;

    invoke-virtual {p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object p2

    check-cast p2, Lcom/google/android/gms/internal/firebase-auth-api/zzrw;

    .line 7
    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzrs;->zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzrw;)Lcom/google/android/gms/internal/firebase-auth-api/zzrs;

    const/16 p2, 0x20

    .line 8
    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzrs;->zza(I)Lcom/google/android/gms/internal/firebase-auth-api/zzrs;

    .line 9
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzrt;

    .line 10
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzow;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzov;

    move-result-object p2

    .line 11
    invoke-virtual {p2, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzov;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzpc;)Lcom/google/android/gms/internal/firebase-auth-api/zzov;

    .line 12
    invoke-virtual {p2, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzov;->zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzrt;)Lcom/google/android/gms/internal/firebase-auth-api/zzov;

    .line 13
    invoke-virtual {p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/firebase-auth-api/zzow;

    .line 14
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzsu;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzst;

    move-result-object p1

    .line 15
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaep;->zzo()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzst;->zzc(Lcom/google/android/gms/internal/firebase-auth-api/zzaff;)Lcom/google/android/gms/internal/firebase-auth-api/zzst;

    new-instance p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdg;

    invoke-direct {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzdg;-><init>()V

    const-string p0, "type.googleapis.com/google.crypto.tink.AesCtrHmacAeadKey"

    .line 16
    invoke-virtual {p1, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzst;->zzb(Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzst;

    sget-object p0, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    .line 17
    invoke-virtual {p1, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzst;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zztv;)Lcom/google/android/gms/internal/firebase-auth-api/zzst;

    .line 18
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/firebase-auth-api/zzsu;

    return-object p0
.end method
