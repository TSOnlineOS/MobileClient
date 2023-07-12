.class final Lcom/google/android/recaptcha/internal/zzcw;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field zza:Ljava/lang/Object;

.field zzb:Ljava/lang/Object;

.field zzc:Ljava/lang/Object;

.field zzd:I

.field final synthetic zze:Lcom/google/android/recaptcha/RecaptchaAction;

.field final synthetic zzf:Lcom/google/android/recaptcha/internal/zzda;

.field final synthetic zzg:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/android/recaptcha/RecaptchaAction;Lcom/google/android/recaptcha/internal/zzda;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/recaptcha/internal/zzcw;->zze:Lcom/google/android/recaptcha/RecaptchaAction;

    iput-object p2, p0, Lcom/google/android/recaptcha/internal/zzcw;->zzf:Lcom/google/android/recaptcha/internal/zzda;

    iput-object p3, p0, Lcom/google/android/recaptcha/internal/zzcw;->zzg:Ljava/lang/String;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p4}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 3

    new-instance p1, Lcom/google/android/recaptcha/internal/zzcw;

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzcw;->zze:Lcom/google/android/recaptcha/RecaptchaAction;

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzcw;->zzf:Lcom/google/android/recaptcha/internal/zzda;

    iget-object v2, p0, Lcom/google/android/recaptcha/internal/zzcw;->zzg:Ljava/lang/String;

    invoke-direct {p1, v0, v1, v2, p2}, Lcom/google/android/recaptcha/internal/zzcw;-><init>(Lcom/google/android/recaptcha/RecaptchaAction;Lcom/google/android/recaptcha/internal/zzda;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    return-object p1
.end method

.method public final bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/google/android/recaptcha/internal/zzcw;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p1

    sget-object p2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    check-cast p1, Lcom/google/android/recaptcha/internal/zzcw;

    invoke-virtual {p1, p2}, Lcom/google/android/recaptcha/internal/zzcw;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzcw;->zzd:I

    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    if-eqz v1, :cond_0

    goto/16 :goto_0

    :cond_0
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzcw;->zzf:Lcom/google/android/recaptcha/internal/zzda;

    iget-object v5, p0, Lcom/google/android/recaptcha/internal/zzcw;->zzg:Ljava/lang/String;

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzcw;->zze:Lcom/google/android/recaptcha/RecaptchaAction;

    iput-object p1, p0, Lcom/google/android/recaptcha/internal/zzcw;->zza:Ljava/lang/Object;

    iput-object v5, p0, Lcom/google/android/recaptcha/internal/zzcw;->zzb:Ljava/lang/Object;

    iput-object v1, p0, Lcom/google/android/recaptcha/internal/zzcw;->zzc:Ljava/lang/Object;

    const/4 v2, 0x1

    iput v2, p0, Lcom/google/android/recaptcha/internal/zzcw;->zzd:I

    .line 2
    new-instance v7, Lkotlinx/coroutines/CancellableContinuationImpl;

    invoke-static {p0}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->intercepted(Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v3

    invoke-direct {v7, v3, v2}, Lkotlinx/coroutines/CancellableContinuationImpl;-><init>(Lkotlin/coroutines/Continuation;I)V

    .line 3
    invoke-virtual {v7}, Lkotlinx/coroutines/CancellableContinuationImpl;->initCancellability()V

    invoke-static {p1}, Lcom/google/android/recaptcha/internal/zzda;->zzl(Lcom/google/android/recaptcha/internal/zzda;)Ljava/util/Map;

    move-result-object v2

    .line 4
    invoke-interface {v2, v5, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzmb;->zzf()Lcom/google/android/recaptcha/internal/zzma;

    move-result-object v2

    .line 6
    invoke-virtual {v2, v5}, Lcom/google/android/recaptcha/internal/zzma;->zze(Ljava/lang/String;)Lcom/google/android/recaptcha/internal/zzma;

    .line 7
    invoke-virtual {v1}, Lcom/google/android/recaptcha/RecaptchaAction;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/google/android/recaptcha/internal/zzma;->zzd(Ljava/lang/String;)Lcom/google/android/recaptcha/internal/zzma;

    .line 8
    invoke-virtual {v2}, Lcom/google/android/recaptcha/internal/zzgi;->zzh()Lcom/google/android/recaptcha/internal/zzgo;

    move-result-object v1

    check-cast v1, Lcom/google/android/recaptcha/internal/zzmb;

    .line 9
    invoke-virtual {v1}, Lcom/google/android/recaptcha/internal/zzei;->zzd()[B

    move-result-object v1

    .line 10
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzeb;->zzh()Lcom/google/android/recaptcha/internal/zzeb;

    move-result-object v2

    const/4 v3, 0x0

    .line 11
    array-length v4, v1

    .line 10
    invoke-virtual {v2, v1, v3, v4}, Lcom/google/android/recaptcha/internal/zzeb;->zzi([BII)Ljava/lang/String;

    move-result-object v8

    .line 12
    sget-object v1, Lcom/google/android/recaptcha/internal/zzai;->zza:Lcom/google/android/recaptcha/internal/zzai;

    new-instance v9, Lcom/google/android/recaptcha/internal/zzaf;

    .line 13
    sget-object v2, Lcom/google/android/recaptcha/internal/zzkw;->zzf:Lcom/google/android/recaptcha/internal/zzkw;

    invoke-static {p1}, Lcom/google/android/recaptcha/internal/zzda;->zzh(Lcom/google/android/recaptcha/internal/zzda;)Ljava/lang/String;

    move-result-object v3

    invoke-static {p1}, Lcom/google/android/recaptcha/internal/zzda;->zzi(Lcom/google/android/recaptcha/internal/zzda;)Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x0

    move-object v1, v9

    invoke-direct/range {v1 .. v6}, Lcom/google/android/recaptcha/internal/zzaf;-><init>(Lcom/google/android/recaptcha/internal/zzkw;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    invoke-static {p1}, Lcom/google/android/recaptcha/internal/zzda;->zza(Lcom/google/android/recaptcha/internal/zzda;)Landroid/content/Context;

    move-result-object v1

    .line 15
    invoke-static {p1}, Lcom/google/android/recaptcha/internal/zzda;->zzc(Lcom/google/android/recaptcha/internal/zzda;)Lcom/google/android/recaptcha/internal/zzr;

    move-result-object v2

    .line 12
    invoke-static {v9, v1, v2}, Lcom/google/android/recaptcha/internal/zzai;->zzc(Lcom/google/android/recaptcha/internal/zzaf;Landroid/content/Context;Lcom/google/android/recaptcha/internal/zzr;)V

    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzda;->zzb()Landroid/webkit/WebView;

    move-result-object p1

    new-instance v1, Ljava/lang/StringBuilder;

    .line 16
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "recaptcha.m.Main.execute(\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    .line 17
    invoke-virtual {p1, v1, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 18
    invoke-virtual {v7}, Lkotlinx/coroutines/CancellableContinuationImpl;->getResult()Ljava/lang/Object;

    move-result-object p1

    .line 19
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    if-ne p1, v1, :cond_1

    invoke-static {p0}, Lkotlin/coroutines/jvm/internal/DebugProbesKt;->probeCoroutineSuspended(Lkotlin/coroutines/Continuation;)V

    :cond_1
    if-ne p1, v0, :cond_2

    return-object v0

    :cond_2
    :goto_0
    return-object p1
.end method
