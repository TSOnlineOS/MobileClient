.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzrd;
.super Lcom/google/android/gms/internal/firebase-auth-api/zzagk;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Lcom/google/android/gms/internal/firebase-auth-api/zzahq;


# static fields
.field private static final zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzrd;


# instance fields
.field private zzd:I

.field private zze:Lcom/google/android/gms/internal/firebase-auth-api/zzqx;

.field private zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

.field private zzg:Lcom/google/android/gms/internal/firebase-auth-api/zzaff;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzrd;

    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzrd;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzrd;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzrd;

    const-class v1, Lcom/google/android/gms/internal/firebase-auth-api/zzrd;

    .line 2
    invoke-static {v1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagk;->zzH(Ljava/lang/Class;Lcom/google/android/gms/internal/firebase-auth-api/zzagk;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagk;-><init>()V

    .line 2
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaff;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    iput-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzrd;->zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaff;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    iput-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzrd;->zzg:Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    return-void
.end method

.method public static zzc()Lcom/google/android/gms/internal/firebase-auth-api/zzrc;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzrd;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzrd;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagk;->zzt()Lcom/google/android/gms/internal/firebase-auth-api/zzagg;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzrc;

    return-object v0
.end method

.method static synthetic zzd()Lcom/google/android/gms/internal/firebase-auth-api/zzrd;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzrd;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzrd;

    return-object v0
.end method

.method public static zze()Lcom/google/android/gms/internal/firebase-auth-api/zzrd;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzrd;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzrd;

    return-object v0
.end method

.method public static zzf(Lcom/google/android/gms/internal/firebase-auth-api/zzaff;Lcom/google/android/gms/internal/firebase-auth-api/zzafx;)Lcom/google/android/gms/internal/firebase-auth-api/zzrd;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/firebase-auth-api/zzags;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzrd;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzrd;

    invoke-static {v0, p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagk;->zzx(Lcom/google/android/gms/internal/firebase-auth-api/zzagk;Lcom/google/android/gms/internal/firebase-auth-api/zzaff;Lcom/google/android/gms/internal/firebase-auth-api/zzafx;)Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/firebase-auth-api/zzrd;

    return-object p0
.end method

.method static synthetic zzi(Lcom/google/android/gms/internal/firebase-auth-api/zzrd;I)V
    .locals 0

    const/4 p1, 0x0

    iput p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzrd;->zzd:I

    return-void
.end method

.method static synthetic zzk(Lcom/google/android/gms/internal/firebase-auth-api/zzrd;Lcom/google/android/gms/internal/firebase-auth-api/zzqx;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzrd;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzqx;

    return-void
.end method

.method static synthetic zzl(Lcom/google/android/gms/internal/firebase-auth-api/zzrd;Lcom/google/android/gms/internal/firebase-auth-api/zzaff;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzrd;->zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    return-void
.end method

.method static synthetic zzm(Lcom/google/android/gms/internal/firebase-auth-api/zzrd;Lcom/google/android/gms/internal/firebase-auth-api/zzaff;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzrd;->zzg:Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    return-void
.end method


# virtual methods
.method public final zza()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzrd;->zzd:I

    return v0
.end method

.method public final zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzqx;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzrd;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzqx;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzqx;->zzd()Lcom/google/android/gms/internal/firebase-auth-api/zzqx;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public final zzg()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzrd;->zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    return-object v0
.end method

.method public final zzh()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzrd;->zzg:Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    return-object v0
.end method

.method protected final zzj(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    add-int/lit8 p1, p1, -0x1

    const/4 p2, 0x1

    if-eqz p1, :cond_4

    const/4 p3, 0x4

    const/4 v0, 0x3

    const/4 v1, 0x2

    if-eq p1, v1, :cond_3

    if-eq p1, v0, :cond_2

    const/4 p2, 0x0

    if-eq p1, p3, :cond_1

    const/4 p3, 0x5

    if-eq p1, p3, :cond_0

    return-object p2

    .line 1
    :cond_0
    sget-object p1, Lcom/google/android/gms/internal/firebase-auth-api/zzrd;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzrd;

    return-object p1

    :cond_1
    new-instance p1, Lcom/google/android/gms/internal/firebase-auth-api/zzrc;

    .line 3
    invoke-direct {p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzrc;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzrb;)V

    return-object p1

    :cond_2
    new-instance p1, Lcom/google/android/gms/internal/firebase-auth-api/zzrd;

    .line 4
    invoke-direct {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzrd;-><init>()V

    return-object p1

    :cond_3
    new-array p1, p3, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v2, "zzd"

    aput-object v2, p1, p3

    const-string p3, "zze"

    aput-object p3, p1, p2

    const-string p2, "zzf"

    aput-object p2, p1, v1

    const-string p2, "zzg"

    aput-object p2, p1, v0

    .line 2
    sget-object p2, Lcom/google/android/gms/internal/firebase-auth-api/zzrd;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzrd;

    const-string p3, "\u0000\u0004\u0000\u0000\u0001\u0004\u0004\u0000\u0000\u0000\u0001\u000b\u0002\t\u0003\n\u0004\n"

    invoke-static {p2, p3, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzrd;->zzE(Lcom/google/android/gms/internal/firebase-auth-api/zzahp;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 1
    :cond_4
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1
.end method
