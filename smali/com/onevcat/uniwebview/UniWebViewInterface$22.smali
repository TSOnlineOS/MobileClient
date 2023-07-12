.class final Lcom/onevcat/uniwebview/UniWebViewInterface$22;
.super Ljava/lang/Object;
.source "UniWebViewInterface.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/onevcat/uniwebview/UniWebViewInterface;->clearHttpAuthUsernamePassword(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$host:Ljava/lang/String;

.field final synthetic val$realm:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 435
    iput-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$22;->val$activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$22;->val$host:Ljava/lang/String;

    iput-object p3, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$22;->val$realm:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 438
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewDialog;

    iget-object v1, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$22;->val$activity:Landroid/app/Activity;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/onevcat/uniwebview/UniWebViewDialog;-><init>(Landroid/app/Activity;Lcom/onevcat/uniwebview/UniWebViewDialog$DialogListener;)V

    .line 439
    iget-object v1, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$22;->val$host:Ljava/lang/String;

    iget-object v2, p0, Lcom/onevcat/uniwebview/UniWebViewInterface$22;->val$realm:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/onevcat/uniwebview/UniWebViewDialog;->clearHttpAuthUsernamePassword(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
