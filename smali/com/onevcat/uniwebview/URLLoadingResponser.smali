.class Lcom/onevcat/uniwebview/URLLoadingResponser;
.super Ljava/lang/Object;
.source "URLLoadingResponser.java"


# instance fields
.field private final context:Landroid/content/Context;

.field private final dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

.field private final logger:Lcom/onevcat/uniwebview/Logger;

.field private url:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/onevcat/uniwebview/UniWebViewDialog;Ljava/lang/String;)V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->context:Landroid/content/Context;

    .line 31
    iput-object p2, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    .line 32
    iput-object p3, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->url:Ljava/lang/String;

    .line 33
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object p1

    iput-object p1, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->logger:Lcom/onevcat/uniwebview/Logger;

    return-void
.end method

.method private explicitlyIntent()Landroid/content/Intent;
    .locals 5

    .line 69
    invoke-direct {p0}, Lcom/onevcat/uniwebview/URLLoadingResponser;->getLowerUrl()Ljava/lang/String;

    move-result-object v0

    const-string v1, "intent:"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 72
    :cond_0
    iget-object v0, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->logger:Lcom/onevcat/uniwebview/Logger;

    const-string v2, "Received intent url..."

    invoke-virtual {v0, v2}, Lcom/onevcat/uniwebview/Logger;->debug(Ljava/lang/String;)V

    .line 74
    :try_start_0
    iget-object v0, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->url:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-static {v0, v2}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v0

    .line 75
    iget-object v2, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const/high16 v3, 0x10000

    invoke-virtual {v2, v0, v3}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v2

    if-eqz v2, :cond_1

    return-object v0

    .line 79
    :cond_1
    invoke-virtual {v0}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_2

    return-object v1

    .line 83
    :cond_2
    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 84
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "market://details?id="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    :catch_0
    move-exception v0

    .line 88
    iget-object v2, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->logger:Lcom/onevcat/uniwebview/Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Parsing intent url error. "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Lcom/onevcat/uniwebview/Logger;->critical(Ljava/lang/String;)V

    return-object v1
.end method

.method private getLowerUrl()Ljava/lang/String;
    .locals 2

    .line 26
    iget-object v0, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->url:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private mailToIntent()Landroid/content/Intent;
    .locals 3

    .line 61
    invoke-direct {p0}, Lcom/onevcat/uniwebview/URLLoadingResponser;->getLowerUrl()Ljava/lang/String;

    move-result-object v0

    const-string v1, "mailto:"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 64
    :cond_0
    iget-object v0, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->logger:Lcom/onevcat/uniwebview/Logger;

    const-string v1, "Received mailto url..."

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->debug(Ljava/lang/String;)V

    .line 65
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->url:Ljava/lang/String;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const-string v2, "android.intent.action.SENDTO"

    invoke-direct {v0, v2, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    return-object v0
.end method

.method private marketIntent()Landroid/content/Intent;
    .locals 5

    .line 94
    invoke-direct {p0}, Lcom/onevcat/uniwebview/URLLoadingResponser;->getLowerUrl()Ljava/lang/String;

    move-result-object v0

    const-string v1, "market:"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 97
    :cond_0
    iget-object v0, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->logger:Lcom/onevcat/uniwebview/Logger;

    const-string v2, "Received market url..."

    invoke-virtual {v0, v2}, Lcom/onevcat/uniwebview/Logger;->debug(Ljava/lang/String;)V

    .line 99
    :try_start_0
    iget-object v0, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->url:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-static {v0, v2}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v0
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 101
    iget-object v2, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->logger:Lcom/onevcat/uniwebview/Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Parsing market url error. "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/net/URISyntaxException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Lcom/onevcat/uniwebview/Logger;->critical(Ljava/lang/String;)V

    return-object v1
.end method

.method private telIntent()Landroid/content/Intent;
    .locals 3

    .line 53
    invoke-direct {p0}, Lcom/onevcat/uniwebview/URLLoadingResponser;->getLowerUrl()Ljava/lang/String;

    move-result-object v0

    const-string v1, "tel:"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 56
    :cond_0
    iget-object v0, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->logger:Lcom/onevcat/uniwebview/Logger;

    const-string v1, "Received tel url..."

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->debug(Ljava/lang/String;)V

    .line 57
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->url:Ljava/lang/String;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const-string v2, "android.intent.action.DIAL"

    invoke-direct {v0, v2, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    return-object v0
.end method

.method private thirdPartyAppIntent()Landroid/content/Intent;
    .locals 4

    .line 107
    invoke-direct {p0}, Lcom/onevcat/uniwebview/URLLoadingResponser;->getLowerUrl()Ljava/lang/String;

    move-result-object v0

    const-string v1, "http:"

    .line 108
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_2

    const-string v1, "https:"

    .line 109
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "file:"

    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "about:blank"

    .line 111
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 115
    :cond_0
    iget-object v0, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->url:Ljava/lang/String;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 116
    new-instance v1, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    invoke-direct {v1, v3, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 118
    iget-object v0, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const/4 v3, 0x0

    .line 119
    invoke-virtual {v0, v1, v3}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    .line 120
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_1

    return-object v2

    :cond_1
    return-object v1

    :cond_2
    :goto_0
    return-object v2
.end method

.method private tryToRunIntent(Landroid/content/Intent;)Z
    .locals 3

    if-eqz p1, :cond_1

    .line 128
    iget-object v0, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->context:Landroid/content/Context;

    if-eqz v0, :cond_0

    .line 130
    :try_start_0
    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 132
    :catch_0
    iget-object v0, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->logger:Lcom/onevcat/uniwebview/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No Activity found to handle Intent: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/onevcat/uniwebview/Logger;->critical(Ljava/lang/String;)V

    :cond_0
    :goto_0
    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method


# virtual methods
.method canResponseBuiltinScheme()Z
    .locals 2

    .line 168
    iget-object v0, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->url:Ljava/lang/String;

    const-string v1, "uniwebviewinternal://"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 169
    iget-object v0, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->url:Ljava/lang/String;

    const-string v1, "__uniwebview_internal_video_end"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 170
    iget-object v0, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    invoke-virtual {v0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getWebView()Lcom/onevcat/uniwebview/UniWebView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/onevcat/uniwebview/UniWebView;->notifyVideoEnd()V

    :cond_0
    const/4 v0, 0x1

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method canResponseDefinedScheme()Z
    .locals 4

    .line 155
    iget-object v0, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->logger:Lcom/onevcat/uniwebview/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Checking url could match with a defined url scheme: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->url:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->verbose(Ljava/lang/String;)V

    .line 156
    iget-object v0, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->dialog:Lcom/onevcat/uniwebview/UniWebViewDialog;

    invoke-virtual {v0}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getSchemes()Ljava/util/HashSet;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 157
    iget-object v2, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->url:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "://"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 158
    iget-object v0, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->logger:Lcom/onevcat/uniwebview/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Found url match scheme: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->url:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->verbose(Ljava/lang/String;)V

    const/4 v0, 0x1

    return v0

    .line 163
    :cond_1
    iget-object v0, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->logger:Lcom/onevcat/uniwebview/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Did not find a matched scheme for: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->url:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->verbose(Ljava/lang/String;)V

    const/4 v0, 0x0

    return v0
.end method

.method handleWithIntent()Z
    .locals 3

    .line 141
    iget-object v0, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->logger:Lcom/onevcat/uniwebview/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Checking url could be handled with any intents: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->url:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->verbose(Ljava/lang/String;)V

    .line 142
    invoke-direct {p0}, Lcom/onevcat/uniwebview/URLLoadingResponser;->mailToIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/onevcat/uniwebview/URLLoadingResponser;->tryToRunIntent(Landroid/content/Intent;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 143
    invoke-direct {p0}, Lcom/onevcat/uniwebview/URLLoadingResponser;->telIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/onevcat/uniwebview/URLLoadingResponser;->tryToRunIntent(Landroid/content/Intent;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 144
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/URLLoadingResponser;->smsIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/onevcat/uniwebview/URLLoadingResponser;->tryToRunIntent(Landroid/content/Intent;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 145
    invoke-direct {p0}, Lcom/onevcat/uniwebview/URLLoadingResponser;->explicitlyIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/onevcat/uniwebview/URLLoadingResponser;->tryToRunIntent(Landroid/content/Intent;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 146
    invoke-direct {p0}, Lcom/onevcat/uniwebview/URLLoadingResponser;->marketIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/onevcat/uniwebview/URLLoadingResponser;->tryToRunIntent(Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method handleWithThirdPartyApp()Z
    .locals 3

    .line 150
    iget-object v0, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->logger:Lcom/onevcat/uniwebview/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Checking url could be handled with any third party apps: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->url:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->verbose(Ljava/lang/String;)V

    .line 151
    invoke-direct {p0}, Lcom/onevcat/uniwebview/URLLoadingResponser;->thirdPartyAppIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/onevcat/uniwebview/URLLoadingResponser;->tryToRunIntent(Landroid/content/Intent;)Z

    move-result v0

    return v0
.end method

.method smsIntent()Landroid/content/Intent;
    .locals 5

    .line 37
    invoke-direct {p0}, Lcom/onevcat/uniwebview/URLLoadingResponser;->getLowerUrl()Ljava/lang/String;

    move-result-object v0

    const-string v1, "sms:"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 40
    :cond_0
    iget-object v0, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->logger:Lcom/onevcat/uniwebview/Logger;

    const-string v2, "Received sms url..."

    invoke-virtual {v0, v2}, Lcom/onevcat/uniwebview/Logger;->debug(Ljava/lang/String;)V

    .line 42
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    iget-object v3, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->url:Ljava/lang/String;

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string v2, "android.intent.category.DEFAULT"

    .line 43
    invoke-virtual {v0, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const-string v2, "android.intent.category.BROWSABLE"

    .line 44
    invoke-virtual {v0, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 47
    iget-object v2, p0, Lcom/onevcat/uniwebview/URLLoadingResponser;->logger:Lcom/onevcat/uniwebview/Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "sms url intent open exception: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Lcom/onevcat/uniwebview/Logger;->critical(Ljava/lang/String;)V

    return-object v1
.end method
