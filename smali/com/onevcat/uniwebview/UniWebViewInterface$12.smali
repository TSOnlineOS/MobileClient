.class final Lcom/onevcat/uniwebview/UniWebViewInterface$12;
.super Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;
.source "UniWebViewInterface.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/onevcat/uniwebview/UniWebViewInterface;->show(Ljava/lang/String;ZIFLjava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$duration:F

.field final synthetic val$edge:I

.field final synthetic val$fade:Z

.field final synthetic val$identifier:Ljava/lang/String;

.field final synthetic val$latch:Ljava/util/concurrent/CountDownLatch;

.field final synthetic val$result:[Z


# direct methods
.method constructor <init>(Ljava/lang/String;[ZZIFLjava/lang/String;Ljava/util/concurrent/CountDownLatch;)V
    .locals 0

    .line 255
    iput-object p2, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$12;->val$result:[Z

    iput-boolean p3, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$12;->val$fade:Z

    iput p4, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$12;->val$edge:I

    iput p5, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$12;->val$duration:F

    iput-object p6, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$12;->val$identifier:Ljava/lang/String;

    iput-object p7, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$12;->val$latch:Ljava/util/concurrent/CountDownLatch;

    invoke-direct {p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public runWith(Lcom/onevcat/uniwebview/UniWebViewDialog;)V
    .locals 7

    .line 258
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$12;->val$result:[Z

    iget-boolean v3, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$12;->val$fade:Z

    iget v4, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$12;->val$edge:I

    iget v5, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$12;->val$duration:F

    iget-object v6, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$12;->val$identifier:Ljava/lang/String;

    const/4 v2, 0x1

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Lcom/onevcat/uniwebview/UniWebViewDialog;->setShow(ZZIFLjava/lang/String;)Z

    move-result p1

    const/4 v1, 0x0

    aput-boolean p1, v0, v1

    .line 259
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$12;->val$latch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    return-void
.end method
