.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzqg;
.super Lcom/google/android/gms/internal/firebase-auth-api/zzagk;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Lcom/google/android/gms/internal/firebase-auth-api/zzahq;


# static fields
.field private static final zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzqg;


# instance fields
.field private zzd:I

.field private zze:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzqg;

    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzqg;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzqg;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzqg;

    const-class v1, Lcom/google/android/gms/internal/firebase-auth-api/zzqg;

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagk;->zzH(Ljava/lang/Class;Lcom/google/android/gms/internal/firebase-auth-api/zzagk;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagk;-><init>()V

    return-void
.end method

.method public static zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzqf;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzqg;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzqg;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagk;->zzt()Lcom/google/android/gms/internal/firebase-auth-api/zzagg;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzqf;

    return-object v0
.end method

.method static synthetic zzc()Lcom/google/android/gms/internal/firebase-auth-api/zzqg;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzqg;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzqg;

    return-object v0
.end method

.method public static zzd(Lcom/google/android/gms/internal/firebase-auth-api/zzaff;Lcom/google/android/gms/internal/firebase-auth-api/zzafx;)Lcom/google/android/gms/internal/firebase-auth-api/zzqg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/firebase-auth-api/zzags;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzqg;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzqg;

    invoke-static {v0, p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagk;->zzx(Lcom/google/android/gms/internal/firebase-auth-api/zzagk;Lcom/google/android/gms/internal/firebase-auth-api/zzaff;Lcom/google/android/gms/internal/firebase-auth-api/zzafx;)Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/firebase-auth-api/zzqg;

    return-object p0
.end method

.method static synthetic zze(Lcom/google/android/gms/internal/firebase-auth-api/zzqg;I)V
    .locals 0

    const/16 p1, 0x40

    iput p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzqg;->zzd:I

    return-void
.end method


# virtual methods
.method public final zza()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzqg;->zzd:I

    return v0
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
    sget-object p1, Lcom/google/android/gms/internal/firebase-auth-api/zzqg;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzqg;

    return-object p1

    :cond_1
    new-instance p1, Lcom/google/android/gms/internal/firebase-auth-api/zzqf;

    .line 3
    invoke-direct {p1, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzqf;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzqe;)V

    return-object p1

    :cond_2
    new-instance p1, Lcom/google/android/gms/internal/firebase-auth-api/zzqg;

    invoke-direct {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzqg;-><init>()V

    return-object p1

    :cond_3
    new-array p1, p3, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "zzd"

    aput-object v0, p1, p3

    const-string p3, "zze"

    aput-object p3, p1, p2

    .line 2
    sget-object p2, Lcom/google/android/gms/internal/firebase-auth-api/zzqg;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzqg;

    const-string p3, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001\u000b\u0002\u000b"

    invoke-static {p2, p3, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzqg;->zzE(Lcom/google/android/gms/internal/firebase-auth-api/zzahp;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 1
    :cond_4
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1
.end method
