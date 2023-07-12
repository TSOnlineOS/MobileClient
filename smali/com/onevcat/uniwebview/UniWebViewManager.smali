.class Lcom/onevcat/uniwebview/UniWebViewManager;
.super Ljava/lang/Object;
.source "UniWebViewManager.java"


# static fields
.field private static instance:Lcom/onevcat/uniwebview/UniWebViewManager;


# instance fields
.field private showingDialogs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/onevcat/uniwebview/UniWebViewDialog;",
            ">;"
        }
    .end annotation
.end field

.field private webViewDialog:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/onevcat/uniwebview/UniWebViewDialog;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewManager;->webViewDialog:Ljava/util/HashMap;

    .line 26
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewManager;->showingDialogs:Ljava/util/ArrayList;

    return-void
.end method

.method static getInstance()Lcom/onevcat/uniwebview/UniWebViewManager;
    .locals 1

    .line 30
    sget-object v0, Lcom/onevcat/uniwebview/UniWebViewManager;->instance:Lcom/onevcat/uniwebview/UniWebViewManager;

    if-nez v0, :cond_0

    .line 31
    new-instance v0, Lcom/onevcat/uniwebview/UniWebViewManager;

    invoke-direct {v0}, Lcom/onevcat/uniwebview/UniWebViewManager;-><init>()V

    sput-object v0, Lcom/onevcat/uniwebview/UniWebViewManager;->instance:Lcom/onevcat/uniwebview/UniWebViewManager;

    .line 33
    :cond_0
    sget-object v0, Lcom/onevcat/uniwebview/UniWebViewManager;->instance:Lcom/onevcat/uniwebview/UniWebViewManager;

    return-object v0
.end method


# virtual methods
.method addShowingDialog(Lcom/onevcat/uniwebview/UniWebViewDialog;)V
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewManager;->showingDialogs:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 61
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewManager;->showingDialogs:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method allDialogs()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lcom/onevcat/uniwebview/UniWebViewDialog;",
            ">;"
        }
    .end annotation

    .line 56
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewManager;->webViewDialog:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method getShowingDialogs()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/onevcat/uniwebview/UniWebViewDialog;",
            ">;"
        }
    .end annotation

    .line 89
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewManager;->showingDialogs:Ljava/util/ArrayList;

    return-object v0
.end method

.method getUniWebViewDialog(Ljava/lang/String;)Lcom/onevcat/uniwebview/UniWebViewDialog;
    .locals 1

    if-eqz p1, :cond_0

    .line 37
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewManager;->webViewDialog:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 38
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewManager;->webViewDialog:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/onevcat/uniwebview/UniWebViewDialog;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method handleTouchEvent(Lcom/onevcat/uniwebview/UniWebViewDialog;Landroid/app/Activity;Landroid/view/MotionEvent;)Z
    .locals 6

    .line 71
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/UniWebViewManager;->allDialogs()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/onevcat/uniwebview/UniWebViewDialog;

    if-eq v3, p1, :cond_0

    .line 74
    invoke-virtual {v3}, Lcom/onevcat/uniwebview/UniWebViewDialog;->getWebView()Lcom/onevcat/uniwebview/UniWebView;

    move-result-object v4

    invoke-virtual {v4}, Lcom/onevcat/uniwebview/UniWebView;->requestFocus()Z

    const/4 v4, 0x1

    .line 75
    iput-boolean v4, v3, Lcom/onevcat/uniwebview/UniWebViewDialog;->touchFromAnotherDialog:Z

    .line 76
    invoke-virtual {v3, p3}, Lcom/onevcat/uniwebview/UniWebViewDialog;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v5

    if-nez v5, :cond_2

    if-eqz v2, :cond_1

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    goto :goto_2

    :cond_2
    :goto_1
    const/4 v2, 0x1

    .line 77
    :goto_2
    iput-boolean v1, v3, Lcom/onevcat/uniwebview/UniWebViewDialog;->touchFromAnotherDialog:Z

    goto :goto_0

    :cond_3
    if-nez v2, :cond_4

    .line 83
    invoke-virtual {p2, p3}, Landroid/app/Activity;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    :cond_4
    return v1
.end method

.method removeShowingDialog(Lcom/onevcat/uniwebview/UniWebViewDialog;)V
    .locals 1

    .line 66
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewManager;->showingDialogs:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method removeUniWebView(Ljava/lang/String;)V
    .locals 3

    .line 44
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewManager;->webViewDialog:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 45
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Removing web view dialog from manager: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->debug(Ljava/lang/String;)V

    .line 46
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewManager;->webViewDialog:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method setUniWebView(Ljava/lang/String;Lcom/onevcat/uniwebview/UniWebViewDialog;)V
    .locals 3

    .line 51
    invoke-static {}, Lcom/onevcat/uniwebview/Logger;->getInstance()Lcom/onevcat/uniwebview/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Adding web view dialog to manager: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/onevcat/uniwebview/Logger;->debug(Ljava/lang/String;)V

    .line 52
    iget-object v0, p0, Lcom/onevcat/uniwebview/UniWebViewManager;->webViewDialog:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
