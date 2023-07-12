.class public final Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;
.super Ljava/lang/Object;
.source "EndToEndDumpsysHelper.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Api21Utils;,
        Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Api24Utils;,
        Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000N\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0011\n\u0002\u0008\u0006\u0008\u0007\u0018\u0000 \u001d2\u00020\u0001:\u0003\u001b\u001c\u001dB\u0005\u00a2\u0006\u0002\u0010\u0002JB\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u000e2\u0008\u0010\u000f\u001a\u0004\u0018\u00010\u00102\u0006\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\u0015H\u0002J+\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u000e2\u000c\u0010\u0017\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\u0018H\u0002\u00a2\u0006\u0002\u0010\u0019J(\u0010\u001a\u001a\u00020\n2\u0006\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\u0016\u001a\u00020\u0015H\u0002R\u0010\u0010\u0003\u001a\u0004\u0018\u00010\u0004X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001e"
    }
    d2 = {
        "Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;",
        "",
        "()V",
        "lithoViewToStringMethod",
        "Ljava/lang/reflect/Method;",
        "rootResolver",
        "Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver;",
        "webViewDumpHelper",
        "Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper;",
        "dumpViewHierarchy",
        "",
        "prefix",
        "",
        "writer",
        "Ljava/io/PrintWriter;",
        "view",
        "Landroid/view/View;",
        "leftOffset",
        "",
        "topOffset",
        "withWebView",
        "",
        "withProps",
        "args",
        "",
        "(Ljava/lang/String;Ljava/io/PrintWriter;[Ljava/lang/String;)V",
        "writeLithoViewSubHierarchy",
        "Api21Utils",
        "Api24Utils",
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
.field private static final ALL_ROOTS_ARGUMENT:Ljava/lang/String; = "all-roots"

.field public static final Companion:Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;

.field private static final E2E_ARGUMENT:Ljava/lang/String; = "e2e"

.field private static final LITHO_VIEW_CLASS:Ljava/lang/String; = "com.facebook.litho.LithoView"

.field private static final LITHO_VIEW_TEST_HELPER_CLASS:Ljava/lang/String; = "com.facebook.litho.LithoViewTestHelper"

.field private static final LITHO_VIEW_TO_STRING_METHOD:Ljava/lang/String; = "viewToStringForE2E"

.field private static final RC_TEXT_VIEW_SIMPLE_CLASS_NAME:Ljava/lang/String; = "RCTextView"

.field private static final TOP_ROOT_ARGUMENT:Ljava/lang/String; = "top-root"

.field private static final WITH_PROPS_ARGUMENT:Ljava/lang/String; = "props"

.field private static final WITH_WEBVIEW_ARGUMENT:Ljava/lang/String; = "webview"

.field private static instance:Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;

.field private static rcTextViewGetTextMethod:Ljava/lang/reflect/Method;


# instance fields
.field private lithoViewToStringMethod:Ljava/lang/reflect/Method;

.field private final rootResolver:Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver;

.field private final webViewDumpHelper:Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;->Companion:Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    new-instance v0, Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver;

    invoke-direct {v0}, Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver;-><init>()V

    iput-object v0, p0, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;->rootResolver:Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver;

    .line 45
    new-instance v0, Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper;

    invoke-direct {v0}, Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper;-><init>()V

    iput-object v0, p0, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;->webViewDumpHelper:Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper;

    return-void
.end method

.method public static final synthetic access$dumpViewHierarchy(Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;Ljava/lang/String;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 0

    .line 43
    invoke-direct {p0, p1, p2, p3}, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;->dumpViewHierarchy(Ljava/lang/String;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    return-void
.end method

.method public static final synthetic access$getInstance$cp()Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;
    .locals 1

    .line 43
    sget-object v0, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;->instance:Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;

    return-object v0
.end method

.method public static final synthetic access$getRcTextViewGetTextMethod$cp()Ljava/lang/reflect/Method;
    .locals 1

    .line 43
    sget-object v0, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;->rcTextViewGetTextMethod:Ljava/lang/reflect/Method;

    return-object v0
.end method

.method public static final synthetic access$setInstance$cp(Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;)V
    .locals 0

    .line 43
    sput-object p0, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;->instance:Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;

    return-void
.end method

.method public static final synthetic access$setRcTextViewGetTextMethod$cp(Ljava/lang/reflect/Method;)V
    .locals 0

    .line 43
    sput-object p0, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;->rcTextViewGetTextMethod:Ljava/lang/reflect/Method;

    return-void
.end method

.method private final dumpViewHierarchy(Ljava/lang/String;Ljava/io/PrintWriter;Landroid/view/View;IIZZ)V
    .locals 17

    move-object/from16 v8, p0

    move-object/from16 v0, p1

    move-object/from16 v9, p2

    move-object/from16 v1, p3

    move/from16 v10, p7

    .line 100
    invoke-virtual {v9, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    if-nez v1, :cond_0

    const-string v0, "null"

    .line 102
    invoke-virtual {v9, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    return-void

    .line 105
    :cond_0
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v9, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v2, "{"

    .line 106
    invoke-virtual {v9, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 107
    invoke-virtual/range {p3 .. p3}, Landroid/view/View;->hashCode()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v9, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 108
    sget-object v2, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;->Companion:Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;

    invoke-static {v2, v9, v1}, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;->access$writeViewFlags(Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;Ljava/io/PrintWriter;Landroid/view/View;)V

    .line 109
    sget-object v2, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;->Companion:Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;

    move/from16 v3, p4

    move/from16 v4, p5

    invoke-static {v2, v9, v1, v3, v4}, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;->access$writeViewBounds(Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;Ljava/io/PrintWriter;Landroid/view/View;II)V

    .line 110
    sget-object v2, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;->Companion:Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;

    invoke-static {v2, v9, v1}, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;->access$writeViewTestId(Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;Ljava/io/PrintWriter;Landroid/view/View;)V

    .line 111
    sget-object v2, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;->Companion:Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;

    invoke-static {v2, v9, v1}, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;->access$writeViewText(Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;Ljava/io/PrintWriter;Landroid/view/View;)V

    if-eqz v10, :cond_1

    .line 112
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-lt v2, v3, :cond_1

    .line 113
    sget-object v2, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Api21Utils;->INSTANCE:Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Api21Utils;

    invoke-virtual {v2, v9, v1}, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Api21Utils;->writeExtraProps(Ljava/io/PrintWriter;Landroid/view/View;)V

    :cond_1
    const-string v2, "}"

    .line 115
    invoke-virtual {v9, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 116
    sget-object v2, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;->Companion:Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;

    invoke-static {v2, v1}, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;->access$isExtendsLithoView(Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 117
    invoke-direct {v8, v9, v1, v0, v10}, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;->writeLithoViewSubHierarchy(Ljava/io/PrintWriter;Landroid/view/View;Ljava/lang/String;Z)V

    :cond_2
    if-eqz p6, :cond_3

    .line 119
    instance-of v2, v1, Landroid/webkit/WebView;

    if-eqz v2, :cond_3

    .line 120
    iget-object v2, v8, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;->webViewDumpHelper:Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper;

    move-object v3, v1

    check-cast v3, Landroid/webkit/WebView;

    invoke-virtual {v2, v3}, Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper;->handle(Landroid/webkit/WebView;)V

    .line 122
    :cond_3
    instance-of v2, v1, Landroid/view/ViewGroup;

    if-nez v2, :cond_4

    return-void

    .line 125
    :cond_4
    move-object v11, v1

    check-cast v11, Landroid/view/ViewGroup;

    invoke-virtual {v11}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v12

    if-gtz v12, :cond_5

    return-void

    .line 129
    :cond_5
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "  "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const/4 v0, 0x2

    new-array v14, v0, [I

    .line 131
    invoke-virtual {v1, v14}, Landroid/view/View;->getLocationOnScreen([I)V

    const/4 v15, 0x0

    const/4 v7, 0x0

    :goto_0
    if-ge v7, v12, :cond_6

    .line 134
    invoke-virtual {v11, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    aget v4, v14, v15

    const/4 v0, 0x1

    aget v5, v14, v0

    move-object/from16 v0, p0

    move-object v1, v13

    move-object/from16 v2, p2

    move/from16 v6, p6

    move/from16 v16, v7

    move/from16 v7, p7

    .line 133
    invoke-direct/range {v0 .. v7}, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;->dumpViewHierarchy(Ljava/lang/String;Ljava/io/PrintWriter;Landroid/view/View;IIZZ)V

    add-int/lit8 v7, v16, 0x1

    goto :goto_0

    :cond_6
    return-void
.end method

.method private final dumpViewHierarchy(Ljava/lang/String;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 17

    move-object/from16 v9, p0

    move-object/from16 v0, p1

    move-object/from16 v10, p2

    move-object/from16 v1, p3

    .line 48
    invoke-virtual {v10, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v2, "Top Level Window View Hierarchy:"

    .line 49
    invoke-virtual {v10, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 50
    sget-object v2, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;->Companion:Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;

    const-string v3, "all-roots"

    invoke-static {v2, v1, v3}, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;->access$hasArgument(Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;[Ljava/lang/String;Ljava/lang/String;)Z

    move-result v11

    .line 51
    sget-object v2, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;->Companion:Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;

    const-string v3, "top-root"

    invoke-static {v2, v1, v3}, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;->access$hasArgument(Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;[Ljava/lang/String;Ljava/lang/String;)Z

    move-result v12

    .line 52
    sget-object v2, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;->Companion:Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;

    const-string v3, "webview"

    invoke-static {v2, v1, v3}, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;->access$hasArgument(Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;[Ljava/lang/String;Ljava/lang/String;)Z

    move-result v13

    .line 53
    sget-object v2, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;->Companion:Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;

    const-string v3, "props"

    invoke-static {v2, v1, v3}, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;->access$hasArgument(Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;[Ljava/lang/String;Ljava/lang/String;)Z

    move-result v14

    .line 55
    :try_start_0
    iget-object v1, v9, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;->rootResolver:Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver;

    invoke-virtual {v1}, Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver;->listActiveRoots()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_6

    .line 56
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    goto/16 :goto_2

    .line 60
    :cond_0
    invoke-static {v1}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    const/4 v2, 0x0

    .line 64
    check-cast v2, Landroid/view/WindowManager$LayoutParams;

    .line 65
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :cond_1
    :goto_0
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v16, v1

    check-cast v16, Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$Root;

    if-eqz v16, :cond_1

    .line 66
    invoke-virtual/range {v16 .. v16}, Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$Root;->getView()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_0

    :cond_2
    if-nez v11, :cond_3

    if-eqz v2, :cond_3

    .line 72
    invoke-virtual/range {v16 .. v16}, Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$Root;->getParam()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    iget v1, v1, Landroid/view/WindowManager$LayoutParams;->type:I

    iget v2, v2, Landroid/view/WindowManager$LayoutParams;->type:I

    sub-int/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_3

    goto :goto_1

    .line 76
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "  "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual/range {v16 .. v16}, Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$Root;->getView()Landroid/view/View;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v1, p0

    move-object/from16 v3, p2

    move v7, v13

    move v8, v14

    invoke-direct/range {v1 .. v8}, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;->dumpViewHierarchy(Ljava/lang/String;Ljava/io/PrintWriter;Landroid/view/View;IIZZ)V

    .line 77
    invoke-virtual/range {v16 .. v16}, Lcom/facebook/internal/logging/dumpsys/AndroidRootResolver$Root;->getParam()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    if-eqz v12, :cond_4

    goto :goto_1

    :cond_4
    move-object v2, v1

    goto :goto_0

    .line 84
    :cond_5
    :goto_1
    iget-object v0, v9, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;->webViewDumpHelper:Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper;

    invoke-virtual {v0, v10}, Lcom/facebook/internal/logging/dumpsys/WebViewDumpHelper;->dump(Ljava/io/PrintWriter;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :cond_6
    :goto_2
    return-void

    :catch_0
    move-exception v0

    .line 86
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failure in view hierarchy dump: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    :goto_3
    return-void
.end method

.method public static final maybeDump(Ljava/lang/String;Ljava/io/PrintWriter;[Ljava/lang/String;)Z
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;->Companion:Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;

    invoke-virtual {v0, p0, p1, p2}, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;->maybeDump(Ljava/lang/String;Ljava/io/PrintWriter;[Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private final writeLithoViewSubHierarchy(Ljava/io/PrintWriter;Landroid/view/View;Ljava/lang/String;Z)V
    .locals 8

    .line 145
    :try_start_0
    iget-object v0, p0, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;->lithoViewToStringMethod:Ljava/lang/reflect/Method;

    const/4 v1, 0x0

    const/4 v2, 0x3

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-nez v0, :cond_0

    const-string v0, "com.facebook.litho.LithoViewTestHelper"

    .line 146
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v5, "Class.forName(LITHO_VIEW_TEST_HELPER_CLASS)"

    invoke-static {v0, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "viewToStringForE2E"

    new-array v6, v2, [Ljava/lang/Class;

    .line 150
    const-class v7, Landroid/view/View;

    aput-object v7, v6, v1

    .line 151
    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v6, v4

    .line 152
    sget-object v7, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v7, v6, v3

    .line 148
    invoke-virtual {v0, v5, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;->lithoViewToStringMethod:Ljava/lang/reflect/Method;

    .line 158
    :cond_0
    iget-object v0, p0, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;->lithoViewToStringMethod:Ljava/lang/reflect/Method;

    const/4 v5, 0x0

    if-eqz v0, :cond_1

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p2, v2, v1

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p2

    div-int/2addr p2, v3

    add-int/2addr p2, v4

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    aput-object p2, v2, v4

    invoke-static {p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    aput-object p2, v2, v3

    invoke-virtual {v0, v5, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    :cond_1
    if-eqz v5, :cond_2

    check-cast v5, Ljava/lang/String;

    .line 159
    check-cast v5, Ljava/lang/CharSequence;

    invoke-virtual {p1, v5}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object p2

    const-string p4, "writer.append(lithoViewDump)"

    invoke-static {p2, p4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    .line 158
    :cond_2
    new-instance p2, Ljava/lang/NullPointerException;

    const-string p4, "null cannot be cast to non-null type kotlin.String"

    invoke-direct {p2, p4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p2

    .line 162
    check-cast p3, Ljava/lang/CharSequence;

    invoke-virtual {p1, p3}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object p1

    const-string p3, "Failed litho view sub hierarch dump: "

    .line 163
    check-cast p3, Ljava/lang/CharSequence;

    invoke-virtual {p1, p3}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object p1

    .line 164
    sget-object p3, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;->Companion:Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;

    invoke-virtual {p2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p2

    check-cast p2, Ljava/lang/CharSequence;

    const/16 p4, 0x64

    invoke-static {p3, p2, p4}, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;->access$fixString(Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;Ljava/lang/CharSequence;I)Ljava/lang/String;

    move-result-object p2

    check-cast p2, Ljava/lang/CharSequence;

    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object p1

    .line 165
    invoke-virtual {p1}, Ljava/io/PrintWriter;->println()V

    :goto_0
    return-void
.end method
