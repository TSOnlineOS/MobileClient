.class public final Lcom/google/android/recaptcha/internal/zzeg;
.super Ljava/lang/Object;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"


# static fields
.field private static final zza:Ljava/util/Map;

.field private static final zzb:Ljava/util/Map;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/LinkedHashMap;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Ljava/util/LinkedHashMap;-><init>(I)V

    new-instance v2, Ljava/util/LinkedHashMap;

    .line 2
    invoke-direct {v2, v1}, Ljava/util/LinkedHashMap;-><init>(I)V

    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const-class v3, Ljava/lang/Boolean;

    .line 3
    invoke-static {v0, v2, v1, v3}, Lcom/google/android/recaptcha/internal/zzeg;->zzb(Ljava/util/Map;Ljava/util/Map;Ljava/lang/Class;Ljava/lang/Class;)V

    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    const-class v3, Ljava/lang/Byte;

    .line 4
    invoke-static {v0, v2, v1, v3}, Lcom/google/android/recaptcha/internal/zzeg;->zzb(Ljava/util/Map;Ljava/util/Map;Ljava/lang/Class;Ljava/lang/Class;)V

    sget-object v1, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    const-class v3, Ljava/lang/Character;

    .line 5
    invoke-static {v0, v2, v1, v3}, Lcom/google/android/recaptcha/internal/zzeg;->zzb(Ljava/util/Map;Ljava/util/Map;Ljava/lang/Class;Ljava/lang/Class;)V

    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    const-class v3, Ljava/lang/Double;

    .line 6
    invoke-static {v0, v2, v1, v3}, Lcom/google/android/recaptcha/internal/zzeg;->zzb(Ljava/util/Map;Ljava/util/Map;Ljava/lang/Class;Ljava/lang/Class;)V

    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    const-class v3, Ljava/lang/Float;

    .line 7
    invoke-static {v0, v2, v1, v3}, Lcom/google/android/recaptcha/internal/zzeg;->zzb(Ljava/util/Map;Ljava/util/Map;Ljava/lang/Class;Ljava/lang/Class;)V

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const-class v3, Ljava/lang/Integer;

    .line 8
    invoke-static {v0, v2, v1, v3}, Lcom/google/android/recaptcha/internal/zzeg;->zzb(Ljava/util/Map;Ljava/util/Map;Ljava/lang/Class;Ljava/lang/Class;)V

    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    const-class v3, Ljava/lang/Long;

    .line 9
    invoke-static {v0, v2, v1, v3}, Lcom/google/android/recaptcha/internal/zzeg;->zzb(Ljava/util/Map;Ljava/util/Map;Ljava/lang/Class;Ljava/lang/Class;)V

    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    const-class v3, Ljava/lang/Short;

    .line 10
    invoke-static {v0, v2, v1, v3}, Lcom/google/android/recaptcha/internal/zzeg;->zzb(Ljava/util/Map;Ljava/util/Map;Ljava/lang/Class;Ljava/lang/Class;)V

    sget-object v1, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    const-class v3, Ljava/lang/Void;

    .line 11
    invoke-static {v0, v2, v1, v3}, Lcom/google/android/recaptcha/internal/zzeg;->zzb(Ljava/util/Map;Ljava/util/Map;Ljava/lang/Class;Ljava/lang/Class;)V

    .line 12
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/google/android/recaptcha/internal/zzeg;->zza:Ljava/util/Map;

    .line 13
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/google/android/recaptcha/internal/zzeg;->zzb:Ljava/util/Map;

    return-void
.end method

.method public static zza(Ljava/lang/Class;)Ljava/lang/Class;
    .locals 1

    if-eqz p0, :cond_1

    .line 1
    sget-object v0, Lcom/google/android/recaptcha/internal/zzeg;->zza:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    if-nez v0, :cond_0

    return-object p0

    :cond_0
    return-object v0

    :cond_1
    const/4 p0, 0x0

    .line 2
    throw p0
.end method

.method private static zzb(Ljava/util/Map;Ljava/util/Map;Ljava/lang/Class;Ljava/lang/Class;)V
    .locals 0

    .line 1
    invoke-interface {p0, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    invoke-interface {p1, p3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
