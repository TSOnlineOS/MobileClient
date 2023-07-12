.class final Lcom/google/android/gms/internal/firebase-auth-api/zzahx;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"


# static fields
.field private static final zza:Lcom/google/android/gms/internal/firebase-auth-api/zzahx;


# instance fields
.field private final zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzaic;

.field private final zzc:Ljava/util/concurrent/ConcurrentMap;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzahx;

    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzahx;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzahx;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzahx;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzahx;->zzc:Ljava/util/concurrent/ConcurrentMap;

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzahh;

    .line 2
    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzahh;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzahx;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzaic;

    return-void
.end method

.method public static zza()Lcom/google/android/gms/internal/firebase-auth-api/zzahx;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzahx;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzahx;

    return-object v0
.end method


# virtual methods
.method public final zzb(Ljava/lang/Class;)Lcom/google/android/gms/internal/firebase-auth-api/zzaib;
    .locals 2

    const-string v0, "messageType"

    .line 1
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagq;->zzc(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzahx;->zzc:Ljava/util/concurrent/ConcurrentMap;

    .line 2
    invoke-interface {v1, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/firebase-auth-api/zzaib;

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzahx;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzaic;

    .line 3
    invoke-interface {v1, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaic;->zza(Ljava/lang/Class;)Lcom/google/android/gms/internal/firebase-auth-api/zzaib;

    move-result-object v1

    .line 4
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagq;->zzc(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "schema"

    .line 5
    invoke-static {v1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagq;->zzc(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzahx;->zzc:Ljava/util/concurrent/ConcurrentMap;

    .line 6
    invoke-interface {v0, p1, v1}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzaib;

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    return-object p1

    :cond_1
    :goto_0
    return-object v1
.end method
