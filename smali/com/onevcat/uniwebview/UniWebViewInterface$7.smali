.class final Lcom/onevcat/uniwebview/UniWebViewInterface$7;
.super Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;
.source "UniWebViewInterface.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/onevcat/uniwebview/UniWebViewInterface;->stop(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$name:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 186
    iput-object p2, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$7;->val$name:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 189
    invoke-static {}, Lcom/onevcat/uniwebview/UniWebViewManager;->getInstance()Lcom/onevcat/uniwebview/UniWebViewManager;

    move-result-object v0

    iget-object v1, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$7;->val$name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/UniWebViewManager;->getUniWebViewDialog(Ljava/lang/String;)Lcom/onevcat/uniwebview/UniWebViewDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 191
    invoke-virtual {v0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->stop()V

    :cond_0
    return-void
.end method
