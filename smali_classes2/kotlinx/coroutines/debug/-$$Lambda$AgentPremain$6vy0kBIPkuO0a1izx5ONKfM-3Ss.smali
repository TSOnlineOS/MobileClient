.class public final synthetic Lkotlinx/coroutines/debug/-$$Lambda$AgentPremain$6vy0kBIPkuO0a1izx5ONKfM-3Ss;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lsun/misc/SignalHandler;


# static fields
.field public static final synthetic INSTANCE:Lkotlinx/coroutines/debug/-$$Lambda$AgentPremain$6vy0kBIPkuO0a1izx5ONKfM-3Ss;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lkotlinx/coroutines/debug/-$$Lambda$AgentPremain$6vy0kBIPkuO0a1izx5ONKfM-3Ss;

    invoke-direct {v0}, Lkotlinx/coroutines/debug/-$$Lambda$AgentPremain$6vy0kBIPkuO0a1izx5ONKfM-3Ss;-><init>()V

    sput-object v0, Lkotlinx/coroutines/debug/-$$Lambda$AgentPremain$6vy0kBIPkuO0a1izx5ONKfM-3Ss;->INSTANCE:Lkotlinx/coroutines/debug/-$$Lambda$AgentPremain$6vy0kBIPkuO0a1izx5ONKfM-3Ss;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final handle(Lsun/misc/Signal;)V
    .locals 0

    invoke-static {p1}, Lkotlinx/coroutines/debug/AgentPremain;->lambda$6vy0kBIPkuO0a1izx5ONKfM-3Ss(Lsun/misc/Signal;)V

    return-void
.end method
