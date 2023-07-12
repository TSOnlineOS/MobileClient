.class final Lcom/onevcat/uniwebview/UniWebViewInterface$49;
.super Ljava/lang/Object;
.source "UniWebViewInterface.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/onevcat/uniwebview/UniWebViewInterface;->runSafelyOnUiThread(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$r:Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;


# direct methods
.method constructor <init>(Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;)V
    .locals 0

    .line 742
    iput-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$49;->val$r:Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 745
    :try_start_0
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$49;->val$r:Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;

    invoke-virtual {v0}, Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;->run()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 747
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "UniWebView should run on UI thread: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/onevcat/uniwebview/Logger;->critical(Ljava/lang/String;)V

    :goto_0
    return-void
.end method
