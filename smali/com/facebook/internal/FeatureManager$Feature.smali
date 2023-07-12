.class public final enum Lcom/facebook/internal/FeatureManager$Feature;
.super Ljava/lang/Enum;
.source "FeatureManager.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/internal/FeatureManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Feature"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/internal/FeatureManager$Feature$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/facebook/internal/FeatureManager$Feature;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0010\u000e\n\u0002\u0008\u001f\u0008\u0086\u0001\u0018\u0000 \'2\u0008\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\'B\u000f\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\u0006\u0010\u0008\u001a\u00020\tJ\u0008\u0010\n\u001a\u00020\tH\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0011\u0010\u0005\u001a\u00020\u00008F\u00a2\u0006\u0006\u001a\u0004\u0008\u0006\u0010\u0007j\u0002\u0008\u000bj\u0002\u0008\u000cj\u0002\u0008\rj\u0002\u0008\u000ej\u0002\u0008\u000fj\u0002\u0008\u0010j\u0002\u0008\u0011j\u0002\u0008\u0012j\u0002\u0008\u0013j\u0002\u0008\u0014j\u0002\u0008\u0015j\u0002\u0008\u0016j\u0002\u0008\u0017j\u0002\u0008\u0018j\u0002\u0008\u0019j\u0002\u0008\u001aj\u0002\u0008\u001bj\u0002\u0008\u001cj\u0002\u0008\u001dj\u0002\u0008\u001ej\u0002\u0008\u001fj\u0002\u0008 j\u0002\u0008!j\u0002\u0008\"j\u0002\u0008#j\u0002\u0008$j\u0002\u0008%j\u0002\u0008&\u00a8\u0006("
    }
    d2 = {
        "Lcom/facebook/internal/FeatureManager$Feature;",
        "",
        "code",
        "",
        "(Ljava/lang/String;II)V",
        "parent",
        "getParent",
        "()Lcom/facebook/internal/FeatureManager$Feature;",
        "toKey",
        "",
        "toString",
        "Unknown",
        "Core",
        "AppEvents",
        "CodelessEvents",
        "RestrictiveDataFiltering",
        "AAM",
        "PrivacyProtection",
        "SuggestedEvents",
        "IntelligentIntegrity",
        "ModelRequest",
        "EventDeactivation",
        "OnDeviceEventProcessing",
        "OnDevicePostInstallEventProcessing",
        "IapLogging",
        "IapLoggingLib2",
        "Instrument",
        "CrashReport",
        "CrashShield",
        "ThreadCheck",
        "ErrorReport",
        "AnrReport",
        "Monitoring",
        "Login",
        "ChromeCustomTabsPrefetching",
        "IgnoreAppSwitchToLoggedOut",
        "BypassAppSwitch",
        "Share",
        "Places",
        "Companion",
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
.field private static final synthetic $VALUES:[Lcom/facebook/internal/FeatureManager$Feature;

.field public static final enum AAM:Lcom/facebook/internal/FeatureManager$Feature;

.field public static final enum AnrReport:Lcom/facebook/internal/FeatureManager$Feature;

.field public static final enum AppEvents:Lcom/facebook/internal/FeatureManager$Feature;

.field public static final enum BypassAppSwitch:Lcom/facebook/internal/FeatureManager$Feature;

.field public static final enum ChromeCustomTabsPrefetching:Lcom/facebook/internal/FeatureManager$Feature;

.field public static final enum CodelessEvents:Lcom/facebook/internal/FeatureManager$Feature;

.field public static final Companion:Lcom/facebook/internal/FeatureManager$Feature$Companion;

.field public static final enum Core:Lcom/facebook/internal/FeatureManager$Feature;

.field public static final enum CrashReport:Lcom/facebook/internal/FeatureManager$Feature;

.field public static final enum CrashShield:Lcom/facebook/internal/FeatureManager$Feature;

.field public static final enum ErrorReport:Lcom/facebook/internal/FeatureManager$Feature;

.field public static final enum EventDeactivation:Lcom/facebook/internal/FeatureManager$Feature;

.field public static final enum IapLogging:Lcom/facebook/internal/FeatureManager$Feature;

.field public static final enum IapLoggingLib2:Lcom/facebook/internal/FeatureManager$Feature;

.field public static final enum IgnoreAppSwitchToLoggedOut:Lcom/facebook/internal/FeatureManager$Feature;

.field public static final enum Instrument:Lcom/facebook/internal/FeatureManager$Feature;

.field public static final enum IntelligentIntegrity:Lcom/facebook/internal/FeatureManager$Feature;

.field public static final enum Login:Lcom/facebook/internal/FeatureManager$Feature;

.field public static final enum ModelRequest:Lcom/facebook/internal/FeatureManager$Feature;

.field public static final enum Monitoring:Lcom/facebook/internal/FeatureManager$Feature;

.field public static final enum OnDeviceEventProcessing:Lcom/facebook/internal/FeatureManager$Feature;

.field public static final enum OnDevicePostInstallEventProcessing:Lcom/facebook/internal/FeatureManager$Feature;

.field public static final enum Places:Lcom/facebook/internal/FeatureManager$Feature;

.field public static final enum PrivacyProtection:Lcom/facebook/internal/FeatureManager$Feature;

.field public static final enum RestrictiveDataFiltering:Lcom/facebook/internal/FeatureManager$Feature;

.field public static final enum Share:Lcom/facebook/internal/FeatureManager$Feature;

.field public static final enum SuggestedEvents:Lcom/facebook/internal/FeatureManager$Feature;

.field public static final enum ThreadCheck:Lcom/facebook/internal/FeatureManager$Feature;

.field public static final enum Unknown:Lcom/facebook/internal/FeatureManager$Feature;


# instance fields
.field private final code:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    const/16 v0, 0x1c

    new-array v0, v0, [Lcom/facebook/internal/FeatureManager$Feature;

    new-instance v1, Lcom/facebook/internal/FeatureManager$Feature;

    const-string v2, "Unknown"

    const/4 v3, 0x0

    const/4 v4, -0x1

    .line 153
    invoke-direct {v1, v2, v3, v4}, Lcom/facebook/internal/FeatureManager$Feature;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/facebook/internal/FeatureManager$Feature;->Unknown:Lcom/facebook/internal/FeatureManager$Feature;

    aput-object v1, v0, v3

    new-instance v1, Lcom/facebook/internal/FeatureManager$Feature;

    const-string v2, "Core"

    const/4 v4, 0x1

    .line 157
    invoke-direct {v1, v2, v4, v3}, Lcom/facebook/internal/FeatureManager$Feature;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/facebook/internal/FeatureManager$Feature;->Core:Lcom/facebook/internal/FeatureManager$Feature;

    aput-object v1, v0, v4

    new-instance v1, Lcom/facebook/internal/FeatureManager$Feature;

    const-string v2, "AppEvents"

    const/4 v3, 0x2

    const/high16 v4, 0x10000

    .line 158
    invoke-direct {v1, v2, v3, v4}, Lcom/facebook/internal/FeatureManager$Feature;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/facebook/internal/FeatureManager$Feature;->AppEvents:Lcom/facebook/internal/FeatureManager$Feature;

    aput-object v1, v0, v3

    new-instance v1, Lcom/facebook/internal/FeatureManager$Feature;

    const-string v2, "CodelessEvents"

    const/4 v3, 0x3

    const v4, 0x10100

    .line 159
    invoke-direct {v1, v2, v3, v4}, Lcom/facebook/internal/FeatureManager$Feature;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/facebook/internal/FeatureManager$Feature;->CodelessEvents:Lcom/facebook/internal/FeatureManager$Feature;

    aput-object v1, v0, v3

    new-instance v1, Lcom/facebook/internal/FeatureManager$Feature;

    const-string v2, "RestrictiveDataFiltering"

    const/4 v3, 0x4

    const v4, 0x10200

    .line 160
    invoke-direct {v1, v2, v3, v4}, Lcom/facebook/internal/FeatureManager$Feature;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/facebook/internal/FeatureManager$Feature;->RestrictiveDataFiltering:Lcom/facebook/internal/FeatureManager$Feature;

    aput-object v1, v0, v3

    new-instance v1, Lcom/facebook/internal/FeatureManager$Feature;

    const-string v2, "AAM"

    const/4 v3, 0x5

    const v4, 0x10300

    .line 161
    invoke-direct {v1, v2, v3, v4}, Lcom/facebook/internal/FeatureManager$Feature;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/facebook/internal/FeatureManager$Feature;->AAM:Lcom/facebook/internal/FeatureManager$Feature;

    aput-object v1, v0, v3

    new-instance v1, Lcom/facebook/internal/FeatureManager$Feature;

    const-string v2, "PrivacyProtection"

    const/4 v3, 0x6

    const v4, 0x10400

    .line 162
    invoke-direct {v1, v2, v3, v4}, Lcom/facebook/internal/FeatureManager$Feature;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/facebook/internal/FeatureManager$Feature;->PrivacyProtection:Lcom/facebook/internal/FeatureManager$Feature;

    aput-object v1, v0, v3

    new-instance v1, Lcom/facebook/internal/FeatureManager$Feature;

    const-string v2, "SuggestedEvents"

    const/4 v3, 0x7

    const v4, 0x10401

    .line 163
    invoke-direct {v1, v2, v3, v4}, Lcom/facebook/internal/FeatureManager$Feature;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/facebook/internal/FeatureManager$Feature;->SuggestedEvents:Lcom/facebook/internal/FeatureManager$Feature;

    aput-object v1, v0, v3

    new-instance v1, Lcom/facebook/internal/FeatureManager$Feature;

    const-string v2, "IntelligentIntegrity"

    const/16 v3, 0x8

    const v4, 0x10402

    .line 164
    invoke-direct {v1, v2, v3, v4}, Lcom/facebook/internal/FeatureManager$Feature;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/facebook/internal/FeatureManager$Feature;->IntelligentIntegrity:Lcom/facebook/internal/FeatureManager$Feature;

    aput-object v1, v0, v3

    new-instance v1, Lcom/facebook/internal/FeatureManager$Feature;

    const-string v2, "ModelRequest"

    const/16 v3, 0x9

    const v4, 0x10403

    .line 165
    invoke-direct {v1, v2, v3, v4}, Lcom/facebook/internal/FeatureManager$Feature;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/facebook/internal/FeatureManager$Feature;->ModelRequest:Lcom/facebook/internal/FeatureManager$Feature;

    aput-object v1, v0, v3

    new-instance v1, Lcom/facebook/internal/FeatureManager$Feature;

    const-string v2, "EventDeactivation"

    const/16 v3, 0xa

    const v4, 0x10500

    .line 166
    invoke-direct {v1, v2, v3, v4}, Lcom/facebook/internal/FeatureManager$Feature;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/facebook/internal/FeatureManager$Feature;->EventDeactivation:Lcom/facebook/internal/FeatureManager$Feature;

    aput-object v1, v0, v3

    new-instance v1, Lcom/facebook/internal/FeatureManager$Feature;

    const-string v2, "OnDeviceEventProcessing"

    const/16 v3, 0xb

    const v4, 0x10600

    .line 167
    invoke-direct {v1, v2, v3, v4}, Lcom/facebook/internal/FeatureManager$Feature;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/facebook/internal/FeatureManager$Feature;->OnDeviceEventProcessing:Lcom/facebook/internal/FeatureManager$Feature;

    aput-object v1, v0, v3

    new-instance v1, Lcom/facebook/internal/FeatureManager$Feature;

    const-string v2, "OnDevicePostInstallEventProcessing"

    const/16 v3, 0xc

    const v4, 0x10601

    .line 168
    invoke-direct {v1, v2, v3, v4}, Lcom/facebook/internal/FeatureManager$Feature;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/facebook/internal/FeatureManager$Feature;->OnDevicePostInstallEventProcessing:Lcom/facebook/internal/FeatureManager$Feature;

    aput-object v1, v0, v3

    new-instance v1, Lcom/facebook/internal/FeatureManager$Feature;

    const-string v2, "IapLogging"

    const/16 v3, 0xd

    const v4, 0x10700

    .line 169
    invoke-direct {v1, v2, v3, v4}, Lcom/facebook/internal/FeatureManager$Feature;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/facebook/internal/FeatureManager$Feature;->IapLogging:Lcom/facebook/internal/FeatureManager$Feature;

    aput-object v1, v0, v3

    new-instance v1, Lcom/facebook/internal/FeatureManager$Feature;

    const-string v2, "IapLoggingLib2"

    const/16 v3, 0xe

    const v4, 0x10701

    .line 170
    invoke-direct {v1, v2, v3, v4}, Lcom/facebook/internal/FeatureManager$Feature;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/facebook/internal/FeatureManager$Feature;->IapLoggingLib2:Lcom/facebook/internal/FeatureManager$Feature;

    aput-object v1, v0, v3

    new-instance v1, Lcom/facebook/internal/FeatureManager$Feature;

    const-string v2, "Instrument"

    const/16 v3, 0xf

    const/high16 v4, 0x20000

    .line 171
    invoke-direct {v1, v2, v3, v4}, Lcom/facebook/internal/FeatureManager$Feature;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/facebook/internal/FeatureManager$Feature;->Instrument:Lcom/facebook/internal/FeatureManager$Feature;

    aput-object v1, v0, v3

    new-instance v1, Lcom/facebook/internal/FeatureManager$Feature;

    const-string v2, "CrashReport"

    const/16 v3, 0x10

    const v4, 0x20100

    .line 172
    invoke-direct {v1, v2, v3, v4}, Lcom/facebook/internal/FeatureManager$Feature;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/facebook/internal/FeatureManager$Feature;->CrashReport:Lcom/facebook/internal/FeatureManager$Feature;

    aput-object v1, v0, v3

    new-instance v1, Lcom/facebook/internal/FeatureManager$Feature;

    const-string v2, "CrashShield"

    const/16 v3, 0x11

    const v4, 0x20101

    .line 173
    invoke-direct {v1, v2, v3, v4}, Lcom/facebook/internal/FeatureManager$Feature;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/facebook/internal/FeatureManager$Feature;->CrashShield:Lcom/facebook/internal/FeatureManager$Feature;

    aput-object v1, v0, v3

    new-instance v1, Lcom/facebook/internal/FeatureManager$Feature;

    const-string v2, "ThreadCheck"

    const/16 v3, 0x12

    const v4, 0x20102

    .line 174
    invoke-direct {v1, v2, v3, v4}, Lcom/facebook/internal/FeatureManager$Feature;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/facebook/internal/FeatureManager$Feature;->ThreadCheck:Lcom/facebook/internal/FeatureManager$Feature;

    aput-object v1, v0, v3

    new-instance v1, Lcom/facebook/internal/FeatureManager$Feature;

    const-string v2, "ErrorReport"

    const/16 v3, 0x13

    const v4, 0x20200

    .line 175
    invoke-direct {v1, v2, v3, v4}, Lcom/facebook/internal/FeatureManager$Feature;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/facebook/internal/FeatureManager$Feature;->ErrorReport:Lcom/facebook/internal/FeatureManager$Feature;

    aput-object v1, v0, v3

    new-instance v1, Lcom/facebook/internal/FeatureManager$Feature;

    const-string v2, "AnrReport"

    const/16 v3, 0x14

    const v4, 0x20300

    .line 176
    invoke-direct {v1, v2, v3, v4}, Lcom/facebook/internal/FeatureManager$Feature;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/facebook/internal/FeatureManager$Feature;->AnrReport:Lcom/facebook/internal/FeatureManager$Feature;

    aput-object v1, v0, v3

    new-instance v1, Lcom/facebook/internal/FeatureManager$Feature;

    const-string v2, "Monitoring"

    const/16 v3, 0x15

    const/high16 v4, 0x30000

    .line 177
    invoke-direct {v1, v2, v3, v4}, Lcom/facebook/internal/FeatureManager$Feature;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/facebook/internal/FeatureManager$Feature;->Monitoring:Lcom/facebook/internal/FeatureManager$Feature;

    aput-object v1, v0, v3

    new-instance v1, Lcom/facebook/internal/FeatureManager$Feature;

    const-string v2, "Login"

    const/16 v3, 0x16

    const/high16 v4, 0x1000000

    .line 181
    invoke-direct {v1, v2, v3, v4}, Lcom/facebook/internal/FeatureManager$Feature;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/facebook/internal/FeatureManager$Feature;->Login:Lcom/facebook/internal/FeatureManager$Feature;

    const/16 v2, 0x16

    aput-object v1, v0, v2

    new-instance v1, Lcom/facebook/internal/FeatureManager$Feature;

    const-string v2, "ChromeCustomTabsPrefetching"

    const/16 v3, 0x17

    const/high16 v4, 0x1010000

    .line 182
    invoke-direct {v1, v2, v3, v4}, Lcom/facebook/internal/FeatureManager$Feature;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/facebook/internal/FeatureManager$Feature;->ChromeCustomTabsPrefetching:Lcom/facebook/internal/FeatureManager$Feature;

    const/16 v2, 0x17

    aput-object v1, v0, v2

    new-instance v1, Lcom/facebook/internal/FeatureManager$Feature;

    const-string v2, "IgnoreAppSwitchToLoggedOut"

    const/16 v3, 0x18

    const/high16 v4, 0x1020000

    .line 183
    invoke-direct {v1, v2, v3, v4}, Lcom/facebook/internal/FeatureManager$Feature;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/facebook/internal/FeatureManager$Feature;->IgnoreAppSwitchToLoggedOut:Lcom/facebook/internal/FeatureManager$Feature;

    const/16 v2, 0x18

    aput-object v1, v0, v2

    new-instance v1, Lcom/facebook/internal/FeatureManager$Feature;

    const-string v2, "BypassAppSwitch"

    const/16 v3, 0x19

    const/high16 v4, 0x1030000

    .line 184
    invoke-direct {v1, v2, v3, v4}, Lcom/facebook/internal/FeatureManager$Feature;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/facebook/internal/FeatureManager$Feature;->BypassAppSwitch:Lcom/facebook/internal/FeatureManager$Feature;

    const/16 v2, 0x19

    aput-object v1, v0, v2

    new-instance v1, Lcom/facebook/internal/FeatureManager$Feature;

    const-string v2, "Share"

    const/16 v3, 0x1a

    const/high16 v4, 0x2000000

    .line 188
    invoke-direct {v1, v2, v3, v4}, Lcom/facebook/internal/FeatureManager$Feature;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/facebook/internal/FeatureManager$Feature;->Share:Lcom/facebook/internal/FeatureManager$Feature;

    const/16 v2, 0x1a

    aput-object v1, v0, v2

    new-instance v1, Lcom/facebook/internal/FeatureManager$Feature;

    const-string v2, "Places"

    const/16 v3, 0x1b

    const/high16 v4, 0x3000000

    .line 192
    invoke-direct {v1, v2, v3, v4}, Lcom/facebook/internal/FeatureManager$Feature;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/facebook/internal/FeatureManager$Feature;->Places:Lcom/facebook/internal/FeatureManager$Feature;

    const/16 v2, 0x1b

    aput-object v1, v0, v2

    sput-object v0, Lcom/facebook/internal/FeatureManager$Feature;->$VALUES:[Lcom/facebook/internal/FeatureManager$Feature;

    new-instance v0, Lcom/facebook/internal/FeatureManager$Feature$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/internal/FeatureManager$Feature$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/facebook/internal/FeatureManager$Feature;->Companion:Lcom/facebook/internal/FeatureManager$Feature$Companion;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 152
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/facebook/internal/FeatureManager$Feature;->code:I

    return-void
.end method

.method public static final synthetic access$getCode$p(Lcom/facebook/internal/FeatureManager$Feature;)I
    .locals 0

    .line 152
    iget p0, p0, Lcom/facebook/internal/FeatureManager$Feature;->code:I

    return p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/facebook/internal/FeatureManager$Feature;
    .locals 1

    const-class v0, Lcom/facebook/internal/FeatureManager$Feature;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/facebook/internal/FeatureManager$Feature;

    return-object p0
.end method

.method public static values()[Lcom/facebook/internal/FeatureManager$Feature;
    .locals 1

    sget-object v0, Lcom/facebook/internal/FeatureManager$Feature;->$VALUES:[Lcom/facebook/internal/FeatureManager$Feature;

    invoke-virtual {v0}, [Lcom/facebook/internal/FeatureManager$Feature;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/facebook/internal/FeatureManager$Feature;

    return-object v0
.end method


# virtual methods
.method public final getParent()Lcom/facebook/internal/FeatureManager$Feature;
    .locals 3

    .line 233
    iget v0, p0, Lcom/facebook/internal/FeatureManager$Feature;->code:I

    and-int/lit16 v1, v0, 0xff

    if-lez v1, :cond_0

    .line 234
    sget-object v1, Lcom/facebook/internal/FeatureManager$Feature;->Companion:Lcom/facebook/internal/FeatureManager$Feature$Companion;

    and-int/lit16 v0, v0, -0x100

    invoke-virtual {v1, v0}, Lcom/facebook/internal/FeatureManager$Feature$Companion;->fromInt(I)Lcom/facebook/internal/FeatureManager$Feature;

    move-result-object v0

    goto :goto_0

    :cond_0
    const v1, 0xff00

    and-int/2addr v1, v0

    if-lez v1, :cond_1

    .line 237
    sget-object v1, Lcom/facebook/internal/FeatureManager$Feature;->Companion:Lcom/facebook/internal/FeatureManager$Feature$Companion;

    const/high16 v2, -0x10000

    and-int/2addr v0, v2

    invoke-virtual {v1, v0}, Lcom/facebook/internal/FeatureManager$Feature$Companion;->fromInt(I)Lcom/facebook/internal/FeatureManager$Feature;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/high16 v1, 0xff0000

    and-int/2addr v1, v0

    if-lez v1, :cond_2

    .line 240
    sget-object v1, Lcom/facebook/internal/FeatureManager$Feature;->Companion:Lcom/facebook/internal/FeatureManager$Feature$Companion;

    const/high16 v2, -0x1000000

    and-int/2addr v0, v2

    invoke-virtual {v1, v0}, Lcom/facebook/internal/FeatureManager$Feature$Companion;->fromInt(I)Lcom/facebook/internal/FeatureManager$Feature;

    move-result-object v0

    goto :goto_0

    .line 243
    :cond_2
    sget-object v0, Lcom/facebook/internal/FeatureManager$Feature;->Companion:Lcom/facebook/internal/FeatureManager$Feature$Companion;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/facebook/internal/FeatureManager$Feature$Companion;->fromInt(I)Lcom/facebook/internal/FeatureManager$Feature;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public final toKey()Ljava/lang/String;
    .locals 2

    .line 227
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "FBSDKFeature"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 195
    sget-object v0, Lcom/facebook/internal/FeatureManager$Feature$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {p0}, Lcom/facebook/internal/FeatureManager$Feature;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    const-string v0, "unknown"

    goto/16 :goto_0

    :pswitch_0
    const-string v0, "PlacesKit"

    goto/16 :goto_0

    :pswitch_1
    const-string v0, "ShareKit"

    goto :goto_0

    :pswitch_2
    const-string v0, "BypassAppSwitch"

    goto :goto_0

    :pswitch_3
    const-string v0, "IgnoreAppSwitchToLoggedOut"

    goto :goto_0

    :pswitch_4
    const-string v0, "ChromeCustomTabsPrefetching"

    goto :goto_0

    :pswitch_5
    const-string v0, "LoginKit"

    goto :goto_0

    :pswitch_6
    const-string v0, "Monitoring"

    goto :goto_0

    :pswitch_7
    const-string v0, "IAPLoggingLib2"

    goto :goto_0

    :pswitch_8
    const-string v0, "IAPLogging"

    goto :goto_0

    :pswitch_9
    const-string v0, "OnDevicePostInstallEventProcessing"

    goto :goto_0

    :pswitch_a
    const-string v0, "OnDeviceEventProcessing"

    goto :goto_0

    :pswitch_b
    const-string v0, "EventDeactivation"

    goto :goto_0

    :pswitch_c
    const-string v0, "ModelRequest"

    goto :goto_0

    :pswitch_d
    const-string v0, "IntelligentIntegrity"

    goto :goto_0

    :pswitch_e
    const-string v0, "SuggestedEvents"

    goto :goto_0

    :pswitch_f
    const-string v0, "PrivacyProtection"

    goto :goto_0

    :pswitch_10
    const-string v0, "AAM"

    goto :goto_0

    :pswitch_11
    const-string v0, "AnrReport"

    goto :goto_0

    :pswitch_12
    const-string v0, "ErrorReport"

    goto :goto_0

    :pswitch_13
    const-string v0, "ThreadCheck"

    goto :goto_0

    :pswitch_14
    const-string v0, "CrashShield"

    goto :goto_0

    :pswitch_15
    const-string v0, "CrashReport"

    goto :goto_0

    :pswitch_16
    const-string v0, "Instrument"

    goto :goto_0

    :pswitch_17
    const-string v0, "RestrictiveDataFiltering"

    goto :goto_0

    :pswitch_18
    const-string v0, "CodelessEvents"

    goto :goto_0

    :pswitch_19
    const-string v0, "AppEvents"

    goto :goto_0

    :pswitch_1a
    const-string v0, "CoreKit"

    :goto_0
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
