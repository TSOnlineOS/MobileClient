.class public final Lcom/google/android/recaptcha/internal/zzmu;
.super Lcom/google/android/recaptcha/internal/zzgo;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"

# interfaces
.implements Lcom/google/android/recaptcha/internal/zzhz;


# static fields
.field private static final zzb:Lcom/google/android/recaptcha/internal/zzmu;


# instance fields
.field private zzd:I

.field private zze:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/recaptcha/internal/zzmu;

    invoke-direct {v0}, Lcom/google/android/recaptcha/internal/zzmu;-><init>()V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzmu;->zzb:Lcom/google/android/recaptcha/internal/zzmu;

    const-class v1, Lcom/google/android/recaptcha/internal/zzmu;

    invoke-static {v1, v0}, Lcom/google/android/recaptcha/internal/zzgo;->zzC(Ljava/lang/Class;Lcom/google/android/recaptcha/internal/zzgo;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/recaptcha/internal/zzgo;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/recaptcha/internal/zzmu;->zzd:I

    return-void
.end method

.method static synthetic zzI()Lcom/google/android/recaptcha/internal/zzmu;
    .locals 1

    sget-object v0, Lcom/google/android/recaptcha/internal/zzmu;->zzb:Lcom/google/android/recaptcha/internal/zzmu;

    return-object v0
.end method


# virtual methods
.method public final zzG()J
    .locals 2

    .line 1
    iget v0, p0, Lcom/google/android/recaptcha/internal/zzmu;->zzd:I

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzmu;->zze:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0

    :cond_0
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public final zzH()Lcom/google/android/recaptcha/internal/zzez;
    .locals 2

    .line 1
    iget v0, p0, Lcom/google/android/recaptcha/internal/zzmu;->zzd:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzmu;->zze:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/recaptcha/internal/zzez;

    return-object v0

    .line 2
    :cond_0
    sget-object v0, Lcom/google/android/recaptcha/internal/zzez;->zzb:Lcom/google/android/recaptcha/internal/zzez;

    return-object v0
.end method

.method public final zzJ()Ljava/lang/String;
    .locals 2

    .line 1
    iget v0, p0, Lcom/google/android/recaptcha/internal/zzmu;->zzd:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzmu;->zze:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    return-object v0

    :cond_0
    const-string v0, ""

    return-object v0
.end method

.method public final zzK()Ljava/lang/String;
    .locals 2

    .line 1
    iget v0, p0, Lcom/google/android/recaptcha/internal/zzmu;->zzd:I

    const/16 v1, 0xc

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzmu;->zze:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    return-object v0

    :cond_0
    const-string v0, ""

    return-object v0
.end method

.method public final zzL()Z
    .locals 2

    .line 1
    iget v0, p0, Lcom/google/android/recaptcha/internal/zzmu;->zzd:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzmu;->zze:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final zzM()Z
    .locals 2

    iget v0, p0, Lcom/google/android/recaptcha/internal/zzmu;->zzd:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final zzN()I
    .locals 1

    iget v0, p0, Lcom/google/android/recaptcha/internal/zzmu;->zzd:I

    packed-switch v0, :pswitch_data_0

    const/4 v0, 0x0

    return v0

    :pswitch_0
    const/16 v0, 0xf

    return v0

    :pswitch_1
    const/16 v0, 0xe

    return v0

    :pswitch_2
    const/16 v0, 0xd

    return v0

    :pswitch_3
    const/16 v0, 0xc

    return v0

    :pswitch_4
    const/16 v0, 0xb

    return v0

    :pswitch_5
    const/16 v0, 0xa

    return v0

    :pswitch_6
    const/16 v0, 0x9

    return v0

    :pswitch_7
    const/16 v0, 0x8

    return v0

    :pswitch_8
    const/4 v0, 0x7

    return v0

    :pswitch_9
    const/4 v0, 0x6

    return v0

    :pswitch_a
    const/4 v0, 0x5

    return v0

    :pswitch_b
    const/4 v0, 0x4

    return v0

    :pswitch_c
    const/4 v0, 0x3

    return v0

    :pswitch_d
    const/4 v0, 0x2

    return v0

    :pswitch_e
    const/4 v0, 0x1

    return v0

    :pswitch_f
    const/16 v0, 0x10

    return v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final zzf()D
    .locals 2

    .line 1
    iget v0, p0, Lcom/google/android/recaptcha/internal/zzmu;->zzd:I

    const/16 v1, 0xb

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzmu;->zze:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    return-wide v0

    :cond_0
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public final zzg()F
    .locals 2

    .line 1
    iget v0, p0, Lcom/google/android/recaptcha/internal/zzmu;->zzd:I

    const/16 v1, 0xa

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzmu;->zze:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method protected final zzh(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    add-int/lit8 p1, p1, -0x1

    const/4 p2, 0x1

    if-eqz p1, :cond_4

    const/4 p3, 0x2

    if-eq p1, p3, :cond_3

    const/4 p2, 0x3

    if-eq p1, p2, :cond_2

    const/4 p2, 0x4

    const/4 p3, 0x0

    if-eq p1, p2, :cond_1

    const/4 p2, 0x5

    if-eq p1, p2, :cond_0

    return-object p3

    .line 1
    :cond_0
    sget-object p1, Lcom/google/android/recaptcha/internal/zzmu;->zzb:Lcom/google/android/recaptcha/internal/zzmu;

    return-object p1

    :cond_1
    new-instance p1, Lcom/google/android/recaptcha/internal/zzmt;

    .line 3
    invoke-direct {p1, p3}, Lcom/google/android/recaptcha/internal/zzmt;-><init>(Lcom/google/android/recaptcha/internal/zzlv;)V

    return-object p1

    :cond_2
    new-instance p1, Lcom/google/android/recaptcha/internal/zzmu;

    invoke-direct {p1}, Lcom/google/android/recaptcha/internal/zzmu;-><init>()V

    return-object p1

    :cond_3
    new-array p1, p3, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "zze"

    aput-object v0, p1, p3

    const-string p3, "zzd"

    aput-object p3, p1, p2

    .line 2
    sget-object p2, Lcom/google/android/recaptcha/internal/zzmu;->zzb:Lcom/google/android/recaptcha/internal/zzmu;

    const-string p3, "\u0000\u000f\u0001\u0000\u0001\u000f\u000f\u0000\u0000\u0000\u0001>\u0000\u0002:\u0000\u0003=\u0000\u0004\u023b\u0000\u0005B\u0000\u0006B\u0000\u0007>\u0000\u0008C\u0000\t6\u0000\n4\u0000\u000b3\u0000\u000c\u023b\u0000\r:\u0000\u000e?\u0000\u000f?\u0000"

    invoke-static {p2, p3, p1}, Lcom/google/android/recaptcha/internal/zzmu;->zzz(Lcom/google/android/recaptcha/internal/zzhy;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 1
    :cond_4
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1
.end method

.method public final zzi()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/google/android/recaptcha/internal/zzmu;->zzd:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzmu;->zze:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final zzj()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/google/android/recaptcha/internal/zzmu;->zzd:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzmu;->zze:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final zzk()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/google/android/recaptcha/internal/zzmu;->zzd:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzmu;->zze:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method
