.class public final Lcom/google/android/recaptcha/internal/zzbf;
.super Ljava/lang/Object;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"

# interfaces
.implements Lcom/google/android/recaptcha/internal/zzbi;


# instance fields
.field private final zza:Lcom/google/android/recaptcha/internal/zzdo;


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x1

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/recaptcha/internal/zzbf;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/google/android/recaptcha/internal/zzdo;->zza(I)Lcom/google/android/recaptcha/internal/zzdo;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/recaptcha/internal/zzbf;->zza:Lcom/google/android/recaptcha/internal/zzdo;

    return-void
.end method


# virtual methods
.method public final zwk()Ljava/util/List;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/recaptcha/internal/zzbf;->zza()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public final zza()Ljava/util/List;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzbf;->zza:Lcom/google/android/recaptcha/internal/zzdo;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->toList(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public final zzb(Ljava/util/List;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzbf;->zza:Lcom/google/android/recaptcha/internal/zzdo;

    invoke-virtual {v0, p1}, Lcom/google/android/recaptcha/internal/zzdq;->add(Ljava/lang/Object;)Z

    const/4 p1, 0x1

    return p1
.end method
