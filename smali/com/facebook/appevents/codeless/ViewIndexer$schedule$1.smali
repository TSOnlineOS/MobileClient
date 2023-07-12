.class final Lcom/facebook/appevents/codeless/ViewIndexer$schedule$1;
.super Ljava/lang/Object;
.source "ViewIndexer.kt"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/appevents/codeless/ViewIndexer;->schedule()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nViewIndexer.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ViewIndexer.kt\ncom/facebook/appevents/codeless/ViewIndexer$schedule$1\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,273:1\n1#2:274\n*E\n"
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
.field final synthetic $indexingTask:Ljava/util/TimerTask;

.field final synthetic this$0:Lcom/facebook/appevents/codeless/ViewIndexer;


# direct methods
.method constructor <init>(Lcom/facebook/appevents/codeless/ViewIndexer;Ljava/util/TimerTask;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/appevents/codeless/ViewIndexer$schedule$1;->this$0:Lcom/facebook/appevents/codeless/ViewIndexer;

    iput-object p2, p0, Lcom/facebook/appevents/codeless/ViewIndexer$schedule$1;->$indexingTask:Ljava/util/TimerTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 8

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

    .line 118
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/facebook/appevents/codeless/ViewIndexer$schedule$1;->this$0:Lcom/facebook/appevents/codeless/ViewIndexer;

    invoke-static {v0}, Lcom/facebook/appevents/codeless/ViewIndexer;->access$getIndexingTimer$p(Lcom/facebook/appevents/codeless/ViewIndexer;)Ljava/util/Timer;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 119
    :cond_2
    iget-object v0, p0, Lcom/facebook/appevents/codeless/ViewIndexer$schedule$1;->this$0:Lcom/facebook/appevents/codeless/ViewIndexer;

    const/4 v1, 0x0

    check-cast v1, Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/facebook/appevents/codeless/ViewIndexer;->access$setPreviousDigest$p(Lcom/facebook/appevents/codeless/ViewIndexer;Ljava/lang/String;)V

    .line 120
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    .line 122
    iget-object v3, p0, Lcom/facebook/appevents/codeless/ViewIndexer$schedule$1;->$indexingTask:Ljava/util/TimerTask;

    const-wide/16 v4, 0x0

    const/16 v1, 0x3e8

    int-to-long v6, v1

    move-object v2, v0

    .line 121
    invoke-virtual/range {v2 .. v7}, Ljava/util/Timer;->scheduleAtFixedRate(Ljava/util/TimerTask;JJ)V

    .line 123
    iget-object v1, p0, Lcom/facebook/appevents/codeless/ViewIndexer$schedule$1;->this$0:Lcom/facebook/appevents/codeless/ViewIndexer;

    invoke-static {v1, v0}, Lcom/facebook/appevents/codeless/ViewIndexer;->access$setIndexingTimer$p(Lcom/facebook/appevents/codeless/ViewIndexer;Ljava/util/Timer;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 125
    :try_start_2
    invoke-static {}, Lcom/facebook/appevents/codeless/ViewIndexer;->access$getTAG$cp()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Error scheduling indexing job"

    check-cast v0, Ljava/lang/Throwable;

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_0
    return-void

    .line 127
    :goto_1
    :try_start_3
    invoke-static {v0, p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    return-void

    :catchall_1
    move-exception v0

    invoke-static {v0, p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-void
.end method
