.class final Lcom/facebook/appevents/aam/MetadataIndexer$enable$1;
.super Ljava/lang/Object;
.source "MetadataIndexer.kt"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/appevents/aam/MetadataIndexer;->enable()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
        "run"
    }
    k = 0x3
    mv = {
        0x1,
        0x5,
        0x1
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/facebook/appevents/aam/MetadataIndexer$enable$1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/facebook/appevents/aam/MetadataIndexer$enable$1;

    invoke-direct {v0}, Lcom/facebook/appevents/aam/MetadataIndexer$enable$1;-><init>()V

    sput-object v0, Lcom/facebook/appevents/aam/MetadataIndexer$enable$1;->INSTANCE:Lcom/facebook/appevents/aam/MetadataIndexer$enable$1;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    invoke-static {p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-static {p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v0, :cond_1

    return-void

    .line 60
    :cond_1
    :try_start_1
    invoke-static {}, Lcom/facebook/FacebookSdk;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 61
    sget-object v1, Lcom/facebook/internal/AttributionIdentifiers;->Companion:Lcom/facebook/internal/AttributionIdentifiers$Companion;

    invoke-virtual {v1, v0}, Lcom/facebook/internal/AttributionIdentifiers$Companion;->isTrackingLimited(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 62
    sget-object v0, Lcom/facebook/appevents/aam/MetadataIndexer;->INSTANCE:Lcom/facebook/appevents/aam/MetadataIndexer;

    invoke-static {v0}, Lcom/facebook/appevents/aam/MetadataIndexer;->access$updateRules(Lcom/facebook/appevents/aam/MetadataIndexer;)V

    .line 63
    sget-object v0, Lcom/facebook/appevents/aam/MetadataIndexer;->INSTANCE:Lcom/facebook/appevents/aam/MetadataIndexer;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/facebook/appevents/aam/MetadataIndexer;->access$setEnabled$p(Lcom/facebook/appevents/aam/MetadataIndexer;Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_2
    return-void

    :catchall_0
    move-exception v0

    .line 65
    :try_start_2
    invoke-static {v0, p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    return-void

    :catchall_1
    move-exception v0

    invoke-static {v0, p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-void
.end method
