.class public Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;
.super Landroid/webkit/WebChromeClient;
.source "VideoEnabledWebChromeClient.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnPreparedListener;
.implements Landroid/media/MediaPlayer$OnCompletionListener;
.implements Landroid/media/MediaPlayer$OnErrorListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient$ToggledFullscreenCallback;
    }
.end annotation


# instance fields
.field private activityNonVideoView:Landroid/view/View;

.field private activityVideoView:Landroid/view/ViewGroup;

.field private isVideoFullscreen:Z

.field private loadingView:Landroid/view/View;

.field private toggledFullscreenCallback:Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient$ToggledFullscreenCallback;

.field private videoViewCallback:Landroid/webkit/WebChromeClient$CustomViewCallback;

.field private videoViewContainer:Landroid/widget/FrameLayout;

.field private webView:Lcom/onevcat/uniwebview/VideoEnabledWebView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 51
    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/view/View;Landroid/view/ViewGroup;)V
    .locals 0

    .line 61
    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    .line 62
    iput-object p1, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->activityNonVideoView:Landroid/view/View;

    .line 63
    iput-object p2, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->activityVideoView:Landroid/view/ViewGroup;

    const/4 p1, 0x0

    .line 64
    iput-object p1, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->loadingView:Landroid/view/View;

    .line 65
    iput-object p1, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->webView:Lcom/onevcat/uniwebview/VideoEnabledWebView;

    const/4 p1, 0x0

    .line 66
    iput-boolean p1, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->isVideoFullscreen:Z

    return-void
.end method

.method public constructor <init>(Landroid/view/View;Landroid/view/ViewGroup;Landroid/view/View;)V
    .locals 0

    .line 77
    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    .line 78
    iput-object p1, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->activityNonVideoView:Landroid/view/View;

    .line 79
    iput-object p2, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->activityVideoView:Landroid/view/ViewGroup;

    .line 80
    iput-object p3, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->loadingView:Landroid/view/View;

    const/4 p1, 0x0

    .line 81
    iput-object p1, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->webView:Lcom/onevcat/uniwebview/VideoEnabledWebView;

    const/4 p1, 0x0

    .line 82
    iput-boolean p1, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->isVideoFullscreen:Z

    return-void
.end method

.method public constructor <init>(Landroid/view/View;Landroid/view/ViewGroup;Landroid/view/View;Lcom/onevcat/uniwebview/VideoEnabledWebView;)V
    .locals 0

    .line 95
    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    .line 96
    iput-object p1, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->activityNonVideoView:Landroid/view/View;

    .line 97
    iput-object p2, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->activityVideoView:Landroid/view/ViewGroup;

    .line 98
    iput-object p3, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->loadingView:Landroid/view/View;

    .line 99
    iput-object p4, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->webView:Lcom/onevcat/uniwebview/VideoEnabledWebView;

    const/4 p1, 0x0

    .line 100
    iput-boolean p1, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->isVideoFullscreen:Z

    return-void
.end method


# virtual methods
.method public getVideoLoadingProgressView()Landroid/view/View;
    .locals 2

    .line 230
    iget-object v0, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->loadingView:Landroid/view/View;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 232
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 233
    iget-object v0, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->loadingView:Landroid/view/View;

    return-object v0

    .line 237
    :cond_0
    invoke-super {p0}, Landroid/webkit/WebChromeClient;->getVideoLoadingProgressView()Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public isVideoFullscreen()Z
    .locals 1

    .line 109
    iget-boolean v0, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->isVideoFullscreen:Z

    return v0
.end method

.method public onBackPressed()Z
    .locals 1

    .line 270
    iget-boolean v0, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->isVideoFullscreen:Z

    if-eqz v0, :cond_0

    .line 272
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->onHideCustomView()V

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 0

    .line 253
    invoke-virtual {p0}, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->onHideCustomView()V

    return-void
.end method

.method public onError(Landroid/media/MediaPlayer;II)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public onHideCustomView()V
    .locals 3

    .line 201
    iget-boolean v0, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->isVideoFullscreen:Z

    if-eqz v0, :cond_1

    .line 204
    iget-object v0, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->activityVideoView:Landroid/view/ViewGroup;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 205
    iget-object v0, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->activityVideoView:Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->videoViewContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 206
    iget-object v0, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->activityNonVideoView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 209
    iget-object v0, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->videoViewCallback:Landroid/webkit/WebChromeClient$CustomViewCallback;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v2, ".chromium."

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 211
    iget-object v0, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->videoViewCallback:Landroid/webkit/WebChromeClient$CustomViewCallback;

    invoke-interface {v0}, Landroid/webkit/WebChromeClient$CustomViewCallback;->onCustomViewHidden()V

    .line 215
    :cond_0
    iput-boolean v1, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->isVideoFullscreen:Z

    const/4 v0, 0x0

    .line 216
    iput-object v0, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->videoViewContainer:Landroid/widget/FrameLayout;

    .line 217
    iput-object v0, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->videoViewCallback:Landroid/webkit/WebChromeClient$CustomViewCallback;

    .line 220
    iget-object v0, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->toggledFullscreenCallback:Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient$ToggledFullscreenCallback;

    if-eqz v0, :cond_1

    .line 222
    invoke-interface {v0, v1}, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient$ToggledFullscreenCallback;->toggledFullscreen(Z)V

    :cond_1
    return-void
.end method

.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 1

    .line 244
    iget-object p1, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->loadingView:Landroid/view/View;

    if-eqz p1, :cond_0

    const/16 v0, 0x8

    .line 246
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method public onShowCustomView(Landroid/view/View;ILandroid/webkit/WebChromeClient$CustomViewCallback;)V
    .locals 0

    .line 192
    invoke-virtual {p0, p1, p3}, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->onShowCustomView(Landroid/view/View;Landroid/webkit/WebChromeClient$CustomViewCallback;)V

    return-void
.end method

.method public onShowCustomView(Landroid/view/View;Landroid/webkit/WebChromeClient$CustomViewCallback;)V
    .locals 4

    .line 125
    instance-of v0, p1, Landroid/widget/FrameLayout;

    if-eqz v0, :cond_2

    .line 128
    check-cast p1, Landroid/widget/FrameLayout;

    .line 129
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getFocusedChild()Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x1

    .line 132
    iput-boolean v1, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->isVideoFullscreen:Z

    .line 133
    iput-object p1, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->videoViewContainer:Landroid/widget/FrameLayout;

    .line 134
    iput-object p2, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->videoViewCallback:Landroid/webkit/WebChromeClient$CustomViewCallback;

    .line 137
    iget-object p1, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->activityNonVideoView:Landroid/view/View;

    const/4 p2, 0x4

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 138
    iget-object p1, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->activityVideoView:Landroid/view/ViewGroup;

    iget-object p2, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->videoViewContainer:Landroid/widget/FrameLayout;

    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    const/4 v3, -0x1

    invoke-direct {v2, v3, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p1, p2, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 139
    iget-object p1, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->activityVideoView:Landroid/view/ViewGroup;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 141
    instance-of p1, v0, Landroid/widget/VideoView;

    if-eqz p1, :cond_0

    .line 144
    check-cast v0, Landroid/widget/VideoView;

    .line 147
    invoke-virtual {v0, p0}, Landroid/widget/VideoView;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 148
    invoke-virtual {v0, p0}, Landroid/widget/VideoView;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 149
    invoke-virtual {v0, p0}, Landroid/widget/VideoView;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    goto/16 :goto_0

    .line 160
    :cond_0
    iget-object p1, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->webView:Lcom/onevcat/uniwebview/VideoEnabledWebView;

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/onevcat/uniwebview/VideoEnabledWebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object p1

    invoke-virtual {p1}, Landroid/webkit/WebSettings;->getJavaScriptEnabled()Z

    move-result p1

    if-eqz p1, :cond_1

    instance-of p1, v0, Landroid/view/SurfaceView;

    if-eqz p1, :cond_1

    .line 165
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "javascript:var _ytrp_html5_video_last;"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "var _ytrp_html5_video = document.getElementsByTagName(\'video\')[0];"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 166
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "if (_ytrp_html5_video != undefined && _ytrp_html5_video != _ytrp_html5_video_last) {"

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 168
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "_ytrp_html5_video_last = _ytrp_html5_video;"

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 169
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "function _ytrp_html5_video_ended() {"

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 171
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "window.location.href = \'uniwebviewinternal://__uniwebview_internal_video_end\';"

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 173
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "}"

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 174
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "_ytrp_html5_video.addEventListener(\'ended\', _ytrp_html5_video_ended);"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 176
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 177
    iget-object p2, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->webView:Lcom/onevcat/uniwebview/VideoEnabledWebView;

    invoke-virtual {p2, p1}, Lcom/onevcat/uniwebview/VideoEnabledWebView;->loadUrl(Ljava/lang/String;)V

    .line 182
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->toggledFullscreenCallback:Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient$ToggledFullscreenCallback;

    if-eqz p1, :cond_2

    .line 184
    invoke-interface {p1, v1}, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient$ToggledFullscreenCallback;->toggledFullscreen(Z)V

    :cond_2
    return-void
.end method

.method public setOnToggledFullscreen(Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient$ToggledFullscreenCallback;)V
    .locals 0

    .line 119
    iput-object p1, p0, Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient;->toggledFullscreenCallback:Lcom/onevcat/uniwebview/VideoEnabledWebChromeClient$ToggledFullscreenCallback;

    return-void
.end method
