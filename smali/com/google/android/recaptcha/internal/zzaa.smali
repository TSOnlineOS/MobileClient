.class public final Lcom/google/android/recaptcha/internal/zzaa;
.super Ljava/lang/Object;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"

# interfaces
.implements Lcom/google/android/recaptcha/RecaptchaClient;
.implements Lcom/google/android/recaptcha/RecaptchaTasksClient;


# static fields
.field public static final zza:Lcom/google/android/recaptcha/internal/zzw;

.field private static zzb:Lcom/google/android/recaptcha/internal/zzaa;

.field private static final zzc:Ljava/lang/String;

.field private static zzd:Ljava/lang/String;

.field private static final zze:Lkotlinx/coroutines/sync/Mutex;


# instance fields
.field private final zzf:Lcom/google/android/recaptcha/internal/zzda;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/google/android/recaptcha/internal/zzw;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/android/recaptcha/internal/zzw;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzaa;->zza:Lcom/google/android/recaptcha/internal/zzw;

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/recaptcha/internal/zzaa;->zzc:Ljava/lang/String;

    const/4 v0, 0x0

    const/4 v2, 0x1

    .line 2
    invoke-static {v0, v2, v1}, Lkotlinx/coroutines/sync/MutexKt;->Mutex$default(ZILjava/lang/Object;)Lkotlinx/coroutines/sync/Mutex;

    move-result-object v0

    sput-object v0, Lcom/google/android/recaptcha/internal/zzaa;->zze:Lkotlinx/coroutines/sync/Mutex;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/recaptcha/internal/zzda;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/recaptcha/internal/zzaa;->zzf:Lcom/google/android/recaptcha/internal/zzda;

    return-void
.end method

.method public static final synthetic zza()Lcom/google/android/recaptcha/internal/zzaa;
    .locals 1

    sget-object v0, Lcom/google/android/recaptcha/internal/zzaa;->zzb:Lcom/google/android/recaptcha/internal/zzaa;

    return-object v0
.end method

.method public static final synthetic zzc()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/google/android/recaptcha/internal/zzaa;->zzc:Ljava/lang/String;

    return-object v0
.end method

.method public static final synthetic zzd()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/google/android/recaptcha/internal/zzaa;->zzd:Ljava/lang/String;

    return-object v0
.end method

.method public static final synthetic zze()Lkotlinx/coroutines/sync/Mutex;
    .locals 1

    sget-object v0, Lcom/google/android/recaptcha/internal/zzaa;->zze:Lkotlinx/coroutines/sync/Mutex;

    return-object v0
.end method

.method public static final synthetic zzf(Lcom/google/android/recaptcha/internal/zzaa;)V
    .locals 0

    sput-object p0, Lcom/google/android/recaptcha/internal/zzaa;->zzb:Lcom/google/android/recaptcha/internal/zzaa;

    return-void
.end method

.method public static final synthetic zzg(Ljava/lang/String;)V
    .locals 0

    sput-object p0, Lcom/google/android/recaptcha/internal/zzaa;->zzd:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final execute-gIAlu-s(Lcom/google/android/recaptcha/RecaptchaAction;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/recaptcha/RecaptchaAction;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Result<",
            "Ljava/lang/String;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    instance-of v0, p2, Lcom/google/android/recaptcha/internal/zzx;

    if-eqz v0, :cond_0

    move-object v0, p2

    check-cast v0, Lcom/google/android/recaptcha/internal/zzx;

    iget v1, v0, Lcom/google/android/recaptcha/internal/zzx;->zzc:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_0

    sub-int/2addr v1, v2

    iput v1, v0, Lcom/google/android/recaptcha/internal/zzx;->zzc:I

    goto :goto_0

    .line 1
    :cond_0
    new-instance v0, Lcom/google/android/recaptcha/internal/zzx;

    invoke-direct {v0, p0, p2}, Lcom/google/android/recaptcha/internal/zzx;-><init>(Lcom/google/android/recaptcha/internal/zzaa;Lkotlin/coroutines/Continuation;)V

    .line 0
    :goto_0
    iget-object p2, v0, Lcom/google/android/recaptcha/internal/zzx;->zza:Ljava/lang/Object;

    .line 1
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    iget v2, v0, Lcom/google/android/recaptcha/internal/zzx;->zzc:I

    const/4 v3, 0x1

    if-eqz v2, :cond_2

    if-ne v2, v3, :cond_1

    invoke-static {p2}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto :goto_1

    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    invoke-static {p2}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 2
    sget-object p2, Lcom/google/android/recaptcha/internal/zzp;->zza:Lcom/google/android/recaptcha/internal/zzp;

    invoke-static {}, Lcom/google/android/recaptcha/internal/zzp;->zzb()Lkotlinx/coroutines/CoroutineScope;

    move-result-object p2

    invoke-interface {p2}, Lkotlinx/coroutines/CoroutineScope;->getCoroutineContext()Lkotlin/coroutines/CoroutineContext;

    move-result-object p2

    new-instance v2, Lcom/google/android/recaptcha/internal/zzy;

    const/4 v4, 0x0

    invoke-direct {v2, p0, p1, v4}, Lcom/google/android/recaptcha/internal/zzy;-><init>(Lcom/google/android/recaptcha/internal/zzaa;Lcom/google/android/recaptcha/RecaptchaAction;Lkotlin/coroutines/Continuation;)V

    iput v3, v0, Lcom/google/android/recaptcha/internal/zzx;->zzc:I

    invoke-static {p2, v2, v0}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_3

    return-object v1

    :cond_3
    :goto_1
    check-cast p2, Lkotlin/Result;

    invoke-virtual {p2}, Lkotlin/Result;->unbox-impl()Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final executeTask(Lcom/google/android/recaptcha/RecaptchaAction;)Lcom/google/android/gms/tasks/Task;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/recaptcha/RecaptchaAction;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/google/android/recaptcha/internal/zzp;->zza:Lcom/google/android/recaptcha/internal/zzp;

    invoke-static {}, Lcom/google/android/recaptcha/internal/zzp;->zzb()Lkotlinx/coroutines/CoroutineScope;

    move-result-object v1

    new-instance v4, Lcom/google/android/recaptcha/internal/zzz;

    const/4 v0, 0x0

    invoke-direct {v4, p0, p1, v0}, Lcom/google/android/recaptcha/internal/zzz;-><init>(Lcom/google/android/recaptcha/internal/zzaa;Lcom/google/android/recaptcha/RecaptchaAction;Lkotlin/coroutines/Continuation;)V

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v5, 0x3

    const/4 v6, 0x0

    invoke-static/range {v1 .. v6}, Lkotlinx/coroutines/BuildersKt;->async$default(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Deferred;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/recaptcha/internal/zzb;->zza(Lkotlinx/coroutines/Deferred;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public final zzb()Lcom/google/android/recaptcha/internal/zzda;
    .locals 1

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzaa;->zzf:Lcom/google/android/recaptcha/internal/zzda;

    return-object v0
.end method
