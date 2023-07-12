.class final Lcom/google/android/recaptcha/internal/zzhq;
.super Ljava/lang/Object;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"

# interfaces
.implements Lcom/google/android/recaptcha/internal/zzim;


# static fields
.field private static final zza:Lcom/google/android/recaptcha/internal/zzhw;


# instance fields
.field private final zzb:Lcom/google/android/recaptcha/internal/zzhw;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/recaptcha/internal/zzho;

    invoke-direct {v0}, Lcom/google/android/recaptcha/internal/zzho;-><init>()V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzhq;->zza:Lcom/google/android/recaptcha/internal/zzhw;

    return-void
.end method

.method public constructor <init>()V
    .locals 6

    .line 1
    new-instance v0, Lcom/google/android/recaptcha/internal/zzhp;

    const/4 v1, 0x2

    new-array v1, v1, [Lcom/google/android/recaptcha/internal/zzhw;

    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgh;->zza()Lcom/google/android/recaptcha/internal/zzgh;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    :try_start_0
    const-string v2, "com.google.protobuf.DescriptorMessageInfoFactory"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const-string v4, "getInstance"

    new-array v5, v3, [Ljava/lang/Class;

    .line 2
    invoke-virtual {v2, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    const/4 v4, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v4, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/recaptcha/internal/zzhw;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 3
    :catch_0
    sget-object v2, Lcom/google/android/recaptcha/internal/zzhq;->zza:Lcom/google/android/recaptcha/internal/zzhw;

    :goto_0
    const/4 v3, 0x1

    aput-object v2, v1, v3

    .line 2
    invoke-direct {v0, v1}, Lcom/google/android/recaptcha/internal/zzhp;-><init>([Lcom/google/android/recaptcha/internal/zzhw;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    sget-object v1, Lcom/google/android/recaptcha/internal/zzgw;->zzd:[B

    iput-object v0, p0, Lcom/google/android/recaptcha/internal/zzhq;->zzb:Lcom/google/android/recaptcha/internal/zzhw;

    return-void
.end method

.method private static zzb(Lcom/google/android/recaptcha/internal/zzhv;)Z
    .locals 1

    .line 1
    invoke-interface {p0}, Lcom/google/android/recaptcha/internal/zzhv;->zzc()I

    move-result p0

    const/4 v0, 0x1

    if-ne p0, v0, :cond_0

    return v0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public final zza(Ljava/lang/Class;)Lcom/google/android/recaptcha/internal/zzil;
    .locals 8

    .line 1
    invoke-static {p1}, Lcom/google/android/recaptcha/internal/zzin;->zzF(Ljava/lang/Class;)V

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzhq;->zzb:Lcom/google/android/recaptcha/internal/zzhw;

    .line 2
    invoke-interface {v0, p1}, Lcom/google/android/recaptcha/internal/zzhw;->zzb(Ljava/lang/Class;)Lcom/google/android/recaptcha/internal/zzhv;

    move-result-object v2

    .line 3
    invoke-interface {v2}, Lcom/google/android/recaptcha/internal/zzhv;->zzb()Z

    move-result v0

    if-eqz v0, :cond_1

    const-class v0, Lcom/google/android/recaptcha/internal/zzgo;

    .line 25
    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-static {}, Lcom/google/android/recaptcha/internal/zzin;->zzA()Lcom/google/android/recaptcha/internal/zzjf;

    move-result-object p1

    .line 26
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgc;->zzb()Lcom/google/android/recaptcha/internal/zzga;

    move-result-object v0

    .line 27
    invoke-interface {v2}, Lcom/google/android/recaptcha/internal/zzhv;->zza()Lcom/google/android/recaptcha/internal/zzhy;

    move-result-object v1

    .line 28
    invoke-static {p1, v0, v1}, Lcom/google/android/recaptcha/internal/zzic;->zzc(Lcom/google/android/recaptcha/internal/zzjf;Lcom/google/android/recaptcha/internal/zzga;Lcom/google/android/recaptcha/internal/zzhy;)Lcom/google/android/recaptcha/internal/zzic;

    move-result-object p1

    return-object p1

    :cond_0
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzin;->zzy()Lcom/google/android/recaptcha/internal/zzjf;

    move-result-object p1

    .line 29
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgc;->zza()Lcom/google/android/recaptcha/internal/zzga;

    move-result-object v0

    .line 30
    invoke-interface {v2}, Lcom/google/android/recaptcha/internal/zzhv;->zza()Lcom/google/android/recaptcha/internal/zzhy;

    move-result-object v1

    .line 31
    invoke-static {p1, v0, v1}, Lcom/google/android/recaptcha/internal/zzic;->zzc(Lcom/google/android/recaptcha/internal/zzjf;Lcom/google/android/recaptcha/internal/zzga;Lcom/google/android/recaptcha/internal/zzhy;)Lcom/google/android/recaptcha/internal/zzic;

    move-result-object p1

    return-object p1

    :cond_1
    const-class v0, Lcom/google/android/recaptcha/internal/zzgo;

    .line 4
    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 5
    invoke-static {v2}, Lcom/google/android/recaptcha/internal/zzhq;->zzb(Lcom/google/android/recaptcha/internal/zzhv;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 6
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzif;->zzb()Lcom/google/android/recaptcha/internal/zzie;

    move-result-object v3

    .line 7
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzhm;->zze()Lcom/google/android/recaptcha/internal/zzhm;

    move-result-object v4

    invoke-static {}, Lcom/google/android/recaptcha/internal/zzin;->zzA()Lcom/google/android/recaptcha/internal/zzjf;

    move-result-object v5

    .line 8
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgc;->zzb()Lcom/google/android/recaptcha/internal/zzga;

    move-result-object v6

    .line 9
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzhu;->zzb()Lcom/google/android/recaptcha/internal/zzht;

    move-result-object v7

    move-object v1, p1

    .line 10
    invoke-static/range {v1 .. v7}, Lcom/google/android/recaptcha/internal/zzib;->zzm(Ljava/lang/Class;Lcom/google/android/recaptcha/internal/zzhv;Lcom/google/android/recaptcha/internal/zzie;Lcom/google/android/recaptcha/internal/zzhm;Lcom/google/android/recaptcha/internal/zzjf;Lcom/google/android/recaptcha/internal/zzga;Lcom/google/android/recaptcha/internal/zzht;)Lcom/google/android/recaptcha/internal/zzib;

    move-result-object p1

    goto :goto_0

    .line 11
    :cond_2
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzif;->zzb()Lcom/google/android/recaptcha/internal/zzie;

    move-result-object v3

    .line 12
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzhm;->zze()Lcom/google/android/recaptcha/internal/zzhm;

    move-result-object v4

    invoke-static {}, Lcom/google/android/recaptcha/internal/zzin;->zzA()Lcom/google/android/recaptcha/internal/zzjf;

    move-result-object v5

    const/4 v6, 0x0

    .line 13
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzhu;->zzb()Lcom/google/android/recaptcha/internal/zzht;

    move-result-object v7

    move-object v1, p1

    .line 14
    invoke-static/range {v1 .. v7}, Lcom/google/android/recaptcha/internal/zzib;->zzm(Ljava/lang/Class;Lcom/google/android/recaptcha/internal/zzhv;Lcom/google/android/recaptcha/internal/zzie;Lcom/google/android/recaptcha/internal/zzhm;Lcom/google/android/recaptcha/internal/zzjf;Lcom/google/android/recaptcha/internal/zzga;Lcom/google/android/recaptcha/internal/zzht;)Lcom/google/android/recaptcha/internal/zzib;

    move-result-object p1

    goto :goto_0

    .line 15
    :cond_3
    invoke-static {v2}, Lcom/google/android/recaptcha/internal/zzhq;->zzb(Lcom/google/android/recaptcha/internal/zzhv;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 16
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzif;->zza()Lcom/google/android/recaptcha/internal/zzie;

    move-result-object v3

    .line 17
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzhm;->zzd()Lcom/google/android/recaptcha/internal/zzhm;

    move-result-object v4

    invoke-static {}, Lcom/google/android/recaptcha/internal/zzin;->zzy()Lcom/google/android/recaptcha/internal/zzjf;

    move-result-object v5

    .line 18
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzgc;->zza()Lcom/google/android/recaptcha/internal/zzga;

    move-result-object v6

    .line 19
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzhu;->zza()Lcom/google/android/recaptcha/internal/zzht;

    move-result-object v7

    move-object v1, p1

    .line 20
    invoke-static/range {v1 .. v7}, Lcom/google/android/recaptcha/internal/zzib;->zzm(Ljava/lang/Class;Lcom/google/android/recaptcha/internal/zzhv;Lcom/google/android/recaptcha/internal/zzie;Lcom/google/android/recaptcha/internal/zzhm;Lcom/google/android/recaptcha/internal/zzjf;Lcom/google/android/recaptcha/internal/zzga;Lcom/google/android/recaptcha/internal/zzht;)Lcom/google/android/recaptcha/internal/zzib;

    move-result-object p1

    goto :goto_0

    .line 21
    :cond_4
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzif;->zza()Lcom/google/android/recaptcha/internal/zzie;

    move-result-object v3

    .line 22
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzhm;->zzd()Lcom/google/android/recaptcha/internal/zzhm;

    move-result-object v4

    invoke-static {}, Lcom/google/android/recaptcha/internal/zzin;->zzz()Lcom/google/android/recaptcha/internal/zzjf;

    move-result-object v5

    const/4 v6, 0x0

    .line 23
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzhu;->zza()Lcom/google/android/recaptcha/internal/zzht;

    move-result-object v7

    move-object v1, p1

    .line 24
    invoke-static/range {v1 .. v7}, Lcom/google/android/recaptcha/internal/zzib;->zzm(Ljava/lang/Class;Lcom/google/android/recaptcha/internal/zzhv;Lcom/google/android/recaptcha/internal/zzie;Lcom/google/android/recaptcha/internal/zzhm;Lcom/google/android/recaptcha/internal/zzjf;Lcom/google/android/recaptcha/internal/zzga;Lcom/google/android/recaptcha/internal/zzht;)Lcom/google/android/recaptcha/internal/zzib;

    move-result-object p1

    :goto_0
    return-object p1
.end method
