.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzacu;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Lcom/google/android/gms/internal/firebase-auth-api/zzaar;


# static fields
.field private static final zza:Ljava/lang/String;


# instance fields
.field private zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzacw;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacu;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacu;->zza:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final bridge synthetic zza(Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzaar;
    .locals 25
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/firebase-auth-api/zzyi;
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    const-string v0, "users"

    .line 1
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 2
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacw;

    .line 3
    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzacw;-><init>()V

    iput-object v0, v1, Lcom/google/android/gms/internal/firebase-auth-api/zzacu;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzacw;

    goto/16 :goto_4

    .line 4
    :cond_0
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 5
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-nez v3, :cond_1

    goto/16 :goto_2

    .line 6
    :cond_1
    new-instance v3, Ljava/util/ArrayList;

    .line 7
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 8
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v5, v6, :cond_3

    .line 9
    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    if-nez v6, :cond_2

    new-instance v6, Lcom/google/android/gms/internal/firebase-auth-api/zzacv;

    .line 10
    invoke-direct {v6}, Lcom/google/android/gms/internal/firebase-auth-api/zzacv;-><init>()V

    move/from16 v24, v5

    goto/16 :goto_1

    .line 9
    :cond_2
    new-instance v23, Lcom/google/android/gms/internal/firebase-auth-api/zzacv;

    const-string v7, "localId"

    const/4 v8, 0x0

    .line 11
    invoke-virtual {v6, v7, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/google/android/gms/common/util/Strings;->emptyToNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v7, "email"

    .line 12
    invoke-virtual {v6, v7, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/google/android/gms/common/util/Strings;->emptyToNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v7, "emailVerified"

    .line 13
    invoke-virtual {v6, v7, v4}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v11

    const-string v7, "displayName"

    .line 14
    invoke-virtual {v6, v7, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/google/android/gms/common/util/Strings;->emptyToNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const-string v7, "photoUrl"

    .line 15
    invoke-virtual {v6, v7, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/google/android/gms/common/util/Strings;->emptyToNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    const-string v7, "providerUserInfo"

    .line 16
    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v7

    invoke-static {v7}, Lcom/google/android/gms/internal/firebase-auth-api/zzadk;->zza(Lorg/json/JSONArray;)Lcom/google/android/gms/internal/firebase-auth-api/zzadk;

    move-result-object v14

    const-string v7, "rawPassword"

    .line 17
    invoke-virtual {v6, v7, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/google/android/gms/common/util/Strings;->emptyToNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    const-string v7, "phoneNumber"

    .line 18
    invoke-virtual {v6, v7, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/google/android/gms/common/util/Strings;->emptyToNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    const-string v7, "createdAt"

    move/from16 v24, v5

    const-wide/16 v4, 0x0

    .line 19
    invoke-virtual {v6, v7, v4, v5}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v17

    const-string v7, "lastLoginAt"

    .line 20
    invoke-virtual {v6, v7, v4, v5}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v4

    const/16 v20, 0x0

    const/16 v21, 0x0

    const-string v7, "mfaInfo"

    .line 21
    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    invoke-static {v6}, Lcom/google/android/gms/internal/firebase-auth-api/zzadi;->zzg(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v22

    move-object/from16 v7, v23

    move-object v8, v9

    move-object v9, v10

    move v10, v11

    move-object v11, v12

    move-object v12, v13

    move-object v13, v14

    move-object v14, v15

    move-object/from16 v15, v16

    move-wide/from16 v16, v17

    move-wide/from16 v18, v4

    invoke-direct/range {v7 .. v22}, Lcom/google/android/gms/internal/firebase-auth-api/zzacv;-><init>(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzadk;Ljava/lang/String;Ljava/lang/String;JJZLcom/google/firebase/auth/zze;Ljava/util/List;)V

    move-object/from16 v6, v23

    .line 9
    :goto_1
    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v5, v24, 0x1

    const/4 v4, 0x0

    goto/16 :goto_0

    .line 23
    :cond_3
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacw;

    .line 22
    invoke-direct {v0, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzacw;-><init>(Ljava/util/List;)V

    goto :goto_3

    .line 5
    :cond_4
    :goto_2
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacw;

    new-instance v3, Ljava/util/ArrayList;

    .line 6
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {v0, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzacw;-><init>(Ljava/util/List;)V

    :goto_3
    iput-object v0, v1, Lcom/google/android/gms/internal/firebase-auth-api/zzacu;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzacw;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_4
    return-object v1

    :catch_0
    move-exception v0

    goto :goto_5

    :catch_1
    move-exception v0

    .line 21
    :goto_5
    sget-object v3, Lcom/google/android/gms/internal/firebase-auth-api/zzacu;->zza:Ljava/lang/String;

    .line 23
    invoke-static {v0, v3, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaen;->zza(Ljava/lang/Exception;Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzyi;

    move-result-object v0

    throw v0
.end method

.method public final zzb()Ljava/util/List;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacu;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzacw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzacw;->zza()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
