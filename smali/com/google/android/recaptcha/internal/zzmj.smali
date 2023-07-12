.class public final Lcom/google/android/recaptcha/internal/zzmj;
.super Lcom/google/android/recaptcha/internal/zzgo;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"

# interfaces
.implements Lcom/google/android/recaptcha/internal/zzhz;


# static fields
.field private static final zzb:Lcom/google/android/recaptcha/internal/zzmj;


# instance fields
.field private zzd:I

.field private zze:I

.field private zzf:I

.field private zzg:I

.field private zzh:Lcom/google/android/recaptcha/internal/zzlx;

.field private zzi:I

.field private zzj:Lcom/google/android/recaptcha/internal/zzlu;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/recaptcha/internal/zzmj;

    invoke-direct {v0}, Lcom/google/android/recaptcha/internal/zzmj;-><init>()V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzmj;->zzb:Lcom/google/android/recaptcha/internal/zzmj;

    const-class v1, Lcom/google/android/recaptcha/internal/zzmj;

    invoke-static {v1, v0}, Lcom/google/android/recaptcha/internal/zzgo;->zzC(Ljava/lang/Class;Lcom/google/android/recaptcha/internal/zzgo;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/recaptcha/internal/zzgo;-><init>()V

    return-void
.end method

.method static synthetic zzG(Lcom/google/android/recaptcha/internal/zzmj;I)V
    .locals 1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    add-int/lit8 p1, p1, -0x2

    .line 1
    iput p1, p0, Lcom/google/android/recaptcha/internal/zzmj;->zzd:I

    return-void

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Can\'t get the number of an unknown enum value."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static synthetic zzH(Lcom/google/android/recaptcha/internal/zzmj;I)V
    .locals 1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    add-int/lit8 p1, p1, -0x2

    .line 1
    iput p1, p0, Lcom/google/android/recaptcha/internal/zzmj;->zzf:I

    return-void

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Can\'t get the number of an unknown enum value."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static zzf()Lcom/google/android/recaptcha/internal/zzmi;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/recaptcha/internal/zzmj;->zzb:Lcom/google/android/recaptcha/internal/zzmj;

    invoke-virtual {v0}, Lcom/google/android/recaptcha/internal/zzgo;->zzp()Lcom/google/android/recaptcha/internal/zzgi;

    move-result-object v0

    check-cast v0, Lcom/google/android/recaptcha/internal/zzmi;

    return-object v0
.end method

.method static synthetic zzg()Lcom/google/android/recaptcha/internal/zzmj;
    .locals 1

    sget-object v0, Lcom/google/android/recaptcha/internal/zzmj;->zzb:Lcom/google/android/recaptcha/internal/zzmj;

    return-object v0
.end method

.method static synthetic zzi(Lcom/google/android/recaptcha/internal/zzmj;I)V
    .locals 0

    iput p1, p0, Lcom/google/android/recaptcha/internal/zzmj;->zze:I

    return-void
.end method


# virtual methods
.method protected final zzh(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    add-int/lit8 p1, p1, -0x1

    const/4 p2, 0x1

    if-eqz p1, :cond_4

    const/4 p3, 0x5

    const/4 v0, 0x4

    const/4 v1, 0x3

    const/4 v2, 0x2

    if-eq p1, v2, :cond_3

    if-eq p1, v1, :cond_2

    const/4 p2, 0x0

    if-eq p1, v0, :cond_1

    if-eq p1, p3, :cond_0

    return-object p2

    .line 1
    :cond_0
    sget-object p1, Lcom/google/android/recaptcha/internal/zzmj;->zzb:Lcom/google/android/recaptcha/internal/zzmj;

    return-object p1

    :cond_1
    new-instance p1, Lcom/google/android/recaptcha/internal/zzmi;

    .line 3
    invoke-direct {p1, p2}, Lcom/google/android/recaptcha/internal/zzmi;-><init>(Lcom/google/android/recaptcha/internal/zzlv;)V

    return-object p1

    :cond_2
    new-instance p1, Lcom/google/android/recaptcha/internal/zzmj;

    invoke-direct {p1}, Lcom/google/android/recaptcha/internal/zzmj;-><init>()V

    return-object p1

    :cond_3
    const/4 p1, 0x7

    new-array p1, p1, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string v4, "zzd"

    aput-object v4, p1, v3

    const-string v3, "zze"

    aput-object v3, p1, p2

    const-string p2, "zzf"

    aput-object p2, p1, v2

    const-string p2, "zzg"

    aput-object p2, p1, v1

    const-string p2, "zzh"

    aput-object p2, p1, v0

    const-string p2, "zzi"

    aput-object p2, p1, p3

    const/4 p2, 0x6

    const-string p3, "zzj"

    aput-object p3, p1, p2

    .line 2
    sget-object p2, Lcom/google/android/recaptcha/internal/zzmj;->zzb:Lcom/google/android/recaptcha/internal/zzmj;

    const-string p3, "\u0000\u0007\u0000\u0000\u0001\u0007\u0007\u0000\u0000\u0000\u0001\u000c\u0002\u000b\u0003\u000c\u0004\u000c\u0005\t\u0006\u000b\u0007\t"

    invoke-static {p2, p3, p1}, Lcom/google/android/recaptcha/internal/zzmj;->zzz(Lcom/google/android/recaptcha/internal/zzhy;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 1
    :cond_4
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1
.end method

.method public final zzj()I
    .locals 1

    iget v0, p0, Lcom/google/android/recaptcha/internal/zzmj;->zzf:I

    packed-switch v0, :pswitch_data_0

    const/4 v0, 0x0

    goto/16 :goto_0

    :pswitch_0
    const/16 v0, 0x30

    goto/16 :goto_0

    :pswitch_1
    const/16 v0, 0x2f

    goto/16 :goto_0

    :pswitch_2
    const/16 v0, 0x2e

    goto/16 :goto_0

    :pswitch_3
    const/16 v0, 0x2d

    goto/16 :goto_0

    :pswitch_4
    const/16 v0, 0x2c

    goto/16 :goto_0

    :pswitch_5
    const/16 v0, 0x2b

    goto/16 :goto_0

    :pswitch_6
    const/16 v0, 0x2a

    goto/16 :goto_0

    :pswitch_7
    const/16 v0, 0x29

    goto/16 :goto_0

    :pswitch_8
    const/16 v0, 0x28

    goto/16 :goto_0

    :pswitch_9
    const/16 v0, 0x27

    goto/16 :goto_0

    :pswitch_a
    const/16 v0, 0x26

    goto/16 :goto_0

    :pswitch_b
    const/16 v0, 0x25

    goto/16 :goto_0

    :pswitch_c
    const/16 v0, 0x24

    goto/16 :goto_0

    :pswitch_d
    const/16 v0, 0x23

    goto/16 :goto_0

    :pswitch_e
    const/16 v0, 0x22

    goto/16 :goto_0

    :pswitch_f
    const/16 v0, 0x21

    goto/16 :goto_0

    :pswitch_10
    const/16 v0, 0x20

    goto/16 :goto_0

    :pswitch_11
    const/16 v0, 0x1f

    goto/16 :goto_0

    :pswitch_12
    const/16 v0, 0x1e

    goto/16 :goto_0

    :pswitch_13
    const/16 v0, 0x1d

    goto/16 :goto_0

    :pswitch_14
    const/16 v0, 0x1c

    goto :goto_0

    :pswitch_15
    const/16 v0, 0x1b

    goto :goto_0

    :pswitch_16
    const/16 v0, 0x1a

    goto :goto_0

    :pswitch_17
    const/16 v0, 0x19

    goto :goto_0

    :pswitch_18
    const/16 v0, 0x18

    goto :goto_0

    :pswitch_19
    const/16 v0, 0x17

    goto :goto_0

    :pswitch_1a
    const/16 v0, 0x16

    goto :goto_0

    :pswitch_1b
    const/16 v0, 0x15

    goto :goto_0

    :pswitch_1c
    const/16 v0, 0x14

    goto :goto_0

    :pswitch_1d
    const/16 v0, 0x13

    goto :goto_0

    :pswitch_1e
    const/16 v0, 0x12

    goto :goto_0

    :pswitch_1f
    const/16 v0, 0x11

    goto :goto_0

    :pswitch_20
    const/16 v0, 0x10

    goto :goto_0

    :pswitch_21
    const/16 v0, 0xf

    goto :goto_0

    :pswitch_22
    const/16 v0, 0xe

    goto :goto_0

    :pswitch_23
    const/16 v0, 0xd

    goto :goto_0

    :pswitch_24
    const/16 v0, 0xc

    goto :goto_0

    :pswitch_25
    const/16 v0, 0xb

    goto :goto_0

    :pswitch_26
    const/16 v0, 0xa

    goto :goto_0

    :pswitch_27
    const/16 v0, 0x9

    goto :goto_0

    :pswitch_28
    const/16 v0, 0x8

    goto :goto_0

    :pswitch_29
    const/4 v0, 0x7

    goto :goto_0

    :pswitch_2a
    const/4 v0, 0x6

    goto :goto_0

    :pswitch_2b
    const/4 v0, 0x5

    goto :goto_0

    :pswitch_2c
    const/4 v0, 0x4

    goto :goto_0

    :pswitch_2d
    const/4 v0, 0x3

    goto :goto_0

    :pswitch_2e
    const/4 v0, 0x2

    :goto_0
    if-nez v0, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
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

.method public final zzk()I
    .locals 1

    iget v0, p0, Lcom/google/android/recaptcha/internal/zzmj;->zzd:I

    packed-switch v0, :pswitch_data_0

    const/4 v0, 0x0

    goto :goto_0

    :pswitch_0
    const/16 v0, 0xc

    goto :goto_0

    :pswitch_1
    const/16 v0, 0xb

    goto :goto_0

    :pswitch_2
    const/16 v0, 0xa

    goto :goto_0

    :pswitch_3
    const/16 v0, 0x9

    goto :goto_0

    :pswitch_4
    const/16 v0, 0x8

    goto :goto_0

    :pswitch_5
    const/4 v0, 0x7

    goto :goto_0

    :pswitch_6
    const/4 v0, 0x6

    goto :goto_0

    :pswitch_7
    const/4 v0, 0x5

    goto :goto_0

    :pswitch_8
    const/4 v0, 0x4

    goto :goto_0

    :pswitch_9
    const/4 v0, 0x3

    goto :goto_0

    :pswitch_a
    const/4 v0, 0x2

    :goto_0
    if-nez v0, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
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
