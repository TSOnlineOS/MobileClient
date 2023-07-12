.class public Lcom/appsflyer/AFDeepLinkManager;
.super Ljava/lang/Object;
.source ""


# static fields
.field private static ʻ:Landroid/net/Uri;

.field static final ˊ:I

.field static volatile ˋ:Z

.field private static ˎ:Landroid/net/Uri;

.field private static ˏ:Lcom/appsflyer/AFDeepLinkManager;

.field static ॱ:[Ljava/lang/String;


# instance fields
.field protected currentActivityHash:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 18
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x2

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    long-to-int v1, v0

    sput v1, Lcom/appsflyer/AFDeepLinkManager;->ˊ:I

    const/4 v0, 0x0

    .line 22
    sput-object v0, Lcom/appsflyer/AFDeepLinkManager;->ˏ:Lcom/appsflyer/AFDeepLinkManager;

    .line 23
    sput-object v0, Lcom/appsflyer/AFDeepLinkManager;->ˎ:Landroid/net/Uri;

    .line 24
    sput-object v0, Lcom/appsflyer/AFDeepLinkManager;->ʻ:Landroid/net/Uri;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 25
    iput v0, p0, Lcom/appsflyer/AFDeepLinkManager;->currentActivityHash:I

    return-void
.end method

.method public static getInstance()Lcom/appsflyer/AFDeepLinkManager;
    .locals 1

    .line 31
    sget-object v0, Lcom/appsflyer/AFDeepLinkManager;->ˏ:Lcom/appsflyer/AFDeepLinkManager;

    if-nez v0, :cond_0

    .line 32
    new-instance v0, Lcom/appsflyer/AFDeepLinkManager;

    invoke-direct {v0}, Lcom/appsflyer/AFDeepLinkManager;-><init>()V

    sput-object v0, Lcom/appsflyer/AFDeepLinkManager;->ˏ:Lcom/appsflyer/AFDeepLinkManager;

    .line 35
    :cond_0
    sget-object v0, Lcom/appsflyer/AFDeepLinkManager;->ˏ:Lcom/appsflyer/AFDeepLinkManager;

    return-object v0
.end method

.method private ˏ(Landroid/content/Context;Ljava/util/Map;Landroid/net/Uri;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Landroid/net/Uri;",
            ")V"
        }
    .end annotation

    .line 71
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1041
    sget-object v1, Lcom/appsflyer/AFDeepLinkManager;->ॱ:[Ljava/lang/String;

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_1

    const-string v1, "af_tranid="

    .line 1045
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 1049
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v4, "Validate ESP deeplinks : "

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v4, Lcom/appsflyer/AFDeepLinkManager;->ॱ:[Ljava/lang/String;

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/appsflyer/AFLogger;->afRDLog(Ljava/lang/String;)V

    .line 1051
    sget-object v1, Lcom/appsflyer/AFDeepLinkManager;->ॱ:[Ljava/lang/String;

    array-length v4, v1

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v4, :cond_1

    aget-object v6, v1, v5

    .line 1055
    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "://"

    invoke-virtual {v8, v7}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_0

    const/4 v2, 0x1

    goto :goto_1

    .line 1058
    :cond_0
    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "Validate ESP: reject "

    invoke-virtual {v7, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/appsflyer/AFLogger;->afRDLog(Ljava/lang/String;)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    if-eqz v2, :cond_2

    .line 72
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Validation ESP succeeded for: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afRDLog(Ljava/lang/String;)V

    .line 73
    sput-boolean v3, Lcom/appsflyer/AFDeepLinkManager;->ˋ:Z

    .line 74
    invoke-static {}, Lcom/appsflyer/AFExecutor;->getInstance()Lcom/appsflyer/AFExecutor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/appsflyer/AFExecutor;->getSerialExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    new-instance v1, Lcom/appsflyer/AFDeepLinkManager$2;

    invoke-direct {v1, p0, p3, p2, p1}, Lcom/appsflyer/AFDeepLinkManager$2;-><init>(Lcom/appsflyer/AFDeepLinkManager;Landroid/net/Uri;Ljava/util/Map;Landroid/content/Context;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void

    .line 131
    :cond_2
    invoke-static {}, Lcom/appsflyer/AppsFlyerLibCore;->getInstance()Lcom/appsflyer/AppsFlyerLibCore;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/appsflyer/AppsFlyerLibCore;->handleDeepLinkCallback(Landroid/content/Context;Ljava/util/Map;Landroid/net/Uri;)V

    return-void
.end method


# virtual methods
.method public collectIntentsFromActivities(Landroid/content/Intent;)V
    .locals 2

    if-eqz p1, :cond_0

    .line 4210
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.VIEW"

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 4211
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    .line 202
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    sget-object v1, Lcom/appsflyer/AFDeepLinkManager;->ʻ:Landroid/net/Uri;

    if-eq v0, v1, :cond_1

    .line 203
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    sput-object p1, Lcom/appsflyer/AFDeepLinkManager;->ʻ:Landroid/net/Uri;

    :cond_1
    return-void
.end method

.method protected processIntentForDeepLink(Landroid/content/Intent;Landroid/content/Context;Ljava/util/Map;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Intent;",
            "Landroid/content/Context;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 1210
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    const-string v2, "android.intent.action.VIEW"

    invoke-virtual {v2, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1211
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    if-eqz v1, :cond_9

    .line 140
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v2, "consumeAfDeepLink"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 141
    invoke-virtual {p1}, Landroid/content/Intent;->getFlags()I

    move-result v2

    const/high16 v4, 0x400000

    and-int/2addr v2, v4

    if-nez v2, :cond_1

    const/4 v2, 0x1

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    :goto_1
    const-string v4, "appsflyer_click_ts"

    .line 144
    invoke-virtual {p1, v4}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v5

    const-string v6, "skipping re-use of previously consumed deep link: "

    if-eqz v5, :cond_3

    if-nez v0, :cond_3

    const-wide/16 v2, 0x0

    .line 2190
    invoke-virtual {p1, v4, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v4

    .line 2191
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object p1

    const-string v0, "appsflyer_click_consumed_ts"

    invoke-virtual {p1, v0, v2, v3}, Lcom/appsflyer/AppsFlyerProperties;->getLong(Ljava/lang/String;J)J

    move-result-wide v7

    cmp-long p1, v4, v2

    if-eqz p1, :cond_2

    cmp-long p1, v4, v7

    if-eqz p1, :cond_2

    .line 2194
    invoke-direct {p0, p2, p3, v1}, Lcom/appsflyer/AFDeepLinkManager;->ˏ(Landroid/content/Context;Ljava/util/Map;Landroid/net/Uri;)V

    .line 2195
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object p1

    invoke-virtual {p1, v0, v4, v5}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;J)V

    return-void

    .line 2197
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " w/Ex: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    return-void

    :cond_3
    if-nez v0, :cond_5

    if-nez v2, :cond_5

    .line 3180
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object p1

    const-string v0, "lastActivityHash"

    invoke-virtual {p1, v0, v3}, Lcom/appsflyer/AppsFlyerProperties;->getInt(Ljava/lang/String;I)I

    move-result p1

    .line 3181
    iget v2, p0, Lcom/appsflyer/AFDeepLinkManager;->currentActivityHash:I

    if-eq v2, p1, :cond_4

    .line 3182
    invoke-direct {p0, p2, p3, v1}, Lcom/appsflyer/AFDeepLinkManager;->ˏ(Landroid/content/Context;Ljava/util/Map;Landroid/net/Uri;)V

    .line 3183
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object p1

    iget p2, p0, Lcom/appsflyer/AFDeepLinkManager;->currentActivityHash:I

    invoke-virtual {p1, v0, p2}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;I)V

    return-void

    .line 3185
    :cond_4
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " w/hC: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p2, p0, Lcom/appsflyer/AFDeepLinkManager;->currentActivityHash:I

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    return-void

    .line 153
    :cond_5
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    .line 4169
    sget-object v0, Lcom/appsflyer/AFDeepLinkManager;->ˎ:Landroid/net/Uri;

    if-eqz v0, :cond_8

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    goto :goto_3

    .line 4173
    :cond_6
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 4174
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4175
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_7

    const-string p1, " w/sT"

    goto :goto_2

    :cond_7
    const-string p1, " w/cAPI"

    :goto_2
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 4173
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    return-void

    .line 4170
    :cond_8
    :goto_3
    invoke-direct {p0, p2, p3, v1}, Lcom/appsflyer/AFDeepLinkManager;->ˏ(Landroid/content/Context;Ljava/util/Map;Landroid/net/Uri;)V

    .line 4171
    sput-object v1, Lcom/appsflyer/AFDeepLinkManager;->ˎ:Landroid/net/Uri;

    return-void

    .line 157
    :cond_9
    sget-object p1, Lcom/appsflyer/AFDeepLinkManager;->ʻ:Landroid/net/Uri;

    if-eqz p1, :cond_a

    sget-object v1, Lcom/appsflyer/AFDeepLinkManager;->ˎ:Landroid/net/Uri;

    if-eq p1, v1, :cond_a

    .line 158
    invoke-direct {p0, p2, p3, p1}, Lcom/appsflyer/AFDeepLinkManager;->ˏ(Landroid/content/Context;Ljava/util/Map;Landroid/net/Uri;)V

    .line 159
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "using trampoline Intent fallback with URI : "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object p2, Lcom/appsflyer/AFDeepLinkManager;->ʻ:Landroid/net/Uri;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 160
    sput-object v0, Lcom/appsflyer/AFDeepLinkManager;->ʻ:Landroid/net/Uri;

    return-void

    .line 163
    :cond_a
    invoke-static {}, Lcom/appsflyer/AppsFlyerLibCore;->getInstance()Lcom/appsflyer/AppsFlyerLibCore;

    move-result-object p1

    iget-object p1, p1, Lcom/appsflyer/AppsFlyerLibCore;->latestDeepLink:Landroid/net/Uri;

    if-eqz p1, :cond_b

    .line 164
    invoke-static {}, Lcom/appsflyer/AppsFlyerLibCore;->getInstance()Lcom/appsflyer/AppsFlyerLibCore;

    move-result-object p1

    iget-object p1, p1, Lcom/appsflyer/AppsFlyerLibCore;->latestDeepLink:Landroid/net/Uri;

    invoke-direct {p0, p2, p3, p1}, Lcom/appsflyer/AFDeepLinkManager;->ˏ(Landroid/content/Context;Ljava/util/Map;Landroid/net/Uri;)V

    :cond_b
    return-void
.end method
