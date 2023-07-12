.class Lcom/facebook/referrals/ReferralManager$ActivityStartActivityDelegate;
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
    name = "ActivityStartActivityDelegate"
.end annotation


# instance fields
.field private final activity:Landroid/app/Activity;


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .locals 1

    .line 237
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "activity"

    .line 238
    invoke-static {p1, v0}, Lcom/facebook/internal/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 239
    iput-object p1, p0, Lcom/facebook/referrals/ReferralManager$ActivityStartActivityDelegate;->activity:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public getActivityContext()Landroid/app/Activity;
    .locals 1

    .line 249
    iget-object v0, p0, Lcom/facebook/referrals/ReferralManager$ActivityStartActivityDelegate;->activity:Landroid/app/Activity;

    return-object v0
.end method

.method public startActivityForResult(Landroid/content/Intent;I)V
    .locals 1

    .line 244
    iget-object v0, p0, Lcom/facebook/referrals/ReferralManager$ActivityStartActivityDelegate;->activity:Landroid/app/Activity;

    invoke-virtual {v0, p1, p2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method
