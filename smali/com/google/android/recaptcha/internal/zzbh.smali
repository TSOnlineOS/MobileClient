.class public final synthetic Lcom/google/android/recaptcha/internal/zzbh;
.super Ljava/lang/Object;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"


# direct methods
.method public static zza(Lcom/google/android/recaptcha/internal/zzbi;Ljava/lang/String;B)Ljava/lang/String;
    .locals 3

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    const/4 v0, 0x0

    .line 2
    :goto_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    invoke-interface {p1, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    .line 3
    invoke-static {v1}, Lkotlin/UInt;->constructor-impl(I)I

    move-result v1

    invoke-static {p2}, Lkotlin/UInt;->constructor-impl(I)I

    move-result v2

    xor-int/2addr v1, v2

    invoke-static {v1}, Lkotlin/UInt;->constructor-impl(I)I

    move-result v1

    int-to-char v1, v1

    .line 4
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
