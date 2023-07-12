.class public Lcom/facebook/gamingservices/ContextSwitchDialog;
.super Lcom/facebook/internal/FacebookDialogBase;
.source "ContextSwitchDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/gamingservices/ContextSwitchDialog$Result;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/internal/FacebookDialogBase<",
        "Lcom/facebook/gamingservices/model/ContextSwitchContent;",
        "Lcom/facebook/gamingservices/ContextSwitchDialog$Result;",
        ">;"
    }
.end annotation


# static fields
.field private static final DEFAULT_REQUEST_CODE:I


# instance fields
.field private mCallback:Lcom/facebook/FacebookCallback;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 52
    sget-object v0, Lcom/facebook/internal/CallbackManagerImpl$RequestCodeOffset;->GameRequest:Lcom/facebook/internal/CallbackManagerImpl$RequestCodeOffset;

    .line 53
    invoke-virtual {v0}, Lcom/facebook/internal/CallbackManagerImpl$RequestCodeOffset;->toRequestCode()I

    move-result v0

    sput v0, Lcom/facebook/gamingservices/ContextSwitchDialog;->DEFAULT_REQUEST_CODE:I

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .locals 1

    .line 62
    sget v0, Lcom/facebook/gamingservices/ContextSwitchDialog;->DEFAULT_REQUEST_CODE:I

    invoke-direct {p0, p1, v0}, Lcom/facebook/internal/FacebookDialogBase;-><init>(Landroid/app/Activity;I)V

    return-void
.end method

.method public constructor <init>(Landroid/app/Fragment;)V
    .locals 1

    .line 80
    new-instance v0, Lcom/facebook/internal/FragmentWrapper;

    invoke-direct {v0, p1}, Lcom/facebook/internal/FragmentWrapper;-><init>(Landroid/app/Fragment;)V

    invoke-direct {p0, v0}, Lcom/facebook/gamingservices/ContextSwitchDialog;-><init>(Lcom/facebook/internal/FragmentWrapper;)V

    return-void
.end method

.method public constructor <init>(Landroidx/fragment/app/Fragment;)V
    .locals 1

    .line 71
    new-instance v0, Lcom/facebook/internal/FragmentWrapper;

    invoke-direct {v0, p1}, Lcom/facebook/internal/FragmentWrapper;-><init>(Landroidx/fragment/app/Fragment;)V

    invoke-direct {p0, v0}, Lcom/facebook/gamingservices/ContextSwitchDialog;-><init>(Lcom/facebook/internal/FragmentWrapper;)V

    return-void
.end method

.method private constructor <init>(Lcom/facebook/internal/FragmentWrapper;)V
    .locals 1

    .line 84
    sget v0, Lcom/facebook/gamingservices/ContextSwitchDialog;->DEFAULT_REQUEST_CODE:I

    invoke-direct {p0, p1, v0}, Lcom/facebook/internal/FacebookDialogBase;-><init>(Lcom/facebook/internal/FragmentWrapper;I)V

    return-void
.end method

.method static synthetic access$000(Lcom/facebook/gamingservices/ContextSwitchDialog;)Lcom/facebook/FacebookCallback;
    .locals 0

    .line 49
    iget-object p0, p0, Lcom/facebook/gamingservices/ContextSwitchDialog;->mCallback:Lcom/facebook/FacebookCallback;

    return-object p0
.end method

.method private showForCloud(Lcom/facebook/gamingservices/model/ContextSwitchContent;Ljava/lang/Object;)V
    .locals 3

    .line 106
    invoke-virtual {p0}, Lcom/facebook/gamingservices/ContextSwitchDialog;->getActivityContext()Landroid/app/Activity;

    move-result-object p2

    .line 108
    invoke-static {}, Lcom/facebook/AccessToken;->getCurrentAccessToken()Lcom/facebook/AccessToken;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 109
    invoke-virtual {v0}, Lcom/facebook/AccessToken;->isExpired()Z

    move-result v0

    if-nez v0, :cond_3

    .line 114
    new-instance v0, Lcom/facebook/gamingservices/ContextSwitchDialog$1;

    invoke-direct {v0, p0}, Lcom/facebook/gamingservices/ContextSwitchDialog$1;-><init>(Lcom/facebook/gamingservices/ContextSwitchDialog;)V

    .line 128
    invoke-virtual {p1}, Lcom/facebook/gamingservices/model/ContextSwitchContent;->getContextID()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_1

    .line 130
    iget-object p1, p0, Lcom/facebook/gamingservices/ContextSwitchDialog;->mCallback:Lcom/facebook/FacebookCallback;

    if-eqz p1, :cond_0

    .line 131
    new-instance p2, Lcom/facebook/FacebookException;

    const-string v0, "Required string contextID not provided."

    invoke-direct {p2, v0}, Lcom/facebook/FacebookException;-><init>(Ljava/lang/String;)V

    invoke-interface {p1, p2}, Lcom/facebook/FacebookCallback;->onError(Lcom/facebook/FacebookException;)V

    :cond_0
    return-void

    .line 136
    :cond_1
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    const-string v2, "id"

    .line 138
    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 140
    sget-object p1, Lcom/facebook/gamingservices/cloudgaming/internal/SDKMessageEnum;->CONTEXT_SWITCH:Lcom/facebook/gamingservices/cloudgaming/internal/SDKMessageEnum;

    invoke-static {p2, v1, v0, p1}, Lcom/facebook/gamingservices/cloudgaming/DaemonRequest;->executeAsync(Landroid/content/Context;Lorg/json/JSONObject;Lcom/facebook/gamingservices/cloudgaming/DaemonRequest$Callback;Lcom/facebook/gamingservices/cloudgaming/internal/SDKMessageEnum;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    nop

    .line 143
    iget-object p1, p0, Lcom/facebook/gamingservices/ContextSwitchDialog;->mCallback:Lcom/facebook/FacebookCallback;

    if-eqz p1, :cond_2

    .line 144
    new-instance p2, Lcom/facebook/FacebookException;

    const-string v0, "Couldn\'t prepare Context Switch Dialog"

    invoke-direct {p2, v0}, Lcom/facebook/FacebookException;-><init>(Ljava/lang/String;)V

    invoke-interface {p1, p2}, Lcom/facebook/FacebookCallback;->onError(Lcom/facebook/FacebookException;)V

    :cond_2
    :goto_0
    return-void

    .line 110
    :cond_3
    new-instance p1, Lcom/facebook/FacebookException;

    const-string p2, "Attempted to open ContextSwitchContent with an invalid access token"

    invoke-direct {p1, p2}, Lcom/facebook/FacebookException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public canShow(Lcom/facebook/gamingservices/model/ContextSwitchContent;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public bridge synthetic canShow(Ljava/lang/Object;)Z
    .locals 0

    .line 49
    check-cast p1, Lcom/facebook/gamingservices/model/ContextSwitchContent;

    invoke-virtual {p0, p1}, Lcom/facebook/gamingservices/ContextSwitchDialog;->canShow(Lcom/facebook/gamingservices/model/ContextSwitchContent;)Z

    move-result p1

    return p1
.end method

.method protected createBaseAppCall()Lcom/facebook/internal/AppCall;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected getOrderedModeHandlers()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/facebook/internal/FacebookDialogBase<",
            "Lcom/facebook/gamingservices/model/ContextSwitchContent;",
            "Lcom/facebook/gamingservices/ContextSwitchDialog$Result;",
            ">.ModeHandler;>;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method protected registerCallbackImpl(Lcom/facebook/internal/CallbackManagerImpl;Lcom/facebook/FacebookCallback;)V
    .locals 2

    .line 152
    iput-object p2, p0, Lcom/facebook/gamingservices/ContextSwitchDialog;->mCallback:Lcom/facebook/FacebookCallback;

    if-nez p2, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    .line 153
    :cond_0
    new-instance v0, Lcom/facebook/gamingservices/ContextSwitchDialog$2;

    invoke-direct {v0, p0, p2, p2}, Lcom/facebook/gamingservices/ContextSwitchDialog$2;-><init>(Lcom/facebook/gamingservices/ContextSwitchDialog;Lcom/facebook/FacebookCallback;Lcom/facebook/FacebookCallback;)V

    move-object p2, v0

    .line 168
    :goto_0
    invoke-virtual {p0}, Lcom/facebook/gamingservices/ContextSwitchDialog;->getRequestCode()I

    move-result v0

    new-instance v1, Lcom/facebook/gamingservices/ContextSwitchDialog$3;

    invoke-direct {v1, p0, p2}, Lcom/facebook/gamingservices/ContextSwitchDialog$3;-><init>(Lcom/facebook/gamingservices/ContextSwitchDialog;Lcom/facebook/share/internal/ResultProcessor;)V

    .line 167
    invoke-virtual {p1, v0, v1}, Lcom/facebook/internal/CallbackManagerImpl;->registerCallback(ILcom/facebook/internal/CallbackManagerImpl$Callback;)V

    return-void
.end method

.method protected showImpl(Lcom/facebook/gamingservices/model/ContextSwitchContent;Ljava/lang/Object;)V
    .locals 1

    .line 99
    invoke-static {}, Lcom/facebook/gamingservices/cloudgaming/CloudGameLoginHandler;->isRunningInCloud()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 100
    invoke-direct {p0, p1, p2}, Lcom/facebook/gamingservices/ContextSwitchDialog;->showForCloud(Lcom/facebook/gamingservices/model/ContextSwitchContent;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method protected bridge synthetic showImpl(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 49
    check-cast p1, Lcom/facebook/gamingservices/model/ContextSwitchContent;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/gamingservices/ContextSwitchDialog;->showImpl(Lcom/facebook/gamingservices/model/ContextSwitchContent;Ljava/lang/Object;)V

    return-void
.end method
