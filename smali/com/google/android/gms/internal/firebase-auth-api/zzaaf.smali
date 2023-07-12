.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"


# static fields
.field private static final zza:Lcom/google/android/gms/common/logging/Logger;


# instance fields
.field private final zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

.field private final zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzaca;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/google/android/gms/common/logging/Logger;

    const-string v1, "FirebaseAuthFallback:"

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "FirebaseAuth"

    invoke-direct {v0, v2, v1}, Lcom/google/android/gms/common/logging/Logger;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zza:Lcom/google/android/gms/common/logging/Logger;

    return-void
.end method

.method constructor <init>(Lcom/google/firebase/FirebaseApp;Ljava/util/concurrent/ScheduledExecutorService;)V
    .locals 9

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    invoke-virtual {p1}, Lcom/google/firebase/FirebaseApp;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 3
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzaas;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzaas;

    move-result-object v3

    new-instance v7, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    new-instance v8, Lcom/google/android/gms/internal/firebase-auth-api/zzaat;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v1, v8

    move-object v2, p1

    .line 5
    invoke-direct/range {v1 .. v6}, Lcom/google/android/gms/internal/firebase-auth-api/zzaat;-><init>(Lcom/google/firebase/FirebaseApp;Lcom/google/android/gms/internal/firebase-auth-api/zzaas;Lcom/google/android/gms/internal/firebase-auth-api/zzabr;Lcom/google/android/gms/internal/firebase-auth-api/zzaan;Lcom/google/android/gms/internal/firebase-auth-api/zzaao;)V

    .line 6
    invoke-direct {v7, v8}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzabm;)V

    iput-object v7, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    .line 7
    new-instance p1, Lcom/google/android/gms/internal/firebase-auth-api/zzaca;

    invoke-direct {p1, v0, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaca;-><init>(Landroid/content/Context;Ljava/util/concurrent/ScheduledExecutorService;)V

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzaca;

    return-void
.end method

.method private static zzI(JZ)Z
    .locals 3

    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-lez v2, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x1

    return p0

    .line 1
    :cond_1
    :goto_0
    sget-object p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zza:Lcom/google/android/gms/common/logging/Logger;

    const/4 p1, 0x0

    new-array p2, p1, [Ljava/lang/Object;

    const-string v0, "App hash will not be appended to the request."

    invoke-virtual {p0, v0, p2}, Lcom/google/android/gms/common/logging/Logger;->w(Ljava/lang/String;[Ljava/lang/Object;)V

    return p1
.end method


# virtual methods
.method public final zzA(Lcom/google/android/gms/internal/firebase-auth-api/zzwj;Lcom/google/android/gms/internal/firebase-auth-api/zzaad;)V
    .locals 3

    .line 1
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwj;->zza()Lcom/google/firebase/auth/PhoneAuthCredential;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/auth/PhoneAuthCredential;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    .line 4
    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzabq;->zza(Lcom/google/firebase/auth/PhoneAuthCredential;)Lcom/google/android/gms/internal/firebase-auth-api/zzaej;

    move-result-object p1

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zza:Lcom/google/android/gms/common/logging/Logger;

    invoke-direct {v1, p2, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaad;Lcom/google/android/gms/common/logging/Logger;)V

    .line 5
    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzE(Lcom/google/android/gms/internal/firebase-auth-api/zzaej;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;)V

    return-void
.end method

.method public final zzB(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JZZLjava/lang/String;Ljava/lang/String;ZLcom/google/android/gms/internal/firebase-auth-api/zzaad;)V
    .locals 10

    move-object v0, p0

    move-object v7, p2

    const-string v1, "idToken should not be empty."

    move-object v2, p1

    .line 1
    invoke-static {p1, v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    .line 2
    invoke-static/range {p11 .. p11}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v8, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    sget-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zza:Lcom/google/android/gms/common/logging/Logger;

    move-object/from16 v3, p11

    .line 3
    invoke-direct {v8, v3, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaad;Lcom/google/android/gms/common/logging/Logger;)V

    iget-object v1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzaca;

    .line 4
    invoke-virtual {v1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaca;->zzk(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    if-eqz p6, :cond_0

    iget-object v1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzaca;

    .line 5
    invoke-virtual {v1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaca;->zzi(Ljava/lang/String;)V

    goto :goto_0

    .line 11
    :cond_0
    iget-object v1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzaca;

    .line 12
    invoke-virtual {v1, v8, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaca;->zzh(Lcom/google/android/gms/internal/firebase-auth-api/zzaae;Ljava/lang/String;)V

    return-void

    :cond_1
    :goto_0
    const/4 v6, 0x0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object/from16 v4, p8

    move-object/from16 v5, p9

    .line 6
    invoke-static/range {v1 .. v6}, Lcom/google/android/gms/internal/firebase-auth-api/zzadx;->zzb(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzadx;

    move-result-object v9

    move-wide v4, p4

    move/from16 v6, p10

    .line 7
    invoke-static {p4, p5, v6}, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzI(JZ)Z

    move-result v1

    if-eqz v1, :cond_2

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzacf;

    iget-object v2, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzaca;

    .line 8
    invoke-virtual {v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaca;->zzb()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzacf;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzadx;->zzd(Lcom/google/android/gms/internal/firebase-auth-api/zzacf;)V

    :cond_2
    iget-object v1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzaca;

    move-object v2, p2

    move-object v3, v8

    move-wide v4, p4

    move/from16 v6, p10

    .line 9
    invoke-virtual/range {v1 .. v6}, Lcom/google/android/gms/internal/firebase-auth-api/zzaca;->zzj(Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;JZ)V

    iget-object v1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    iget-object v2, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzaca;

    new-instance v3, Lcom/google/android/gms/internal/firebase-auth-api/zzabx;

    .line 10
    invoke-direct {v3, v2, v8, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzabx;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaca;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;Ljava/lang/String;)V

    .line 11
    invoke-virtual {v1, v9, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzM(Lcom/google/android/gms/internal/firebase-auth-api/zzadx;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;)V

    return-void
.end method

.method public final zzC(Lcom/google/android/gms/internal/firebase-auth-api/zzwk;Lcom/google/android/gms/internal/firebase-auth-api/zzaad;)V
    .locals 15

    move-object v0, p0

    .line 1
    invoke-static/range {p1 .. p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    invoke-static/range {p2 .. p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwk;->zzb()Lcom/google/firebase/auth/PhoneMultiFactorInfo;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/firebase/auth/PhoneMultiFactorInfo;->getPhoneNumber()Ljava/lang/String;

    move-result-object v1

    new-instance v8, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zza:Lcom/google/android/gms/common/logging/Logger;

    move-object/from16 v3, p2

    .line 4
    invoke-direct {v8, v3, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaad;Lcom/google/android/gms/common/logging/Logger;)V

    iget-object v2, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzaca;

    .line 5
    invoke-virtual {v2, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaca;->zzk(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 6
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwk;->zzg()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzaca;

    .line 7
    invoke-virtual {v2, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaca;->zzi(Ljava/lang/String;)V

    goto :goto_0

    .line 21
    :cond_0
    iget-object v2, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzaca;

    .line 22
    invoke-virtual {v2, v8, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaca;->zzh(Lcom/google/android/gms/internal/firebase-auth-api/zzaae;Ljava/lang/String;)V

    return-void

    .line 8
    :cond_1
    :goto_0
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwk;->zza()J

    move-result-wide v5

    .line 9
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwk;->zzh()Z

    move-result v7

    .line 10
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwk;->zzd()Ljava/lang/String;

    move-result-object v9

    .line 11
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwk;->zzb()Lcom/google/firebase/auth/PhoneMultiFactorInfo;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/firebase/auth/PhoneMultiFactorInfo;->getUid()Ljava/lang/String;

    move-result-object v10

    .line 12
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwk;->zzb()Lcom/google/firebase/auth/PhoneMultiFactorInfo;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/firebase/auth/PhoneMultiFactorInfo;->getPhoneNumber()Ljava/lang/String;

    move-result-object v11

    .line 13
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwk;->zzc()Ljava/lang/String;

    move-result-object v12

    .line 14
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwk;->zzf()Ljava/lang/String;

    move-result-object v13

    .line 15
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwk;->zze()Ljava/lang/String;

    move-result-object v14

    .line 16
    invoke-static/range {v9 .. v14}, Lcom/google/android/gms/internal/firebase-auth-api/zzadv;->zzb(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzadv;

    move-result-object v9

    .line 17
    invoke-static {v5, v6, v7}, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzI(JZ)Z

    move-result v2

    if-eqz v2, :cond_2

    new-instance v2, Lcom/google/android/gms/internal/firebase-auth-api/zzacf;

    iget-object v3, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzaca;

    .line 18
    invoke-virtual {v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzaca;->zzb()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzacf;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzadv;->zzd(Lcom/google/android/gms/internal/firebase-auth-api/zzacf;)V

    :cond_2
    iget-object v2, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzaca;

    move-object v3, v1

    move-object v4, v8

    .line 19
    invoke-virtual/range {v2 .. v7}, Lcom/google/android/gms/internal/firebase-auth-api/zzaca;->zzj(Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;JZ)V

    iget-object v2, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    iget-object v3, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzaca;

    new-instance v4, Lcom/google/android/gms/internal/firebase-auth-api/zzabx;

    .line 20
    invoke-direct {v4, v3, v8, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzabx;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaca;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;Ljava/lang/String;)V

    .line 21
    invoke-virtual {v2, v9, v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzF(Lcom/google/android/gms/internal/firebase-auth-api/zzadv;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;)V

    return-void
.end method

.method public final zzD(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaad;)V
    .locals 3

    const-string v0, "cachedTokenState should not be empty."

    .line 1
    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    const-string v0, "uid should not be empty."

    .line 2
    invoke-static {p2, v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    .line 3
    invoke-static {p4}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zza:Lcom/google/android/gms/common/logging/Logger;

    .line 4
    invoke-direct {v1, p4, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaad;Lcom/google/android/gms/common/logging/Logger;)V

    invoke-virtual {v0, p1, p2, p3, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzG(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;)V

    return-void
.end method

.method public final zzE(Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaad;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zza:Lcom/google/android/gms/common/logging/Logger;

    .line 3
    invoke-direct {v1, p2, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaad;Lcom/google/android/gms/common/logging/Logger;)V

    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzH(Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;)V

    return-void
.end method

.method public final zzF(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaad;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 3
    invoke-static {p3}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zza:Lcom/google/android/gms/common/logging/Logger;

    .line 4
    invoke-direct {v1, p3, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaad;Lcom/google/android/gms/common/logging/Logger;)V

    invoke-virtual {v0, p1, p2, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzI(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;)V

    return-void
.end method

.method public final zzG(Ljava/lang/String;Lcom/google/firebase/auth/UserProfileChangeRequest;Lcom/google/android/gms/internal/firebase-auth-api/zzaad;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-static {p3}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zza:Lcom/google/android/gms/common/logging/Logger;

    .line 4
    invoke-direct {v1, p3, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaad;Lcom/google/android/gms/common/logging/Logger;)V

    invoke-virtual {v0, p1, p2, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzJ(Ljava/lang/String;Lcom/google/firebase/auth/UserProfileChangeRequest;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;)V

    return-void
.end method

.method public final zzH(Lcom/google/android/gms/internal/firebase-auth-api/zzwl;Lcom/google/android/gms/internal/firebase-auth-api/zzaad;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwl;->zza()Lcom/google/firebase/auth/ActionCodeSettings;

    move-result-object v0

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwl;->zzb()Ljava/lang/String;

    move-result-object v1

    .line 4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwl;->zzc()Ljava/lang/String;

    move-result-object p1

    .line 5
    invoke-static {v0, v1, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zzc(Lcom/google/firebase/auth/ActionCodeSettings;Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zza:Lcom/google/android/gms/common/logging/Logger;

    .line 6
    invoke-direct {v1, p2, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaad;Lcom/google/android/gms/common/logging/Logger;)V

    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzK(Lcom/google/android/gms/internal/firebase-auth-api/zzacx;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;)V

    return-void
.end method

.method public final zza(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaad;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    invoke-static {p3}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zza:Lcom/google/android/gms/common/logging/Logger;

    .line 3
    invoke-direct {v1, p3, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaad;Lcom/google/android/gms/common/logging/Logger;)V

    invoke-virtual {v0, p1, p2, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzg(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;)V

    return-void
.end method

.method public final zzb(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaad;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 3
    invoke-static {p3}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zza:Lcom/google/android/gms/common/logging/Logger;

    .line 4
    invoke-direct {v1, p3, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaad;Lcom/google/android/gms/common/logging/Logger;)V

    invoke-virtual {v0, p1, p2, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzh(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;)V

    return-void
.end method

.method public final zzc(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaad;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 3
    invoke-static {p3}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zza:Lcom/google/android/gms/common/logging/Logger;

    .line 4
    invoke-direct {v1, p3, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaad;Lcom/google/android/gms/common/logging/Logger;)V

    invoke-virtual {v0, p1, p2, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzi(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;)V

    return-void
.end method

.method public final zzd(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaad;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    invoke-static {p3}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zza:Lcom/google/android/gms/common/logging/Logger;

    .line 3
    invoke-direct {v1, p3, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaad;Lcom/google/android/gms/common/logging/Logger;)V

    invoke-virtual {v0, p1, p2, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzj(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;)V

    return-void
.end method

.method public final zze(Lcom/google/android/gms/internal/firebase-auth-api/zzwa;Lcom/google/android/gms/internal/firebase-auth-api/zzaad;)V
    .locals 5

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwa;->zza()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwa;->zzb()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    .line 5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwa;->zza()Ljava/lang/String;

    move-result-object v1

    .line 6
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwa;->zzb()Ljava/lang/String;

    move-result-object v2

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwa;->zzc()Ljava/lang/String;

    move-result-object p1

    new-instance v3, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    sget-object v4, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zza:Lcom/google/android/gms/common/logging/Logger;

    invoke-direct {v3, p2, v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaad;Lcom/google/android/gms/common/logging/Logger;)V

    .line 8
    invoke-virtual {v0, v1, v2, p1, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzk(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;)V

    return-void
.end method

.method public final zzf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaad;)V
    .locals 6

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 3
    invoke-static {p5}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    new-instance v5, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    sget-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zza:Lcom/google/android/gms/common/logging/Logger;

    .line 4
    invoke-direct {v5, p5, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaad;Lcom/google/android/gms/common/logging/Logger;)V

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzl(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;)V

    return-void
.end method

.method public final zzg(Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaad;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zza:Lcom/google/android/gms/common/logging/Logger;

    .line 3
    invoke-direct {v1, p2, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaad;Lcom/google/android/gms/common/logging/Logger;)V

    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzm(Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;)V

    return-void
.end method

.method public final zzh(Lcom/google/firebase/auth/MultiFactorAssertion;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaad;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    const-string p4, "cachedTokenState should not be empty."

    .line 2
    invoke-static {p2, p4}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    .line 3
    invoke-static {p5}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    instance-of p4, p1, Lcom/google/firebase/auth/PhoneMultiFactorAssertion;

    if-eqz p4, :cond_0

    .line 4
    check-cast p1, Lcom/google/firebase/auth/PhoneMultiFactorAssertion;

    .line 5
    invoke-virtual {p1}, Lcom/google/firebase/auth/PhoneMultiFactorAssertion;->zza()Lcom/google/firebase/auth/PhoneAuthCredential;

    move-result-object p1

    iget-object p4, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    .line 6
    invoke-virtual {p1}, Lcom/google/firebase/auth/PhoneAuthCredential;->zzg()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 7
    invoke-virtual {p1}, Lcom/google/firebase/auth/PhoneAuthCredential;->getSmsCode()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    const/4 v1, 0x0

    .line 8
    invoke-static {p2, v0, p1, p3, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzacp;->zzb(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzacp;

    move-result-object p1

    new-instance p3, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zza:Lcom/google/android/gms/common/logging/Logger;

    invoke-direct {p3, p5, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaad;Lcom/google/android/gms/common/logging/Logger;)V

    .line 9
    invoke-virtual {p4, p1, p2, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzL(Lcom/google/android/gms/internal/firebase-auth-api/zzacp;Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;)V

    return-void

    .line 10
    :cond_0
    instance-of p1, p1, Lcom/google/firebase/auth/zzat;

    if-eqz p1, :cond_1

    .line 11
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Not implemented"

    .line 10
    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 9
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "multiFactorAssertion must be either PhoneMultiFactorAssertion or TotpMultiFactorAssertion."

    .line 11
    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final zzi(Ljava/lang/String;Lcom/google/firebase/auth/MultiFactorAssertion;Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaad;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-static {p4}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    instance-of v0, p2, Lcom/google/firebase/auth/PhoneMultiFactorAssertion;

    if-eqz v0, :cond_0

    .line 4
    check-cast p2, Lcom/google/firebase/auth/PhoneMultiFactorAssertion;

    .line 5
    invoke-virtual {p2}, Lcom/google/firebase/auth/PhoneMultiFactorAssertion;->zza()Lcom/google/firebase/auth/PhoneAuthCredential;

    move-result-object p2

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    .line 6
    invoke-virtual {p2}, Lcom/google/firebase/auth/PhoneAuthCredential;->zzg()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 7
    invoke-virtual {p2}, Lcom/google/firebase/auth/PhoneAuthCredential;->getSmsCode()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    .line 8
    invoke-static {p1, v1, p2, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzacq;->zzb(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzacq;

    move-result-object p1

    new-instance p2, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    sget-object p3, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zza:Lcom/google/android/gms/common/logging/Logger;

    invoke-direct {p2, p4, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaad;Lcom/google/android/gms/common/logging/Logger;)V

    .line 9
    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzN(Lcom/google/android/gms/internal/firebase-auth-api/zzacq;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;)V

    return-void

    .line 11
    :cond_0
    instance-of p1, p2, Lcom/google/firebase/auth/zzat;

    if-eqz p1, :cond_1

    .line 10
    check-cast p2, Lcom/google/firebase/auth/zzat;

    const/4 p1, 0x0

    .line 11
    throw p1

    .line 9
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "multiFactorAssertion must be either PhoneMultiFactorAssertion or TotpMultiFactorAssertion."

    .line 12
    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final zzj(Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaad;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zza:Lcom/google/android/gms/common/logging/Logger;

    .line 3
    invoke-direct {v1, p2, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaad;Lcom/google/android/gms/common/logging/Logger;)V

    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzn(Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;)V

    return-void
.end method

.method public final zzk(Lcom/google/android/gms/internal/firebase-auth-api/zzwb;Lcom/google/android/gms/internal/firebase-auth-api/zzaad;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzacz;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zza:Lcom/google/android/gms/common/logging/Logger;

    .line 2
    invoke-direct {v1, p2, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaad;Lcom/google/android/gms/common/logging/Logger;)V

    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzo(Lcom/google/android/gms/internal/firebase-auth-api/zzacz;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;)V

    return-void
.end method

.method public final zzl(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaad;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zza:Lcom/google/android/gms/common/logging/Logger;

    .line 2
    invoke-direct {v1, p3, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaad;Lcom/google/android/gms/common/logging/Logger;)V

    invoke-virtual {v0, p1, p2, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzp(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;)V

    return-void
.end method

.method public final zzm(Lcom/google/android/gms/internal/firebase-auth-api/zzwc;Lcom/google/android/gms/internal/firebase-auth-api/zzaad;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwc;->zzb()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwc;->zza()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzadc;->zzb(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzadc;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zza:Lcom/google/android/gms/common/logging/Logger;

    .line 3
    invoke-direct {v1, p2, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaad;Lcom/google/android/gms/common/logging/Logger;)V

    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzq(Lcom/google/android/gms/internal/firebase-auth-api/zzadc;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;)V

    return-void
.end method

.method public final zzn(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaad;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 3
    invoke-static {p3}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    invoke-static {p4}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zza:Lcom/google/android/gms/common/logging/Logger;

    .line 5
    invoke-direct {v1, p4, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaad;Lcom/google/android/gms/common/logging/Logger;)V

    invoke-virtual {v0, p1, p2, p3, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;)V

    return-void
.end method

.method public final zzo(Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaec;Lcom/google/android/gms/internal/firebase-auth-api/zzaad;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-static {p3}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zza:Lcom/google/android/gms/common/logging/Logger;

    .line 4
    invoke-direct {v1, p3, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaad;Lcom/google/android/gms/common/logging/Logger;)V

    invoke-virtual {v0, p1, p2, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzs(Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaec;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;)V

    return-void
.end method

.method public final zzp(Lcom/google/android/gms/internal/firebase-auth-api/zzwd;Lcom/google/android/gms/internal/firebase-auth-api/zzaad;)V
    .locals 4

    .line 1
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwd;->zza()Lcom/google/firebase/auth/PhoneAuthCredential;

    move-result-object v0

    .line 3
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/auth/PhoneAuthCredential;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwd;->zzb()Ljava/lang/String;

    move-result-object p1

    .line 4
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    .line 5
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzabq;->zza(Lcom/google/firebase/auth/PhoneAuthCredential;)Lcom/google/android/gms/internal/firebase-auth-api/zzaej;

    move-result-object v0

    new-instance v2, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    sget-object v3, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zza:Lcom/google/android/gms/common/logging/Logger;

    invoke-direct {v2, p2, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaad;Lcom/google/android/gms/common/logging/Logger;)V

    .line 6
    invoke-virtual {v1, p1, v0, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzt(Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaej;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;)V

    return-void
.end method

.method public final zzq(Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaad;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zza:Lcom/google/android/gms/common/logging/Logger;

    .line 3
    invoke-direct {v1, p2, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaad;Lcom/google/android/gms/common/logging/Logger;)V

    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzu(Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;)V

    return-void
.end method

.method public final zzr(Lcom/google/android/gms/internal/firebase-auth-api/zzwe;Lcom/google/android/gms/internal/firebase-auth-api/zzaad;)V
    .locals 4

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwe;->zzb()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 3
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwe;->zzb()Ljava/lang/String;

    move-result-object v1

    .line 5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwe;->zza()Lcom/google/firebase/auth/ActionCodeSettings;

    move-result-object p1

    new-instance v2, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    sget-object v3, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zza:Lcom/google/android/gms/common/logging/Logger;

    invoke-direct {v2, p2, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaad;Lcom/google/android/gms/common/logging/Logger;)V

    .line 6
    invoke-virtual {v0, v1, p1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzv(Ljava/lang/String;Lcom/google/firebase/auth/ActionCodeSettings;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;)V

    return-void
.end method

.method public final zzs(Lcom/google/android/gms/internal/firebase-auth-api/zzwf;Lcom/google/android/gms/internal/firebase-auth-api/zzaad;)V
    .locals 7

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwf;->zzc()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 3
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwf;->zzc()Ljava/lang/String;

    move-result-object v2

    .line 5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwf;->zza()Lcom/google/firebase/auth/ActionCodeSettings;

    move-result-object v3

    .line 6
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwf;->zzd()Ljava/lang/String;

    move-result-object v4

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwf;->zzb()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    sget-object p1, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zza:Lcom/google/android/gms/common/logging/Logger;

    invoke-direct {v6, p2, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaad;Lcom/google/android/gms/common/logging/Logger;)V

    .line 8
    invoke-virtual/range {v1 .. v6}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzw(Ljava/lang/String;Lcom/google/firebase/auth/ActionCodeSettings;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;)V

    return-void
.end method

.method public final zzt(Lcom/google/android/gms/internal/firebase-auth-api/zzwg;Lcom/google/android/gms/internal/firebase-auth-api/zzaad;)V
    .locals 8

    .line 1
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwg;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzado;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzado;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzado;->zzd()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zza:Lcom/google/android/gms/common/logging/Logger;

    .line 5
    invoke-direct {v7, p2, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaad;Lcom/google/android/gms/common/logging/Logger;)V

    iget-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzaca;

    .line 6
    invoke-virtual {p2, v6}, Lcom/google/android/gms/internal/firebase-auth-api/zzaca;->zzk(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzado;->zzf()Z

    move-result p2

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzaca;

    .line 8
    invoke-virtual {p2, v6}, Lcom/google/android/gms/internal/firebase-auth-api/zzaca;->zzi(Ljava/lang/String;)V

    goto :goto_0

    .line 15
    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzaca;

    .line 16
    invoke-virtual {p1, v7, v6}, Lcom/google/android/gms/internal/firebase-auth-api/zzaca;->zzh(Lcom/google/android/gms/internal/firebase-auth-api/zzaae;Ljava/lang/String;)V

    return-void

    .line 9
    :cond_1
    :goto_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzado;->zzb()J

    move-result-wide v3

    .line 10
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzado;->zzg()Z

    move-result v5

    .line 11
    invoke-static {v3, v4, v5}, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzI(JZ)Z

    move-result p2

    if-eqz p2, :cond_2

    new-instance p2, Lcom/google/android/gms/internal/firebase-auth-api/zzacf;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzaca;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaca;->zzb()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p2, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzacf;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzado;->zze(Lcom/google/android/gms/internal/firebase-auth-api/zzacf;)V

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzaca;

    move-object v1, v6

    move-object v2, v7

    .line 13
    invoke-virtual/range {v0 .. v5}, Lcom/google/android/gms/internal/firebase-auth-api/zzaca;->zzj(Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;JZ)V

    iget-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzaca;

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzabx;

    .line 14
    invoke-direct {v1, v0, v7, v6}, Lcom/google/android/gms/internal/firebase-auth-api/zzabx;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaca;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;Ljava/lang/String;)V

    .line 15
    invoke-virtual {p2, p1, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzx(Lcom/google/android/gms/internal/firebase-auth-api/zzado;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;)V

    return-void
.end method

.method public final zzu(Lcom/google/android/gms/internal/firebase-auth-api/zzwh;Lcom/google/android/gms/internal/firebase-auth-api/zzaad;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwh;->zza()Ljava/lang/String;

    move-result-object p1

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zza:Lcom/google/android/gms/common/logging/Logger;

    invoke-direct {v1, p2, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaad;Lcom/google/android/gms/common/logging/Logger;)V

    .line 4
    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzy(Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;)V

    return-void
.end method

.method public final zzv(Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaad;)V
    .locals 3

    .line 1
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zza:Lcom/google/android/gms/common/logging/Logger;

    .line 2
    invoke-direct {v1, p2, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaad;Lcom/google/android/gms/common/logging/Logger;)V

    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzz(Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;)V

    return-void
.end method

.method public final zzw(Lcom/google/android/gms/internal/firebase-auth-api/zzaec;Lcom/google/android/gms/internal/firebase-auth-api/zzaad;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zza:Lcom/google/android/gms/common/logging/Logger;

    .line 3
    invoke-direct {v1, p2, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaad;Lcom/google/android/gms/common/logging/Logger;)V

    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzA(Lcom/google/android/gms/internal/firebase-auth-api/zzaec;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;)V

    return-void
.end method

.method public final zzx(Lcom/google/android/gms/internal/firebase-auth-api/zzaef;Lcom/google/android/gms/internal/firebase-auth-api/zzaad;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zza:Lcom/google/android/gms/common/logging/Logger;

    .line 3
    invoke-direct {v1, p2, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaad;Lcom/google/android/gms/common/logging/Logger;)V

    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzB(Lcom/google/android/gms/internal/firebase-auth-api/zzaef;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;)V

    return-void
.end method

.method public final zzy(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaad;)V
    .locals 6

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 3
    invoke-static {p5}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    invoke-static {p5}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    new-instance v5, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    sget-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zza:Lcom/google/android/gms/common/logging/Logger;

    .line 5
    invoke-direct {v5, p5, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaad;Lcom/google/android/gms/common/logging/Logger;)V

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzC(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;)V

    return-void
.end method

.method public final zzz(Lcom/google/android/gms/internal/firebase-auth-api/zzwi;Lcom/google/android/gms/internal/firebase-auth-api/zzaad;)V
    .locals 4

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwi;->zza()Lcom/google/firebase/auth/EmailAuthCredential;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzyh;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwi;->zza()Lcom/google/firebase/auth/EmailAuthCredential;

    move-result-object v1

    .line 5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwi;->zzb()Ljava/lang/String;

    move-result-object p1

    new-instance v2, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;

    sget-object v3, Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;->zza:Lcom/google/android/gms/common/logging/Logger;

    invoke-direct {v2, p2, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzaae;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaad;Lcom/google/android/gms/common/logging/Logger;)V

    .line 6
    invoke-virtual {v0, v1, p1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzD(Lcom/google/firebase/auth/EmailAuthCredential;Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaae;)V

    return-void
.end method
