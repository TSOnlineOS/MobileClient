.class public final Lcom/google/android/recaptcha/internal/zzbl;
.super Ljava/lang/Object;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"


# instance fields
.field private final zza:Lcom/google/android/recaptcha/internal/zzbn;

.field private zzb:Ljava/lang/String;

.field private zzc:I

.field private final zzd:Lcom/google/android/recaptcha/internal/zzbm;


# direct methods
.method public constructor <init>(Lcom/google/android/recaptcha/internal/zzbn;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/recaptcha/internal/zzbl;->zza:Lcom/google/android/recaptcha/internal/zzbn;

    const-string v0, "recaptcha.m.Main.rge"

    iput-object v0, p0, Lcom/google/android/recaptcha/internal/zzbl;->zzb:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzbn;->zzb()Lcom/google/android/recaptcha/internal/zzbm;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/recaptcha/internal/zzbl;->zzd:Lcom/google/android/recaptcha/internal/zzbm;

    return-void
.end method


# virtual methods
.method public final zza()B
    .locals 1

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzbl;->zza:Lcom/google/android/recaptcha/internal/zzbn;

    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzbn;->zza()B

    move-result v0

    return v0
.end method

.method public final zzb()I
    .locals 1

    iget v0, p0, Lcom/google/android/recaptcha/internal/zzbl;->zzc:I

    return v0
.end method

.method public final zzc()Lcom/google/android/recaptcha/internal/zzbm;
    .locals 1

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzbl;->zzd:Lcom/google/android/recaptcha/internal/zzbm;

    return-object v0
.end method

.method public final zzd()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzbl;->zzb:Ljava/lang/String;

    return-object v0
.end method

.method public final zze()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzbl;->zza:Lcom/google/android/recaptcha/internal/zzbn;

    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzbn;->zzc()V

    return-void
.end method

.method public final zzf(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/recaptcha/internal/zzbl;->zzb:Ljava/lang/String;

    return-void
.end method

.method public final zzg(I)V
    .locals 0

    iput p1, p0, Lcom/google/android/recaptcha/internal/zzbl;->zzc:I

    return-void
.end method

.method public final zzh(B)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzbl;->zza:Lcom/google/android/recaptcha/internal/zzbn;

    invoke-virtual {v0, p1}, Lcom/google/android/recaptcha/internal/zzbn;->zzd(B)V

    return-void
.end method
