.class public Lcom/google/android/gms/internal/firebase-auth-api/zzagg;
.super Lcom/google/android/gms/internal/firebase-auth-api/zzaeo;
.source "com.google.firebase:firebase-auth@@22.0.0"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<MessageType:",
        "Lcom/google/android/gms/internal/firebase-auth-api/zzagk<",
        "TMessageType;TBuilderType;>;BuilderType:",
        "Lcom/google/android/gms/internal/firebase-auth-api/zzagg<",
        "TMessageType;TBuilderType;>;>",
        "Lcom/google/android/gms/internal/firebase-auth-api/zzaeo<",
        "TMessageType;TBuilderType;>;"
    }
.end annotation


# instance fields
.field protected zza:Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

.field private final zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzagk;


# direct methods
.method protected constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzagk;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TMessageType;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaeo;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagk;->zzL()Z

    move-result p1

    if-nez p1, :cond_0

    .line 3
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagk;->zzw()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    return-void

    .line 1
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Default instance must be immutable."

    .line 3
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private static zza(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzahx;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzahx;

    move-result-object v0

    .line 2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzahx;->zzb(Ljava/lang/Class;)Lcom/google/android/gms/internal/firebase-auth-api/zzaib;

    move-result-object v0

    .line 1
    invoke-interface {v0, p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaib;->zzg(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzg()Lcom/google/android/gms/internal/firebase-auth-api/zzagg;

    move-result-object v0

    return-object v0
.end method

.method public final synthetic zzM()Lcom/google/android/gms/internal/firebase-auth-api/zzahp;
    .locals 1

    const/4 v0, 0x0

    throw v0
.end method

.method public final bridge synthetic zzf()Lcom/google/android/gms/internal/firebase-auth-api/zzaeo;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzg()Lcom/google/android/gms/internal/firebase-auth-api/zzagg;

    move-result-object v0

    return-object v0
.end method

.method public final zzg()Lcom/google/android/gms/internal/firebase-auth-api/zzagg;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    const/4 v1, 0x5

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzagk;->zzj(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 2
    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;

    .line 3
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzj()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object v1

    iput-object v1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    return-object v0
.end method

.method public final zzh(Lcom/google/android/gms/internal/firebase-auth-api/zzagk;)Lcom/google/android/gms/internal/firebase-auth-api/zzagg;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagk;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagk;->zzL()Z

    move-result v0

    if-nez v0, :cond_0

    .line 3
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzn()V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    .line 4
    invoke-static {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zza(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_1
    return-object p0
.end method

.method public final zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TMessageType;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzj()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object v0

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagk;->zzK()Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    :cond_0
    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzaiu;

    .line 3
    invoke-direct {v1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaiu;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzahp;)V

    .line 4
    throw v1
.end method

.method public zzj()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TMessageType;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagk;->zzL()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagk;->zzF()V

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    return-object v0
.end method

.method public bridge synthetic zzk()Lcom/google/android/gms/internal/firebase-auth-api/zzahp;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzj()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object v0

    return-object v0
.end method

.method protected final zzm()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagk;->zzL()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzn()V

    :cond_0
    return-void
.end method

.method protected zzn()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagk;->zzw()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    .line 2
    invoke-static {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zza(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    return-void
.end method
