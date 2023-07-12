.class public final Lcom/google/android/recaptcha/internal/zzh;
.super Ljava/lang/Exception;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"


# static fields
.field public static final zza:Lcom/google/android/recaptcha/internal/zzg;

.field private static final zzb:Ljava/util/Map;


# instance fields
.field private final zzc:Lcom/google/android/recaptcha/internal/zzf;

.field private final zzd:Lcom/google/android/recaptcha/internal/zzd;

.field private final zze:Ljava/util/Map;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/google/android/recaptcha/internal/zzg;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/android/recaptcha/internal/zzg;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzh;->zza:Lcom/google/android/recaptcha/internal/zzg;

    const/4 v0, 0x7

    new-array v0, v0, [Lkotlin/Pair;

    sget-object v1, Lcom/google/android/recaptcha/internal/zzmf;->zzc:Lcom/google/android/recaptcha/internal/zzmf;

    new-instance v2, Lcom/google/android/recaptcha/internal/zzh;

    sget-object v3, Lcom/google/android/recaptcha/internal/zzf;->zze:Lcom/google/android/recaptcha/internal/zzf;

    sget-object v4, Lcom/google/android/recaptcha/internal/zzd;->zzm:Lcom/google/android/recaptcha/internal/zzd;

    .line 2
    invoke-direct {v2, v3, v4}, Lcom/google/android/recaptcha/internal/zzh;-><init>(Lcom/google/android/recaptcha/internal/zzf;Lcom/google/android/recaptcha/internal/zzd;)V

    .line 3
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/google/android/recaptcha/internal/zzmf;->zzd:Lcom/google/android/recaptcha/internal/zzmf;

    new-instance v2, Lcom/google/android/recaptcha/internal/zzh;

    sget-object v3, Lcom/google/android/recaptcha/internal/zzf;->zzc:Lcom/google/android/recaptcha/internal/zzf;

    sget-object v4, Lcom/google/android/recaptcha/internal/zzd;->zzk:Lcom/google/android/recaptcha/internal/zzd;

    .line 4
    invoke-direct {v2, v3, v4}, Lcom/google/android/recaptcha/internal/zzh;-><init>(Lcom/google/android/recaptcha/internal/zzf;Lcom/google/android/recaptcha/internal/zzd;)V

    .line 5
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/google/android/recaptcha/internal/zzmf;->zze:Lcom/google/android/recaptcha/internal/zzmf;

    new-instance v2, Lcom/google/android/recaptcha/internal/zzh;

    sget-object v3, Lcom/google/android/recaptcha/internal/zzf;->zzf:Lcom/google/android/recaptcha/internal/zzf;

    sget-object v4, Lcom/google/android/recaptcha/internal/zzd;->zzn:Lcom/google/android/recaptcha/internal/zzd;

    .line 6
    invoke-direct {v2, v3, v4}, Lcom/google/android/recaptcha/internal/zzh;-><init>(Lcom/google/android/recaptcha/internal/zzf;Lcom/google/android/recaptcha/internal/zzd;)V

    .line 7
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/google/android/recaptcha/internal/zzmf;->zzf:Lcom/google/android/recaptcha/internal/zzmf;

    new-instance v2, Lcom/google/android/recaptcha/internal/zzh;

    sget-object v3, Lcom/google/android/recaptcha/internal/zzf;->zzg:Lcom/google/android/recaptcha/internal/zzf;

    sget-object v4, Lcom/google/android/recaptcha/internal/zzd;->zzo:Lcom/google/android/recaptcha/internal/zzd;

    .line 8
    invoke-direct {v2, v3, v4}, Lcom/google/android/recaptcha/internal/zzh;-><init>(Lcom/google/android/recaptcha/internal/zzf;Lcom/google/android/recaptcha/internal/zzd;)V

    .line 9
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lcom/google/android/recaptcha/internal/zzmf;->zzi:Lcom/google/android/recaptcha/internal/zzmf;

    new-instance v2, Lcom/google/android/recaptcha/internal/zzh;

    sget-object v3, Lcom/google/android/recaptcha/internal/zzf;->zzh:Lcom/google/android/recaptcha/internal/zzf;

    sget-object v4, Lcom/google/android/recaptcha/internal/zzd;->zzp:Lcom/google/android/recaptcha/internal/zzd;

    .line 10
    invoke-direct {v2, v3, v4}, Lcom/google/android/recaptcha/internal/zzh;-><init>(Lcom/google/android/recaptcha/internal/zzf;Lcom/google/android/recaptcha/internal/zzd;)V

    .line 11
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/4 v2, 0x4

    aput-object v1, v0, v2

    sget-object v1, Lcom/google/android/recaptcha/internal/zzmf;->zzh:Lcom/google/android/recaptcha/internal/zzmf;

    new-instance v2, Lcom/google/android/recaptcha/internal/zzh;

    sget-object v3, Lcom/google/android/recaptcha/internal/zzf;->zzi:Lcom/google/android/recaptcha/internal/zzf;

    sget-object v4, Lcom/google/android/recaptcha/internal/zzd;->zzq:Lcom/google/android/recaptcha/internal/zzd;

    .line 12
    invoke-direct {v2, v3, v4}, Lcom/google/android/recaptcha/internal/zzh;-><init>(Lcom/google/android/recaptcha/internal/zzf;Lcom/google/android/recaptcha/internal/zzd;)V

    .line 13
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lcom/google/android/recaptcha/internal/zzmf;->zzj:Lcom/google/android/recaptcha/internal/zzmf;

    new-instance v2, Lcom/google/android/recaptcha/internal/zzh;

    sget-object v3, Lcom/google/android/recaptcha/internal/zzf;->zzc:Lcom/google/android/recaptcha/internal/zzf;

    sget-object v4, Lcom/google/android/recaptcha/internal/zzd;->zzv:Lcom/google/android/recaptcha/internal/zzd;

    .line 14
    invoke-direct {v2, v3, v4}, Lcom/google/android/recaptcha/internal/zzh;-><init>(Lcom/google/android/recaptcha/internal/zzf;Lcom/google/android/recaptcha/internal/zzd;)V

    .line 15
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/4 v2, 0x6

    aput-object v1, v0, v2

    .line 1
    invoke-static {v0}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/google/android/recaptcha/internal/zzh;->zzb:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/recaptcha/internal/zzf;Lcom/google/android/recaptcha/internal/zzd;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    iput-object p1, p0, Lcom/google/android/recaptcha/internal/zzh;->zzc:Lcom/google/android/recaptcha/internal/zzf;

    iput-object p2, p0, Lcom/google/android/recaptcha/internal/zzh;->zzd:Lcom/google/android/recaptcha/internal/zzd;

    const/4 p1, 0x6

    new-array p1, p1, [Lkotlin/Pair;

    sget-object p2, Lcom/google/android/recaptcha/internal/zzf;->zze:Lcom/google/android/recaptcha/internal/zzf;

    new-instance v0, Lcom/google/android/recaptcha/RecaptchaException;

    .line 2
    sget-object v1, Lcom/google/android/recaptcha/RecaptchaErrorCode;->NETWORK_ERROR:Lcom/google/android/recaptcha/RecaptchaErrorCode;

    const/4 v2, 0x0

    const/4 v3, 0x2

    invoke-direct {v0, v1, v2, v3, v2}, Lcom/google/android/recaptcha/RecaptchaException;-><init>(Lcom/google/android/recaptcha/RecaptchaErrorCode;Ljava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-static {p2, v0}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p2

    const/4 v0, 0x0

    aput-object p2, p1, v0

    sget-object p2, Lcom/google/android/recaptcha/internal/zzf;->zzf:Lcom/google/android/recaptcha/internal/zzf;

    new-instance v0, Lcom/google/android/recaptcha/RecaptchaException;

    sget-object v1, Lcom/google/android/recaptcha/RecaptchaErrorCode;->INVALID_SITEKEY:Lcom/google/android/recaptcha/RecaptchaErrorCode;

    .line 3
    invoke-direct {v0, v1, v2, v3, v2}, Lcom/google/android/recaptcha/RecaptchaException;-><init>(Lcom/google/android/recaptcha/RecaptchaErrorCode;Ljava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-static {p2, v0}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p2

    const/4 v0, 0x1

    aput-object p2, p1, v0

    sget-object p2, Lcom/google/android/recaptcha/internal/zzf;->zzg:Lcom/google/android/recaptcha/internal/zzf;

    new-instance v0, Lcom/google/android/recaptcha/RecaptchaException;

    sget-object v1, Lcom/google/android/recaptcha/RecaptchaErrorCode;->INVALID_KEYTYPE:Lcom/google/android/recaptcha/RecaptchaErrorCode;

    .line 4
    invoke-direct {v0, v1, v2, v3, v2}, Lcom/google/android/recaptcha/RecaptchaException;-><init>(Lcom/google/android/recaptcha/RecaptchaErrorCode;Ljava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-static {p2, v0}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p2

    aput-object p2, p1, v3

    sget-object p2, Lcom/google/android/recaptcha/internal/zzf;->zzh:Lcom/google/android/recaptcha/internal/zzf;

    new-instance v0, Lcom/google/android/recaptcha/RecaptchaException;

    sget-object v1, Lcom/google/android/recaptcha/RecaptchaErrorCode;->INVALID_PACKAGE_NAME:Lcom/google/android/recaptcha/RecaptchaErrorCode;

    .line 5
    invoke-direct {v0, v1, v2, v3, v2}, Lcom/google/android/recaptcha/RecaptchaException;-><init>(Lcom/google/android/recaptcha/RecaptchaErrorCode;Ljava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 6
    invoke-static {p2, v0}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p2

    const/4 v0, 0x3

    aput-object p2, p1, v0

    sget-object p2, Lcom/google/android/recaptcha/internal/zzf;->zzi:Lcom/google/android/recaptcha/internal/zzf;

    new-instance v0, Lcom/google/android/recaptcha/RecaptchaException;

    sget-object v1, Lcom/google/android/recaptcha/RecaptchaErrorCode;->INVALID_ACTION:Lcom/google/android/recaptcha/RecaptchaErrorCode;

    .line 7
    invoke-direct {v0, v1, v2, v3, v2}, Lcom/google/android/recaptcha/RecaptchaException;-><init>(Lcom/google/android/recaptcha/RecaptchaErrorCode;Ljava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-static {p2, v0}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p2

    const/4 v0, 0x4

    aput-object p2, p1, v0

    sget-object p2, Lcom/google/android/recaptcha/internal/zzf;->zzc:Lcom/google/android/recaptcha/internal/zzf;

    new-instance v0, Lcom/google/android/recaptcha/RecaptchaException;

    sget-object v1, Lcom/google/android/recaptcha/RecaptchaErrorCode;->INTERNAL_ERROR:Lcom/google/android/recaptcha/RecaptchaErrorCode;

    .line 8
    invoke-direct {v0, v1, v2, v3, v2}, Lcom/google/android/recaptcha/RecaptchaException;-><init>(Lcom/google/android/recaptcha/RecaptchaErrorCode;Ljava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-static {p2, v0}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p2

    const/4 v0, 0x5

    aput-object p2, p1, v0

    .line 9
    invoke-static {p1}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/recaptcha/internal/zzh;->zze:Ljava/util/Map;

    return-void
.end method

.method public static final synthetic zzd()Ljava/util/Map;
    .locals 1

    sget-object v0, Lcom/google/android/recaptcha/internal/zzh;->zzb:Ljava/util/Map;

    return-object v0
.end method


# virtual methods
.method public final zza()Lcom/google/android/recaptcha/internal/zzd;
    .locals 1

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzh;->zzd:Lcom/google/android/recaptcha/internal/zzd;

    return-object v0
.end method

.method public final zzb()Lcom/google/android/recaptcha/internal/zzf;
    .locals 1

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzh;->zzc:Lcom/google/android/recaptcha/internal/zzf;

    return-object v0
.end method

.method public final zzc()Lcom/google/android/recaptcha/RecaptchaException;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzh;->zze:Ljava/util/Map;

    iget-object v1, p0, Lcom/google/android/recaptcha/internal/zzh;->zzc:Lcom/google/android/recaptcha/internal/zzf;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/recaptcha/RecaptchaException;

    if-nez v0, :cond_0

    new-instance v0, Lcom/google/android/recaptcha/RecaptchaException;

    .line 2
    sget-object v1, Lcom/google/android/recaptcha/RecaptchaErrorCode;->UNKNOWN_ERROR:Lcom/google/android/recaptcha/RecaptchaErrorCode;

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2, v3}, Lcom/google/android/recaptcha/RecaptchaException;-><init>(Lcom/google/android/recaptcha/RecaptchaErrorCode;Ljava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    :cond_0
    return-object v0
.end method
