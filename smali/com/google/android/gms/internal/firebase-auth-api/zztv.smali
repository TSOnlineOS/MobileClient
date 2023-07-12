.class public final enum Lcom/google/android/gms/internal/firebase-auth-api/zztv;
.super Ljava/lang/Enum;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Lcom/google/android/gms/internal/firebase-auth-api/zzagm;


# static fields
.field public static final enum zza:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

.field public static final enum zzb:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

.field public static final enum zzc:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

.field public static final enum zzd:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

.field public static final enum zze:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

.field public static final enum zzf:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

.field private static final zzg:Lcom/google/android/gms/internal/firebase-auth-api/zzagn;

.field private static final synthetic zzh:[Lcom/google/android/gms/internal/firebase-auth-api/zztv;


# instance fields
.field private final zzi:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    const-string v1, "UNKNOWN_PREFIX"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zztv;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    const-string v1, "TINK"

    const/4 v3, 0x1

    .line 2
    invoke-direct {v0, v1, v3, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zztv;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    const-string v1, "LEGACY"

    const/4 v4, 0x2

    .line 3
    invoke-direct {v0, v1, v4, v4}, Lcom/google/android/gms/internal/firebase-auth-api/zztv;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    const-string v1, "RAW"

    const/4 v5, 0x3

    .line 4
    invoke-direct {v0, v1, v5, v5}, Lcom/google/android/gms/internal/firebase-auth-api/zztv;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    const-string v1, "CRUNCHY"

    const/4 v6, 0x4

    .line 5
    invoke-direct {v0, v1, v6, v6}, Lcom/google/android/gms/internal/firebase-auth-api/zztv;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    const-string v1, "UNRECOGNIZED"

    const/4 v7, 0x5

    const/4 v8, -0x1

    .line 6
    invoke-direct {v0, v1, v7, v8}, Lcom/google/android/gms/internal/firebase-auth-api/zztv;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzf:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    const/4 v1, 0x6

    new-array v1, v1, [Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    sget-object v8, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    aput-object v8, v1, v2

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    aput-object v2, v1, v3

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    aput-object v2, v1, v4

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    aput-object v2, v1, v5

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    aput-object v2, v1, v6

    aput-object v0, v1, v7

    sput-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzh:[Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zztu;

    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zztu;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzg:Lcom/google/android/gms/internal/firebase-auth-api/zzagn;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzi:I

    return-void
.end method

.method public static values()[Lcom/google/android/gms/internal/firebase-auth-api/zztv;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzh:[Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    invoke-virtual {v0}, [Lcom/google/android/gms/internal/firebase-auth-api/zztv;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    return-object v0
.end method

.method public static zzb(I)Lcom/google/android/gms/internal/firebase-auth-api/zztv;
    .locals 1

    if-eqz p0, :cond_4

    const/4 v0, 0x1

    if-eq p0, v0, :cond_3

    const/4 v0, 0x2

    if-eq p0, v0, :cond_2

    const/4 v0, 0x3

    if-eq p0, v0, :cond_1

    const/4 v0, 0x4

    if-eq p0, v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    sget-object p0, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    return-object p0

    :cond_1
    sget-object p0, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    return-object p0

    :cond_2
    sget-object p0, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    return-object p0

    :cond_3
    sget-object p0, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    return-object p0

    :cond_4
    sget-object p0, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    return-object p0
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zza()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final zza()I
    .locals 2

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzf:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    if-eq p0, v0, :cond_0

    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzi:I

    return v0

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Can\'t get the number of an unknown enum value."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
