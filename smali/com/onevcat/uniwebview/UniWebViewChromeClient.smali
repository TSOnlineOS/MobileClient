.class public Lcom/onevcat/uniwebview/UniWebViewChromeClient;
.super Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;
.source "UniWebViewChromeClient.java"


# instance fields
.field private activity:Landroid/app/Activity;

.field private alertDialog:Landroid/app/AlertDialog;

.field private callback:Landroid/webkit/ValueCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/webkit/ValueCallback<",
            "[",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field

.field private cameraPhotoPath:Ljava/lang/String;

.field private dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

.field private params:Landroid/webkit/WebChromeClient$FileChooserParams;


# direct methods
.method constructor <init>(Landroid/app/Activity;Landroid/view/View;Landroid/view/ViewGroup;Landroid/view/View;Lcom/onevcat/uniwebview/UniWebView;Lcom/onevcat/uniwebview/UniWebViewDialog;)V
    .locals 0

    .line 54
    invoke-direct {p0, p2, p3, p4, p5}, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;-><init>(Landroid/view/View;Landroid/view/ViewGroup;Landroid/view/View;Lcom/onevcat/uniwebview/VideoEnabledWebView;)V

    .line 55
    iput-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->activity:Landroid/app/Activity;

    .line 56
    iput-object p6, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    return-void
.end method

.method static synthetic access$000(Lcom/onevcat/uniwebview/UniWebViewChromeClient;)Lcom/onevcat/uniwebview/UniWebViewDialog;
    .locals 0

    .line 37
    iget-object p0, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    return-object p0
.end method

.method static synthetic access$102(Lcom/onevcat/uniwebview/UniWebViewChromeClient;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0

    .line 37
    iput-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->alertDialog:Landroid/app/AlertDialog;

    return-object p1
.end method

.method private copyInputStreamToFile(Ljava/io/InputStream;Ljava/io/File;)V
    .locals 3

    .line 277
    :try_start_0
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const/16 p2, 0x400

    new-array p2, p2, [B

    .line 280
    :goto_0
    invoke-virtual {p1, p2}, Ljava/io/InputStream;->read([B)I

    move-result v1

    if-lez v1, :cond_0

    const/4 v2, 0x0

    .line 281
    invoke-virtual {v0, p2, v2, v1}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    .line 283
    :cond_0
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 284
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    .line 286
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_1
    return-void
.end method

.method private showAlert()V
    .locals 3

    .line 115
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    invoke-virtual {v0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getImmersiveMode()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 116
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setFlags(II)V

    .line 117
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 118
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    iget-object v2, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    .line 119
    invoke-virtual {v2}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v2

    .line 118
    invoke-virtual {v0, v2}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 121
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    goto :goto_0

    .line 123
    :cond_0
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    :goto_0
    return-void
.end method

.method private uriToFilename(Landroid/net/Uri;)Ljava/lang/String;
    .locals 1

    .line 291
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->activity:Landroid/app/Activity;

    invoke-static {v0, p1}, Lcom/onevcat/uniwebview/ProviderPathConverter;->getPath(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method createImageFile()Ljava/io/File;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 296
    new-instance v0, Ljava/text/SimpleDateFormat;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "yyyyMMdd_HHmmss"

    invoke-direct {v0, v2, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    .line 297
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "IMAGE_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "_"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 298
    sget-object v1, Landroid/os/Environment;->DIRECTORY_PICTURES:Ljava/lang/String;

    invoke-static {v1}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    const-string v2, ".png"

    .line 299
    invoke-static {v0, v2, v1}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method createTempFile(Landroid/net/Uri;)Ljava/io/File;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 307
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v2, p1

    .line 308
    invoke-virtual/range {v1 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Landroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 311
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "_display_name"

    .line 312
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const-string v0, ""

    .line 315
    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    const/4 p1, 0x0

    .line 317
    invoke-static {v0, p1, p1}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object p1

    return-object p1
.end method

.method getAlertDialog()Landroid/app/AlertDialog;
    .locals 1

    .line 48
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->alertDialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method getCameraPhotoPath()Ljava/lang/String;
    .locals 1

    .line 329
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->cameraPhotoPath:Ljava/lang/String;

    return-object v0
.end method

.method getFileChooserParams()Landroid/webkit/WebChromeClient$FileChooserParams;
    .locals 1

    .line 111
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->params:Landroid/webkit/WebChromeClient$FileChooserParams;

    return-object v0
.end method

.method public onGeolocationPermissionsShowPrompt(Ljava/lang/String;Landroid/webkit/GeolocationPermissions$Callback;)V
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 212
    invoke-interface {p2, p1, v0, v1}, Landroid/webkit/GeolocationPermissions$Callback;->invoke(Ljava/lang/String;ZZ)V

    return-void
.end method

.method public onJsAlert(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
    .locals 1

    .line 129
    new-instance p1, Landroid/app/AlertDialog$Builder;

    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    invoke-virtual {v0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 131
    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 132
    invoke-virtual {p1, p3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const/4 p2, 0x0

    .line 133
    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const p2, 0x1080027

    .line 134
    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance p2, Lcom/onevcat/uniwebview/UniWebViewChromeClient$2;

    invoke-direct {p2, p0, p4}, Lcom/onevcat/uniwebview/UniWebViewChromeClient$2;-><init>(Lcom/onevcat/uniwebview/UniWebViewChromeClient;Landroid/webkit/JsResult;)V

    const p3, 0x104000a

    .line 135
    invoke-virtual {p1, p3, p2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 141
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    iput-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->alertDialog:Landroid/app/AlertDialog;

    .line 142
    invoke-direct {p0}, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->showAlert()V

    const/4 p1, 0x1

    return p1
.end method

.method public onJsConfirm(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
    .locals 1

    .line 148
    new-instance p1, Landroid/app/AlertDialog$Builder;

    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    invoke-virtual {v0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 150
    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 151
    invoke-virtual {p1, p3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const p2, 0x108009b

    .line 152
    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const/4 p2, 0x0

    .line 153
    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance p2, Lcom/onevcat/uniwebview/UniWebViewChromeClient$4;

    invoke-direct {p2, p0, p4}, Lcom/onevcat/uniwebview/UniWebViewChromeClient$4;-><init>(Lcom/onevcat/uniwebview/UniWebViewChromeClient;Landroid/webkit/JsResult;)V

    const p3, 0x1040013

    .line 154
    invoke-virtual {p1, p3, p2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance p2, Lcom/onevcat/uniwebview/UniWebViewChromeClient$3;

    invoke-direct {p2, p0, p4}, Lcom/onevcat/uniwebview/UniWebViewChromeClient$3;-><init>(Lcom/onevcat/uniwebview/UniWebViewChromeClient;Landroid/webkit/JsResult;)V

    const p3, 0x1040009

    .line 161
    invoke-virtual {p1, p3, p2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 167
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    iput-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->alertDialog:Landroid/app/AlertDialog;

    .line 168
    invoke-direct {p0}, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->showAlert()V

    const/4 p1, 0x1

    return p1
.end method

.method public onJsPrompt(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsPromptResult;)Z
    .locals 0

    .line 174
    new-instance p1, Landroid/app/AlertDialog$Builder;

    iget-object p4, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    invoke-virtual {p4}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getContext()Landroid/content/Context;

    move-result-object p4

    invoke-direct {p1, p4}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 176
    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    .line 177
    invoke-virtual {p2, p3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    const p3, 0x108009b

    .line 178
    invoke-virtual {p2, p3}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    const/4 p3, 0x0

    .line 179
    invoke-virtual {p2, p3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 181
    new-instance p2, Landroid/widget/EditText;

    iget-object p3, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    invoke-virtual {p3}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-direct {p2, p3}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 182
    invoke-virtual {p2}, Landroid/widget/EditText;->setSingleLine()V

    .line 183
    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 185
    new-instance p3, Lcom/onevcat/uniwebview/UniWebViewChromeClient$5;

    invoke-direct {p3, p0, p2, p5}, Lcom/onevcat/uniwebview/UniWebViewChromeClient$5;-><init>(Lcom/onevcat/uniwebview/UniWebViewChromeClient;Landroid/widget/EditText;Landroid/webkit/JsPromptResult;)V

    const p2, 0x1040013

    invoke-virtual {p1, p2, p3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 198
    new-instance p2, Lcom/onevcat/uniwebview/UniWebViewChromeClient$6;

    invoke-direct {p2, p0, p5}, Lcom/onevcat/uniwebview/UniWebViewChromeClient$6;-><init>(Lcom/onevcat/uniwebview/UniWebViewChromeClient;Landroid/webkit/JsPromptResult;)V

    const p3, 0x1040009

    invoke-virtual {p1, p3, p2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 206
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    iput-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->alertDialog:Landroid/app/AlertDialog;

    .line 207
    invoke-direct {p0}, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->showAlert()V

    const/4 p1, 0x1

    return p1
.end method

.method public onPermissionRequest(Landroid/webkit/PermissionRequest;)V
    .locals 3

    .line 86
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "UniWebViewChromeClient onPermissionRequest, url: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/webkit/PermissionRequest;->getOrigin()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 89
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->activity:Landroid/app/Activity;

    new-instance v1, Lcom/onevcat/uniwebview/UniWebViewChromeClient$1;

    invoke-direct {v1, p0, p1}, Lcom/onevcat/uniwebview/UniWebViewChromeClient$1;-><init>(Lcom/onevcat/uniwebview/UniWebViewChromeClient;Landroid/webkit/PermissionRequest;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onShowFileChooser(Landroid/webkit/WebView;Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebView;",
            "Landroid/webkit/ValueCallback<",
            "[",
            "Landroid/net/Uri;",
            ">;",
            "Landroid/webkit/WebChromeClient$FileChooserParams;",
            ")Z"
        }
    .end annotation

    .line 62
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object p1

    const-string v0, "UniWebViewChromeClient onShowFileChooser."

    invoke-virtual {p1, v0}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 63
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->callback:Landroid/webkit/ValueCallback;

    if-eqz p1, :cond_0

    .line 64
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object p1

    const-string v0, "Trying to show another file chooser before previous one finished. Discard previous upload!"

    invoke-virtual {p1, v0}, Lcom/onevcat/uniwebview/Logger;->critical(Ljava/lang/String;)V

    .line 65
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->callback:Landroid/webkit/ValueCallback;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    .line 68
    :cond_0
    iput-object p2, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->callback:Landroid/webkit/ValueCallback;

    .line 69
    iput-object p3, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->params:Landroid/webkit/WebChromeClient$FileChooserParams;

    .line 71
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object p1

    const-string p2, "Start file chooser activity."

    invoke-virtual {p1, p2}, Lcom/onevcat/uniwebview/Logger;->verbose(Ljava/lang/String;)V

    .line 73
    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 74
    new-instance p2, Lcom/onevcat/uniwebview/ObjectWrapperForBinder;

    invoke-direct {p2, p0}, Lcom/onevcat/uniwebview/ObjectWrapperForBinder;-><init>(Ljava/lang/Object;)V

    const-string p3, "chromeClient"

    invoke-virtual {p1, p3, p2}, Landroid/os/Bundle;->putBinder(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 76
    iget-object p2, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->activity:Landroid/app/Activity;

    sput-object p2, Lcom/onevcat/uniwebview/UniWebViewFileChooserActivity;->mainActivity:Landroid/app/Activity;

    .line 77
    new-instance p2, Landroid/content/Intent;

    iget-object p3, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->activity:Landroid/app/Activity;

    const-class v0, Lcom/onevcat/uniwebview/UniWebViewFileChooserActivity;

    invoke-direct {p2, p3, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 78
    invoke-virtual {p2, p1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 79
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->activity:Landroid/app/Activity;

    invoke-virtual {p1, p2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    const/4 p1, 0x1

    return p1
.end method

.method receivedFileValue(Landroid/content/Intent;Z)V
    .locals 8

    const-string v0, "Can not get correct path on disk storage."

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz p1, :cond_5

    .line 218
    invoke-virtual {p1}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v4

    .line 219
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    if-eqz v4, :cond_0

    .line 221
    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 223
    :cond_0
    invoke-virtual {p1}, Landroid/content/Intent;->getClipData()Landroid/content/ClipData;

    move-result-object v4

    if-eqz v4, :cond_1

    const/4 v6, 0x0

    .line 225
    :goto_0
    invoke-virtual {v4}, Landroid/content/ClipData;->getItemCount()I

    move-result v7

    if-ge v6, v7, :cond_1

    .line 226
    invoke-virtual {v4, v6}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object v7

    .line 227
    invoke-virtual {v7}, Landroid/content/ClipData$Item;->getUri()Landroid/net/Uri;

    move-result-object v7

    .line 228
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 232
    :cond_1
    :goto_1
    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_2

    if-eqz p2, :cond_6

    .line 233
    iget-object p2, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->cameraPhotoPath:Ljava/lang/String;

    if-eqz p2, :cond_6

    .line 234
    invoke-virtual {p1}, Landroid/content/Intent;->getClipData()Landroid/content/ClipData;

    move-result-object p1

    invoke-virtual {p1, v3}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/ClipData$Item;->getUri()Landroid/net/Uri;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->uriToFilename(Landroid/net/Uri;)Ljava/lang/String;

    new-array p1, v2, [Landroid/net/Uri;

    .line 235
    iget-object p2, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->cameraPhotoPath:Ljava/lang/String;

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    aput-object p2, p1, v3

    goto/16 :goto_4

    .line 238
    :cond_2
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    const/4 p2, 0x0

    .line 239
    :goto_2
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge p2, v2, :cond_4

    .line 240
    invoke-virtual {v5, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/Uri;

    .line 241
    invoke-direct {p0, v2}, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->uriToFilename(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 243
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 246
    :cond_3
    :try_start_0
    iget-object v4, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->activity:Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v4

    .line 247
    invoke-virtual {p0, v2}, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->createTempFile(Landroid/net/Uri;)Ljava/io/File;

    move-result-object v2

    .line 248
    invoke-direct {p0, v4, v2}, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->copyInputStreamToFile(Ljava/io/InputStream;Ljava/io/File;)V

    .line 249
    invoke-static {v2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    move-exception v2

    .line 254
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    .line 255
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/onevcat/uniwebview/Logger;->critical(Ljava/lang/String;)V

    goto :goto_3

    :catch_1
    move-exception v2

    .line 251
    invoke-virtual {v2}, Ljava/io/FileNotFoundException;->printStackTrace()V

    .line 252
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/onevcat/uniwebview/Logger;->critical(Ljava/lang/String;)V

    :goto_3
    add-int/lit8 p2, p2, 0x1

    goto :goto_2

    :cond_4
    new-array p2, v3, [Landroid/net/Uri;

    .line 259
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Landroid/net/Uri;

    goto :goto_4

    :cond_5
    if-eqz p2, :cond_6

    .line 262
    iget-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->cameraPhotoPath:Ljava/lang/String;

    if-eqz p1, :cond_6

    new-array p2, v2, [Landroid/net/Uri;

    .line 263
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    aput-object p1, p2, v3

    move-object p1, p2

    goto :goto_4

    :cond_6
    move-object p1, v1

    .line 267
    :goto_4
    iget-object p2, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->callback:Landroid/webkit/ValueCallback;

    if-eqz p2, :cond_7

    .line 268
    invoke-interface {p2, p1}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    .line 271
    :cond_7
    iput-object v1, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->callback:Landroid/webkit/ValueCallback;

    .line 272
    iput-object v1, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->params:Landroid/webkit/WebChromeClient$FileChooserParams;

    return-void
.end method

.method setCameraPhotoPath(Ljava/lang/String;)V
    .locals 0

    .line 325
    iput-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->cameraPhotoPath:Ljava/lang/String;

    return-void
.end method
