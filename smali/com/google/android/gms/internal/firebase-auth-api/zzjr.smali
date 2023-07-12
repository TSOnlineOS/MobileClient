.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzjr;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"


# static fields
.field public static final synthetic zza:I

.field private static final zzb:Ljava/lang/Object;

.field private static final zzc:Ljava/lang/String;


# instance fields
.field private final zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzca;

.field private final zze:Lcom/google/android/gms/internal/firebase-auth-api/zzbd;

.field private final zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzbz;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzjr;->zzb:Ljava/lang/Object;

    const-class v0, Lcom/google/android/gms/internal/firebase-auth-api/zzjr;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzjr;->zzc:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzjp;Lcom/google/android/gms/internal/firebase-auth-api/zzjq;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p2, Lcom/google/android/gms/internal/firebase-auth-api/zzju;

    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzjp;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzjp;)Landroid/content/Context;

    move-result-object v0

    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzjp;->zzh(Lcom/google/android/gms/internal/firebase-auth-api/zzjp;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzjp;->zzi(Lcom/google/android/gms/internal/firebase-auth-api/zzjp;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p2, v0, v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzju;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    iput-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzjr;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzca;

    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzjp;->zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzjp;)Lcom/google/android/gms/internal/firebase-auth-api/zzbd;

    move-result-object p2

    iput-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzjr;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzbd;

    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzjp;->zzc(Lcom/google/android/gms/internal/firebase-auth-api/zzjp;)Lcom/google/android/gms/internal/firebase-auth-api/zzbz;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzjr;->zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzbz;

    return-void
.end method

.method static bridge synthetic zzb()Ljava/lang/Object;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzjr;->zzb:Ljava/lang/Object;

    return-object v0
.end method

.method static bridge synthetic zzc()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzjr;->zzc:Ljava/lang/String;

    return-object v0
.end method

.method static bridge synthetic zzd()Z
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public final declared-synchronized zza()Lcom/google/android/gms/internal/firebase-auth-api/zzby;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    monitor-enter p0

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzjr;->zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzbz;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzbz;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzby;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
