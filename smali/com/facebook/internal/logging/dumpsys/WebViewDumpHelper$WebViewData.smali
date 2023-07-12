.class final Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper$WebViewData;
.super Ljava/lang/Object;
.source "WebViewDumpHelper.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "WebViewData"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper$WebViewData$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\n\u0008\u0002\u0018\u0000 \u00132\u00020\u0001:\u0001\u0013B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004R\u0011\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008R\u0011\u0010\t\u001a\u00020\n\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\u000cR\u0011\u0010\r\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u0008R\u0011\u0010\u000f\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0010\u0010\u0008R\u0011\u0010\u0011\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0012\u0010\u0008\u00a8\u0006\u0014"
    }
    d2 = {
        "Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper$WebViewData;",
        "",
        "webView",
        "Landroid/webkit/WebView;",
        "(Landroid/webkit/WebView;)V",
        "height",
        "",
        "getHeight",
        "()I",
        "key",
        "",
        "getKey",
        "()Ljava/lang/String;",
        "left",
        "getLeft",
        "top",
        "getTop",
        "width",
        "getWidth",
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
.field public static final Companion:Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper$WebViewData$Companion;

.field private static final location:[I


# instance fields
.field private final height:I

.field private final key:Ljava/lang/String;

.field private final left:I

.field private final top:I

.field private final width:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper$WebViewData$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper$WebViewData$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper$WebViewData;->Companion:Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper$WebViewData$Companion;

    const/4 v0, 0x2

    new-array v0, v0, [I

    .line 64
    sput-object v0, Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper$WebViewData;->location:[I

    return-void
.end method

.method public constructor <init>(Landroid/webkit/WebView;)V
    .locals 5

    const-string v0, "webView"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    sget-object v0, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    const/4 v0, 0x2

    new-array v1, v0, [Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-virtual {p1}, Landroid/webkit/WebView;->hashCode()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v4, 0x1

    aput-object v2, v1, v4

    invoke-static {v1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    const-string v1, "%s{%s}"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "java.lang.String.format(format, *args)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper$WebViewData;->key:Ljava/lang/String;

    .line 69
    sget-object v0, Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper$WebViewData;->location:[I

    invoke-virtual {p1, v0}, Landroid/webkit/WebView;->getLocationOnScreen([I)V

    .line 70
    sget-object v0, Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper$WebViewData;->location:[I

    aget v1, v0, v3

    iput v1, p0, Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper$WebViewData;->left:I

    .line 71
    aget v0, v0, v4

    iput v0, p0, Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper$WebViewData;->top:I

    .line 72
    invoke-virtual {p1}, Landroid/webkit/WebView;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper$WebViewData;->width:I

    .line 73
    invoke-virtual {p1}, Landroid/webkit/WebView;->getHeight()I

    move-result p1

    iput p1, p0, Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper$WebViewData;->height:I

    return-void
.end method


# virtual methods
.method public final getHeight()I
    .locals 1

    .line 61
    iget v0, p0, Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper$WebViewData;->height:I

    return v0
.end method

.method public final getKey()Ljava/lang/String;
    .locals 1

    .line 57
    iget-object v0, p0, Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper$WebViewData;->key:Ljava/lang/String;

    return-object v0
.end method

.method public final getLeft()I
    .locals 1

    .line 58
    iget v0, p0, Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper$WebViewData;->left:I

    return v0
.end method

.method public final getTop()I
    .locals 1

    .line 59
    iget v0, p0, Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper$WebViewData;->top:I

    return v0
.end method

.method public final getWidth()I
    .locals 1

    .line 60
    iget v0, p0, Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper$WebViewData;->width:I

    return v0
.end method
