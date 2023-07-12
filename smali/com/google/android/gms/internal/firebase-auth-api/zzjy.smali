.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzjy;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"


# static fields
.field private static final zza:[I

.field private static final zzb:[I

.field private static final zzc:[I

.field private static final zzd:[I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/16 v0, 0xa

    new-array v1, v0, [I

    fill-array-data v1, :array_0

    sput-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zzjy;->zza:[I

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzjy;->zzb:[I

    const/4 v0, 0x2

    new-array v1, v0, [I

    fill-array-data v1, :array_2

    sput-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zzjy;->zzc:[I

    new-array v0, v0, [I

    fill-array-data v0, :array_3

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzjy;->zzd:[I

    return-void

    :array_0
    .array-data 4
        0x0
        0x3
        0x6
        0x9
        0xc
        0x10
        0x13
        0x16
        0x19
        0x1c
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x2
        0x3
        0x5
        0x6
        0x0
        0x1
        0x3
        0x4
        0x6
    .end array-data

    :array_2
    .array-data 4
        0x3ffffff
        0x1ffffff
    .end array-data

    :array_3
    .array-data 4
        0x1a
        0x19
    .end array-data
.end method

.method static zza([J[J[J)V
    .locals 1

    const/16 v0, 0x13

    new-array v0, v0, [J

    .line 1
    invoke-static {v0, p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzjy;->zzb([J[J[J)V

    .line 2
    invoke-static {v0, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzjy;->zzc([J[J)V

    return-void
.end method

.method static zzb([J[J[J)V
    .locals 32

    const/4 v0, 0x0

    aget-wide v1, p1, v0

    aget-wide v3, p2, v0

    mul-long v1, v1, v3

    aput-wide v1, p0, v0

    aget-wide v1, p1, v0

    const/4 v3, 0x1

    aget-wide v4, p2, v3

    mul-long v1, v1, v4

    aget-wide v4, p1, v3

    aget-wide v6, p2, v0

    mul-long v4, v4, v6

    add-long/2addr v1, v4

    aput-wide v1, p0, v3

    aget-wide v1, p1, v3

    add-long/2addr v1, v1

    aget-wide v4, p2, v3

    mul-long v1, v1, v4

    aget-wide v4, p1, v0

    const/4 v6, 0x2

    aget-wide v7, p2, v6

    mul-long v4, v4, v7

    aget-wide v7, p1, v6

    aget-wide v9, p2, v0

    mul-long v7, v7, v9

    add-long/2addr v1, v4

    add-long/2addr v1, v7

    aput-wide v1, p0, v6

    aget-wide v1, p1, v3

    aget-wide v4, p2, v6

    mul-long v1, v1, v4

    aget-wide v4, p1, v6

    aget-wide v7, p2, v3

    mul-long v4, v4, v7

    aget-wide v7, p1, v0

    const/4 v9, 0x3

    aget-wide v10, p2, v9

    mul-long v7, v7, v10

    aget-wide v10, p1, v9

    aget-wide v12, p2, v0

    mul-long v10, v10, v12

    add-long/2addr v1, v4

    add-long/2addr v1, v7

    add-long/2addr v1, v10

    aput-wide v1, p0, v9

    aget-wide v1, p1, v6

    aget-wide v4, p2, v6

    mul-long v1, v1, v4

    aget-wide v4, p1, v3

    aget-wide v7, p2, v9

    mul-long v4, v4, v7

    aget-wide v7, p1, v9

    aget-wide v10, p2, v3

    mul-long v7, v7, v10

    aget-wide v10, p1, v0

    const/4 v12, 0x4

    aget-wide v13, p2, v12

    mul-long v10, v10, v13

    aget-wide v13, p1, v12

    aget-wide v15, p2, v0

    mul-long v13, v13, v15

    add-long/2addr v4, v7

    add-long/2addr v4, v4

    add-long/2addr v1, v4

    add-long/2addr v1, v10

    add-long/2addr v1, v13

    aput-wide v1, p0, v12

    aget-wide v1, p1, v6

    aget-wide v4, p2, v9

    mul-long v1, v1, v4

    aget-wide v4, p1, v9

    aget-wide v7, p2, v6

    mul-long v4, v4, v7

    aget-wide v7, p1, v3

    aget-wide v10, p2, v12

    mul-long v7, v7, v10

    aget-wide v10, p1, v12

    aget-wide v13, p2, v3

    mul-long v10, v10, v13

    aget-wide v13, p1, v0

    const/4 v15, 0x5

    aget-wide v16, p2, v15

    mul-long v13, v13, v16

    aget-wide v16, p1, v15

    aget-wide v18, p2, v0

    mul-long v16, v16, v18

    add-long/2addr v1, v4

    add-long/2addr v1, v7

    add-long/2addr v1, v10

    add-long/2addr v1, v13

    add-long v1, v1, v16

    aput-wide v1, p0, v15

    aget-wide v1, p1, v9

    aget-wide v4, p2, v9

    mul-long v1, v1, v4

    aget-wide v4, p1, v3

    aget-wide v7, p2, v15

    mul-long v4, v4, v7

    aget-wide v7, p1, v15

    aget-wide v10, p2, v3

    mul-long v7, v7, v10

    aget-wide v10, p1, v6

    aget-wide v13, p2, v12

    mul-long v10, v10, v13

    aget-wide v13, p1, v12

    aget-wide v16, p2, v6

    mul-long v13, v13, v16

    aget-wide v16, p1, v0

    const/16 v18, 0x6

    aget-wide v19, p2, v18

    mul-long v16, v16, v19

    aget-wide v19, p1, v18

    aget-wide v21, p2, v0

    mul-long v19, v19, v21

    add-long/2addr v1, v4

    add-long/2addr v1, v7

    add-long/2addr v1, v1

    add-long/2addr v1, v10

    add-long/2addr v1, v13

    add-long v1, v1, v16

    add-long v1, v1, v19

    aput-wide v1, p0, v18

    aget-wide v1, p1, v9

    aget-wide v4, p2, v12

    mul-long v1, v1, v4

    aget-wide v4, p1, v12

    aget-wide v7, p2, v9

    mul-long v4, v4, v7

    aget-wide v7, p1, v6

    aget-wide v10, p2, v15

    mul-long v7, v7, v10

    aget-wide v10, p1, v15

    aget-wide v13, p2, v6

    mul-long v10, v10, v13

    aget-wide v13, p1, v3

    aget-wide v16, p2, v18

    mul-long v13, v13, v16

    aget-wide v16, p1, v18

    aget-wide v19, p2, v3

    mul-long v16, v16, v19

    aget-wide v19, p1, v0

    const/16 v21, 0x7

    aget-wide v22, p2, v21

    mul-long v19, v19, v22

    aget-wide v22, p1, v21

    aget-wide v24, p2, v0

    mul-long v22, v22, v24

    add-long/2addr v1, v4

    add-long/2addr v1, v7

    add-long/2addr v1, v10

    add-long/2addr v1, v13

    add-long v1, v1, v16

    add-long v1, v1, v19

    add-long v1, v1, v22

    aput-wide v1, p0, v21

    aget-wide v1, p1, v12

    aget-wide v4, p2, v12

    mul-long v1, v1, v4

    aget-wide v4, p1, v9

    aget-wide v7, p2, v15

    mul-long v4, v4, v7

    aget-wide v7, p1, v15

    aget-wide v10, p2, v9

    mul-long v7, v7, v10

    aget-wide v10, p1, v3

    aget-wide v13, p2, v21

    mul-long v10, v10, v13

    aget-wide v13, p1, v21

    aget-wide v16, p2, v3

    mul-long v13, v13, v16

    aget-wide v16, p1, v6

    aget-wide v19, p2, v18

    mul-long v16, v16, v19

    aget-wide v19, p1, v18

    aget-wide v22, p2, v6

    mul-long v19, v19, v22

    aget-wide v22, p1, v0

    const/16 v24, 0x8

    aget-wide v25, p2, v24

    mul-long v22, v22, v25

    aget-wide v25, p1, v24

    aget-wide v27, p2, v0

    mul-long v25, v25, v27

    add-long/2addr v4, v7

    add-long/2addr v4, v10

    add-long/2addr v4, v13

    add-long/2addr v4, v4

    add-long/2addr v1, v4

    add-long v1, v1, v16

    add-long v1, v1, v19

    add-long v1, v1, v22

    add-long v1, v1, v25

    aput-wide v1, p0, v24

    aget-wide v1, p1, v12

    aget-wide v4, p2, v15

    mul-long v1, v1, v4

    aget-wide v4, p1, v15

    aget-wide v7, p2, v12

    mul-long v4, v4, v7

    aget-wide v7, p1, v9

    aget-wide v10, p2, v18

    mul-long v7, v7, v10

    aget-wide v10, p1, v18

    aget-wide v13, p2, v9

    mul-long v10, v10, v13

    aget-wide v13, p1, v6

    aget-wide v16, p2, v21

    mul-long v13, v13, v16

    aget-wide v16, p1, v21

    aget-wide v19, p2, v6

    mul-long v16, v16, v19

    aget-wide v19, p1, v3

    aget-wide v22, p2, v24

    mul-long v19, v19, v22

    aget-wide v22, p1, v24

    aget-wide v25, p2, v3

    mul-long v22, v22, v25

    aget-wide v25, p1, v0

    const/16 v27, 0x9

    aget-wide v28, p2, v27

    mul-long v25, v25, v28

    aget-wide v28, p1, v27

    aget-wide v30, p2, v0

    mul-long v28, v28, v30

    add-long/2addr v1, v4

    add-long/2addr v1, v7

    add-long/2addr v1, v10

    add-long/2addr v1, v13

    add-long v1, v1, v16

    add-long v1, v1, v19

    add-long v1, v1, v22

    add-long v1, v1, v25

    add-long v1, v1, v28

    aput-wide v1, p0, v27

    aget-wide v0, p1, v15

    aget-wide v4, p2, v15

    mul-long v0, v0, v4

    aget-wide v4, p1, v9

    aget-wide v7, p2, v21

    mul-long v4, v4, v7

    aget-wide v7, p1, v21

    aget-wide v10, p2, v9

    mul-long v7, v7, v10

    aget-wide v10, p1, v3

    aget-wide v13, p2, v27

    mul-long v10, v10, v13

    aget-wide v13, p1, v27

    aget-wide v2, p2, v3

    mul-long v13, v13, v2

    aget-wide v2, p1, v12

    aget-wide v16, p2, v18

    mul-long v2, v2, v16

    aget-wide v16, p1, v18

    aget-wide v19, p2, v12

    mul-long v16, v16, v19

    aget-wide v19, p1, v6

    aget-wide v22, p2, v24

    mul-long v19, v19, v22

    aget-wide v22, p1, v24

    aget-wide v25, p2, v6

    mul-long v22, v22, v25

    add-long/2addr v0, v4

    add-long/2addr v0, v7

    add-long/2addr v0, v10

    add-long/2addr v0, v13

    add-long/2addr v0, v0

    add-long/2addr v0, v2

    add-long v0, v0, v16

    add-long v0, v0, v19

    add-long v0, v0, v22

    const/16 v2, 0xa

    aput-wide v0, p0, v2

    aget-wide v0, p1, v15

    aget-wide v2, p2, v18

    mul-long v0, v0, v2

    aget-wide v2, p1, v18

    aget-wide v4, p2, v15

    mul-long v2, v2, v4

    aget-wide v4, p1, v12

    aget-wide v7, p2, v21

    mul-long v4, v4, v7

    aget-wide v7, p1, v21

    aget-wide v10, p2, v12

    mul-long v7, v7, v10

    aget-wide v10, p1, v9

    aget-wide v13, p2, v24

    mul-long v10, v10, v13

    aget-wide v13, p1, v24

    aget-wide v16, p2, v9

    mul-long v13, v13, v16

    aget-wide v16, p1, v6

    aget-wide v19, p2, v27

    mul-long v16, v16, v19

    aget-wide v19, p1, v27

    aget-wide v22, p2, v6

    mul-long v19, v19, v22

    add-long/2addr v0, v2

    add-long/2addr v0, v4

    add-long/2addr v0, v7

    add-long/2addr v0, v10

    add-long/2addr v0, v13

    add-long v0, v0, v16

    add-long v0, v0, v19

    const/16 v2, 0xb

    aput-wide v0, p0, v2

    aget-wide v0, p1, v18

    aget-wide v2, p2, v18

    mul-long v0, v0, v2

    aget-wide v2, p1, v15

    aget-wide v4, p2, v21

    mul-long v2, v2, v4

    aget-wide v4, p1, v21

    aget-wide v6, p2, v15

    mul-long v4, v4, v6

    aget-wide v6, p1, v9

    aget-wide v10, p2, v27

    mul-long v6, v6, v10

    aget-wide v10, p1, v27

    aget-wide v8, p2, v9

    mul-long v10, v10, v8

    aget-wide v8, p1, v12

    aget-wide v13, p2, v24

    mul-long v8, v8, v13

    aget-wide v13, p1, v24

    aget-wide v16, p2, v12

    mul-long v13, v13, v16

    add-long/2addr v2, v4

    add-long/2addr v2, v6

    add-long/2addr v2, v10

    add-long/2addr v2, v2

    add-long/2addr v0, v2

    add-long/2addr v0, v8

    add-long/2addr v0, v13

    const/16 v2, 0xc

    aput-wide v0, p0, v2

    aget-wide v0, p1, v18

    aget-wide v2, p2, v21

    mul-long v0, v0, v2

    aget-wide v2, p1, v21

    aget-wide v4, p2, v18

    mul-long v2, v2, v4

    aget-wide v4, p1, v15

    aget-wide v6, p2, v24

    mul-long v4, v4, v6

    aget-wide v6, p1, v24

    aget-wide v8, p2, v15

    mul-long v6, v6, v8

    aget-wide v8, p1, v12

    aget-wide v10, p2, v27

    mul-long v8, v8, v10

    aget-wide v10, p1, v27

    aget-wide v12, p2, v12

    mul-long v10, v10, v12

    add-long/2addr v0, v2

    add-long/2addr v0, v4

    add-long/2addr v0, v6

    add-long/2addr v0, v8

    add-long/2addr v0, v10

    const/16 v2, 0xd

    aput-wide v0, p0, v2

    aget-wide v0, p1, v21

    aget-wide v2, p2, v21

    mul-long v0, v0, v2

    aget-wide v2, p1, v15

    aget-wide v4, p2, v27

    mul-long v2, v2, v4

    aget-wide v4, p1, v27

    aget-wide v6, p2, v15

    mul-long v4, v4, v6

    aget-wide v6, p1, v18

    aget-wide v8, p2, v24

    mul-long v6, v6, v8

    aget-wide v8, p1, v24

    aget-wide v10, p2, v18

    mul-long v8, v8, v10

    add-long/2addr v0, v2

    add-long/2addr v0, v4

    add-long/2addr v0, v0

    add-long/2addr v0, v6

    add-long/2addr v0, v8

    const/16 v2, 0xe

    aput-wide v0, p0, v2

    aget-wide v0, p1, v21

    aget-wide v2, p2, v24

    mul-long v0, v0, v2

    aget-wide v2, p1, v24

    aget-wide v4, p2, v21

    mul-long v2, v2, v4

    aget-wide v4, p1, v18

    aget-wide v6, p2, v27

    mul-long v4, v4, v6

    aget-wide v6, p1, v27

    aget-wide v8, p2, v18

    mul-long v6, v6, v8

    add-long/2addr v0, v2

    add-long/2addr v0, v4

    add-long/2addr v0, v6

    const/16 v2, 0xf

    aput-wide v0, p0, v2

    aget-wide v0, p1, v24

    aget-wide v2, p2, v24

    mul-long v0, v0, v2

    aget-wide v2, p1, v21

    aget-wide v4, p2, v27

    mul-long v2, v2, v4

    aget-wide v4, p1, v27

    aget-wide v6, p2, v21

    mul-long v4, v4, v6

    add-long/2addr v2, v4

    add-long/2addr v2, v2

    add-long/2addr v0, v2

    const/16 v2, 0x10

    aput-wide v0, p0, v2

    aget-wide v0, p1, v24

    aget-wide v2, p2, v27

    mul-long v0, v0, v2

    aget-wide v2, p1, v27

    aget-wide v4, p2, v24

    mul-long v2, v2, v4

    add-long/2addr v0, v2

    const/16 v2, 0x11

    aput-wide v0, p0, v2

    aget-wide v0, p1, v27

    add-long/2addr v0, v0

    aget-wide v2, p2, v27

    mul-long v0, v0, v2

    const/16 v2, 0x12

    aput-wide v0, p0, v2

    return-void
.end method

.method static zzc([J[J)V
    .locals 2

    .line 1
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzjy;->zze([J)V

    .line 2
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzjy;->zzd([J)V

    const/4 v0, 0x0

    const/16 v1, 0xa

    .line 3
    invoke-static {p0, v0, p1, v0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void
.end method

.method static zzd([J)V
    .locals 12

    const/16 v0, 0xa

    const-wide/16 v1, 0x0

    aput-wide v1, p0, v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    const/16 v5, 0x1a

    const-wide/32 v6, 0x4000000

    if-ge v4, v0, :cond_0

    .line 1
    aget-wide v8, p0, v4

    div-long v6, v8, v6

    shl-long v10, v6, v5

    sub-long/2addr v8, v10

    .line 2
    aput-wide v8, p0, v4

    add-int/lit8 v5, v4, 0x1

    .line 3
    aget-wide v8, p0, v5

    add-long/2addr v8, v6

    aput-wide v8, p0, v5

    const-wide/32 v6, 0x2000000

    div-long v6, v8, v6

    const/16 v10, 0x19

    shl-long v10, v6, v10

    sub-long/2addr v8, v10

    .line 4
    aput-wide v8, p0, v5

    add-int/lit8 v4, v4, 0x2

    .line 5
    aget-wide v8, p0, v4

    add-long/2addr v8, v6

    aput-wide v8, p0, v4

    goto :goto_0

    :cond_0
    aget-wide v8, p0, v3

    aget-wide v10, p0, v0

    const/4 v4, 0x4

    shl-long/2addr v10, v4

    add-long/2addr v8, v10

    aput-wide v8, p0, v3

    aget-wide v10, p0, v0

    add-long/2addr v10, v10

    add-long/2addr v8, v10

    aput-wide v8, p0, v3

    aget-wide v10, p0, v0

    add-long/2addr v8, v10

    aput-wide v8, p0, v3

    aput-wide v1, p0, v0

    aget-wide v0, p0, v3

    div-long v6, v0, v6

    shl-long v4, v6, v5

    sub-long/2addr v0, v4

    aput-wide v0, p0, v3

    const/4 v0, 0x1

    aget-wide v1, p0, v0

    add-long/2addr v1, v6

    aput-wide v1, p0, v0

    return-void
.end method

.method static zze([J)V
    .locals 7

    const/16 v0, 0x8

    aget-wide v1, p0, v0

    const/16 v3, 0x12

    aget-wide v4, p0, v3

    const/4 v6, 0x4

    shl-long/2addr v4, v6

    add-long/2addr v1, v4

    aput-wide v1, p0, v0

    aget-wide v4, p0, v3

    add-long/2addr v4, v4

    add-long/2addr v1, v4

    aput-wide v1, p0, v0

    aget-wide v3, p0, v3

    add-long/2addr v1, v3

    aput-wide v1, p0, v0

    const/4 v0, 0x7

    aget-wide v1, p0, v0

    const/16 v3, 0x11

    aget-wide v4, p0, v3

    shl-long/2addr v4, v6

    add-long/2addr v1, v4

    aput-wide v1, p0, v0

    aget-wide v4, p0, v3

    add-long/2addr v4, v4

    add-long/2addr v1, v4

    aput-wide v1, p0, v0

    aget-wide v3, p0, v3

    add-long/2addr v1, v3

    aput-wide v1, p0, v0

    const/4 v0, 0x6

    aget-wide v1, p0, v0

    const/16 v3, 0x10

    aget-wide v4, p0, v3

    shl-long/2addr v4, v6

    add-long/2addr v1, v4

    aput-wide v1, p0, v0

    aget-wide v4, p0, v3

    add-long/2addr v4, v4

    add-long/2addr v1, v4

    aput-wide v1, p0, v0

    aget-wide v3, p0, v3

    add-long/2addr v1, v3

    aput-wide v1, p0, v0

    const/4 v0, 0x5

    aget-wide v1, p0, v0

    const/16 v3, 0xf

    aget-wide v4, p0, v3

    shl-long/2addr v4, v6

    add-long/2addr v1, v4

    aput-wide v1, p0, v0

    aget-wide v4, p0, v3

    add-long/2addr v4, v4

    add-long/2addr v1, v4

    aput-wide v1, p0, v0

    aget-wide v3, p0, v3

    add-long/2addr v1, v3

    aput-wide v1, p0, v0

    aget-wide v0, p0, v6

    const/16 v2, 0xe

    aget-wide v3, p0, v2

    shl-long/2addr v3, v6

    add-long/2addr v0, v3

    aput-wide v0, p0, v6

    aget-wide v3, p0, v2

    add-long/2addr v3, v3

    add-long/2addr v0, v3

    aput-wide v0, p0, v6

    aget-wide v2, p0, v2

    add-long/2addr v0, v2

    aput-wide v0, p0, v6

    const/4 v0, 0x3

    aget-wide v1, p0, v0

    const/16 v3, 0xd

    aget-wide v4, p0, v3

    shl-long/2addr v4, v6

    add-long/2addr v1, v4

    aput-wide v1, p0, v0

    aget-wide v4, p0, v3

    add-long/2addr v4, v4

    add-long/2addr v1, v4

    aput-wide v1, p0, v0

    aget-wide v3, p0, v3

    add-long/2addr v1, v3

    aput-wide v1, p0, v0

    const/4 v0, 0x2

    aget-wide v1, p0, v0

    const/16 v3, 0xc

    aget-wide v4, p0, v3

    shl-long/2addr v4, v6

    add-long/2addr v1, v4

    aput-wide v1, p0, v0

    aget-wide v4, p0, v3

    add-long/2addr v4, v4

    add-long/2addr v1, v4

    aput-wide v1, p0, v0

    aget-wide v3, p0, v3

    add-long/2addr v1, v3

    aput-wide v1, p0, v0

    const/4 v0, 0x1

    aget-wide v1, p0, v0

    const/16 v3, 0xb

    aget-wide v4, p0, v3

    shl-long/2addr v4, v6

    add-long/2addr v1, v4

    aput-wide v1, p0, v0

    aget-wide v4, p0, v3

    add-long/2addr v4, v4

    add-long/2addr v1, v4

    aput-wide v1, p0, v0

    aget-wide v3, p0, v3

    add-long/2addr v1, v3

    aput-wide v1, p0, v0

    const/4 v0, 0x0

    aget-wide v1, p0, v0

    const/16 v3, 0xa

    aget-wide v4, p0, v3

    shl-long/2addr v4, v6

    add-long/2addr v1, v4

    aput-wide v1, p0, v0

    aget-wide v4, p0, v3

    add-long/2addr v4, v4

    add-long/2addr v1, v4

    aput-wide v1, p0, v0

    aget-wide v3, p0, v3

    add-long/2addr v1, v3

    aput-wide v1, p0, v0

    return-void
.end method

.method static zzf([J[JJ)V
    .locals 3

    const/4 v0, 0x0

    :goto_0
    const/16 v1, 0xa

    if-ge v0, v1, :cond_0

    .line 1
    aget-wide v1, p1, v0

    mul-long v1, v1, p2

    aput-wide v1, p0, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method static zzg([J[J)V
    .locals 24

    const/16 v0, 0x13

    new-array v0, v0, [J

    const/4 v1, 0x0

    aget-wide v2, p1, v1

    mul-long v2, v2, v2

    aput-wide v2, v0, v1

    aget-wide v2, p1, v1

    add-long/2addr v2, v2

    const/4 v4, 0x1

    aget-wide v5, p1, v4

    mul-long v2, v2, v5

    aput-wide v2, v0, v4

    aget-wide v2, p1, v4

    mul-long v2, v2, v2

    aget-wide v5, p1, v1

    const/4 v7, 0x2

    aget-wide v8, p1, v7

    mul-long v5, v5, v8

    add-long/2addr v2, v5

    add-long/2addr v2, v2

    aput-wide v2, v0, v7

    aget-wide v2, p1, v4

    aget-wide v5, p1, v7

    mul-long v2, v2, v5

    aget-wide v5, p1, v1

    const/4 v8, 0x3

    aget-wide v9, p1, v8

    mul-long v5, v5, v9

    add-long/2addr v2, v5

    add-long/2addr v2, v2

    aput-wide v2, v0, v8

    aget-wide v2, p1, v7

    mul-long v2, v2, v2

    aget-wide v5, p1, v4

    const-wide/16 v9, 0x4

    mul-long v5, v5, v9

    aget-wide v11, p1, v8

    mul-long v5, v5, v11

    aget-wide v11, p1, v1

    add-long/2addr v11, v11

    const/4 v13, 0x4

    aget-wide v14, p1, v13

    mul-long v11, v11, v14

    add-long/2addr v2, v5

    add-long/2addr v2, v11

    aput-wide v2, v0, v13

    aget-wide v2, p1, v7

    aget-wide v5, p1, v8

    mul-long v2, v2, v5

    aget-wide v5, p1, v4

    aget-wide v11, p1, v13

    mul-long v5, v5, v11

    aget-wide v11, p1, v1

    const/4 v14, 0x5

    aget-wide v15, p1, v14

    mul-long v11, v11, v15

    add-long/2addr v2, v5

    add-long/2addr v2, v11

    add-long/2addr v2, v2

    aput-wide v2, v0, v14

    aget-wide v2, p1, v8

    mul-long v2, v2, v2

    aget-wide v5, p1, v7

    aget-wide v11, p1, v13

    mul-long v5, v5, v11

    aget-wide v11, p1, v1

    const/4 v15, 0x6

    aget-wide v16, p1, v15

    mul-long v11, v11, v16

    aget-wide v16, p1, v4

    add-long v16, v16, v16

    aget-wide v18, p1, v14

    mul-long v16, v16, v18

    add-long/2addr v2, v5

    add-long/2addr v2, v11

    add-long v2, v2, v16

    add-long/2addr v2, v2

    aput-wide v2, v0, v15

    aget-wide v2, p1, v8

    aget-wide v5, p1, v13

    mul-long v2, v2, v5

    aget-wide v5, p1, v7

    aget-wide v11, p1, v14

    mul-long v5, v5, v11

    aget-wide v11, p1, v4

    aget-wide v16, p1, v15

    mul-long v11, v11, v16

    aget-wide v16, p1, v1

    add-long/2addr v2, v5

    const/4 v5, 0x7

    aget-wide v18, p1, v5

    mul-long v16, v16, v18

    add-long/2addr v2, v11

    add-long v2, v2, v16

    add-long/2addr v2, v2

    aput-wide v2, v0, v5

    aget-wide v2, p1, v13

    mul-long v2, v2, v2

    aget-wide v11, p1, v7

    aget-wide v16, p1, v15

    mul-long v11, v11, v16

    aget-wide v16, p1, v1

    const/16 v6, 0x8

    aget-wide v18, p1, v6

    mul-long v16, v16, v18

    aget-wide v18, p1, v4

    aget-wide v20, p1, v5

    mul-long v18, v18, v20

    aget-wide v20, p1, v8

    aget-wide v22, p1, v14

    mul-long v20, v20, v22

    add-long v18, v18, v20

    add-long v11, v11, v16

    add-long v18, v18, v18

    add-long v11, v11, v18

    add-long/2addr v11, v11

    add-long/2addr v2, v11

    aput-wide v2, v0, v6

    aget-wide v2, p1, v13

    aget-wide v11, p1, v14

    mul-long v2, v2, v11

    aget-wide v11, p1, v8

    aget-wide v16, p1, v15

    mul-long v11, v11, v16

    aget-wide v16, p1, v7

    aget-wide v18, p1, v5

    mul-long v16, v16, v18

    aget-wide v18, p1, v4

    aget-wide v20, p1, v6

    mul-long v18, v18, v20

    aget-wide v20, p1, v1

    const/16 v1, 0x9

    aget-wide v22, p1, v1

    mul-long v20, v20, v22

    add-long/2addr v2, v11

    add-long v2, v2, v16

    add-long v2, v2, v18

    add-long v2, v2, v20

    add-long/2addr v2, v2

    aput-wide v2, v0, v1

    aget-wide v2, p1, v14

    mul-long v2, v2, v2

    aget-wide v11, p1, v13

    aget-wide v16, p1, v15

    mul-long v11, v11, v16

    aget-wide v16, p1, v7

    aget-wide v18, p1, v6

    mul-long v16, v16, v18

    aget-wide v18, p1, v8

    aget-wide v20, p1, v5

    mul-long v18, v18, v20

    aget-wide v20, p1, v4

    aget-wide v22, p1, v1

    mul-long v20, v20, v22

    add-long v18, v18, v20

    add-long/2addr v2, v11

    add-long v2, v2, v16

    add-long v18, v18, v18

    add-long v2, v2, v18

    add-long/2addr v2, v2

    const/16 v4, 0xa

    aput-wide v2, v0, v4

    aget-wide v2, p1, v14

    aget-wide v11, p1, v15

    mul-long v2, v2, v11

    aget-wide v11, p1, v13

    aget-wide v16, p1, v5

    mul-long v11, v11, v16

    aget-wide v16, p1, v8

    aget-wide v18, p1, v6

    mul-long v16, v16, v18

    aget-wide v18, p1, v7

    aget-wide v20, p1, v1

    mul-long v18, v18, v20

    add-long/2addr v2, v11

    add-long v2, v2, v16

    add-long v2, v2, v18

    add-long/2addr v2, v2

    const/16 v4, 0xb

    aput-wide v2, v0, v4

    aget-wide v2, p1, v15

    mul-long v2, v2, v2

    aget-wide v11, p1, v13

    aget-wide v16, p1, v6

    mul-long v11, v11, v16

    aget-wide v16, p1, v14

    aget-wide v18, p1, v5

    mul-long v16, v16, v18

    aget-wide v7, p1, v8

    aget-wide v18, p1, v1

    mul-long v7, v7, v18

    add-long v16, v16, v7

    add-long v16, v16, v16

    add-long v11, v11, v16

    add-long/2addr v11, v11

    add-long/2addr v2, v11

    const/16 v4, 0xc

    aput-wide v2, v0, v4

    aget-wide v2, p1, v15

    aget-wide v7, p1, v5

    mul-long v2, v2, v7

    aget-wide v7, p1, v14

    aget-wide v11, p1, v6

    mul-long v7, v7, v11

    aget-wide v11, p1, v13

    aget-wide v16, p1, v1

    mul-long v11, v11, v16

    add-long/2addr v2, v7

    add-long/2addr v2, v11

    add-long/2addr v2, v2

    const/16 v4, 0xd

    aput-wide v2, v0, v4

    aget-wide v2, p1, v5

    mul-long v2, v2, v2

    aget-wide v7, p1, v15

    aget-wide v11, p1, v6

    mul-long v7, v7, v11

    aget-wide v11, p1, v14

    add-long/2addr v11, v11

    aget-wide v13, p1, v1

    mul-long v11, v11, v13

    add-long/2addr v2, v7

    add-long/2addr v2, v11

    add-long/2addr v2, v2

    const/16 v4, 0xe

    aput-wide v2, v0, v4

    aget-wide v2, p1, v5

    aget-wide v7, p1, v6

    mul-long v2, v2, v7

    aget-wide v7, p1, v15

    aget-wide v11, p1, v1

    mul-long v7, v7, v11

    add-long/2addr v2, v7

    add-long/2addr v2, v2

    const/16 v4, 0xf

    aput-wide v2, v0, v4

    aget-wide v2, p1, v6

    mul-long v2, v2, v2

    aget-wide v4, p1, v5

    mul-long v4, v4, v9

    aget-wide v7, p1, v1

    mul-long v4, v4, v7

    add-long/2addr v2, v4

    const/16 v4, 0x10

    aput-wide v2, v0, v4

    aget-wide v2, p1, v6

    add-long/2addr v2, v2

    aget-wide v4, p1, v1

    mul-long v2, v2, v4

    const/16 v4, 0x11

    aput-wide v2, v0, v4

    aget-wide v1, p1, v1

    add-long v3, v1, v1

    mul-long v3, v3, v1

    const/16 v1, 0x12

    aput-wide v3, v0, v1

    move-object/from16 v1, p0

    .line 1
    invoke-static {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzjy;->zzc([J[J)V

    return-void
.end method

.method static zzh([J[J[J)V
    .locals 5

    const/4 v0, 0x0

    :goto_0
    const/16 v1, 0xa

    if-ge v0, v1, :cond_0

    .line 1
    aget-wide v1, p1, v0

    aget-wide v3, p2, v0

    sub-long/2addr v1, v3

    aput-wide v1, p0, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method static zzi([J[J[J)V
    .locals 5

    const/4 v0, 0x0

    :goto_0
    const/16 v1, 0xa

    if-ge v0, v1, :cond_0

    .line 1
    aget-wide v1, p1, v0

    aget-wide v3, p2, v0

    add-long/2addr v1, v3

    aput-wide v1, p0, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public static zzj([J)[B
    .locals 16

    const/16 v0, 0xa

    move-object/from16 v1, p0

    .line 1
    invoke-static {v1, v0}, Ljava/util/Arrays;->copyOf([JI)[J

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    const-wide/16 v4, 0x13

    const/16 v6, 0x19

    const/16 v7, 0x9

    const/16 v8, 0x1f

    const/4 v9, 0x2

    if-ge v3, v9, :cond_1

    const/4 v9, 0x0

    :goto_1
    if-ge v9, v7, :cond_0

    .line 2
    aget-wide v10, v1, v9

    shr-long v12, v10, v8

    and-long/2addr v12, v10

    and-int/lit8 v14, v9, 0x1

    sget-object v15, Lcom/google/android/gms/internal/firebase-auth-api/zzjy;->zzd:[I

    aget v14, v15, v14

    shr-long/2addr v12, v14

    long-to-int v13, v12

    neg-int v12, v13

    shl-int v13, v12, v14

    int-to-long v13, v13

    add-long/2addr v10, v13

    .line 3
    aput-wide v10, v1, v9

    add-int/lit8 v9, v9, 0x1

    .line 4
    aget-wide v10, v1, v9

    int-to-long v12, v12

    sub-long/2addr v10, v12

    aput-wide v10, v1, v9

    goto :goto_1

    .line 5
    :cond_0
    aget-wide v9, v1, v7

    shr-long v11, v9, v8

    and-long/2addr v11, v9

    shr-long/2addr v11, v6

    long-to-int v6, v11

    neg-int v6, v6

    shl-int/lit8 v8, v6, 0x19

    int-to-long v11, v8

    add-long/2addr v9, v11

    .line 6
    aput-wide v9, v1, v7

    .line 7
    aget-wide v7, v1, v2

    int-to-long v9, v6

    mul-long v9, v9, v4

    sub-long/2addr v7, v9

    aput-wide v7, v1, v2

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 8
    :cond_1
    aget-wide v10, v1, v2

    shr-long v12, v10, v8

    and-long/2addr v12, v10

    const/16 v3, 0x1a

    shr-long/2addr v12, v3

    long-to-int v3, v12

    neg-int v3, v3

    shl-int/lit8 v12, v3, 0x1a

    int-to-long v12, v12

    add-long/2addr v10, v12

    .line 9
    aput-wide v10, v1, v2

    const/4 v10, 0x1

    .line 10
    aget-wide v11, v1, v10

    int-to-long v13, v3

    sub-long/2addr v11, v13

    aput-wide v11, v1, v10

    const/4 v3, 0x0

    :goto_2
    if-ge v3, v9, :cond_3

    const/4 v11, 0x0

    :goto_3
    if-ge v11, v7, :cond_2

    .line 11
    aget-wide v12, v1, v11

    and-int/lit8 v14, v11, 0x1

    sget-object v15, Lcom/google/android/gms/internal/firebase-auth-api/zzjy;->zzd:[I

    aget v15, v15, v14

    shr-long v9, v12, v15

    sget-object v15, Lcom/google/android/gms/internal/firebase-auth-api/zzjy;->zzc:[I

    aget v14, v15, v14

    int-to-long v14, v14

    and-long/2addr v12, v14

    .line 12
    aput-wide v12, v1, v11

    add-int/lit8 v11, v11, 0x1

    .line 13
    aget-wide v12, v1, v11

    long-to-int v10, v9

    int-to-long v9, v10

    add-long/2addr v12, v9

    aput-wide v12, v1, v11

    const/4 v9, 0x2

    const/4 v10, 0x1

    goto :goto_3

    :cond_2
    add-int/lit8 v3, v3, 0x1

    const/4 v9, 0x2

    const/4 v10, 0x1

    goto :goto_2

    .line 14
    :cond_3
    aget-wide v9, v1, v7

    shr-long v11, v9, v6

    const-wide/32 v13, 0x1ffffff

    and-long/2addr v9, v13

    .line 15
    aput-wide v9, v1, v7

    .line 16
    aget-wide v6, v1, v2

    long-to-int v3, v11

    int-to-long v9, v3

    mul-long v9, v9, v4

    add-long/2addr v6, v9

    aput-wide v6, v1, v2

    long-to-int v3, v6

    const v4, -0x3ffffed

    add-int/2addr v3, v4

    shr-int/2addr v3, v8

    not-int v3, v3

    const/4 v4, 0x1

    :goto_4
    if-ge v4, v0, :cond_4

    .line 17
    aget-wide v5, v1, v4

    long-to-int v6, v5

    and-int/lit8 v5, v4, 0x1

    sget-object v7, Lcom/google/android/gms/internal/firebase-auth-api/zzjy;->zzc:[I

    aget v5, v7, v5

    xor-int/2addr v5, v6

    not-int v5, v5

    shl-int/lit8 v6, v5, 0x10

    and-int/2addr v5, v6

    shl-int/lit8 v6, v5, 0x8

    and-int/2addr v5, v6

    shl-int/lit8 v6, v5, 0x4

    and-int/2addr v5, v6

    shl-int/lit8 v6, v5, 0x2

    and-int/2addr v5, v6

    add-int v6, v5, v5

    and-int/2addr v5, v6

    shr-int/2addr v5, v8

    and-int/2addr v3, v5

    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    .line 18
    :cond_4
    aget-wide v4, v1, v2

    const v6, 0x3ffffed

    and-int/2addr v6, v3

    int-to-long v6, v6

    sub-long/2addr v4, v6

    aput-wide v4, v1, v2

    const/4 v4, 0x1

    .line 19
    aget-wide v5, v1, v4

    const v7, 0x1ffffff

    and-int/2addr v7, v3

    int-to-long v7, v7

    sub-long/2addr v5, v7

    aput-wide v5, v1, v4

    const/4 v4, 0x2

    :goto_5
    if-ge v4, v0, :cond_5

    .line 20
    aget-wide v5, v1, v4

    const v9, 0x3ffffff

    and-int/2addr v9, v3

    int-to-long v9, v9

    sub-long/2addr v5, v9

    aput-wide v5, v1, v4

    add-int/lit8 v5, v4, 0x1

    .line 21
    aget-wide v9, v1, v5

    sub-long/2addr v9, v7

    aput-wide v9, v1, v5

    add-int/lit8 v4, v4, 0x2

    goto :goto_5

    :cond_5
    const/4 v3, 0x0

    :goto_6
    if-ge v3, v0, :cond_6

    .line 22
    aget-wide v4, v1, v3

    sget-object v6, Lcom/google/android/gms/internal/firebase-auth-api/zzjy;->zzb:[I

    aget v6, v6, v3

    shl-long/2addr v4, v6

    aput-wide v4, v1, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    :cond_6
    const/16 v3, 0x20

    new-array v3, v3, [B

    :goto_7
    if-ge v2, v0, :cond_7

    sget-object v4, Lcom/google/android/gms/internal/firebase-auth-api/zzjy;->zza:[I

    .line 23
    aget v5, v4, v2

    aget-byte v6, v3, v5

    int-to-long v6, v6

    aget-wide v8, v1, v2

    const-wide/16 v10, 0xff

    and-long v12, v8, v10

    or-long/2addr v6, v12

    long-to-int v7, v6

    int-to-byte v6, v7

    aput-byte v6, v3, v5

    .line 24
    aget v5, v4, v2

    const/4 v6, 0x1

    add-int/2addr v5, v6

    aget-byte v7, v3, v5

    int-to-long v12, v7

    const/16 v7, 0x8

    shr-long v14, v8, v7

    and-long/2addr v14, v10

    or-long/2addr v12, v14

    long-to-int v7, v12

    int-to-byte v7, v7

    aput-byte v7, v3, v5

    .line 25
    aget v5, v4, v2

    const/4 v7, 0x2

    add-int/2addr v5, v7

    aget-byte v12, v3, v5

    int-to-long v12, v12

    const/16 v14, 0x10

    shr-long v14, v8, v14

    and-long/2addr v14, v10

    or-long/2addr v12, v14

    long-to-int v13, v12

    int-to-byte v12, v13

    aput-byte v12, v3, v5

    .line 26
    aget v4, v4, v2

    add-int/lit8 v4, v4, 0x3

    aget-byte v5, v3, v4

    int-to-long v12, v5

    const/16 v5, 0x18

    shr-long/2addr v8, v5

    and-long/2addr v8, v10

    or-long/2addr v8, v12

    long-to-int v5, v8

    int-to-byte v5, v5

    aput-byte v5, v3, v4

    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    :cond_7
    return-object v3
.end method

.method static zzk([B)[J
    .locals 12

    const/16 v0, 0xa

    new-array v1, v0, [J

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    .line 1
    sget-object v3, Lcom/google/android/gms/internal/firebase-auth-api/zzjy;->zza:[I

    aget v3, v3, v2

    aget-byte v4, p0, v3

    and-int/lit16 v4, v4, 0xff

    add-int/lit8 v5, v3, 0x1

    aget-byte v5, p0, v5

    and-int/lit16 v5, v5, 0xff

    add-int/lit8 v6, v3, 0x2

    aget-byte v6, p0, v6

    and-int/lit16 v6, v6, 0xff

    add-int/lit8 v3, v3, 0x3

    aget-byte v3, p0, v3

    and-int/lit16 v3, v3, 0xff

    sget-object v7, Lcom/google/android/gms/internal/firebase-auth-api/zzjy;->zzb:[I

    aget v7, v7, v2

    int-to-long v8, v5

    int-to-long v4, v4

    int-to-long v10, v6

    const/16 v6, 0x8

    shl-long/2addr v8, v6

    or-long/2addr v4, v8

    int-to-long v8, v3

    const/16 v3, 0x10

    shl-long/2addr v10, v3

    or-long v3, v4, v10

    const/16 v5, 0x18

    shl-long v5, v8, v5

    or-long/2addr v3, v5

    shr-long/2addr v3, v7

    and-int/lit8 v5, v2, 0x1

    sget-object v6, Lcom/google/android/gms/internal/firebase-auth-api/zzjy;->zzc:[I

    aget v5, v6, v5

    int-to-long v5, v5

    and-long/2addr v3, v5

    aput-wide v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v1
.end method
