.class final Lcom/onevcat/uniwebview/UniWebViewInterface$48;
.super Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;
.source "UniWebViewInterface.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/onevcat/uniwebview/UniWebViewInterface;->showWebViewDialog(Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$show:Z


# direct methods
.method constructor <init>(Ljava/lang/String;Z)V
    .locals 0

    .line 728
    iput-boolean p2, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$48;->val$show:Z

    invoke-direct {p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method runWith(Lcom/onevcat/uniwebview/UniWebViewDialog;)V
    .locals 1

    .line 731
    iget-boolean v0, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$48;->val$show:Z

    if-eqz v0, :cond_0

    .line 732
    invoke-virtual {p1}, Lcom/onevcat/uniwebview/UniWebViewDialog;->goForeground()V

    .line 733
    invoke-virtual {p1}, Lcom/onevcat/uniwebview/UniWebViewDialog;->hideSystemUI()V

    goto :goto_0

    .line 735
    :cond_0
    invoke-virtual {p1}, Lcom/onevcat/uniwebview/UniWebViewDialog;->goBackground()V

    :goto_0
    return-void
.end method
