.class Lcom/facebook/referrals/ReferralManager$1;
.super Ljava/lang/Object;
.source "ReferralManager.java"

# interfaces
.implements Lcom/facebook/internal/CallbackManagerImpl$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/referrals/ReferralManager;->registerCallback(Lcom/facebook/CallbackManager;Lcom/facebook/FacebookCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/referrals/ReferralManager;

.field final synthetic val$callback:Lcom/facebook/FacebookCallback;


# direct methods
.method constructor <init>(Lcom/facebook/referrals/ReferralManager;Lcom/facebook/FacebookCallback;)V
    .locals 0

    .line 120
    iput-object p1, p0, Lcom/facebook/referrals/ReferralManager$1;->this$0:Lcom/facebook/referrals/ReferralManager;

    iput-object p2, p0, Lcom/facebook/referrals/ReferralManager$1;->val$callback:Lcom/facebook/FacebookCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityResult(ILandroid/content/Intent;)Z
    .locals 2

    .line 123
    iget-object v0, p0, Lcom/facebook/referrals/ReferralManager$1;->this$0:Lcom/facebook/referrals/ReferralManager;

    iget-object v1, p0, Lcom/facebook/referrals/ReferralManager$1;->val$callback:Lcom/facebook/FacebookCallback;

    invoke-virtual {v0, p1, p2, v1}, Lcom/facebook/referrals/ReferralManager;->onActivityResult(ILandroid/content/Intent;Lcom/facebook/FacebookCallback;)Z

    move-result p1

    return p1
.end method
