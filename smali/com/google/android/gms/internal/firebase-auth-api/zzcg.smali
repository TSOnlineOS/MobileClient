.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzcg;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"


# instance fields
.field private final zza:Ljava/lang/Class;

.field private zzb:Ljava/util/concurrent/ConcurrentMap;

.field private final zzc:Ljava/util/List;

.field private zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzch;

.field private zze:Lcom/google/android/gms/internal/firebase-auth-api/zznz;


# direct methods
.method synthetic constructor <init>(Ljava/lang/Class;Lcom/google/android/gms/internal/firebase-auth-api/zzcf;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p2, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {p2}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzcg;->zzb:Ljava/util/concurrent/ConcurrentMap;

    new-instance p2, Ljava/util/ArrayList;

    .line 2
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzcg;->zzc:Ljava/util/List;

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzcg;->zza:Ljava/lang/Class;

    .line 3
    sget-object p1, Lcom/google/android/gms/internal/firebase-auth-api/zznz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zznz;

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzcg;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zznz;

    return-void
.end method

.method private final zze(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/firebase-auth-api/zztb;Z)Lcom/google/android/gms/internal/firebase-auth-api/zzcg;
    .locals 12
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    move-object v0, p0

    .line 1
    iget-object v1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzcg;->zzb:Ljava/util/concurrent/ConcurrentMap;

    if-eqz v1, :cond_b

    if-nez p1, :cond_1

    if-eqz p2, :cond_0

    goto :goto_0

    .line 37
    :cond_0
    new-instance v1, Ljava/security/GeneralSecurityException;

    const-string v2, "at least one of the `fullPrimitive` or `primitive` must be set"

    invoke-direct {v1, v2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 2
    :cond_1
    :goto_0
    invoke-virtual {p3}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zzk()I

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_a

    .line 3
    invoke-virtual {p3}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zza()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 4
    invoke-virtual {p3}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    move-result-object v3

    sget-object v4, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    const/4 v11, 0x0

    if-ne v3, v4, :cond_2

    move-object v1, v11

    .line 5
    :cond_2
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzkt;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzkt;

    move-result-object v3

    .line 6
    invoke-virtual {p3}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzsp;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzsp;->zzf()Ljava/lang/String;

    move-result-object v4

    .line 7
    invoke-virtual {p3}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzsp;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/android/gms/internal/firebase-auth-api/zzsp;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zzaff;

    move-result-object v5

    .line 8
    invoke-virtual {p3}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzsp;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/android/gms/internal/firebase-auth-api/zzsp;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzso;

    move-result-object v6

    .line 9
    invoke-virtual {p3}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    move-result-object v7

    .line 10
    invoke-static {v4, v5, v6, v7, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzln;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaff;Lcom/google/android/gms/internal/firebase-auth-api/zzso;Lcom/google/android/gms/internal/firebase-auth-api/zztv;Ljava/lang/Integer;)Lcom/google/android/gms/internal/firebase-auth-api/zzln;

    move-result-object v1

    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzcr;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzcr;

    move-result-object v4

    .line 11
    invoke-virtual {v3, v1, v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzkt;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzln;Lcom/google/android/gms/internal/firebase-auth-api/zzcr;)Lcom/google/android/gms/internal/firebase-auth-api/zzbl;

    move-result-object v10

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzch;

    .line 12
    invoke-virtual {p3}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/internal/firebase-auth-api/zztv;->ordinal()I

    move-result v3

    const/4 v4, 0x5

    const/4 v5, 0x1

    if-eq v3, v5, :cond_6

    const/4 v5, 0x2

    if-eq v3, v5, :cond_5

    if-eq v3, v2, :cond_4

    const/4 v2, 0x4

    if-ne v3, v2, :cond_3

    goto :goto_1

    .line 35
    :cond_3
    new-instance v1, Ljava/security/GeneralSecurityException;

    const-string v2, "unknown output prefix type"

    invoke-direct {v1, v2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 34
    :cond_4
    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzbh;->zza:[B

    goto :goto_2

    .line 17
    :cond_5
    :goto_1
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    const/4 v3, 0x0

    .line 18
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 19
    invoke-virtual {p3}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zza()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 20
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    goto :goto_2

    .line 13
    :cond_6
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 14
    invoke-virtual {v2, v5}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 15
    invoke-virtual {p3}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zza()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 16
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    :goto_2
    move-object v5, v2

    .line 21
    invoke-virtual {p3}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zzk()I

    move-result v6

    .line 22
    invoke-virtual {p3}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zztv;

    move-result-object v7

    .line 23
    invoke-virtual {p3}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zza()I

    move-result v8

    .line 24
    invoke-virtual {p3}, Lcom/google/android/gms/internal/firebase-auth-api/zztb;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzsp;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzsp;->zzf()Ljava/lang/String;

    move-result-object v9

    move-object v2, v1

    move-object v3, p1

    move-object v4, p2

    invoke-direct/range {v2 .. v10}, Lcom/google/android/gms/internal/firebase-auth-api/zzch;-><init>(Ljava/lang/Object;Ljava/lang/Object;[BILcom/google/android/gms/internal/firebase-auth-api/zztv;ILjava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzbl;)V

    iget-object v2, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzcg;->zzb:Ljava/util/concurrent/ConcurrentMap;

    iget-object v3, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzcg;->zzc:Ljava/util/List;

    new-instance v4, Ljava/util/ArrayList;

    .line 25
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 26
    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v5, Lcom/google/android/gms/internal/firebase-auth-api/zzcj;

    .line 27
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzch;->zzg()[B

    move-result-object v6

    invoke-direct {v5, v6, v11}, Lcom/google/android/gms/internal/firebase-auth-api/zzcj;-><init>([BLcom/google/android/gms/internal/firebase-auth-api/zzci;)V

    .line 28
    invoke-static {v4}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v2, v5, v4}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    if-eqz v4, :cond_7

    new-instance v6, Ljava/util/ArrayList;

    .line 29
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 30
    invoke-interface {v6, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 31
    invoke-interface {v6, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    invoke-static {v6}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v2, v5, v4}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    :cond_7
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    if-eqz p4, :cond_9

    iget-object v2, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzcg;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzch;

    if-nez v2, :cond_8

    .line 34
    iput-object v1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzcg;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzch;

    goto :goto_3

    .line 33
    :cond_8
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "you cannot set two primary primitives"

    .line 34
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_9
    :goto_3
    return-object v0

    .line 36
    :cond_a
    new-instance v1, Ljava/security/GeneralSecurityException;

    const-string v2, "only ENABLED key is allowed"

    invoke-direct {v1, v2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1
    :cond_b
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "addPrimitive cannot be called after build"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public final zza(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/firebase-auth-api/zztb;)Lcom/google/android/gms/internal/firebase-auth-api/zzcg;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzcg;->zze(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/firebase-auth-api/zztb;Z)Lcom/google/android/gms/internal/firebase-auth-api/zzcg;

    return-object p0
.end method

.method public final zzb(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/firebase-auth-api/zztb;)Lcom/google/android/gms/internal/firebase-auth-api/zzcg;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 1
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzcg;->zze(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/firebase-auth-api/zztb;Z)Lcom/google/android/gms/internal/firebase-auth-api/zzcg;

    return-object p0
.end method

.method public final zzc(Lcom/google/android/gms/internal/firebase-auth-api/zznz;)Lcom/google/android/gms/internal/firebase-auth-api/zzcg;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzcg;->zzb:Ljava/util/concurrent/ConcurrentMap;

    if-eqz v0, :cond_0

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzcg;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zznz;

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "setAnnotations cannot be called after build"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final zzd()Lcom/google/android/gms/internal/firebase-auth-api/zzcl;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzcg;->zzb:Ljava/util/concurrent/ConcurrentMap;

    if-eqz v1, :cond_0

    new-instance v7, Lcom/google/android/gms/internal/firebase-auth-api/zzcl;

    iget-object v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzcg;->zzc:Ljava/util/List;

    iget-object v3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzcg;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzch;

    iget-object v4, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzcg;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zznz;

    iget-object v5, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzcg;->zza:Ljava/lang/Class;

    const/4 v6, 0x0

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/internal/firebase-auth-api/zzcl;-><init>(Ljava/util/concurrent/ConcurrentMap;Ljava/util/List;Lcom/google/android/gms/internal/firebase-auth-api/zzch;Lcom/google/android/gms/internal/firebase-auth-api/zznz;Ljava/lang/Class;Lcom/google/android/gms/internal/firebase-auth-api/zzck;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzcg;->zzb:Ljava/util/concurrent/ConcurrentMap;

    return-object v7

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "build cannot be called twice"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
