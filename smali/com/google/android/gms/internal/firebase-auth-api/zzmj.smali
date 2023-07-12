.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzmj;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"


# static fields
.field public static final zza:Lcom/google/android/gms/internal/firebase-auth-api/zzmj;

.field public static final zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzmj;

.field public static final zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzmj;

.field public static final zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzmj;


# instance fields
.field private final zze:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzmj;

    const-string v1, "TINK"

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzmj;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzmj;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzmj;

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzmj;

    const-string v1, "CRUNCHY"

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzmj;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzmj;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzmj;

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzmj;

    const-string v1, "LEGACY"

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzmj;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzmj;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzmj;

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzmj;

    const-string v1, "NO_PREFIX"

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzmj;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzmj;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzmj;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzmj;->zze:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzmj;->zze:Ljava/lang/String;

    return-object v0
.end method
