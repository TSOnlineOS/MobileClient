.class final Lcom/google/android/gms/internal/firebase-auth-api/zzafq;
.super Lcom/google/android/gms/internal/firebase-auth-api/zzafn;
.source "com.google.firebase:firebase-auth@@22.0.0"


# instance fields
.field private final zzg:Ljava/io/OutputStream;


# direct methods
.method constructor <init>(Ljava/io/OutputStream;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzafn;-><init>(I)V

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzg:Ljava/io/OutputStream;

    return-void
.end method

.method private final zzG()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzg:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zza:[B

    iget v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzc:I

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/OutputStream;->write([BII)V

    iput v3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzc:I

    return-void
.end method

.method private final zzH(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzb:I

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzc:I

    sub-int/2addr v0, v1

    if-ge v0, p1, :cond_0

    invoke-direct {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzG()V

    :cond_0
    return-void
.end method


# virtual methods
.method public final zzI()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzc:I

    if-lez v0, :cond_0

    invoke-direct {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzG()V

    :cond_0
    return-void
.end method

.method public final zzJ(B)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzc:I

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzb:I

    if-ne v0, v1, :cond_0

    invoke-direct {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzG()V

    .line 2
    :cond_0
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafn;->zzc(B)V

    return-void
.end method

.method public final zzK(IZ)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0xb

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzH(I)V

    shl-int/lit8 p1, p1, 0x3

    .line 2
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafn;->zzf(I)V

    .line 3
    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzafn;->zzc(B)V

    return-void
.end method

.method public final zzL(ILcom/google/android/gms/internal/firebase-auth-api/zzaff;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    shl-int/lit8 p1, p1, 0x3

    or-int/lit8 p1, p1, 0x2

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzs(I)V

    .line 2
    invoke-virtual {p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaff;->zzd()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzs(I)V

    .line 3
    invoke-virtual {p2, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaff;->zzj(Lcom/google/android/gms/internal/firebase-auth-api/zzaev;)V

    return-void
.end method

.method public final zza([BII)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 p2, 0x0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzp([BII)V

    return-void
.end method

.method public final zzh(II)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0xe

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzH(I)V

    shl-int/lit8 p1, p1, 0x3

    or-int/lit8 p1, p1, 0x5

    .line 2
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafn;->zzf(I)V

    .line 3
    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzafn;->zzd(I)V

    return-void
.end method

.method public final zzi(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x4

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzH(I)V

    .line 2
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafn;->zzd(I)V

    return-void
.end method

.method public final zzj(IJ)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x12

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzH(I)V

    shl-int/lit8 p1, p1, 0x3

    or-int/lit8 p1, p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafn;->zzf(I)V

    .line 3
    invoke-virtual {p0, p2, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzafn;->zze(J)V

    return-void
.end method

.method public final zzk(J)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x8

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzH(I)V

    .line 2
    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzafn;->zze(J)V

    return-void
.end method

.method public final zzl(II)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x14

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzH(I)V

    shl-int/lit8 p1, p1, 0x3

    .line 2
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafn;->zzf(I)V

    if-ltz p2, :cond_0

    .line 3
    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzafn;->zzf(I)V

    return-void

    :cond_0
    int-to-long p1, p2

    .line 4
    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzafn;->zzg(J)V

    return-void
.end method

.method public final zzm(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-ltz p1, :cond_0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzs(I)V

    return-void

    :cond_0
    int-to-long v0, p1

    .line 2
    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzu(J)V

    return-void
.end method

.method final zzn(ILcom/google/android/gms/internal/firebase-auth-api/zzahp;Lcom/google/android/gms/internal/firebase-auth-api/zzaib;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    shl-int/lit8 p1, p1, 0x3

    or-int/lit8 p1, p1, 0x2

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzs(I)V

    .line 2
    move-object p1, p2

    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzaep;

    invoke-virtual {p1, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzaep;->zzn(Lcom/google/android/gms/internal/firebase-auth-api/zzaib;)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzs(I)V

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzaft;

    .line 3
    invoke-interface {p3, p2, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaib;->zzm(Ljava/lang/Object;Lcom/google/android/gms/internal/firebase-auth-api/zzaft;)V

    return-void
.end method

.method public final zzo(ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    shl-int/lit8 p1, p1, 0x3

    or-int/lit8 p1, p1, 0x2

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzs(I)V

    .line 2
    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzv(Ljava/lang/String;)V

    return-void
.end method

.method public final zzp([BII)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzb:I

    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzc:I

    sub-int/2addr p2, v0

    const/4 v1, 0x0

    if-lt p2, p3, :cond_0

    iget-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zza:[B

    invoke-static {p1, v1, p2, v0, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzc:I

    add-int/2addr p1, p3

    iput p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzc:I

    iget p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzd:I

    add-int/2addr p1, p3

    iput p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzd:I

    return-void

    :cond_0
    iget-object v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zza:[B

    .line 2
    invoke-static {p1, v1, v2, v0, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzb:I

    iput v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzc:I

    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzd:I

    add-int/2addr v0, p2

    iput v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzd:I

    .line 3
    invoke-direct {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzG()V

    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzb:I

    sub-int/2addr p3, p2

    if-gt p3, v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zza:[B

    .line 4
    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iput p3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzc:I

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzg:Ljava/io/OutputStream;

    .line 5
    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 4
    :goto_0
    iget p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzd:I

    add-int/2addr p1, p3

    iput p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzd:I

    return-void
.end method

.method public final zzq(II)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    shl-int/lit8 p1, p1, 0x3

    or-int/2addr p1, p2

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzs(I)V

    return-void
.end method

.method public final zzr(II)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x14

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzH(I)V

    shl-int/lit8 p1, p1, 0x3

    .line 2
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafn;->zzf(I)V

    .line 3
    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzafn;->zzf(I)V

    return-void
.end method

.method public final zzs(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x5

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzH(I)V

    .line 2
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafn;->zzf(I)V

    return-void
.end method

.method public final zzt(IJ)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x14

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzH(I)V

    shl-int/lit8 p1, p1, 0x3

    .line 2
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafn;->zzf(I)V

    .line 3
    invoke-virtual {p0, p2, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzafn;->zzg(J)V

    return-void
.end method

.method public final zzu(J)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0xa

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzH(I)V

    .line 2
    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzafn;->zzg(J)V

    return-void
.end method

.method public final zzv(Ljava/lang/String;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    mul-int/lit8 v0, v0, 0x3

    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzA(I)I

    move-result v1

    add-int v2, v1, v0

    iget v3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzb:I

    if-le v2, v3, :cond_0

    .line 11
    new-array v1, v0, [B

    const/4 v2, 0x0

    .line 12
    invoke-static {p1, v1, v2, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzajk;->zzb(Ljava/lang/CharSequence;[BII)I

    move-result v0

    .line 13
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzs(I)V

    .line 14
    invoke-virtual {p0, v1, v2, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzp([BII)V

    return-void

    :cond_0
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzc:I

    sub-int/2addr v3, v0

    if-le v2, v3, :cond_1

    .line 2
    invoke-direct {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzG()V

    .line 3
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzA(I)I

    move-result v0

    iget v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzc:I
    :try_end_0
    .catch Lcom/google/android/gms/internal/firebase-auth-api/zzajj; {:try_start_0 .. :try_end_0} :catch_2

    if-ne v0, v1, :cond_2

    add-int v1, v2, v0

    :try_start_1
    iput v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzc:I

    iget-object v3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zza:[B

    iget v4, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzb:I

    sub-int/2addr v4, v1

    .line 4
    invoke-static {p1, v3, v1, v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzajk;->zzb(Ljava/lang/CharSequence;[BII)I

    move-result v1

    iput v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzc:I

    sub-int v3, v1, v2

    sub-int/2addr v3, v0

    .line 5
    invoke-virtual {p0, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzafn;->zzf(I)V

    iput v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzc:I

    goto :goto_0

    .line 6
    :cond_2
    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzajk;->zzc(Ljava/lang/CharSequence;)I

    move-result v3

    .line 7
    invoke-virtual {p0, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzafn;->zzf(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zza:[B

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzc:I

    .line 8
    invoke-static {p1, v0, v1, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzajk;->zzb(Ljava/lang/CharSequence;[BII)I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzc:I

    .line 5
    :goto_0
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzd:I

    add-int/2addr v0, v3

    iput v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzd:I
    :try_end_1
    .catch Lcom/google/android/gms/internal/firebase-auth-api/zzajj; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 10
    :try_start_2
    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzafp;

    .line 9
    invoke-direct {v1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafp;-><init>(Ljava/lang/Throwable;)V

    throw v1

    :catch_1
    move-exception v0

    .line 15
    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzd:I

    iget v3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzc:I

    sub-int/2addr v3, v2

    sub-int/2addr v1, v3

    iput v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzd:I

    iput v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzafq;->zzc:I

    .line 10
    throw v0
    :try_end_2
    .catch Lcom/google/android/gms/internal/firebase-auth-api/zzajj; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    move-exception v0

    .line 15
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafs;->zzE(Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzajj;)V

    return-void
.end method
