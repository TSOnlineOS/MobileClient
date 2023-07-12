.class public Lcom/google/firebase/appcheck/internal/HttpErrorResponse;
.super Ljava/lang/Object;
.source "HttpErrorResponse.java"


# static fields
.field static final CODE_KEY:Ljava/lang/String; = "code"

.field static final ERROR_KEY:Ljava/lang/String; = "error"

.field static final MESSAGE_KEY:Ljava/lang/String; = "message"


# instance fields
.field private errorCode:I

.field private errorMessage:Ljava/lang/String;


# direct methods
.method private constructor <init>(ILjava/lang/String;)V
    .locals 0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput p1, p0, Lcom/google/firebase/appcheck/internal/HttpErrorResponse;->errorCode:I

    .line 44
    iput-object p2, p0, Lcom/google/firebase/appcheck/internal/HttpErrorResponse;->errorMessage:Ljava/lang/String;

    return-void
.end method

.method public static fromJsonString(Ljava/lang/String;)Lcom/google/firebase/appcheck/internal/HttpErrorResponse;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 33
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p0, "error"

    .line 34
    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 35
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p0, "code"

    .line 36
    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result p0

    const-string v1, "message"

    .line 37
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 39
    new-instance v1, Lcom/google/firebase/appcheck/internal/HttpErrorResponse;

    invoke-direct {v1, p0, v0}, Lcom/google/firebase/appcheck/internal/HttpErrorResponse;-><init>(ILjava/lang/String;)V

    return-object v1
.end method


# virtual methods
.method public getErrorCode()I
    .locals 1

    .line 48
    iget v0, p0, Lcom/google/firebase/appcheck/internal/HttpErrorResponse;->errorCode:I

    return v0
.end method

.method public getErrorMessage()Ljava/lang/String;
    .locals 1

    .line 53
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/HttpErrorResponse;->errorMessage:Ljava/lang/String;

    return-object v0
.end method
