.class public final Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$Root;
.super Ljava/lang/Object;
.source "AndroidRootResolver.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Root"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006R\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\n\u00a8\u0006\u000b"
    }
    d2 = {
        "Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$Root;",
        "",
        "view",
        "Landroid/view/View;",
        "param",
        "Landroid/view/WindowManager$LayoutParams;",
        "(Landroid/view/View;Landroid/view/WindowManager$LayoutParams;)V",
        "getParam",
        "()Landroid/view/WindowManager$LayoutParams;",
        "getView",
        "()Landroid/view/View;",
        "facebook-core_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x5,
        0x1
    }
.end annotation


# instance fields
.field private final param:Landroid/view/WindowManager$LayoutParams;

.field private final view:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;Landroid/view/WindowManager$LayoutParams;)V
    .locals 1

    const-string v0, "view"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "param"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$Root;->view:Landroid/view/View;

    iput-object p2, p0, Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$Root;->param:Landroid/view/WindowManager$LayoutParams;

    return-void
.end method


# virtual methods
.method public final getParam()Landroid/view/WindowManager$LayoutParams;
    .locals 1

    .line 37
    iget-object v0, p0, Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$Root;->param:Landroid/view/WindowManager$LayoutParams;

    return-object v0
.end method

.method public final getView()Landroid/view/View;
    .locals 1

    .line 37
    iget-object v0, p0, Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$Root;->view:Landroid/view/View;

    return-object v0
.end method
