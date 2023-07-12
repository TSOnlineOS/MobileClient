.class public final Lcom/facebook/AuthenticationTokenClaims$Companion;
.super Ljava/lang/Object;
.source "AuthenticationTokenClaims.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/AuthenticationTokenClaims;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0015\u0010\u0008\u001a\u00020\u00052\u0006\u0010\t\u001a\u00020\nH\u0000\u00a2\u0006\u0002\u0008\u000bR\u0016\u0010\u0003\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u00048\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0086T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000c"
    }
    d2 = {
        "Lcom/facebook/AuthenticationTokenClaims$Companion;",
        "",
        "()V",
        "CREATOR",
        "Landroid/os/Parcelable$Creator;",
        "Lcom/facebook/AuthenticationTokenClaims;",
        "MAX_TIME_SINCE_TOKEN_ISSUED",
        "",
        "createFromJSONObject",
        "jsonObject",
        "Lorg/json/JSONObject;",
        "createFromJSONObject$facebook_core_release",
        "facebook-core_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x5,
        0x1
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 513
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 513
    invoke-direct {p0}, Lcom/facebook/AuthenticationTokenClaims$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final createFromJSONObject$facebook_core_release(Lorg/json/JSONObject;)Lcom/facebook/AuthenticationTokenClaims;
    .locals 30

    move-object/from16 v0, p1

    const-string v1, "jsonObject"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "jti"

    .line 517
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v2, "iss"

    .line 518
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "aud"

    .line 519
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "nonce"

    .line 520
    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "exp"

    .line 521
    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v9

    const-string v11, "iat"

    .line 522
    invoke-virtual {v0, v11}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v11

    const-string v13, "sub"

    .line 523
    invoke-virtual {v0, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    const-string v15, "name"

    .line 524
    invoke-virtual {v0, v15}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    move-wide/from16 v16, v11

    const-string v11, "givenName"

    .line 525
    invoke-virtual {v0, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v12, "middleName"

    .line 526
    invoke-virtual {v0, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    move-wide/from16 v18, v9

    const-string v9, "familyName"

    .line 527
    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "email"

    .line 528
    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    move-object/from16 v20, v10

    const-string v10, "picture"

    .line 529
    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    move-object/from16 v21, v10

    const-string v10, "userFriends"

    .line 530
    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v10

    move-object/from16 v22, v10

    const-string v10, "userBirthday"

    .line 531
    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    move-object/from16 v23, v10

    const-string v10, "userAgeRange"

    .line 532
    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v10

    move-object/from16 v24, v10

    const-string v10, "userHometown"

    .line 533
    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v10

    move-object/from16 v25, v10

    const-string v10, "userLocation"

    .line 534
    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v10

    move-object/from16 v26, v10

    const-string v10, "userGender"

    .line 535
    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    move-object/from16 v27, v10

    const-string v10, "userLink"

    .line 536
    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 537
    new-instance v28, Lcom/facebook/AuthenticationTokenClaims;

    .line 538
    invoke-static {v3, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 539
    invoke-static {v4, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 540
    invoke-static {v6, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 541
    invoke-static {v8, v7}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 544
    invoke-static {v14, v13}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 545
    move-object v1, v15

    check-cast v1, Ljava/lang/CharSequence;

    const/4 v2, 0x0

    const/4 v5, 0x1

    if-eqz v1, :cond_1

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    :goto_1
    const/4 v7, 0x0

    if-eqz v1, :cond_2

    move-object v15, v7

    .line 546
    :cond_2
    move-object v1, v11

    check-cast v1, Ljava/lang/CharSequence;

    if-eqz v1, :cond_4

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-nez v1, :cond_3

    goto :goto_2

    :cond_3
    const/4 v1, 0x0

    goto :goto_3

    :cond_4
    :goto_2
    const/4 v1, 0x1

    :goto_3
    if-eqz v1, :cond_5

    move-object v13, v7

    goto :goto_4

    :cond_5
    move-object v13, v11

    .line 547
    :goto_4
    move-object v1, v12

    check-cast v1, Ljava/lang/CharSequence;

    if-eqz v1, :cond_7

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-nez v1, :cond_6

    goto :goto_5

    :cond_6
    const/4 v1, 0x0

    goto :goto_6

    :cond_7
    :goto_5
    const/4 v1, 0x1

    :goto_6
    if-eqz v1, :cond_8

    move-object v1, v7

    goto :goto_7

    :cond_8
    move-object v1, v12

    .line 548
    :goto_7
    move-object v10, v9

    check-cast v10, Ljava/lang/CharSequence;

    if-eqz v10, :cond_a

    invoke-interface {v10}, Ljava/lang/CharSequence;->length()I

    move-result v10

    if-nez v10, :cond_9

    goto :goto_8

    :cond_9
    const/4 v10, 0x0

    goto :goto_9

    :cond_a
    :goto_8
    const/4 v10, 0x1

    :goto_9
    if-eqz v10, :cond_b

    move-object/from16 v29, v7

    goto :goto_a

    :cond_b
    move-object/from16 v29, v9

    .line 549
    :goto_a
    move-object/from16 v10, v20

    check-cast v10, Ljava/lang/CharSequence;

    if-eqz v10, :cond_d

    invoke-interface {v10}, Ljava/lang/CharSequence;->length()I

    move-result v9

    if-nez v9, :cond_c

    goto :goto_b

    :cond_c
    const/4 v9, 0x0

    goto :goto_c

    :cond_d
    :goto_b
    const/4 v9, 0x1

    :goto_c
    if-eqz v9, :cond_e

    move-object/from16 v20, v7

    .line 550
    :cond_e
    move-object/from16 v10, v21

    check-cast v10, Ljava/lang/CharSequence;

    if-eqz v10, :cond_10

    invoke-interface {v10}, Ljava/lang/CharSequence;->length()I

    move-result v9

    if-nez v9, :cond_f

    goto :goto_d

    :cond_f
    const/4 v9, 0x0

    goto :goto_e

    :cond_10
    :goto_d
    const/4 v9, 0x1

    :goto_e
    if-eqz v9, :cond_11

    move-object/from16 v21, v7

    :cond_11
    if-nez v22, :cond_12

    move-object v9, v7

    goto :goto_f

    .line 551
    :cond_12
    invoke-static/range {v22 .. v22}, Lcom/facebook/internal/Utility;->jsonArrayToStringList(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v9

    :goto_f
    move-object/from16 v22, v9

    check-cast v22, Ljava/util/Collection;

    .line 552
    move-object/from16 v10, v23

    check-cast v10, Ljava/lang/CharSequence;

    if-eqz v10, :cond_14

    invoke-interface {v10}, Ljava/lang/CharSequence;->length()I

    move-result v9

    if-nez v9, :cond_13

    goto :goto_10

    :cond_13
    const/4 v9, 0x0

    goto :goto_11

    :cond_14
    :goto_10
    const/4 v9, 0x1

    :goto_11
    if-eqz v9, :cond_15

    move-object/from16 v23, v7

    :cond_15
    if-nez v24, :cond_16

    move-object/from16 v24, v7

    goto :goto_12

    .line 554
    :cond_16
    invoke-static/range {v24 .. v24}, Lcom/facebook/internal/Utility;->convertJSONObjectToHashMap(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object v9

    move-object/from16 v24, v9

    :goto_12
    if-nez v25, :cond_17

    move-object/from16 v25, v7

    goto :goto_13

    .line 555
    :cond_17
    invoke-static/range {v25 .. v25}, Lcom/facebook/internal/Utility;->convertJSONObjectToStringMap(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object v9

    move-object/from16 v25, v9

    :goto_13
    if-nez v26, :cond_18

    move-object/from16 v26, v7

    goto :goto_14

    .line 556
    :cond_18
    invoke-static/range {v26 .. v26}, Lcom/facebook/internal/Utility;->convertJSONObjectToStringMap(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object v9

    move-object/from16 v26, v9

    .line 557
    :goto_14
    move-object/from16 v10, v27

    check-cast v10, Ljava/lang/CharSequence;

    if-eqz v10, :cond_1a

    invoke-interface {v10}, Ljava/lang/CharSequence;->length()I

    move-result v9

    if-nez v9, :cond_19

    goto :goto_15

    :cond_19
    const/4 v9, 0x0

    goto :goto_16

    :cond_1a
    :goto_15
    const/4 v9, 0x1

    :goto_16
    if-eqz v9, :cond_1b

    move-object/from16 v27, v7

    .line 558
    :cond_1b
    move-object v9, v0

    check-cast v9, Ljava/lang/CharSequence;

    if-eqz v9, :cond_1c

    invoke-interface {v9}, Ljava/lang/CharSequence;->length()I

    move-result v9

    if-nez v9, :cond_1d

    :cond_1c
    const/4 v2, 0x1

    :cond_1d
    if-eqz v2, :cond_1e

    move-object v0, v7

    :cond_1e
    move-object/from16 v2, v28

    move-object v5, v6

    move-object v6, v8

    move-wide/from16 v7, v18

    move-wide/from16 v9, v16

    move-object v11, v14

    move-object v12, v15

    move-object v14, v1

    move-object/from16 v15, v29

    move-object/from16 v16, v20

    move-object/from16 v17, v21

    move-object/from16 v18, v22

    move-object/from16 v19, v23

    move-object/from16 v20, v24

    move-object/from16 v21, v25

    move-object/from16 v22, v26

    move-object/from16 v23, v27

    move-object/from16 v24, v0

    .line 537
    invoke-direct/range {v2 .. v24}, Lcom/facebook/AuthenticationTokenClaims;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Collection;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    return-object v28
.end method
