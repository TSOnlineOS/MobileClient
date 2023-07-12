.class final Lcom/onevcat/uniwebview/UniWebViewInterface$20;
.super Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;
.source "UniWebViewInterface.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/onevcat/uniwebview/UniWebViewInterface;->setUserAgent(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$logger:Lcom/onevcat/uniwebview/Logger;

.field final synthetic val$name:Ljava/lang/String;

.field final synthetic val$userAgent:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Lcom/onevcat/uniwebview/Logger;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 374
    iput-object p2, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$20;->val$logger:Lcom/onevcat/uniwebview/Logger;

    iput-object p3, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$20;->val$userAgent:Ljava/lang/String;

    iput-object p4, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$20;->val$name:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method runWith(Lcom/onevcat/uniwebview/UniWebViewDialog;)V
    .locals 3

    .line 377
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$20;->val$logger:Lcom/onevcat/uniwebview/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Setting user agent string of web view to:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$20;->val$userAgent:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->verbose(Ljava/lang/String;)V

    .line 378
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$20;->val$name:Ljava/lang/String;

    iget-object v1, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$20;->val$userAgent:Ljava/lang/String;

    invoke-static {p1, v0, v1}, Lcom/onevcat/uniwebview/UniWebViewDialog;->setUserAgent(Lcom/onevcat/uniwebview/UniWebViewDialog;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
