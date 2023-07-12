.class Lcom/onevcat/uniwebview/UniWebViewClient$1;
.super Ljava/lang/Object;
.source "UniWebViewClient.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/onevcat/uniwebview/UniWebViewClient;->showHttpAuthDialog(Landroid/webkit/WebView;Landroid/webkit/HttpAuthHandler;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/onevcat/uniwebview/UniWebViewClient;

.field final synthetic val$handler:Landroid/webkit/HttpAuthHandler;


# direct methods
.method constructor <init>(Lcom/onevcat/uniwebview/UniWebViewClient;Landroid/webkit/HttpAuthHandler;)V
    .locals 0

    .line 199
    iput-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewClient$1;->this$0:Lcom/onevcat/uniwebview/UniWebViewClient;

    iput-object p2, p0, Lcom/onevcat/uniwebview/UniWebViewClient$1;->val$handler:Landroid/webkit/HttpAuthHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 201
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewClient$1;->val$handler:Landroid/webkit/HttpAuthHandler;

    invoke-virtual {p1}, Landroid/webkit/HttpAuthHandler;->cancel()V

    return-void
.end method
