.class public final Lcom/google/android/recaptcha/internal/zzka;
.super Ljava/lang/Object;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"


# static fields
.field public static final zza:Lcom/google/android/recaptcha/internal/zzjd;

.field public static final zzb:Lcom/google/android/recaptcha/internal/zzjd;

.field public static final zzc:Lcom/google/android/recaptcha/internal/zzjd;

.field private static final zzd:Ljava/lang/ThreadLocal;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzjd;->zzi()Lcom/google/android/recaptcha/internal/zzjc;

    move-result-object v0

    const-wide v1, -0xe7791f700L

    invoke-virtual {v0, v1, v2}, Lcom/google/android/recaptcha/internal/zzjc;->zze(J)Lcom/google/android/recaptcha/internal/zzjc;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/recaptcha/internal/zzjc;->zzd(I)Lcom/google/android/recaptcha/internal/zzjc;

    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzgi;->zzh()Lcom/google/android/recaptcha/internal/zzgo;

    move-result-object v0

    check-cast v0, Lcom/google/android/recaptcha/internal/zzjd;

    sput-object v0, Lcom/google/android/recaptcha/internal/zzka;->zza:Lcom/google/android/recaptcha/internal/zzjd;

    .line 2
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzjd;->zzi()Lcom/google/android/recaptcha/internal/zzjc;

    move-result-object v0

    const-wide v2, 0x3afff4417fL

    invoke-virtual {v0, v2, v3}, Lcom/google/android/recaptcha/internal/zzjc;->zze(J)Lcom/google/android/recaptcha/internal/zzjc;

    const v2, 0x3b9ac9ff

    invoke-virtual {v0, v2}, Lcom/google/android/recaptcha/internal/zzjc;->zzd(I)Lcom/google/android/recaptcha/internal/zzjc;

    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzgi;->zzh()Lcom/google/android/recaptcha/internal/zzgo;

    move-result-object v0

    check-cast v0, Lcom/google/android/recaptcha/internal/zzjd;

    sput-object v0, Lcom/google/android/recaptcha/internal/zzka;->zzb:Lcom/google/android/recaptcha/internal/zzjd;

    .line 3
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzjd;->zzi()Lcom/google/android/recaptcha/internal/zzjc;

    move-result-object v0

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v2, v3}, Lcom/google/android/recaptcha/internal/zzjc;->zze(J)Lcom/google/android/recaptcha/internal/zzjc;

    invoke-virtual {v0, v1}, Lcom/google/android/recaptcha/internal/zzjc;->zzd(I)Lcom/google/android/recaptcha/internal/zzjc;

    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzgi;->zzh()Lcom/google/android/recaptcha/internal/zzgo;

    move-result-object v0

    check-cast v0, Lcom/google/android/recaptcha/internal/zzjd;

    sput-object v0, Lcom/google/android/recaptcha/internal/zzka;->zzc:Lcom/google/android/recaptcha/internal/zzjd;

    new-instance v0, Lcom/google/android/recaptcha/internal/zzjz;

    .line 4
    invoke-direct {v0}, Lcom/google/android/recaptcha/internal/zzjz;-><init>()V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzka;->zzd:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public static zza(Lcom/google/android/recaptcha/internal/zzjd;)Lcom/google/android/recaptcha/internal/zzjd;
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/google/android/recaptcha/internal/zzjd;->zzg()J

    move-result-wide v0

    const-wide v2, -0xe7791f700L

    cmp-long v4, v0, v2

    .line 2
    invoke-virtual {p0}, Lcom/google/android/recaptcha/internal/zzjd;->zzf()I

    move-result v2

    if-ltz v4, :cond_0

    const-wide v3, 0x3afff4417fL

    cmp-long v5, v0, v3

    if-gtz v5, :cond_0

    if-ltz v2, :cond_0

    const v3, 0x3b9aca00

    if-ge v2, v3, :cond_0

    return-object p0

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    .line 3
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v3, v0

    const-string v0, "Timestamp is not valid. See proto definition for valid values. Seconds (%s) must be in range [-62,135,596,800, +253,402,300,799]. Nanos (%s) must be in range [0, +999,999,999]."

    .line 4
    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static zzb(J)Lcom/google/android/recaptcha/internal/zzjd;
    .locals 6

    const-wide/16 v0, 0x3e8

    .line 1
    rem-long v2, p0, v0

    const-wide/32 v4, 0xf4240

    mul-long v2, v2, v4

    long-to-int v3, v2

    div-long/2addr p0, v0

    const v0, 0x3b9aca00

    const v1, -0x3b9aca00

    if-le v3, v1, :cond_0

    if-lt v3, v0, :cond_1

    :cond_0
    div-int v1, v3, v0

    int-to-long v1, v1

    invoke-static {p0, p1, v1, v2}, Lcom/google/android/recaptcha/internal/zzee;->zza(JJ)J

    move-result-wide p0

    rem-int/2addr v3, v0

    :cond_1
    if-gez v3, :cond_2

    add-int/2addr v3, v0

    const-wide/16 v0, 0x1

    .line 2
    invoke-static {p0, p1, v0, v1}, Lcom/google/android/recaptcha/internal/zzee;->zzb(JJ)J

    move-result-wide p0

    .line 3
    :cond_2
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzjd;->zzi()Lcom/google/android/recaptcha/internal/zzjc;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/google/android/recaptcha/internal/zzjc;->zze(J)Lcom/google/android/recaptcha/internal/zzjc;

    invoke-virtual {v0, v3}, Lcom/google/android/recaptcha/internal/zzjc;->zzd(I)Lcom/google/android/recaptcha/internal/zzjc;

    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzgi;->zzh()Lcom/google/android/recaptcha/internal/zzgo;

    move-result-object p0

    check-cast p0, Lcom/google/android/recaptcha/internal/zzjd;

    .line 4
    invoke-static {p0}, Lcom/google/android/recaptcha/internal/zzka;->zza(Lcom/google/android/recaptcha/internal/zzjd;)Lcom/google/android/recaptcha/internal/zzjd;

    return-object p0
.end method

.method public static zzc(Lcom/google/android/recaptcha/internal/zzjd;)Ljava/lang/String;
    .locals 5

    .line 1
    invoke-static {p0}, Lcom/google/android/recaptcha/internal/zzka;->zza(Lcom/google/android/recaptcha/internal/zzjd;)Lcom/google/android/recaptcha/internal/zzjd;

    .line 2
    invoke-virtual {p0}, Lcom/google/android/recaptcha/internal/zzjd;->zzg()J

    move-result-wide v0

    .line 3
    invoke-virtual {p0}, Lcom/google/android/recaptcha/internal/zzjd;->zzf()I

    move-result p0

    new-instance v2, Ljava/lang/StringBuilder;

    .line 4
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-wide/16 v3, 0x3e8

    mul-long v0, v0, v3

    new-instance v3, Ljava/util/Date;

    .line 5
    invoke-direct {v3, v0, v1}, Ljava/util/Date;-><init>(J)V

    sget-object v0, Lcom/google/android/recaptcha/internal/zzka;->zzd:Ljava/lang/ThreadLocal;

    .line 6
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/text/SimpleDateFormat;

    invoke-virtual {v0, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p0, :cond_2

    const-string v0, "."

    .line 7
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const v0, 0xf4240

    rem-int v1, p0, v0

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez v1, :cond_0

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    new-array v4, v4, [Ljava/lang/Object;

    div-int/2addr p0, v0

    .line 8
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    aput-object p0, v4, v3

    const-string p0, "%1$03d"

    invoke-static {v1, p0, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 12
    :cond_0
    rem-int/lit16 v0, p0, 0x3e8

    if-nez v0, :cond_1

    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    new-array v1, v4, [Ljava/lang/Object;

    div-int/lit16 p0, p0, 0x3e8

    .line 9
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    aput-object p0, v1, v3

    const-string p0, "%1$06d"

    invoke-static {v0, p0, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_1
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    new-array v1, v4, [Ljava/lang/Object;

    .line 10
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    aput-object p0, v1, v3

    const-string p0, "%1$09d"

    invoke-static {v0, p0, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .line 11
    :goto_0
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_2
    const-string p0, "Z"

    .line 12
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
