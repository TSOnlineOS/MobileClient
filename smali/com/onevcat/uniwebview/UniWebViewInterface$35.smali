.class final Lcom/onevcat/uniwebview/UniWebViewInterface$35;
.super Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;
.source "UniWebViewInterface.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/onevcat/uniwebview/UniWebViewInterface;->setZoomEnabled(Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$enabled:Z


# direct methods
.method constructor <init>(Ljava/lang/String;Z)V
    .locals 0

    .line 597
    iput-boolean p2, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$35;->val$enabled:Z

    invoke-direct {p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method runWith(Lcom/onevcat/uniwebview/UniWebViewDialog;)V
    .locals 1

    .line 600
    iget-boolean v0, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$35;->val$enabled:Z

    invoke-virtual {p1, v0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->setZoomEnabled(Z)V

    return-void
.end method