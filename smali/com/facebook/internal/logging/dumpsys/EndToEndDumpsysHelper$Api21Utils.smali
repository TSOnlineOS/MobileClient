.class final Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Api21Utils;
.super Ljava/lang/Object;
.source "EndToEndDumpsysHelper.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Api21Utils"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u00c2\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0012\u0010\u0005\u001a\u0004\u0018\u00010\u00062\u0006\u0010\u0007\u001a\u00020\u0008H\u0002J\u0016\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\u0007\u001a\u00020\u0008R\u0010\u0010\u0003\u001a\u0004\u0018\u00010\u0004X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\r"
    }
    d2 = {
        "Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Api21Utils;",
        "",
        "()V",
        "keyedTagsField",
        "Ljava/lang/reflect/Field;",
        "getTags",
        "Lorg/json/JSONObject;",
        "view",
        "Landroid/view/View;",
        "writeExtraProps",
        "",
        "writer",
        "Ljava/io/PrintWriter;",
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
.field public static final INSTANCE:Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Api21Utils;

.field private static keyedTagsField:Ljava/lang/reflect/Field;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 170
    new-instance v0, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Api21Utils;

    invoke-direct {v0}, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Api21Utils;-><init>()V

    sput-object v0, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Api21Utils;->INSTANCE:Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Api21Utils;

    .line 263
    :try_start_0
    const-class v0, Landroid/view/View;

    const-string v1, "mKeyedTags"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    sput-object v0, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Api21Utils;->keyedTagsField:Ljava/lang/reflect/Field;

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    .line 264
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 170
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final getTags(Landroid/view/View;)Lorg/json/JSONObject;
    .locals 6

    const/4 v0, 0x0

    .line 234
    move-object v1, v0

    check-cast v1, Lorg/json/JSONObject;

    .line 236
    :try_start_0
    sget-object v2, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Api21Utils;->keyedTagsField:Ljava/lang/reflect/Field;

    if-nez v2, :cond_0

    .line 237
    const-class v2, Landroid/view/View;

    const-string v3, "mKeyedTags"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    sput-object v2, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Api21Utils;->keyedTagsField:Ljava/lang/reflect/Field;

    if-eqz v2, :cond_0

    const/4 v3, 0x1

    .line 238
    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 240
    :cond_0
    sget-object v2, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Api21Utils;->keyedTagsField:Ljava/lang/reflect/Field;

    if-eqz v2, :cond_1

    invoke-virtual {v2, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    :cond_1
    if-eqz v0, :cond_3

    check-cast v0, Landroid/util/SparseArray;

    if-eqz v0, :cond_4

    .line 241
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-lez v2, :cond_4

    .line 242
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    const/4 v1, 0x0

    .line 244
    :try_start_1
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v3

    :goto_0
    if-ge v1, v3, :cond_2

    .line 246
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v5

    invoke-static {v4, v5}, Lcom/facebook/internal/logging/dumpsys/ResourcesUtil;->getIdStringQuietly(Landroid/content/res/Resources;I)Ljava/lang/String;

    move-result-object v4
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 248
    :try_start_2
    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    :catch_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :catch_1
    :cond_2
    move-object v1, v2

    goto :goto_1

    .line 240
    :cond_3
    :try_start_3
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "null cannot be cast to non-null type android.util.SparseArray<*>"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    :catch_2
    :cond_4
    :goto_1
    return-object v1
.end method


# virtual methods
.method public final writeExtraProps(Ljava/io/PrintWriter;Landroid/view/View;)V
    .locals 7

    const-string v0, "writer"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "view"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 173
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-ge v0, v1, :cond_0

    return-void

    .line 176
    :cond_0
    sget-object v0, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;->Companion:Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;

    invoke-static {v0, p2}, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;->access$createNodeInfoFromView(Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;Landroid/view/View;)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    if-eqz v0, :cond_a

    .line 177
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const/16 v2, 0x32

    .line 179
    :try_start_0
    instance-of v3, p2, Landroid/widget/TextView;

    if-eqz v3, :cond_1

    const-string v3, "textColor"

    .line 180
    move-object v4, p2

    check-cast v4, Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v4

    const-string v5, "view.textColors"

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v4}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v3, "textSize"

    .line 181
    move-object v4, p2

    check-cast v4, Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getTextSize()F

    move-result v4

    float-to-double v4, v4

    invoke-virtual {v1, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    const-string v3, "hint"

    .line 182
    sget-object v4, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;->Companion:Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;

    move-object v5, p2

    check-cast v5, Landroid/widget/TextView;

    invoke-virtual {v5}, Landroid/widget/TextView;->getHint()Ljava/lang/CharSequence;

    move-result-object v5

    const/16 v6, 0x64

    invoke-static {v4, v5, v6}, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;->access$fixString(Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;Ljava/lang/CharSequence;I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 184
    :cond_1
    invoke-direct {p0, p2}, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Api21Utils;->getTags(Landroid/view/View;)Lorg/json/JSONObject;

    move-result-object p2

    if-eqz p2, :cond_2

    const-string v3, "keyedTags"

    .line 186
    invoke-virtual {v1, v3, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 188
    :cond_2
    new-instance p2, Lorg/json/JSONArray;

    invoke-direct {p2}, Lorg/json/JSONArray;-><init>()V

    .line 189
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getActionList()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_3
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    const-string v5, "action"

    .line 190
    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v4}, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->getLabel()Ljava/lang/CharSequence;

    move-result-object v4

    if-eqz v4, :cond_4

    check-cast v4, Ljava/lang/String;

    if-eqz v4, :cond_3

    .line 192
    sget-object v5, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;->Companion:Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;

    check-cast v4, Ljava/lang/CharSequence;

    invoke-static {v5, v4, v2}, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;->access$fixString(Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;Ljava/lang/CharSequence;I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    .line 190
    :cond_4
    new-instance p2, Ljava/lang/NullPointerException;

    const-string v0, "null cannot be cast to non-null type kotlin.String"

    invoke-direct {p2, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 195
    :cond_5
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-lez v3, :cond_6

    const-string v3, "actions"

    .line 196
    invoke-virtual {v1, v3, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 198
    :cond_6
    sget-object p2, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;->Companion:Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-static {p2, v3, v2}, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;->access$fixString(Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;Ljava/lang/CharSequence;I)Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_8

    .line 199
    move-object v3, p2

    check-cast v3, Ljava/lang/CharSequence;

    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-lez v3, :cond_7

    const/4 v3, 0x1

    goto :goto_1

    :cond_7
    const/4 v3, 0x0

    :goto_1
    if-eqz v3, :cond_8

    const-string v3, "content-description"

    .line 200
    invoke-virtual {v1, v3, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_8
    const-string p2, "accessibility-focused"

    .line 203
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isAccessibilityFocused()Z

    move-result v3

    invoke-virtual {v1, p2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p2

    const-string v3, "checkable"

    .line 204
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isCheckable()Z

    move-result v4

    invoke-virtual {p2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p2

    const-string v3, "checked"

    .line 205
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isChecked()Z

    move-result v4

    invoke-virtual {p2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p2

    const-string v3, "class-name"

    .line 206
    sget-object v4, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;->Companion:Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-static {v4, v5, v2}, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;->access$fixString(Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;Ljava/lang/CharSequence;I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p2

    const-string v3, "clickable"

    .line 207
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v4

    invoke-virtual {p2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p2

    const-string v3, "content-invalid"

    .line 208
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isContentInvalid()Z

    move-result v4

    invoke-virtual {p2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p2

    const-string v3, "dismissable"

    .line 209
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isDismissable()Z

    move-result v4

    invoke-virtual {p2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p2

    const-string v3, "editable"

    .line 210
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isEditable()Z

    move-result v4

    invoke-virtual {p2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p2

    const-string v3, "enabled"

    .line 211
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isEnabled()Z

    move-result v4

    invoke-virtual {p2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p2

    const-string v3, "focusable"

    .line 212
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isFocusable()Z

    move-result v4

    invoke-virtual {p2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p2

    const-string v3, "focused"

    .line 213
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isFocused()Z

    move-result v4

    invoke-virtual {p2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p2

    const-string v3, "long-clickable"

    .line 214
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isLongClickable()Z

    move-result v4

    invoke-virtual {p2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p2

    const-string v3, "multiline"

    .line 215
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isMultiLine()Z

    move-result v4

    invoke-virtual {p2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p2

    const-string v3, "password"

    .line 216
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isPassword()Z

    move-result v4

    invoke-virtual {p2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p2

    const-string v3, "scrollable"

    .line 217
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isScrollable()Z

    move-result v4

    invoke-virtual {p2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p2

    const-string v3, "selected"

    .line 218
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isSelected()Z

    move-result v4

    invoke-virtual {p2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p2

    const-string v3, "visible-to-user"

    .line 219
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isVisibleToUser()Z

    move-result v4

    invoke-virtual {p2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 220
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x18

    if-lt p2, v3, :cond_9

    .line 221
    sget-object p2, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Api24Utils;->INSTANCE:Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Api24Utils;

    invoke-virtual {p2, v1, v0}, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Api24Utils;->addExtraProps(Lorg/json/JSONObject;Landroid/view/accessibility/AccessibilityNodeInfo;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p2

    :try_start_1
    const-string v0, "DUMP-ERROR"

    .line 225
    sget-object v3, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper;->Companion:Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;

    invoke-virtual {p2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p2

    check-cast p2, Ljava/lang/CharSequence;

    invoke-static {v3, p2, v2}, Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;->access$fixString(Lcom/facebook/internal/logging/dumpsys/EndToEndDumpsysHelper$Companion;Ljava/lang/CharSequence;I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :cond_9
    :goto_2
    const-string p2, " props=\""

    .line 230
    check-cast p2, Ljava/lang/CharSequence;

    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object p1

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p2

    check-cast p2, Ljava/lang/CharSequence;

    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object p1

    const-string p2, "\""

    check-cast p2, Ljava/lang/CharSequence;

    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    :cond_a
    return-void
.end method
