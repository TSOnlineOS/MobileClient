.class final Lcom/google/android/recaptcha/internal/zzaz;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field zza:Ljava/lang/Object;

.field zzb:I

.field final synthetic zzc:Lcom/google/android/recaptcha/internal/zzba;

.field final synthetic zzd:Ljava/lang/String;

.field final synthetic zze:Lcom/google/android/recaptcha/internal/zzn;


# direct methods
.method constructor <init>(Lcom/google/android/recaptcha/internal/zzba;Ljava/lang/String;Lcom/google/android/recaptcha/internal/zzn;Lkotlin/coroutines/Continuation;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/recaptcha/internal/zzaz;->zzc:Lcom/google/android/recaptcha/internal/zzba;

    iput-object p2, p0, Lcom/google/android/recaptcha/internal/zzaz;->zzd:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/recaptcha/internal/zzaz;->zze:Lcom/google/android/recaptcha/internal/zzn;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p4}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 3

    new-instance p1, Lcom/google/android/recaptcha/internal/zzaz;

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzaz;->zzc:Lcom/google/android/recaptcha/internal/zzba;

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzaz;->zzd:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/recaptcha/internal/zzaz;->zze:Lcom/google/android/recaptcha/internal/zzn;

    invoke-direct {p1, v0, v1, v2, p2}, Lcom/google/android/recaptcha/internal/zzaz;-><init>(Lcom/google/android/recaptcha/internal/zzba;Ljava/lang/String;Lcom/google/android/recaptcha/internal/zzn;Lkotlin/coroutines/Continuation;)V

    return-object p1
.end method

.method public final bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/google/android/recaptcha/internal/zzaz;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p1

    sget-object p2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    check-cast p1, Lcom/google/android/recaptcha/internal/zzaz;

    invoke-virtual {p1, p2}, Lcom/google/android/recaptcha/internal/zzaz;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 11

    .line 1
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    iget v1, p0, Lcom/google/android/recaptcha/internal/zzaz;->zzb:I

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    if-eq v1, v2, :cond_0

    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto :goto_0

    .line 10
    :cond_0
    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzaz;->zza:Ljava/lang/Object;

    .line 1
    :try_start_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :cond_1
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    new-instance v1, Lcom/google/android/recaptcha/internal/zzn;

    .line 2
    invoke-direct {v1}, Lcom/google/android/recaptcha/internal/zzn;-><init>()V

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzaz;->zzd:Ljava/lang/String;

    .line 3
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzeb;->zzh()Lcom/google/android/recaptcha/internal/zzeb;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/google/android/recaptcha/internal/zzeb;->zzj(Ljava/lang/CharSequence;)[B

    move-result-object p1

    .line 4
    invoke-static {p1}, Lcom/google/android/recaptcha/internal/zzmp;->zzg([B)Lcom/google/android/recaptcha/internal/zzmp;

    move-result-object p1

    .line 5
    :try_start_1
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzdk;->zzb()Lcom/google/android/recaptcha/internal/zzdk;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/recaptcha/internal/zzaz;->zzc:Lcom/google/android/recaptcha/internal/zzba;

    .line 6
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzmp;->zzi()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzmp;->zzj()Ljava/util/List;

    move-result-object p1

    invoke-static {v4, v5, p1}, Lcom/google/android/recaptcha/internal/zzba;->zzc(Lcom/google/android/recaptcha/internal/zzba;Ljava/lang/String;Ljava/util/List;)Lcom/google/android/recaptcha/internal/zzmh;

    move-result-object p1

    .line 7
    invoke-virtual {v3}, Lcom/google/android/recaptcha/internal/zzdk;->zzf()Lcom/google/android/recaptcha/internal/zzdk;

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    .line 8
    invoke-virtual {v3, v4}, Lcom/google/android/recaptcha/internal/zzdk;->zza(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v3

    .line 9
    sget-object v5, Lcom/google/android/recaptcha/internal/zzj;->zza:Lcom/google/android/recaptcha/internal/zzj;

    sget-object v5, Lcom/google/android/recaptcha/internal/zzl;->zzm:Lcom/google/android/recaptcha/internal/zzl;

    invoke-virtual {v5}, Lcom/google/android/recaptcha/internal/zzl;->zza()I

    move-result v5

    invoke-static {v5, v3, v4}, Lcom/google/android/recaptcha/internal/zzj;->zza(IJ)V

    iget-object v3, p0, Lcom/google/android/recaptcha/internal/zzaz;->zzc:Lcom/google/android/recaptcha/internal/zzba;

    .line 10
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzmh;->zzi()Ljava/util/List;

    move-result-object p1

    iget-object v4, p0, Lcom/google/android/recaptcha/internal/zzaz;->zze:Lcom/google/android/recaptcha/internal/zzn;

    iput-object v1, p0, Lcom/google/android/recaptcha/internal/zzaz;->zza:Ljava/lang/Object;

    iput v2, p0, Lcom/google/android/recaptcha/internal/zzaz;->zzb:I

    invoke-static {v3, p1, v4, v1, p0}, Lcom/google/android/recaptcha/internal/zzba;->zzd(Lcom/google/android/recaptcha/internal/zzba;Ljava/util/List;Lcom/google/android/recaptcha/internal/zzn;Lcom/google/android/recaptcha/internal/zzn;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    if-ne p1, v0, :cond_2

    return-object v0

    :catch_0
    move-exception p1

    move-object v3, p1

    .line 1
    iget-object v2, p0, Lcom/google/android/recaptcha/internal/zzaz;->zzc:Lcom/google/android/recaptcha/internal/zzba;

    iget-object v5, p0, Lcom/google/android/recaptcha/internal/zzaz;->zze:Lcom/google/android/recaptcha/internal/zzn;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/google/android/recaptcha/internal/zzaz;->zza:Ljava/lang/Object;

    const/4 p1, 0x2

    iput p1, p0, Lcom/google/android/recaptcha/internal/zzaz;->zzb:I

    move-object v6, v1

    check-cast v6, Lcom/google/android/recaptcha/internal/zzn;

    const/4 v7, 0x0

    const/16 v9, 0x10

    const/4 v10, 0x0

    const-string v4, "recaptcha.m.Main.rge"

    move-object v8, p0

    .line 11
    invoke-static/range {v2 .. v10}, Lcom/google/android/recaptcha/internal/zzba;->zzf(Lcom/google/android/recaptcha/internal/zzba;Ljava/lang/Exception;Ljava/lang/String;Lcom/google/android/recaptcha/internal/zzn;Lcom/google/android/recaptcha/internal/zzn;ILkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_2

    return-object v0

    .line 12
    :cond_2
    :goto_0
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1
.end method
