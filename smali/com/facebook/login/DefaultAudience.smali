.class public final enum Lcom/facebook/login/DefaultAudience;
.super Ljava/lang/Enum;
.source "DefaultAudience.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/facebook/login/DefaultAudience;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0008\u0008\u0086\u0001\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u0011\u0008\u0002\u0012\u0008\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0002\u0010\u0004R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006j\u0002\u0008\u0007j\u0002\u0008\u0008j\u0002\u0008\tj\u0002\u0008\n\u00a8\u0006\u000b"
    }
    d2 = {
        "Lcom/facebook/login/DefaultAudience;",
        "",
        "nativeProtocolAudience",
        "",
        "(Ljava/lang/String;ILjava/lang/String;)V",
        "getNativeProtocolAudience",
        "()Ljava/lang/String;",
        "NONE",
        "ONLY_ME",
        "FRIENDS",
        "EVERYONE",
        "facebook-core_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x5,
        0x1
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/facebook/login/DefaultAudience;

.field public static final enum EVERYONE:Lcom/facebook/login/DefaultAudience;

.field public static final enum FRIENDS:Lcom/facebook/login/DefaultAudience;

.field public static final enum NONE:Lcom/facebook/login/DefaultAudience;

.field public static final enum ONLY_ME:Lcom/facebook/login/DefaultAudience;


# instance fields
.field private final nativeProtocolAudience:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    const/4 v0, 0x4

    new-array v0, v0, [Lcom/facebook/login/DefaultAudience;

    new-instance v1, Lcom/facebook/login/DefaultAudience;

    const-string v2, "NONE"

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 32
    invoke-direct {v1, v2, v3, v4}, Lcom/facebook/login/DefaultAudience;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lcom/facebook/login/DefaultAudience;->NONE:Lcom/facebook/login/DefaultAudience;

    aput-object v1, v0, v3

    new-instance v1, Lcom/facebook/login/DefaultAudience;

    const-string v2, "ONLY_ME"

    const/4 v3, 0x1

    const-string v4, "only_me"

    .line 35
    invoke-direct {v1, v2, v3, v4}, Lcom/facebook/login/DefaultAudience;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lcom/facebook/login/DefaultAudience;->ONLY_ME:Lcom/facebook/login/DefaultAudience;

    aput-object v1, v0, v3

    new-instance v1, Lcom/facebook/login/DefaultAudience;

    const-string v2, "FRIENDS"

    const/4 v3, 0x2

    const-string v4, "friends"

    .line 38
    invoke-direct {v1, v2, v3, v4}, Lcom/facebook/login/DefaultAudience;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lcom/facebook/login/DefaultAudience;->FRIENDS:Lcom/facebook/login/DefaultAudience;

    aput-object v1, v0, v3

    new-instance v1, Lcom/facebook/login/DefaultAudience;

    const-string v2, "EVERYONE"

    const/4 v3, 0x3

    const-string v4, "everyone"

    .line 40
    invoke-direct {v1, v2, v3, v4}, Lcom/facebook/login/DefaultAudience;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lcom/facebook/login/DefaultAudience;->EVERYONE:Lcom/facebook/login/DefaultAudience;

    aput-object v1, v0, v3

    sput-object v0, Lcom/facebook/login/DefaultAudience;->$VALUES:[Lcom/facebook/login/DefaultAudience;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 30
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lcom/facebook/login/DefaultAudience;->nativeProtocolAudience:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/facebook/login/DefaultAudience;
    .locals 1

    const-class v0, Lcom/facebook/login/DefaultAudience;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/facebook/login/DefaultAudience;

    return-object p0
.end method

.method public static values()[Lcom/facebook/login/DefaultAudience;
    .locals 1

    sget-object v0, Lcom/facebook/login/DefaultAudience;->$VALUES:[Lcom/facebook/login/DefaultAudience;

    invoke-virtual {v0}, [Lcom/facebook/login/DefaultAudience;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/facebook/login/DefaultAudience;

    return-object v0
.end method


# virtual methods
.method public final getNativeProtocolAudience()Ljava/lang/String;
    .locals 1

    .line 30
    iget-object v0, p0, Lcom/facebook/login/DefaultAudience;->nativeProtocolAudience:Ljava/lang/String;

    return-object v0
.end method
