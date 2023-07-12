.class Lcom/onevcat/uniwebview/UniWebView$1;
.super Ljava/lang/Object;
.source "UniWebView.java"

# interfaces
.implements Landroid/view/MenuItem$OnMenuItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/onevcat/uniwebview/UniWebView;->onCreateContextMenu(Landroid/view/ContextMenu;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/onevcat/uniwebview/UniWebView;

.field final synthetic val$downloadUrl:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/onevcat/uniwebview/UniWebView;Ljava/lang/String;)V
    .locals 0

    .line 154
    iput-object p1, p0, Lcom/onevcat/uniwebview/UniWebView$1;->this$0:Lcom/onevcat/uniwebview/UniWebView;

    iput-object p2, p0, Lcom/onevcat/uniwebview/UniWebView$1;->val$downloadUrl:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 5

    .line 157
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v0, 0x0

    const/4 v1, 0x1

    const/16 v2, 0x17

    if-lt p1, v2, :cond_0

    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebView$1;->this$0:Lcom/onevcat/uniwebview/UniWebView;

    invoke-static {p1}, Lcom/onevcat/uniwebview/UniWebView;->access$000(Lcom/onevcat/uniwebview/UniWebView;)Landroid/app/Activity;

    move-result-object p1

    const-string v2, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-virtual {p1, v2}, Landroid/app/Activity;->checkSelfPermission(Ljava/lang/String;)I

    move-result p1

    if-eqz p1, :cond_0

    .line 158
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebView$1;->this$0:Lcom/onevcat/uniwebview/UniWebView;

    invoke-static {p1}, Lcom/onevcat/uniwebview/UniWebView;->access$000(Lcom/onevcat/uniwebview/UniWebView;)Landroid/app/Activity;

    move-result-object p1

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2, v1}, Landroid/app/Activity;->requestPermissions([Ljava/lang/String;I)V

    .line 159
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebView$1;->this$0:Lcom/onevcat/uniwebview/UniWebView;

    invoke-virtual {p1}, Lcom/onevcat/uniwebview/UniWebView;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v2, "No external storage write permission."

    invoke-static {p1, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return v0

    .line 163
    :cond_0
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebView$1;->val$downloadUrl:Ljava/lang/String;

    invoke-static {p1}, Landroid/webkit/URLUtil;->isValidUrl(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 164
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebView$1;->val$downloadUrl:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {p1}, Landroid/webkit/MimeTypeMap;->getFileExtensionFromUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v2, v3}, Landroid/webkit/URLUtil;->guessFileName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 165
    new-instance v2, Landroid/app/DownloadManager$Request;

    iget-object v3, p0, Lcom/onevcat/uniwebview/UniWebView$1;->val$downloadUrl:Ljava/lang/String;

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/app/DownloadManager$Request;-><init>(Landroid/net/Uri;)V

    .line 166
    invoke-virtual {v2}, Landroid/app/DownloadManager$Request;->allowScanningByMediaScanner()V

    .line 167
    invoke-virtual {v2, v1}, Landroid/app/DownloadManager$Request;->setNotificationVisibility(I)Landroid/app/DownloadManager$Request;

    .line 168
    invoke-virtual {v2, p1}, Landroid/app/DownloadManager$Request;->setDescription(Ljava/lang/CharSequence;)Landroid/app/DownloadManager$Request;

    .line 169
    invoke-virtual {v2, p1}, Landroid/app/DownloadManager$Request;->setTitle(Ljava/lang/CharSequence;)Landroid/app/DownloadManager$Request;

    .line 170
    sget-object v3, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    invoke-virtual {v2, v3, p1}, Landroid/app/DownloadManager$Request;->setDestinationInExternalPublicDir(Ljava/lang/String;Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    .line 172
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebView$1;->this$0:Lcom/onevcat/uniwebview/UniWebView;

    invoke-virtual {p1}, Lcom/onevcat/uniwebview/UniWebView;->getCustomizeHeaders()Ljava/util/HashMap;

    move-result-object p1

    .line 173
    invoke-virtual {p1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 174
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 175
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 176
    invoke-virtual {v2, v4, v3}, Landroid/app/DownloadManager$Request;->addRequestHeader(Ljava/lang/String;Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    goto :goto_0

    .line 179
    :cond_1
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebView$1;->this$0:Lcom/onevcat/uniwebview/UniWebView;

    invoke-virtual {p1}, Lcom/onevcat/uniwebview/UniWebView;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v3, "download"

    invoke-virtual {p1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/DownloadManager;

    .line 180
    invoke-virtual {p1, v2}, Landroid/app/DownloadManager;->enqueue(Landroid/app/DownloadManager$Request;)J

    .line 181
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebView$1;->this$0:Lcom/onevcat/uniwebview/UniWebView;

    invoke-virtual {p1}, Lcom/onevcat/uniwebview/UniWebView;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v2, "Download Started."

    invoke-static {p1, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    goto :goto_1

    .line 183
    :cond_2
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebView$1;->this$0:Lcom/onevcat/uniwebview/UniWebView;

    invoke-virtual {p1}, Lcom/onevcat/uniwebview/UniWebView;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v2, "Invalid URL."

    invoke-static {p1, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :goto_1
    return v0
.end method
