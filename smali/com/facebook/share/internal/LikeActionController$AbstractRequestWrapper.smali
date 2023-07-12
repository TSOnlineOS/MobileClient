.class abstract Lcom/facebook/share/internal/LikeActionController$AbstractRequestWrapper;
.super Ljava/lang/Object;
.source "LikeActionController.java"

# interfaces
.implements Lcom/facebook/share/internal/LikeActionController$RequestWrapper;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/share/internal/LikeActionController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "AbstractRequestWrapper"
.end annotation


# instance fields
.field protected error:Lcom/facebook/FacebookRequestError;

.field protected objectId:Ljava/lang/String;

.field protected objectType:Lcom/facebook/share/widget/LikeView$ObjectType;

.field private request:Lcom/facebook/GraphRequest;

.field final synthetic this$0:Lcom/facebook/share/internal/LikeActionController;


# direct methods
.method protected constructor <init>(Lcom/facebook/share/internal/LikeActionController;Ljava/lang/String;Lcom/facebook/share/widget/LikeView$ObjectType;)V
    .locals 0

    .line 1547
    iput-object p1, p0, Lcom/facebook/share/internal/LikeActionController$AbstractRequestWrapper;->this$0:Lcom/facebook/share/internal/LikeActionController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1548
    iput-object p2, p0, Lcom/facebook/share/internal/LikeActionController$AbstractRequestWrapper;->objectId:Ljava/lang/String;

    .line 1549
    iput-object p3, p0, Lcom/facebook/share/internal/LikeActionController$AbstractRequestWrapper;->objectType:Lcom/facebook/share/widget/LikeView$ObjectType;

    return-void
.end method


# virtual methods
.method public addToBatch(Lcom/facebook/GraphRequestBatch;)V
    .locals 1

    .line 1553
    iget-object v0, p0, Lcom/facebook/share/internal/LikeActionController$AbstractRequestWrapper;->request:Lcom/facebook/GraphRequest;

    invoke-virtual {p1, v0}, Lcom/facebook/GraphRequestBatch;->add(Lcom/facebook/GraphRequest;)Z

    return-void
.end method

.method public getError()Lcom/facebook/FacebookRequestError;
    .locals 1

    .line 1557
    iget-object v0, p0, Lcom/facebook/share/internal/LikeActionController$AbstractRequestWrapper;->error:Lcom/facebook/FacebookRequestError;

    return-object v0
.end method

.method protected processError(Lcom/facebook/FacebookRequestError;)V
    .locals 5

    .line 1580
    sget-object v0, Lcom/facebook/LoggingBehavior;->REQUESTS:Lcom/facebook/LoggingBehavior;

    .line 1582
    invoke-static {}, Lcom/facebook/share/internal/LikeActionController;->access$100()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/facebook/share/internal/LikeActionController$AbstractRequestWrapper;->objectId:Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    iget-object v3, p0, Lcom/facebook/share/internal/LikeActionController$AbstractRequestWrapper;->objectType:Lcom/facebook/share/widget/LikeView$ObjectType;

    const/4 v4, 0x1

    aput-object v3, v2, v4

    const/4 v3, 0x2

    aput-object p1, v2, v3

    const-string p1, "Error running request for object \'%s\' with type \'%s\' : %s"

    .line 1580
    invoke-static {v0, v1, p1, v2}, Lcom/facebook/internal/Logger;->log(Lcom/facebook/LoggingBehavior;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method protected abstract processSuccess(Lcom/facebook/GraphResponse;)V
.end method

.method protected setRequest(Lcom/facebook/GraphRequest;)V
    .locals 1

    .line 1561
    iput-object p1, p0, Lcom/facebook/share/internal/LikeActionController$AbstractRequestWrapper;->request:Lcom/facebook/GraphRequest;

    .line 1564
    invoke-static {}, Lcom/facebook/FacebookSdk;->getGraphApiVersion()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/facebook/GraphRequest;->setVersion(Ljava/lang/String;)V

    .line 1565
    new-instance v0, Lcom/facebook/share/internal/LikeActionController$AbstractRequestWrapper$1;

    invoke-direct {v0, p0}, Lcom/facebook/share/internal/LikeActionController$AbstractRequestWrapper$1;-><init>(Lcom/facebook/share/internal/LikeActionController$AbstractRequestWrapper;)V

    invoke-virtual {p1, v0}, Lcom/facebook/GraphRequest;->setCallback(Lcom/facebook/GraphRequest$Callback;)V

    return-void
.end method
