.class public final synthetic Lcom/facebook/internal/instrument/InstrumentData$Type$WhenMappings;
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
    .locals 7

    invoke-static {}, Lcom/facebook/internal/instrument/InstrumentData$Type;->values()[Lcom/facebook/internal/instrument/InstrumentData$Type;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/facebook/internal/instrument/InstrumentData$Type$WhenMappings;->$EnumSwitchMapping$0:[I

    sget-object v1, Lcom/facebook/internal/instrument/InstrumentData$Type;->Analysis:Lcom/facebook/internal/instrument/InstrumentData$Type;

    invoke-virtual {v1}, Lcom/facebook/internal/instrument/InstrumentData$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1

    sget-object v0, Lcom/facebook/internal/instrument/InstrumentData$Type$WhenMappings;->$EnumSwitchMapping$0:[I

    sget-object v1, Lcom/facebook/internal/instrument/InstrumentData$Type;->AnrReport:Lcom/facebook/internal/instrument/InstrumentData$Type;

    invoke-virtual {v1}, Lcom/facebook/internal/instrument/InstrumentData$Type;->ordinal()I

    move-result v1

    const/4 v3, 0x2

    aput v3, v0, v1

    sget-object v0, Lcom/facebook/internal/instrument/InstrumentData$Type$WhenMappings;->$EnumSwitchMapping$0:[I

    sget-object v1, Lcom/facebook/internal/instrument/InstrumentData$Type;->CrashReport:Lcom/facebook/internal/instrument/InstrumentData$Type;

    invoke-virtual {v1}, Lcom/facebook/internal/instrument/InstrumentData$Type;->ordinal()I

    move-result v1

    const/4 v4, 0x3

    aput v4, v0, v1

    sget-object v0, Lcom/facebook/internal/instrument/InstrumentData$Type$WhenMappings;->$EnumSwitchMapping$0:[I

    sget-object v1, Lcom/facebook/internal/instrument/InstrumentData$Type;->CrashShield:Lcom/facebook/internal/instrument/InstrumentData$Type;

    invoke-virtual {v1}, Lcom/facebook/internal/instrument/InstrumentData$Type;->ordinal()I

    move-result v1

    const/4 v5, 0x4

    aput v5, v0, v1

    sget-object v0, Lcom/facebook/internal/instrument/InstrumentData$Type$WhenMappings;->$EnumSwitchMapping$0:[I

    sget-object v1, Lcom/facebook/internal/instrument/InstrumentData$Type;->ThreadCheck:Lcom/facebook/internal/instrument/InstrumentData$Type;

    invoke-virtual {v1}, Lcom/facebook/internal/instrument/InstrumentData$Type;->ordinal()I

    move-result v1

    const/4 v6, 0x5

    aput v6, v0, v1

    invoke-static {}, Lcom/facebook/internal/instrument/InstrumentData$Type;->values()[Lcom/facebook/internal/instrument/InstrumentData$Type;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/facebook/internal/instrument/InstrumentData$Type$WhenMappings;->$EnumSwitchMapping$1:[I

    sget-object v1, Lcom/facebook/internal/instrument/InstrumentData$Type;->Analysis:Lcom/facebook/internal/instrument/InstrumentData$Type;

    invoke-virtual {v1}, Lcom/facebook/internal/instrument/InstrumentData$Type;->ordinal()I

    move-result v1

    aput v2, v0, v1

    sget-object v0, Lcom/facebook/internal/instrument/InstrumentData$Type$WhenMappings;->$EnumSwitchMapping$1:[I

    sget-object v1, Lcom/facebook/internal/instrument/InstrumentData$Type;->AnrReport:Lcom/facebook/internal/instrument/InstrumentData$Type;

    invoke-virtual {v1}, Lcom/facebook/internal/instrument/InstrumentData$Type;->ordinal()I

    move-result v1

    aput v3, v0, v1

    sget-object v0, Lcom/facebook/internal/instrument/InstrumentData$Type$WhenMappings;->$EnumSwitchMapping$1:[I

    sget-object v1, Lcom/facebook/internal/instrument/InstrumentData$Type;->CrashReport:Lcom/facebook/internal/instrument/InstrumentData$Type;

    invoke-virtual {v1}, Lcom/facebook/internal/instrument/InstrumentData$Type;->ordinal()I

    move-result v1

    aput v4, v0, v1

    sget-object v0, Lcom/facebook/internal/instrument/InstrumentData$Type$WhenMappings;->$EnumSwitchMapping$1:[I

    sget-object v1, Lcom/facebook/internal/instrument/InstrumentData$Type;->CrashShield:Lcom/facebook/internal/instrument/InstrumentData$Type;

    invoke-virtual {v1}, Lcom/facebook/internal/instrument/InstrumentData$Type;->ordinal()I

    move-result v1

    aput v5, v0, v1

    sget-object v0, Lcom/facebook/internal/instrument/InstrumentData$Type$WhenMappings;->$EnumSwitchMapping$1:[I

    sget-object v1, Lcom/facebook/internal/instrument/InstrumentData$Type;->ThreadCheck:Lcom/facebook/internal/instrument/InstrumentData$Type;

    invoke-virtual {v1}, Lcom/facebook/internal/instrument/InstrumentData$Type;->ordinal()I

    move-result v1

    aput v6, v0, v1

    return-void
.end method
