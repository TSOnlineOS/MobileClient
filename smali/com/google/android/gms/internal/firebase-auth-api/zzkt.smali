.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzkt;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"


# static fields
.field private static final zza:Lcom/google/android/gms/internal/firebase-auth-api/zzkt;


# instance fields
.field private final zzb:Ljava/util/concurrent/atomic/AtomicReference;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzkt;

    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzkt;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzkt;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzkt;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzlq;

    invoke-direct {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzlq;-><init>()V

    new-instance v2, Lcom/google/android/gms/internal/firebase-auth-api/zzlw;

    const/4 v3, 0x0

    .line 2
    invoke-direct {v2, v1, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzlw;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzlq;Lcom/google/android/gms/internal/firebase-auth-api/zzlv;)V

    .line 3
    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzkt;->zzb:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method

.method public static zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzkt;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzkt;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzkt;

    return-object v0
.end method


# virtual methods
.method public final zza(Lcom/google/android/gms/internal/firebase-auth-api/zzln;Lcom/google/android/gms/internal/firebase-auth-api/zzcr;)Lcom/google/android/gms/internal/firebase-auth-api/zzbl;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzkt;->zzb:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzlw;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzlw;->zzf(Lcom/google/android/gms/internal/firebase-auth-api/zzlp;)Z

    move-result v0

    if-nez v0, :cond_0

    :try_start_0
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzkl;

    .line 3
    invoke-direct {v0, p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzkl;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzln;Lcom/google/android/gms/internal/firebase-auth-api/zzcr;)V
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p1

    new-instance p2, Lcom/google/android/gms/internal/firebase-auth-api/zzlx;

    const-string v0, "Creating a LegacyProtoKey failed"

    .line 4
    invoke-direct {p2, v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzlx;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzkt;->zzb:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzlw;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzlw;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzlp;Lcom/google/android/gms/internal/firebase-auth-api/zzcr;)Lcom/google/android/gms/internal/firebase-auth-api/zzbl;

    move-result-object p1

    return-object p1
.end method

.method public final declared-synchronized zzc(Lcom/google/android/gms/internal/firebase-auth-api/zzkc;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    monitor-enter p0

    .line 1
    :try_start_0
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzlq;

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzkt;->zzb:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/firebase-auth-api/zzlw;

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzlq;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzlw;)V

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzlq;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzkc;)Lcom/google/android/gms/internal/firebase-auth-api/zzlq;

    new-instance p1, Lcom/google/android/gms/internal/firebase-auth-api/zzlw;

    const/4 v1, 0x0

    .line 2
    invoke-direct {p1, v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzlw;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzlq;Lcom/google/android/gms/internal/firebase-auth-api/zzlv;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzkt;->zzb:Ljava/util/concurrent/atomic/AtomicReference;

    .line 3
    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final declared-synchronized zzd(Lcom/google/android/gms/internal/firebase-auth-api/zzkg;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    monitor-enter p0

    .line 1
    :try_start_0
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzlq;

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzkt;->zzb:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/firebase-auth-api/zzlw;

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzlq;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzlw;)V

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzlq;->zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzkg;)Lcom/google/android/gms/internal/firebase-auth-api/zzlq;

    new-instance p1, Lcom/google/android/gms/internal/firebase-auth-api/zzlw;

    const/4 v1, 0x0

    .line 2
    invoke-direct {p1, v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzlw;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzlq;Lcom/google/android/gms/internal/firebase-auth-api/zzlv;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzkt;->zzb:Ljava/util/concurrent/atomic/AtomicReference;

    .line 3
    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final declared-synchronized zze(Lcom/google/android/gms/internal/firebase-auth-api/zzkx;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    monitor-enter p0

    .line 1
    :try_start_0
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzlq;

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzkt;->zzb:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/firebase-auth-api/zzlw;

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzlq;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzlw;)V

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzlq;->zzc(Lcom/google/android/gms/internal/firebase-auth-api/zzkx;)Lcom/google/android/gms/internal/firebase-auth-api/zzlq;

    new-instance p1, Lcom/google/android/gms/internal/firebase-auth-api/zzlw;

    const/4 v1, 0x0

    .line 2
    invoke-direct {p1, v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzlw;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzlq;Lcom/google/android/gms/internal/firebase-auth-api/zzlv;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzkt;->zzb:Ljava/util/concurrent/atomic/AtomicReference;

    .line 3
    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final declared-synchronized zzf(Lcom/google/android/gms/internal/firebase-auth-api/zzlb;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    monitor-enter p0

    .line 1
    :try_start_0
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzlq;

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzkt;->zzb:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/firebase-auth-api/zzlw;

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzlq;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzlw;)V

    .line 2
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzlq;->zzd(Lcom/google/android/gms/internal/firebase-auth-api/zzlb;)Lcom/google/android/gms/internal/firebase-auth-api/zzlq;

    new-instance p1, Lcom/google/android/gms/internal/firebase-auth-api/zzlw;

    const/4 v1, 0x0

    .line 3
    invoke-direct {p1, v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzlw;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzlq;Lcom/google/android/gms/internal/firebase-auth-api/zzlv;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzkt;->zzb:Ljava/util/concurrent/atomic/AtomicReference;

    .line 4
    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
