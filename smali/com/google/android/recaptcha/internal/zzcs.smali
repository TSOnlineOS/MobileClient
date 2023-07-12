.class public final Lcom/google/android/recaptcha/internal/zzcs;
.super Landroid/webkit/WebViewClient;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"


# instance fields
.field final synthetic zza:Lcom/google/android/recaptcha/internal/zzda;


# direct methods
.method constructor <init>(Lcom/google/android/recaptcha/internal/zzda;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/recaptcha/internal/zzcs;->zza:Lcom/google/android/recaptcha/internal/zzda;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public final onLoadResource(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    return-void
.end method

.method public final onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 6

    .line 1
    sget-object p1, Lcom/google/android/recaptcha/internal/zzai;->zza:Lcom/google/android/recaptcha/internal/zzai;

    new-instance p1, Lcom/google/android/recaptcha/internal/zzaf;

    .line 2
    sget-object v1, Lcom/google/android/recaptcha/internal/zzkw;->zzc:Lcom/google/android/recaptcha/internal/zzkw;

    iget-object p2, p0, Lcom/google/android/recaptcha/internal/zzcs;->zza:Lcom/google/android/recaptcha/internal/zzda;

    invoke-static {p2}, Lcom/google/android/recaptcha/internal/zzda;->zzh(Lcom/google/android/recaptcha/internal/zzda;)Ljava/lang/String;

    move-result-object v2

    iget-object p2, p0, Lcom/google/android/recaptcha/internal/zzcs;->zza:Lcom/google/android/recaptcha/internal/zzda;

    invoke-static {p2}, Lcom/google/android/recaptcha/internal/zzda;->zzi(Lcom/google/android/recaptcha/internal/zzda;)Ljava/lang/String;

    move-result-object v3

    iget-object p2, p0, Lcom/google/android/recaptcha/internal/zzcs;->zza:Lcom/google/android/recaptcha/internal/zzda;

    invoke-static {p2}, Lcom/google/android/recaptcha/internal/zzda;->zzi(Lcom/google/android/recaptcha/internal/zzda;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    move-object v0, p1

    invoke-direct/range {v0 .. v5}, Lcom/google/android/recaptcha/internal/zzaf;-><init>(Lcom/google/android/recaptcha/internal/zzkw;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object p2, p0, Lcom/google/android/recaptcha/internal/zzcs;->zza:Lcom/google/android/recaptcha/internal/zzda;

    .line 3
    invoke-static {p2}, Lcom/google/android/recaptcha/internal/zzda;->zza(Lcom/google/android/recaptcha/internal/zzda;)Landroid/content/Context;

    move-result-object p2

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzcs;->zza:Lcom/google/android/recaptcha/internal/zzda;

    .line 4
    invoke-static {v0}, Lcom/google/android/recaptcha/internal/zzda;->zzc(Lcom/google/android/recaptcha/internal/zzda;)Lcom/google/android/recaptcha/internal/zzr;

    move-result-object v0

    .line 1
    invoke-static {p1, p2, v0}, Lcom/google/android/recaptcha/internal/zzai;->zzc(Lcom/google/android/recaptcha/internal/zzaf;Landroid/content/Context;Lcom/google/android/recaptcha/internal/zzr;)V

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzcs;->zza:Lcom/google/android/recaptcha/internal/zzda;

    invoke-static {p1}, Lcom/google/android/recaptcha/internal/zzda;->zze(Lcom/google/android/recaptcha/internal/zzda;)Lcom/google/android/recaptcha/internal/zzdk;

    move-result-object p1

    sget-object p2, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    .line 5
    invoke-virtual {p1, p2}, Lcom/google/android/recaptcha/internal/zzdk;->zza(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide p1

    .line 6
    sget-object v0, Lcom/google/android/recaptcha/internal/zzj;->zza:Lcom/google/android/recaptcha/internal/zzj;

    sget-object v0, Lcom/google/android/recaptcha/internal/zzl;->zzl:Lcom/google/android/recaptcha/internal/zzl;

    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzl;->zza()I

    move-result v0

    invoke-static {v0, p1, p2}, Lcom/google/android/recaptcha/internal/zzj;->zza(IJ)V

    return-void
.end method

.method public final onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lkotlin/Deprecated;
        message = "Use onReceivedError(WebView,request,error) instead"
    .end annotation

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    .line 2
    new-instance p1, Lcom/google/android/recaptcha/internal/zzh;

    sget-object p3, Lcom/google/android/recaptcha/internal/zzf;->zze:Lcom/google/android/recaptcha/internal/zzf;

    iget-object p4, p0, Lcom/google/android/recaptcha/internal/zzcs;->zza:Lcom/google/android/recaptcha/internal/zzda;

    invoke-static {p4}, Lcom/google/android/recaptcha/internal/zzda;->zzk(Lcom/google/android/recaptcha/internal/zzda;)Ljava/util/Map;

    move-result-object p4

    .line 3
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-interface {p4, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/google/android/recaptcha/internal/zzd;

    if-nez p2, :cond_0

    sget-object p2, Lcom/google/android/recaptcha/internal/zzd;->zzb:Lcom/google/android/recaptcha/internal/zzd;

    .line 4
    :cond_0
    invoke-direct {p1, p3, p2}, Lcom/google/android/recaptcha/internal/zzh;-><init>(Lcom/google/android/recaptcha/internal/zzf;Lcom/google/android/recaptcha/internal/zzd;)V

    iget-object p2, p0, Lcom/google/android/recaptcha/internal/zzcs;->zza:Lcom/google/android/recaptcha/internal/zzda;

    invoke-virtual {p2}, Lcom/google/android/recaptcha/internal/zzda;->zzm()Lkotlinx/coroutines/CompletableDeferred;

    move-result-object p2

    .line 5
    invoke-virtual {p2}, Ljava/lang/Object;->hashCode()I

    .line 6
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzh;->getMessage()Ljava/lang/String;

    iget-object p2, p0, Lcom/google/android/recaptcha/internal/zzcs;->zza:Lcom/google/android/recaptcha/internal/zzda;

    invoke-virtual {p2}, Lcom/google/android/recaptcha/internal/zzda;->zzm()Lkotlinx/coroutines/CompletableDeferred;

    move-result-object p2

    .line 7
    invoke-interface {p2, p1}, Lkotlinx/coroutines/CompletableDeferred;->completeExceptionally(Ljava/lang/Throwable;)Z

    return-void
.end method

.method public final shouldInterceptRequest(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
    .locals 2
    .annotation runtime Lkotlin/Deprecated;
        message = "Use shouldInterceptRequest(WebView,WebResourceRequest) instead"
    .end annotation

    .line 1
    sget-object v0, Lcom/google/android/recaptcha/internal/zzdb;->zza:Lcom/google/android/recaptcha/internal/zzdb;

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/recaptcha/internal/zzdb;->zza(Landroid/net/Uri;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 3
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    .line 4
    new-instance p2, Lcom/google/android/recaptcha/internal/zzh;

    sget-object v0, Lcom/google/android/recaptcha/internal/zzf;->zzc:Lcom/google/android/recaptcha/internal/zzf;

    sget-object v1, Lcom/google/android/recaptcha/internal/zzd;->zzu:Lcom/google/android/recaptcha/internal/zzd;

    .line 5
    invoke-direct {p2, v0, v1}, Lcom/google/android/recaptcha/internal/zzh;-><init>(Lcom/google/android/recaptcha/internal/zzf;Lcom/google/android/recaptcha/internal/zzd;)V

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzcs;->zza:Lcom/google/android/recaptcha/internal/zzda;

    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzda;->zzm()Lkotlinx/coroutines/CompletableDeferred;

    move-result-object v0

    .line 6
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 7
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzcs;->zza:Lcom/google/android/recaptcha/internal/zzda;

    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzda;->zzm()Lkotlinx/coroutines/CompletableDeferred;

    move-result-object p1

    .line 8
    invoke-interface {p1, p2}, Lkotlinx/coroutines/CompletableDeferred;->completeExceptionally(Ljava/lang/Throwable;)Z

    .line 9
    new-instance p1, Landroid/webkit/WebResourceResponse;

    new-instance p2, Ljava/io/ByteArrayInputStream;

    const/4 v0, 0x0

    new-array v0, v0, [B

    .line 10
    invoke-direct {p2, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    const-string v0, "text/plain"

    const-string v1, "UTF-8"

    .line 9
    invoke-direct {p1, v0, v1, p2}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V

    return-object p1

    .line 2
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldInterceptRequest(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;

    move-result-object p1

    return-object p1
.end method
