.class public final enum Lcom/facebook/appevents/PerformanceGuardian$UseCase;
.super Ljava/lang/Enum;
.source "PerformanceGuardian.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/appevents/PerformanceGuardian;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "UseCase"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/facebook/appevents/PerformanceGuardian$UseCase;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008\u0004\u0008\u0086\u0001\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002j\u0002\u0008\u0003j\u0002\u0008\u0004\u00a8\u0006\u0005"
    }
    d2 = {
        "Lcom/facebook/appevents/PerformanceGuardian$UseCase;",
        "",
        "(Ljava/lang/String;I)V",
        "CODELESS",
        "SUGGESTED_EVENT",
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
.field private static final synthetic $VALUES:[Lcom/facebook/appevents/PerformanceGuardian$UseCase;

.field public static final enum CODELESS:Lcom/facebook/appevents/PerformanceGuardian$UseCase;

.field public static final enum SUGGESTED_EVENT:Lcom/facebook/appevents/PerformanceGuardian$UseCase;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/facebook/appevents/PerformanceGuardian$UseCase;

    new-instance v1, Lcom/facebook/appevents/PerformanceGuardian$UseCase;

    const-string v2, "CODELESS"

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lcom/facebook/appevents/PerformanceGuardian$UseCase;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/facebook/appevents/PerformanceGuardian$UseCase;->CODELESS:Lcom/facebook/appevents/PerformanceGuardian$UseCase;

    aput-object v1, v0, v3

    new-instance v1, Lcom/facebook/appevents/PerformanceGuardian$UseCase;

    const-string v2, "SUGGESTED_EVENT"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Lcom/facebook/appevents/PerformanceGuardian$UseCase;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/facebook/appevents/PerformanceGuardian$UseCase;->SUGGESTED_EVENT:Lcom/facebook/appevents/PerformanceGuardian$UseCase;

    aput-object v1, v0, v3

    sput-object v0, Lcom/facebook/appevents/PerformanceGuardian$UseCase;->$VALUES:[Lcom/facebook/appevents/PerformanceGuardian$UseCase;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 133
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/facebook/appevents/PerformanceGuardian$UseCase;
    .locals 1

    const-class v0, Lcom/facebook/appevents/PerformanceGuardian$UseCase;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/facebook/appevents/PerformanceGuardian$UseCase;

    return-object p0
.end method

.method public static values()[Lcom/facebook/appevents/PerformanceGuardian$UseCase;
    .locals 1

    sget-object v0, Lcom/facebook/appevents/PerformanceGuardian$UseCase;->$VALUES:[Lcom/facebook/appevents/PerformanceGuardian$UseCase;

    invoke-virtual {v0}, [Lcom/facebook/appevents/PerformanceGuardian$UseCase;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/facebook/appevents/PerformanceGuardian$UseCase;

    return-object v0
.end method
