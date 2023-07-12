.class public final Lcom/google/android/recaptcha/internal/zzbu;
.super Ljava/lang/Object;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"

# interfaces
.implements Lcom/google/android/recaptcha/internal/zzby;


# static fields
.field public static final zza:Lcom/google/android/recaptcha/internal/zzbu;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/recaptcha/internal/zzbu;

    invoke-direct {v0}, Lcom/google/android/recaptcha/internal/zzbu;-><init>()V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzbu;->zza:Lcom/google/android/recaptcha/internal/zzbu;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final varargs zza(ILcom/google/android/recaptcha/internal/zzbl;[Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/recaptcha/internal/zzt;
        }
    .end annotation

    .line 1
    new-instance p1, Lcom/google/android/recaptcha/internal/zzt;

    const/4 p2, 0x5

    const/16 p3, 0x13

    const/4 v0, 0x0

    invoke-direct {p1, p2, p3, v0}, Lcom/google/android/recaptcha/internal/zzt;-><init>(IILjava/lang/Throwable;)V

    .line 2
    throw p1
.end method
