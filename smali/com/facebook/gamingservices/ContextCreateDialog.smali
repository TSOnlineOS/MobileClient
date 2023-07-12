.class public Lcom/facebook/gamingservices/ContextCreateDialog;
.super Lcom/facebook/internal/FacebookDialogBase;
.source "ContextCreateDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/gamingservices/ContextCreateDialog$Result;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/internal/FacebookDialogBase<",
        "Lcom/facebook/gamingservices/model/ContextCreateContent;",
        "Lcom/facebook/gamingservices/ContextCreateDialog$Result;",
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

    .line 53
    sget-object v0, Lcom/facebook/internal/CallbackManagerImpl$RequestCodeOffset;->GameRequest:Lcom/facebook/internal/CallbackManagerImpl$RequestCodeOffset;

    .line 54
    invoke-virtual {v0}, Lcom/facebook/internal/CallbackManagerImpl$RequestCodeOffset;->toRequestCode()I

    move-result v0

    sput v0, Lcom/facebook/gamingservices/ContextCreateDialog;->DEFAULT_REQUEST_CODE:I

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .locals 1

    .line 63
    sget v0, Lcom/facebook/gamingservices/ContextCreateDialog;->DEFAULT_REQUEST_CODE:I

    invoke-direct {p0, p1, v0}, Lcom/facebook/internal/FacebookDialogBase;-><init>(Landroid/app/Activity;I)V

    return-void
.end method

.method public constructor <init>(Landroid/app/Fragment;)V
    .locals 1

    .line 81
    new-instance v0, Lcom/facebook/internal/FragmentWrapper;

    invoke-direct {v0, p1}, Lcom/facebook/internal/FragmentWrapper;-><init>(Landroid/app/Fragment;)V

    invoke-direct {p0, v0}, Lcom/facebook/gamingservices/ContextCreateDialog;-><init>(Lcom/facebook/internal/FragmentWrapper;)V

    return-void
.end method

.method public constructor <init>(Landroidx/fragment/app/Fragment;)V
    .locals 1

    .line 72
    new-instance v0, Lcom/facebook/internal/FragmentWrapper;

    invoke-direct {v0, p1}, Lcom/facebook/internal/FragmentWrapper;-><init>(Landroidx/fragment/app/Fragment;)V

    invoke-direct {p0, v0}, Lcom/facebook/gamingservices/ContextCreateDialog;-><init>(Lcom/facebook/internal/FragmentWrapper;)V

    return-void
.end method

.method private constructor <init>(Lcom/facebook/internal/FragmentWrapper;)V
    .locals 1

    .line 85
    sget v0, Lcom/facebook/gamingservices/ContextCreateDialog;->DEFAULT_REQUEST_CODE:I

    invoke-direct {p0, p1, v0}, Lcom/facebook/internal/FacebookDialogBase;-><init>(Lcom/facebook/internal/FragmentWrapper;I)V

    return-void
.end method

.method static synthetic access$000(Lcom/facebook/gamingservices/ContextCreateDialog;)Lcom/facebook/FacebookCallback;
    .locals 0

    .line 50
    iget-object p0, p0, Lcom/facebook/gamingservices/ContextCreateDialog;->mCallback:Lcom/facebook/FacebookCallback;

    return-object p0
.end method

.method private showForCloud(Lcom/facebook/gamingservices/model/ContextCreateContent;Ljava/lang/Object;)V
    .locals 6

    .line 107
    invoke-virtual {p0}, Lcom/facebook/gamingservices/ContextCreateDialog;->getActivityContext()Landroid/app/Activity;

    move-result-object p2

    .line 109
    invoke-static {}, Lcom/facebook/AccessToken;->getCurrentAccessToken()Lcom/facebook/AccessToken;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 110
    invoke-virtual {v0}, Lcom/facebook/AccessToken;->isExpired()Z

    move-result v0

    if-nez v0, :cond_4

    .line 115
    new-instance v0, Lcom/facebook/gamingservices/ContextCreateDialog$1;

    invoke-direct {v0, p0}, Lcom/facebook/gamingservices/ContextCreateDialog$1;-><init>(Lcom/facebook/gamingservices/ContextCreateDialog;)V

    .line 129
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 131
    :try_start_0
    invoke-virtual {p1}, Lcom/facebook/gamingservices/model/ContextCreateContent;->getSuggestedPlayerIDs()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 132
    invoke-virtual {p1}, Lcom/facebook/gamingservices/model/ContextCreateContent;->getSuggestedPlayerIDs()Ljava/lang/String;

    move-result-object p1

    const-string v2, "\\s*,\\s*"

    .line 133
    invoke-virtual {p1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    .line 134
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    .line 135
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v3, 0x0

    const-string v4, "id"

    const/4 v5, 0x1

    if-ne v2, v5, :cond_0

    .line 136
    :try_start_1
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v1, v4, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_1

    .line 138
    :cond_0
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 139
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    if-ge v3, v5, :cond_1

    .line 140
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v2, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 142
    :cond_1
    invoke-virtual {v1, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 147
    :cond_2
    :goto_1
    sget-object p1, Lcom/facebook/gamingservices/cloudgaming/internal/SDKMessageEnum;->CONTEXT_CREATE:Lcom/facebook/gamingservices/cloudgaming/internal/SDKMessageEnum;

    invoke-static {p2, v1, v0, p1}, Lcom/facebook/gamingservices/cloudgaming/DaemonRequest;->executeAsync(Landroid/content/Context;Lorg/json/JSONObject;Lcom/facebook/gamingservices/cloudgaming/DaemonRequest$Callback;Lcom/facebook/gamingservices/cloudgaming/internal/SDKMessageEnum;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    :catch_0
    nop

    .line 150
    iget-object p1, p0, Lcom/facebook/gamingservices/ContextCreateDialog;->mCallback:Lcom/facebook/FacebookCallback;

    if-eqz p1, :cond_3

    .line 151
    new-instance p2, Lcom/facebook/FacebookException;

    const-string v0, "Couldn\'t prepare Context Create Dialog"

    invoke-direct {p2, v0}, Lcom/facebook/FacebookException;-><init>(Ljava/lang/String;)V

    invoke-interface {p1, p2}, Lcom/facebook/FacebookCallback;->onError(Lcom/facebook/FacebookException;)V

    :cond_3
    :goto_2
    return-void

    .line 111
    :cond_4
    new-instance p1, Lcom/facebook/FacebookException;

    const-string p2, "Attempted to open ContextCreateContent with an invalid access token"

    invoke-direct {p1, p2}, Lcom/facebook/FacebookException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public canShow(Lcom/facebook/gamingservices/model/ContextCreateContent;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public bridge synthetic canShow(Ljava/lang/Object;)Z
    .locals 0

    .line 50
    check-cast p1, Lcom/facebook/gamingservices/model/ContextCreateContent;

    invoke-virtual {p0, p1}, Lcom/facebook/gamingservices/ContextCreateDialog;->canShow(Lcom/facebook/gamingservices/model/ContextCreateContent;)Z

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
            "Lcom/facebook/gamingservices/model/ContextCreateContent;",
            "Lcom/facebook/gamingservices/ContextCreateDialog$Result;",
            ">.ModeHandler;>;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method protected registerCallbackImpl(Lcom/facebook/internal/CallbackManagerImpl;Lcom/facebook/FacebookCallback;)V
    .locals 2

    .line 159
    iput-object p2, p0, Lcom/facebook/gamingservices/ContextCreateDialog;->mCallback:Lcom/facebook/FacebookCallback;

    if-nez p2, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    .line 160
    :cond_0
    new-instance v0, Lcom/facebook/gamingservices/ContextCreateDialog$2;

    invoke-direct {v0, p0, p2, p2}, Lcom/facebook/gamingservices/ContextCreateDialog$2;-><init>(Lcom/facebook/gamingservices/ContextCreateDialog;Lcom/facebook/FacebookCallback;Lcom/facebook/FacebookCallback;)V

    move-object p2, v0

    .line 175
    :goto_0
    invoke-virtual {p0}, Lcom/facebook/gamingservices/ContextCreateDialog;->getRequestCode()I

    move-result v0

    new-instance v1, Lcom/facebook/gamingservices/ContextCreateDialog$3;

    invoke-direct {v1, p0, p2}, Lcom/facebook/gamingservices/ContextCreateDialog$3;-><init>(Lcom/facebook/gamingservices/ContextCreateDialog;Lcom/facebook/share/internal/ResultProcessor;)V

    .line 174
    invoke-virtual {p1, v0, v1}, Lcom/facebook/internal/CallbackManagerImpl;->registerCallback(ILcom/facebook/internal/CallbackManagerImpl$Callback;)V

    return-void
.end method

.method protected showImpl(Lcom/facebook/gamingservices/model/ContextCreateContent;Ljava/lang/Object;)V
    .locals 1

    .line 100
    invoke-static {}, Lcom/facebook/gamingservices/cloudgaming/CloudGameLoginHandler;->isRunningInCloud()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 101
    invoke-direct {p0, p1, p2}, Lcom/facebook/gamingservices/ContextCreateDialog;->showForCloud(Lcom/facebook/gamingservices/model/ContextCreateContent;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method protected bridge synthetic showImpl(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 50
    check-cast p1, Lcom/facebook/gamingservices/model/ContextCreateContent;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/gamingservices/ContextCreateDialog;->showImpl(Lcom/facebook/gamingservices/model/ContextCreateContent;Ljava/lang/Object;)V

    return-void
.end method
