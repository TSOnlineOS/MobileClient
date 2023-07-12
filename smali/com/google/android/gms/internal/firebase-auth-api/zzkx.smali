.class public Lcom/google/android/gms/internal/firebase-auth-api/zzkx;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"


# instance fields
.field private final zza:Lcom/google/android/gms/internal/firebase-auth-api/zzvx;

.field private final zzb:Ljava/lang/Class;


# direct methods
.method synthetic constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzvx;Ljava/lang/Class;Lcom/google/android/gms/internal/firebase-auth-api/zzkw;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzkx;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzvx;

    iput-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzkx;->zzb:Ljava/lang/Class;

    return-void
.end method

.method public static zza(Lcom/google/android/gms/internal/firebase-auth-api/zzkv;Lcom/google/android/gms/internal/firebase-auth-api/zzvx;Ljava/lang/Class;)Lcom/google/android/gms/internal/firebase-auth-api/zzkx;
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzku;

    invoke-direct {v0, p1, p2, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzku;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzvx;Ljava/lang/Class;Lcom/google/android/gms/internal/firebase-auth-api/zzkv;)V

    return-object v0
.end method


# virtual methods
.method public final zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzvx;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzkx;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzvx;

    return-object v0
.end method

.method public final zzc()Ljava/lang/Class;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzkx;->zzb:Ljava/lang/Class;

    return-object v0
.end method
