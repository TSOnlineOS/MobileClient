.class final Lcom/onevcat/uniwebview/UniWebViewInterface$39;
.super Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;
.source "UniWebViewInterface.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/onevcat/uniwebview/UniWebViewInterface;->removeSslExceptionDomain(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$domain:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 637
    iput-object p2, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$39;->val$domain:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/onevcat/uniwebview/UniWebViewInterface$DialogRunnable;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method runWith(Lcom/onevcat/uniwebview/UniWebViewDialog;)V
    .locals 1

    .line 640
    invoke-virtual {p1}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getSslExceptionDomains()Ljava/util/HashSet;

    move-result-object p1

    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$39;->val$domain:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    return-void
.end method
