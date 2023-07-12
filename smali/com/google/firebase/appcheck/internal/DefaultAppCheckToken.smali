.class public final Lcom/google/firebase/appcheck/internal/DefaultAppCheckToken;
.super Lcom/google/firebase/appcheck/AppCheckToken;
.source "DefaultAppCheckToken.java"


# static fields
.field static final EXPIRATION_TIME_KEY:Ljava/lang/String; = "exp"

.field static final EXPIRES_IN_MILLIS_KEY:Ljava/lang/String; = "expiresIn"

.field static final ISSUED_AT_KEY:Ljava/lang/String; = "iat"

.field private static final ONE_SECOND_MILLIS:J = 0x3e8L

.field static final RECEIVED_AT_TIMESTAMP_KEY:Ljava/lang/String; = "receivedAt"

.field private static final TAG:Ljava/lang/String;

.field static final TOKEN_KEY:Ljava/lang/String; = "token"


# instance fields
.field private final expiresInMillis:J

.field private final receivedAtTimestamp:J

.field private final token:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 34
    const-class v0, Lcom/google/firebase/appcheck/internal/DefaultAppCheckToken;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/firebase/appcheck/internal/DefaultAppCheckToken;->TAG:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;J)V
    .locals 7

    .line 56
    new-instance v0, Lcom/google/firebase/appcheck/internal/util/Clock$DefaultClock;

    invoke-direct {v0}, Lcom/google/firebase/appcheck/internal/util/Clock$DefaultClock;-><init>()V

    invoke-virtual {v0}, Lcom/google/firebase/appcheck/internal/util/Clock$DefaultClock;->currentTimeMillis()J

    move-result-wide v5

    move-object v1, p0

    move-object v2, p1

    move-wide v3, p2

    invoke-direct/range {v1 .. v6}, Lcom/google/firebase/appcheck/internal/DefaultAppCheckToken;-><init>(Ljava/lang/String;JJ)V

    return-void
.end method

.method constructor <init>(Ljava/lang/String;JJ)V
    .locals 0

    .line 60
    invoke-direct {p0}, Lcom/google/firebase/appcheck/AppCheckToken;-><init>()V

    .line 61
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 62
    iput-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultAppCheckToken;->token:Ljava/lang/String;

    .line 63
    iput-wide p2, p0, Lcom/google/firebase/appcheck/internal/DefaultAppCheckToken;->expiresInMillis:J

    .line 64
    iput-wide p4, p0, Lcom/google/firebase/appcheck/internal/DefaultAppCheckToken;->receivedAtTimestamp:J

    return-void
.end method

.method public static constructFromAppCheckTokenResponse(Lcom/google/firebase/appcheck/internal/AppCheckTokenResponse;)Lcom/google/firebase/appcheck/internal/DefaultAppCheckToken;
    .locals 5

    .line 70
    invoke-static {p0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    :try_start_0
    invoke-virtual {p0}, Lcom/google/firebase/appcheck/internal/AppCheckTokenResponse;->getTimeToLive()Ljava/lang/String;

    move-result-object v0

    const-string v1, "s"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 76
    invoke-static {v0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    const-wide v2, 0x408f400000000000L    # 1000.0

    mul-double v0, v0, v2

    double-to-long v0, v0

    goto :goto_0

    .line 80
    :catch_0
    invoke-virtual {p0}, Lcom/google/firebase/appcheck/internal/AppCheckTokenResponse;->getToken()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/firebase/appcheck/internal/util/TokenParser;->parseTokenClaims(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    const-string v1, "iat"

    .line 81
    invoke-static {v0, v1}, Lcom/google/firebase/appcheck/internal/DefaultAppCheckToken;->getLongFromClaimsSafely(Ljava/util/Map;Ljava/lang/String;)J

    move-result-wide v1

    const-string v3, "exp"

    .line 82
    invoke-static {v0, v3}, Lcom/google/firebase/appcheck/internal/DefaultAppCheckToken;->getLongFromClaimsSafely(Ljava/util/Map;Ljava/lang/String;)J

    move-result-wide v3

    sub-long/2addr v3, v1

    const-wide/16 v0, 0x3e8

    mul-long v0, v0, v3

    .line 86
    :goto_0
    new-instance v2, Lcom/google/firebase/appcheck/internal/DefaultAppCheckToken;

    invoke-virtual {p0}, Lcom/google/firebase/appcheck/internal/AppCheckTokenResponse;->getToken()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v2, p0, v0, v1}, Lcom/google/firebase/appcheck/internal/DefaultAppCheckToken;-><init>(Ljava/lang/String;J)V

    return-object v2
.end method

.method public static constructFromRawToken(Ljava/lang/String;)Lcom/google/firebase/appcheck/internal/DefaultAppCheckToken;
    .locals 13

    .line 138
    invoke-static {p0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    invoke-static {p0}, Lcom/google/firebase/appcheck/internal/util/TokenParser;->parseTokenClaims(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    const-string v1, "iat"

    .line 140
    invoke-static {v0, v1}, Lcom/google/firebase/appcheck/internal/DefaultAppCheckToken;->getLongFromClaimsSafely(Ljava/util/Map;Ljava/lang/String;)J

    move-result-wide v1

    const-string v3, "exp"

    .line 141
    invoke-static {v0, v3}, Lcom/google/firebase/appcheck/internal/DefaultAppCheckToken;->getLongFromClaimsSafely(Ljava/util/Map;Ljava/lang/String;)J

    move-result-wide v3

    sub-long/2addr v3, v1

    const-wide/16 v5, 0x3e8

    mul-long v9, v3, v5

    .line 145
    new-instance v0, Lcom/google/firebase/appcheck/internal/DefaultAppCheckToken;

    mul-long v11, v1, v5

    move-object v7, v0

    move-object v8, p0

    invoke-direct/range {v7 .. v12}, Lcom/google/firebase/appcheck/internal/DefaultAppCheckToken;-><init>(Ljava/lang/String;JJ)V

    return-object v0
.end method

.method static deserializeTokenFromJsonString(Ljava/lang/String;)Lcom/google/firebase/appcheck/internal/DefaultAppCheckToken;
    .locals 7

    .line 125
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p0, "token"

    .line 126
    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string p0, "receivedAt"

    .line 127
    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v5

    const-string p0, "expiresIn"

    .line 128
    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v3

    .line 129
    new-instance p0, Lcom/google/firebase/appcheck/internal/DefaultAppCheckToken;

    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Lcom/google/firebase/appcheck/internal/DefaultAppCheckToken;-><init>(Ljava/lang/String;JJ)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 131
    sget-object v0, Lcom/google/firebase/appcheck/internal/DefaultAppCheckToken;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Could not deserialize token: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p0, 0x0

    return-object p0
.end method

.method private static getLongFromClaimsSafely(Ljava/util/Map;Ljava/lang/String;)J
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")J"
        }
    .end annotation

    .line 150
    invoke-static {p0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 152
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    if-nez p0, :cond_0

    const-wide/16 p0, 0x0

    goto :goto_0

    .line 153
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Integer;->longValue()J

    move-result-wide p0

    :goto_0
    return-wide p0
.end method


# virtual methods
.method public getExpireTimeMillis()J
    .locals 4

    .line 97
    iget-wide v0, p0, Lcom/google/firebase/appcheck/internal/DefaultAppCheckToken;->receivedAtTimestamp:J

    iget-wide v2, p0, Lcom/google/firebase/appcheck/internal/DefaultAppCheckToken;->expiresInMillis:J

    add-long/2addr v0, v2

    return-wide v0
.end method

.method getExpiresInMillis()J
    .locals 2

    .line 105
    iget-wide v0, p0, Lcom/google/firebase/appcheck/internal/DefaultAppCheckToken;->expiresInMillis:J

    return-wide v0
.end method

.method getReceivedAtTimestamp()J
    .locals 2

    .line 101
    iget-wide v0, p0, Lcom/google/firebase/appcheck/internal/DefaultAppCheckToken;->receivedAtTimestamp:J

    return-wide v0
.end method

.method public getToken()Ljava/lang/String;
    .locals 1

    .line 92
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultAppCheckToken;->token:Ljava/lang/String;

    return-object v0
.end method

.method serializeTokenToString()Ljava/lang/String;
    .locals 4

    .line 111
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "token"

    .line 112
    iget-object v2, p0, Lcom/google/firebase/appcheck/internal/DefaultAppCheckToken;->token:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "receivedAt"

    .line 113
    iget-wide v2, p0, Lcom/google/firebase/appcheck/internal/DefaultAppCheckToken;->receivedAtTimestamp:J

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v1, "expiresIn"

    .line 114
    iget-wide v2, p0, Lcom/google/firebase/appcheck/internal/DefaultAppCheckToken;->expiresInMillis:J

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 115
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 117
    sget-object v1, Lcom/google/firebase/appcheck/internal/DefaultAppCheckToken;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not serialize token: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    return-object v0
.end method
