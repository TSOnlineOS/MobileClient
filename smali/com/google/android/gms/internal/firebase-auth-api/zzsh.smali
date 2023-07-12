.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzsh;
.super Lcom/google/android/gms/internal/firebase-auth-api/zzagk;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Lcom/google/android/gms/internal/firebase-auth-api/zzahq;


# static fields
.field private static final zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzsh;


# instance fields
.field private zzd:I

.field private zze:Lcom/google/android/gms/internal/firebase-auth-api/zzsk;

.field private zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzaff;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzsh;

    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzsh;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzsh;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzsh;

    const-class v1, Lcom/google/android/gms/internal/firebase-auth-api/zzsh;

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

    iput-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzsh;->zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    return-void
.end method

.method public static zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzsg;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzsh;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzsh;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagk;->zzt()Lcom/google/android/gms/internal/firebase-auth-api/zzagg;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzsg;

    return-object v0
.end method

.method static synthetic zzc()Lcom/google/android/gms/internal/firebase-auth-api/zzsh;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzsh;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzsh;

    return-object v0
.end method

.method public static zzd(Lcom/google/android/gms/internal/firebase-auth-api/zzaff;Lcom/google/android/gms/internal/firebase-auth-api/zzafx;)Lcom/google/android/gms/internal/firebase-auth-api/zzsh;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/firebase-auth-api/zzags;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzsh;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzsh;

    invoke-static {v0, p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagk;->zzx(Lcom/google/android/gms/internal/firebase-auth-api/zzagk;Lcom/google/android/gms/internal/firebase-auth-api/zzaff;Lcom/google/android/gms/internal/firebase-auth-api/zzafx;)Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/firebase-auth-api/zzsh;

    return-object p0
.end method

.method static synthetic zzg(Lcom/google/android/gms/internal/firebase-auth-api/zzsh;I)V
    .locals 0

    const/4 p1, 0x0

    iput p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzsh;->zzd:I

    return-void
.end method

.method static synthetic zzh(Lcom/google/android/gms/internal/firebase-auth-api/zzsh;Lcom/google/android/gms/internal/firebase-auth-api/zzsk;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzsh;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzsk;

    return-void
.end method

.method static synthetic zzi(Lcom/google/android/gms/internal/firebase-auth-api/zzsh;Lcom/google/android/gms/internal/firebase-auth-api/zzaff;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzsh;->zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    return-void
.end method


# virtual methods
.method public final zza()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzsh;->zzd:I

    return v0
.end method

.method public final zze()Lcom/google/android/gms/internal/firebase-auth-api/zzsk;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzsh;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzsk;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzsk;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zzsk;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public final zzf()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzsh;->zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    return-object v0
.end method

.method protected final zzj(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    add-int/lit8 p1, p1, -0x1

    const/4 p2, 0x1

    if-eqz p1, :cond_4

    const/4 p3, 0x3

    const/4 v0, 0x2

    if-eq p1, v0, :cond_3

    if-eq p1, p3, :cond_2

    const/4 p2, 0x4

    const/4 p3, 0x0

    if-eq p1, p2, :cond_1

    const/4 p2, 0x5

    if-eq p1, p2, :cond_0

    return-object p3

    .line 1
    :cond_0
    sget-object p1, Lcom/google/android/gms/internal/firebase-auth-api/zzsh;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzsh;

    return-object p1

    :cond_1
    new-instance p1, Lcom/google/android/gms/internal/firebase-auth-api/zzsg;

    .line 3
    invoke-direct {p1, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzsg;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzsf;)V

    return-object p1

    :cond_2
    new-instance p1, Lcom/google/android/gms/internal/firebase-auth-api/zzsh;

    .line 4
    invoke-direct {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzsh;-><init>()V

    return-object p1

    :cond_3
    new-array p1, p3, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v1, "zzd"

    aput-object v1, p1, p3

    const-string p3, "zze"

    aput-object p3, p1, p2

    const-string p2, "zzf"

    aput-object p2, p1, v0

    .line 2
    sget-object p2, Lcom/google/android/gms/internal/firebase-auth-api/zzsh;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzsh;

    const-string p3, "\u0000\u0003\u0000\u0000\u0001\u0003\u0003\u0000\u0000\u0000\u0001\u000b\u0002\t\u0003\n"

    invoke-static {p2, p3, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzsh;->zzE(Lcom/google/android/gms/internal/firebase-auth-api/zzahp;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 1
    :cond_4
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1
.end method

.method public final zzk()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzsh;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzsk;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method
