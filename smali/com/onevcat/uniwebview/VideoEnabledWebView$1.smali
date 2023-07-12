.class Lcom/onevcat/uniwebview/VideoEnabledWebView$1;
.super Ljava/lang/Object;
.source "VideoEnabledWebView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/onevcat/uniwebview/VideoEnabledWebView;->notifyVideoEnd()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/onevcat/uniwebview/VideoEnabledWebView;


# direct methods
.method constructor <init>(Lcom/onevcat/uniwebview/VideoEnabledWebView;)V
    .locals 0

    .line 27
    iput-object p1, p0, Lcom/onevcat/uniwebview/VideoEnabledWebView$1;->this$0:Lcom/onevcat/uniwebview/VideoEnabledWebView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 31
    iget-object v0, p0, Lcom/onevcat/uniwebview/VideoEnabledWebView$1;->this$0:Lcom/onevcat/uniwebview/VideoEnabledWebView;

    invoke-static {v0}, Lcom/onevcat/uniwebview/VideoEnabledWebView;->access$000(Lcom/onevcat/uniwebview/VideoEnabledWebView;)Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 33
    iget-object v0, p0, Lcom/onevcat/uniwebview/VideoEnabledWebView$1;->this$0:Lcom/onevcat/uniwebview/VideoEnabledWebView;

    invoke-static {v0}, Lcom/onevcat/uniwebview/VideoEnabledWebView;->access$000(Lcom/onevcat/uniwebview/VideoEnabledWebView;)Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;

    move-result-object v0

    invoke-virtual {v0}, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->onHideCustomView()V

    :cond_0
    return-void
.end method
