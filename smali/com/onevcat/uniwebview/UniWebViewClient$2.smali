.class Lcom/onevcat/uniwebview/UniWebViewClient$2;
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

.field final synthetic val$host:Ljava/lang/String;

.field final synthetic val$passwordText:Landroid/widget/EditText;

.field final synthetic val$realm:Ljava/lang/String;

.field final synthetic val$userText:Landroid/widget/EditText;

.field final synthetic val$view:Landroid/webkit/WebView;


# direct methods
.method constructor <init>(Lcom/onevcat/uniwebview/UniWebViewClient;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/HttpAuthHandler;)V
    .locals 0

    .line 189
    iput-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewClient$2;->this$0:Lcom/onevcat/uniwebview/UniWebViewClient;

    iput-object p2, p0, Lcom/onevcat/uniwebview/UniWebViewClient$2;->val$userText:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/onevcat/uniwebview/UniWebViewClient$2;->val$passwordText:Landroid/widget/EditText;

    iput-object p4, p0, Lcom/onevcat/uniwebview/UniWebViewClient$2;->val$view:Landroid/webkit/WebView;

    iput-object p5, p0, Lcom/onevcat/uniwebview/UniWebViewClient$2;->val$host:Ljava/lang/String;

    iput-object p6, p0, Lcom/onevcat/uniwebview/UniWebViewClient$2;->val$realm:Ljava/lang/String;

    iput-object p7, p0, Lcom/onevcat/uniwebview/UniWebViewClient$2;->val$handler:Landroid/webkit/HttpAuthHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    .line 191
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewClient$2;->val$userText:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 192
    iget-object p2, p0, Lcom/onevcat/uniwebview/UniWebViewClient$2;->val$passwordText:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    .line 194
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewClient$2;->val$view:Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/onevcat/uniwebview/UniWebViewClient$2;->val$host:Ljava/lang/String;

    iget-object v2, p0, Lcom/onevcat/uniwebview/UniWebViewClient$2;->val$realm:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, p1, p2}, Landroid/webkit/WebView;->setHttpAuthUsernamePassword(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 196
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewClient$2;->val$handler:Landroid/webkit/HttpAuthHandler;

    invoke-virtual {v0, p1, p2}, Landroid/webkit/HttpAuthHandler;->proceed(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
