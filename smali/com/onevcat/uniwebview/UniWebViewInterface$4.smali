.class final Lcom/onevcat/uniwebview/UniWebViewInterface$4;
.super Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;
.source "UniWebViewInterface.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/onevcat/uniwebview/UniWebViewInterface;->load(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 155
    iput-object p2, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$4;->val$url:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public runWith(Lcom/onevcat/uniwebview/UniWebViewDialog;)V
    .locals 1

    .line 158
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$4;->val$url:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->load(Ljava/lang/String;)V

    return-void
.end method
