.class public Lcom/facebook/share/internal/MessengerShareContentUtility;
.super Ljava/lang/Object;
.source "MessengerShareContentUtility.java"


# static fields
.field public static final ATTACHMENT:Ljava/lang/String; = "attachment"

.field public static final ATTACHMENT_ID:Ljava/lang/String; = "attachment_id"

.field public static final ATTACHMENT_PAYLOAD:Ljava/lang/String; = "payload"

.field public static final ATTACHMENT_TEMPLATE_TYPE:Ljava/lang/String; = "template"

.field public static final ATTACHMENT_TYPE:Ljava/lang/String; = "type"

.field public static final BUTTONS:Ljava/lang/String; = "buttons"

.field public static final BUTTON_TYPE:Ljava/lang/String; = "type"

.field public static final BUTTON_URL_TYPE:Ljava/lang/String; = "web_url"

.field public static final DEFAULT_ACTION:Ljava/lang/String; = "default_action"

.field public static final ELEMENTS:Ljava/lang/String; = "elements"

.field public static final FACEBOOK_DOMAIN:Ljava/util/regex/Pattern;

.field public static final FALLBACK_URL:Ljava/lang/String; = "fallback_url"

.field public static final IMAGE_ASPECT_RATIO:Ljava/lang/String; = "image_aspect_ratio"

.field public static final IMAGE_RATIO_HORIZONTAL:Ljava/lang/String; = "horizontal"

.field public static final IMAGE_RATIO_SQUARE:Ljava/lang/String; = "square"

.field public static final IMAGE_URL:Ljava/lang/String; = "image_url"

.field public static final MEDIA_IMAGE:Ljava/lang/String; = "image"

.field public static final MEDIA_TYPE:Ljava/lang/String; = "media_type"

.field public static final MEDIA_VIDEO:Ljava/lang/String; = "video"

.field public static final MESSENGER_EXTENSIONS:Ljava/lang/String; = "messenger_extensions"

.field public static final PREVIEW_DEFAULT:Ljava/lang/String; = "DEFAULT"

.field public static final PREVIEW_OPEN_GRAPH:Ljava/lang/String; = "OPEN_GRAPH"

.field public static final SHARABLE:Ljava/lang/String; = "sharable"

.field public static final SHARE_BUTTON_HIDE:Ljava/lang/String; = "hide"

.field public static final SUBTITLE:Ljava/lang/String; = "subtitle"

.field public static final TEMPLATE_GENERIC_TYPE:Ljava/lang/String; = "generic"

.field public static final TEMPLATE_MEDIA_TYPE:Ljava/lang/String; = "media"

.field public static final TEMPLATE_OPEN_GRAPH_TYPE:Ljava/lang/String; = "open_graph"

.field public static final TEMPLATE_TYPE:Ljava/lang/String; = "template_type"

.field public static final TITLE:Ljava/lang/String; = "title"

.field public static final URL:Ljava/lang/String; = "url"

.field public static final WEBVIEW_RATIO:Ljava/lang/String; = "webview_height_ratio"

.field public static final WEBVIEW_RATIO_COMPACT:Ljava/lang/String; = "compact"

.field public static final WEBVIEW_RATIO_FULL:Ljava/lang/String; = "full"

.field public static final WEBVIEW_RATIO_TALL:Ljava/lang/String; = "tall"

.field public static final WEBVIEW_SHARE_BUTTON:Ljava/lang/String; = "webview_share_button"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "^(.+)\\.(facebook\\.com)$"

    .line 51
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/facebook/share/internal/MessengerShareContentUtility;->FACEBOOK_DOMAIN:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static addActionButton(Landroid/os/Bundle;Lcom/facebook/share/model/ShareMessengerActionButton;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-class v0, Lcom/facebook/share/internal/MessengerShareContentUtility;

    invoke-static {v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    :cond_0
    if-nez p1, :cond_1

    return-void

    .line 161
    :cond_1
    :try_start_0
    instance-of v1, p1, Lcom/facebook/share/model/ShareMessengerURLActionButton;

    if-eqz v1, :cond_2

    .line 162
    check-cast p1, Lcom/facebook/share/model/ShareMessengerURLActionButton;

    invoke-static {p0, p1, p2}, Lcom/facebook/share/internal/MessengerShareContentUtility;->addURLActionButton(Landroid/os/Bundle;Lcom/facebook/share/model/ShareMessengerURLActionButton;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_2
    return-void

    :catchall_0
    move-exception p0

    .line 164
    invoke-static {p0, v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-void
.end method

.method public static addGenericTemplateContent(Landroid/os/Bundle;Lcom/facebook/share/model/ShareMessengerGenericTemplateContent;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-class v0, Lcom/facebook/share/internal/MessengerShareContentUtility;

    invoke-static {v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    .line 98
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Lcom/facebook/share/model/ShareMessengerGenericTemplateContent;->getGenericTemplateElement()Lcom/facebook/share/model/ShareMessengerGenericTemplateElement;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/facebook/share/internal/MessengerShareContentUtility;->addGenericTemplateElementForPreview(Landroid/os/Bundle;Lcom/facebook/share/model/ShareMessengerGenericTemplateElement;)V

    const-string v1, "MESSENGER_PLATFORM_CONTENT"

    .line 102
    invoke-static {p1}, Lcom/facebook/share/internal/MessengerShareContentUtility;->serializeGenericTemplateContent(Lcom/facebook/share/model/ShareMessengerGenericTemplateContent;)Lorg/json/JSONObject;

    move-result-object p1

    .line 99
    invoke-static {p0, v1, p1}, Lcom/facebook/internal/Utility;->putJSONValueInBundle(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p0

    .line 103
    invoke-static {p0, v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-void
.end method

.method private static addGenericTemplateElementForPreview(Landroid/os/Bundle;Lcom/facebook/share/model/ShareMessengerGenericTemplateElement;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-class v0, Lcom/facebook/share/internal/MessengerShareContentUtility;

    invoke-static {v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    .line 123
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Lcom/facebook/share/model/ShareMessengerGenericTemplateElement;->getButton()Lcom/facebook/share/model/ShareMessengerActionButton;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 124
    invoke-virtual {p1}, Lcom/facebook/share/model/ShareMessengerGenericTemplateElement;->getButton()Lcom/facebook/share/model/ShareMessengerActionButton;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Lcom/facebook/share/internal/MessengerShareContentUtility;->addActionButton(Landroid/os/Bundle;Lcom/facebook/share/model/ShareMessengerActionButton;Z)V

    goto :goto_0

    .line 125
    :cond_1
    invoke-virtual {p1}, Lcom/facebook/share/model/ShareMessengerGenericTemplateElement;->getDefaultAction()Lcom/facebook/share/model/ShareMessengerActionButton;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 126
    invoke-virtual {p1}, Lcom/facebook/share/model/ShareMessengerGenericTemplateElement;->getDefaultAction()Lcom/facebook/share/model/ShareMessengerActionButton;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {p0, v1, v2}, Lcom/facebook/share/internal/MessengerShareContentUtility;->addActionButton(Landroid/os/Bundle;Lcom/facebook/share/model/ShareMessengerActionButton;Z)V

    :cond_2
    :goto_0
    const-string v1, "IMAGE"

    .line 129
    invoke-virtual {p1}, Lcom/facebook/share/model/ShareMessengerGenericTemplateElement;->getImageUrl()Landroid/net/Uri;

    move-result-object v2

    invoke-static {p0, v1, v2}, Lcom/facebook/internal/Utility;->putUri(Landroid/os/Bundle;Ljava/lang/String;Landroid/net/Uri;)V

    const-string v1, "PREVIEW_TYPE"

    const-string v2, "DEFAULT"

    .line 130
    invoke-static {p0, v1, v2}, Lcom/facebook/internal/Utility;->putNonEmptyString(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "TITLE"

    .line 131
    invoke-virtual {p1}, Lcom/facebook/share/model/ShareMessengerGenericTemplateElement;->getTitle()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v1, v2}, Lcom/facebook/internal/Utility;->putNonEmptyString(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "SUBTITLE"

    .line 132
    invoke-virtual {p1}, Lcom/facebook/share/model/ShareMessengerGenericTemplateElement;->getSubtitle()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, v1, p1}, Lcom/facebook/internal/Utility;->putNonEmptyString(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p0

    .line 133
    invoke-static {p0, v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-void
.end method

.method public static addMediaTemplateContent(Landroid/os/Bundle;Lcom/facebook/share/model/ShareMessengerMediaTemplateContent;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-class v0, Lcom/facebook/share/internal/MessengerShareContentUtility;

    invoke-static {v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    .line 116
    :cond_0
    :try_start_0
    invoke-static {p0, p1}, Lcom/facebook/share/internal/MessengerShareContentUtility;->addMediaTemplateContentForPreview(Landroid/os/Bundle;Lcom/facebook/share/model/ShareMessengerMediaTemplateContent;)V

    const-string v1, "MESSENGER_PLATFORM_CONTENT"

    .line 118
    invoke-static {p1}, Lcom/facebook/share/internal/MessengerShareContentUtility;->serializeMediaTemplateContent(Lcom/facebook/share/model/ShareMessengerMediaTemplateContent;)Lorg/json/JSONObject;

    move-result-object p1

    .line 117
    invoke-static {p0, v1, p1}, Lcom/facebook/internal/Utility;->putJSONValueInBundle(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p0

    .line 119
    invoke-static {p0, v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-void
.end method

.method private static addMediaTemplateContentForPreview(Landroid/os/Bundle;Lcom/facebook/share/model/ShareMessengerMediaTemplateContent;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-class v0, Lcom/facebook/share/internal/MessengerShareContentUtility;

    invoke-static {v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    .line 144
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Lcom/facebook/share/model/ShareMessengerMediaTemplateContent;->getButton()Lcom/facebook/share/model/ShareMessengerActionButton;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Lcom/facebook/share/internal/MessengerShareContentUtility;->addActionButton(Landroid/os/Bundle;Lcom/facebook/share/model/ShareMessengerActionButton;Z)V

    const-string v1, "PREVIEW_TYPE"

    const-string v2, "DEFAULT"

    .line 145
    invoke-static {p0, v1, v2}, Lcom/facebook/internal/Utility;->putNonEmptyString(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "ATTACHMENT_ID"

    .line 146
    invoke-virtual {p1}, Lcom/facebook/share/model/ShareMessengerMediaTemplateContent;->getAttachmentId()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v1, v2}, Lcom/facebook/internal/Utility;->putNonEmptyString(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)V

    .line 147
    invoke-virtual {p1}, Lcom/facebook/share/model/ShareMessengerMediaTemplateContent;->getMediaUrl()Landroid/net/Uri;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 148
    invoke-virtual {p1}, Lcom/facebook/share/model/ShareMessengerMediaTemplateContent;->getMediaUrl()Landroid/net/Uri;

    move-result-object v1

    invoke-static {v1}, Lcom/facebook/share/internal/MessengerShareContentUtility;->getMediaUrlKey(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/facebook/share/model/ShareMessengerMediaTemplateContent;->getMediaUrl()Landroid/net/Uri;

    move-result-object v2

    invoke-static {p0, v1, v2}, Lcom/facebook/internal/Utility;->putUri(Landroid/os/Bundle;Ljava/lang/String;Landroid/net/Uri;)V

    :cond_1
    const-string v1, "type"

    .line 151
    invoke-virtual {p1}, Lcom/facebook/share/model/ShareMessengerMediaTemplateContent;->getMediaType()Lcom/facebook/share/model/ShareMessengerMediaTemplateContent$MediaType;

    move-result-object p1

    invoke-static {p1}, Lcom/facebook/share/internal/MessengerShareContentUtility;->getMediaType(Lcom/facebook/share/model/ShareMessengerMediaTemplateContent$MediaType;)Ljava/lang/String;

    move-result-object p1

    .line 150
    invoke-static {p0, v1, p1}, Lcom/facebook/internal/Utility;->putNonEmptyString(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p0

    .line 152
    invoke-static {p0, v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-void
.end method

.method public static addOpenGraphMusicTemplateContent(Landroid/os/Bundle;Lcom/facebook/share/model/ShareMessengerOpenGraphMusicTemplateContent;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-class v0, Lcom/facebook/share/internal/MessengerShareContentUtility;

    invoke-static {v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    .line 107
    :cond_0
    :try_start_0
    invoke-static {p0, p1}, Lcom/facebook/share/internal/MessengerShareContentUtility;->addOpenGraphMusicTemplateContentForPreview(Landroid/os/Bundle;Lcom/facebook/share/model/ShareMessengerOpenGraphMusicTemplateContent;)V

    const-string v1, "MESSENGER_PLATFORM_CONTENT"

    .line 111
    invoke-static {p1}, Lcom/facebook/share/internal/MessengerShareContentUtility;->serializeOpenGraphMusicTemplateContent(Lcom/facebook/share/model/ShareMessengerOpenGraphMusicTemplateContent;)Lorg/json/JSONObject;

    move-result-object p1

    .line 108
    invoke-static {p0, v1, p1}, Lcom/facebook/internal/Utility;->putJSONValueInBundle(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p0

    .line 112
    invoke-static {p0, v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-void
.end method

.method private static addOpenGraphMusicTemplateContentForPreview(Landroid/os/Bundle;Lcom/facebook/share/model/ShareMessengerOpenGraphMusicTemplateContent;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-class v0, Lcom/facebook/share/internal/MessengerShareContentUtility;

    invoke-static {v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    .line 137
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Lcom/facebook/share/model/ShareMessengerOpenGraphMusicTemplateContent;->getButton()Lcom/facebook/share/model/ShareMessengerActionButton;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Lcom/facebook/share/internal/MessengerShareContentUtility;->addActionButton(Landroid/os/Bundle;Lcom/facebook/share/model/ShareMessengerActionButton;Z)V

    const-string v1, "PREVIEW_TYPE"

    const-string v2, "OPEN_GRAPH"

    .line 138
    invoke-static {p0, v1, v2}, Lcom/facebook/internal/Utility;->putNonEmptyString(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "OPEN_GRAPH_URL"

    .line 139
    invoke-virtual {p1}, Lcom/facebook/share/model/ShareMessengerOpenGraphMusicTemplateContent;->getUrl()Landroid/net/Uri;

    move-result-object p1

    invoke-static {p0, v1, p1}, Lcom/facebook/internal/Utility;->putUri(Landroid/os/Bundle;Ljava/lang/String;Landroid/net/Uri;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p0

    .line 140
    invoke-static {p0, v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-void
.end method

.method private static addURLActionButton(Landroid/os/Bundle;Lcom/facebook/share/model/ShareMessengerURLActionButton;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-class v0, Lcom/facebook/share/internal/MessengerShareContentUtility;

    invoke-static {v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    :cond_0
    if-eqz p2, :cond_1

    .line 171
    :try_start_0
    invoke-virtual {p1}, Lcom/facebook/share/model/ShareMessengerURLActionButton;->getUrl()Landroid/net/Uri;

    move-result-object p2

    invoke-static {p2}, Lcom/facebook/internal/Utility;->getUriString(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :cond_1
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 172
    invoke-virtual {p1}, Lcom/facebook/share/model/ShareMessengerURLActionButton;->getTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " - "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/facebook/share/model/ShareMessengerURLActionButton;->getUrl()Landroid/net/Uri;

    move-result-object v1

    invoke-static {v1}, Lcom/facebook/internal/Utility;->getUriString(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    :goto_0
    const-string v1, "TARGET_DISPLAY"

    .line 174
    invoke-static {p0, v1, p2}, Lcom/facebook/internal/Utility;->putNonEmptyString(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "ITEM_URL"

    .line 175
    invoke-virtual {p1}, Lcom/facebook/share/model/ShareMessengerURLActionButton;->getUrl()Landroid/net/Uri;

    move-result-object p1

    invoke-static {p0, p2, p1}, Lcom/facebook/internal/Utility;->putUri(Landroid/os/Bundle;Ljava/lang/String;Landroid/net/Uri;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p0

    .line 176
    invoke-static {p0, v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-void
.end method

.method private static getImageRatioString(Lcom/facebook/share/model/ShareMessengerGenericTemplateContent$ImageAspectRatio;)Ljava/lang/String;
    .locals 4

    const-class v0, Lcom/facebook/share/internal/MessengerShareContentUtility;

    invoke-static {v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    return-object v2

    :cond_0
    const-string v1, "horizontal"

    if-nez p0, :cond_1

    return-object v1

    .line 330
    :cond_1
    :try_start_0
    sget-object v3, Lcom/facebook/share/internal/MessengerShareContentUtility$1;->$SwitchMap$com$facebook$share$model$ShareMessengerGenericTemplateContent$ImageAspectRatio:[I

    invoke-virtual {p0}, Lcom/facebook/share/model/ShareMessengerGenericTemplateContent$ImageAspectRatio;->ordinal()I

    move-result p0

    aget p0, v3, p0

    const/4 v3, 0x1

    if-eq p0, v3, :cond_2

    return-object v1

    :cond_2
    const-string p0, "square"
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :catchall_0
    move-exception p0

    .line 334
    invoke-static {p0, v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-object v2
.end method

.method private static getMediaType(Lcom/facebook/share/model/ShareMessengerMediaTemplateContent$MediaType;)Ljava/lang/String;
    .locals 4

    const-class v0, Lcom/facebook/share/internal/MessengerShareContentUtility;

    invoke-static {v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    return-object v2

    :cond_0
    const-string v1, "image"

    if-nez p0, :cond_1

    return-object v1

    .line 342
    :cond_1
    :try_start_0
    sget-object v3, Lcom/facebook/share/internal/MessengerShareContentUtility$1;->$SwitchMap$com$facebook$share$model$ShareMessengerMediaTemplateContent$MediaType:[I

    invoke-virtual {p0}, Lcom/facebook/share/model/ShareMessengerMediaTemplateContent$MediaType;->ordinal()I

    move-result p0

    aget p0, v3, p0

    const/4 v3, 0x1

    if-eq p0, v3, :cond_2

    return-object v1

    :cond_2
    const-string p0, "video"
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :catchall_0
    move-exception p0

    .line 346
    invoke-static {p0, v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-object v2
.end method

.method private static getMediaUrlKey(Landroid/net/Uri;)Ljava/lang/String;
    .locals 3

    const-class v0, Lcom/facebook/share/internal/MessengerShareContentUtility;

    invoke-static {v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    return-object v2

    .line 305
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object p0

    .line 306
    invoke-static {p0}, Lcom/facebook/internal/Utility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    sget-object v1, Lcom/facebook/share/internal/MessengerShareContentUtility;->FACEBOOK_DOMAIN:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    move-result p0

    if-eqz p0, :cond_1

    const-string p0, "uri"

    goto :goto_0

    :cond_1
    const-string p0, "IMAGE"
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    return-object p0

    :catchall_0
    move-exception p0

    invoke-static {p0, v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-object v2
.end method

.method private static getShouldHideShareButton(Lcom/facebook/share/model/ShareMessengerURLActionButton;)Ljava/lang/String;
    .locals 3

    const-class v0, Lcom/facebook/share/internal/MessengerShareContentUtility;

    invoke-static {v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    return-object v2

    .line 351
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lcom/facebook/share/model/ShareMessengerURLActionButton;->getShouldHideWebviewShareButton()Z

    move-result p0

    if-eqz p0, :cond_1

    const-string v2, "hide"
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    return-object v2

    :catchall_0
    move-exception p0

    invoke-static {p0, v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-object v2
.end method

.method private static getWebviewHeightRatioString(Lcom/facebook/share/model/ShareMessengerURLActionButton$WebviewHeightRatio;)Ljava/lang/String;
    .locals 4

    const-class v0, Lcom/facebook/share/internal/MessengerShareContentUtility;

    invoke-static {v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    return-object v2

    :cond_0
    const-string v1, "full"

    if-nez p0, :cond_1

    return-object v1

    .line 316
    :cond_1
    :try_start_0
    sget-object v3, Lcom/facebook/share/internal/MessengerShareContentUtility$1;->$SwitchMap$com$facebook$share$model$ShareMessengerURLActionButton$WebviewHeightRatio:[I

    invoke-virtual {p0}, Lcom/facebook/share/model/ShareMessengerURLActionButton$WebviewHeightRatio;->ordinal()I

    move-result p0

    aget p0, v3, p0

    const/4 v3, 0x1

    if-eq p0, v3, :cond_3

    const/4 v3, 0x2

    if-eq p0, v3, :cond_2

    return-object v1

    :cond_2
    const-string p0, "tall"

    return-object p0

    :cond_3
    const-string p0, "compact"
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :catchall_0
    move-exception p0

    .line 322
    invoke-static {p0, v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-object v2
.end method

.method private static serializeActionButton(Lcom/facebook/share/model/ShareMessengerActionButton;)Lorg/json/JSONObject;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-class v0, Lcom/facebook/share/internal/MessengerShareContentUtility;

    invoke-static {v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    return-object v2

    :cond_0
    const/4 v1, 0x0

    .line 281
    :try_start_0
    invoke-static {p0, v1}, Lcom/facebook/share/internal/MessengerShareContentUtility;->serializeActionButton(Lcom/facebook/share/model/ShareMessengerActionButton;Z)Lorg/json/JSONObject;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :catchall_0
    move-exception p0

    invoke-static {p0, v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-object v2
.end method

.method private static serializeActionButton(Lcom/facebook/share/model/ShareMessengerActionButton;Z)Lorg/json/JSONObject;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-class v0, Lcom/facebook/share/internal/MessengerShareContentUtility;

    invoke-static {v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    return-object v2

    .line 286
    :cond_0
    :try_start_0
    instance-of v1, p0, Lcom/facebook/share/model/ShareMessengerURLActionButton;

    if-eqz v1, :cond_1

    .line 287
    check-cast p0, Lcom/facebook/share/model/ShareMessengerURLActionButton;

    invoke-static {p0, p1}, Lcom/facebook/share/internal/MessengerShareContentUtility;->serializeURLActionButton(Lcom/facebook/share/model/ShareMessengerURLActionButton;Z)Lorg/json/JSONObject;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :cond_1
    return-object v2

    :catchall_0
    move-exception p0

    .line 289
    invoke-static {p0, v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-object v2
.end method

.method private static serializeGenericTemplateContent(Lcom/facebook/share/model/ShareMessengerGenericTemplateContent;)Lorg/json/JSONObject;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-class v0, Lcom/facebook/share/internal/MessengerShareContentUtility;

    invoke-static {v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    return-object v2

    .line 180
    :cond_0
    :try_start_0
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 181
    invoke-virtual {p0}, Lcom/facebook/share/model/ShareMessengerGenericTemplateContent;->getGenericTemplateElement()Lcom/facebook/share/model/ShareMessengerGenericTemplateElement;

    move-result-object v3

    invoke-static {v3}, Lcom/facebook/share/internal/MessengerShareContentUtility;->serializeGenericTemplateElement(Lcom/facebook/share/model/ShareMessengerGenericTemplateElement;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v1

    .line 183
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    const-string v4, "template_type"

    const-string v5, "generic"

    .line 185
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "sharable"

    .line 186
    invoke-virtual {p0}, Lcom/facebook/share/model/ShareMessengerGenericTemplateContent;->getIsSharable()Z

    move-result v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "image_aspect_ratio"

    .line 187
    invoke-virtual {p0}, Lcom/facebook/share/model/ShareMessengerGenericTemplateContent;->getImageAspectRatio()Lcom/facebook/share/model/ShareMessengerGenericTemplateContent$ImageAspectRatio;

    move-result-object p0

    invoke-static {p0}, Lcom/facebook/share/internal/MessengerShareContentUtility;->getImageRatioString(Lcom/facebook/share/model/ShareMessengerGenericTemplateContent$ImageAspectRatio;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v3, v4, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string v3, "elements"

    .line 188
    invoke-virtual {p0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    .line 190
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "type"

    const-string v4, "template"

    .line 192
    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v3, "payload"

    .line 193
    invoke-virtual {v1, v3, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    .line 195
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "attachment"

    invoke-virtual {v1, v3, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :catchall_0
    move-exception p0

    invoke-static {p0, v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-object v2
.end method

.method private static serializeGenericTemplateElement(Lcom/facebook/share/model/ShareMessengerGenericTemplateElement;)Lorg/json/JSONObject;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-class v0, Lcom/facebook/share/internal/MessengerShareContentUtility;

    invoke-static {v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    return-object v2

    .line 230
    :cond_0
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "title"

    .line 232
    invoke-virtual {p0}, Lcom/facebook/share/model/ShareMessengerGenericTemplateElement;->getTitle()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v3, "subtitle"

    .line 233
    invoke-virtual {p0}, Lcom/facebook/share/model/ShareMessengerGenericTemplateElement;->getSubtitle()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v3, "image_url"

    .line 234
    invoke-virtual {p0}, Lcom/facebook/share/model/ShareMessengerGenericTemplateElement;->getImageUrl()Landroid/net/Uri;

    move-result-object v4

    invoke-static {v4}, Lcom/facebook/internal/Utility;->getUriString(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    .line 236
    invoke-virtual {p0}, Lcom/facebook/share/model/ShareMessengerGenericTemplateElement;->getButton()Lcom/facebook/share/model/ShareMessengerActionButton;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 237
    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    .line 238
    invoke-virtual {p0}, Lcom/facebook/share/model/ShareMessengerGenericTemplateElement;->getButton()Lcom/facebook/share/model/ShareMessengerActionButton;

    move-result-object v4

    invoke-static {v4}, Lcom/facebook/share/internal/MessengerShareContentUtility;->serializeActionButton(Lcom/facebook/share/model/ShareMessengerActionButton;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    const-string v4, "buttons"

    .line 239
    invoke-virtual {v1, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 242
    :cond_1
    invoke-virtual {p0}, Lcom/facebook/share/model/ShareMessengerGenericTemplateElement;->getDefaultAction()Lcom/facebook/share/model/ShareMessengerActionButton;

    move-result-object v3

    if-eqz v3, :cond_2

    const-string v3, "default_action"

    .line 243
    invoke-virtual {p0}, Lcom/facebook/share/model/ShareMessengerGenericTemplateElement;->getDefaultAction()Lcom/facebook/share/model/ShareMessengerActionButton;

    move-result-object p0

    const/4 v4, 0x1

    invoke-static {p0, v4}, Lcom/facebook/share/internal/MessengerShareContentUtility;->serializeActionButton(Lcom/facebook/share/model/ShareMessengerActionButton;Z)Lorg/json/JSONObject;

    move-result-object p0

    invoke-virtual {v1, v3, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_2
    return-object v1

    :catchall_0
    move-exception p0

    .line 246
    invoke-static {p0, v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-object v2
.end method

.method private static serializeMediaTemplateContent(Lcom/facebook/share/model/ShareMessengerMediaTemplateContent;)Lorg/json/JSONObject;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-class v0, Lcom/facebook/share/internal/MessengerShareContentUtility;

    invoke-static {v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    return-object v2

    .line 215
    :cond_0
    :try_start_0
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    invoke-static {p0}, Lcom/facebook/share/internal/MessengerShareContentUtility;->serializeMediaTemplateElement(Lcom/facebook/share/model/ShareMessengerMediaTemplateContent;)Lorg/json/JSONObject;

    move-result-object p0

    invoke-virtual {v1, p0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object p0

    .line 217
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "template_type"

    const-string v4, "media"

    .line 218
    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v3, "elements"

    invoke-virtual {v1, v3, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    .line 220
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "type"

    const-string v4, "template"

    .line 222
    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v3, "payload"

    .line 223
    invoke-virtual {v1, v3, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    .line 225
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "attachment"

    invoke-virtual {v1, v3, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :catchall_0
    move-exception p0

    invoke-static {p0, v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-object v2
.end method

.method private static serializeMediaTemplateElement(Lcom/facebook/share/model/ShareMessengerMediaTemplateContent;)Lorg/json/JSONObject;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-class v0, Lcom/facebook/share/internal/MessengerShareContentUtility;

    invoke-static {v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    return-object v2

    .line 264
    :cond_0
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "attachment_id"

    .line 266
    invoke-virtual {p0}, Lcom/facebook/share/model/ShareMessengerMediaTemplateContent;->getAttachmentId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v3, "url"

    .line 267
    invoke-virtual {p0}, Lcom/facebook/share/model/ShareMessengerMediaTemplateContent;->getMediaUrl()Landroid/net/Uri;

    move-result-object v4

    invoke-static {v4}, Lcom/facebook/internal/Utility;->getUriString(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v3, "media_type"

    .line 268
    invoke-virtual {p0}, Lcom/facebook/share/model/ShareMessengerMediaTemplateContent;->getMediaType()Lcom/facebook/share/model/ShareMessengerMediaTemplateContent$MediaType;

    move-result-object v4

    invoke-static {v4}, Lcom/facebook/share/internal/MessengerShareContentUtility;->getMediaType(Lcom/facebook/share/model/ShareMessengerMediaTemplateContent$MediaType;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    .line 270
    invoke-virtual {p0}, Lcom/facebook/share/model/ShareMessengerMediaTemplateContent;->getButton()Lcom/facebook/share/model/ShareMessengerActionButton;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 271
    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    .line 272
    invoke-virtual {p0}, Lcom/facebook/share/model/ShareMessengerMediaTemplateContent;->getButton()Lcom/facebook/share/model/ShareMessengerActionButton;

    move-result-object p0

    invoke-static {p0}, Lcom/facebook/share/internal/MessengerShareContentUtility;->serializeActionButton(Lcom/facebook/share/model/ShareMessengerActionButton;)Lorg/json/JSONObject;

    move-result-object p0

    invoke-virtual {v3, p0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    const-string p0, "buttons"

    .line 273
    invoke-virtual {v1, p0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    return-object v1

    :catchall_0
    move-exception p0

    .line 276
    invoke-static {p0, v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-object v2
.end method

.method private static serializeOpenGraphMusicTemplateContent(Lcom/facebook/share/model/ShareMessengerOpenGraphMusicTemplateContent;)Lorg/json/JSONObject;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-class v0, Lcom/facebook/share/internal/MessengerShareContentUtility;

    invoke-static {v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    return-object v2

    .line 200
    :cond_0
    :try_start_0
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    invoke-static {p0}, Lcom/facebook/share/internal/MessengerShareContentUtility;->serializeOpenGraphMusicTemplateElement(Lcom/facebook/share/model/ShareMessengerOpenGraphMusicTemplateContent;)Lorg/json/JSONObject;

    move-result-object p0

    invoke-virtual {v1, p0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object p0

    .line 202
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "template_type"

    const-string v4, "open_graph"

    .line 203
    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v3, "elements"

    invoke-virtual {v1, v3, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    .line 205
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "type"

    const-string v4, "template"

    .line 207
    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v3, "payload"

    .line 208
    invoke-virtual {v1, v3, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    .line 210
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "attachment"

    invoke-virtual {v1, v3, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :catchall_0
    move-exception p0

    invoke-static {p0, v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-object v2
.end method

.method private static serializeOpenGraphMusicTemplateElement(Lcom/facebook/share/model/ShareMessengerOpenGraphMusicTemplateContent;)Lorg/json/JSONObject;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-class v0, Lcom/facebook/share/internal/MessengerShareContentUtility;

    invoke-static {v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    return-object v2

    .line 251
    :cond_0
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "url"

    invoke-virtual {p0}, Lcom/facebook/share/model/ShareMessengerOpenGraphMusicTemplateContent;->getUrl()Landroid/net/Uri;

    move-result-object v4

    invoke-static {v4}, Lcom/facebook/internal/Utility;->getUriString(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    .line 253
    invoke-virtual {p0}, Lcom/facebook/share/model/ShareMessengerOpenGraphMusicTemplateContent;->getButton()Lcom/facebook/share/model/ShareMessengerActionButton;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 254
    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    .line 255
    invoke-virtual {p0}, Lcom/facebook/share/model/ShareMessengerOpenGraphMusicTemplateContent;->getButton()Lcom/facebook/share/model/ShareMessengerActionButton;

    move-result-object p0

    invoke-static {p0}, Lcom/facebook/share/internal/MessengerShareContentUtility;->serializeActionButton(Lcom/facebook/share/model/ShareMessengerActionButton;)Lorg/json/JSONObject;

    move-result-object p0

    invoke-virtual {v3, p0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    const-string p0, "buttons"

    .line 256
    invoke-virtual {v1, p0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    return-object v1

    :catchall_0
    move-exception p0

    .line 259
    invoke-static {p0, v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-object v2
.end method

.method private static serializeURLActionButton(Lcom/facebook/share/model/ShareMessengerURLActionButton;Z)Lorg/json/JSONObject;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-class v0, Lcom/facebook/share/internal/MessengerShareContentUtility;

    invoke-static {v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    return-object v2

    .line 294
    :cond_0
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "type"

    const-string v4, "web_url"

    .line 295
    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v3, "title"

    if-eqz p1, :cond_1

    move-object p1, v2

    goto :goto_0

    .line 296
    :cond_1
    invoke-virtual {p0}, Lcom/facebook/share/model/ShareMessengerURLActionButton;->getTitle()Ljava/lang/String;

    move-result-object p1

    :goto_0
    invoke-virtual {v1, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v1, "url"

    .line 297
    invoke-virtual {p0}, Lcom/facebook/share/model/ShareMessengerURLActionButton;->getUrl()Landroid/net/Uri;

    move-result-object v3

    invoke-static {v3}, Lcom/facebook/internal/Utility;->getUriString(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v1, "webview_height_ratio"

    .line 298
    invoke-virtual {p0}, Lcom/facebook/share/model/ShareMessengerURLActionButton;->getWebviewHeightRatio()Lcom/facebook/share/model/ShareMessengerURLActionButton$WebviewHeightRatio;

    move-result-object v3

    invoke-static {v3}, Lcom/facebook/share/internal/MessengerShareContentUtility;->getWebviewHeightRatioString(Lcom/facebook/share/model/ShareMessengerURLActionButton$WebviewHeightRatio;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v1, "messenger_extensions"

    .line 299
    invoke-virtual {p0}, Lcom/facebook/share/model/ShareMessengerURLActionButton;->getIsMessengerExtensionURL()Z

    move-result v3

    invoke-virtual {p1, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p1

    const-string v1, "fallback_url"

    .line 300
    invoke-virtual {p0}, Lcom/facebook/share/model/ShareMessengerURLActionButton;->getFallbackUrl()Landroid/net/Uri;

    move-result-object v3

    invoke-static {v3}, Lcom/facebook/internal/Utility;->getUriString(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v1, "webview_share_button"

    .line 301
    invoke-static {p0}, Lcom/facebook/share/internal/MessengerShareContentUtility;->getShouldHideShareButton(Lcom/facebook/share/model/ShareMessengerURLActionButton;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :catchall_0
    move-exception p0

    .line 294
    invoke-static {p0, v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-object v2
.end method
