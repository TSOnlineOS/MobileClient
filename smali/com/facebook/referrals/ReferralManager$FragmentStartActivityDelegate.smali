.class Lcom/facebook/referrals/ReferralManager$FragmentStartActivityDelegate;
.super Ljava/lang/Object;
.source "ReferralManager.java"

# interfaces
.implements Lcom/facebook/referrals/StartActivityDelegate;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/referrals/ReferralManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FragmentStartActivityDelegate"
.end annotation


# instance fields
.field private final fragment:Lcom/facebook/internal/FragmentWrapper;


# direct methods
.method constructor <init>(Lcom/facebook/internal/FragmentWrapper;)V
    .locals 1

    .line 256
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "fragment"

    .line 257
    invoke-static {p1, v0}, Lcom/facebook/internal/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 258
    iput-object p1, p0, Lcom/facebook/referrals/ReferralManager$FragmentStartActivityDelegate;->fragment:Lcom/facebook/internal/FragmentWrapper;

    return-void
.end method


# virtual methods
.method public getActivityContext()Landroid/app/Activity;
    .locals 1

    .line 268
    iget-object v0, p0, Lcom/facebook/referrals/ReferralManager$FragmentStartActivityDelegate;->fragment:Lcom/facebook/internal/FragmentWrapper;

    invoke-virtual {v0}, Lcom/facebook/internal/FragmentWrapper;->getActivity()Landroid/app/Activity;

    move-result-object v0

    return-object v0
.end method

.method public startActivityForResult(Landroid/content/Intent;I)V
    .locals 1

    .line 263
    iget-object v0, p0, Lcom/facebook/referrals/ReferralManager$FragmentStartActivityDelegate;->fragment:Lcom/facebook/internal/FragmentWrapper;

    invoke-virtual {v0, p1, p2}, Lcom/facebook/internal/FragmentWrapper;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method
