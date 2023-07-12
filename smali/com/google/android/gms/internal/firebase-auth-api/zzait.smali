.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzait;
.super Lcom/google/android/gms/internal/firebase-auth-api/zzagk;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Lcom/google/android/gms/internal/firebase-auth-api/zzahq;


# static fields
.field private static final zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzait;


# instance fields
.field private zzd:J

.field private zze:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzait;

    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzait;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzait;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzait;

    const-class v1, Lcom/google/android/gms/internal/firebase-auth-api/zzait;

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagk;->zzH(Ljava/lang/Class;Lcom/google/android/gms/internal/firebase-auth-api/zzagk;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagk;-><init>()V

    return-void
.end method

.method public static zzc()Lcom/google/android/gms/internal/firebase-auth-api/zzais;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzait;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzait;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagk;->zzt()Lcom/google/android/gms/internal/firebase-auth-api/zzagg;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzais;

    return-object v0
.end method

.method static synthetic zzd()Lcom/google/android/gms/internal/firebase-auth-api/zzait;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzait;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzait;

    return-object v0
.end method

.method static synthetic zze(Lcom/google/android/gms/internal/firebase-auth-api/zzait;J)V
    .locals 0

    iput-wide p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzait;->zzd:J

    return-void
.end method

.method static synthetic zzf(Lcom/google/android/gms/internal/firebase-auth-api/zzait;I)V
    .locals 0

    iput p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzait;->zze:I

    return-void
.end method


# virtual methods
.method public final zza()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzait;->zze:I

    return v0
.end method

.method public final zzb()J
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzait;->zzd:J

    return-wide v0
.end method

.method protected final zzj(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    add-int/lit8 p1, p1, -0x1

    const/4 p2, 0x1

    if-eqz p1, :cond_4

    const/4 p3, 0x2

    if-eq p1, p3, :cond_3

    const/4 p2, 0x3

    if-eq p1, p2, :cond_2

    const/4 p2, 0x4

    const/4 p3, 0x0

    if-eq p1, p2, :cond_1

    const/4 p2, 0x5

    if-eq p1, p2, :cond_0

    return-object p3

    .line 1
    :cond_0
    sget-object p1, Lcom/google/android/gms/internal/firebase-auth-api/zzait;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzait;

    return-object p1

    :cond_1
    new-instance p1, Lcom/google/android/gms/internal/firebase-auth-api/zzais;

    .line 3
    invoke-direct {p1, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzais;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzair;)V

    return-object p1

    :cond_2
    new-instance p1, Lcom/google/android/gms/internal/firebase-auth-api/zzait;

    invoke-direct {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzait;-><init>()V

    return-object p1

    :cond_3
    new-array p1, p3, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "zzd"

    aput-object v0, p1, p3

    const-string p3, "zze"

    aput-object p3, p1, p2

    .line 2
    sget-object p2, Lcom/google/android/gms/internal/firebase-auth-api/zzait;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzait;

    new-instance p3, Lcom/google/android/gms/internal/firebase-auth-api/zzahz;

    const-string v0, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001\u0002\u0002\u0004"

    invoke-direct {p3, p2, v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzahz;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzahp;Ljava/lang/String;[Ljava/lang/Object;)V

    return-object p3

    .line 1
    :cond_4
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1
.end method
