.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzadd;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Lcom/google/android/gms/internal/firebase-auth-api/zzaar;


# static fields
.field private static final zza:Ljava/lang/String;


# instance fields
.field private zzb:Ljava/lang/String;

.field private zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzam;

.field private zzd:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lcom/google/android/gms/internal/firebase-auth-api/zzadd;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzadd;->zza:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzadd;->zzd:Z

    return-void
.end method


# virtual methods
.method public final bridge synthetic zza(Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzaar;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/firebase-auth-api/zzyi;
        }
    .end annotation

    const-string v0, "recaptchaEnforcementState"

    .line 1
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v2, "recaptchaKey"

    .line 2
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/common/util/Strings;->emptyToNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzadd;->zzb:Ljava/lang/String;

    .line 3
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 4
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    .line 5
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-nez v2, :cond_0

    goto :goto_2

    .line 7
    :cond_0
    new-instance v2, Lcom/google/android/gms/internal/firebase-auth-api/zzaj;

    invoke-direct {v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaj;-><init>()V

    const/4 v3, 0x0

    .line 8
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_2

    .line 9
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    if-nez v4, :cond_1

    new-instance v4, Lcom/google/android/gms/internal/firebase-auth-api/zzacg;

    const/4 v5, 0x0

    invoke-direct {v4, v5, v5}, Lcom/google/android/gms/internal/firebase-auth-api/zzacg;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    const-string v5, "provider"

    .line 10
    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/google/android/gms/common/util/Strings;->emptyToNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "enforcementState"

    .line 11
    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/google/android/gms/common/util/Strings;->emptyToNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    new-instance v6, Lcom/google/android/gms/internal/firebase-auth-api/zzacg;

    invoke-direct {v6, v5, v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzacg;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object v4, v6

    .line 9
    :goto_1
    invoke-virtual {v2, v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzaj;->zzb(Ljava/lang/Object;)Lcom/google/android/gms/internal/firebase-auth-api/zzaj;

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 12
    :cond_2
    invoke-virtual {v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaj;->zzc()Lcom/google/android/gms/internal/firebase-auth-api/zzam;

    move-result-object v0

    goto :goto_3

    .line 5
    :cond_3
    :goto_2
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzam;->zzh(Ljava/util/Collection;)Lcom/google/android/gms/internal/firebase-auth-api/zzam;

    move-result-object v0

    :goto_3
    iput-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzadd;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzam;

    const-string v2, "EMAIL_PASSWORD_PROVIDER"

    if-eqz v0, :cond_7

    .line 13
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzam;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_4

    goto :goto_4

    .line 14
    :cond_4
    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzam;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/internal/firebase-auth-api/zzadl;

    invoke-virtual {v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzadl;->zza()Ljava/lang/String;

    move-result-object v3

    .line 15
    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzam;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzadl;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzadl;->zzb()Ljava/lang/String;

    move-result-object v0

    if-eqz v3, :cond_7

    if-nez v0, :cond_5

    goto :goto_4

    :cond_5
    const-string v4, "ENFORCE"

    .line 16
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6

    const-string v4, "AUDIT"

    .line 17
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 18
    :cond_6
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    const/4 v1, 0x1

    .line 13
    :cond_7
    :goto_4
    iput-boolean v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzadd;->zzd:Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_8
    return-object p0

    :catch_0
    move-exception v0

    goto :goto_5

    :catch_1
    move-exception v0

    .line 11
    :goto_5
    sget-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zzadd;->zza:Ljava/lang/String;

    .line 19
    invoke-static {v0, v1, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaen;->zza(Ljava/lang/Exception;Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzyi;

    move-result-object p1

    throw p1
.end method

.method public final zzb()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzadd;->zzb:Ljava/lang/String;

    return-object v0
.end method

.method public final zzc()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzadd;->zzd:Z

    return v0
.end method
