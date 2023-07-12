.class final Lcom/google/android/gms/internal/firebase-auth-api/zzav;
.super Lcom/google/android/gms/internal/firebase-auth-api/zzaq;
.source "com.google.firebase:firebase-auth@@22.0.0"


# instance fields
.field private final transient zza:Lcom/google/android/gms/internal/firebase-auth-api/zzap;

.field private final transient zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzam;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzap;Lcom/google/android/gms/internal/firebase-auth-api/zzam;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaq;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzav;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzap;

    iput-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzav;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzam;

    return-void
.end method


# virtual methods
.method public final contains(Ljava/lang/Object;)Z
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/CheckForNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzav;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzap;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public final synthetic iterator()Ljava/util/Iterator;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzav;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzam;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzam;->zzk(I)Lcom/google/android/gms/internal/firebase-auth-api/zzba;

    move-result-object v0

    return-object v0
.end method

.method public final size()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzav;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzap;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzap;->size()I

    move-result v0

    return v0
.end method

.method final zza([Ljava/lang/Object;I)I
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzav;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzam;

    const/4 v0, 0x0

    invoke-virtual {p2, p1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzai;->zza([Ljava/lang/Object;I)I

    move-result p1

    return p1
.end method

.method public final zzd()Lcom/google/android/gms/internal/firebase-auth-api/zzaz;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzav;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzam;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzam;->zzk(I)Lcom/google/android/gms/internal/firebase-auth-api/zzba;

    move-result-object v0

    return-object v0
.end method
