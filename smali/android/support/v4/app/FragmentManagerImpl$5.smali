.class Landroid/support/v4/app/FragmentManagerImpl$5;
.super Ljava/lang/Object;
.source "FragmentManager.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/app/FragmentManagerImpl;->moveToState(Landroid/support/v4/app/Fragment;III)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v4/app/FragmentManagerImpl;

.field final synthetic val$fragment:Landroid/support/v4/app/Fragment;


# direct methods
.method constructor <init>(Landroid/support/v4/app/FragmentManagerImpl;Landroid/support/v4/app/Fragment;)V
    .locals 0

    .line 980
    iput-object p1, p0, Landroid/support/v4/app/FragmentManagerImpl$5;->this$0:Landroid/support/v4/app/FragmentManagerImpl;

    iput-object p2, p0, Landroid/support/v4/app/FragmentManagerImpl$5;->val$fragment:Landroid/support/v4/app/Fragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 3

    .line 983
    iget-object p1, p0, Landroid/support/v4/app/FragmentManagerImpl$5;->val$fragment:Landroid/support/v4/app/Fragment;

    iget-object p1, p1, Landroid/support/v4/app/Fragment;->mAnimatingAway:Landroid/view/View;

    if-eqz p1, :cond_0

    .line 984
    iget-object p1, p0, Landroid/support/v4/app/FragmentManagerImpl$5;->val$fragment:Landroid/support/v4/app/Fragment;

    const/4 v0, 0x0

    iput-object v0, p1, Landroid/support/v4/app/Fragment;->mAnimatingAway:Landroid/view/View;

    .line 985
    iget-object p1, p0, Landroid/support/v4/app/FragmentManagerImpl$5;->this$0:Landroid/support/v4/app/FragmentManagerImpl;

    iget-object v0, p0, Landroid/support/v4/app/FragmentManagerImpl$5;->val$fragment:Landroid/support/v4/app/Fragment;

    iget v1, v0, Landroid/support/v4/app/Fragment;->mStateAfterAnimating:I

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v1, v2, v2}, Landroid/support/v4/app/FragmentManagerImpl;->moveToState(Landroid/support/v4/app/Fragment;III)V

    :cond_0
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 0

    return-void
.end method
