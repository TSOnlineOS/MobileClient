.class public Lcom/appsflyer/share/LinkGenerator;
.super Ljava/lang/Object;
.source ""


# instance fields
.field private ʻ:Ljava/lang/String;

.field private ʼ:Ljava/lang/String;

.field private ʽ:Ljava/lang/String;

.field ˊ:Ljava/lang/String;

.field private ˊॱ:Ljava/lang/String;

.field ˋ:Ljava/lang/String;

.field private ˎ:Ljava/lang/String;

.field private ˏ:Ljava/lang/String;

.field private ˏॱ:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private ॱ:Ljava/lang/String;

.field private ॱˊ:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private ॱॱ:Ljava/lang/String;

.field private ᐝ:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/appsflyer/share/LinkGenerator;->ˏॱ:Ljava/util/Map;

    .line 37
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/appsflyer/share/LinkGenerator;->ॱˊ:Ljava/util/Map;

    .line 41
    iput-object p1, p0, Lcom/appsflyer/share/LinkGenerator;->ˏ:Ljava/lang/String;

    return-void
.end method

.method private static ˋ(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    const-string v0, ""

    :try_start_0
    const-string v1, "utf8"

    .line 227
    invoke-static {p0, v1}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :catchall_0
    return-object v0

    .line 229
    :catch_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Illegal "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ": "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    return-object v0
.end method

.method private ˎ()Ljava/lang/StringBuilder;
    .locals 7

    .line 144
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 146
    iget-object v1, p0, Lcom/appsflyer/share/LinkGenerator;->ˊ:Ljava/lang/String;

    if-eqz v1, :cond_0

    const-string v2, "http"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 147
    iget-object v1, p0, Lcom/appsflyer/share/LinkGenerator;->ˊ:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_0
    const-string v1, "https://%sapp.%s"

    .line 149
    invoke-static {v1}, Lcom/appsflyer/ServerConfigHandler;->getUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    :goto_0
    iget-object v1, p0, Lcom/appsflyer/share/LinkGenerator;->ˋ:Ljava/lang/String;

    if-eqz v1, :cond_1

    const/16 v1, 0x2f

    .line 153
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/appsflyer/share/LinkGenerator;->ˋ:Ljava/lang/String;

    .line 154
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    :cond_1
    iget-object v1, p0, Lcom/appsflyer/share/LinkGenerator;->ॱˊ:Ljava/util/Map;

    iget-object v2, p0, Lcom/appsflyer/share/LinkGenerator;->ˏ:Ljava/lang/String;

    const-string v3, "pid"

    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0x3f

    .line 159
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v1, "pid="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    iget-object v1, p0, Lcom/appsflyer/share/LinkGenerator;->ˏ:Ljava/lang/String;

    const-string v2, "media source"

    invoke-static {v1, v2}, Lcom/appsflyer/share/LinkGenerator;->ˋ(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    iget-object v1, p0, Lcom/appsflyer/share/LinkGenerator;->ʽ:Ljava/lang/String;

    const/16 v2, 0x26

    if-eqz v1, :cond_2

    .line 163
    iget-object v3, p0, Lcom/appsflyer/share/LinkGenerator;->ॱˊ:Ljava/util/Map;

    const-string v4, "af_referrer_uid"

    invoke-interface {v3, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v1, "af_referrer_uid="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    iget-object v1, p0, Lcom/appsflyer/share/LinkGenerator;->ʽ:Ljava/lang/String;

    const-string v3, "referrerUID"

    invoke-static {v1, v3}, Lcom/appsflyer/share/LinkGenerator;->ˋ(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    :cond_2
    iget-object v1, p0, Lcom/appsflyer/share/LinkGenerator;->ॱ:Ljava/lang/String;

    if-eqz v1, :cond_3

    .line 168
    iget-object v3, p0, Lcom/appsflyer/share/LinkGenerator;->ॱˊ:Ljava/util/Map;

    const-string v4, "af_channel"

    invoke-interface {v3, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v1, "af_channel="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    iget-object v1, p0, Lcom/appsflyer/share/LinkGenerator;->ॱ:Ljava/lang/String;

    const-string v3, "channel"

    invoke-static {v1, v3}, Lcom/appsflyer/share/LinkGenerator;->ˋ(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    :cond_3
    iget-object v1, p0, Lcom/appsflyer/share/LinkGenerator;->ʼ:Ljava/lang/String;

    if-eqz v1, :cond_4

    .line 173
    iget-object v3, p0, Lcom/appsflyer/share/LinkGenerator;->ॱˊ:Ljava/util/Map;

    const-string v4, "af_referrer_customer_id"

    invoke-interface {v3, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v1, "af_referrer_customer_id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    iget-object v1, p0, Lcom/appsflyer/share/LinkGenerator;->ʼ:Ljava/lang/String;

    const-string v3, "referrerCustomerId"

    invoke-static {v1, v3}, Lcom/appsflyer/share/LinkGenerator;->ˋ(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    :cond_4
    iget-object v1, p0, Lcom/appsflyer/share/LinkGenerator;->ˎ:Ljava/lang/String;

    if-eqz v1, :cond_5

    .line 178
    iget-object v3, p0, Lcom/appsflyer/share/LinkGenerator;->ॱˊ:Ljava/util/Map;

    const-string v4, "c"

    invoke-interface {v3, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v1, "c="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    iget-object v1, p0, Lcom/appsflyer/share/LinkGenerator;->ˎ:Ljava/lang/String;

    const-string v3, "campaign"

    invoke-static {v1, v3}, Lcom/appsflyer/share/LinkGenerator;->ˋ(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    :cond_5
    iget-object v1, p0, Lcom/appsflyer/share/LinkGenerator;->ʻ:Ljava/lang/String;

    if-eqz v1, :cond_6

    .line 183
    iget-object v3, p0, Lcom/appsflyer/share/LinkGenerator;->ॱˊ:Ljava/util/Map;

    const-string v4, "af_referrer_name"

    invoke-interface {v3, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v1, "af_referrer_name="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    iget-object v1, p0, Lcom/appsflyer/share/LinkGenerator;->ʻ:Ljava/lang/String;

    const-string v3, "referrerName"

    invoke-static {v1, v3}, Lcom/appsflyer/share/LinkGenerator;->ˋ(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    :cond_6
    iget-object v1, p0, Lcom/appsflyer/share/LinkGenerator;->ॱॱ:Ljava/lang/String;

    if-eqz v1, :cond_7

    .line 188
    iget-object v3, p0, Lcom/appsflyer/share/LinkGenerator;->ॱˊ:Ljava/util/Map;

    const-string v4, "af_referrer_image_url"

    invoke-interface {v3, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v1, "af_referrer_image_url="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    iget-object v1, p0, Lcom/appsflyer/share/LinkGenerator;->ॱॱ:Ljava/lang/String;

    const-string v3, "referrerImageURL"

    invoke-static {v1, v3}, Lcom/appsflyer/share/LinkGenerator;->ˋ(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    :cond_7
    iget-object v1, p0, Lcom/appsflyer/share/LinkGenerator;->ˊॱ:Ljava/lang/String;

    if-eqz v1, :cond_b

    .line 194
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/appsflyer/share/LinkGenerator;->ˊॱ:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    iget-object v3, p0, Lcom/appsflyer/share/LinkGenerator;->ˊॱ:Ljava/lang/String;

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    const-string v5, ""

    if-eqz v3, :cond_8

    move-object v3, v5

    goto :goto_1

    :cond_8
    move-object v3, v4

    :goto_1
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    iget-object v3, p0, Lcom/appsflyer/share/LinkGenerator;->ᐝ:Ljava/lang/String;

    if-eqz v3, :cond_9

    .line 197
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    :cond_9
    iget-object v3, p0, Lcom/appsflyer/share/LinkGenerator;->ॱˊ:Ljava/util/Map;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v6, "af_dp"

    invoke-interface {v3, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v1, "af_dp="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    iget-object v1, p0, Lcom/appsflyer/share/LinkGenerator;->ˊॱ:Ljava/lang/String;

    const-string v3, "baseDeeplink"

    invoke-static {v1, v3}, Lcom/appsflyer/share/LinkGenerator;->ˋ(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    iget-object v1, p0, Lcom/appsflyer/share/LinkGenerator;->ᐝ:Ljava/lang/String;

    if-eqz v1, :cond_b

    .line 208
    iget-object v1, p0, Lcom/appsflyer/share/LinkGenerator;->ˊॱ:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_a

    goto :goto_2

    :cond_a
    const-string v5, "%2F"

    :goto_2
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/appsflyer/share/LinkGenerator;->ᐝ:Ljava/lang/String;

    const-string v3, "deeplinkPath"

    .line 209
    invoke-static {v1, v3}, Lcom/appsflyer/share/LinkGenerator;->ˋ(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    :cond_b
    iget-object v1, p0, Lcom/appsflyer/share/LinkGenerator;->ˏॱ:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_c
    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 215
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/appsflyer/share/LinkGenerator;->ˏॱ:Ljava/util/Map;

    invoke-interface {v6, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-static {v6, v3}, Lcom/appsflyer/share/LinkGenerator;->ˋ(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_c

    .line 219
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v4, 0x3d

    .line 220
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/appsflyer/share/LinkGenerator;->ˏॱ:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4, v3}, Lcom/appsflyer/share/LinkGenerator;->ˋ(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    :cond_d
    return-object v0
.end method


# virtual methods
.method public addParameter(Ljava/lang/String;Ljava/lang/String;)Lcom/appsflyer/share/LinkGenerator;
    .locals 1

    .line 96
    iget-object v0, p0, Lcom/appsflyer/share/LinkGenerator;->ˏॱ:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public addParameters(Ljava/util/Map;)Lcom/appsflyer/share/LinkGenerator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/appsflyer/share/LinkGenerator;"
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 102
    iget-object v0, p0, Lcom/appsflyer/share/LinkGenerator;->ˏॱ:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    :cond_0
    return-object p0
.end method

.method public generateLink()Ljava/lang/String;
    .locals 1

    .line 237
    invoke-direct {p0}, Lcom/appsflyer/share/LinkGenerator;->ˎ()Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public generateLink(Landroid/content/Context;Lcom/appsflyer/CreateOneLinkHttpTask$ResponseListener;)V
    .locals 5

    .line 242
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "oneLinkSlug"

    invoke-virtual {v0, v1}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 244
    iget-object v1, p0, Lcom/appsflyer/share/LinkGenerator;->ˏॱ:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 245
    iget-object v1, p0, Lcom/appsflyer/share/LinkGenerator;->ˏॱ:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 246
    iget-object v3, p0, Lcom/appsflyer/share/LinkGenerator;->ॱˊ:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 250
    :cond_0
    invoke-direct {p0}, Lcom/appsflyer/share/LinkGenerator;->ˎ()Ljava/lang/StringBuilder;

    .line 252
    iget-object v1, p0, Lcom/appsflyer/share/LinkGenerator;->ॱˊ:Ljava/util/Map;

    invoke-static {p1, v0, v1, p2}, Lcom/appsflyer/share/ShareInviteHelper;->generateUserInviteLink(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;Lcom/appsflyer/CreateOneLinkHttpTask$ResponseListener;)V

    return-void
.end method

.method public getCampaign()Ljava/lang/String;
    .locals 1

    .line 87
    iget-object v0, p0, Lcom/appsflyer/share/LinkGenerator;->ˎ:Ljava/lang/String;

    return-object v0
.end method

.method public getChannel()Ljava/lang/String;
    .locals 1

    .line 65
    iget-object v0, p0, Lcom/appsflyer/share/LinkGenerator;->ॱ:Ljava/lang/String;

    return-object v0
.end method

.method public getMediaSource()Ljava/lang/String;
    .locals 1

    .line 79
    iget-object v0, p0, Lcom/appsflyer/share/LinkGenerator;->ˏ:Ljava/lang/String;

    return-object v0
.end method

.method public getParameters()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 83
    iget-object v0, p0, Lcom/appsflyer/share/LinkGenerator;->ˏॱ:Ljava/util/Map;

    return-object v0
.end method

.method public setBaseDeeplink(Ljava/lang/String;)Lcom/appsflyer/share/LinkGenerator;
    .locals 0

    .line 55
    iput-object p1, p0, Lcom/appsflyer/share/LinkGenerator;->ˊॱ:Ljava/lang/String;

    return-object p0
.end method

.method public setBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/appsflyer/share/LinkGenerator;
    .locals 5

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x2

    const-string v3, "https://%s/%s"

    if-eqz p1, :cond_3

    .line 126
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-gtz v4, :cond_0

    goto :goto_0

    :cond_0
    if-eqz p2, :cond_1

    .line 1135
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p3

    const/4 v4, 0x5

    if-ge p3, v4, :cond_2

    :cond_1
    const-string p2, "go.onelink.me"

    :cond_2
    new-array p3, v2, [Ljava/lang/Object;

    aput-object p2, p3, v1

    aput-object p1, p3, v0

    .line 1138
    invoke-static {v3, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 129
    iput-object p1, p0, Lcom/appsflyer/share/LinkGenerator;->ˊ:Ljava/lang/String;

    goto :goto_1

    :cond_3
    :goto_0
    new-array p1, v2, [Ljava/lang/Object;

    const-string p2, "%sapp.%s"

    .line 127
    invoke-static {p2}, Lcom/appsflyer/ServerConfigHandler;->getUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    aput-object p2, p1, v1

    aput-object p3, p1, v0

    invoke-static {v3, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/appsflyer/share/LinkGenerator;->ˊ:Ljava/lang/String;

    :goto_1
    return-object p0
.end method

.method public setCampaign(Ljava/lang/String;)Lcom/appsflyer/share/LinkGenerator;
    .locals 0

    .line 91
    iput-object p1, p0, Lcom/appsflyer/share/LinkGenerator;->ˎ:Ljava/lang/String;

    return-object p0
.end method

.method public setChannel(Ljava/lang/String;)Lcom/appsflyer/share/LinkGenerator;
    .locals 0

    .line 69
    iput-object p1, p0, Lcom/appsflyer/share/LinkGenerator;->ॱ:Ljava/lang/String;

    return-object p0
.end method

.method public setDeeplinkPath(Ljava/lang/String;)Lcom/appsflyer/share/LinkGenerator;
    .locals 0

    .line 50
    iput-object p1, p0, Lcom/appsflyer/share/LinkGenerator;->ᐝ:Ljava/lang/String;

    return-object p0
.end method

.method public setReferrerCustomerId(Ljava/lang/String;)Lcom/appsflyer/share/LinkGenerator;
    .locals 0

    .line 74
    iput-object p1, p0, Lcom/appsflyer/share/LinkGenerator;->ʼ:Ljava/lang/String;

    return-object p0
.end method

.method public setReferrerImageURL(Ljava/lang/String;)Lcom/appsflyer/share/LinkGenerator;
    .locals 0

    .line 120
    iput-object p1, p0, Lcom/appsflyer/share/LinkGenerator;->ॱॱ:Ljava/lang/String;

    return-object p0
.end method

.method public setReferrerName(Ljava/lang/String;)Lcom/appsflyer/share/LinkGenerator;
    .locals 0

    .line 114
    iput-object p1, p0, Lcom/appsflyer/share/LinkGenerator;->ʻ:Ljava/lang/String;

    return-object p0
.end method

.method public setReferrerUID(Ljava/lang/String;)Lcom/appsflyer/share/LinkGenerator;
    .locals 0

    .line 108
    iput-object p1, p0, Lcom/appsflyer/share/LinkGenerator;->ʽ:Ljava/lang/String;

    return-object p0
.end method
