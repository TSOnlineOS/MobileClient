.class final Lcom/onevcat/uniwebview/UniWebViewInterface$14;
.super Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;
.source "UniWebViewInterface.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/onevcat/uniwebview/UniWebViewInterface;->animateTo(Ljava/lang/String;IIIIFFLjava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$delay:F

.field final synthetic val$duration:F

.field final synthetic val$height:I

.field final synthetic val$identifier:Ljava/lang/String;

.field final synthetic val$latch:Ljava/util/concurrent/CountDownLatch;

.field final synthetic val$result:[Z

.field final synthetic val$width:I

.field final synthetic val$x:I

.field final synthetic val$y:I


# direct methods
.method constructor <init>(Ljava/lang/String;[ZIIIIFFLjava/lang/String;Ljava/util/concurrent/CountDownLatch;)V
    .locals 0

    .line 299
    iput-object p2, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$14;->val$result:[Z

    iput p3, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$14;->val$x:I

    iput p4, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$14;->val$y:I

    iput p5, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$14;->val$width:I

    iput p6, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$14;->val$height:I

    iput p7, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$14;->val$duration:F

    iput p8, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$14;->val$delay:F

    iput-object p9, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$14;->val$identifier:Ljava/lang/String;

    iput-object p10, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$14;->val$latch:Ljava/util/concurrent/CountDownLatch;

    invoke-direct {p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method runWith(Lcom/onevcat/uniwebview/UniWebViewDialog;)V
    .locals 9

    .line 302
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$14;->val$result:[Z

    iget v2, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$14;->val$x:I

    iget v3, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$14;->val$y:I

    iget v4, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$14;->val$width:I

    iget v5, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$14;->val$height:I

    iget v6, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$14;->val$duration:F

    iget v7, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$14;->val$delay:F

    iget-object v8, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$14;->val$identifier:Ljava/lang/String;

    move-object v1, p1

    invoke-virtual/range {v1 .. v8}, Lcom/onevcat/uniwebview/UniWebViewDialog;->animateTo(IIIIFFLjava/lang/String;)Z

    move-result p1

    const/4 v1, 0x0

    aput-boolean p1, v0, v1

    .line 303
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$14;->val$latch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    return-void
.end method
