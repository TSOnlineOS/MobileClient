.class final Lcom/facebook/share/internal/LikeActionController$4;
.super Ljava/lang/Object;
.source "LikeActionController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/share/internal/LikeActionController;->invokeCallbackWithController(Lcom/facebook/share/internal/LikeActionController$CreationCallback;Lcom/facebook/share/internal/LikeActionController;Lcom/facebook/FacebookException;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$callback:Lcom/facebook/share/internal/LikeActionController$CreationCallback;

.field final synthetic val$controller:Lcom/facebook/share/internal/LikeActionController;

.field final synthetic val$error:Lcom/facebook/FacebookException;


# direct methods
.method constructor <init>(Lcom/facebook/share/internal/LikeActionController$CreationCallback;Lcom/facebook/share/internal/LikeActionController;Lcom/facebook/FacebookException;)V
    .locals 0

    .line 332
    iput-object p1, p0, Lcom/facebook/share/internal/LikeActionController$4;->val$callback:Lcom/facebook/share/internal/LikeActionController$CreationCallback;

    iput-object p2, p0, Lcom/facebook/share/internal/LikeActionController$4;->val$controller:Lcom/facebook/share/internal/LikeActionController;

    iput-object p3, p0, Lcom/facebook/share/internal/LikeActionController$4;->val$error:Lcom/facebook/FacebookException;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    invoke-static {p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 335
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/facebook/share/internal/LikeActionController$4;->val$callback:Lcom/facebook/share/internal/LikeActionController$CreationCallback;

    iget-object v1, p0, Lcom/facebook/share/internal/LikeActionController$4;->val$controller:Lcom/facebook/share/internal/LikeActionController;

    iget-object v2, p0, Lcom/facebook/share/internal/LikeActionController$4;->val$error:Lcom/facebook/FacebookException;

    invoke-interface {v0, v1, v2}, Lcom/facebook/share/internal/LikeActionController$CreationCallback;->onComplete(Lcom/facebook/share/internal/LikeActionController;Lcom/facebook/FacebookException;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 336
    invoke-static {v0, p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-void
.end method
