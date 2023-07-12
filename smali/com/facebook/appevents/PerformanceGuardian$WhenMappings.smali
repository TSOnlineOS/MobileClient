.class public final synthetic Lcom/facebook/appevents/PerformanceGuardian$WhenMappings;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x1,
        0x5,
        0x1
    }
.end annotation


# static fields
.field public static final synthetic $EnumSwitchMapping$0:[I

.field public static final synthetic $EnumSwitchMapping$1:[I


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 4

    invoke-static {}, Lcom/facebook/appevents/PerformanceGuardian$UseCase;->values()[Lcom/facebook/appevents/PerformanceGuardian$UseCase;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/facebook/appevents/PerformanceGuardian$WhenMappings;->$EnumSwitchMapping$0:[I

    sget-object v1, Lcom/facebook/appevents/PerformanceGuardian$UseCase;->CODELESS:Lcom/facebook/appevents/PerformanceGuardian$UseCase;

    invoke-virtual {v1}, Lcom/facebook/appevents/PerformanceGuardian$UseCase;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1

    sget-object v0, Lcom/facebook/appevents/PerformanceGuardian$WhenMappings;->$EnumSwitchMapping$0:[I

    sget-object v1, Lcom/facebook/appevents/PerformanceGuardian$UseCase;->SUGGESTED_EVENT:Lcom/facebook/appevents/PerformanceGuardian$UseCase;

    invoke-virtual {v1}, Lcom/facebook/appevents/PerformanceGuardian$UseCase;->ordinal()I

    move-result v1

    const/4 v3, 0x2

    aput v3, v0, v1

    invoke-static {}, Lcom/facebook/appevents/PerformanceGuardian$UseCase;->values()[Lcom/facebook/appevents/PerformanceGuardian$UseCase;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/facebook/appevents/PerformanceGuardian$WhenMappings;->$EnumSwitchMapping$1:[I

    sget-object v1, Lcom/facebook/appevents/PerformanceGuardian$UseCase;->CODELESS:Lcom/facebook/appevents/PerformanceGuardian$UseCase;

    invoke-virtual {v1}, Lcom/facebook/appevents/PerformanceGuardian$UseCase;->ordinal()I

    move-result v1

    aput v2, v0, v1

    sget-object v0, Lcom/facebook/appevents/PerformanceGuardian$WhenMappings;->$EnumSwitchMapping$1:[I

    sget-object v1, Lcom/facebook/appevents/PerformanceGuardian$UseCase;->SUGGESTED_EVENT:Lcom/facebook/appevents/PerformanceGuardian$UseCase;

    invoke-virtual {v1}, Lcom/facebook/appevents/PerformanceGuardian$UseCase;->ordinal()I

    move-result v1

    aput v3, v0, v1

    return-void
.end method
