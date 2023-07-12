.class public final Lcom/google/android/recaptcha/internal/zzcq;
.super Ljava/lang/Object;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"


# static fields
.field public static final zza:Lcom/google/android/recaptcha/internal/zzcp;


# instance fields
.field private zzb:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/google/android/recaptcha/internal/zzcp;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/android/recaptcha/internal/zzcp;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzcq;->zza:Lcom/google/android/recaptcha/internal/zzcp;

    return-void
.end method

.method public constructor <init>(SS)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result p1

    iput p1, p0, Lcom/google/android/recaptcha/internal/zzcq;->zzb:I

    return-void
.end method


# virtual methods
.method public final zza()S
    .locals 2

    iget v0, p0, Lcom/google/android/recaptcha/internal/zzcq;->zzb:I

    mul-int/lit16 v0, v0, 0x1127

    add-int/lit16 v0, v0, 0x115

    const v1, 0x800b

    rem-int/2addr v0, v1

    iput v0, p0, Lcom/google/android/recaptcha/internal/zzcq;->zzb:I

    rem-int/lit16 v0, v0, 0xff

    int-to-short v0, v0

    return v0
.end method
