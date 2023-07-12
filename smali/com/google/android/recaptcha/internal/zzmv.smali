.class public final Lcom/google/android/recaptcha/internal/zzmv;
.super Lcom/google/android/recaptcha/internal/zzgo;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"

# interfaces
.implements Lcom/google/android/recaptcha/internal/zzhz;


# static fields
.field public static final zzb:Lcom/google/android/recaptcha/internal/zzgm;

.field public static final zzd:Lcom/google/android/recaptcha/internal/zzgm;

.field private static final zze:Lcom/google/android/recaptcha/internal/zzmv;


# instance fields
.field private zzf:I

.field private zzg:I

.field private zzh:Lcom/google/android/recaptcha/internal/zzgv;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 1
    new-instance v0, Lcom/google/android/recaptcha/internal/zzmv;

    invoke-direct {v0}, Lcom/google/android/recaptcha/internal/zzmv;-><init>()V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzmv;->zze:Lcom/google/android/recaptcha/internal/zzmv;

    const-class v1, Lcom/google/android/recaptcha/internal/zzmv;

    .line 2
    invoke-static {v1, v0}, Lcom/google/android/recaptcha/internal/zzgo;->zzC(Ljava/lang/Class;Lcom/google/android/recaptcha/internal/zzgo;)V

    .line 3
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzfo;->zzg()Lcom/google/android/recaptcha/internal/zzfo;

    move-result-object v2

    sget-object v7, Lcom/google/android/recaptcha/internal/zzjv;->zzi:Lcom/google/android/recaptcha/internal/zzjv;

    const-class v8, Ljava/lang/String;

    const-string v3, ""

    const/4 v4, 0x0

    const/4 v5, 0x0

    const v6, 0x1d40a2d3

    .line 4
    invoke-static/range {v2 .. v8}, Lcom/google/android/recaptcha/internal/zzgo;->zzq(Lcom/google/android/recaptcha/internal/zzhy;Ljava/lang/Object;Lcom/google/android/recaptcha/internal/zzhy;Lcom/google/android/recaptcha/internal/zzgr;ILcom/google/android/recaptcha/internal/zzjv;Ljava/lang/Class;)Lcom/google/android/recaptcha/internal/zzgm;

    move-result-object v0

    sput-object v0, Lcom/google/android/recaptcha/internal/zzmv;->zzb:Lcom/google/android/recaptcha/internal/zzgm;

    invoke-static {}, Lcom/google/android/recaptcha/internal/zzfo;->zzg()Lcom/google/android/recaptcha/internal/zzfo;

    move-result-object v1

    sget-object v6, Lcom/google/android/recaptcha/internal/zzjv;->zzi:Lcom/google/android/recaptcha/internal/zzjv;

    const-class v7, Ljava/lang/String;

    const-string v2, ""

    const/4 v3, 0x0

    const v5, 0x1d40a2d4

    .line 5
    invoke-static/range {v1 .. v7}, Lcom/google/android/recaptcha/internal/zzgo;->zzq(Lcom/google/android/recaptcha/internal/zzhy;Ljava/lang/Object;Lcom/google/android/recaptcha/internal/zzhy;Lcom/google/android/recaptcha/internal/zzgr;ILcom/google/android/recaptcha/internal/zzjv;Ljava/lang/Class;)Lcom/google/android/recaptcha/internal/zzgm;

    move-result-object v0

    sput-object v0, Lcom/google/android/recaptcha/internal/zzmv;->zzd:Lcom/google/android/recaptcha/internal/zzgm;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/recaptcha/internal/zzgo;-><init>()V

    .line 2
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzmv;->zzw()Lcom/google/android/recaptcha/internal/zzgv;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/recaptcha/internal/zzmv;->zzh:Lcom/google/android/recaptcha/internal/zzgv;

    return-void
.end method

.method static synthetic zzi()Lcom/google/android/recaptcha/internal/zzmv;
    .locals 1

    sget-object v0, Lcom/google/android/recaptcha/internal/zzmv;->zze:Lcom/google/android/recaptcha/internal/zzmv;

    return-object v0
.end method


# virtual methods
.method public final zzf()I
    .locals 1

    iget v0, p0, Lcom/google/android/recaptcha/internal/zzmv;->zzf:I

    return v0
.end method

.method public final zzg()I
    .locals 1

    iget v0, p0, Lcom/google/android/recaptcha/internal/zzmv;->zzg:I

    return v0
.end method

.method protected final zzh(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    add-int/lit8 p1, p1, -0x1

    const/4 p2, 0x1

    if-eqz p1, :cond_4

    const/4 p3, 0x4

    const/4 v0, 0x3

    const/4 v1, 0x2

    if-eq p1, v1, :cond_3

    if-eq p1, v0, :cond_2

    const/4 p2, 0x0

    if-eq p1, p3, :cond_1

    const/4 p3, 0x5

    if-eq p1, p3, :cond_0

    return-object p2

    .line 1
    :cond_0
    sget-object p1, Lcom/google/android/recaptcha/internal/zzmv;->zze:Lcom/google/android/recaptcha/internal/zzmv;

    return-object p1

    :cond_1
    new-instance p1, Lcom/google/android/recaptcha/internal/zzmq;

    .line 3
    invoke-direct {p1, p2}, Lcom/google/android/recaptcha/internal/zzmq;-><init>(Lcom/google/android/recaptcha/internal/zzlv;)V

    return-object p1

    :cond_2
    new-instance p1, Lcom/google/android/recaptcha/internal/zzmv;

    .line 4
    invoke-direct {p1}, Lcom/google/android/recaptcha/internal/zzmv;-><init>()V

    return-object p1

    :cond_3
    new-array p1, p3, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v2, "zzf"

    aput-object v2, p1, p3

    const-string p3, "zzg"

    aput-object p3, p1, p2

    const-string p2, "zzh"

    aput-object p2, p1, v1

    .line 2
    const-class p2, Lcom/google/android/recaptcha/internal/zzmu;

    aput-object p2, p1, v0

    sget-object p2, Lcom/google/android/recaptcha/internal/zzmv;->zze:Lcom/google/android/recaptcha/internal/zzmv;

    const-string p3, "\u0000\u0003\u0000\u0000\u0001\u0003\u0003\u0000\u0001\u0000\u0001\u000c\u0002\u000b\u0003\u001b"

    invoke-static {p2, p3, p1}, Lcom/google/android/recaptcha/internal/zzmv;->zzz(Lcom/google/android/recaptcha/internal/zzhy;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 1
    :cond_4
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1
.end method

.method public final zzj()Ljava/util/List;
    .locals 1

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzmv;->zzh:Lcom/google/android/recaptcha/internal/zzgv;

    return-object v0
.end method

.method public final zzk()I
    .locals 1

    iget v0, p0, Lcom/google/android/recaptcha/internal/zzmv;->zzf:I

    packed-switch v0, :pswitch_data_0

    const/4 v0, 0x0

    goto/16 :goto_0

    :pswitch_0
    const/16 v0, 0x2a

    goto/16 :goto_0

    :pswitch_1
    const/16 v0, 0x29

    goto/16 :goto_0

    :pswitch_2
    const/16 v0, 0x28

    goto/16 :goto_0

    :pswitch_3
    const/16 v0, 0x27

    goto/16 :goto_0

    :pswitch_4
    const/16 v0, 0x26

    goto/16 :goto_0

    :pswitch_5
    const/16 v0, 0x25

    goto/16 :goto_0

    :pswitch_6
    const/16 v0, 0x24

    goto/16 :goto_0

    :pswitch_7
    const/16 v0, 0x23

    goto/16 :goto_0

    :pswitch_8
    const/16 v0, 0x22

    goto/16 :goto_0

    :pswitch_9
    const/16 v0, 0x21

    goto/16 :goto_0

    :pswitch_a
    const/16 v0, 0x20

    goto/16 :goto_0

    :pswitch_b
    const/16 v0, 0x1f

    goto/16 :goto_0

    :pswitch_c
    const/16 v0, 0x1e

    goto/16 :goto_0

    :pswitch_d
    const/16 v0, 0x1d

    goto/16 :goto_0

    :pswitch_e
    const/16 v0, 0x1c

    goto :goto_0

    :pswitch_f
    const/16 v0, 0x1b

    goto :goto_0

    :pswitch_10
    const/16 v0, 0x1a

    goto :goto_0

    :pswitch_11
    const/16 v0, 0x19

    goto :goto_0

    :pswitch_12
    const/16 v0, 0x18

    goto :goto_0

    :pswitch_13
    const/16 v0, 0x17

    goto :goto_0

    :pswitch_14
    const/16 v0, 0x16

    goto :goto_0

    :pswitch_15
    const/16 v0, 0x15

    goto :goto_0

    :pswitch_16
    const/16 v0, 0x14

    goto :goto_0

    :pswitch_17
    const/16 v0, 0x13

    goto :goto_0

    :pswitch_18
    const/16 v0, 0x12

    goto :goto_0

    :pswitch_19
    const/16 v0, 0x11

    goto :goto_0

    :pswitch_1a
    const/16 v0, 0x10

    goto :goto_0

    :pswitch_1b
    const/16 v0, 0xf

    goto :goto_0

    :pswitch_1c
    const/16 v0, 0xe

    goto :goto_0

    :pswitch_1d
    const/16 v0, 0xd

    goto :goto_0

    :pswitch_1e
    const/16 v0, 0xc

    goto :goto_0

    :pswitch_1f
    const/16 v0, 0xb

    goto :goto_0

    :pswitch_20
    const/16 v0, 0xa

    goto :goto_0

    :pswitch_21
    const/16 v0, 0x9

    goto :goto_0

    :pswitch_22
    const/16 v0, 0x8

    goto :goto_0

    :pswitch_23
    const/4 v0, 0x7

    goto :goto_0

    :pswitch_24
    const/4 v0, 0x6

    goto :goto_0

    :pswitch_25
    const/4 v0, 0x5

    goto :goto_0

    :pswitch_26
    const/4 v0, 0x4

    goto :goto_0

    :pswitch_27
    const/4 v0, 0x3

    goto :goto_0

    :pswitch_28
    const/4 v0, 0x2

    :goto_0
    if-nez v0, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0

    :pswitch_data_0
    .packed-switch 0x0
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
