.class final Lcom/onevcat/uniwebview/UniWebViewInterface$16;
.super Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;
.source "UniWebViewInterface.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/onevcat/uniwebview/UniWebViewInterface;->evaluateJavaScript(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$identifier:Ljava/lang/String;

.field final synthetic val$jsString:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 327
    iput-object p2, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$16;->val$jsString:Ljava/lang/String;

    iput-object p3, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$16;->val$identifier:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method runWith(Lcom/onevcat/uniwebview/UniWebViewDialog;)V
    .locals 2

    .line 330
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$16;->val$jsString:Ljava/lang/String;

    iget-object v1, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$16;->val$identifier:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/onevcat/uniwebview/UniWebViewDialog;->evaluateJavaScript(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
