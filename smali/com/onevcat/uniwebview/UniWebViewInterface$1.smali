.class final Lcom/onevcat/uniwebview/UniWebViewInterface$1;
.super Ljava/lang/Object;
.source "UniWebViewInterface.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/onevcat/uniwebview/UniWebViewInterface;->prepare()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$latch:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method constructor <init>(Landroid/app/Activity;Ljava/util/concurrent/CountDownLatch;)V
    .locals 0

    .line 33
    iput-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$1;->val$activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$1;->val$latch:Ljava/util/concurrent/CountDownLatch;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 36
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$1;->val$activity:Landroid/app/Activity;

    invoke-static {v0}, Landroid/webkit/WebSettings;->getDefaultUserAgent(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/onevcat/uniwebview/UniWebViewDialog;->defaultUserAgent:Ljava/lang/String;

    .line 37
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$1;->val$latch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    return-void
.end method
