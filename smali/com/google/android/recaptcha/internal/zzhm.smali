.class abstract Lcom/google/android/recaptcha/internal/zzhm;
.super Ljava/lang/Object;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"


# static fields
.field private static final zza:Lcom/google/android/recaptcha/internal/zzhm;

.field private static final zzb:Lcom/google/android/recaptcha/internal/zzhm;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/recaptcha/internal/zzhi;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/android/recaptcha/internal/zzhi;-><init>(Lcom/google/android/recaptcha/internal/zzhh;)V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzhm;->zza:Lcom/google/android/recaptcha/internal/zzhm;

    new-instance v0, Lcom/google/android/recaptcha/internal/zzhk;

    invoke-direct {v0, v1}, Lcom/google/android/recaptcha/internal/zzhk;-><init>(Lcom/google/android/recaptcha/internal/zzhj;)V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzhm;->zzb:Lcom/google/android/recaptcha/internal/zzhm;

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/recaptcha/internal/zzhl;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static zzd()Lcom/google/android/recaptcha/internal/zzhm;
    .locals 1

    sget-object v0, Lcom/google/android/recaptcha/internal/zzhm;->zza:Lcom/google/android/recaptcha/internal/zzhm;

    return-object v0
.end method

.method static zze()Lcom/google/android/recaptcha/internal/zzhm;
    .locals 1

    sget-object v0, Lcom/google/android/recaptcha/internal/zzhm;->zzb:Lcom/google/android/recaptcha/internal/zzhm;

    return-object v0
.end method


# virtual methods
.method abstract zza(Ljava/lang/Object;J)Ljava/util/List;
.end method

.method abstract zzb(Ljava/lang/Object;J)V
.end method

.method abstract zzc(Ljava/lang/Object;Ljava/lang/Object;J)V
.end method
