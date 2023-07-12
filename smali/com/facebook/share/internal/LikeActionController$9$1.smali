.class Lcom/facebook/share/internal/LikeActionController$9$1;
.super Ljava/lang/Object;
.source "LikeActionController.java"

# interfaces
.implements Lcom/facebook/GraphRequestBatch$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/share/internal/LikeActionController$9;->onComplete()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/facebook/share/internal/LikeActionController$9;

.field final synthetic val$engagementRequest:Lcom/facebook/share/internal/LikeActionController$GetEngagementRequestWrapper;

.field final synthetic val$likeRequestWrapper:Lcom/facebook/share/internal/LikeActionController$LikeRequestWrapper;


# direct methods
.method constructor <init>(Lcom/facebook/share/internal/LikeActionController$9;Lcom/facebook/share/internal/LikeActionController$LikeRequestWrapper;Lcom/facebook/share/internal/LikeActionController$GetEngagementRequestWrapper;)V
    .locals 0

    .line 1010
    iput-object p1, p0, Lcom/facebook/share/internal/LikeActionController$9$1;->this$1:Lcom/facebook/share/internal/LikeActionController$9;

    iput-object p2, p0, Lcom/facebook/share/internal/LikeActionController$9$1;->val$likeRequestWrapper:Lcom/facebook/share/internal/LikeActionController$LikeRequestWrapper;

    iput-object p3, p0, Lcom/facebook/share/internal/LikeActionController$9$1;->val$engagementRequest:Lcom/facebook/share/internal/LikeActionController$GetEngagementRequestWrapper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBatchCompleted(Lcom/facebook/GraphRequestBatch;)V
    .locals 7

    .line 1013
    iget-object p1, p0, Lcom/facebook/share/internal/LikeActionController$9$1;->val$likeRequestWrapper:Lcom/facebook/share/internal/LikeActionController$LikeRequestWrapper;

    invoke-interface {p1}, Lcom/facebook/share/internal/LikeActionController$LikeRequestWrapper;->getError()Lcom/facebook/FacebookRequestError;

    move-result-object p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/facebook/share/internal/LikeActionController$9$1;->val$engagementRequest:Lcom/facebook/share/internal/LikeActionController$GetEngagementRequestWrapper;

    .line 1014
    invoke-virtual {p1}, Lcom/facebook/share/internal/LikeActionController$GetEngagementRequestWrapper;->getError()Lcom/facebook/FacebookRequestError;

    move-result-object p1

    if-eqz p1, :cond_0

    goto :goto_0

    .line 1025
    :cond_0
    iget-object p1, p0, Lcom/facebook/share/internal/LikeActionController$9$1;->this$1:Lcom/facebook/share/internal/LikeActionController$9;

    iget-object v0, p1, Lcom/facebook/share/internal/LikeActionController$9;->this$0:Lcom/facebook/share/internal/LikeActionController;

    iget-object p1, p0, Lcom/facebook/share/internal/LikeActionController$9$1;->val$likeRequestWrapper:Lcom/facebook/share/internal/LikeActionController$LikeRequestWrapper;

    .line 1026
    invoke-interface {p1}, Lcom/facebook/share/internal/LikeActionController$LikeRequestWrapper;->isObjectLiked()Z

    move-result v1

    iget-object p1, p0, Lcom/facebook/share/internal/LikeActionController$9$1;->val$engagementRequest:Lcom/facebook/share/internal/LikeActionController$GetEngagementRequestWrapper;

    iget-object v2, p1, Lcom/facebook/share/internal/LikeActionController$GetEngagementRequestWrapper;->likeCountStringWithLike:Ljava/lang/String;

    iget-object p1, p0, Lcom/facebook/share/internal/LikeActionController$9$1;->val$engagementRequest:Lcom/facebook/share/internal/LikeActionController$GetEngagementRequestWrapper;

    iget-object v3, p1, Lcom/facebook/share/internal/LikeActionController$GetEngagementRequestWrapper;->likeCountStringWithoutLike:Ljava/lang/String;

    iget-object p1, p0, Lcom/facebook/share/internal/LikeActionController$9$1;->val$engagementRequest:Lcom/facebook/share/internal/LikeActionController$GetEngagementRequestWrapper;

    iget-object v4, p1, Lcom/facebook/share/internal/LikeActionController$GetEngagementRequestWrapper;->socialSentenceStringWithLike:Ljava/lang/String;

    iget-object p1, p0, Lcom/facebook/share/internal/LikeActionController$9$1;->val$engagementRequest:Lcom/facebook/share/internal/LikeActionController$GetEngagementRequestWrapper;

    iget-object v5, p1, Lcom/facebook/share/internal/LikeActionController$GetEngagementRequestWrapper;->socialSentenceStringWithoutLike:Ljava/lang/String;

    iget-object p1, p0, Lcom/facebook/share/internal/LikeActionController$9$1;->val$likeRequestWrapper:Lcom/facebook/share/internal/LikeActionController$LikeRequestWrapper;

    .line 1031
    invoke-interface {p1}, Lcom/facebook/share/internal/LikeActionController$LikeRequestWrapper;->getUnlikeToken()Ljava/lang/String;

    move-result-object v6

    .line 1025
    invoke-static/range {v0 .. v6}, Lcom/facebook/share/internal/LikeActionController;->access$1300(Lcom/facebook/share/internal/LikeActionController;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 1017
    :cond_1
    :goto_0
    sget-object p1, Lcom/facebook/LoggingBehavior;->REQUESTS:Lcom/facebook/LoggingBehavior;

    .line 1019
    invoke-static {}, Lcom/facebook/share/internal/LikeActionController;->access$100()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/facebook/share/internal/LikeActionController$9$1;->this$1:Lcom/facebook/share/internal/LikeActionController$9;

    iget-object v3, v3, Lcom/facebook/share/internal/LikeActionController$9;->this$0:Lcom/facebook/share/internal/LikeActionController;

    .line 1021
    invoke-static {v3}, Lcom/facebook/share/internal/LikeActionController;->access$2200(Lcom/facebook/share/internal/LikeActionController;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "Unable to refresh like state for id: \'%s\'"

    .line 1017
    invoke-static {p1, v0, v2, v1}, Lcom/facebook/internal/Logger;->log(Lcom/facebook/LoggingBehavior;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method
