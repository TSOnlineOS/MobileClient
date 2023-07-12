.class public final Lcom/google/android/recaptcha/internal/zzt;
.super Ljava/lang/Exception;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"


# instance fields
.field private final zza:Ljava/lang/Throwable;

.field private final zzb:Lcom/google/android/recaptcha/internal/zzmi;

.field private final zzc:I

.field private final zzd:I


# direct methods
.method public constructor <init>(IILjava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    iput p1, p0, Lcom/google/android/recaptcha/internal/zzt;->zzc:I

    iput p2, p0, Lcom/google/android/recaptcha/internal/zzt;->zzd:I

    iput-object p3, p0, Lcom/google/android/recaptcha/internal/zzt;->zza:Ljava/lang/Throwable;

    .line 2
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzmj;->zzf()Lcom/google/android/recaptcha/internal/zzmi;

    move-result-object p1

    iget p2, p0, Lcom/google/android/recaptcha/internal/zzt;->zzd:I

    .line 3
    invoke-virtual {p1, p2}, Lcom/google/android/recaptcha/internal/zzmi;->zze(I)Lcom/google/android/recaptcha/internal/zzmi;

    iget p2, p0, Lcom/google/android/recaptcha/internal/zzt;->zzc:I

    .line 4
    invoke-virtual {p1, p2}, Lcom/google/android/recaptcha/internal/zzmi;->zzp(I)Lcom/google/android/recaptcha/internal/zzmi;

    iput-object p1, p0, Lcom/google/android/recaptcha/internal/zzt;->zzb:Lcom/google/android/recaptcha/internal/zzmi;

    return-void
.end method


# virtual methods
.method public final getCause()Ljava/lang/Throwable;
    .locals 1

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzt;->zza:Ljava/lang/Throwable;

    return-object v0
.end method

.method public final zza()Lcom/google/android/recaptcha/internal/zzmi;
    .locals 1

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzt;->zzb:Lcom/google/android/recaptcha/internal/zzmi;

    return-object v0
.end method
