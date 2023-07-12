.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzhw;
.super Lcom/google/android/gms/internal/firebase-auth-api/zzie;
.source "com.google.firebase:firebase-auth@@22.0.0"


# instance fields
.field private final zza:I

.field private final zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzhu;


# direct methods
.method synthetic constructor <init>(ILcom/google/android/gms/internal/firebase-auth-api/zzhu;Lcom/google/android/gms/internal/firebase-auth-api/zzhv;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzie;-><init>()V

    iput p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzhw;->zza:I

    iput-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzhw;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzhu;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzhw;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzhw;

    iget v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzhw;->zza:I

    iget v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzhw;->zza:I

    if-ne v0, v2, :cond_1

    iget-object p1, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzhw;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzhu;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzhw;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzhu;

    if-ne p1, v0, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    return v1
.end method

.method public final hashCode()I
    .locals 3

    .line 1
    const-class v0, Lcom/google/android/gms/internal/firebase-auth-api/zzhw;

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzhw;->zza:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v2, 0x1

    aput-object v0, v1, v2

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzhw;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzhu;

    const/4 v2, 0x2

    aput-object v0, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzhw;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzhu;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzhw;->zza:I

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "AesSiv Parameters (variant: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "-byte key)"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final zza()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzhw;->zza:I

    return v0
.end method

.method public final zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzhu;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzhw;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzhu;

    return-object v0
.end method

.method public final zzc()Z
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzhw;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzhu;

    sget-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zzhu;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzhu;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method
