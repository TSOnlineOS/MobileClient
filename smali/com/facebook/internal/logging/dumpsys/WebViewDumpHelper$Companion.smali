.class public final Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper$Companion;
.super Ljava/lang/Object;
.source "WebViewDumpHelper.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0018\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\u0004H\u0002R\u000e\u0010\u0003\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\t"
    }
    d2 = {
        "Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper$Companion;",
        "",
        "()V",
        "GET_WEBVIEW_HTML_JS_SCRIPT",
        "",
        "fixHtmlString",
        "data",
        "Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper$WebViewData;",
        "html",
        "facebook-core_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x5,
        0x1
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 77
    invoke-direct {p0}, Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper$Companion;-><init>()V

    return-void
.end method

.method public static final synthetic access$fixHtmlString(Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper$Companion;Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper$WebViewData;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 77
    invoke-direct {p0, p1, p2}, Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper$Companion;->fixHtmlString(Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper$WebViewData;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private final fixHtmlString(Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper$WebViewData;Ljava/lang/String;)Ljava/lang/String;
    .locals 12

    const-string v1, "\\u003C"

    const-string v2, "<"

    const/4 v3, 0x0

    const/4 v4, 0x4

    const/4 v5, 0x0

    move-object v0, p2

    .line 126
    invoke-static/range {v0 .. v5}, Lkotlin/text/StringsKt;->replace$default(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "\\n"

    const-string v8, ""

    const/4 v9, 0x0

    const/4 v10, 0x4

    const/4 v11, 0x0

    invoke-static/range {v6 .. v11}, Lkotlin/text/StringsKt;->replace$default(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "\\\""

    const-string v2, "\""

    invoke-static/range {v0 .. v5}, Lkotlin/text/StringsKt;->replace$default(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 127
    sget-object v0, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    const/4 v0, 0x6

    new-array v1, v0, [Ljava/lang/Object;

    .line 129
    invoke-virtual {p1}, Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper$WebViewData;->getKey()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v3

    .line 130
    invoke-virtual {p1}, Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper$WebViewData;->getLeft()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    .line 131
    invoke-virtual {p1}, Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper$WebViewData;->getTop()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v4, 0x2

    aput-object v2, v1, v4

    .line 132
    invoke-virtual {p1}, Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper$WebViewData;->getWidth()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v4, 0x3

    aput-object v2, v1, v4

    .line 133
    invoke-virtual {p1}, Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper$WebViewData;->getHeight()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const/4 v2, 0x4

    aput-object p1, v1, v2

    .line 134
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p1

    sub-int/2addr p1, v3

    if-eqz p2, :cond_0

    invoke-virtual {p2, v3, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    const-string p2, "(this as java.lang.Strin\u2026ing(startIndex, endIndex)"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p2, 0x5

    aput-object p1, v1, p2

    .line 127
    invoke-static {v1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    const-string p2, "<html id=\"%s\" data-rect=\"%d,%d,%d,%d\">%s</html>"

    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "java.lang.String.format(format, *args)"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p1

    .line 134
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "null cannot be cast to non-null type java.lang.String"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
