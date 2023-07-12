.class public Lcom/facebook/internal/FacebookDialogFragment;
.super Landroidx/fragment/app/DialogFragment;
.source "FacebookDialogFragment.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "FacebookDialogFragment"


# instance fields
.field private dialog:Landroid/app/Dialog;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Landroidx/fragment/app/DialogFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/facebook/internal/FacebookDialogFragment;Landroid/os/Bundle;Lcom/facebook/FacebookException;)V
    .locals 0

    .line 42
    invoke-direct {p0, p1, p2}, Lcom/facebook/internal/FacebookDialogFragment;->onCompleteWebDialog(Landroid/os/Bundle;Lcom/facebook/FacebookException;)V

    return-void
.end method

.method static synthetic access$100(Lcom/facebook/internal/FacebookDialogFragment;Landroid/os/Bundle;)V
    .locals 0

    .line 42
    invoke-direct {p0, p1}, Lcom/facebook/internal/FacebookDialogFragment;->onCompleteWebFallbackDialog(Landroid/os/Bundle;)V

    return-void
.end method

.method private onCompleteWebDialog(Landroid/os/Bundle;Lcom/facebook/FacebookException;)V
    .locals 2

    .line 147
    invoke-virtual {p0}, Lcom/facebook/internal/FacebookDialogFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    .line 150
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-static {v1, p1, p2}, Lcom/facebook/internal/NativeProtocol;->createProtocolResultIntent(Landroid/content/Intent;Landroid/os/Bundle;Lcom/facebook/FacebookException;)Landroid/content/Intent;

    move-result-object p1

    if-nez p2, :cond_0

    const/4 p2, -0x1

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    .line 154
    :goto_0
    invoke-virtual {v0, p2, p1}, Landroidx/fragment/app/FragmentActivity;->setResult(ILandroid/content/Intent;)V

    .line 155
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->finish()V

    return-void
.end method

.method private onCompleteWebFallbackDialog(Landroid/os/Bundle;)V
    .locals 2

    .line 159
    invoke-virtual {p0}, Lcom/facebook/internal/FacebookDialogFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    .line 161
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    if-nez p1, :cond_0

    .line 162
    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    :cond_0
    invoke-virtual {v1, p1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    const/4 p1, -0x1

    .line 164
    invoke-virtual {v0, p1, v1}, Landroidx/fragment/app/FragmentActivity;->setResult(ILandroid/content/Intent;)V

    .line 165
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->finish()V

    return-void
.end method


# virtual methods
.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 132
    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 133
    iget-object p1, p0, Lcom/facebook/internal/FacebookDialogFragment;->dialog:Landroid/app/Dialog;

    instance-of p1, p1, Lcom/facebook/internal/WebDialog;

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/facebook/internal/FacebookDialogFragment;->isResumed()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 134
    iget-object p1, p0, Lcom/facebook/internal/FacebookDialogFragment;->dialog:Landroid/app/Dialog;

    check-cast p1, Lcom/facebook/internal/WebDialog;

    invoke-virtual {p1}, Lcom/facebook/internal/WebDialog;->resize()V

    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4

    .line 58
    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 60
    iget-object p1, p0, Lcom/facebook/internal/FacebookDialogFragment;->dialog:Landroid/app/Dialog;

    if-nez p1, :cond_3

    .line 61
    invoke-virtual {p0}, Lcom/facebook/internal/FacebookDialogFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    .line 62
    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 63
    invoke-static {v0}, Lcom/facebook/internal/NativeProtocol;->getMethodArgumentsFromIntent(Landroid/content/Intent;)Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "is_fallback"

    const/4 v2, 0x0

    .line 65
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    const-string v3, "FacebookDialogFragment"

    if-nez v1, :cond_1

    const-string v1, "action"

    .line 68
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "params"

    .line 69
    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 70
    invoke-static {v1}, Lcom/facebook/internal/Utility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v0, "Cannot start a WebDialog with an empty/missing \'actionName\'"

    .line 71
    invoke-static {v3, v0}, Lcom/facebook/internal/Utility;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->finish()V

    return-void

    .line 76
    :cond_0
    new-instance v2, Lcom/facebook/internal/WebDialog$Builder;

    invoke-direct {v2, p1, v1, v0}, Lcom/facebook/internal/WebDialog$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)V

    new-instance p1, Lcom/facebook/internal/FacebookDialogFragment$1;

    invoke-direct {p1, p0}, Lcom/facebook/internal/FacebookDialogFragment$1;-><init>(Lcom/facebook/internal/FacebookDialogFragment;)V

    .line 78
    invoke-virtual {v2, p1}, Lcom/facebook/internal/WebDialog$Builder;->setOnCompleteListener(Lcom/facebook/internal/WebDialog$OnCompleteListener;)Lcom/facebook/internal/WebDialog$Builder;

    move-result-object p1

    .line 85
    invoke-virtual {p1}, Lcom/facebook/internal/WebDialog$Builder;->build()Lcom/facebook/internal/WebDialog;

    move-result-object p1

    goto :goto_0

    :cond_1
    const-string v1, "url"

    .line 87
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 88
    invoke-static {v0}, Lcom/facebook/internal/Utility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v0, "Cannot start a fallback WebDialog with an empty/missing \'url\'"

    .line 89
    invoke-static {v3, v0}, Lcom/facebook/internal/Utility;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->finish()V

    return-void

    :cond_2
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    .line 94
    invoke-static {}, Lcom/facebook/FacebookSdk;->getApplicationId()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "fb%s://bridge/"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 95
    invoke-static {p1, v0, v1}, Lcom/facebook/internal/FacebookWebFallbackDialog;->newInstance(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/facebook/internal/FacebookWebFallbackDialog;

    move-result-object p1

    .line 96
    new-instance v0, Lcom/facebook/internal/FacebookDialogFragment$2;

    invoke-direct {v0, p0}, Lcom/facebook/internal/FacebookDialogFragment$2;-><init>(Lcom/facebook/internal/FacebookDialogFragment;)V

    invoke-virtual {p1, v0}, Lcom/facebook/internal/WebDialog;->setOnCompleteListener(Lcom/facebook/internal/WebDialog$OnCompleteListener;)V

    .line 107
    :goto_0
    iput-object p1, p0, Lcom/facebook/internal/FacebookDialogFragment;->dialog:Landroid/app/Dialog;

    :cond_3
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 0

    .line 115
    iget-object p1, p0, Lcom/facebook/internal/FacebookDialogFragment;->dialog:Landroid/app/Dialog;

    if-nez p1, :cond_0

    const/4 p1, 0x0

    .line 116
    invoke-direct {p0, p1, p1}, Lcom/facebook/internal/FacebookDialogFragment;->onCompleteWebDialog(Landroid/os/Bundle;Lcom/facebook/FacebookException;)V

    const/4 p1, 0x0

    .line 117
    invoke-virtual {p0, p1}, Lcom/facebook/internal/FacebookDialogFragment;->setShowsDialog(Z)V

    .line 119
    :cond_0
    iget-object p1, p0, Lcom/facebook/internal/FacebookDialogFragment;->dialog:Landroid/app/Dialog;

    return-object p1
.end method

.method public onDestroyView()V
    .locals 2

    .line 140
    invoke-virtual {p0}, Lcom/facebook/internal/FacebookDialogFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/facebook/internal/FacebookDialogFragment;->getRetainInstance()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 141
    invoke-virtual {p0}, Lcom/facebook/internal/FacebookDialogFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setDismissMessage(Landroid/os/Message;)V

    .line 143
    :cond_0
    invoke-super {p0}, Landroidx/fragment/app/DialogFragment;->onDestroyView()V

    return-void
.end method

.method public onResume()V
    .locals 2

    .line 124
    invoke-super {p0}, Landroidx/fragment/app/DialogFragment;->onResume()V

    .line 125
    iget-object v0, p0, Lcom/facebook/internal/FacebookDialogFragment;->dialog:Landroid/app/Dialog;

    instance-of v1, v0, Lcom/facebook/internal/WebDialog;

    if-eqz v1, :cond_0

    .line 126
    check-cast v0, Lcom/facebook/internal/WebDialog;

    invoke-virtual {v0}, Lcom/facebook/internal/WebDialog;->resize()V

    :cond_0
    return-void
.end method

.method public setDialog(Landroid/app/Dialog;)V
    .locals 0

    .line 53
    iput-object p1, p0, Lcom/facebook/internal/FacebookDialogFragment;->dialog:Landroid/app/Dialog;

    return-void
.end method
