.class final Lcom/facebook/appevents/AppEventQueue$buildRequestForSession$1;
.super Ljava/lang/Object;
.source "AppEventQueue.kt"

# interfaces
.implements Lcom/facebook/GraphRequest$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/appevents/AppEventQueue;->buildRequestForSession(Lcom/facebook/appevents/AccessTokenAppIdPair;Lcom/facebook/appevents/SessionEventsState;ZLcom/facebook/appevents/FlushStatistics;)Lcom/facebook/GraphRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\n\u00a2\u0006\u0002\u0008\u0004"
    }
    d2 = {
        "<anonymous>",
        "",
        "response",
        "Lcom/facebook/GraphResponse;",
        "onCompleted"
    }
    k = 0x3
    mv = {
        0x1,
        0x5,
        0x1
    }
.end annotation


# instance fields
.field final synthetic $accessTokenAppId:Lcom/facebook/appevents/AccessTokenAppIdPair;

.field final synthetic $appEvents:Lcom/facebook/appevents/SessionEventsState;

.field final synthetic $flushState:Lcom/facebook/appevents/FlushStatistics;

.field final synthetic $postRequest:Lcom/facebook/GraphRequest;


# direct methods
.method constructor <init>(Lcom/facebook/appevents/AccessTokenAppIdPair;Lcom/facebook/GraphRequest;Lcom/facebook/appevents/SessionEventsState;Lcom/facebook/appevents/FlushStatistics;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/appevents/AppEventQueue$buildRequestForSession$1;->$accessTokenAppId:Lcom/facebook/appevents/AccessTokenAppIdPair;

    iput-object p2, p0, Lcom/facebook/appevents/AppEventQueue$buildRequestForSession$1;->$postRequest:Lcom/facebook/GraphRequest;

    iput-object p3, p0, Lcom/facebook/appevents/AppEventQueue$buildRequestForSession$1;->$appEvents:Lcom/facebook/appevents/SessionEventsState;

    iput-object p4, p0, Lcom/facebook/appevents/AppEventQueue$buildRequestForSession$1;->$flushState:Lcom/facebook/appevents/FlushStatistics;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onCompleted(Lcom/facebook/GraphResponse;)V
    .locals 4

    const-string v0, "response"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 212
    iget-object v0, p0, Lcom/facebook/appevents/AppEventQueue$buildRequestForSession$1;->$accessTokenAppId:Lcom/facebook/appevents/AccessTokenAppIdPair;

    iget-object v1, p0, Lcom/facebook/appevents/AppEventQueue$buildRequestForSession$1;->$postRequest:Lcom/facebook/GraphRequest;

    iget-object v2, p0, Lcom/facebook/appevents/AppEventQueue$buildRequestForSession$1;->$appEvents:Lcom/facebook/appevents/SessionEventsState;

    iget-object v3, p0, Lcom/facebook/appevents/AppEventQueue$buildRequestForSession$1;->$flushState:Lcom/facebook/appevents/FlushStatistics;

    invoke-static {v0, v1, p1, v2, v3}, Lcom/facebook/appevents/AppEventQueue;->handleResponse(Lcom/facebook/appevents/AccessTokenAppIdPair;Lcom/facebook/GraphRequest;Lcom/facebook/GraphResponse;Lcom/facebook/appevents/SessionEventsState;Lcom/facebook/appevents/FlushStatistics;)V

    return-void
.end method
