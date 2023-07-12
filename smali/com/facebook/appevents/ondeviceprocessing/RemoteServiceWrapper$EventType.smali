.class public final enum Lcom/facebook/appevents/ondeviceprocessing/RemoteServiceWrapper$EventType;
.super Ljava/lang/Enum;
.source "RemoteServiceWrapper.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/appevents/ondeviceprocessing/RemoteServiceWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "EventType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/facebook/appevents/ondeviceprocessing/RemoteServiceWrapper$EventType;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0005\u0008\u0086\u0001\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u000f\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\u0008\u0010\u0005\u001a\u00020\u0003H\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000j\u0002\u0008\u0006j\u0002\u0008\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "Lcom/facebook/appevents/ondeviceprocessing/RemoteServiceWrapper$EventType;",
        "",
        "eventType",
        "",
        "(Ljava/lang/String;ILjava/lang/String;)V",
        "toString",
        "MOBILE_APP_INSTALL",
        "CUSTOM_APP_EVENTS",
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
.field private static final synthetic $VALUES:[Lcom/facebook/appevents/ondeviceprocessing/RemoteServiceWrapper$EventType;

.field public static final enum CUSTOM_APP_EVENTS:Lcom/facebook/appevents/ondeviceprocessing/RemoteServiceWrapper$EventType;

.field public static final enum MOBILE_APP_INSTALL:Lcom/facebook/appevents/ondeviceprocessing/RemoteServiceWrapper$EventType;


# instance fields
.field private final eventType:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/facebook/appevents/ondeviceprocessing/RemoteServiceWrapper$EventType;

    new-instance v1, Lcom/facebook/appevents/ondeviceprocessing/RemoteServiceWrapper$EventType;

    const-string v2, "MOBILE_APP_INSTALL"

    const/4 v3, 0x0

    .line 153
    invoke-direct {v1, v2, v3, v2}, Lcom/facebook/appevents/ondeviceprocessing/RemoteServiceWrapper$EventType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lcom/facebook/appevents/ondeviceprocessing/RemoteServiceWrapper$EventType;->MOBILE_APP_INSTALL:Lcom/facebook/appevents/ondeviceprocessing/RemoteServiceWrapper$EventType;

    aput-object v1, v0, v3

    new-instance v1, Lcom/facebook/appevents/ondeviceprocessing/RemoteServiceWrapper$EventType;

    const-string v2, "CUSTOM_APP_EVENTS"

    const/4 v3, 0x1

    .line 154
    invoke-direct {v1, v2, v3, v2}, Lcom/facebook/appevents/ondeviceprocessing/RemoteServiceWrapper$EventType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lcom/facebook/appevents/ondeviceprocessing/RemoteServiceWrapper$EventType;->CUSTOM_APP_EVENTS:Lcom/facebook/appevents/ondeviceprocessing/RemoteServiceWrapper$EventType;

    aput-object v1, v0, v3

    sput-object v0, Lcom/facebook/appevents/ondeviceprocessing/RemoteServiceWrapper$EventType;->$VALUES:[Lcom/facebook/appevents/ondeviceprocessing/RemoteServiceWrapper$EventType;

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

    .line 152
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lcom/facebook/appevents/ondeviceprocessing/RemoteServiceWrapper$EventType;->eventType:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/facebook/appevents/ondeviceprocessing/RemoteServiceWrapper$EventType;
    .locals 1

    const-class v0, Lcom/facebook/appevents/ondeviceprocessing/RemoteServiceWrapper$EventType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/facebook/appevents/ondeviceprocessing/RemoteServiceWrapper$EventType;

    return-object p0
.end method

.method public static values()[Lcom/facebook/appevents/ondeviceprocessing/RemoteServiceWrapper$EventType;
    .locals 1

    sget-object v0, Lcom/facebook/appevents/ondeviceprocessing/RemoteServiceWrapper$EventType;->$VALUES:[Lcom/facebook/appevents/ondeviceprocessing/RemoteServiceWrapper$EventType;

    invoke-virtual {v0}, [Lcom/facebook/appevents/ondeviceprocessing/RemoteServiceWrapper$EventType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/facebook/appevents/ondeviceprocessing/RemoteServiceWrapper$EventType;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 157
    iget-object v0, p0, Lcom/facebook/appevents/ondeviceprocessing/RemoteServiceWrapper$EventType;->eventType:Ljava/lang/String;

    return-object v0
.end method
