.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzajo;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"


# static fields
.field public static final zza:Lcom/google/android/gms/internal/firebase-auth-api/zzait;

.field public static final zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzait;

.field public static final zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzait;

.field private static final zzd:Ljava/lang/ThreadLocal;

.field private static final zze:Ljava/lang/reflect/Method;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private static final zzf:Ljava/lang/reflect/Method;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private static final zzg:Ljava/lang/reflect/Method;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzait;->zzc()Lcom/google/android/gms/internal/firebase-auth-api/zzais;

    move-result-object v0

    const-wide v1, -0xe7791f700L

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzais;->zzb(J)Lcom/google/android/gms/internal/firebase-auth-api/zzais;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzais;->zza(I)Lcom/google/android/gms/internal/firebase-auth-api/zzais;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzait;

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzajo;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzait;

    .line 2
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzait;->zzc()Lcom/google/android/gms/internal/firebase-auth-api/zzais;

    move-result-object v0

    const-wide v2, 0x3afff4417fL

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzais;->zzb(J)Lcom/google/android/gms/internal/firebase-auth-api/zzais;

    const v2, 0x3b9ac9ff

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzais;->zza(I)Lcom/google/android/gms/internal/firebase-auth-api/zzais;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzait;

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzajo;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzait;

    .line 3
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzait;->zzc()Lcom/google/android/gms/internal/firebase-auth-api/zzais;

    move-result-object v0

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzais;->zzb(J)Lcom/google/android/gms/internal/firebase-auth-api/zzais;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzais;->zza(I)Lcom/google/android/gms/internal/firebase-auth-api/zzais;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzait;

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzajo;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzait;

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzajn;

    .line 4
    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzajn;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzajo;->zzd:Ljava/lang/ThreadLocal;

    const-string v0, "now"

    .line 5
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzajo;->zzc(Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzajo;->zze:Ljava/lang/reflect/Method;

    const-string v0, "getEpochSecond"

    .line 6
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzajo;->zzc(Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzajo;->zzf:Ljava/lang/reflect/Method;

    const-string v0, "getNano"

    .line 7
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzajo;->zzc(Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzajo;->zzg:Ljava/lang/reflect/Method;

    return-void
.end method

.method public static zza(Lcom/google/android/gms/internal/firebase-auth-api/zzait;)Lcom/google/android/gms/internal/firebase-auth-api/zzait;
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzait;->zzb()J

    move-result-wide v0

    const-wide v2, -0xe7791f700L

    cmp-long v4, v0, v2

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzait;->zza()I

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

.method public static zzb(Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzait;
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    const/16 v0, 0x54

    .line 1
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const-string v1, "\""

    const/4 v2, -0x1

    const/4 v3, 0x0

    if-eq v0, v2, :cond_f

    const/16 v4, 0x5a

    .line 3
    invoke-virtual {p0, v4, v0}, Ljava/lang/String;->indexOf(II)I

    move-result v5

    const/16 v6, 0x2b

    if-ne v5, v2, :cond_0

    .line 4
    invoke-virtual {p0, v6, v0}, Ljava/lang/String;->indexOf(II)I

    move-result v5

    :cond_0
    if-ne v5, v2, :cond_1

    const/16 v5, 0x2d

    .line 5
    invoke-virtual {p0, v5, v0}, Ljava/lang/String;->indexOf(II)I

    move-result v5

    :cond_1
    if-eq v5, v2, :cond_e

    .line 7
    invoke-virtual {p0, v3, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    const/16 v7, 0x2e

    .line 8
    invoke-virtual {v0, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    if-eq v7, v2, :cond_2

    .line 9
    invoke-virtual {v0, v3, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    add-int/lit8 v7, v7, 0x1

    .line 10
    invoke-virtual {v0, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    move-object v7, v0

    move-object v0, v8

    goto :goto_0

    :cond_2
    const-string v7, ""

    :goto_0
    sget-object v8, Lcom/google/android/gms/internal/firebase-auth-api/zzajo;->zzd:Ljava/lang/ThreadLocal;

    .line 11
    invoke-virtual {v8}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/text/SimpleDateFormat;

    invoke-virtual {v8, v0}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    const-wide/16 v10, 0x3e8

    div-long/2addr v8, v10

    .line 13
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v10, 0x0

    goto :goto_3

    :cond_3
    const/4 v0, 0x0

    const/4 v10, 0x0

    :goto_1
    const/16 v11, 0x9

    if-ge v0, v11, :cond_6

    mul-int/lit8 v10, v10, 0xa

    .line 14
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v11

    if-ge v0, v11, :cond_5

    .line 15
    invoke-virtual {v7, v0}, Ljava/lang/String;->charAt(I)C

    move-result v11

    const/16 v12, 0x30

    if-lt v11, v12, :cond_4

    invoke-virtual {v7, v0}, Ljava/lang/String;->charAt(I)C

    move-result v11

    const/16 v12, 0x39

    if-gt v11, v12, :cond_4

    .line 16
    invoke-virtual {v7, v0}, Ljava/lang/String;->charAt(I)C

    move-result v11

    add-int/lit8 v11, v11, -0x30

    add-int/2addr v10, v11

    goto :goto_2

    .line 35
    :cond_4
    new-instance p0, Ljava/text/ParseException;

    const-string v0, "Invalid nanoseconds."

    invoke-direct {p0, v0, v3}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw p0

    :cond_5
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 17
    :cond_6
    :goto_3
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ne v0, v4, :cond_8

    .line 18
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v2, v5, 0x1

    if-ne v0, v2, :cond_7

    goto :goto_4

    .line 19
    :cond_7
    new-instance v0, Ljava/text/ParseException;

    .line 20
    invoke-virtual {p0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to parse timestamp: invalid trailing data \""

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0, v3}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0

    :cond_8
    add-int/lit8 v0, v5, 0x1

    .line 21
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x3a

    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-eq v1, v2, :cond_d

    .line 24
    invoke-virtual {v0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 26
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    const-wide/16 v11, 0x3c

    mul-long v1, v1, v11

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v13

    add-long/2addr v1, v13

    .line 27
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v0

    mul-long v1, v1, v11

    if-ne v0, v6, :cond_9

    sub-long/2addr v8, v1

    goto :goto_4

    :cond_9
    add-long/2addr v8, v1

    :goto_4
    const v0, -0x3b9aca00

    const v1, 0x3b9aca00

    if-le v10, v0, :cond_a

    if-lt v10, v1, :cond_b

    .line 18
    :cond_a
    :try_start_0
    div-int v0, v10, v1

    int-to-long v4, v0

    .line 28
    invoke-static {v8, v9, v4, v5}, Lcom/google/android/gms/internal/firebase-auth-api/zzbb;->zza(JJ)J

    move-result-wide v8

    rem-int/2addr v10, v1

    :cond_b
    if-gez v10, :cond_c

    add-int/2addr v10, v1

    const-wide/16 v0, 0x1

    .line 29
    invoke-static {v8, v9, v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzbb;->zzb(JJ)J

    move-result-wide v8

    .line 30
    :cond_c
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzait;->zzc()Lcom/google/android/gms/internal/firebase-auth-api/zzais;

    move-result-object v0

    invoke-virtual {v0, v8, v9}, Lcom/google/android/gms/internal/firebase-auth-api/zzais;->zzb(J)Lcom/google/android/gms/internal/firebase-auth-api/zzais;

    invoke-virtual {v0, v10}, Lcom/google/android/gms/internal/firebase-auth-api/zzais;->zza(I)Lcom/google/android/gms/internal/firebase-auth-api/zzais;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzagg;->zzi()Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzait;

    .line 31
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzajo;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzait;)Lcom/google/android/gms/internal/firebase-auth-api/zzait;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 32
    new-instance v1, Ljava/text/ParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to parse timestamp "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " Timestamp is out of range."

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0, v3}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    .line 33
    invoke-virtual {v1, v0}, Ljava/text/ParseException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 34
    throw v1

    .line 22
    :cond_d
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .line 23
    new-instance v0, Ljava/text/ParseException;

    const-string v1, "Invalid offset value: "

    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0, v3}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 6
    :cond_e
    new-instance p0, Ljava/text/ParseException;

    const-string v0, "Failed to parse timestamp: missing valid timezone offset."

    invoke-direct {p0, v0, v3}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw p0

    .line 2
    :cond_f
    new-instance v0, Ljava/text/ParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to parse timestamp: invalid timestamp \""

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0, v3}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method private static zzc(Ljava/lang/String;)Ljava/lang/reflect/Method;
    .locals 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    :try_start_0
    const-string v0, "java.time.Instant"

    .line 1
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Class;

    invoke-virtual {v0, p0, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    const/4 p0, 0x0

    return-object p0
.end method
