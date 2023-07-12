.class public Lcom/onevcat/uniwebview/UniWebViewFileChooserActivity;
.super Landroid/app/Activity;
.source "UniWebViewFileChooserActivity.java"


# static fields
.field static final CHROME_CLIENT_BINDER_KEY:Ljava/lang/String; = "chromeClient"

.field private static final FILECHOOSER_RESULTCODE:I = 0x1258e43

.field private static final WRITE_EXTERNAL_STORAGE_REQUEST_CODE:I = 0x1258e44

.field static mainActivity:Landroid/app/Activity;


# instance fields
.field private chromeClient:Lcom/onevcat/uniwebview/UniWebViewChromeClient;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private startFileChooserActivity()V
    .locals 7

    .line 76
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.media.action.IMAGE_CAPTURE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 77
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebViewFileChooserActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 78
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v1

    const-string v3, "Found an activity for taking photo. Try to get image."

    invoke-virtual {v1, v3}, Lcom/onevcat/uniwebview/Logger;->verbose(Ljava/lang/String;)V

    .line 82
    :try_start_0
    iget-object v1, p0, Lcom/onevcat/uniwebview/UniWebViewFileChooserActivity;->chromeClient:Lcom/onevcat/uniwebview/UniWebViewChromeClient;

    invoke-virtual {v1}, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->createImageFile()Ljava/io/File;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 83
    :try_start_1
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "photoFile: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/onevcat/uniwebview/Logger;->verbose(Ljava/lang/String;)V

    const-string v3, "PhotoPath"

    .line 84
    iget-object v4, p0, Lcom/onevcat/uniwebview/UniWebViewFileChooserActivity;->chromeClient:Lcom/onevcat/uniwebview/UniWebViewChromeClient;

    invoke-virtual {v4}, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->getCameraPhotoPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception v3

    goto :goto_0

    :catch_1
    move-exception v3

    move-object v1, v2

    .line 87
    :goto_0
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Error while creating image file. Exception: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/onevcat/uniwebview/Logger;->critical(Ljava/lang/String;)V

    :goto_1
    if-eqz v1, :cond_0

    .line 92
    iget-object v2, p0, Lcom/onevcat/uniwebview/UniWebViewFileChooserActivity;->chromeClient:Lcom/onevcat/uniwebview/UniWebViewChromeClient;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "file:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->setCameraPhotoPath(Ljava/lang/String;)V

    .line 93
    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    const-string v2, "output"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    goto :goto_2

    :cond_0
    move-object v0, v2

    .line 100
    :cond_1
    :goto_2
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.OPEN_DOCUMENT"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "android.intent.category.OPENABLE"

    .line 101
    invoke-virtual {v1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 102
    iget-object v2, p0, Lcom/onevcat/uniwebview/UniWebViewFileChooserActivity;->chromeClient:Lcom/onevcat/uniwebview/UniWebViewChromeClient;

    invoke-virtual {v2}, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->getFileChooserParams()Landroid/webkit/WebChromeClient$FileChooserParams;

    move-result-object v2

    const-string v3, "*/*"

    .line 103
    invoke-virtual {v1, v3}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_2

    .line 105
    invoke-virtual {v2}, Landroid/webkit/WebChromeClient$FileChooserParams;->getAcceptTypes()[Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_2

    .line 106
    invoke-virtual {v2}, Landroid/webkit/WebChromeClient$FileChooserParams;->getAcceptTypes()[Ljava/lang/String;

    move-result-object v5

    array-length v5, v5

    if-lt v5, v4, :cond_2

    .line 107
    invoke-virtual {v2}, Landroid/webkit/WebChromeClient$FileChooserParams;->getAcceptTypes()[Ljava/lang/String;

    move-result-object v5

    aget-object v5, v5, v3

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 109
    invoke-virtual {v2}, Landroid/webkit/WebChromeClient$FileChooserParams;->getAcceptTypes()[Ljava/lang/String;

    move-result-object v2

    const-string v5, "android.intent.extra.MIME_TYPES"

    invoke-virtual {v1, v5, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    :cond_2
    const-string v2, "android.intent.extra.ALLOW_MULTIPLE"

    .line 111
    invoke-virtual {v1, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    if-eqz v0, :cond_3

    new-array v2, v4, [Landroid/content/Intent;

    aput-object v0, v2, v3

    goto :goto_3

    :cond_3
    new-array v2, v3, [Landroid/content/Intent;

    .line 121
    :goto_3
    new-instance v0, Landroid/content/Intent;

    const-string v3, "android.intent.action.CHOOSER"

    invoke-direct {v0, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v3, "android.intent.extra.TITLE"

    const-string v4, "Image Chooser"

    .line 122
    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v3, "android.intent.extra.INTENT"

    .line 123
    invoke-virtual {v0, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const-string v1, "android.intent.extra.INITIAL_INTENTS"

    .line 124
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Landroid/os/Parcelable;)Landroid/content/Intent;

    const v1, 0x1258e43

    .line 126
    invoke-virtual {p0, v0, v1}, Lcom/onevcat/uniwebview/UniWebViewFileChooserActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 3

    .line 61
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "File Chooser activity result: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->verbose(Ljava/lang/String;)V

    const v0, 0x1258e43

    if-ne p1, v0, :cond_1

    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 64
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "File chooser got a file. : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->info(Ljava/lang/String;)V

    .line 65
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewFileChooserActivity;->chromeClient:Lcom/onevcat/uniwebview/UniWebViewChromeClient;

    const/4 v1, 0x1

    invoke-virtual {v0, p3, v1}, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->receivedFileValue(Landroid/content/Intent;Z)V

    goto :goto_0

    .line 67
    :cond_0
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "File chooser failed to get a file. Result code: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->critical(Ljava/lang/String;)V

    .line 68
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewFileChooserActivity;->chromeClient:Lcom/onevcat/uniwebview/UniWebViewChromeClient;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->receivedFileValue(Landroid/content/Intent;Z)V

    .line 71
    :cond_1
    :goto_0
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 72
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebViewFileChooserActivity;->finish()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 34
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 36
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebViewFileChooserActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "chromeClient"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBinder(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object p1

    check-cast p1, Lcom/onevcat/uniwebview/ObjectWrapperForBinder;

    .line 37
    invoke-virtual {p1}, Lcom/onevcat/uniwebview/ObjectWrapperForBinder;->getData()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/onevcat/uniwebview/UniWebViewChromeClient;

    iput-object p1, p0, Lcom/onevcat/uniwebview/UniWebViewFileChooserActivity;->chromeClient:Lcom/onevcat/uniwebview/UniWebViewChromeClient;

    .line 39
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x17

    if-lt p1, v0, :cond_0

    const-string p1, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-virtual {p0, p1}, Lcom/onevcat/uniwebview/UniWebViewFileChooserActivity;->checkSelfPermission(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_0

    .line 40
    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    const v0, 0x1258e44

    invoke-virtual {p0, p1, v0}, Lcom/onevcat/uniwebview/UniWebViewFileChooserActivity;->requestPermissions([Ljava/lang/String;I)V

    goto :goto_0

    .line 42
    :cond_0
    invoke-direct {p0}, Lcom/onevcat/uniwebview/UniWebViewFileChooserActivity;->startFileChooserActivity()V

    :goto_0
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 0

    .line 48
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    const p2, 0x1258e44

    if-ne p1, p2, :cond_1

    const/4 p1, 0x0

    .line 50
    aget p2, p3, p1

    if-nez p2, :cond_0

    .line 51
    invoke-direct {p0}, Lcom/onevcat/uniwebview/UniWebViewFileChooserActivity;->startFileChooserActivity()V

    goto :goto_0

    .line 53
    :cond_0
    iget-object p2, p0, Lcom/onevcat/uniwebview/UniWebViewFileChooserActivity;->chromeClient:Lcom/onevcat/uniwebview/UniWebViewChromeClient;

    const/4 p3, 0x0

    invoke-virtual {p2, p3, p1}, Lcom/onevcat/uniwebview/UniWebViewChromeClient;->receivedFileValue(Landroid/content/Intent;Z)V

    .line 54
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebViewFileChooserActivity;->finish()V

    :cond_1
    :goto_0
    return-void
.end method
