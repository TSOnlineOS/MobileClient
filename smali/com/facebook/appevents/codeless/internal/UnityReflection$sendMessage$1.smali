.class final synthetic Lcom/facebook/appevents/codeless/internal/UnityReflection$sendMessage$1;
.super Lkotlin/jvm/internal/MutablePropertyReference0Impl;
.source "UnityReflection.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x1,
        0x5,
        0x1
    }
.end annotation


# direct methods
.method constructor <init>(Lcom/facebook/appevents/codeless/internal/UnityReflection;)V
    .locals 6

    const-class v2, Lcom/facebook/appevents/codeless/internal/UnityReflection;

    const-string v3, "unityPlayer"

    const-string v4, "getUnityPlayer()Ljava/lang/Class;"

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lkotlin/jvm/internal/MutablePropertyReference0Impl;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public get()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/facebook/appevents/codeless/internal/UnityReflection$sendMessage$1;->receiver:Ljava/lang/Object;

    check-cast v0, Lcom/facebook/appevents/codeless/internal/UnityReflection;

    .line 38
    invoke-static {v0}, Lcom/facebook/appevents/codeless/internal/UnityReflection;->access$getUnityPlayer$p(Lcom/facebook/appevents/codeless/internal/UnityReflection;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public set(Ljava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Lcom/facebook/appevents/codeless/internal/UnityReflection$sendMessage$1;->receiver:Ljava/lang/Object;

    check-cast v0, Lcom/facebook/appevents/codeless/internal/UnityReflection;

    .line 38
    check-cast p1, Ljava/lang/Class;

    invoke-static {v0, p1}, Lcom/facebook/appevents/codeless/internal/UnityReflection;->access$setUnityPlayer$p(Lcom/facebook/appevents/codeless/internal/UnityReflection;Ljava/lang/Class;)V

    return-void
.end method
