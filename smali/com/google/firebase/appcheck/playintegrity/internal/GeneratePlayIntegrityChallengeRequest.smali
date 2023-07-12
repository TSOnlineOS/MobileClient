.class Lcom/google/firebase/appcheck/playintegrity/internal/GeneratePlayIntegrityChallengeRequest;
.super Ljava/lang/Object;
.source "GeneratePlayIntegrityChallengeRequest.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public toJsonString()Ljava/lang/String;
    .locals 1

    .line 30
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 33
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
