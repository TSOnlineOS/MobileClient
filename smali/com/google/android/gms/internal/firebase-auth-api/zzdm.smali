.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzdm;
.super Lcom/google/android/gms/internal/firebase-auth-api/zzcw;
.source "com.google.firebase:firebase-auth@@22.0.0"


# instance fields
.field private final zza:I

.field private final zzb:I

.field private final zzc:I

.field private final zzd:I

.field private final zze:Lcom/google/android/gms/internal/firebase-auth-api/zzdk;

.field private final zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzdj;


# direct methods
.method synthetic constructor <init>(IIIILcom/google/android/gms/internal/firebase-auth-api/zzdk;Lcom/google/android/gms/internal/firebase-auth-api/zzdj;Lcom/google/android/gms/internal/firebase-auth-api/zzdl;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzcw;-><init>()V

    iput p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;->zza:I

    iput p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;->zzb:I

    iput p3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;->zzc:I

    iput p4, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;->zzd:I

    iput-object p5, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzdk;

    iput-object p6, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;->zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzdj;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;

    iget v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;->zza:I

    iget v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;->zza:I

    if-ne v0, v2, :cond_1

    iget v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;->zzb:I

    iget v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;->zzb:I

    if-ne v0, v2, :cond_1

    iget v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;->zzc:I

    iget v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;->zzc:I

    if-ne v0, v2, :cond_1

    iget v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;->zzd:I

    iget v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;->zzd:I

    if-ne v0, v2, :cond_1

    iget-object v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzdk;

    iget-object v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzdk;

    if-ne v0, v2, :cond_1

    iget-object p1, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;->zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzdj;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;->zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzdj;

    if-ne p1, v0, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    return v1
.end method

.method public final hashCode()I
    .locals 3

    .line 1
    const-class v0, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;

    const/4 v1, 0x7

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;->zza:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v2, 0x1

    aput-object v0, v1, v2

    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;->zzb:I

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v2, 0x2

    aput-object v0, v1, v2

    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;->zzc:I

    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v2, 0x3

    aput-object v0, v1, v2

    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;->zzd:I

    .line 4
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v2, 0x4

    aput-object v0, v1, v2

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzdk;

    const/4 v2, 0x5

    aput-object v0, v1, v2

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;->zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzdj;

    const/4 v2, 0x6

    aput-object v0, v1, v2

    .line 5
    invoke-static {v1}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzdk;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;->zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzdj;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;->zzc:I

    iget v3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;->zzd:I

    iget v4, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;->zza:I

    iget v5, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;->zzb:I

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "AesCtrHmacAead Parameters (variant: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", hashType: "

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", "

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "-byte IV, and "

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "-byte tags, and "

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "-byte AES key, and "

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "-byte HMAC key)"

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final zza()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;->zza:I

    return v0
.end method

.method public final zzb()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;->zzb:I

    return v0
.end method

.method public final zzc()Lcom/google/android/gms/internal/firebase-auth-api/zzdk;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzdk;

    return-object v0
.end method

.method public final zzd()Z
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdm;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzdk;

    sget-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zzdk;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzdk;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method
