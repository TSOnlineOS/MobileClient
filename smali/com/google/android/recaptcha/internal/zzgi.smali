.class public Lcom/google/android/recaptcha/internal/zzgi;
.super Lcom/google/android/recaptcha/internal/zzeh;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<MessageType:",
        "Lcom/google/android/recaptcha/internal/zzgo<",
        "TMessageType;TBuilderType;>;BuilderType:",
        "Lcom/google/android/recaptcha/internal/zzgi<",
        "TMessageType;TBuilderType;>;>",
        "Lcom/google/android/recaptcha/internal/zzeh<",
        "TMessageType;TBuilderType;>;"
    }
.end annotation


# instance fields
.field protected zza:Lcom/google/android/recaptcha/internal/zzgo;

.field private final zzb:Lcom/google/android/recaptcha/internal/zzgo;


# direct methods
.method protected constructor <init>(Lcom/google/android/recaptcha/internal/zzgo;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TMessageType;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/google/android/recaptcha/internal/zzeh;-><init>()V

    iput-object p1, p0, Lcom/google/android/recaptcha/internal/zzgi;->zzb:Lcom/google/android/recaptcha/internal/zzgo;

    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzgo;->zzF()Z

    move-result p1

    if-nez p1, :cond_0

    .line 3
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzgi;->zzb:Lcom/google/android/recaptcha/internal/zzgo;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzgo;->zzs()Lcom/google/android/recaptcha/internal/zzgo;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/recaptcha/internal/zzgi;->zza:Lcom/google/android/recaptcha/internal/zzgo;

    return-void

    .line 1
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Default instance must be immutable."

    .line 3
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private static zzd(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzih;->zza()Lcom/google/android/recaptcha/internal/zzih;

    move-result-object v0

    .line 2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 1
    invoke-virtual {v0, v1}, Lcom/google/android/recaptcha/internal/zzih;->zzb(Ljava/lang/Class;)Lcom/google/android/recaptcha/internal/zzil;

    move-result-object v0

    invoke-interface {v0, p0, p1}, Lcom/google/android/recaptcha/internal/zzil;->zzg(Ljava/lang/Object;Ljava/lang/Object;)V

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
    invoke-virtual {p0}, Lcom/google/android/recaptcha/internal/zzgi;->zzf()Lcom/google/android/recaptcha/internal/zzgi;

    move-result-object v0

    return-object v0
.end method

.method public final synthetic zzX()Lcom/google/android/recaptcha/internal/zzhy;
    .locals 1

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzgi;->zzb:Lcom/google/android/recaptcha/internal/zzgo;

    return-object v0
.end method

.method public final bridge synthetic zza()Lcom/google/android/recaptcha/internal/zzeh;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/recaptcha/internal/zzgi;->zzf()Lcom/google/android/recaptcha/internal/zzgi;

    move-result-object v0

    return-object v0
.end method

.method protected final synthetic zzb(Lcom/google/android/recaptcha/internal/zzei;)Lcom/google/android/recaptcha/internal/zzeh;
    .locals 0

    .line 1
    check-cast p1, Lcom/google/android/recaptcha/internal/zzgo;

    .line 2
    invoke-virtual {p0, p1}, Lcom/google/android/recaptcha/internal/zzgi;->zzg(Lcom/google/android/recaptcha/internal/zzgo;)Lcom/google/android/recaptcha/internal/zzgi;

    return-object p0
.end method

.method public final zzf()Lcom/google/android/recaptcha/internal/zzgi;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzgi;->zzb:Lcom/google/android/recaptcha/internal/zzgo;

    const/4 v1, 0x5

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v2}, Lcom/google/android/recaptcha/internal/zzgo;->zzh(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 2
    check-cast v0, Lcom/google/android/recaptcha/internal/zzgi;

    .line 3
    invoke-virtual {p0}, Lcom/google/android/recaptcha/internal/zzgi;->zzi()Lcom/google/android/recaptcha/internal/zzgo;

    move-result-object v1

    iput-object v1, v0, Lcom/google/android/recaptcha/internal/zzgi;->zza:Lcom/google/android/recaptcha/internal/zzgo;

    return-object v0
.end method

.method public final zzg(Lcom/google/android/recaptcha/internal/zzgo;)Lcom/google/android/recaptcha/internal/zzgi;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzgi;->zzb:Lcom/google/android/recaptcha/internal/zzgo;

    invoke-virtual {v0, p1}, Lcom/google/android/recaptcha/internal/zzgo;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzgi;->zza:Lcom/google/android/recaptcha/internal/zzgo;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzgo;->zzF()Z

    move-result v0

    if-nez v0, :cond_0

    .line 3
    invoke-virtual {p0}, Lcom/google/android/recaptcha/internal/zzgi;->zzn()V

    :cond_0
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzgi;->zza:Lcom/google/android/recaptcha/internal/zzgo;

    .line 4
    invoke-static {v0, p1}, Lcom/google/android/recaptcha/internal/zzgi;->zzd(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_1
    return-object p0
.end method

.method public final zzh()Lcom/google/android/recaptcha/internal/zzgo;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TMessageType;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/recaptcha/internal/zzgi;->zzi()Lcom/google/android/recaptcha/internal/zzgo;

    move-result-object v0

    .line 2
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzgo;->zzo()Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    :cond_0
    new-instance v1, Lcom/google/android/recaptcha/internal/zzje;

    .line 3
    invoke-direct {v1, v0}, Lcom/google/android/recaptcha/internal/zzje;-><init>(Lcom/google/android/recaptcha/internal/zzhy;)V

    .line 4
    throw v1
.end method

.method public zzi()Lcom/google/android/recaptcha/internal/zzgo;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TMessageType;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzgi;->zza:Lcom/google/android/recaptcha/internal/zzgo;

    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzgo;->zzF()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzgi;->zza:Lcom/google/android/recaptcha/internal/zzgo;

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzgi;->zza:Lcom/google/android/recaptcha/internal/zzgo;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzgo;->zzA()V

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzgi;->zza:Lcom/google/android/recaptcha/internal/zzgo;

    return-object v0
.end method

.method public bridge synthetic zzj()Lcom/google/android/recaptcha/internal/zzhy;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/recaptcha/internal/zzgi;->zzh()Lcom/google/android/recaptcha/internal/zzgo;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzk()Lcom/google/android/recaptcha/internal/zzhy;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/recaptcha/internal/zzgi;->zzi()Lcom/google/android/recaptcha/internal/zzgo;

    move-result-object v0

    return-object v0
.end method

.method protected final zzm()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzgi;->zza:Lcom/google/android/recaptcha/internal/zzgo;

    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzgo;->zzF()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2
    invoke-virtual {p0}, Lcom/google/android/recaptcha/internal/zzgi;->zzn()V

    :cond_0
    return-void
.end method

.method protected zzn()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzgi;->zzb:Lcom/google/android/recaptcha/internal/zzgo;

    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzgo;->zzs()Lcom/google/android/recaptcha/internal/zzgo;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzgi;->zza:Lcom/google/android/recaptcha/internal/zzgo;

    .line 2
    invoke-static {v0, v1}, Lcom/google/android/recaptcha/internal/zzgi;->zzd(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/android/recaptcha/internal/zzgi;->zza:Lcom/google/android/recaptcha/internal/zzgo;

    return-void
.end method

.method public final zzo()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzgi;->zza:Lcom/google/android/recaptcha/internal/zzgo;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/google/android/recaptcha/internal/zzgo;->zzE(Lcom/google/android/recaptcha/internal/zzgo;Z)Z

    move-result v0

    return v0
.end method
