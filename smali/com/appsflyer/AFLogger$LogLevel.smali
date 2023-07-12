.class public final enum Lcom/appsflyer/AFLogger$LogLevel;
.super Ljava/lang/Enum;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/appsflyer/AFLogger;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "LogLevel"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/appsflyer/AFLogger$LogLevel;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum DEBUG:Lcom/appsflyer/AFLogger$LogLevel;

.field public static final enum ERROR:Lcom/appsflyer/AFLogger$LogLevel;

.field public static final enum INFO:Lcom/appsflyer/AFLogger$LogLevel;

.field public static final enum NONE:Lcom/appsflyer/AFLogger$LogLevel;

.field public static final enum VERBOSE:Lcom/appsflyer/AFLogger$LogLevel;

.field public static final enum WARNING:Lcom/appsflyer/AFLogger$LogLevel;

.field private static final synthetic ˎ:[Lcom/appsflyer/AFLogger$LogLevel;


# instance fields
.field private ˏ:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 134
    new-instance v0, Lcom/appsflyer/AFLogger$LogLevel;

    const-string v1, "NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/appsflyer/AFLogger$LogLevel;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/appsflyer/AFLogger$LogLevel;->NONE:Lcom/appsflyer/AFLogger$LogLevel;

    new-instance v0, Lcom/appsflyer/AFLogger$LogLevel;

    const-string v1, "ERROR"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3, v3}, Lcom/appsflyer/AFLogger$LogLevel;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/appsflyer/AFLogger$LogLevel;->ERROR:Lcom/appsflyer/AFLogger$LogLevel;

    new-instance v0, Lcom/appsflyer/AFLogger$LogLevel;

    const-string v1, "WARNING"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4, v4}, Lcom/appsflyer/AFLogger$LogLevel;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/appsflyer/AFLogger$LogLevel;->WARNING:Lcom/appsflyer/AFLogger$LogLevel;

    new-instance v0, Lcom/appsflyer/AFLogger$LogLevel;

    const-string v1, "INFO"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5, v5}, Lcom/appsflyer/AFLogger$LogLevel;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/appsflyer/AFLogger$LogLevel;->INFO:Lcom/appsflyer/AFLogger$LogLevel;

    new-instance v0, Lcom/appsflyer/AFLogger$LogLevel;

    const-string v1, "DEBUG"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6, v6}, Lcom/appsflyer/AFLogger$LogLevel;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/appsflyer/AFLogger$LogLevel;->DEBUG:Lcom/appsflyer/AFLogger$LogLevel;

    new-instance v0, Lcom/appsflyer/AFLogger$LogLevel;

    const-string v1, "VERBOSE"

    const/4 v7, 0x5

    invoke-direct {v0, v1, v7, v7}, Lcom/appsflyer/AFLogger$LogLevel;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/appsflyer/AFLogger$LogLevel;->VERBOSE:Lcom/appsflyer/AFLogger$LogLevel;

    const/4 v1, 0x6

    new-array v1, v1, [Lcom/appsflyer/AFLogger$LogLevel;

    .line 132
    sget-object v8, Lcom/appsflyer/AFLogger$LogLevel;->NONE:Lcom/appsflyer/AFLogger$LogLevel;

    aput-object v8, v1, v2

    sget-object v2, Lcom/appsflyer/AFLogger$LogLevel;->ERROR:Lcom/appsflyer/AFLogger$LogLevel;

    aput-object v2, v1, v3

    sget-object v2, Lcom/appsflyer/AFLogger$LogLevel;->WARNING:Lcom/appsflyer/AFLogger$LogLevel;

    aput-object v2, v1, v4

    sget-object v2, Lcom/appsflyer/AFLogger$LogLevel;->INFO:Lcom/appsflyer/AFLogger$LogLevel;

    aput-object v2, v1, v5

    sget-object v2, Lcom/appsflyer/AFLogger$LogLevel;->DEBUG:Lcom/appsflyer/AFLogger$LogLevel;

    aput-object v2, v1, v6

    aput-object v0, v1, v7

    sput-object v1, Lcom/appsflyer/AFLogger$LogLevel;->ˎ:[Lcom/appsflyer/AFLogger$LogLevel;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 138
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 139
    iput p3, p0, Lcom/appsflyer/AFLogger$LogLevel;->ˏ:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/appsflyer/AFLogger$LogLevel;
    .locals 1

    .line 132
    const-class v0, Lcom/appsflyer/AFLogger$LogLevel;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/appsflyer/AFLogger$LogLevel;

    return-object p0
.end method

.method public static values()[Lcom/appsflyer/AFLogger$LogLevel;
    .locals 1

    .line 132
    sget-object v0, Lcom/appsflyer/AFLogger$LogLevel;->ˎ:[Lcom/appsflyer/AFLogger$LogLevel;

    invoke-virtual {v0}, [Lcom/appsflyer/AFLogger$LogLevel;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/appsflyer/AFLogger$LogLevel;

    return-object v0
.end method


# virtual methods
.method public final getLevel()I
    .locals 1

    .line 143
    iget v0, p0, Lcom/appsflyer/AFLogger$LogLevel;->ˏ:I

    return v0
.end method
