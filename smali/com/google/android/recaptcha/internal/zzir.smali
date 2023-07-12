.class final Lcom/google/android/recaptcha/internal/zzir;
.super Ljava/lang/Object;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"


# static fields
.field private static final zza:Ljava/util/Iterator;

.field private static final zzb:Ljava/lang/Iterable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/recaptcha/internal/zzip;

    invoke-direct {v0}, Lcom/google/android/recaptcha/internal/zzip;-><init>()V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzir;->zza:Ljava/util/Iterator;

    new-instance v0, Lcom/google/android/recaptcha/internal/zziq;

    invoke-direct {v0}, Lcom/google/android/recaptcha/internal/zziq;-><init>()V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzir;->zzb:Ljava/lang/Iterable;

    return-void
.end method

.method static zza()Ljava/lang/Iterable;
    .locals 1

    sget-object v0, Lcom/google/android/recaptcha/internal/zzir;->zzb:Ljava/lang/Iterable;

    return-object v0
.end method

.method static bridge synthetic zzb()Ljava/util/Iterator;
    .locals 1

    sget-object v0, Lcom/google/android/recaptcha/internal/zzir;->zza:Ljava/util/Iterator;

    return-object v0
.end method
