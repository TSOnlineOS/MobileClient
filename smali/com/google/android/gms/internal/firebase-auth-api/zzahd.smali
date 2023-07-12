.class abstract Lcom/google/android/gms/internal/firebase-auth-api/zzahd;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"


# static fields
.field private static final zza:Lcom/google/android/gms/internal/firebase-auth-api/zzahd;

.field private static final zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzahd;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzagz;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagz;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzagy;)V

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzahd;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzahd;

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzahb;

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzahb;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaha;)V

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzahd;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzahd;

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzahc;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static zzd()Lcom/google/android/gms/internal/firebase-auth-api/zzahd;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzahd;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzahd;

    return-object v0
.end method

.method static zze()Lcom/google/android/gms/internal/firebase-auth-api/zzahd;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzahd;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzahd;

    return-object v0
.end method


# virtual methods
.method abstract zza(Ljava/lang/Object;J)Ljava/util/List;
.end method

.method abstract zzb(Ljava/lang/Object;J)V
.end method

.method abstract zzc(Ljava/lang/Object;Ljava/lang/Object;J)V
.end method
