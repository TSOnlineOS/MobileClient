.class Lcom/facebook/share/internal/LikeActionController$GetPageLikesRequestWrapper;
.super Lcom/facebook/share/internal/LikeActionController$AbstractRequestWrapper;
.source "LikeActionController.java"

# interfaces
.implements Lcom/facebook/share/internal/LikeActionController$LikeRequestWrapper;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/share/internal/LikeActionController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GetPageLikesRequestWrapper"
.end annotation


# instance fields
.field private objectIsLiked:Z

.field private pageId:Ljava/lang/String;

.field final synthetic this$0:Lcom/facebook/share/internal/LikeActionController;


# direct methods
.method constructor <init>(Lcom/facebook/share/internal/LikeActionController;Ljava/lang/String;)V
    .locals 4

    .line 1361
    iput-object p1, p0, Lcom/facebook/share/internal/LikeActionController$GetPageLikesRequestWrapper;->this$0:Lcom/facebook/share/internal/LikeActionController;

    .line 1362
    sget-object v0, Lcom/facebook/share/widget/LikeView$ObjectType;->PAGE:Lcom/facebook/share/widget/LikeView$ObjectType;

    invoke-direct {p0, p1, p2, v0}, Lcom/facebook/share/internal/LikeActionController$AbstractRequestWrapper;-><init>(Lcom/facebook/share/internal/LikeActionController;Ljava/lang/String;Lcom/facebook/share/widget/LikeView$ObjectType;)V

    .line 1358
    iget-object p1, p0, Lcom/facebook/share/internal/LikeActionController$GetPageLikesRequestWrapper;->this$0:Lcom/facebook/share/internal/LikeActionController;

    invoke-static {p1}, Lcom/facebook/share/internal/LikeActionController;->access$2500(Lcom/facebook/share/internal/LikeActionController;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/facebook/share/internal/LikeActionController$GetPageLikesRequestWrapper;->objectIsLiked:Z

    .line 1363
    iput-object p2, p0, Lcom/facebook/share/internal/LikeActionController$GetPageLikesRequestWrapper;->pageId:Ljava/lang/String;

    .line 1365
    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    const-string v0, "fields"

    const-string v1, "id"

    .line 1366
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1368
    new-instance v0, Lcom/facebook/GraphRequest;

    .line 1370
    invoke-static {}, Lcom/facebook/AccessToken;->getCurrentAccessToken()Lcom/facebook/AccessToken;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "me/likes/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    sget-object v2, Lcom/facebook/HttpMethod;->GET:Lcom/facebook/HttpMethod;

    invoke-direct {v0, v1, p2, p1, v2}, Lcom/facebook/GraphRequest;-><init>(Lcom/facebook/AccessToken;Ljava/lang/String;Landroid/os/Bundle;Lcom/facebook/HttpMethod;)V

    .line 1368
    invoke-virtual {p0, v0}, Lcom/facebook/share/internal/LikeActionController$GetPageLikesRequestWrapper;->setRequest(Lcom/facebook/GraphRequest;)V

    return-void
.end method


# virtual methods
.method public getUnlikeToken()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public isObjectLiked()Z
    .locals 1

    .line 1397
    iget-boolean v0, p0, Lcom/facebook/share/internal/LikeActionController$GetPageLikesRequestWrapper;->objectIsLiked:Z

    return v0
.end method

.method protected processError(Lcom/facebook/FacebookRequestError;)V
    .locals 5

    .line 1386
    sget-object v0, Lcom/facebook/LoggingBehavior;->REQUESTS:Lcom/facebook/LoggingBehavior;

    .line 1388
    invoke-static {}, Lcom/facebook/share/internal/LikeActionController;->access$100()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/facebook/share/internal/LikeActionController$GetPageLikesRequestWrapper;->pageId:Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/4 v3, 0x1

    aput-object p1, v2, v3

    const-string v3, "Error fetching like status for page id \'%s\': %s"

    .line 1386
    invoke-static {v0, v1, v3, v2}, Lcom/facebook/internal/Logger;->log(Lcom/facebook/LoggingBehavior;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1392
    iget-object v0, p0, Lcom/facebook/share/internal/LikeActionController$GetPageLikesRequestWrapper;->this$0:Lcom/facebook/share/internal/LikeActionController;

    const-string v1, "get_page_like"

    invoke-static {v0, v1, p1}, Lcom/facebook/share/internal/LikeActionController;->access$2400(Lcom/facebook/share/internal/LikeActionController;Ljava/lang/String;Lcom/facebook/FacebookRequestError;)V

    return-void
.end method

.method protected processSuccess(Lcom/facebook/GraphResponse;)V
    .locals 1

    .line 1378
    invoke-virtual {p1}, Lcom/facebook/GraphResponse;->getJSONObject()Lorg/json/JSONObject;

    move-result-object p1

    const-string v0, "data"

    invoke-static {p1, v0}, Lcom/facebook/internal/Utility;->tryGetJSONArrayFromResponse(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 1379
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result p1

    if-lez p1, :cond_0

    const/4 p1, 0x1

    .line 1380
    iput-boolean p1, p0, Lcom/facebook/share/internal/LikeActionController$GetPageLikesRequestWrapper;->objectIsLiked:Z

    :cond_0
    return-void
.end method
