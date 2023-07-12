.class public final synthetic Lcom/facebook/AccessTokenSource$WhenMappings;
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


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 3

    invoke-static {}, Lcom/facebook/AccessTokenSource;->values()[Lcom/facebook/AccessTokenSource;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/facebook/AccessTokenSource$WhenMappings;->$EnumSwitchMapping$0:[I

    sget-object v1, Lcom/facebook/AccessTokenSource;->INSTAGRAM_APPLICATION_WEB:Lcom/facebook/AccessTokenSource;

    invoke-virtual {v1}, Lcom/facebook/AccessTokenSource;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1

    sget-object v0, Lcom/facebook/AccessTokenSource$WhenMappings;->$EnumSwitchMapping$0:[I

    sget-object v1, Lcom/facebook/AccessTokenSource;->INSTAGRAM_CUSTOM_CHROME_TAB:Lcom/facebook/AccessTokenSource;

    invoke-virtual {v1}, Lcom/facebook/AccessTokenSource;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1

    sget-object v0, Lcom/facebook/AccessTokenSource$WhenMappings;->$EnumSwitchMapping$0:[I

    sget-object v1, Lcom/facebook/AccessTokenSource;->INSTAGRAM_WEB_VIEW:Lcom/facebook/AccessTokenSource;

    invoke-virtual {v1}, Lcom/facebook/AccessTokenSource;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1

    return-void
.end method
