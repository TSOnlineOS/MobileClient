.class public final Lcom/google/android/recaptcha/internal/zzdv;
.super Ljava/lang/Object;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"


# direct methods
.method public static zza(Ljava/util/Collection;Ljava/util/Iterator;)Z
    .locals 2

    if-eqz p1, :cond_1

    const/4 v0, 0x0

    .line 1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {p0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    move-result v1

    or-int/2addr v0, v1

    goto :goto_0

    :cond_0
    return v0

    :cond_1
    const/4 p0, 0x0

    .line 3
    throw p0
.end method
