.class public final Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$ListenableArrayList;
.super Ljava/util/ArrayList;
.source "AndroidRootResolver.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ListenableArrayList"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/ArrayList<",
        "Landroid/view/View;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\u0018\u00002\u0016\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u0001j\n\u0012\u0006\u0012\u0004\u0018\u00010\u0002`\u0003B\u0005\u00a2\u0006\u0002\u0010\u0004J\u0012\u0010\u0007\u001a\u00020\u00082\u0008\u0010\t\u001a\u0004\u0018\u00010\u0002H\u0016J\u0012\u0010\n\u001a\u00020\u00082\u0008\u0010\t\u001a\u0004\u0018\u00010\u0002H\u0016J\u0012\u0010\u000b\u001a\u0004\u0018\u00010\u00022\u0006\u0010\u000c\u001a\u00020\rH\u0016J\u0010\u0010\u000e\u001a\u00020\u000f2\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0006R\u0010\u0010\u0005\u001a\u0004\u0018\u00010\u0006X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0010"
    }
    d2 = {
        "Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$ListenableArrayList;",
        "Ljava/util/ArrayList;",
        "Landroid/view/View;",
        "Lkotlin/collections/ArrayList;",
        "()V",
        "listener",
        "Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$Listener;",
        "add",
        "",
        "value",
        "remove",
        "removeAt",
        "index",
        "",
        "setListener",
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


# instance fields
.field private listener:Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$Listener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 44
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    return-void
.end method


# virtual methods
.method public add(Landroid/view/View;)Z
    .locals 2

    .line 51
    invoke-super {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 52
    iget-object v1, p0, Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$ListenableArrayList;->listener:Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$Listener;

    if-eqz v1, :cond_1

    if-eqz v1, :cond_0

    .line 53
    invoke-interface {v1, p1}, Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$Listener;->onRootAdded(Landroid/view/View;)V

    .line 54
    :cond_0
    iget-object p1, p0, Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$ListenableArrayList;->listener:Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$Listener;

    if-eqz p1, :cond_1

    move-object v1, p0

    check-cast v1, Ljava/util/List;

    invoke-interface {p1, v1}, Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$Listener;->onRootsChanged(Ljava/util/List;)V

    :cond_1
    return v0
.end method

.method public bridge synthetic add(Ljava/lang/Object;)Z
    .locals 0

    .line 44
    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1}, Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$ListenableArrayList;->add(Landroid/view/View;)Z

    move-result p1

    return p1
.end method

.method public bridge contains(Landroid/view/View;)Z
    .locals 0

    .line 44
    invoke-super {p0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public final bridge contains(Ljava/lang/Object;)Z
    .locals 1

    if-eqz p1, :cond_0

    .line 44
    instance-of v0, p1, Landroid/view/View;

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    if-eqz v0, :cond_1

    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1}, Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$ListenableArrayList;->contains(Landroid/view/View;)Z

    move-result p1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public bridge getSize()I
    .locals 1

    .line 44
    invoke-super {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public bridge indexOf(Landroid/view/View;)I
    .locals 0

    .line 44
    invoke-super {p0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p1

    return p1
.end method

.method public final bridge indexOf(Ljava/lang/Object;)I
    .locals 1

    if-eqz p1, :cond_0

    .line 44
    instance-of v0, p1, Landroid/view/View;

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    if-eqz v0, :cond_1

    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1}, Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$ListenableArrayList;->indexOf(Landroid/view/View;)I

    move-result p1

    return p1

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method public bridge lastIndexOf(Landroid/view/View;)I
    .locals 0

    .line 44
    invoke-super {p0, p1}, Ljava/util/ArrayList;->lastIndexOf(Ljava/lang/Object;)I

    move-result p1

    return p1
.end method

.method public final bridge lastIndexOf(Ljava/lang/Object;)I
    .locals 1

    if-eqz p1, :cond_0

    .line 44
    instance-of v0, p1, Landroid/view/View;

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    if-eqz v0, :cond_1

    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1}, Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$ListenableArrayList;->lastIndexOf(Landroid/view/View;)I

    move-result p1

    return p1

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method public final bridge remove(I)Landroid/view/View;
    .locals 0

    .line 44
    invoke-virtual {p0, p1}, Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$ListenableArrayList;->removeAt(I)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic remove(I)Ljava/lang/Object;
    .locals 0

    .line 44
    invoke-virtual {p0, p1}, Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$ListenableArrayList;->removeAt(I)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public remove(Landroid/view/View;)Z
    .locals 3

    .line 60
    invoke-super {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 61
    iget-object v1, p0, Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$ListenableArrayList;->listener:Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$Listener;

    if-eqz v1, :cond_1

    instance-of v2, p1, Landroid/view/View;

    if-eqz v2, :cond_1

    if-eqz v1, :cond_0

    .line 62
    invoke-interface {v1, p1}, Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$Listener;->onRootRemoved(Landroid/view/View;)V

    .line 63
    :cond_0
    iget-object p1, p0, Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$ListenableArrayList;->listener:Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$Listener;

    if-eqz p1, :cond_1

    move-object v1, p0

    check-cast v1, Ljava/util/List;

    invoke-interface {p1, v1}, Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$Listener;->onRootsChanged(Ljava/util/List;)V

    :cond_1
    return v0
.end method

.method public final bridge remove(Ljava/lang/Object;)Z
    .locals 1

    if-eqz p1, :cond_0

    .line 44
    instance-of v0, p1, Landroid/view/View;

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    if-eqz v0, :cond_1

    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1}, Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$ListenableArrayList;->remove(Landroid/view/View;)Z

    move-result p1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public removeAt(I)Landroid/view/View;
    .locals 2

    .line 69
    invoke-super {p0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    .line 70
    iget-object v0, p0, Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$ListenableArrayList;->listener:Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$Listener;

    if-eqz v0, :cond_1

    if-eqz v0, :cond_0

    .line 71
    invoke-interface {v0, p1}, Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$Listener;->onRootRemoved(Landroid/view/View;)V

    .line 72
    :cond_0
    iget-object v0, p0, Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$ListenableArrayList;->listener:Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$Listener;

    if-eqz v0, :cond_1

    move-object v1, p0

    check-cast v1, Ljava/util/List;

    invoke-interface {v0, v1}, Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$Listener;->onRootsChanged(Ljava/util/List;)V

    :cond_1
    return-object p1
.end method

.method public final setListener(Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$Listener;)V
    .locals 0

    .line 47
    iput-object p1, p0, Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$ListenableArrayList;->listener:Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$Listener;

    return-void
.end method

.method public final bridge size()I
    .locals 1

    .line 44
    invoke-virtual {p0}, Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$ListenableArrayList;->getSize()I

    move-result v0

    return v0
.end method
