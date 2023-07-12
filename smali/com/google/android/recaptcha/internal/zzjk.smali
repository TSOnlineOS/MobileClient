.class public final Lcom/google/android/recaptcha/internal/zzjk;
.super Ljava/util/AbstractList;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"

# interfaces
.implements Ljava/util/RandomAccess;
.implements Lcom/google/android/recaptcha/internal/zzhg;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final zza:Lcom/google/android/recaptcha/internal/zzhg;


# direct methods
.method public constructor <init>(Lcom/google/android/recaptcha/internal/zzhg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    iput-object p1, p0, Lcom/google/android/recaptcha/internal/zzjk;->zza:Lcom/google/android/recaptcha/internal/zzhg;

    return-void
.end method

.method static bridge synthetic zza(Lcom/google/android/recaptcha/internal/zzjk;)Lcom/google/android/recaptcha/internal/zzhg;
    .locals 0

    iget-object p0, p0, Lcom/google/android/recaptcha/internal/zzjk;->zza:Lcom/google/android/recaptcha/internal/zzhg;

    return-object p0
.end method


# virtual methods
.method public final bridge synthetic get(I)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzjk;->zza:Lcom/google/android/recaptcha/internal/zzhg;

    check-cast v0, Lcom/google/android/recaptcha/internal/zzhf;

    .line 1
    invoke-virtual {v0, p1}, Lcom/google/android/recaptcha/internal/zzhf;->zzg(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final iterator()Ljava/util/Iterator;
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/recaptcha/internal/zzjj;

    invoke-direct {v0, p0}, Lcom/google/android/recaptcha/internal/zzjj;-><init>(Lcom/google/android/recaptcha/internal/zzjk;)V

    return-object v0
.end method

.method public final listIterator(I)Ljava/util/ListIterator;
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/recaptcha/internal/zzji;

    invoke-direct {v0, p0, p1}, Lcom/google/android/recaptcha/internal/zzji;-><init>(Lcom/google/android/recaptcha/internal/zzjk;I)V

    return-object v0
.end method

.method public final size()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzjk;->zza:Lcom/google/android/recaptcha/internal/zzhg;

    invoke-interface {v0}, Lcom/google/android/recaptcha/internal/zzhg;->size()I

    move-result v0

    return v0
.end method

.method public final zze()Lcom/google/android/recaptcha/internal/zzhg;
    .locals 0

    return-object p0
.end method

.method public final zzf(I)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzjk;->zza:Lcom/google/android/recaptcha/internal/zzhg;

    invoke-interface {v0, p1}, Lcom/google/android/recaptcha/internal/zzhg;->zzf(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final zzh()Ljava/util/List;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzjk;->zza:Lcom/google/android/recaptcha/internal/zzhg;

    invoke-interface {v0}, Lcom/google/android/recaptcha/internal/zzhg;->zzh()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public final zzi(Lcom/google/android/recaptcha/internal/zzez;)V
    .locals 0

    .line 1
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
.end method
