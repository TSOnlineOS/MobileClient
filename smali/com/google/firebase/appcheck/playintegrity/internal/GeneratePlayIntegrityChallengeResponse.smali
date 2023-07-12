.class Lcom/google/firebase/appcheck/playintegrity/internal/GeneratePlayIntegrityChallengeResponse;
.super Ljava/lang/Object;
.source "GeneratePlayIntegrityChallengeResponse.java"


# static fields
.field static final CHALLENGE_KEY:Ljava/lang/String; = "challenge"

.field static final TIME_TO_LIVE_KEY:Ljava/lang/String; = "ttl"


# instance fields
.field private challenge:Ljava/lang/String;

.field private timeToLive:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    iput-object p1, p0, Lcom/google/firebase/appcheck/playintegrity/internal/GeneratePlayIntegrityChallengeResponse;->challenge:Ljava/lang/String;

    .line 55
    iput-object p2, p0, Lcom/google/firebase/appcheck/playintegrity/internal/GeneratePlayIntegrityChallengeResponse;->timeToLive:Ljava/lang/String;

    return-void
.end method

.method public static fromJsonString(Ljava/lang/String;)Lcom/google/firebase/appcheck/playintegrity/internal/GeneratePlayIntegrityChallengeResponse;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/firebase/FirebaseException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .line 41
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p0, "challenge"

    .line 42
    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/common/util/Strings;->emptyToNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v1, "ttl"

    .line 43
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/common/util/Strings;->emptyToNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz p0, :cond_0

    if-eqz v0, :cond_0

    .line 47
    new-instance v1, Lcom/google/firebase/appcheck/playintegrity/internal/GeneratePlayIntegrityChallengeResponse;

    invoke-direct {v1, p0, v0}, Lcom/google/firebase/appcheck/playintegrity/internal/GeneratePlayIntegrityChallengeResponse;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    .line 45
    :cond_0
    new-instance p0, Lcom/google/firebase/FirebaseException;

    const-string v0, "Unexpected server response."

    invoke-direct {p0, v0}, Lcom/google/firebase/FirebaseException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public getChallenge()Ljava/lang/String;
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/google/firebase/appcheck/playintegrity/internal/GeneratePlayIntegrityChallengeResponse;->challenge:Ljava/lang/String;

    return-object v0
.end method

.method public getTimeToLive()Ljava/lang/String;
    .locals 1

    .line 65
    iget-object v0, p0, Lcom/google/firebase/appcheck/playintegrity/internal/GeneratePlayIntegrityChallengeResponse;->timeToLive:Ljava/lang/String;

    return-object v0
.end method
