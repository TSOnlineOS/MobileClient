.class Lcom/google/firebase/appcheck/playintegrity/internal/ExchangePlayIntegrityTokenRequest;
.super Ljava/lang/Object;
.source "ExchangePlayIntegrityTokenRequest.java"


# static fields
.field static final PLAY_INTEGRITY_TOKEN_KEY:Ljava/lang/String; = "playIntegrityToken"


# instance fields
.field private final playIntegrityToken:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/google/firebase/appcheck/playintegrity/internal/ExchangePlayIntegrityTokenRequest;->playIntegrityToken:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public toJsonString()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 38
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 39
    iget-object v1, p0, Lcom/google/firebase/appcheck/playintegrity/internal/ExchangePlayIntegrityTokenRequest;->playIntegrityToken:Ljava/lang/String;

    const-string v2, "playIntegrityToken"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 41
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
