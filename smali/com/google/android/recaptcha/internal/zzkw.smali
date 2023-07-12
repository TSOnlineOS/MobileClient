.class public final enum Lcom/google/android/recaptcha/internal/zzkw;
.super Ljava/lang/Enum;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"

# interfaces
.implements Lcom/google/android/recaptcha/internal/zzgq;


# static fields
.field public static final enum zza:Lcom/google/android/recaptcha/internal/zzkw;

.field public static final enum zzb:Lcom/google/android/recaptcha/internal/zzkw;

.field public static final enum zzc:Lcom/google/android/recaptcha/internal/zzkw;

.field public static final enum zzd:Lcom/google/android/recaptcha/internal/zzkw;

.field public static final enum zze:Lcom/google/android/recaptcha/internal/zzkw;

.field public static final enum zzf:Lcom/google/android/recaptcha/internal/zzkw;

.field public static final enum zzg:Lcom/google/android/recaptcha/internal/zzkw;

.field public static final enum zzh:Lcom/google/android/recaptcha/internal/zzkw;

.field public static final enum zzi:Lcom/google/android/recaptcha/internal/zzkw;

.field public static final enum zzj:Lcom/google/android/recaptcha/internal/zzkw;

.field public static final enum zzk:Lcom/google/android/recaptcha/internal/zzkw;

.field public static final enum zzl:Lcom/google/android/recaptcha/internal/zzkw;

.field public static final enum zzm:Lcom/google/android/recaptcha/internal/zzkw;

.field public static final enum zzn:Lcom/google/android/recaptcha/internal/zzkw;

.field public static final enum zzo:Lcom/google/android/recaptcha/internal/zzkw;

.field public static final enum zzp:Lcom/google/android/recaptcha/internal/zzkw;

.field public static final enum zzq:Lcom/google/android/recaptcha/internal/zzkw;

.field public static final enum zzr:Lcom/google/android/recaptcha/internal/zzkw;

.field private static final zzs:Lcom/google/android/recaptcha/internal/zzgr;

.field private static final synthetic zzt:[Lcom/google/android/recaptcha/internal/zzkw;


# instance fields
.field private final zzu:I


# direct methods
.method static constructor <clinit>()V
    .locals 16

    .line 1
    new-instance v0, Lcom/google/android/recaptcha/internal/zzkw;

    const-string v1, "UNKNOWN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/google/android/recaptcha/internal/zzkw;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzkw;->zza:Lcom/google/android/recaptcha/internal/zzkw;

    new-instance v0, Lcom/google/android/recaptcha/internal/zzkw;

    const-string v1, "INIT_NATIVE"

    const/4 v3, 0x1

    .line 2
    invoke-direct {v0, v1, v3, v3}, Lcom/google/android/recaptcha/internal/zzkw;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzkw;->zzb:Lcom/google/android/recaptcha/internal/zzkw;

    new-instance v0, Lcom/google/android/recaptcha/internal/zzkw;

    const-string v1, "INIT_NETWORK"

    const/4 v4, 0x2

    .line 3
    invoke-direct {v0, v1, v4, v4}, Lcom/google/android/recaptcha/internal/zzkw;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzkw;->zzc:Lcom/google/android/recaptcha/internal/zzkw;

    new-instance v0, Lcom/google/android/recaptcha/internal/zzkw;

    const-string v1, "INIT_JS"

    const/4 v5, 0x3

    .line 4
    invoke-direct {v0, v1, v5, v5}, Lcom/google/android/recaptcha/internal/zzkw;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzkw;->zzd:Lcom/google/android/recaptcha/internal/zzkw;

    new-instance v0, Lcom/google/android/recaptcha/internal/zzkw;

    const-string v1, "INIT_TOTAL"

    const/4 v6, 0x4

    .line 5
    invoke-direct {v0, v1, v6, v6}, Lcom/google/android/recaptcha/internal/zzkw;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzkw;->zze:Lcom/google/android/recaptcha/internal/zzkw;

    new-instance v0, Lcom/google/android/recaptcha/internal/zzkw;

    const-string v1, "EXECUTE_NATIVE"

    const/4 v7, 0x5

    .line 6
    invoke-direct {v0, v1, v7, v7}, Lcom/google/android/recaptcha/internal/zzkw;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzkw;->zzf:Lcom/google/android/recaptcha/internal/zzkw;

    new-instance v0, Lcom/google/android/recaptcha/internal/zzkw;

    const-string v1, "EXECUTE_JS"

    const/4 v8, 0x6

    .line 7
    invoke-direct {v0, v1, v8, v8}, Lcom/google/android/recaptcha/internal/zzkw;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzkw;->zzg:Lcom/google/android/recaptcha/internal/zzkw;

    new-instance v0, Lcom/google/android/recaptcha/internal/zzkw;

    const-string v1, "EXECUTE_TOTAL"

    const/4 v9, 0x7

    .line 8
    invoke-direct {v0, v1, v9, v9}, Lcom/google/android/recaptcha/internal/zzkw;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzkw;->zzh:Lcom/google/android/recaptcha/internal/zzkw;

    new-instance v0, Lcom/google/android/recaptcha/internal/zzkw;

    const-string v1, "CHALLENGE_ACCOUNT_NATIVE"

    const/16 v10, 0x8

    .line 9
    invoke-direct {v0, v1, v10, v10}, Lcom/google/android/recaptcha/internal/zzkw;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzkw;->zzi:Lcom/google/android/recaptcha/internal/zzkw;

    new-instance v0, Lcom/google/android/recaptcha/internal/zzkw;

    const-string v1, "CHALLENGE_ACCOUNT_JS"

    const/16 v11, 0x9

    .line 10
    invoke-direct {v0, v1, v11, v11}, Lcom/google/android/recaptcha/internal/zzkw;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzkw;->zzj:Lcom/google/android/recaptcha/internal/zzkw;

    new-instance v0, Lcom/google/android/recaptcha/internal/zzkw;

    const-string v1, "CHALLENGE_ACCOUNT_TOTAL"

    const/16 v12, 0xa

    .line 11
    invoke-direct {v0, v1, v12, v12}, Lcom/google/android/recaptcha/internal/zzkw;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzkw;->zzk:Lcom/google/android/recaptcha/internal/zzkw;

    new-instance v0, Lcom/google/android/recaptcha/internal/zzkw;

    const-string v1, "VERIFY_PIN_NATIVE"

    const/16 v13, 0xb

    .line 12
    invoke-direct {v0, v1, v13, v13}, Lcom/google/android/recaptcha/internal/zzkw;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzkw;->zzl:Lcom/google/android/recaptcha/internal/zzkw;

    new-instance v0, Lcom/google/android/recaptcha/internal/zzkw;

    const-string v1, "VERIFY_PIN_JS"

    const/16 v14, 0xc

    .line 13
    invoke-direct {v0, v1, v14, v14}, Lcom/google/android/recaptcha/internal/zzkw;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzkw;->zzm:Lcom/google/android/recaptcha/internal/zzkw;

    new-instance v0, Lcom/google/android/recaptcha/internal/zzkw;

    const-string v1, "VERIFY_PIN_TOTAL"

    const/16 v15, 0xd

    .line 14
    invoke-direct {v0, v1, v15, v15}, Lcom/google/android/recaptcha/internal/zzkw;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzkw;->zzn:Lcom/google/android/recaptcha/internal/zzkw;

    new-instance v0, Lcom/google/android/recaptcha/internal/zzkw;

    const-string v1, "RUN_PROGRAM"

    const/16 v15, 0xe

    .line 15
    invoke-direct {v0, v1, v15, v15}, Lcom/google/android/recaptcha/internal/zzkw;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzkw;->zzo:Lcom/google/android/recaptcha/internal/zzkw;

    new-instance v0, Lcom/google/android/recaptcha/internal/zzkw;

    const-string v1, "FETCH_ALLOWLIST"

    const/16 v15, 0xf

    .line 16
    invoke-direct {v0, v1, v15, v15}, Lcom/google/android/recaptcha/internal/zzkw;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzkw;->zzp:Lcom/google/android/recaptcha/internal/zzkw;

    new-instance v0, Lcom/google/android/recaptcha/internal/zzkw;

    const-string v1, "JS_LOAD"

    const/16 v15, 0x10

    .line 17
    invoke-direct {v0, v1, v15, v15}, Lcom/google/android/recaptcha/internal/zzkw;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzkw;->zzq:Lcom/google/android/recaptcha/internal/zzkw;

    new-instance v0, Lcom/google/android/recaptcha/internal/zzkw;

    const-string v1, "UNRECOGNIZED"

    const/16 v15, 0x11

    const/4 v14, -0x1

    .line 18
    invoke-direct {v0, v1, v15, v14}, Lcom/google/android/recaptcha/internal/zzkw;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzkw;->zzr:Lcom/google/android/recaptcha/internal/zzkw;

    const/16 v1, 0x12

    new-array v1, v1, [Lcom/google/android/recaptcha/internal/zzkw;

    sget-object v14, Lcom/google/android/recaptcha/internal/zzkw;->zza:Lcom/google/android/recaptcha/internal/zzkw;

    aput-object v14, v1, v2

    sget-object v2, Lcom/google/android/recaptcha/internal/zzkw;->zzb:Lcom/google/android/recaptcha/internal/zzkw;

    aput-object v2, v1, v3

    sget-object v2, Lcom/google/android/recaptcha/internal/zzkw;->zzc:Lcom/google/android/recaptcha/internal/zzkw;

    aput-object v2, v1, v4

    sget-object v2, Lcom/google/android/recaptcha/internal/zzkw;->zzd:Lcom/google/android/recaptcha/internal/zzkw;

    aput-object v2, v1, v5

    sget-object v2, Lcom/google/android/recaptcha/internal/zzkw;->zze:Lcom/google/android/recaptcha/internal/zzkw;

    aput-object v2, v1, v6

    sget-object v2, Lcom/google/android/recaptcha/internal/zzkw;->zzf:Lcom/google/android/recaptcha/internal/zzkw;

    aput-object v2, v1, v7

    sget-object v2, Lcom/google/android/recaptcha/internal/zzkw;->zzg:Lcom/google/android/recaptcha/internal/zzkw;

    aput-object v2, v1, v8

    sget-object v2, Lcom/google/android/recaptcha/internal/zzkw;->zzh:Lcom/google/android/recaptcha/internal/zzkw;

    aput-object v2, v1, v9

    sget-object v2, Lcom/google/android/recaptcha/internal/zzkw;->zzi:Lcom/google/android/recaptcha/internal/zzkw;

    aput-object v2, v1, v10

    sget-object v2, Lcom/google/android/recaptcha/internal/zzkw;->zzj:Lcom/google/android/recaptcha/internal/zzkw;

    aput-object v2, v1, v11

    sget-object v2, Lcom/google/android/recaptcha/internal/zzkw;->zzk:Lcom/google/android/recaptcha/internal/zzkw;

    aput-object v2, v1, v12

    sget-object v2, Lcom/google/android/recaptcha/internal/zzkw;->zzl:Lcom/google/android/recaptcha/internal/zzkw;

    aput-object v2, v1, v13

    sget-object v2, Lcom/google/android/recaptcha/internal/zzkw;->zzm:Lcom/google/android/recaptcha/internal/zzkw;

    const/16 v3, 0xc

    aput-object v2, v1, v3

    sget-object v2, Lcom/google/android/recaptcha/internal/zzkw;->zzn:Lcom/google/android/recaptcha/internal/zzkw;

    const/16 v3, 0xd

    aput-object v2, v1, v3

    sget-object v2, Lcom/google/android/recaptcha/internal/zzkw;->zzo:Lcom/google/android/recaptcha/internal/zzkw;

    const/16 v3, 0xe

    aput-object v2, v1, v3

    sget-object v2, Lcom/google/android/recaptcha/internal/zzkw;->zzp:Lcom/google/android/recaptcha/internal/zzkw;

    const/16 v3, 0xf

    aput-object v2, v1, v3

    sget-object v2, Lcom/google/android/recaptcha/internal/zzkw;->zzq:Lcom/google/android/recaptcha/internal/zzkw;

    const/16 v3, 0x10

    aput-object v2, v1, v3

    aput-object v0, v1, v15

    sput-object v1, Lcom/google/android/recaptcha/internal/zzkw;->zzt:[Lcom/google/android/recaptcha/internal/zzkw;

    new-instance v0, Lcom/google/android/recaptcha/internal/zzkv;

    invoke-direct {v0}, Lcom/google/android/recaptcha/internal/zzkv;-><init>()V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzkw;->zzs:Lcom/google/android/recaptcha/internal/zzgr;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/google/android/recaptcha/internal/zzkw;->zzu:I

    return-void
.end method

.method public static values()[Lcom/google/android/recaptcha/internal/zzkw;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/recaptcha/internal/zzkw;->zzt:[Lcom/google/android/recaptcha/internal/zzkw;

    invoke-virtual {v0}, [Lcom/google/android/recaptcha/internal/zzkw;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/android/recaptcha/internal/zzkw;

    return-object v0
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/recaptcha/internal/zzkw;->zza()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final zza()I
    .locals 2

    .line 1
    sget-object v0, Lcom/google/android/recaptcha/internal/zzkw;->zzr:Lcom/google/android/recaptcha/internal/zzkw;

    if-eq p0, v0, :cond_0

    iget v0, p0, Lcom/google/android/recaptcha/internal/zzkw;->zzu:I

    return v0

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Can\'t get the number of an unknown enum value."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
