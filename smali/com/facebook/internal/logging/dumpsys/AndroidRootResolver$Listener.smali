.class public interface abstract Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$Listener;
.super Ljava/lang/Object;
.source "AndroidRootResolver.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Listener"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0000\u0008f\u0018\u00002\u00020\u0001J\u0012\u0010\u0002\u001a\u00020\u00032\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005H&J\u0012\u0010\u0006\u001a\u00020\u00032\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005H&J\u001a\u0010\u0007\u001a\u00020\u00032\u0010\u0010\u0008\u001a\u000c\u0012\u0006\u0012\u0004\u0018\u00010\u0005\u0018\u00010\tH&\u00a8\u0006\n"
    }
    d2 = {
        "Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$Listener;",
        "",
        "onRootAdded",
        "",
        "root",
        "Landroid/view/View;",
        "onRootRemoved",
        "onRootsChanged",
        "roots",
        "",
        "facebook-core_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x5,
        0x1
    }
.end annotation


# virtual methods
.method public abstract onRootAdded(Landroid/view/View;)V
.end method

.method public abstract onRootRemoved(Landroid/view/View;)V
.end method

.method public abstract onRootsChanged(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation
.end method
