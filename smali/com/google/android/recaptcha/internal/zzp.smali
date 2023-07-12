.class public final Lcom/google/android/recaptcha/internal/zzp;
.super Ljava/lang/Object;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"


# static fields
.field public static final zza:Lcom/google/android/recaptcha/internal/zzp;

.field private static final zzb:Lkotlinx/coroutines/CoroutineScope;

.field private static final zzc:Lkotlinx/coroutines/CoroutineScope;

.field private static final zzd:Lkotlinx/coroutines/CoroutineScope;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    new-instance v0, Lcom/google/android/recaptcha/internal/zzp;

    invoke-direct {v0}, Lcom/google/android/recaptcha/internal/zzp;-><init>()V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzp;->zza:Lcom/google/android/recaptcha/internal/zzp;

    invoke-static {}, Lkotlinx/coroutines/CoroutineScopeKt;->MainScope()Lkotlinx/coroutines/CoroutineScope;

    move-result-object v0

    sput-object v0, Lcom/google/android/recaptcha/internal/zzp;->zzb:Lkotlinx/coroutines/CoroutineScope;

    const-string v0, "reCaptcha"

    .line 2
    invoke-static {v0}, Lkotlinx/coroutines/ThreadPoolDispatcherKt;->newSingleThreadContext(Ljava/lang/String;)Lkotlinx/coroutines/ExecutorCoroutineDispatcher;

    move-result-object v0

    invoke-static {v0}, Lkotlinx/coroutines/CoroutineScopeKt;->CoroutineScope(Lkotlin/coroutines/CoroutineContext;)Lkotlinx/coroutines/CoroutineScope;

    move-result-object v0

    .line 3
    new-instance v4, Lcom/google/android/recaptcha/internal/zzo;

    const/4 v1, 0x0

    invoke-direct {v4, v1}, Lcom/google/android/recaptcha/internal/zzo;-><init>(Lkotlin/coroutines/Continuation;)V

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v5, 0x3

    const/4 v6, 0x0

    move-object v1, v0

    invoke-static/range {v1 .. v6}, Lkotlinx/coroutines/BuildersKt;->launch$default(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    sput-object v0, Lcom/google/android/recaptcha/internal/zzp;->zzc:Lkotlinx/coroutines/CoroutineScope;

    .line 4
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getIO()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v0

    invoke-static {v0}, Lkotlinx/coroutines/CoroutineScopeKt;->CoroutineScope(Lkotlin/coroutines/CoroutineContext;)Lkotlinx/coroutines/CoroutineScope;

    move-result-object v0

    sput-object v0, Lcom/google/android/recaptcha/internal/zzp;->zzd:Lkotlinx/coroutines/CoroutineScope;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final zza()Lkotlinx/coroutines/CoroutineScope;
    .locals 1

    sget-object v0, Lcom/google/android/recaptcha/internal/zzp;->zzd:Lkotlinx/coroutines/CoroutineScope;

    return-object v0
.end method

.method public static final zzb()Lkotlinx/coroutines/CoroutineScope;
    .locals 1

    sget-object v0, Lcom/google/android/recaptcha/internal/zzp;->zzb:Lkotlinx/coroutines/CoroutineScope;

    return-object v0
.end method

.method public static final zzc()Lkotlinx/coroutines/CoroutineScope;
    .locals 1

    sget-object v0, Lcom/google/android/recaptcha/internal/zzp;->zzc:Lkotlinx/coroutines/CoroutineScope;

    return-object v0
.end method
