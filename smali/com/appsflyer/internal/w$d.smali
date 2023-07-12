.class final enum Lcom/appsflyer/internal/w$d;
.super Ljava/lang/Enum;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/appsflyer/internal/w;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/appsflyer/internal/w$d;",
        ">;"
    }
.end annotation


# static fields
.field private static enum ʼ:Lcom/appsflyer/internal/w$d;

.field private static enum ʽ:Lcom/appsflyer/internal/w$d;

.field public static final enum ˊ:Lcom/appsflyer/internal/w$d;

.field private static enum ˋ:Lcom/appsflyer/internal/w$d;

.field private static enum ˎ:Lcom/appsflyer/internal/w$d;

.field private static enum ˏ:Lcom/appsflyer/internal/w$d;

.field private static final synthetic ˏॱ:[Lcom/appsflyer/internal/w$d;

.field private static enum ॱ:Lcom/appsflyer/internal/w$d;

.field private static enum ॱॱ:Lcom/appsflyer/internal/w$d;


# instance fields
.field private ʻ:Ljava/lang/String;

.field private ᐝ:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 57
    new-instance v0, Lcom/appsflyer/internal/w$d;

    const-string v1, "UNITY"

    const/4 v2, 0x0

    const-string v3, "android_unity"

    const-string v4, "com.unity3d.player.UnityPlayer"

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/appsflyer/internal/w$d;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/appsflyer/internal/w$d;->ॱ:Lcom/appsflyer/internal/w$d;

    .line 58
    new-instance v0, Lcom/appsflyer/internal/w$d;

    const-string v1, "REACT_NATIVE"

    const/4 v3, 0x1

    const-string v4, "android_reactNative"

    const-string v5, "com.facebook.react.ReactApplication"

    invoke-direct {v0, v1, v3, v4, v5}, Lcom/appsflyer/internal/w$d;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/appsflyer/internal/w$d;->ˏ:Lcom/appsflyer/internal/w$d;

    .line 59
    new-instance v0, Lcom/appsflyer/internal/w$d;

    const-string v1, "CORDOVA"

    const/4 v4, 0x2

    const-string v5, "android_cordova"

    const-string v6, "org.apache.cordova.CordovaActivity"

    invoke-direct {v0, v1, v4, v5, v6}, Lcom/appsflyer/internal/w$d;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/appsflyer/internal/w$d;->ˎ:Lcom/appsflyer/internal/w$d;

    .line 60
    new-instance v0, Lcom/appsflyer/internal/w$d;

    const-string v1, "SEGMENT"

    const/4 v5, 0x3

    const-string v6, "android_segment"

    const-string v7, "com.segment.analytics.integrations.Integration"

    invoke-direct {v0, v1, v5, v6, v7}, Lcom/appsflyer/internal/w$d;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/appsflyer/internal/w$d;->ˋ:Lcom/appsflyer/internal/w$d;

    .line 61
    new-instance v0, Lcom/appsflyer/internal/w$d;

    const-string v1, "COCOS2DX"

    const/4 v6, 0x4

    const-string v7, "android_cocos2dx"

    const-string v8, "org.cocos2dx.lib.Cocos2dxActivity"

    invoke-direct {v0, v1, v6, v7, v8}, Lcom/appsflyer/internal/w$d;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/appsflyer/internal/w$d;->ʼ:Lcom/appsflyer/internal/w$d;

    .line 62
    new-instance v0, Lcom/appsflyer/internal/w$d;

    const-string v1, "DEFAULT"

    const/4 v7, 0x5

    const-string v8, "android_native"

    invoke-direct {v0, v1, v7, v8, v8}, Lcom/appsflyer/internal/w$d;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/appsflyer/internal/w$d;->ˊ:Lcom/appsflyer/internal/w$d;

    .line 63
    new-instance v0, Lcom/appsflyer/internal/w$d;

    const-string v1, "ADOBE_EX"

    const/4 v8, 0x6

    const-string v9, "android_adobe_ex"

    const-string v10, "com.appsflyer.adobeextension"

    invoke-direct {v0, v1, v8, v9, v10}, Lcom/appsflyer/internal/w$d;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/appsflyer/internal/w$d;->ʽ:Lcom/appsflyer/internal/w$d;

    .line 64
    new-instance v0, Lcom/appsflyer/internal/w$d;

    const-string v1, "FLUTTER"

    const/4 v9, 0x7

    const-string v10, "android_flutter"

    const-string v11, "io.flutter.plugin.common.MethodChannel.MethodCallHandler"

    invoke-direct {v0, v1, v9, v10, v11}, Lcom/appsflyer/internal/w$d;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/appsflyer/internal/w$d;->ॱॱ:Lcom/appsflyer/internal/w$d;

    const/16 v1, 0x8

    new-array v1, v1, [Lcom/appsflyer/internal/w$d;

    .line 56
    sget-object v10, Lcom/appsflyer/internal/w$d;->ॱ:Lcom/appsflyer/internal/w$d;

    aput-object v10, v1, v2

    sget-object v2, Lcom/appsflyer/internal/w$d;->ˏ:Lcom/appsflyer/internal/w$d;

    aput-object v2, v1, v3

    sget-object v2, Lcom/appsflyer/internal/w$d;->ˎ:Lcom/appsflyer/internal/w$d;

    aput-object v2, v1, v4

    sget-object v2, Lcom/appsflyer/internal/w$d;->ˋ:Lcom/appsflyer/internal/w$d;

    aput-object v2, v1, v5

    sget-object v2, Lcom/appsflyer/internal/w$d;->ʼ:Lcom/appsflyer/internal/w$d;

    aput-object v2, v1, v6

    sget-object v2, Lcom/appsflyer/internal/w$d;->ˊ:Lcom/appsflyer/internal/w$d;

    aput-object v2, v1, v7

    sget-object v2, Lcom/appsflyer/internal/w$d;->ʽ:Lcom/appsflyer/internal/w$d;

    aput-object v2, v1, v8

    aput-object v0, v1, v9

    sput-object v1, Lcom/appsflyer/internal/w$d;->ˏॱ:[Lcom/appsflyer/internal/w$d;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 70
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 71
    iput-object p3, p0, Lcom/appsflyer/internal/w$d;->ʻ:Ljava/lang/String;

    .line 72
    iput-object p4, p0, Lcom/appsflyer/internal/w$d;->ᐝ:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/appsflyer/internal/w$d;
    .locals 1

    .line 56
    const-class v0, Lcom/appsflyer/internal/w$d;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/appsflyer/internal/w$d;

    return-object p0
.end method

.method public static values()[Lcom/appsflyer/internal/w$d;
    .locals 1

    .line 56
    sget-object v0, Lcom/appsflyer/internal/w$d;->ˏॱ:[Lcom/appsflyer/internal/w$d;

    invoke-virtual {v0}, [Lcom/appsflyer/internal/w$d;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/appsflyer/internal/w$d;

    return-object v0
.end method

.method static synthetic ˎ(Lcom/appsflyer/internal/w$d;)Ljava/lang/String;
    .locals 0

    .line 56
    iget-object p0, p0, Lcom/appsflyer/internal/w$d;->ʻ:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic ॱ(Lcom/appsflyer/internal/w$d;)Ljava/lang/String;
    .locals 0

    .line 56
    iget-object p0, p0, Lcom/appsflyer/internal/w$d;->ᐝ:Ljava/lang/String;

    return-object p0
.end method
