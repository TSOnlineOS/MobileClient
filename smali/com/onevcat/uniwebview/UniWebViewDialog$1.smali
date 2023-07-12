.class Lcom/onevcat/uniwebview/UniWebViewDialog$1;
.super Ljava/lang/Object;
.source "UniWebViewDialog.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/onevcat/uniwebview/UniWebViewDialog;->setShow(ZZIFLjava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/onevcat/uniwebview/UniWebViewDialog;

.field final synthetic val$identifier:Ljava/lang/String;

.field final synthetic val$show:Z


# direct methods
.method constructor <init>(Lcom/onevcat/uniwebview/UniWebViewDialog;ZLjava/lang/String;)V
    .locals 0

    .line 327
    iput-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$1;->this$0:Lcom/onevcat/uniwebview/UniWebViewDialog;

    iput-boolean p2, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$1;->val$show:Z

    iput-object p3, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$1;->val$identifier:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 330
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$1;->this$0:Lcom/onevcat/uniwebview/UniWebViewDialog;

    iget-boolean v1, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$1;->val$show:Z

    iget-object v2, p0, Lcom/onevcat/uniwebview/UniWebViewDialog$1;->val$identifier:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/onevcat/uniwebview/UniWebViewDialog;->access$000(Lcom/onevcat/uniwebview/UniWebViewDialog;ZLjava/lang/String;)V

    return-void
.end method
