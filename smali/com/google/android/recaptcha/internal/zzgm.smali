.class public final Lcom/google/android/recaptcha/internal/zzgm;
.super Lcom/google/android/recaptcha/internal/zzfx;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"


# instance fields
.field final zza:Lcom/google/android/recaptcha/internal/zzhy;

.field final zzb:Lcom/google/android/recaptcha/internal/zzgl;


# direct methods
.method constructor <init>(Lcom/google/android/recaptcha/internal/zzhy;Ljava/lang/Object;Lcom/google/android/recaptcha/internal/zzhy;Lcom/google/android/recaptcha/internal/zzgl;Ljava/lang/Class;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/recaptcha/internal/zzfx;-><init>()V

    if-eqz p1, :cond_1

    iget-object p2, p4, Lcom/google/android/recaptcha/internal/zzgl;->zzb:Lcom/google/android/recaptcha/internal/zzjv;

    .line 2
    sget-object p3, Lcom/google/android/recaptcha/internal/zzjv;->zzk:Lcom/google/android/recaptcha/internal/zzjv;

    if-eq p2, p3, :cond_0

    .line 3
    iput-object p1, p0, Lcom/google/android/recaptcha/internal/zzgm;->zza:Lcom/google/android/recaptcha/internal/zzhy;

    iput-object p4, p0, Lcom/google/android/recaptcha/internal/zzgm;->zzb:Lcom/google/android/recaptcha/internal/zzgl;

    return-void

    .line 2
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Null messageDefaultInstance"

    .line 3
    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Null containingTypeDefaultInstance"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
