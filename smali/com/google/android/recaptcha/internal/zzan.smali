.class final Lcom/google/android/recaptcha/internal/zzan;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field final synthetic zza:Lcom/google/android/recaptcha/internal/zzkx;

.field final synthetic zzb:Lcom/google/android/recaptcha/internal/zzao;


# direct methods
.method constructor <init>(Lcom/google/android/recaptcha/internal/zzkx;Lcom/google/android/recaptcha/internal/zzao;Lkotlin/coroutines/Continuation;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/recaptcha/internal/zzan;->zza:Lcom/google/android/recaptcha/internal/zzkx;

    iput-object p2, p0, Lcom/google/android/recaptcha/internal/zzan;->zzb:Lcom/google/android/recaptcha/internal/zzao;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 2

    new-instance p1, Lcom/google/android/recaptcha/internal/zzan;

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzan;->zza:Lcom/google/android/recaptcha/internal/zzkx;

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzan;->zzb:Lcom/google/android/recaptcha/internal/zzao;

    invoke-direct {p1, v0, v1, p2}, Lcom/google/android/recaptcha/internal/zzan;-><init>(Lcom/google/android/recaptcha/internal/zzkx;Lcom/google/android/recaptcha/internal/zzao;Lkotlin/coroutines/Continuation;)V

    return-object p1
.end method

.method public final bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/google/android/recaptcha/internal/zzan;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p1

    sget-object p2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    check-cast p1, Lcom/google/android/recaptcha/internal/zzan;

    invoke-virtual {p1, p2}, Lcom/google/android/recaptcha/internal/zzan;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    .line 1
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzan;->zza:Lcom/google/android/recaptcha/internal/zzkx;

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzan;->zzb:Lcom/google/android/recaptcha/internal/zzao;

    const-class v1, Lcom/google/android/recaptcha/internal/zzaj;

    monitor-enter v1

    :try_start_0
    new-instance v2, Lcom/google/android/recaptcha/internal/zzae;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzei;->zzd()[B

    move-result-object p1

    .line 3
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzeb;->zzg()Lcom/google/android/recaptcha/internal/zzeb;

    move-result-object v3

    .line 4
    array-length v4, p1

    const/4 v5, 0x0

    .line 3
    invoke-virtual {v3, p1, v5, v4}, Lcom/google/android/recaptcha/internal/zzeb;->zzi([BII)Ljava/lang/String;

    move-result-object p1

    .line 5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-direct {v2, p1, v3, v4, v5}, Lcom/google/android/recaptcha/internal/zzae;-><init>(Ljava/lang/String;JI)V

    invoke-static {v0}, Lcom/google/android/recaptcha/internal/zzao;->zza(Lcom/google/android/recaptcha/internal/zzao;)Lcom/google/android/recaptcha/internal/zzad;

    move-result-object p1

    new-instance v3, Landroid/content/ContentValues;

    .line 6
    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    const-string v4, "ss"

    invoke-virtual {v2}, Lcom/google/android/recaptcha/internal/zzae;->zzc()Ljava/lang/String;

    move-result-object v5

    .line 7
    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "ts"

    invoke-virtual {v2}, Lcom/google/android/recaptcha/internal/zzae;->zzb()J

    move-result-wide v5

    .line 8
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v3, v4, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 9
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzad;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    const-string v2, "ce"

    const/4 v4, 0x0

    .line 10
    invoke-virtual {p1, v2, v4, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    invoke-static {v0}, Lcom/google/android/recaptcha/internal/zzao;->zza(Lcom/google/android/recaptcha/internal/zzao;)Lcom/google/android/recaptcha/internal/zzad;

    move-result-object p1

    .line 11
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzad;->zzb()I

    move-result p1

    add-int/lit16 p1, p1, -0x1f4

    if-lez p1, :cond_0

    invoke-static {v0}, Lcom/google/android/recaptcha/internal/zzao;->zza(Lcom/google/android/recaptcha/internal/zzao;)Lcom/google/android/recaptcha/internal/zzad;

    move-result-object v2

    .line 12
    invoke-virtual {v2}, Lcom/google/android/recaptcha/internal/zzad;->zzd()Ljava/util/List;

    move-result-object v2

    invoke-static {v2, p1}, Lkotlin/collections/CollectionsKt;->take(Ljava/lang/Iterable;I)Ljava/util/List;

    move-result-object p1

    invoke-static {v0}, Lcom/google/android/recaptcha/internal/zzao;->zza(Lcom/google/android/recaptcha/internal/zzao;)Lcom/google/android/recaptcha/internal/zzad;

    move-result-object v2

    .line 13
    invoke-virtual {v2, p1}, Lcom/google/android/recaptcha/internal/zzad;->zza(Ljava/util/List;)I

    :cond_0
    invoke-static {v0}, Lcom/google/android/recaptcha/internal/zzao;->zza(Lcom/google/android/recaptcha/internal/zzao;)Lcom/google/android/recaptcha/internal/zzad;

    move-result-object p1

    .line 14
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzad;->zzb()I

    move-result p1

    const/16 v2, 0x14

    if-lt p1, v2, :cond_1

    .line 15
    invoke-static {v0}, Lcom/google/android/recaptcha/internal/zzao;->zzd(Lcom/google/android/recaptcha/internal/zzao;)V

    .line 16
    :cond_1
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit v1

    throw p1
.end method
