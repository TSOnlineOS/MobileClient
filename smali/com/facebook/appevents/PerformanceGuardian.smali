.class public final Lcom/facebook/appevents/PerformanceGuardian;
.super Ljava/lang/Object;
.source "PerformanceGuardian.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/appevents/PerformanceGuardian$UseCase;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000N\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0010%\n\u0002\u0008\u0002\n\u0002\u0010#\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\t\n\u0002\u0008\u0006\u0008\u00c7\u0002\u0018\u00002\u00020\u0001:\u0001\"B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0008\u0010\u0013\u001a\u00020\u0014H\u0003J\u001a\u0010\u0015\u001a\u00020\u00102\u0006\u0010\u0016\u001a\u00020\u00062\u0008\u0010\u0017\u001a\u0004\u0018\u00010\u0018H\u0007J\u0012\u0010\u0019\u001a\u00020\u00102\u0008\u0010\u001a\u001a\u0004\u0018\u00010\u0006H\u0002J,\u0010\u001b\u001a\u00020\u00142\u0008\u0010\u0016\u001a\u0004\u0018\u00010\u00062\u0008\u0010\u0017\u001a\u0004\u0018\u00010\u00182\u0006\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\u001e\u001a\u00020\u001dH\u0007J:\u0010\u001f\u001a\u00020\u00142\u0006\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0016\u001a\u00020\u00062\u0012\u0010 \u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00040\n2\u000c\u0010!\u001a\u0008\u0012\u0004\u0012\u00020\u00060\rH\u0002R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0006X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\u0004X\u0082T\u00a2\u0006\u0002\n\u0000R\u001a\u0010\t\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00040\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u000b\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00040\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\u00060\rX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00020\u00060\rX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0010X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0012X\u0082.\u00a2\u0006\u0002\n\u0000\u00a8\u0006#"
    }
    d2 = {
        "Lcom/facebook/appevents/PerformanceGuardian;",
        "",
        "()V",
        "ACTIVITY_PROCESS_TIME_THRESHOLD",
        "",
        "BANNED_ACTIVITY_STORE",
        "",
        "CACHE_APP_VERSION",
        "MAX_EXCEED_LIMIT_COUNT",
        "activityProcessTimeMapCodeless",
        "",
        "activityProcessTimeMapSe",
        "bannedCodelessActivitySet",
        "",
        "bannedSuggestedEventActivitySet",
        "initialized",
        "",
        "sharedPreferences",
        "Landroid/content/SharedPreferences;",
        "initializeIfNotYet",
        "",
        "isBannedActivity",
        "activityName",
        "useCase",
        "Lcom/facebook/appevents/PerformanceGuardian$UseCase;",
        "isCacheValid",
        "previousVersion",
        "limitProcessTime",
        "startTime",
        "",
        "endTime",
        "updateActivityMap",
        "activityExceedLimitCountMap",
        "bannedActivitySet",
        "UseCase",
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
.field private static final ACTIVITY_PROCESS_TIME_THRESHOLD:I = 0x28

.field private static final BANNED_ACTIVITY_STORE:Ljava/lang/String; = "com.facebook.internal.BANNED_ACTIVITY"

.field private static final CACHE_APP_VERSION:Ljava/lang/String; = "app_version"

.field public static final INSTANCE:Lcom/facebook/appevents/PerformanceGuardian;

.field private static final MAX_EXCEED_LIMIT_COUNT:I = 0x3

.field private static final activityProcessTimeMapCodeless:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final activityProcessTimeMapSe:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final bannedCodelessActivitySet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final bannedSuggestedEventActivitySet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static initialized:Z

.field private static sharedPreferences:Landroid/content/SharedPreferences;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 35
    new-instance v0, Lcom/facebook/appevents/PerformanceGuardian;

    invoke-direct {v0}, Lcom/facebook/appevents/PerformanceGuardian;-><init>()V

    sput-object v0, Lcom/facebook/appevents/PerformanceGuardian;->INSTANCE:Lcom/facebook/appevents/PerformanceGuardian;

    .line 42
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    check-cast v0, Ljava/util/Set;

    sput-object v0, Lcom/facebook/appevents/PerformanceGuardian;->bannedSuggestedEventActivitySet:Ljava/util/Set;

    .line 43
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    check-cast v0, Ljava/util/Set;

    sput-object v0, Lcom/facebook/appevents/PerformanceGuardian;->bannedCodelessActivitySet:Ljava/util/Set;

    .line 44
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    check-cast v0, Ljava/util/Map;

    sput-object v0, Lcom/facebook/appevents/PerformanceGuardian;->activityProcessTimeMapCodeless:Ljava/util/Map;

    .line 45
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    check-cast v0, Ljava/util/Map;

    sput-object v0, Lcom/facebook/appevents/PerformanceGuardian;->activityProcessTimeMapSe:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static final declared-synchronized initializeIfNotYet()V
    .locals 5
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-class v0, Lcom/facebook/appevents/PerformanceGuardian;

    monitor-enter v0

    :try_start_0
    invoke-static {v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v1, :cond_0

    monitor-exit v0

    return-void

    .line 49
    :cond_0
    :try_start_1
    sget-boolean v1, Lcom/facebook/appevents/PerformanceGuardian;->initialized:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v1, :cond_1

    .line 50
    monitor-exit v0

    return-void

    .line 53
    :cond_1
    :try_start_2
    invoke-static {}, Lcom/facebook/FacebookSdk;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "com.facebook.internal.BANNED_ACTIVITY"

    const/4 v3, 0x0

    .line 54
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "FacebookSdk.getApplicati\u2026RE, Context.MODE_PRIVATE)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    sput-object v1, Lcom/facebook/appevents/PerformanceGuardian;->sharedPreferences:Landroid/content/SharedPreferences;

    if-nez v1, :cond_2

    const-string v2, "sharedPreferences"

    .line 55
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    :cond_2
    const-string v2, "app_version"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 56
    sget-object v2, Lcom/facebook/appevents/PerformanceGuardian;->INSTANCE:Lcom/facebook/appevents/PerformanceGuardian;

    invoke-direct {v2, v1}, Lcom/facebook/appevents/PerformanceGuardian;->isCacheValid(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 57
    sget-object v1, Lcom/facebook/appevents/PerformanceGuardian;->sharedPreferences:Landroid/content/SharedPreferences;

    if-nez v1, :cond_3

    const-string v2, "sharedPreferences"

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    :cond_3
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_2

    .line 59
    :cond_4
    sget-object v1, Lcom/facebook/appevents/PerformanceGuardian;->bannedCodelessActivitySet:Ljava/util/Set;

    .line 60
    sget-object v2, Lcom/facebook/appevents/PerformanceGuardian;->sharedPreferences:Landroid/content/SharedPreferences;

    if-nez v2, :cond_5

    const-string v3, "sharedPreferences"

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    :cond_5
    sget-object v3, Lcom/facebook/appevents/PerformanceGuardian$UseCase;->CODELESS:Lcom/facebook/appevents/PerformanceGuardian$UseCase;

    invoke-virtual {v3}, Lcom/facebook/appevents/PerformanceGuardian$UseCase;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/util/LinkedHashSet;

    invoke-direct {v4}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast v4, Ljava/util/Set;

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v2

    if-eqz v2, :cond_6

    check-cast v2, Ljava/util/Collection;

    goto :goto_0

    .line 61
    :cond_6
    new-instance v2, Ljava/util/LinkedHashSet;

    invoke-direct {v2}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast v2, Ljava/util/Set;

    check-cast v2, Ljava/util/Collection;

    .line 59
    :goto_0
    invoke-interface {v1, v2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 62
    sget-object v1, Lcom/facebook/appevents/PerformanceGuardian;->bannedSuggestedEventActivitySet:Ljava/util/Set;

    .line 63
    sget-object v2, Lcom/facebook/appevents/PerformanceGuardian;->sharedPreferences:Landroid/content/SharedPreferences;

    if-nez v2, :cond_7

    const-string v3, "sharedPreferences"

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    :cond_7
    sget-object v3, Lcom/facebook/appevents/PerformanceGuardian$UseCase;->SUGGESTED_EVENT:Lcom/facebook/appevents/PerformanceGuardian$UseCase;

    invoke-virtual {v3}, Lcom/facebook/appevents/PerformanceGuardian$UseCase;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/util/LinkedHashSet;

    invoke-direct {v4}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast v4, Ljava/util/Set;

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v2

    if-eqz v2, :cond_8

    check-cast v2, Ljava/util/Collection;

    goto :goto_1

    .line 64
    :cond_8
    new-instance v2, Ljava/util/LinkedHashSet;

    invoke-direct {v2}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast v2, Ljava/util/Set;

    check-cast v2, Ljava/util/Collection;

    .line 62
    :goto_1
    invoke-interface {v1, v2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    :goto_2
    const/4 v1, 0x1

    .line 66
    sput-boolean v1, Lcom/facebook/appevents/PerformanceGuardian;->initialized:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 67
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    :try_start_3
    invoke-static {v1, v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    monitor-exit v0

    return-void

    :catchall_1
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static final isBannedActivity(Ljava/lang/String;Lcom/facebook/appevents/PerformanceGuardian$UseCase;)Z
    .locals 3
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-class v0, Lcom/facebook/appevents/PerformanceGuardian;

    invoke-static {v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    return v2

    :cond_0
    :try_start_0
    const-string v1, "activityName"

    invoke-static {p0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 75
    invoke-static {}, Lcom/facebook/appevents/PerformanceGuardian;->initializeIfNotYet()V

    if-nez p1, :cond_1

    goto :goto_0

    .line 76
    :cond_1
    sget-object v1, Lcom/facebook/appevents/PerformanceGuardian$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {p1}, Lcom/facebook/appevents/PerformanceGuardian$UseCase;->ordinal()I

    move-result p1

    aget p1, v1, p1

    const/4 v1, 0x1

    if-eq p1, v1, :cond_3

    const/4 v1, 0x2

    if-eq p1, v1, :cond_2

    :goto_0
    return v2

    .line 78
    :cond_2
    sget-object p1, Lcom/facebook/appevents/PerformanceGuardian;->bannedSuggestedEventActivitySet:Ljava/util/Set;

    invoke-interface {p1, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0

    .line 77
    :cond_3
    sget-object p1, Lcom/facebook/appevents/PerformanceGuardian;->bannedCodelessActivitySet:Ljava/util/Set;

    invoke-interface {p1, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return p0

    :catchall_0
    move-exception p0

    .line 80
    invoke-static {p0, v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return v2
.end method

.method private final isCacheValid(Ljava/lang/String;)Z
    .locals 3

    invoke-static {p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 127
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/facebook/internal/Utility;->getAppVersion()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    if-eqz p1, :cond_3

    .line 128
    move-object v2, p1

    check-cast v2, Ljava/lang/CharSequence;

    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-nez v2, :cond_1

    const/4 v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    if-eqz v2, :cond_2

    goto :goto_1

    .line 130
    :cond_2
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_3
    :goto_1
    return v1

    :catchall_0
    move-exception p1

    .line 128
    invoke-static {p1, p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return v1
.end method

.method public static final limitProcessTime(Ljava/lang/String;Lcom/facebook/appevents/PerformanceGuardian$UseCase;JJ)V
    .locals 2
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-class v0, Lcom/facebook/appevents/PerformanceGuardian;

    invoke-static {v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    .line 90
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/facebook/appevents/PerformanceGuardian;->initializeIfNotYet()V

    sub-long/2addr p4, p2

    if-eqz p0, :cond_5

    const/16 p2, 0x28

    int-to-long p2, p2

    cmp-long v1, p4, p2

    if-gez v1, :cond_1

    goto :goto_0

    :cond_1
    if-nez p1, :cond_2

    goto :goto_0

    .line 95
    :cond_2
    sget-object p2, Lcom/facebook/appevents/PerformanceGuardian$WhenMappings;->$EnumSwitchMapping$1:[I

    invoke-virtual {p1}, Lcom/facebook/appevents/PerformanceGuardian$UseCase;->ordinal()I

    move-result p3

    aget p2, p2, p3

    const/4 p3, 0x1

    if-eq p2, p3, :cond_4

    const/4 p3, 0x2

    if-eq p2, p3, :cond_3

    goto :goto_0

    .line 100
    :cond_3
    sget-object p2, Lcom/facebook/appevents/PerformanceGuardian;->INSTANCE:Lcom/facebook/appevents/PerformanceGuardian;

    .line 101
    sget-object p3, Lcom/facebook/appevents/PerformanceGuardian;->activityProcessTimeMapSe:Ljava/util/Map;

    sget-object p4, Lcom/facebook/appevents/PerformanceGuardian;->bannedSuggestedEventActivitySet:Ljava/util/Set;

    .line 100
    invoke-direct {p2, p1, p0, p3, p4}, Lcom/facebook/appevents/PerformanceGuardian;->updateActivityMap(Lcom/facebook/appevents/PerformanceGuardian$UseCase;Ljava/lang/String;Ljava/util/Map;Ljava/util/Set;)V

    goto :goto_0

    .line 97
    :cond_4
    sget-object p2, Lcom/facebook/appevents/PerformanceGuardian;->INSTANCE:Lcom/facebook/appevents/PerformanceGuardian;

    .line 98
    sget-object p3, Lcom/facebook/appevents/PerformanceGuardian;->activityProcessTimeMapCodeless:Ljava/util/Map;

    sget-object p4, Lcom/facebook/appevents/PerformanceGuardian;->bannedCodelessActivitySet:Ljava/util/Set;

    .line 97
    invoke-direct {p2, p1, p0, p3, p4}, Lcom/facebook/appevents/PerformanceGuardian;->updateActivityMap(Lcom/facebook/appevents/PerformanceGuardian$UseCase;Ljava/lang/String;Ljava/util/Map;Ljava/util/Set;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_5
    :goto_0
    return-void

    :catchall_0
    move-exception p0

    .line 103
    invoke-static {p0, v0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-void
.end method

.method private final updateActivityMap(Lcom/facebook/appevents/PerformanceGuardian$UseCase;Ljava/lang/String;Ljava/util/Map;Ljava/util/Set;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/appevents/PerformanceGuardian$UseCase;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-static {p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 112
    :cond_0
    :try_start_0
    invoke-interface {p3, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 113
    invoke-interface {p3, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    move v1, v0

    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 115
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p3, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p3, 0x3

    if-lt v1, p3, :cond_3

    .line 117
    invoke-interface {p4, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 118
    sget-object p2, Lcom/facebook/appevents/PerformanceGuardian;->sharedPreferences:Landroid/content/SharedPreferences;

    if-nez p2, :cond_2

    const-string p3, "sharedPreferences"

    invoke-static {p3}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    .line 119
    :cond_2
    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    .line 120
    invoke-virtual {p1}, Lcom/facebook/appevents/PerformanceGuardian$UseCase;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2, p1, p4}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string p2, "app_version"

    .line 121
    invoke-static {}, Lcom/facebook/internal/Utility;->getAppVersion()Ljava/lang/String;

    move-result-object p3

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 122
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_3
    return-void

    :catchall_0
    move-exception p1

    .line 124
    invoke-static {p1, p0}, Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->handleThrowable(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-void
.end method
