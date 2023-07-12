.class final Lcom/facebook/appevents/codeless/ViewIndexer$sendToServer$1;
.super Ljava/lang/Object;
.source "ViewIndexer.kt"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/appevents/codeless/ViewIndexer;->sendToServer(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
        "run"
    }
    k = 0x3
    mv = {
        0x1,
        0x5,
        0x1
    }
.end annotation


# instance fields
.field final synthetic $tree:Ljava/lang/String;

.field final synthetic this$0:Lcom/facebook/appevents/codeless/ViewIndexer;


# direct methods
.method constructor <init>(Lcom/facebook/appevents/codeless/ViewIndexer;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/appevents/codeless/ViewIndexer$sendToServer$1;->this$0:Lcom/facebook/appevents/codeless/ViewIndexer;

    iput-object p2, p0, Lcom/facebook/appevents/codeless/ViewIndexer$sendToServer$1;->$tree:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    invoke-static {p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-static {p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v0, :cond_1

    return-void

    .line 153
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/facebook/appevents/codeless/ViewIndexer$sendToServer$1;->$tree:Ljava/lang/String;

    invoke-static {v0}, Lcom/facebook/internal/Utility;->md5hash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 154
    sget-object v1, Lcom/facebook/AccessToken;->Companion:Lcom/facebook/AccessToken$Companion;

    invoke-virtual {v1}, Lcom/facebook/AccessToken$Companion;->getCurrentAccessToken()Lcom/facebook/AccessToken;

    move-result-object v1

    if-eqz v0, :cond_2

    .line 155
    iget-object v2, p0, Lcom/facebook/appevents/codeless/ViewIndexer$sendToServer$1;->this$0:Lcom/facebook/appevents/codeless/ViewIndexer;

    invoke-static {v2}, Lcom/facebook/appevents/codeless/ViewIndexer;->access$getPreviousDigest$p(Lcom/facebook/appevents/codeless/ViewIndexer;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    return-void

    .line 159
    :cond_2
    sget-object v2, Lcom/facebook/appevents/codeless/ViewIndexer;->Companion:Lcom/facebook/appevents/codeless/ViewIndexer$Companion;

    .line 160
    iget-object v3, p0, Lcom/facebook/appevents/codeless/ViewIndexer$sendToServer$1;->$tree:Ljava/lang/String;

    invoke-static {}, Lcom/facebook/FacebookSdk;->getApplicationId()Ljava/lang/String;

    move-result-object v4

    const-string v5, "app_indexing"

    .line 159
    invoke-virtual {v2, v3, v1, v4, v5}, Lcom/facebook/appevents/codeless/ViewIndexer$Companion;->buildAppIndexingRequest(Ljava/lang/String;Lcom/facebook/AccessToken;Ljava/lang/String;Ljava/lang/String;)Lcom/facebook/GraphRequest;

    move-result-object v1

    .line 161
    iget-object v2, p0, Lcom/facebook/appevents/codeless/ViewIndexer$sendToServer$1;->this$0:Lcom/facebook/appevents/codeless/ViewIndexer;

    invoke-virtual {v2, v1, v0}, Lcom/facebook/appevents/codeless/ViewIndexer;->processRequest(Lcom/facebook/GraphRequest;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 162
    :try_start_2
    invoke-static {v0, p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    return-void

    :catchall_1
    move-exception v0

    invoke-static {v0, p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-void
.end method
