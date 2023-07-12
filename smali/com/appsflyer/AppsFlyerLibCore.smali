.class public Lcom/appsflyer/AppsFlyerLibCore;
.super Lcom/appsflyer/AppsFlyerLib;
.source ""

# interfaces
.implements Lcom/appsflyer/internal/h;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/appsflyer/AppsFlyerLibCore$a;,
        Lcom/appsflyer/AppsFlyerLibCore$d;,
        Lcom/appsflyer/AppsFlyerLibCore$e;,
        Lcom/appsflyer/AppsFlyerLibCore$c;,
        Lcom/appsflyer/AppsFlyerLibCore$b;
    }
.end annotation


# static fields
.field public static final AF_PRE_INSTALL_PATH:Ljava/lang/String; = "AF_PRE_INSTALL_PATH"

.field public static final ATTRIBUTION_ID_COLUMN_NAME:Ljava/lang/String; = "aid"

.field public static final ATTRIBUTION_ID_CONTENT_URI:Ljava/lang/String; = "content://com.facebook.katana.provider.AttributionIdProvider"

.field public static final IS_STOP_TRACKING_USED:Ljava/lang/String; = "is_stop_tracking_used"

.field public static final LOG_TAG:Ljava/lang/String; = "AppsFlyer_4.10.0"

.field public static final PRE_INSTALL_SYSTEM_DEFAULT:Ljava/lang/String; = "/data/local/tmp/pre_install.appsflyer"

.field public static final PRE_INSTALL_SYSTEM_DEFAULT_ETC:Ljava/lang/String; = "/etc/pre_install.appsflyer"

.field public static final PRE_INSTALL_SYSTEM_RO_PROP:Ljava/lang/String; = "ro.appsflyer.preinstall.path"

.field private static final ʻ:Ljava/lang/String;

.field private static ʻॱ:Lcom/appsflyer/AppsFlyerLibCore; = null

.field private static ʼ:Ljava/lang/String; = null

.field public static ˊ:Lcom/appsflyer/AppsFlyerInAppPurchaseValidatorListener; = null

.field private static final ˊॱ:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static ˋॱ:Ljava/lang/String; = null

.field public static final ˏ:Ljava/lang/String;

.field private static ˏॱ:Lcom/appsflyer/AppsFlyerTrackingRequestListener; = null

.field private static ͺ:Lcom/appsflyer/AppsFlyerConversionListener; = null

.field public static final ॱ:Ljava/lang/String; = "4"

.field private static final ॱˊ:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static ॱॱ:Ljava/lang/String;


# instance fields
.field protected latestDeepLink:Landroid/net/Uri;

.field private ʼॱ:Lcom/appsflyer/internal/p$b;

.field ʽ:J

.field private ʽॱ:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private ʾ:J

.field private ʿ:Z

.field private ˈ:Ljava/util/concurrent/ScheduledExecutorService;

.field private ˉ:Ljava/lang/String;

.field private ˊˊ:J

.field private ˊˋ:Z

.field private ˊᐝ:Z

.field public ˋ:Ljava/lang/String;

.field private ˋˊ:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private ˋˋ:Z

.field private ˋᐝ:Lcom/appsflyer/internal/w;

.field private ˌ:Z

.field private ˍ:Z

.field public ˎ:Ljava/lang/String;

.field private ˎˎ:Z

.field private ॱˋ:J

.field private ॱˎ:J

.field private ॱᐝ:J

.field ᐝ:J

.field private ᐝॱ:Lcom/appsflyer/internal/g;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 107
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/appsflyer/AppsFlyerLibCore;->ॱ:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/androidevent?buildnumber=4.10.0&app_id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/appsflyer/AppsFlyerLibCore;->ʻ:Ljava/lang/String;

    .line 108
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "https://%sattr.%s/api/v"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/appsflyer/AppsFlyerLibCore;->ʻ:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/appsflyer/AppsFlyerLibCore;->ॱॱ:Ljava/lang/String;

    .line 109
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "https://%st.%s/api/v"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/appsflyer/AppsFlyerLibCore;->ʻ:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/appsflyer/AppsFlyerLibCore;->ʼ:Ljava/lang/String;

    .line 110
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "https://%sevents.%s/api/v"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/appsflyer/AppsFlyerLibCore;->ʻ:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/appsflyer/AppsFlyerLibCore;->ˋॱ:Ljava/lang/String;

    .line 111
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "https://%sregister.%s/api/v"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/appsflyer/AppsFlyerLibCore;->ʻ:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/appsflyer/AppsFlyerLibCore;->ˏ:Ljava/lang/String;

    const-string v0, "is_cache"

    .line 123
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/appsflyer/AppsFlyerLibCore;->ॱˊ:Ljava/util/List;

    const-string v0, "googleplay"

    const-string v1, "playstore"

    const-string v2, "googleplaystore"

    .line 124
    filled-new-array {v0, v1, v2}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/appsflyer/AppsFlyerLibCore;->ˊॱ:Ljava/util/List;

    const/4 v0, 0x0

    .line 144
    sput-object v0, Lcom/appsflyer/AppsFlyerLibCore;->ˊ:Lcom/appsflyer/AppsFlyerInAppPurchaseValidatorListener;

    .line 145
    sput-object v0, Lcom/appsflyer/AppsFlyerLibCore;->ͺ:Lcom/appsflyer/AppsFlyerConversionListener;

    .line 146
    sput-object v0, Lcom/appsflyer/AppsFlyerLibCore;->ˏॱ:Lcom/appsflyer/AppsFlyerTrackingRequestListener;

    .line 147
    new-instance v0, Lcom/appsflyer/AppsFlyerLibCore;

    invoke-direct {v0}, Lcom/appsflyer/AppsFlyerLibCore;-><init>()V

    sput-object v0, Lcom/appsflyer/AppsFlyerLibCore;->ʻॱ:Lcom/appsflyer/AppsFlyerLibCore;

    return-void
.end method

.method private constructor <init>()V
    .locals 4

    .line 175
    invoke-direct {p0}, Lcom/appsflyer/AppsFlyerLib;-><init>()V

    const/4 v0, 0x0

    .line 148
    iput-object v0, p0, Lcom/appsflyer/AppsFlyerLibCore;->latestDeepLink:Landroid/net/Uri;

    const-wide/16 v1, -0x1

    .line 151
    iput-wide v1, p0, Lcom/appsflyer/AppsFlyerLibCore;->ॱᐝ:J

    .line 152
    iput-wide v1, p0, Lcom/appsflyer/AppsFlyerLibCore;->ॱˋ:J

    .line 153
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x5

    invoke-virtual {v1, v2, v3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/appsflyer/AppsFlyerLibCore;->ॱˎ:J

    .line 154
    iput-object v0, p0, Lcom/appsflyer/AppsFlyerLibCore;->ᐝॱ:Lcom/appsflyer/internal/g;

    const/4 v1, 0x0

    .line 156
    iput-boolean v1, p0, Lcom/appsflyer/AppsFlyerLibCore;->ʿ:Z

    .line 158
    iput-object v0, p0, Lcom/appsflyer/AppsFlyerLibCore;->ˈ:Ljava/util/concurrent/ScheduledExecutorService;

    .line 163
    iput-boolean v1, p0, Lcom/appsflyer/AppsFlyerLibCore;->ˊˋ:Z

    .line 164
    iput-boolean v1, p0, Lcom/appsflyer/AppsFlyerLibCore;->ˊᐝ:Z

    .line 169
    new-instance v0, Lcom/appsflyer/internal/w;

    invoke-direct {v0}, Lcom/appsflyer/internal/w;-><init>()V

    iput-object v0, p0, Lcom/appsflyer/AppsFlyerLibCore;->ˋᐝ:Lcom/appsflyer/internal/w;

    .line 170
    iput-boolean v1, p0, Lcom/appsflyer/AppsFlyerLibCore;->ˎˎ:Z

    .line 171
    iput-boolean v1, p0, Lcom/appsflyer/AppsFlyerLibCore;->ˍ:Z

    .line 176
    invoke-static {}, Lcom/appsflyer/AFVersionDeclaration;->init()V

    return-void
.end method

.method public static getInstance()Lcom/appsflyer/AppsFlyerLibCore;
    .locals 1

    .line 180
    sget-object v0, Lcom/appsflyer/AppsFlyerLibCore;->ʻॱ:Lcom/appsflyer/AppsFlyerLibCore;

    return-object v0
.end method

.method private static ʻ(Landroid/content/Context;)Z
    .locals 4

    .line 2533
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "collectAndroidIdForceByUser"

    const/4 v2, 0x0

    .line 2534
    invoke-virtual {v0, v1, v2}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_1

    .line 2535
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v3, "collectIMEIForceByUser"

    .line 2536
    invoke-virtual {v0, v3, v2}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    if-nez v0, :cond_3

    .line 2538
    invoke-static {p0}, Lcom/appsflyer/AppsFlyerLibCore;->ʽ(Landroid/content/Context;)Z

    move-result p0

    if-nez p0, :cond_2

    goto :goto_2

    :cond_2
    return v2

    :cond_3
    :goto_2
    return v1
.end method

.method private static ʼ(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    .line 2560
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "api_store_value"

    invoke-virtual {v0, v1}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    .line 2566
    :cond_0
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    const-string p0, "AF_STORE"

    invoke-static {v0, p0}, Lcom/appsflyer/AppsFlyerLibCore;->ˋ(Ljava/lang/ref/WeakReference;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_1

    return-object p0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method private static ʼ(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 50676
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "appsflyer-data"

    const/4 v2, 0x0

    .line 50677
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "CACHED_CHANNEL"

    .line 2797
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 p0, 0x0

    .line 2798
    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 2801
    :cond_0
    invoke-static {p0, v1, p1}, Lcom/appsflyer/AppsFlyerLibCore;->ˋ(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    return-object p1
.end method

.method private static ʽ(Landroid/content/Context;)Z
    .locals 3

    const/4 v0, 0x1

    .line 2426
    :try_start_0
    invoke-static {}, Lcom/google/android/gms/common/GoogleApiAvailability;->getInstance()Lcom/google/android/gms/common/GoogleApiAvailability;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/google/android/gms/common/GoogleApiAvailability;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    return v0

    :catchall_0
    move-exception v1

    const-string v2, "WARNING:  Google play services is unavailable. "

    .line 2432
    invoke-static {v2, v1}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    const/4 v1, 0x0

    .line 2436
    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const-string v2, "com.google.android.gms"

    invoke-virtual {p0, v2, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    return v0

    :catch_0
    move-exception p0

    const-string v0, "WARNING:  Google Play Services is unavailable. "

    .line 2439
    invoke-static {v0, p0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    return v1
.end method

.method static ˊ(Landroid/content/SharedPreferences;Ljava/lang/String;Z)I
    .locals 1

    const/4 v0, 0x0

    .line 2865
    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    if-eqz p2, :cond_1

    add-int/lit8 v0, v0, 0x1

    .line 2869
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 2870
    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 50678
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p2, 0x9

    if-lt p1, p2, :cond_0

    .line 50679
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_0

    .line 50681
    :cond_0
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 50684
    :cond_1
    :goto_0
    sget-object p0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez p0, :cond_2

    .line 50685
    new-instance p0, Lcom/appsflyer/internal/x;

    invoke-direct {p0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object p0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 50687
    :cond_2
    sget-object p0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 50688
    iget-boolean p0, p0, Lcom/appsflyer/internal/x;->ˋ:Z

    if-eqz p0, :cond_4

    .line 50689
    sget-object p0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez p0, :cond_3

    .line 50690
    new-instance p0, Lcom/appsflyer/internal/x;

    invoke-direct {p0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object p0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 50692
    :cond_3
    sget-object p0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 2875
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/appsflyer/internal/x;->ॱ(Ljava/lang/String;)V

    :cond_4
    return v0
.end method

.method static synthetic ˊ(Lcom/appsflyer/AppsFlyerLibCore;J)J
    .locals 0

    .line 84
    iput-wide p1, p0, Lcom/appsflyer/AppsFlyerLibCore;->ʾ:J

    return-wide p1
.end method

.method public static ˊ(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .locals 2

    .line 2850
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const-string v0, "appsflyer-data"

    const/4 v1, 0x0

    .line 2851
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method private static ˊ(Ljava/io/File;Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    const/4 v0, 0x0

    .line 2685
    :try_start_0
    new-instance v1, Ljava/util/Properties;

    invoke-direct {v1}, Ljava/util/Properties;-><init>()V

    .line 2686
    new-instance v2, Ljava/io/FileReader;

    invoke-direct {v2, p0}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 2687
    :try_start_1
    invoke-virtual {v1, v2}, Ljava/util/Properties;->load(Ljava/io/Reader;)V

    const-string v3, "Found PreInstall property!"

    .line 2688
    invoke-static {v3}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 2689
    invoke-virtual {v1, p1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 2697
    :try_start_2
    invoke-virtual {v2}, Ljava/io/Reader;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    .line 2700
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-object p0

    :catchall_1
    move-exception p0

    goto :goto_1

    :catchall_2
    move-exception p0

    move-object v2, v0

    .line 2693
    :goto_1
    :try_start_3
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_4

    if-eqz v2, :cond_0

    .line 2697
    :try_start_4
    invoke-virtual {v2}, Ljava/io/Reader;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    goto :goto_2

    :catchall_3
    move-exception p0

    .line 2700
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    :catch_0
    move-object v2, v0

    .line 2691
    :catch_1
    :try_start_5
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "PreInstall file wasn\'t found: "

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    if-eqz v2, :cond_0

    .line 2697
    :try_start_6
    invoke-virtual {v2}, Ljava/io/Reader;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    :cond_0
    :goto_2
    return-object v0

    :catchall_4
    move-exception p0

    if-eqz v2, :cond_1

    :try_start_7
    invoke-virtual {v2}, Ljava/io/Reader;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_5

    goto :goto_3

    :catchall_5
    move-exception p1

    .line 2700
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2701
    :cond_1
    :goto_3
    throw p0
.end method

.method private static ˊ(Ljava/lang/String;Landroid/content/pm/PackageManager;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    const/16 v0, 0x80

    const/4 v1, 0x0

    .line 2598
    :try_start_0
    invoke-virtual {p1, p2, v0}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object p1

    .line 2599
    iget-object p1, p1, Landroid/content/pm/PackageItemInfo;->metaData:Landroid/os/Bundle;

    if-eqz p1, :cond_0

    .line 2601
    invoke-virtual {p1, p0}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 2603
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v1, p0

    goto :goto_0

    :catchall_0
    move-exception p1

    .line 2607
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Could not find "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " value in the manifest"

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, p1}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    return-object v1
.end method

.method static synthetic ˊ(Ljava/lang/ref/WeakReference;)Ljava/lang/String;
    .locals 0

    .line 84
    invoke-static {p0}, Lcom/appsflyer/AppsFlyerLibCore;->ˋ(Ljava/lang/ref/WeakReference;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic ˊ()Ljava/util/List;
    .locals 1

    .line 84
    sget-object v0, Lcom/appsflyer/AppsFlyerLibCore;->ˊॱ:Ljava/util/List;

    return-object v0
.end method

.method static synthetic ˊ(Ljava/lang/String;)Ljava/util/Map;
    .locals 0

    .line 84
    invoke-static {p0}, Lcom/appsflyer/AppsFlyerLibCore;->ˏ(Ljava/lang/String;)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method private static ˊ(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3

    .line 184
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.appsflyer.testIntgrationBroadcast"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "params"

    .line 185
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 186
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt p1, v1, :cond_1

    .line 4194
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    const/4 v1, 0x0

    .line 4195
    invoke-virtual {p1, v0, v1}, Landroid/content/pm/PackageManager;->queryBroadcastReceivers(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object p1

    .line 4197
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "com.appsflyer.referrerSender"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 4198
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 4199
    new-instance v0, Landroid/content/ComponentName;

    const-string v2, "com.appsflyer.referrerSender.Receiver"

    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 4201
    invoke-virtual {p1, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 4202
    invoke-virtual {p0, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    :cond_0
    return-void

    .line 189
    :cond_1
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic ˊ(Landroid/content/Context;Ljava/lang/String;J)V
    .locals 0

    .line 84
    invoke-static {p0, p1, p2, p3}, Lcom/appsflyer/AppsFlyerLibCore;->ˎ(Landroid/content/Context;Ljava/lang/String;J)V

    return-void
.end method

.method static synthetic ˊ(Lcom/appsflyer/AppsFlyerLibCore;)Z
    .locals 0

    .line 84
    iget-boolean p0, p0, Lcom/appsflyer/AppsFlyerLibCore;->ʿ:Z

    return p0
.end method

.method static synthetic ˋ()Lcom/appsflyer/AppsFlyerConversionListener;
    .locals 1

    .line 84
    sget-object v0, Lcom/appsflyer/AppsFlyerLibCore;->ͺ:Lcom/appsflyer/AppsFlyerConversionListener;

    return-object v0
.end method

.method private static ˋ(Ljava/lang/String;)Ljava/io/File;
    .locals 1

    if-eqz p0, :cond_0

    .line 2712
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 2713
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    :catchall_0
    move-exception p0

    .line 2716
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private static ˋ(Ljava/lang/ref/WeakReference;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 2768
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "channel"

    invoke-virtual {v0, v1}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "CHANNEL"

    .line 2770
    invoke-static {p0, v0}, Lcom/appsflyer/AppsFlyerLibCore;->ˋ(Ljava/lang/ref/WeakReference;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_0
    if-eqz v0, :cond_1

    const-string p0, ""

    .line 2772
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x0

    return-object p0

    :cond_1
    return-object v0
.end method

.method private static ˋ(Ljava/lang/ref/WeakReference;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 2588
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 2591
    :cond_0
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, v0, p0}, Lcom/appsflyer/AppsFlyerLibCore;->ˊ(Ljava/lang/String;Landroid/content/pm/PackageManager;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static ˋ(Landroid/content/Context;)V
    .locals 4

    const-string v0, "OPPO"

    .line 50046
    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x17

    const-string v1, "OPPO device found"

    .line 981
    invoke-static {v1}, Lcom/appsflyer/AFLogger;->afRDLog(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const/16 v0, 0x12

    .line 984
    :goto_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v1, v0, :cond_2

    const-string v0, "keyPropDisableAFKeystore"

    .line 50050
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_2

    .line 985
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "OS SDK is="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "; use KeyStore"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afRDLog(Ljava/lang/String;)V

    .line 986
    new-instance v0, Lcom/appsflyer/AFKeystoreWrapper;

    invoke-direct {v0, p0}, Lcom/appsflyer/AFKeystoreWrapper;-><init>(Landroid/content/Context;)V

    .line 987
    invoke-virtual {v0}, Lcom/appsflyer/AFKeystoreWrapper;->ˏ()Z

    move-result v1

    if-nez v1, :cond_1

    .line 988
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {v1}, Lcom/appsflyer/internal/u;->ˋ(Ljava/lang/ref/WeakReference;)Ljava/lang/String;

    move-result-object p0

    .line 50051
    iput-object p0, v0, Lcom/appsflyer/AFKeystoreWrapper;->ˎ:Ljava/lang/String;

    .line 50052
    iput v2, v0, Lcom/appsflyer/AFKeystoreWrapper;->ˏ:I

    .line 50053
    invoke-virtual {v0}, Lcom/appsflyer/AFKeystoreWrapper;->ˊ()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/appsflyer/AFKeystoreWrapper;->ˏ(Ljava/lang/String;)V

    goto :goto_2

    .line 50055
    :cond_1
    invoke-virtual {v0}, Lcom/appsflyer/AFKeystoreWrapper;->ˊ()Ljava/lang/String;

    move-result-object p0

    .line 50056
    iget-object v1, v0, Lcom/appsflyer/AFKeystoreWrapper;->ॱ:Ljava/lang/Object;

    monitor-enter v1

    .line 50057
    :try_start_0
    iget v2, v0, Lcom/appsflyer/AFKeystoreWrapper;->ˏ:I

    add-int/lit8 v2, v2, 0x1

    iput v2, v0, Lcom/appsflyer/AFKeystoreWrapper;->ˏ:I

    const-string v2, "Deleting key with alias: "

    .line 50062
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 50064
    :try_start_1
    iget-object v2, v0, Lcom/appsflyer/AFKeystoreWrapper;->ॱ:Ljava/lang/Object;

    monitor-enter v2
    :try_end_1
    .catch Ljava/security/KeyStoreException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 50065
    :try_start_2
    iget-object v3, v0, Lcom/appsflyer/AFKeystoreWrapper;->ˊ:Ljava/security/KeyStore;

    invoke-virtual {v3, p0}, Ljava/security/KeyStore;->deleteEntry(Ljava/lang/String;)V

    .line 50066
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p0

    :try_start_3
    monitor-exit v2

    throw p0
    :try_end_3
    .catch Ljava/security/KeyStoreException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :catch_0
    move-exception p0

    .line 50068
    :try_start_4
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Exception "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " occurred"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, p0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 50059
    :goto_1
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 50060
    invoke-virtual {v0}, Lcom/appsflyer/AFKeystoreWrapper;->ˊ()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/appsflyer/AFKeystoreWrapper;->ˏ(Ljava/lang/String;)V

    :goto_2
    const-string p0, "KSAppsFlyerId"

    .line 992
    invoke-virtual {v0}, Lcom/appsflyer/AFKeystoreWrapper;->ˋ()Ljava/lang/String;

    move-result-object v1

    .line 50071
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v2

    invoke-virtual {v2, p0, v1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "KSAppsFlyerRICounter"

    .line 993
    invoke-virtual {v0}, Lcom/appsflyer/AFKeystoreWrapper;->ॱ()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    .line 50073
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v1

    invoke-virtual {v1, p0, v0}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :catchall_1
    move-exception p0

    .line 50059
    monitor-exit v1

    throw p0

    .line 995
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "OS SDK is="

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "; no KeyStore usage"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/appsflyer/AFLogger;->afRDLog(Ljava/lang/String;)V

    return-void
.end method

.method private static ˋ(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 21850
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const-string v0, "appsflyer-data"

    const/4 v1, 0x0

    .line 21851
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 521
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 522
    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 22377
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p2, 0x9

    if-lt p1, p2, :cond_0

    .line 22378
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void

    .line 22380
    :cond_0
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method private static ˋ(Landroid/content/Context;Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "-",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 2179
    invoke-static {}, Lcom/appsflyer/internal/f;->ˏ()Lcom/appsflyer/internal/f;

    invoke-static {p0}, Lcom/appsflyer/internal/f;->ˋ(Landroid/content/Context;)Lcom/appsflyer/internal/f$e;

    move-result-object p0

    .line 50596
    iget-object v0, p0, Lcom/appsflyer/internal/f$e;->ˊ:Ljava/lang/String;

    const-string v1, "network"

    .line 2180
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2181
    iget-object v0, p0, Lcom/appsflyer/internal/f$e;->ˏ:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 50598
    iget-object v0, p0, Lcom/appsflyer/internal/f$e;->ˏ:Ljava/lang/String;

    const-string v1, "operator"

    .line 2182
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2184
    :cond_0
    iget-object v0, p0, Lcom/appsflyer/internal/f$e;->ˋ:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 50600
    iget-object p0, p0, Lcom/appsflyer/internal/f$e;->ˋ:Ljava/lang/String;

    const-string v0, "carrier"

    .line 2185
    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    return-void
.end method

.method static synthetic ˋ(Ljava/util/Map;)V
    .locals 1

    .line 50748
    sget-object v0, Lcom/appsflyer/AppsFlyerLibCore;->ͺ:Lcom/appsflyer/AppsFlyerConversionListener;

    if-eqz v0, :cond_0

    .line 50751
    :try_start_0
    invoke-interface {v0, p0}, Lcom/appsflyer/AppsFlyerConversionListener;->onAppOpenAttribution(Ljava/util/Map;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p0

    .line 50753
    invoke-virtual {p0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method static synthetic ˋ(Lcom/appsflyer/AppsFlyerLibCore;)Z
    .locals 0

    .line 50858
    iget-object p0, p0, Lcom/appsflyer/AppsFlyerLibCore;->ʽॱ:Ljava/util/Map;

    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result p0

    if-lez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method static synthetic ˎ(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 84
    invoke-static {p0, p1}, Lcom/appsflyer/AppsFlyerLibCore;->ʼ(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic ˎ(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 50880
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static ˎ(Landroid/content/Context;)Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/appsflyer/internal/s;
        }
    .end annotation

    .line 50161
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const-string v0, "appsflyer-data"

    const/4 v1, 0x0

    .line 50162
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "attributionId"

    const/4 v1, 0x0

    .line 1342
    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 1344
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 1345
    invoke-static {p0}, Lcom/appsflyer/AppsFlyerLibCore;->ˏ(Ljava/lang/String;)Ljava/util/Map;

    move-result-object p0

    return-object p0

    .line 1347
    :cond_0
    new-instance p0, Lcom/appsflyer/internal/s;

    invoke-direct {p0}, Lcom/appsflyer/internal/s;-><init>()V

    throw p0
.end method

.method static synthetic ˎ(Lcom/appsflyer/AppsFlyerLibCore;)Ljava/util/concurrent/ScheduledExecutorService;
    .locals 0

    .line 84
    iget-object p0, p0, Lcom/appsflyer/AppsFlyerLibCore;->ˈ:Ljava/util/concurrent/ScheduledExecutorService;

    return-object p0
.end method

.method private static ˎ(Landroid/content/Context;Ljava/lang/String;J)V
    .locals 2

    .line 23850
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const-string v0, "appsflyer-data"

    const/4 v1, 0x0

    .line 23851
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 24545
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 24546
    invoke-interface {p0, p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 25377
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p2, 0x9

    if-lt p1, p2, :cond_0

    .line 25378
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void

    .line 25380
    :cond_0
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method private static ˎ(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1222
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "shouldMonitor"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1224
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.appsflyer.MonitorBroadcast"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.appsflyer.nightvision"

    .line 1225
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "message"

    .line 1226
    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p2, "value"

    .line 1227
    invoke-virtual {v0, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p2, "packageName"

    const-string p3, "true"

    .line 1228
    invoke-virtual {v0, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1229
    new-instance p2, Ljava/lang/Integer;

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result p3

    invoke-direct {p2, p3}, Ljava/lang/Integer;-><init>(I)V

    const-string p3, "pid"

    invoke-virtual {v0, p3, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    const-string p2, "eventIdentifier"

    .line 1230
    invoke-virtual {v0, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "sdk"

    const-string p2, "4.10.0"

    .line 1231
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1233
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method private ˎ(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;Ljava/lang/String;)V
    .locals 15

    .line 1495
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez p3, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    .line 50195
    :goto_0
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v4

    const-string v5, "waitForCustomerId"

    invoke-virtual {v4, v5, v1}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 50196
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v4

    const-string v5, "AppUserId"

    invoke-virtual {v4, v5}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_1

    const/4 v1, 0x1

    :cond_1
    if-eqz v1, :cond_2

    const-string v0, "CustomerUserId not set, Tracking is disabled"

    .line 1499
    invoke-static {v0, v2}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;Z)V

    return-void

    :cond_2
    if-eqz v3, :cond_5

    .line 1506
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v1

    const-string v3, "launchProtectEnabled"

    .line 1507
    invoke-virtual {v1, v3, v2}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1509
    invoke-direct {p0}, Lcom/appsflyer/AppsFlyerLibCore;->ॱ()Z

    move-result v1

    if-eqz v1, :cond_4

    return-void

    :cond_3
    const-string v1, "Allowing multiple launches within a 5 second time window."

    .line 1513
    invoke-static {v1}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 1515
    :cond_4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    move-object v14, p0

    iput-wide v1, v14, Lcom/appsflyer/AppsFlyerLibCore;->ॱᐝ:J

    goto :goto_1

    :cond_5
    move-object v14, p0

    .line 1518
    :goto_1
    invoke-static {}, Lcom/appsflyer/AFExecutor;->getInstance()Lcom/appsflyer/AFExecutor;

    move-result-object v1

    invoke-virtual {v1}, Lcom/appsflyer/AFExecutor;->ˏ()Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    move-result-object v1

    .line 1519
    new-instance v2, Lcom/appsflyer/AppsFlyerLibCore$b;

    new-instance v5, Ljava/lang/ref/WeakReference;

    invoke-direct {v5, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    const/4 v10, 0x0

    const/4 v13, 0x0

    move-object v3, v2

    move-object v4, p0

    move-object/from16 v6, p2

    move-object/from16 v7, p3

    move-object/from16 v8, p4

    move-object/from16 v9, p5

    move-object/from16 v11, p6

    move-object/from16 v12, p7

    invoke-direct/range {v3 .. v13}, Lcom/appsflyer/AppsFlyerLibCore$b;-><init>(Lcom/appsflyer/AppsFlyerLibCore;Ljava/lang/ref/WeakReference;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/content/Intent;Ljava/lang/String;B)V

    const-wide/16 v3, 0x96

    .line 1529
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {v1, v2, v3, v4, v0}, Lcom/appsflyer/AppsFlyerLibCore;->ˏ(Ljava/util/concurrent/ScheduledExecutorService;Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)V

    return-void
.end method

.method private ˎ(Ljava/net/URL;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ref/WeakReference;Ljava/lang/String;Z)V
    .locals 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URL;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v0, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p5

    const-string v4, "is_first_launch"

    const-string v5, "appsflyerConversionDataCacheExpiration"

    .line 2944
    invoke-virtual/range {p4 .. p4}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/Context;

    const/4 v7, 0x1

    const/4 v8, 0x0

    if-eqz p6, :cond_0

    .line 2945
    sget-object v9, Lcom/appsflyer/AppsFlyerLibCore;->ͺ:Lcom/appsflyer/AppsFlyerConversionListener;

    if-eqz v9, :cond_0

    const/4 v9, 0x1

    goto :goto_0

    :cond_0
    const/4 v9, 0x0

    .line 50699
    :goto_0
    :try_start_0
    sget-object v11, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_5

    if-nez v11, :cond_1

    .line 50700
    :try_start_1
    new-instance v11, Lcom/appsflyer/internal/x;

    invoke-direct {v11}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v11, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    const/4 v10, 0x0

    goto/16 :goto_8

    .line 50702
    :cond_1
    :goto_1
    :try_start_2
    sget-object v11, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 2948
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v12

    const-string v13, "server_request"

    new-array v14, v7, [Ljava/lang/String;

    aput-object v0, v14, v8

    .line 50703
    invoke-virtual {v11, v13, v12, v14}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 2949
    invoke-virtual/range {p1 .. p1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v11

    check-cast v11, Ljava/net/HttpURLConnection;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_5

    :try_start_3
    const-string v12, "POST"

    .line 2950
    invoke-virtual {v11, v12}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 2951
    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->getBytes()[B

    move-result-object v12

    array-length v12, v12

    const-string v13, "Content-Length"

    .line 2952
    invoke-static {v12}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v13, v12}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v12, "Content-Type"

    const-string v13, "application/json"

    .line 2953
    invoke-virtual {v11, v12, v13}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const/16 v12, 0x2710

    .line 2954
    invoke-virtual {v11, v12}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 2955
    invoke-virtual {v11, v7}, Ljava/net/URLConnection;->setDoOutput(Z)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_4

    .line 2960
    :try_start_4
    new-instance v12, Ljava/io/OutputStreamWriter;

    invoke-virtual {v11}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v13

    const-string v14, "UTF-8"

    invoke-direct {v12, v13, v14}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 2961
    :try_start_5
    invoke-virtual {v12, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 2964
    :try_start_6
    invoke-virtual {v12}, Ljava/io/Writer;->close()V

    .line 2973
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0

    .line 2975
    invoke-static {v11}, Lcom/appsflyer/AppsFlyerLibCore;->ॱ(Ljava/net/HttpURLConnection;)Ljava/lang/String;

    move-result-object v12

    .line 50705
    sget-object v13, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v13, :cond_2

    .line 50706
    new-instance v13, Lcom/appsflyer/internal/x;

    invoke-direct {v13}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v13, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 50708
    :cond_2
    sget-object v13, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 2976
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v14

    const-string v15, "server_response"

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/String;

    .line 50709
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v16

    aput-object v16, v10, v8

    aput-object v12, v10, v7

    invoke-virtual {v13, v15, v14, v10}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    const-string v10, "response code: "

    .line 2977
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v10, v13}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    const-string v10, "AppsFlyer_4.10.0"

    const-string v13, "SERVER_RESPONSE_CODE"

    .line 2978
    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v14

    invoke-static {v6, v10, v13, v14}, Lcom/appsflyer/AppsFlyerLibCore;->ˎ(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 50711
    invoke-virtual {v6}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v10

    const-string v13, "appsflyer-data"

    .line 50712
    invoke-virtual {v10, v13, v8}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v10

    const/16 v13, 0xc8

    if-ne v0, v13, :cond_a

    .line 2984
    invoke-virtual/range {p4 .. p4}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_3

    if-eqz p6, :cond_3

    .line 2985
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v13

    iput-wide v13, v1, Lcom/appsflyer/AppsFlyerLibCore;->ॱˋ:J

    .line 2986
    sget-object v0, Lcom/appsflyer/AppsFlyerLibCore;->ˏॱ:Lcom/appsflyer/AppsFlyerTrackingRequestListener;

    if-eqz v0, :cond_3

    .line 2987
    sget-object v0, Lcom/appsflyer/AppsFlyerLibCore;->ˏॱ:Lcom/appsflyer/AppsFlyerTrackingRequestListener;

    invoke-interface {v0}, Lcom/appsflyer/AppsFlyerTrackingRequestListener;->onTrackingRequestSuccess()V

    :cond_3
    const-string v0, "afUninstallToken"

    .line 50713
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v13

    invoke-virtual {v13, v0}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_4

    const-string v13, "Uninstall Token exists: "

    .line 2993
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    const-string v13, "sentRegisterRequestToAF"

    .line 2995
    invoke-interface {v10, v13, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v13

    if-nez v13, :cond_5

    const-string v13, "Resending Uninstall token to AF servers: "

    .line 2997
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 2998
    new-instance v13, Lcom/appsflyer/internal/b$b$a;

    invoke-direct {v13, v0}, Lcom/appsflyer/internal/b$b$a;-><init>(Ljava/lang/String;)V

    .line 2999
    invoke-static {v6, v13}, Lcom/appsflyer/internal/v;->ॱ(Landroid/content/Context;Lcom/appsflyer/internal/b$b$a;)V

    goto :goto_2

    :cond_4
    const-string v0, "gcmProjectNumber"

    .line 50714
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v13

    invoke-virtual {v13, v0}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_5

    const-string v0, "GCM Project number exists. Fetching token and sending to AF servers"

    .line 3003
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 3004
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v6}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 50715
    new-instance v13, Lcom/appsflyer/internal/v$e;

    invoke-direct {v13, v0}, Lcom/appsflyer/internal/v$e;-><init>(Ljava/lang/ref/WeakReference;)V

    new-array v0, v8, [Ljava/lang/Void;

    invoke-virtual {v13, v0}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 3007
    :cond_5
    :goto_2
    iget-object v0, v1, Lcom/appsflyer/AppsFlyerLibCore;->latestDeepLink:Landroid/net/Uri;

    if-eqz v0, :cond_6

    const/4 v13, 0x0

    .line 3008
    iput-object v13, v1, Lcom/appsflyer/AppsFlyerLibCore;->latestDeepLink:Landroid/net/Uri;

    :cond_6
    if-eqz v3, :cond_7

    .line 3011
    invoke-static {}, Lcom/appsflyer/cache/CacheManager;->getInstance()Lcom/appsflyer/cache/CacheManager;

    move-result-object v0

    invoke-virtual {v0, v3, v6}, Lcom/appsflyer/cache/CacheManager;->deleteRequest(Ljava/lang/String;Landroid/content/Context;)V

    .line 3013
    :cond_7
    invoke-virtual/range {p4 .. p4}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_9

    if-nez v3, :cond_9

    const-string v0, "sentSuccessfully"

    const-string v3, "true"

    .line 3015
    invoke-static {v6, v0, v3}, Lcom/appsflyer/AppsFlyerLibCore;->ˋ(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 50717
    iget-boolean v0, v1, Lcom/appsflyer/AppsFlyerLibCore;->ʿ:Z

    if-nez v0, :cond_9

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v13

    iget-wide v7, v1, Lcom/appsflyer/AppsFlyerLibCore;->ʾ:J

    sub-long/2addr v13, v7

    const-wide/16 v7, 0x3a98

    cmp-long v0, v13, v7

    if-gez v0, :cond_8

    goto :goto_3

    .line 50720
    :cond_8
    iget-object v0, v1, Lcom/appsflyer/AppsFlyerLibCore;->ˈ:Ljava/util/concurrent/ScheduledExecutorService;

    if-nez v0, :cond_9

    .line 50723
    invoke-static {}, Lcom/appsflyer/AFExecutor;->getInstance()Lcom/appsflyer/AFExecutor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/appsflyer/AFExecutor;->ˏ()Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    move-result-object v0

    iput-object v0, v1, Lcom/appsflyer/AppsFlyerLibCore;->ˈ:Ljava/util/concurrent/ScheduledExecutorService;

    .line 50725
    new-instance v0, Lcom/appsflyer/AppsFlyerLibCore$a;

    invoke-direct {v0, v1, v6}, Lcom/appsflyer/AppsFlyerLibCore$a;-><init>(Lcom/appsflyer/AppsFlyerLibCore;Landroid/content/Context;)V

    .line 50728
    iget-object v7, v1, Lcom/appsflyer/AppsFlyerLibCore;->ˈ:Ljava/util/concurrent/ScheduledExecutorService;

    const-wide/16 v13, 0x1

    sget-object v8, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {v7, v0, v13, v14, v8}, Lcom/appsflyer/AppsFlyerLibCore;->ˏ(Ljava/util/concurrent/ScheduledExecutorService;Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)V

    .line 3019
    :cond_9
    :goto_3
    invoke-static {v12}, Lcom/appsflyer/ServerConfigHandler;->ˏ(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v7, "send_background"

    const/4 v8, 0x0

    .line 3021
    invoke-virtual {v0, v7, v8}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, v1, Lcom/appsflyer/AppsFlyerLibCore;->ˎˎ:Z

    goto :goto_4

    .line 3023
    :cond_a
    sget-object v7, Lcom/appsflyer/AppsFlyerLibCore;->ˏॱ:Lcom/appsflyer/AppsFlyerTrackingRequestListener;

    if-eqz v7, :cond_b

    const-string v7, "Failure: "

    .line 3024
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 3025
    sget-object v7, Lcom/appsflyer/AppsFlyerLibCore;->ˏॱ:Lcom/appsflyer/AppsFlyerTrackingRequestListener;

    invoke-interface {v7, v0}, Lcom/appsflyer/AppsFlyerTrackingRequestListener;->onTrackingRequestFailure(Ljava/lang/String;)V

    :cond_b
    :goto_4
    const-string v0, "appsflyerConversionDataRequestRetries"

    const/4 v7, 0x0

    .line 3029
    invoke-interface {v10, v0, v7}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    const-wide/16 v7, 0x0

    .line 3031
    invoke-interface {v10, v5, v7, v8}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v12
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    const-string v14, "attributionId"

    cmp-long v16, v12, v7

    if-eqz v16, :cond_c

    .line 3032
    :try_start_7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v16

    sub-long v16, v16, v12

    const-wide v12, 0x134fd9000L

    cmp-long v18, v16, v12

    if-lez v18, :cond_c

    const/4 v12, 0x0

    .line 3033
    invoke-static {v6, v14, v12}, Lcom/appsflyer/AppsFlyerLibCore;->ˋ(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 3034
    invoke-static {v6, v5, v7, v8}, Lcom/appsflyer/AppsFlyerLibCore;->ˎ(Landroid/content/Context;Ljava/lang/String;J)V

    :cond_c
    const/4 v5, 0x0

    .line 3037
    invoke-interface {v10, v14, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_d

    if-eqz v2, :cond_d

    if-eqz v9, :cond_d

    sget-object v5, Lcom/appsflyer/AppsFlyerLibCore;->ͺ:Lcom/appsflyer/AppsFlyerConversionListener;

    if-eqz v5, :cond_d

    const/4 v5, 0x5

    if-gt v0, v5, :cond_d

    .line 3039
    invoke-static {}, Lcom/appsflyer/AFExecutor;->getInstance()Lcom/appsflyer/AFExecutor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/appsflyer/AFExecutor;->ˏ()Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    move-result-object v0

    .line 3041
    new-instance v3, Lcom/appsflyer/AppsFlyerLibCore$e;

    invoke-virtual {v6}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v1, v4, v2, v0}, Lcom/appsflyer/AppsFlyerLibCore$e;-><init>(Lcom/appsflyer/AppsFlyerLibCore;Landroid/content/Context;Ljava/lang/String;Ljava/util/concurrent/ScheduledExecutorService;)V

    const-wide/16 v4, 0xa

    .line 3044
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {v0, v3, v4, v5, v2}, Lcom/appsflyer/AppsFlyerLibCore;->ˏ(Ljava/util/concurrent/ScheduledExecutorService;Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)V

    goto :goto_5

    :cond_d
    if-nez v2, :cond_e

    const-string v0, "AppsFlyer dev key is missing."

    .line 3048
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afWarnLog(Ljava/lang/String;)V

    goto :goto_5

    :cond_e
    if-eqz v9, :cond_10

    .line 3049
    sget-object v0, Lcom/appsflyer/AppsFlyerLibCore;->ͺ:Lcom/appsflyer/AppsFlyerConversionListener;

    if-eqz v0, :cond_10

    const/4 v2, 0x0

    .line 3051
    invoke-interface {v10, v14, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_10

    const-string v0, "appsFlyerCount"

    const/4 v2, 0x0

    .line 50730
    invoke-static {v10, v0, v2}, Lcom/appsflyer/AppsFlyerLibCore;->ˊ(Landroid/content/SharedPreferences;Ljava/lang/String;Z)I

    move-result v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    const/4 v3, 0x1

    if-le v0, v3, :cond_10

    .line 3056
    :try_start_8
    invoke-static {v6}, Lcom/appsflyer/AppsFlyerLibCore;->ˎ(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v0
    :try_end_8
    .catch Lcom/appsflyer/internal/s; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    if-eqz v0, :cond_10

    .line 3060
    :try_start_9
    invoke-interface {v0, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_f

    .line 3061
    invoke-static {v2}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3064
    :cond_f
    sget-object v2, Lcom/appsflyer/AppsFlyerLibCore;->ͺ:Lcom/appsflyer/AppsFlyerConversionListener;

    invoke-interface {v2, v0}, Lcom/appsflyer/AppsFlyerConversionListener;->onInstallConversionDataLoaded(Ljava/util/Map;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    goto :goto_5

    :catchall_1
    move-exception v0

    .line 3066
    :try_start_a
    invoke-virtual {v0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_a
    .catch Lcom/appsflyer/internal/s; {:try_start_a .. :try_end_a} :catch_0
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    goto :goto_5

    :catch_0
    move-exception v0

    .line 3070
    :try_start_b
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    :cond_10
    :goto_5
    if-eqz v11, :cond_11

    .line 3075
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_11
    return-void

    :catchall_2
    move-exception v0

    move-object v10, v12

    goto :goto_6

    :catchall_3
    move-exception v0

    const/4 v2, 0x0

    move-object v10, v2

    :goto_6
    if-nez v10, :cond_12

    .line 2966
    :try_start_c
    sget-object v2, Lcom/appsflyer/AppsFlyerLibCore;->ˏॱ:Lcom/appsflyer/AppsFlyerTrackingRequestListener;

    if-eqz v2, :cond_13

    .line 2967
    sget-object v2, Lcom/appsflyer/AppsFlyerLibCore;->ˏॱ:Lcom/appsflyer/AppsFlyerTrackingRequestListener;

    const-string v3, "No Connectivity"

    invoke-interface {v2, v3}, Lcom/appsflyer/AppsFlyerTrackingRequestListener;->onTrackingRequestFailure(Ljava/lang/String;)V

    goto :goto_7

    .line 2964
    :cond_12
    invoke-virtual {v10}, Ljava/io/Writer;->close()V

    .line 2967
    :cond_13
    :goto_7
    throw v0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_4

    :catchall_4
    move-exception v0

    move-object v10, v11

    goto :goto_8

    :catchall_5
    move-exception v0

    const/4 v2, 0x0

    move-object v10, v2

    :goto_8
    if-eqz v10, :cond_14

    .line 3075
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_14
    throw v0
.end method

.method private static ˎ(Lorg/json/JSONObject;)V
    .locals 14

    .line 280
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 282
    invoke-virtual {p0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .line 283
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    .line 284
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 289
    :try_start_0
    new-instance v4, Lorg/json/JSONArray;

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-direct {v4, v2}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 290
    :goto_1
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v3, v2, :cond_0

    .line 291
    invoke-virtual {v4, v3}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :catch_0
    nop

    goto :goto_0

    .line 299
    :cond_1
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 303
    invoke-virtual {p0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    :cond_2
    :goto_2
    move-object v4, v2

    .line 304
    :cond_3
    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    if-nez v4, :cond_5

    .line 305
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 308
    :try_start_1
    new-instance v6, Lorg/json/JSONArray;

    invoke-virtual {p0, v5}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-direct {v6, v7}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    const/4 v7, 0x0

    .line 311
    :goto_4
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v7, v8, :cond_3

    .line 313
    invoke-virtual {v6, v7}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v8

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Long;

    invoke-virtual {v10}, Ljava/lang/Number;->longValue()J

    move-result-wide v10

    cmp-long v12, v8, v10

    if-eqz v12, :cond_2

    .line 314
    invoke-virtual {v6, v7}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v8

    const/4 v10, 0x1

    invoke-interface {v0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Long;

    invoke-virtual {v11}, Ljava/lang/Number;->longValue()J

    move-result-wide v11

    cmp-long v13, v8, v11

    if-eqz v13, :cond_2

    .line 315
    invoke-virtual {v6, v7}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v8

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v11

    sub-int/2addr v11, v10

    invoke-interface {v0, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Long;

    invoke-virtual {v10}, Ljava/lang/Number;->longValue()J

    move-result-wide v10
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    cmp-long v4, v8, v10

    if-nez v4, :cond_4

    goto :goto_2

    :cond_4
    add-int/lit8 v7, v7, 0x1

    move-object v4, v5

    goto :goto_4

    :catch_1
    nop

    goto :goto_3

    :cond_5
    if-eqz v4, :cond_6

    .line 328
    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    :cond_6
    return-void
.end method

.method static synthetic ˏ(Landroid/content/Context;)Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/appsflyer/internal/s;
        }
    .end annotation

    .line 84
    invoke-static {p0}, Lcom/appsflyer/AppsFlyerLibCore;->ˎ(Landroid/content/Context;)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method static synthetic ˏ(Lcom/appsflyer/AppsFlyerLibCore;)Ljava/util/Map;
    .locals 0

    .line 84
    iget-object p0, p0, Lcom/appsflyer/AppsFlyerLibCore;->ʽॱ:Ljava/util/Map;

    return-object p0
.end method

.method private static ˏ(Ljava/lang/String;)Ljava/util/Map;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1464
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1467
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 1468
    invoke-virtual {v1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object p0

    .line 1469
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1470
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 1471
    sget-object v3, Lcom/appsflyer/AppsFlyerLibCore;->ॱˊ:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 1472
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1473
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string v4, "null"

    invoke-virtual {v4, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 1474
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :cond_1
    return-object v0

    :catch_0
    move-exception p0

    .line 1479
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method static ˏ(Landroid/content/Context;Ljava/lang/String;)V
    .locals 13

    const-string v0, "extraReferrers"

    const-string v1, "appsflyer-data"

    .line 336
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "received a new (extra) referrer: "

    invoke-virtual {v3, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 340
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 6850
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    const/4 v5, 0x0

    .line 6851
    invoke-virtual {v4, v1, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    const/4 v6, 0x0

    .line 343
    invoke-interface {v4, v0, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_0

    .line 345
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 346
    new-instance v6, Lorg/json/JSONArray;

    invoke-direct {v6}, Lorg/json/JSONArray;-><init>()V

    goto :goto_1

    .line 348
    :cond_0
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 349
    invoke-virtual {v6, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 350
    new-instance v4, Lorg/json/JSONArray;

    invoke-virtual {v6, p1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-direct {v4, v7}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    goto :goto_0

    .line 352
    :cond_1
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    :goto_0
    move-object v12, v6

    move-object v6, v4

    move-object v4, v12

    .line 355
    :goto_1
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v7

    int-to-long v7, v7

    const-wide/16 v9, 0x5

    cmp-long v11, v7, v9

    if-gez v11, :cond_2

    .line 356
    invoke-virtual {v6, v2, v3}, Lorg/json/JSONArray;->put(J)Lorg/json/JSONArray;

    .line 360
    :cond_2
    invoke-virtual {v4}, Lorg/json/JSONObject;->length()I

    move-result v2

    int-to-long v2, v2

    const-wide/16 v7, 0x4

    cmp-long v9, v2, v7

    if-ltz v9, :cond_3

    .line 361
    invoke-static {v4}, Lcom/appsflyer/AppsFlyerLibCore;->ˎ(Lorg/json/JSONObject;)V

    .line 364
    :cond_3
    invoke-virtual {v6}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, p1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 367
    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    .line 7850
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    .line 7851
    invoke-virtual {p0, v1, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 7521
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 7522
    invoke-interface {p0, v0, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 8377
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x9

    if-lt v0, v1, :cond_4

    .line 8378
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void

    .line 8380
    :cond_4
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p0

    .line 371
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Couldn\'t save referrer - "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ": "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    :catch_0
    return-void
.end method

.method private static ˏ(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 2

    .line 22850
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const-string v0, "appsflyer-data"

    const/4 v1, 0x0

    .line 22851
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 535
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 536
    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 23377
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p2, 0x9

    if-lt p1, p2, :cond_0

    .line 23378
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void

    .line 23380
    :cond_0
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method static synthetic ˏ(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 84
    invoke-static {p0, p1, p2}, Lcom/appsflyer/AppsFlyerLibCore;->ˋ(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private static ˏ(Ljava/util/concurrent/ScheduledExecutorService;Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)V
    .locals 1

    if-eqz p0, :cond_0

    .line 3111
    :try_start_0
    invoke-interface {p0}, Ljava/util/concurrent/ScheduledExecutorService;->isShutdown()Z

    move-result v0

    if-nez v0, :cond_0

    .line 3112
    invoke-interface {p0}, Ljava/util/concurrent/ScheduledExecutorService;->isTerminated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 3113
    invoke-interface {p0, p1, p2, p3, p4}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    return-void

    :cond_0
    const-string p0, "scheduler is null, shut downed or terminated"

    .line 3115
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->afWarnLog(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p0

    const-string p1, "scheduleJob failed with Exception"

    .line 3120
    invoke-static {p1, p0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void

    :catch_0
    move-exception p0

    const-string p1, "scheduleJob failed with RejectedExecutionException Exception"

    .line 3118
    invoke-static {p1, p0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method private static ॱ(Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    const/4 v0, 0x0

    :try_start_0
    const-string v1, "android.os.SystemProperties"

    .line 2577
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "get"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Ljava/lang/String;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    .line 2578
    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v3, [Ljava/lang/Object;

    aput-object p0, v2, v6

    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v0, p0

    goto :goto_0

    :catchall_0
    move-exception p0

    .line 2580
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-object v0
.end method

.method public static ॱ(Ljava/net/HttpURLConnection;)Ljava/lang/String;
    .locals 7

    .line 3138
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    .line 3141
    :try_start_0
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v2

    if-nez v2, :cond_0

    .line 3143
    invoke-virtual {p0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    .line 3146
    :cond_0
    new-instance v3, Ljava/io/InputStreamReader;

    invoke-direct {v3, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 3147
    :try_start_1
    new-instance v2, Ljava/io/BufferedReader;

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 3150
    :goto_0
    :try_start_2
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 3151
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 3158
    :cond_1
    :try_start_3
    invoke-virtual {v2}, Ljava/io/Reader;->close()V

    .line 3161
    :goto_1
    invoke-virtual {v3}, Ljava/io/Reader;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    goto :goto_3

    :catchall_0
    move-exception v1

    move-object v6, v2

    move-object v2, v1

    move-object v1, v6

    goto :goto_2

    :catchall_1
    move-exception v2

    goto :goto_2

    :catchall_2
    move-exception v2

    move-object v3, v1

    .line 3154
    :goto_2
    :try_start_4
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Could not read connection response from: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/net/URLConnection;->getURL()Ljava/net/URL;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v2}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    if-eqz v1, :cond_2

    .line 3158
    :try_start_5
    invoke-virtual {v1}, Ljava/io/Reader;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    :cond_2
    if-eqz v3, :cond_3

    goto :goto_1

    .line 3166
    :catchall_3
    :cond_3
    :goto_3
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    .line 3168
    :try_start_6
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_0

    return-object p0

    .line 3171
    :catch_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_7
    const-string v1, "string_response"

    .line 3173
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3174
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_7
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_1

    return-object p0

    .line 3176
    :catch_1
    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :catchall_4
    move-exception p0

    if-eqz v1, :cond_4

    .line 3158
    :try_start_8
    invoke-virtual {v1}, Ljava/io/Reader;->close()V

    :cond_4
    if-eqz v3, :cond_5

    .line 3161
    invoke-virtual {v3}, Ljava/io/Reader;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_5

    .line 3164
    :catchall_5
    :cond_5
    throw p0
.end method

.method private static ॱ(Landroid/content/Context;Ljava/lang/String;)Ljava/util/Map;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const-string v0, "install_time"

    .line 1408
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    const-string v2, "&"

    .line 1409
    invoke-virtual {p1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    .line 1412
    array-length v2, p1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_0
    const-string v6, "media_source"

    if-ge v4, v2, :cond_6

    aget-object v7, p1, v4

    const-string v8, "="

    .line 1413
    invoke-virtual {v7, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    if-lez v8, :cond_0

    .line 1414
    invoke-virtual {v7, v3, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    goto :goto_1

    :cond_0
    move-object v9, v7

    .line 1415
    :goto_1
    invoke-interface {v1, v9}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_4

    const-string v10, "c"

    .line 1417
    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1

    const-string v6, "campaign"

    goto :goto_2

    :cond_1
    const-string v10, "pid"

    .line 1419
    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    goto :goto_2

    :cond_2
    const-string v6, "af_prt"

    .line 1421
    invoke-virtual {v9, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    const/4 v5, 0x1

    const-string v6, "agency"

    goto :goto_2

    :cond_3
    move-object v6, v9

    :goto_2
    const-string v9, ""

    .line 1426
    invoke-interface {v1, v6, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v9, v6

    :cond_4
    if-lez v8, :cond_5

    .line 1428
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v8, v8, 0x1

    if-le v6, v8, :cond_5

    invoke-virtual {v7, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    goto :goto_3

    :cond_5
    const/4 v6, 0x0

    .line 1429
    :goto_3
    invoke-interface {v1, v9, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1432
    :cond_6
    :try_start_0
    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_7

    .line 1433
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p0

    const-string p1, "yyyy-MM-dd HH:mm:ss"

    .line 50191
    new-instance v2, Ljava/text/SimpleDateFormat;

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v2, p1, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 1435
    iget-wide p0, p0, Landroid/content/pm/PackageInfo;->firstInstallTime:J

    const-string v3, "UTC"

    .line 50192
    invoke-static {v3}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 50193
    new-instance v3, Ljava/util/Date;

    invoke-direct {v3, p0, p1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v2, v3}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    .line 1435
    invoke-interface {v1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_4

    :catch_0
    move-exception p0

    const-string p1, "Could not fetch install time. "

    .line 1439
    invoke-static {p1, p0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_7
    :goto_4
    const-string p0, "af_status"

    .line 1441
    invoke-interface {v1, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_8

    const-string p1, "Non-organic"

    .line 1442
    invoke-interface {v1, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_8
    if-eqz v5, :cond_9

    .line 1446
    invoke-interface {v1, v6}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_9
    return-object v1
.end method

.method static synthetic ॱ(Lcom/appsflyer/AppsFlyerLibCore;)Ljava/util/concurrent/ScheduledExecutorService;
    .locals 1

    const/4 v0, 0x0

    .line 84
    iput-object v0, p0, Lcom/appsflyer/AppsFlyerLibCore;->ˈ:Ljava/util/concurrent/ScheduledExecutorService;

    return-object v0
.end method

.method private ॱ(Landroid/app/Application;)V
    .locals 3

    .line 423
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/appsflyer/AppsFlyerProperties;->loadProperties(Landroid/content/Context;)V

    .line 425
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_3

    .line 426
    iget-object v0, p0, Lcom/appsflyer/AppsFlyerLibCore;->ʼॱ:Lcom/appsflyer/internal/p$b;

    if-nez v0, :cond_4

    .line 12064
    sget-object v0, Lcom/appsflyer/internal/p;->ˏ:Lcom/appsflyer/internal/p;

    if-nez v0, :cond_0

    .line 12065
    new-instance v0, Lcom/appsflyer/internal/p;

    invoke-direct {v0}, Lcom/appsflyer/internal/p;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/p;->ˏ:Lcom/appsflyer/internal/p;

    .line 429
    :cond_0
    new-instance v0, Lcom/appsflyer/AppsFlyerLibCore$4;

    invoke-direct {v0, p0}, Lcom/appsflyer/AppsFlyerLibCore$4;-><init>(Lcom/appsflyer/AppsFlyerLibCore;)V

    iput-object v0, p0, Lcom/appsflyer/AppsFlyerLibCore;->ʼॱ:Lcom/appsflyer/internal/p$b;

    .line 12091
    sget-object v0, Lcom/appsflyer/internal/p;->ˏ:Lcom/appsflyer/internal/p;

    if-eqz v0, :cond_2

    .line 12096
    sget-object v0, Lcom/appsflyer/internal/p;->ˏ:Lcom/appsflyer/internal/p;

    .line 443
    iget-object v2, p0, Lcom/appsflyer/AppsFlyerLibCore;->ʼॱ:Lcom/appsflyer/internal/p$b;

    .line 12112
    iput-object v2, v0, Lcom/appsflyer/internal/p;->ॱ:Lcom/appsflyer/internal/p$b;

    .line 12113
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v1, :cond_1

    .line 12114
    sget-object v0, Lcom/appsflyer/internal/p;->ˏ:Lcom/appsflyer/internal/p;

    invoke-virtual {p1, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    :cond_1
    return-void

    .line 12092
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Foreground is not initialised - invoke at least once with parameter init/get"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    const-string v0, "SDK<14 call trackEvent manually"

    .line 446
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    const-string v0, "onBecameForeground"

    .line 13015
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 13016
    invoke-static {}, Lcom/appsflyer/AppsFlyerLibCore;->getInstance()Lcom/appsflyer/AppsFlyerLibCore;

    move-result-object v0

    .line 13207
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, v0, Lcom/appsflyer/AppsFlyerLibCore;->ʽ:J

    .line 13017
    invoke-static {}, Lcom/appsflyer/AppsFlyerLibCore;->getInstance()Lcom/appsflyer/AppsFlyerLibCore;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1, v1}, Lcom/appsflyer/AppsFlyerLibCore;->ॱ(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;)V

    .line 13019
    invoke-static {}, Lcom/appsflyer/AFLogger;->resetDeltaTime()V

    :cond_4
    return-void
.end method

.method static synthetic ॱ(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 0

    .line 84
    invoke-static {p0, p1, p2}, Lcom/appsflyer/AppsFlyerLibCore;->ˏ(Landroid/content/Context;Ljava/lang/String;I)V

    return-void
.end method

.method static synthetic ॱ(Lcom/appsflyer/AppsFlyerLibCore;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLandroid/content/Intent;Ljava/lang/String;)V
    .locals 16

    move-object/from16 v12, p0

    if-nez p1, :cond_0

    const-string v0, "sendTrackingWithEvent - got null context. skipping event/launch."

    .line 50758
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    return-void

    .line 50828
    :cond_0
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "appsflyer-data"

    const/4 v13, 0x0

    .line 50829
    invoke-virtual {v0, v1, v13}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 50763
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/appsflyer/AppsFlyerProperties;->saveProperties(Landroid/content/SharedPreferences;)V

    .line 50764
    invoke-virtual/range {p0 .. p0}, Lcom/appsflyer/AppsFlyerLib;->isTrackingStopped()Z

    move-result v1

    if-nez v1, :cond_1

    .line 50765
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "sendTrackingWithEvent from activity: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    :cond_1
    const/4 v14, 0x1

    if-nez p3, :cond_2

    const/4 v15, 0x1

    goto :goto_0

    :cond_2
    const/4 v15, 0x0

    :goto_0
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move/from16 v7, p6

    move-object v8, v0

    move v9, v15

    move-object/from16 v10, p8

    move-object/from16 v11, p9

    .line 50770
    invoke-virtual/range {v1 .. v11}, Lcom/appsflyer/AppsFlyerLibCore;->ˋ(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/content/SharedPreferences;ZLandroid/content/Intent;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v1

    const-string v2, "appsflyerKey"

    .line 50772
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    if-eqz v2, :cond_e

    .line 50773
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_3

    goto/16 :goto_7

    .line 50777
    :cond_3
    invoke-virtual/range {p0 .. p0}, Lcom/appsflyer/AppsFlyerLib;->isTrackingStopped()Z

    move-result v2

    if-nez v2, :cond_4

    const-string v2, "AppsFlyerLib.sendTrackingWithEvent"

    .line 50778
    invoke-static {v2}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    :cond_4
    if-eqz v15, :cond_6

    if-eqz p7, :cond_5

    .line 50783
    sget-object v2, Lcom/appsflyer/AppsFlyerLibCore;->ॱॱ:Ljava/lang/String;

    invoke-static {v2}, Lcom/appsflyer/ServerConfigHandler;->getUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 50785
    :cond_5
    sget-object v2, Lcom/appsflyer/AppsFlyerLibCore;->ʼ:Ljava/lang/String;

    invoke-static {v2}, Lcom/appsflyer/ServerConfigHandler;->getUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 50788
    :cond_6
    sget-object v2, Lcom/appsflyer/AppsFlyerLibCore;->ˋॱ:Ljava/lang/String;

    invoke-static {v2}, Lcom/appsflyer/ServerConfigHandler;->getUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 50790
    :goto_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "appsFlyerCount"

    .line 50830
    invoke-static {v0, v3, v13}, Lcom/appsflyer/AppsFlyerLibCore;->ˊ(Landroid/content/SharedPreferences;Ljava/lang/String;Z)I

    move-result v3

    .line 50831
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v4, "collectAndroidIdForceByUser"

    .line 50832
    invoke-virtual {v0, v4, v13}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_8

    .line 50833
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v4, "collectIMEIForceByUser"

    .line 50834
    invoke-virtual {v0, v4, v13}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_7

    goto :goto_2

    :cond_7
    const/4 v0, 0x0

    goto :goto_3

    :cond_8
    :goto_2
    const/4 v0, 0x1

    :goto_3
    if-nez v0, :cond_a

    const-string v0, "advertiserId"

    .line 50837
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_a

    .line 50840
    :try_start_0
    iget-object v0, v12, Lcom/appsflyer/AppsFlyerLibCore;->ˋ:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_9

    const-string v0, "android_id"

    .line 50841
    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_9

    const-string v0, "validateGaidAndIMEI :: removing: android_id"

    .line 50843
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 50846
    :cond_9
    iget-object v0, v12, Lcom/appsflyer/AppsFlyerLibCore;->ˎ:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_a

    const-string v0, "imei"

    .line 50847
    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_a

    const-string v0, "validateGaidAndIMEI :: removing: imei"

    .line 50849
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_4

    :catch_0
    move-exception v0

    const-string v4, "failed to remove IMEI or AndroidID key from params; "

    .line 50853
    invoke-static {v4, v0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 50796
    :cond_a
    :goto_4
    new-instance v0, Lcom/appsflyer/AppsFlyerLibCore$c;

    .line 50799
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    const/4 v5, 0x0

    move-object/from16 p2, v0

    move-object/from16 p3, p0

    move-object/from16 p4, v2

    move-object/from16 p5, v1

    move-object/from16 p6, v4

    move/from16 p7, v15

    move/from16 p8, v3

    move/from16 p9, v5

    invoke-direct/range {p2 .. p9}, Lcom/appsflyer/AppsFlyerLibCore$c;-><init>(Lcom/appsflyer/AppsFlyerLibCore;Ljava/lang/String;Ljava/util/Map;Landroid/content/Context;ZIB)V

    if-eqz v15, :cond_c

    .line 50806
    invoke-static/range {p1 .. p1}, Lcom/appsflyer/AppsFlyerLibCore;->ॱ(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 50857
    iget-object v1, v12, Lcom/appsflyer/AppsFlyerLibCore;->ʽॱ:Ljava/util/Map;

    if-eqz v1, :cond_b

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    if-lez v1, :cond_b

    goto :goto_5

    :cond_b
    const/4 v14, 0x0

    :goto_5
    if-nez v14, :cond_c

    const/16 v13, 0x1f4

    const-string v1, "Failed to get new referrer, wait ..."

    .line 50811
    invoke-static {v1}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 50818
    :cond_c
    sget-boolean v1, Lcom/appsflyer/AFDeepLinkManager;->ˋ:Z

    if-eqz v1, :cond_d

    const-string v1, "ESP deeplink: execute launch on SerialExecutor"

    .line 50819
    invoke-static {v1}, Lcom/appsflyer/AFLogger;->afRDLog(Ljava/lang/String;)V

    .line 50820
    invoke-static {}, Lcom/appsflyer/AFExecutor;->getInstance()Lcom/appsflyer/AFExecutor;

    move-result-object v1

    invoke-virtual {v1}, Lcom/appsflyer/AFExecutor;->getSerialExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v1

    goto :goto_6

    .line 50822
    :cond_d
    invoke-static {}, Lcom/appsflyer/AFExecutor;->getInstance()Lcom/appsflyer/AFExecutor;

    move-result-object v1

    invoke-virtual {v1}, Lcom/appsflyer/AFExecutor;->ˏ()Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    move-result-object v1

    :goto_6
    int-to-long v2, v13

    .line 50825
    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {v1, v0, v2, v3, v4}, Lcom/appsflyer/AppsFlyerLibCore;->ˏ(Ljava/util/concurrent/ScheduledExecutorService;Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)V

    return-void

    :cond_e
    :goto_7
    const-string v0, "Not sending data yet, waiting for dev key"

    .line 50774
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic ॱ(Lcom/appsflyer/AppsFlyerLibCore;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ref/WeakReference;Ljava/lang/String;Z)V
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v1, p1

    .line 50859
    new-instance v3, Ljava/net/URL;

    invoke-direct {v3, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 50861
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "url: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 50863
    invoke-static/range {p2 .. p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "data: "

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFExecutor$2$1;->ˏ(Ljava/lang/String;)V

    .line 50865
    invoke-virtual/range {p4 .. p4}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    const-string v9, "AppsFlyer_4.10.0"

    const-string v2, "EVENT_DATA"

    move-object/from16 v12, p2

    invoke-static {v0, v9, v2, v12}, Lcom/appsflyer/AppsFlyerLibCore;->ˎ(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v2, p0

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move/from16 v8, p6

    .line 50867
    :try_start_0
    invoke-direct/range {v2 .. v8}, Lcom/appsflyer/AppsFlyerLibCore;->ˎ(Ljava/net/URL;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ref/WeakReference;Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    move-object v2, v0

    const-string v0, "Exception in sendRequestToServer. "

    .line 50869
    invoke-static {v0, v2}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 50870
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const/4 v3, 0x0

    const-string v4, "useHttpFallback"

    invoke-virtual {v0, v4, v3}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 50872
    new-instance v11, Ljava/net/URL;

    const-string v0, "https:"

    const-string v2, "http:"

    invoke-virtual {v1, v0, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v11, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    move-object/from16 v10, p0

    move-object/from16 v12, p2

    move-object/from16 v13, p3

    move-object/from16 v14, p4

    move-object/from16 v15, p5

    move/from16 v16, p6

    invoke-direct/range {v10 .. v16}, Lcom/appsflyer/AppsFlyerLibCore;->ˎ(Ljava/net/URL;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ref/WeakReference;Ljava/lang/String;Z)V

    return-void

    .line 50874
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "failed to send requeset to server. "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 50875
    invoke-virtual/range {p4 .. p4}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    invoke-virtual {v2}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v1

    const-string v3, "ERROR"

    invoke-static {v0, v9, v3, v1}, Lcom/appsflyer/AppsFlyerLibCore;->ˎ(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 50876
    throw v2
.end method

.method private ॱ()Z
    .locals 11

    .line 1533
    iget-wide v0, p0, Lcom/appsflyer/AppsFlyerLibCore;->ॱᐝ:J

    const/4 v2, 0x0

    const-wide/16 v3, 0x0

    cmp-long v5, v0, v3

    if-lez v5, :cond_1

    .line 1534
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 1535
    iget-wide v3, p0, Lcom/appsflyer/AppsFlyerLibCore;->ॱᐝ:J

    sub-long/2addr v0, v3

    .line 50197
    new-instance v3, Ljava/text/SimpleDateFormat;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "yyyy/MM/dd HH:mm:ss.SSS Z"

    invoke-direct {v3, v5, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 1537
    iget-wide v4, p0, Lcom/appsflyer/AppsFlyerLibCore;->ॱᐝ:J

    const-string v6, "UTC"

    .line 50198
    invoke-static {v6}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 50199
    new-instance v7, Ljava/util/Date;

    invoke-direct {v7, v4, v5}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v3, v7}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    .line 1538
    iget-wide v7, p0, Lcom/appsflyer/AppsFlyerLibCore;->ॱˋ:J

    .line 50200
    invoke-static {v6}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 50201
    new-instance v5, Ljava/util/Date;

    invoke-direct {v5, v7, v8}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v3, v5}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    .line 1540
    iget-wide v5, p0, Lcom/appsflyer/AppsFlyerLibCore;->ॱˎ:J

    const/4 v7, 0x2

    const/4 v8, 0x3

    const/4 v9, 0x1

    cmp-long v10, v0, v5

    if-gez v10, :cond_0

    invoke-virtual {p0}, Lcom/appsflyer/AppsFlyerLib;->isTrackingStopped()Z

    move-result v5

    if-nez v5, :cond_0

    .line 1542
    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v6, 0x4

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v4, v6, v2

    aput-object v3, v6, v9

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v6, v7

    iget-wide v0, p0, Lcom/appsflyer/AppsFlyerLibCore;->ॱˎ:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v6, v8

    const-string v0, "Last Launch attempt: %s;\nLast successful Launch event: %s;\nThis launch is blocked: %s ms < %s ms"

    invoke-static {v5, v0, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    return v9

    .line 1546
    :cond_0
    invoke-virtual {p0}, Lcom/appsflyer/AppsFlyerLib;->isTrackingStopped()Z

    move-result v5

    if-nez v5, :cond_2

    .line 1548
    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    new-array v6, v8, [Ljava/lang/Object;

    aput-object v4, v6, v2

    aput-object v3, v6, v9

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v6, v7

    const-string v0, "Last Launch attempt: %s;\nLast successful Launch event: %s;\nSending launch (+%s ms)"

    invoke-static {v5, v0, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    goto :goto_0

    .line 1552
    :cond_1
    invoke-virtual {p0}, Lcom/appsflyer/AppsFlyerLib;->isTrackingStopped()Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "Sending first launch for this session!"

    .line 1553
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    :cond_2
    :goto_0
    return v2
.end method

.method private static ॱ(Landroid/content/Context;)Z
    .locals 3

    .line 48850
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "appsflyer-data"

    const/4 v2, 0x0

    .line 48851
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "appsFlyerCount"

    .line 48855
    invoke-static {v0, v1, v2}, Lcom/appsflyer/AppsFlyerLibCore;->ˊ(Landroid/content/SharedPreferences;Ljava/lang/String;Z)I

    move-result v0

    const/4 v1, 0x2

    if-le v0, v1, :cond_0

    const-string p0, "Install referrer will not load, the counter > 2, "

    .line 896
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->afRDLog(Ljava/lang/String;)V

    return v2

    :cond_0
    :try_start_0
    const-string v0, "com.android.installreferrer.api.InstallReferrerClient"

    .line 901
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    const-string v0, "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE"

    .line 902
    invoke-static {p0, v0}, Lcom/appsflyer/AFExecutor$2;->ˏ(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1

    const-string p0, "Install referrer is allowed"

    .line 903
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 p0, 0x1

    return p0

    :cond_1
    const-string p0, "Install referrer is not allowed"

    .line 913
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    return v2

    :catchall_0
    move-exception p0

    const-string v0, "An error occurred while trying to verify manifest : com.android.installreferrer.api.InstallReferrerClient"

    .line 910
    invoke-static {v0, p0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    return v2

    :catch_0
    const-string p0, "Class com.android.installreferrer.api.InstallReferrerClient not found"

    .line 907
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->afRDLog(Ljava/lang/String;)V

    return v2
.end method

.method static synthetic ॱ(Lcom/appsflyer/AppsFlyerLibCore;Z)Z
    .locals 0

    .line 84
    iput-boolean p1, p0, Lcom/appsflyer/AppsFlyerLibCore;->ʿ:Z

    return p1
.end method

.method private static ॱॱ(Landroid/content/Context;)F
    .locals 3

    .line 3185
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const/4 v0, 0x0

    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object p0

    const-string v0, "level"

    const/4 v1, -0x1

    .line 3186
    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    const-string v2, "scale"

    .line 3187
    invoke-virtual {p0, v2, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eq v0, v1, :cond_1

    if-ne p0, v1, :cond_0

    goto :goto_0

    :cond_0
    int-to-float v0, v0

    int-to-float p0, p0

    div-float/2addr v0, p0

    const/high16 p0, 0x42c80000    # 100.0f

    mul-float v0, v0, p0

    goto :goto_1

    :cond_1
    :goto_0
    const/high16 p0, 0x42480000    # 50.0f

    return p0

    :catchall_0
    move-exception p0

    .line 3196
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/high16 v0, 0x3f800000    # 1.0f

    :goto_1
    return v0
.end method

.method private static ᐝ(Landroid/content/Context;)Z
    .locals 7

    const/4 v0, 0x0

    if-eqz p0, :cond_5

    .line 3205
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x17

    const-string v3, "Failed collecting ivc data"

    if-lt v1, v2, :cond_2

    :try_start_0
    const-string v1, "connectivity"

    .line 3207
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/ConnectivityManager;

    .line 3208
    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getAllNetworks()[Landroid/net/Network;

    move-result-object v1

    array-length v2, v1

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v2, :cond_1

    aget-object v5, v1, v4

    .line 3209
    invoke-virtual {p0, v5}, Landroid/net/ConnectivityManager;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    move-result-object v5

    const/4 v6, 0x4

    .line 3210
    invoke-virtual {v5, v6}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v6

    if-eqz v6, :cond_0

    const/16 v6, 0xf

    invoke-virtual {v5, v6}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    move-result v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v5, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    return v0

    :catch_0
    move-exception p0

    .line 3216
    invoke-static {v3, p0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    .line 3218
    :cond_2
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt p0, v1, :cond_5

    .line 3219
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 3221
    :try_start_1
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Collections;->list(Ljava/util/Enumeration;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_3
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/net/NetworkInterface;

    .line 3222
    invoke-virtual {v2}, Ljava/net/NetworkInterface;->isUp()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 3223
    invoke-virtual {v2}, Ljava/net/NetworkInterface;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_4
    const-string v1, "tun0"

    .line 3226
    invoke-interface {p0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    return p0

    :catch_1
    move-exception p0

    .line 3229
    invoke-static {v3, p0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_5
    :goto_2
    return v0
.end method


# virtual methods
.method public enableLocationCollection(Z)Lcom/appsflyer/AppsFlyerLib;
    .locals 0

    .line 511
    iput-boolean p1, p0, Lcom/appsflyer/AppsFlyerLibCore;->ˊˋ:Z

    return-object p0
.end method

.method public enableUninstallTracking(Ljava/lang/String;)V
    .locals 4

    .line 17068
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v0, :cond_0

    .line 17069
    new-instance v0, Lcom/appsflyer/internal/x;

    invoke-direct {v0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 17071
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string v2, "public_api_call"

    const-string v3, "enableUninstallTracking"

    .line 17174
    invoke-virtual {v0, v2, v3, v1}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 17557
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "gcmProjectNumber"

    invoke-virtual {v0, v1, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public getAppsFlyerUID(Landroid/content/Context;)Ljava/lang/String;
    .locals 4

    .line 50693
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v0, :cond_0

    .line 50694
    new-instance v0, Lcom/appsflyer/internal/x;

    invoke-direct {v0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 50696
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "public_api_call"

    const-string v3, "getAppsFlyerUID"

    .line 50697
    invoke-virtual {v0, v2, v3, v1}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 2908
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {v0}, Lcom/appsflyer/internal/u;->ˋ(Ljava/lang/ref/WeakReference;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getAttributionId(Landroid/content/ContentResolver;)Ljava/lang/String;
    .locals 7

    const-string v0, "aid"

    .line 2826
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v3

    const-string v1, "content://com.facebook.katana.provider.AttributionIdProvider"

    .line 2827
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    const/4 v1, 0x0

    if-eqz p1, :cond_3

    .line 2830
    :try_start_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_3

    .line 2833
    :cond_0
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p1, :cond_1

    .line 2840
    :try_start_1
    invoke-interface {p1}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 2843
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    :catch_1
    move-exception v0

    :try_start_2
    const-string v2, "Could not collect cursor attribution. "

    .line 2836
    invoke-static {v2, v0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz p1, :cond_1

    .line 2840
    :try_start_3
    invoke-interface {p1}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    :cond_1
    :goto_0
    return-object v1

    :goto_1
    if-eqz p1, :cond_2

    :try_start_4
    invoke-interface {p1}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_2

    :catch_2
    move-exception p1

    .line 2843
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p1}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2844
    :cond_2
    :goto_2
    throw v0

    :cond_3
    :goto_3
    if-eqz p1, :cond_4

    .line 2840
    :try_start_5
    invoke-interface {p1}, Landroid/database/Cursor;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_4

    :catch_3
    move-exception p1

    .line 2843
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_4
    :goto_4
    return-object v1
.end method

.method protected getConversionData(Landroid/content/Context;Lcom/appsflyer/ConversionDataListener;)V
    .locals 0

    .line 1387
    new-instance p1, Lcom/appsflyer/AppsFlyerLibCore$5;

    invoke-direct {p1, p0, p2}, Lcom/appsflyer/AppsFlyerLibCore$5;-><init>(Lcom/appsflyer/AppsFlyerLibCore;Lcom/appsflyer/ConversionDataListener;)V

    .line 50189
    sput-object p1, Lcom/appsflyer/AppsFlyerLibCore;->ͺ:Lcom/appsflyer/AppsFlyerConversionListener;

    return-void
.end method

.method public getHostName()Ljava/lang/String;
    .locals 2

    .line 50744
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "custom_host"

    invoke-virtual {v0, v1}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    const-string v0, "appsflyer.com"

    return-object v0
.end method

.method public getHostPrefix()Ljava/lang/String;
    .locals 2

    .line 50747
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "custom_host_prefix"

    invoke-virtual {v0, v1}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    const-string v0, ""

    return-object v0
.end method

.method public getOutOfStore(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    .line 642
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "api_store_value"

    invoke-virtual {v0, v1}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    .line 647
    :cond_0
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    const-string p1, "AF_STORE"

    invoke-static {v0, p1}, Lcom/appsflyer/AppsFlyerLibCore;->ˋ(Ljava/lang/ref/WeakReference;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_1

    return-object p1

    :cond_1
    const-string p1, "No out-of-store value set"

    .line 652
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    const/4 p1, 0x0

    return-object p1
.end method

.method public getSdkVersion()Ljava/lang/String;
    .locals 4

    .line 10068
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v0, :cond_0

    .line 10069
    new-instance v0, Lcom/appsflyer/internal/x;

    invoke-direct {v0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 10071
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "public_api_call"

    const-string v3, "getSdkVersion"

    .line 10174
    invoke-virtual {v0, v2, v3, v1}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    const-string v0, "version: 4.10.0 (build 197)"

    return-object v0
.end method

.method protected handleDeepLinkCallback(Landroid/content/Context;Ljava/util/Map;Landroid/net/Uri;)V
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

    .line 2250
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto/16 :goto_4

    :cond_0
    const-string v1, "fb\\d*?://authorize.*"

    .line 50608
    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_7

    const-string v1, "access_token"

    .line 50609
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_7

    const/16 v2, 0x3f

    .line 50644
    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_1

    const-string v2, ""

    goto :goto_0

    .line 50648
    :cond_1
    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 50611
    :goto_0
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_7

    .line 50614
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    const-string v4, "&"

    .line 50615
    invoke-virtual {v2, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 50616
    new-instance v3, Ljava/util/ArrayList;

    invoke-virtual {v2, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    goto :goto_1

    .line 50618
    :cond_2
    invoke-virtual {v3, v2}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    .line 50621
    :goto_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 50622
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 50624
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_6

    .line 50625
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 50626
    invoke-virtual {v6, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 50627
    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    goto :goto_2

    .line 50629
    :cond_3
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    move-result v7

    if-eqz v7, :cond_4

    .line 50630
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    :cond_4
    const-string v7, "?"

    .line 50631
    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_5

    .line 50632
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50634
    :cond_5
    :goto_3
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 50638
    :cond_6
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    :cond_7
    :goto_4
    const-string v1, "af_deeplink"

    .line 2253
    invoke-interface {p2, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_8

    .line 2254
    invoke-interface {p2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2259
    :cond_8
    invoke-virtual {p3, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p2, :cond_c

    const-string p2, "media_source"

    .line 2261
    invoke-virtual {p3, p2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const-string v2, "is_retargeting"

    .line 2262
    invoke-virtual {p3, v2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "AppsFlyer_Test"

    .line 2264
    invoke-virtual {v3, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_9

    invoke-static {v2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_9

    const/4 p2, 0x1

    goto :goto_5

    :cond_9
    const/4 p2, 0x0

    :goto_5
    iput-boolean p2, p0, Lcom/appsflyer/AppsFlyerLibCore;->ˊᐝ:Z

    .line 2266
    invoke-virtual {p3}, Landroid/net/Uri;->getQuery()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/appsflyer/AppsFlyerLibCore;->ॱ(Landroid/content/Context;Ljava/lang/String;)Ljava/util/Map;

    move-result-object p2

    .line 2267
    invoke-virtual {p3}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_a

    const-string v3, "path"

    .line 50650
    invoke-interface {p2, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2268
    :cond_a
    invoke-virtual {p3}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_b

    const-string v3, "scheme"

    .line 50654
    invoke-interface {p2, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2269
    :cond_b
    invoke-virtual {p3}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_d

    const-string v3, "host"

    .line 50658
    invoke-interface {p2, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_6

    .line 2272
    :cond_c
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 2273
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "link"

    invoke-interface {p2, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2276
    :cond_d
    :goto_6
    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 2277
    new-instance p1, Lcom/appsflyer/internal/t;

    invoke-direct {p1, p3, p0}, Lcom/appsflyer/internal/t;-><init>(Landroid/net/Uri;Lcom/appsflyer/AppsFlyerLibCore;)V

    .line 2278
    new-instance p3, Lcom/appsflyer/OneLinkHttpTask$HttpsUrlConnectionProvider;

    invoke-direct {p3}, Lcom/appsflyer/OneLinkHttpTask$HttpsUrlConnectionProvider;-><init>()V

    invoke-virtual {p1, p3}, Lcom/appsflyer/OneLinkHttpTask;->setConnProvider(Lcom/appsflyer/OneLinkHttpTask$HttpsUrlConnectionProvider;)V

    .line 50661
    iget-object p3, p1, Lcom/appsflyer/OneLinkHttpTask;->ˏ:Ljava/lang/String;

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_e

    iget-object p3, p1, Lcom/appsflyer/internal/t;->ˊ:Ljava/lang/String;

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_e

    goto :goto_7

    :cond_e
    const/4 v0, 0x0

    :goto_7
    if-eqz v0, :cond_f

    .line 50662
    new-instance p3, Lcom/appsflyer/AppsFlyerLibCore$3;

    invoke-direct {p3, p0, p2, v2}, Lcom/appsflyer/AppsFlyerLibCore$3;-><init>(Lcom/appsflyer/AppsFlyerLibCore;Ljava/util/Map;Ljava/lang/ref/WeakReference;)V

    .line 50663
    iput-object p3, p1, Lcom/appsflyer/internal/t;->ˎ:Lcom/appsflyer/internal/t$d;

    .line 2282
    invoke-static {}, Lcom/appsflyer/AFExecutor;->getInstance()Lcom/appsflyer/AFExecutor;

    move-result-object p2

    invoke-virtual {p2}, Lcom/appsflyer/AFExecutor;->getThreadPoolExecutor()Ljava/util/concurrent/Executor;

    move-result-object p2

    invoke-interface {p2, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    .line 50665
    :cond_f
    sget-object p1, Lcom/appsflyer/AppsFlyerLibCore;->ͺ:Lcom/appsflyer/AppsFlyerConversionListener;

    if-eqz p1, :cond_10

    .line 50668
    :try_start_0
    invoke-interface {p1, p2}, Lcom/appsflyer/AppsFlyerConversionListener;->onAppOpenAttribution(Ljava/util/Map;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    .line 50670
    invoke-virtual {p1}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2, p1}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_10
    return-void
.end method

.method public init(Ljava/lang/String;Lcom/appsflyer/AppsFlyerConversionListener;)Lcom/appsflyer/AppsFlyerLib;
    .locals 7

    .line 48068
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v0, :cond_0

    .line 48069
    new-instance v0, Lcom/appsflyer/internal/x;

    invoke-direct {v0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 48071
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    const/4 v1, 0x2

    new-array v2, v1, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    if-nez p2, :cond_1

    const-string v4, "null"

    goto :goto_0

    :cond_1
    const-string v4, "conversionDataListener"

    :goto_0
    const/4 v5, 0x1

    aput-object v4, v2, v5

    const-string v4, "public_api_call"

    const-string v6, "init"

    .line 48174
    invoke-virtual {v0, v4, v6, v2}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    new-array v0, v1, [Ljava/lang/Object;

    const-string v1, "4.10.0"

    aput-object v1, v0, v3

    const-string v1, "197"

    aput-object v1, v0, v5

    const-string v1, "Initializing AppsFlyer SDK: (v%s.%s)"

    .line 857
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->ˊ(Ljava/lang/String;)V

    .line 858
    iput-boolean v5, p0, Lcom/appsflyer/AppsFlyerLibCore;->ˋˋ:Z

    .line 48557
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "AppsFlyerKey"

    invoke-virtual {v0, v1, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 860
    invoke-static {p1}, Lcom/appsflyer/AFExecutor$2$1;->ˋ(Ljava/lang/String;)V

    .line 861
    sput-object p2, Lcom/appsflyer/AppsFlyerLibCore;->ͺ:Lcom/appsflyer/AppsFlyerConversionListener;

    return-object p0
.end method

.method public init(Ljava/lang/String;Lcom/appsflyer/AppsFlyerConversionListener;Landroid/content/Context;)Lcom/appsflyer/AppsFlyerLib;
    .locals 1

    if-eqz p3, :cond_1

    .line 873
    invoke-static {p3}, Lcom/appsflyer/AppsFlyerLibCore;->ॱ(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 876
    iget-object v0, p0, Lcom/appsflyer/AppsFlyerLibCore;->ᐝॱ:Lcom/appsflyer/internal/g;

    if-nez v0, :cond_0

    .line 877
    new-instance v0, Lcom/appsflyer/internal/g;

    invoke-direct {v0}, Lcom/appsflyer/internal/g;-><init>()V

    iput-object v0, p0, Lcom/appsflyer/AppsFlyerLibCore;->ᐝॱ:Lcom/appsflyer/internal/g;

    .line 878
    invoke-virtual {v0, p3, p0}, Lcom/appsflyer/internal/g;->ˏ(Landroid/content/Context;Lcom/appsflyer/internal/h;)V

    goto :goto_0

    :cond_0
    const-string p3, "AFInstallReferrer instance already created"

    .line 880
    invoke-static {p3}, Lcom/appsflyer/AFLogger;->afWarnLog(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    const-string p3, "init :: context is null, Google Install Referrer will be not initialized!"

    .line 884
    invoke-static {p3}, Lcom/appsflyer/AFLogger;->afWarnLog(Ljava/lang/String;)V

    .line 887
    :cond_2
    :goto_0
    invoke-virtual {p0, p1, p2}, Lcom/appsflyer/AppsFlyerLib;->init(Ljava/lang/String;Lcom/appsflyer/AppsFlyerConversionListener;)Lcom/appsflyer/AppsFlyerLib;

    move-result-object p1

    return-object p1
.end method

.method public isPreInstalledApp(Landroid/content/Context;)Z
    .locals 2

    const/4 v0, 0x0

    .line 2781
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1, v0}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object p1

    .line 2786
    iget p1, p1, Landroid/content/pm/ApplicationInfo;->flags:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v1, 0x1

    and-int/2addr p1, v1

    if-eqz p1, :cond_0

    return v1

    :catch_0
    move-exception p1

    const-string v1, "Could not check if app is pre installed"

    .line 2790
    invoke-static {v1, p1}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return v0
.end method

.method public isTrackingStopped()Z
    .locals 1

    .line 3131
    iget-boolean v0, p0, Lcom/appsflyer/AppsFlyerLibCore;->ˍ:Z

    return v0
.end method

.method public onHandleReferrer(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 3126
    iput-object p1, p0, Lcom/appsflyer/AppsFlyerLibCore;->ʽॱ:Ljava/util/Map;

    return-void
.end method

.method public onPause(Landroid/content/Context;)V
    .locals 1

    .line 417
    invoke-static {p1}, Lcom/appsflyer/AFDeepLinkManager$2;->ˏ(Landroid/content/Context;)V

    .line 418
    invoke-static {p1}, Lcom/appsflyer/internal/o;->ˏ(Landroid/content/Context;)Lcom/appsflyer/internal/o;

    move-result-object p1

    .line 11137
    iget-object v0, p1, Lcom/appsflyer/internal/o;->ˏ:Landroid/os/Handler;

    iget-object p1, p1, Lcom/appsflyer/internal/o;->ʻ:Ljava/lang/Runnable;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public registerConversionListener(Landroid/content/Context;Lcom/appsflyer/AppsFlyerConversionListener;)V
    .locals 3

    .line 50163
    sget-object p1, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez p1, :cond_0

    .line 50164
    new-instance p1, Lcom/appsflyer/internal/x;

    invoke-direct {p1}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object p1, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 50166
    :cond_0
    sget-object p1, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "public_api_call"

    const-string v2, "registerConversionListener"

    .line 50167
    invoke-virtual {p1, v1, v2, v0}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    if-eqz p2, :cond_1

    .line 50172
    sput-object p2, Lcom/appsflyer/AppsFlyerLibCore;->ͺ:Lcom/appsflyer/AppsFlyerConversionListener;

    :cond_1
    return-void
.end method

.method public registerValidatorListener(Landroid/content/Context;Lcom/appsflyer/AppsFlyerInAppPurchaseValidatorListener;)V
    .locals 3

    .line 50180
    sget-object p1, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez p1, :cond_0

    .line 50181
    new-instance p1, Lcom/appsflyer/internal/x;

    invoke-direct {p1}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object p1, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 50183
    :cond_0
    sget-object p1, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "public_api_call"

    const-string v2, "registerValidatorListener"

    .line 50184
    invoke-virtual {p1, v1, v2, v0}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    const-string p1, "registerValidatorListener called"

    .line 1375
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    if-nez p2, :cond_1

    const-string p1, "registerValidatorListener null listener"

    .line 1378
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    return-void

    .line 1381
    :cond_1
    sput-object p2, Lcom/appsflyer/AppsFlyerLibCore;->ˊ:Lcom/appsflyer/AppsFlyerInAppPurchaseValidatorListener;

    return-void
.end method

.method public reportTrackSession(Landroid/content/Context;)V
    .locals 5

    .line 50122
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v0, :cond_0

    .line 50123
    new-instance v0, Lcom/appsflyer/internal/x;

    invoke-direct {v0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 50125
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/String;

    const-string v3, "public_api_call"

    const-string v4, "reportTrackSession"

    .line 50126
    invoke-virtual {v0, v3, v4, v2}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 50128
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v0, :cond_1

    .line 50129
    new-instance v0, Lcom/appsflyer/internal/x;

    invoke-direct {v0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 50131
    :cond_1
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 50132
    iput-boolean v1, v0, Lcom/appsflyer/internal/x;->ˎ:Z

    const/4 v0, 0x0

    .line 1164
    invoke-virtual {p0, p1, v0, v0}, Lcom/appsflyer/AppsFlyerLibCore;->ॱ(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public sendDeepLinkData(Landroid/app/Activity;)V
    .locals 7

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x2

    const-string v3, "public_api_call"

    const-string v4, "sendDeepLinkData"

    if-eqz p1, :cond_1

    .line 690
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 34068
    sget-object v5, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v5, :cond_0

    .line 34069
    new-instance v5, Lcom/appsflyer/internal/x;

    invoke-direct {v5}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v5, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 34071
    :cond_0
    sget-object v5, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    new-array v2, v2, [Ljava/lang/String;

    .line 691
    invoke-virtual {p1}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v2, v1

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v6, "activity_intent_"

    invoke-direct {v1, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v2, v0

    .line 34174
    invoke-virtual {v5, v3, v4, v2}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    if-eqz p1, :cond_3

    .line 35068
    sget-object v5, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v5, :cond_2

    .line 35069
    new-instance v5, Lcom/appsflyer/internal/x;

    invoke-direct {v5}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v5, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 35071
    :cond_2
    sget-object v5, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    new-array v2, v2, [Ljava/lang/String;

    .line 693
    invoke-virtual {p1}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v2, v1

    const-string v1, "activity_intent_null"

    aput-object v1, v2, v0

    .line 35174
    invoke-virtual {v5, v3, v4, v2}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_0

    .line 36068
    :cond_3
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v0, :cond_4

    .line 36069
    new-instance v0, Lcom/appsflyer/internal/x;

    invoke-direct {v0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 36071
    :cond_4
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    const-string v1, "activity_null"

    .line 695
    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v1

    .line 36174
    invoke-virtual {v0, v3, v4, v1}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 699
    :goto_0
    :try_start_0
    invoke-virtual {p1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/appsflyer/AppsFlyerLibCore;->ॱ(Landroid/app/Application;)V

    .line 700
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "getDeepLinkData with activity "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 702
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "getDeepLinkData Exception: "

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    return-void
.end method

.method public sendPushNotificationData(Landroid/app/Activity;)V
    .locals 16

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    const-string v0, "c"

    const-string v3, "pid"

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x2

    const-string v7, "public_api_call"

    const-string v8, "sendPushNotificationData"

    if-eqz v2, :cond_1

    .line 708
    invoke-virtual/range {p1 .. p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v9

    if-eqz v9, :cond_1

    .line 37068
    sget-object v9, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v9, :cond_0

    .line 37069
    new-instance v9, Lcom/appsflyer/internal/x;

    invoke-direct {v9}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v9, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 37071
    :cond_0
    sget-object v9, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    new-array v10, v6, [Ljava/lang/String;

    .line 709
    invoke-virtual/range {p1 .. p1}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v10, v5

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v11, "activity_intent_"

    invoke-direct {v5, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p1 .. p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v10, v4

    .line 37174
    invoke-virtual {v9, v7, v8, v10}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    if-eqz v2, :cond_3

    .line 38068
    sget-object v9, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v9, :cond_2

    .line 38069
    new-instance v9, Lcom/appsflyer/internal/x;

    invoke-direct {v9}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v9, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 38071
    :cond_2
    sget-object v9, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    new-array v10, v6, [Ljava/lang/String;

    .line 711
    invoke-virtual/range {p1 .. p1}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v10, v5

    const-string v5, "activity_intent_null"

    aput-object v5, v10, v4

    .line 38174
    invoke-virtual {v9, v7, v8, v10}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_0

    .line 39068
    :cond_3
    sget-object v4, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v4, :cond_4

    .line 39069
    new-instance v4, Lcom/appsflyer/internal/x;

    invoke-direct {v4}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v4, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 39071
    :cond_4
    sget-object v4, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    const-string v5, "activity_null"

    .line 713
    filled-new-array {v5}, [Ljava/lang/String;

    move-result-object v5

    .line 39174
    invoke-virtual {v4, v7, v8, v5}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 39231
    :goto_0
    instance-of v4, v2, Landroid/app/Activity;

    if-eqz v4, :cond_5

    .line 39232
    move-object v4, v2

    check-cast v4, Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v7

    if-eqz v7, :cond_5

    .line 39234
    invoke-virtual {v7}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v8

    if-eqz v8, :cond_5

    const-string v9, "af"

    .line 39236
    invoke-virtual {v8, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_6

    .line 39238
    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    const-string v12, "Push Notification received af payload = "

    invoke-virtual {v12, v11}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 39239
    invoke-virtual {v8, v9}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 39240
    invoke-virtual {v7, v8}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object v7

    invoke-virtual {v4, v7}, Landroid/app/Activity;->setIntent(Landroid/content/Intent;)V

    goto :goto_1

    :cond_5
    const/4 v10, 0x0

    .line 715
    :cond_6
    :goto_1
    iput-object v10, v1, Lcom/appsflyer/AppsFlyerLibCore;->ˉ:Ljava/lang/String;

    if-eqz v10, :cond_d

    .line 717
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 719
    iget-object v4, v1, Lcom/appsflyer/AppsFlyerLibCore;->ˋˊ:Ljava/util/Map;

    const-string v9, ")"

    if-nez v4, :cond_7

    const-string v0, "pushes: initializing pushes history.."

    .line 720
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 721
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, v1, Lcom/appsflyer/AppsFlyerLibCore;->ˋˊ:Ljava/util/Map;

    move-wide v12, v7

    goto/16 :goto_4

    .line 724
    :cond_7
    :try_start_0
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v4

    const-string v10, "pushPayloadMaxAging"

    const-wide/32 v11, 0x1b7740

    invoke-virtual {v4, v10, v11, v12}, Lcom/appsflyer/AppsFlyerProperties;->getLong(Ljava/lang/String;J)J

    move-result-wide v10

    .line 725
    iget-object v4, v1, Lcom/appsflyer/AppsFlyerLibCore;->ˋˊ:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-wide v12, v7

    :goto_2
    :try_start_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_b

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/Long;

    .line 727
    new-instance v15, Lorg/json/JSONObject;

    iget-object v6, v1, Lcom/appsflyer/AppsFlyerLibCore;->ˉ:Ljava/lang/String;

    invoke-direct {v15, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 728
    new-instance v6, Lorg/json/JSONObject;

    iget-object v5, v1, Lcom/appsflyer/AppsFlyerLibCore;->ˋˊ:Ljava/util/Map;

    invoke-interface {v5, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-direct {v6, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 729
    invoke-virtual {v15, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v6, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v5, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 730
    invoke-virtual {v15, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 731
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "PushNotificationMeasurement: A previous payload with same PID and campaign was already acknowledged! (old: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", new: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    const/4 v2, 0x0

    .line 734
    iput-object v2, v1, Lcom/appsflyer/AppsFlyerLibCore;->ˉ:Ljava/lang/String;

    return-void

    :cond_8
    const/4 v2, 0x0

    .line 739
    invoke-virtual {v14}, Ljava/lang/Number;->longValue()J

    move-result-wide v5

    sub-long v5, v7, v5

    cmp-long v15, v5, v10

    if-lez v15, :cond_9

    .line 740
    iget-object v5, v1, Lcom/appsflyer/AppsFlyerLibCore;->ˋˊ:Ljava/util/Map;

    invoke-interface {v5, v14}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 744
    :cond_9
    invoke-virtual {v14}, Ljava/lang/Number;->longValue()J

    move-result-wide v5

    cmp-long v15, v5, v12

    if-gtz v15, :cond_a

    .line 745
    invoke-virtual {v14}, Ljava/lang/Number;->longValue()J

    move-result-wide v12
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_a
    move-object/from16 v2, p1

    const/4 v6, 0x2

    goto :goto_2

    :catchall_0
    move-exception v0

    goto :goto_3

    :catchall_1
    move-exception v0

    move-wide v12, v7

    .line 749
    :goto_3
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Error while handling push notification measurement: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 754
    :cond_b
    :goto_4
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v2, "pushPayloadHistorySize"

    const/4 v3, 0x2

    invoke-virtual {v0, v2, v3}, Lcom/appsflyer/AppsFlyerProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 755
    iget-object v2, v1, Lcom/appsflyer/AppsFlyerLibCore;->ˋˊ:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    if-ne v2, v0, :cond_c

    .line 756
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "pushes: removing oldest overflowing push (oldest push:"

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 757
    iget-object v0, v1, Lcom/appsflyer/AppsFlyerLibCore;->ˋˊ:Ljava/util/Map;

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 759
    :cond_c
    iget-object v0, v1, Lcom/appsflyer/AppsFlyerLibCore;->ˋˊ:Ljava/util/Map;

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    iget-object v3, v1, Lcom/appsflyer/AppsFlyerLibCore;->ˉ:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 762
    invoke-virtual/range {p1 .. p1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/appsflyer/AppsFlyerLibCore;->ॱ(Landroid/app/Application;)V

    :cond_d
    return-void
.end method

.method public setAdditionalData(Ljava/util/HashMap;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 33068
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v0, :cond_0

    .line 33069
    new-instance v0, Lcom/appsflyer/internal/x;

    invoke-direct {v0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 33071
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    .line 682
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "public_api_call"

    const-string v3, "setAdditionalData"

    .line 33174
    invoke-virtual {v0, v2, v3, v1}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 683
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 684
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object p1

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/appsflyer/AppsFlyerProperties;->setCustomData(Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method public setAndroidIdData(Ljava/lang/String;)V
    .locals 4

    .line 21068
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v0, :cond_0

    .line 21069
    new-instance v0, Lcom/appsflyer/internal/x;

    invoke-direct {v0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 21071
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string v2, "public_api_call"

    const-string v3, "setAndroidIdData"

    .line 21174
    invoke-virtual {v0, v2, v3, v1}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 506
    iput-object p1, p0, Lcom/appsflyer/AppsFlyerLibCore;->ˋ:Ljava/lang/String;

    return-void
.end method

.method public setAppId(Ljava/lang/String;)V
    .locals 4

    .line 50083
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v0, :cond_0

    .line 50084
    new-instance v0, Lcom/appsflyer/internal/x;

    invoke-direct {v0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 50086
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string v2, "public_api_call"

    const-string v3, "setAppId"

    .line 50087
    invoke-virtual {v0, v2, v3, v1}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 50089
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "appid"

    invoke-virtual {v0, v1, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setAppInviteOneLink(Ljava/lang/String;)V
    .locals 4

    .line 32068
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v0, :cond_0

    .line 32069
    new-instance v0, Lcom/appsflyer/internal/x;

    invoke-direct {v0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 32071
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string v2, "public_api_call"

    const-string v3, "setAppInviteOneLink"

    .line 32174
    invoke-virtual {v0, v2, v3, v1}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 670
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "setAppInviteOneLink = "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    const-string v0, "oneLinkSlug"

    if-eqz p1, :cond_1

    .line 671
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 672
    :cond_1
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v1

    const-string v2, "onelinkDomain"

    invoke-virtual {v1, v2}, Lcom/appsflyer/AppsFlyerProperties;->remove(Ljava/lang/String;)V

    .line 673
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v1

    const-string v2, "onelinkVersion"

    invoke-virtual {v1, v2}, Lcom/appsflyer/AppsFlyerProperties;->remove(Ljava/lang/String;)V

    .line 674
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v1

    const-string v2, "onelinkScheme"

    invoke-virtual {v1, v2}, Lcom/appsflyer/AppsFlyerProperties;->remove(Ljava/lang/String;)V

    .line 32557
    :cond_2
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v1

    invoke-virtual {v1, v0, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setAppUserId(Ljava/lang/String;)V
    .locals 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 26068
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v0, :cond_0

    .line 26069
    new-instance v0, Lcom/appsflyer/internal/x;

    invoke-direct {v0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 26071
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string v2, "public_api_call"

    const-string v3, "setAppUserId"

    .line 26174
    invoke-virtual {v0, v2, v3, v1}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 592
    invoke-virtual {p0, p1}, Lcom/appsflyer/AppsFlyerLib;->setCustomerUserId(Ljava/lang/String;)V

    return-void
.end method

.method public setCollectAndroidID(Z)V
    .locals 4

    .line 43068
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v0, :cond_0

    .line 43069
    new-instance v0, Lcom/appsflyer/internal/x;

    invoke-direct {v0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 43071
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    .line 821
    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "public_api_call"

    const-string v3, "setCollectAndroidID"

    .line 43174
    invoke-virtual {v0, v2, v3, v1}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 822
    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v0

    .line 43557
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v1

    const-string v2, "collectAndroidId"

    invoke-virtual {v1, v2, v0}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 823
    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object p1

    .line 44557
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "collectAndroidIdForceByUser"

    invoke-virtual {v0, v1, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setCollectFingerPrint(Z)V
    .locals 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 47068
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v0, :cond_0

    .line 47069
    new-instance v0, Lcom/appsflyer/internal/x;

    invoke-direct {v0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 47071
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    .line 836
    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "public_api_call"

    const-string v3, "setCollectFingerPrint"

    .line 47174
    invoke-virtual {v0, v2, v3, v1}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 837
    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object p1

    .line 47557
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "collectFingerPrint"

    invoke-virtual {v0, v1, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setCollectIMEI(Z)V
    .locals 4

    .line 45068
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v0, :cond_0

    .line 45069
    new-instance v0, Lcom/appsflyer/internal/x;

    invoke-direct {v0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 45071
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    .line 828
    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "public_api_call"

    const-string v3, "setCollectIMEI"

    .line 45174
    invoke-virtual {v0, v2, v3, v1}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 829
    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v0

    .line 45557
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v1

    const-string v2, "collectIMEI"

    invoke-virtual {v1, v2, v0}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 830
    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object p1

    .line 46557
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "collectIMEIForceByUser"

    invoke-virtual {v0, v1, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setConsumeAFDeepLinks(Z)V
    .locals 3

    .line 2138
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "consumeAfDeepLink"

    invoke-virtual {v0, v1, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Z)V

    .line 50590
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v0, :cond_0

    .line 50591
    new-instance v0, Lcom/appsflyer/internal/x;

    invoke-direct {v0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 50593
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 2139
    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p1

    const-string v1, "setConsumeAFDeepLinks: "

    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "public_api_call"

    .line 50594
    invoke-virtual {v0, v2, p1, v1}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    return-void
.end method

.method public setCurrencyCode(Ljava/lang/String;)V
    .locals 4

    .line 50103
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v0, :cond_0

    .line 50104
    new-instance v0, Lcom/appsflyer/internal/x;

    invoke-direct {v0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 50106
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string v2, "public_api_call"

    const-string v3, "setCurrencyCode"

    .line 50107
    invoke-virtual {v0, v2, v3, v1}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 1035
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "currencyCode"

    invoke-virtual {v0, v1, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setCustomerIdAndTrack(Ljava/lang/String;Landroid/content/Context;)V
    .locals 10

    if-eqz p2, :cond_5

    .line 27581
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "waitForCustomerId"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    const/4 v3, 0x1

    if-eqz v0, :cond_0

    .line 28573
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v4, "AppUserId"

    invoke-virtual {v0, v4}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_4

    .line 610
    invoke-virtual {p0, p1}, Lcom/appsflyer/AppsFlyerLib;->setCustomerUserId(Ljava/lang/String;)V

    .line 29565
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    invoke-virtual {v0, v1, v2}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Z)V

    .line 615
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "CustomerUserId set: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " - Initializing AppsFlyer Tacking"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v3}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;Z)V

    .line 616
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/appsflyer/AppsFlyerProperties;->getReferrer(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    .line 29573
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "AppsFlyerKey"

    invoke-virtual {v0, v1}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    if-nez p1, :cond_1

    const-string p1, ""

    :cond_1
    move-object v7, p1

    .line 619
    instance-of p1, p2, Landroid/app/Activity;

    if-eqz p1, :cond_2

    move-object p1, p2

    check-cast p1, Landroid/app/Activity;

    .line 627
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    goto :goto_1

    :cond_2
    const/4 p1, 0x0

    :goto_1
    move-object v8, p1

    const/4 v9, 0x0

    move-object v2, p0

    move-object v3, p2

    .line 618
    invoke-direct/range {v2 .. v9}, Lcom/appsflyer/AppsFlyerLibCore;->ˎ(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;Ljava/lang/String;)V

    .line 30573
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object p1

    const-string v0, "afUninstallToken"

    invoke-virtual {p1, v0}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 31573
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 631
    invoke-virtual {p0, p2, p1}, Lcom/appsflyer/AppsFlyerLibCore;->ˋ(Landroid/content/Context;Ljava/lang/String;)V

    :cond_3
    return-void

    .line 634
    :cond_4
    invoke-virtual {p0, p1}, Lcom/appsflyer/AppsFlyerLib;->setCustomerUserId(Ljava/lang/String;)V

    .line 635
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "waitForCustomerUserId is false; setting CustomerUserID: "

    invoke-virtual {p2, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v3}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;Z)V

    :cond_5
    return-void
.end method

.method public setCustomerUserId(Ljava/lang/String;)V
    .locals 4

    .line 50075
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v0, :cond_0

    .line 50076
    new-instance v0, Lcom/appsflyer/internal/x;

    invoke-direct {v0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 50078
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string v2, "public_api_call"

    const-string v3, "setCustomerUserId"

    .line 50079
    invoke-virtual {v0, v2, v3, v1}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 1006
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "setCustomerUserId = "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 50081
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "AppUserId"

    invoke-virtual {v0, v1, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setDebugLog(Z)V
    .locals 4

    .line 18068
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v0, :cond_0

    .line 18069
    new-instance v0, Lcom/appsflyer/internal/x;

    invoke-direct {v0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 18071
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    .line 492
    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "public_api_call"

    const-string v3, "setDebugLog"

    .line 18174
    invoke-virtual {v0, v2, v3, v1}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 493
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "shouldLog"

    .line 18199
    invoke-virtual {v0, v1, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Z)V

    .line 494
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    if-eqz p1, :cond_1

    sget-object p1, Lcom/appsflyer/AFLogger$LogLevel;->DEBUG:Lcom/appsflyer/AFLogger$LogLevel;

    goto :goto_0

    :cond_1
    sget-object p1, Lcom/appsflyer/AFLogger$LogLevel;->NONE:Lcom/appsflyer/AFLogger$LogLevel;

    .line 19136
    :goto_0
    invoke-virtual {p1}, Lcom/appsflyer/AFLogger$LogLevel;->getLevel()I

    move-result p1

    const-string v1, "logLevel"

    invoke-virtual {v0, v1, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;I)V

    return-void
.end method

.method protected setDeepLinkData(Landroid/content/Intent;)V
    .locals 2

    if-eqz p1, :cond_0

    :try_start_0
    const-string v0, "android.intent.action.VIEW"

    .line 1140
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1141
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    iput-object p1, p0, Lcom/appsflyer/AppsFlyerLibCore;->latestDeepLink:Landroid/net/Uri;

    .line 1142
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Unity setDeepLinkData = "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/appsflyer/AppsFlyerLibCore;->latestDeepLink:Landroid/net/Uri;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    const-string v0, "Exception while setting deeplink data (unity). "

    .line 1145
    invoke-static {v0, p1}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    return-void
.end method

.method public setDeviceTrackingDisabled(Z)V
    .locals 4

    .line 50155
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v0, :cond_0

    .line 50156
    new-instance v0, Lcom/appsflyer/internal/x;

    invoke-direct {v0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 50158
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    .line 1328
    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "public_api_call"

    const-string v3, "setDeviceTrackingDisabled"

    .line 50159
    invoke-virtual {v0, v2, v3, v1}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 1329
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "deviceTrackingDisabled"

    invoke-virtual {v0, v1, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Z)V

    return-void
.end method

.method public setExtension(Ljava/lang/String;)V
    .locals 4

    .line 50091
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v0, :cond_0

    .line 50092
    new-instance v0, Lcom/appsflyer/internal/x;

    invoke-direct {v0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 50094
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string v2, "public_api_call"

    const-string v3, "setExtension"

    .line 50095
    invoke-virtual {v0, v2, v3, v1}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 1023
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "sdkExtension"

    invoke-virtual {v0, v1, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setGCMProjectID(Ljava/lang/String;)V
    .locals 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 14068
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v0, :cond_0

    .line 14069
    new-instance v0, Lcom/appsflyer/internal/x;

    invoke-direct {v0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 14071
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string v2, "public_api_call"

    const-string v3, "setGCMProjectID"

    .line 14174
    invoke-virtual {v0, v2, v3, v1}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    const-string v0, "Method \'setGCMProjectNumber\' is deprecated. Please follow the documentation."

    .line 455
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afWarnLog(Ljava/lang/String;)V

    .line 456
    invoke-virtual {p0, p1}, Lcom/appsflyer/AppsFlyerLib;->enableUninstallTracking(Ljava/lang/String;)V

    return-void
.end method

.method public setGCMProjectNumber(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 16068
    sget-object p1, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez p1, :cond_0

    .line 16069
    new-instance p1, Lcom/appsflyer/internal/x;

    invoke-direct {p1}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object p1, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 16071
    :cond_0
    sget-object p1, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    const-string v1, "public_api_call"

    const-string v2, "setGCMProjectNumber"

    .line 16174
    invoke-virtual {p1, v1, v2, v0}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    const-string p1, "Method \'setGCMProjectNumber\' is deprecated. Please use \'enableUninstallTracking\'."

    .line 471
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->afWarnLog(Ljava/lang/String;)V

    .line 472
    invoke-virtual {p0, p2}, Lcom/appsflyer/AppsFlyerLib;->enableUninstallTracking(Ljava/lang/String;)V

    return-void
.end method

.method public setGCMProjectNumber(Ljava/lang/String;)V
    .locals 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 15068
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v0, :cond_0

    .line 15069
    new-instance v0, Lcom/appsflyer/internal/x;

    invoke-direct {v0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 15071
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string v2, "public_api_call"

    const-string v3, "setGCMProjectNumber"

    .line 15174
    invoke-virtual {v0, v2, v3, v1}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    const-string v0, "Method \'setGCMProjectNumber\' is deprecated. Please follow the documentation."

    .line 463
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afWarnLog(Ljava/lang/String;)V

    .line 464
    invoke-virtual {p0, p1}, Lcom/appsflyer/AppsFlyerLib;->enableUninstallTracking(Ljava/lang/String;)V

    return-void
.end method

.method public setHost(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    if-eqz p1, :cond_0

    .line 50740
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "custom_host_prefix"

    invoke-virtual {v0, v1, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    if-eqz p2, :cond_1

    .line 3246
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_1

    .line 50742
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object p1

    const-string v0, "custom_host"

    invoke-virtual {p1, v0, p2}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    const-string p1, "hostName cannot be null or empty"

    .line 3249
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->afWarnLog(Ljava/lang/String;)V

    return-void
.end method

.method public setHostName(Ljava/lang/String;)V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 50745
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "custom_host"

    invoke-virtual {v0, v1, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setImeiData(Ljava/lang/String;)V
    .locals 4

    .line 20068
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v0, :cond_0

    .line 20069
    new-instance v0, Lcom/appsflyer/internal/x;

    invoke-direct {v0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 20071
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string v2, "public_api_call"

    const-string v3, "setImeiData"

    .line 20174
    invoke-virtual {v0, v2, v3, v1}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 500
    iput-object p1, p0, Lcom/appsflyer/AppsFlyerLibCore;->ˎ:Ljava/lang/String;

    return-void
.end method

.method public setIsUpdate(Z)V
    .locals 4

    .line 50097
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v0, :cond_0

    .line 50098
    new-instance v0, Lcom/appsflyer/internal/x;

    invoke-direct {v0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 50100
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    .line 1028
    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "public_api_call"

    const-string v3, "setIsUpdate"

    .line 50101
    invoke-virtual {v0, v2, v3, v1}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 1029
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "IS_UPDATE"

    invoke-virtual {v0, v1, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Z)V

    return-void
.end method

.method public setLogLevel(Lcom/appsflyer/AFLogger$LogLevel;)V
    .locals 2

    .line 3238
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    .line 50738
    invoke-virtual {p1}, Lcom/appsflyer/AFLogger$LogLevel;->getLevel()I

    move-result p1

    const-string v1, "logLevel"

    invoke-virtual {v0, v1, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;I)V

    return-void
.end method

.method public setMinTimeBetweenSessions(I)V
    .locals 3

    .line 3281
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/appsflyer/AppsFlyerLibCore;->ॱˎ:J

    return-void
.end method

.method public setOutOfStore(Ljava/lang/String;)V
    .locals 2

    if-eqz p1, :cond_0

    .line 659
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 660
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "api_store_value"

    invoke-virtual {v0, v1, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 661
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "Store API set with value: "

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;Z)V

    return-void

    :cond_0
    const-string p1, "Cannot set setOutOfStore with null"

    .line 663
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->ˋ(Ljava/lang/String;)V

    return-void
.end method

.method public setPluginDeepLinkData(Landroid/content/Intent;)V
    .locals 0

    .line 1156
    invoke-virtual {p0, p1}, Lcom/appsflyer/AppsFlyerLibCore;->setDeepLinkData(Landroid/content/Intent;)V

    return-void
.end method

.method public setPreinstallAttribution(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    const-string v0, "setPreinstallAttribution API called"

    .line 2626
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 2627
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "pid"

    if-eqz p1, :cond_0

    .line 2630
    :try_start_0
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_0
    if-eqz p2, :cond_1

    const-string p1, "c"

    .line 2633
    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    :catch_0
    move-exception p1

    goto :goto_1

    :cond_1
    :goto_0
    if-eqz p3, :cond_2

    const-string p1, "af_siteid"

    .line 2636
    invoke-virtual {v0, p1, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 2640
    :goto_1
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2, p1}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2643
    :cond_2
    :goto_2
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 2644
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    .line 50674
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object p2

    const-string p3, "preInstallName"

    invoke-virtual {p2, p3, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_3
    const-string p1, "Cannot set preinstall attribution data without a media source"

    .line 2646
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->afWarnLog(Ljava/lang/String;)V

    return-void
.end method

.method public varargs setResolveDeepLinkURLs([Ljava/lang/String;)V
    .locals 0

    .line 842
    sput-object p1, Lcom/appsflyer/AFDeepLinkManager;->ॱ:[Ljava/lang/String;

    return-void
.end method

.method public setUserEmail(Ljava/lang/String;)V
    .locals 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 40068
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v0, :cond_0

    .line 40069
    new-instance v0, Lcom/appsflyer/internal/x;

    invoke-direct {v0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 40071
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string v2, "public_api_call"

    const-string v3, "setUserEmail"

    .line 40174
    invoke-virtual {v0, v2, v3, v1}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 40557
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "userEmail"

    invoke-virtual {v0, v1, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public varargs setUserEmails(Lcom/appsflyer/AppsFlyerProperties$EmailsCryptType;[Ljava/lang/String;)V
    .locals 7

    .line 782
    new-instance v0, Ljava/util/ArrayList;

    array-length v1, p2

    add-int/lit8 v1, v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 783
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 784
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 42068
    sget-object v1, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v1, :cond_0

    .line 42069
    new-instance v1, Lcom/appsflyer/internal/x;

    invoke-direct {v1}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v1, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 42071
    :cond_0
    sget-object v1, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 785
    array-length v2, p2

    add-int/lit8 v2, v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    invoke-interface {v0, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    const-string v2, "public_api_call"

    const-string v3, "setUserEmails"

    .line 42174
    invoke-virtual {v1, v2, v3, v0}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 787
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    invoke-virtual {p1}, Lcom/appsflyer/AppsFlyerProperties$EmailsCryptType;->getValue()I

    move-result v1

    const-string v2, "userEmailsCryptType"

    invoke-virtual {v0, v2, v1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;I)V

    .line 788
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const/4 v1, 0x0

    .line 790
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 792
    array-length v3, p2

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_4

    aget-object v1, p2, v4

    .line 793
    sget-object v5, Lcom/appsflyer/AppsFlyerLibCore$2;->ˊ:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v6

    aget v5, v5, v6

    const/4 v6, 0x2

    if-eq v5, v6, :cond_3

    const/4 v6, 0x3

    if-eq v5, v6, :cond_2

    const/4 v6, 0x4

    if-eq v5, v6, :cond_1

    .line 797
    invoke-static {v1}, Lcom/appsflyer/internal/y;->ˎ(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    const-string v1, "sha1_el_arr"

    goto :goto_1

    .line 809
    :cond_1
    invoke-virtual {v2, v1}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    const-string v1, "plain_el_arr"

    goto :goto_1

    .line 805
    :cond_2
    invoke-static {v1}, Lcom/appsflyer/internal/y;->ˋ(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    const-string v1, "sha256_el_arr"

    goto :goto_1

    .line 801
    :cond_3
    invoke-static {v1}, Lcom/appsflyer/internal/y;->ˊ(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    const-string v1, "md5_el_arr"

    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 814
    :cond_4
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 815
    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1, v0}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 816
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object p2

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/appsflyer/AppsFlyerProperties;->setUserEmails(Ljava/lang/String;)V

    return-void
.end method

.method public varargs setUserEmails([Ljava/lang/String;)V
    .locals 3

    .line 41068
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v0, :cond_0

    .line 41069
    new-instance v0, Lcom/appsflyer/internal/x;

    invoke-direct {v0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 41071
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    const-string v1, "public_api_call"

    const-string v2, "setUserEmails"

    .line 41174
    invoke-virtual {v0, v1, v2, p1}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 777
    sget-object v0, Lcom/appsflyer/AppsFlyerProperties$EmailsCryptType;->NONE:Lcom/appsflyer/AppsFlyerProperties$EmailsCryptType;

    invoke-virtual {p0, v0, p1}, Lcom/appsflyer/AppsFlyerLib;->setUserEmails(Lcom/appsflyer/AppsFlyerProperties$EmailsCryptType;[Ljava/lang/String;)V

    return-void
.end method

.method public startTracking(Landroid/app/Application;)V
    .locals 1

    .line 919
    iget-boolean v0, p0, Lcom/appsflyer/AppsFlyerLibCore;->ˋˋ:Z

    if-nez v0, :cond_0

    const-string p1, "ERROR: AppsFlyer SDK is not initialized! The API call \'startTracking(Application)\' must be called after the \'init(String, AppsFlyerConversionListener)\' API method, which should be called on the Application\'s onCreate."

    .line 920
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->afWarnLog(Ljava/lang/String;)V

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 924
    invoke-virtual {p0, p1, v0}, Lcom/appsflyer/AppsFlyerLib;->startTracking(Landroid/app/Application;Ljava/lang/String;)V

    return-void
.end method

.method public startTracking(Landroid/app/Application;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 929
    invoke-virtual {p0, p1, p2, v0}, Lcom/appsflyer/AppsFlyerLib;->startTracking(Landroid/app/Application;Ljava/lang/String;Lcom/appsflyer/AppsFlyerTrackingRequestListener;)V

    return-void
.end method

.method public startTracking(Landroid/app/Application;Ljava/lang/String;Lcom/appsflyer/AppsFlyerTrackingRequestListener;)V
    .locals 6

    .line 49068
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v0, :cond_0

    .line 49069
    new-instance v0, Lcom/appsflyer/internal/x;

    invoke-direct {v0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 49071
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    const-string v4, "public_api_call"

    const-string v5, "startTracking"

    .line 49174
    invoke-virtual {v0, v4, v5, v2}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const-string v2, "4.10.0"

    aput-object v2, v0, v3

    const-string v2, "197"

    aput-object v2, v0, v1

    const-string v2, "Starting AppsFlyer Tracking: (v%s.%s)"

    .line 935
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    const-string v0, "Build Number: 197"

    .line 936
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 937
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/appsflyer/AppsFlyerProperties;->loadProperties(Landroid/content/Context;)V

    .line 938
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const-string v2, "AppsFlyerKey"

    if-nez v0, :cond_1

    .line 49557
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    invoke-virtual {v0, v2, p2}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 940
    invoke-static {p2}, Lcom/appsflyer/AFExecutor$2$1;->ˋ(Ljava/lang/String;)V

    goto :goto_0

    .line 49573
    :cond_1
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object p2

    invoke-virtual {p2, v2}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 942
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_2

    const-string p1, "ERROR: AppsFlyer SDK is not initialized! You must provide AppsFlyer Dev-Key either in the \'init\' API method (should be called on Application\'s onCreate),or in the startTracking API method (should be called on Activity\'s onCreate)."

    .line 943
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->afWarnLog(Ljava/lang/String;)V

    return-void

    :cond_2
    :goto_0
    if-eqz p3, :cond_3

    .line 951
    sput-object p3, Lcom/appsflyer/AppsFlyerLibCore;->ˏॱ:Lcom/appsflyer/AppsFlyerTrackingRequestListener;

    .line 954
    :cond_3
    invoke-virtual {p1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object p2

    .line 49961
    :try_start_0
    invoke-virtual {p2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p3

    invoke-virtual {p2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p3

    .line 49962
    iget-object p3, p3, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget p3, p3, Landroid/content/pm/ApplicationInfo;->flags:I

    const v0, 0x8000

    and-int/2addr p3, v0

    if-eqz p3, :cond_5

    .line 49963
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const-string v0, "appsflyer_backup_rules"

    const-string v2, "xml"

    invoke-virtual {p2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, v0, v2, p2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p2

    if-eqz p2, :cond_4

    const-string p2, "appsflyer_backup_rules.xml detected, using AppsFlyer defined backup rules for AppsFlyer SDK data"

    .line 49965
    invoke-static {p2, v1}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;Z)V

    goto :goto_1

    :cond_4
    const-string p2, "\'allowBackup\' is set to true; appsflyer_backup_rules.xml not detected.\nAppsFlyer shared preferences should be excluded from auto backup by adding: <exclude domain=\"sharedpref\" path=\"appsflyer-data\"/> to the Application\'s <full-backup-content> rules"

    .line 49967
    invoke-static {p2}, Lcom/appsflyer/AFLogger;->ˋ(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p2

    .line 49971
    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "checkBackupRules Exception: "

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/appsflyer/AFLogger;->afRDLog(Ljava/lang/String;)V

    .line 956
    :cond_5
    :goto_1
    invoke-direct {p0, p1}, Lcom/appsflyer/AppsFlyerLibCore;->ॱ(Landroid/app/Application;)V

    return-void
.end method

.method public stopTracking(ZLandroid/content/Context;)V
    .locals 1

    .line 402
    iput-boolean p1, p0, Lcom/appsflyer/AppsFlyerLibCore;->ˍ:Z

    .line 403
    invoke-static {}, Lcom/appsflyer/cache/CacheManager;->getInstance()Lcom/appsflyer/cache/CacheManager;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/appsflyer/cache/CacheManager;->clearCache(Landroid/content/Context;)V

    .line 404
    iget-boolean p1, p0, Lcom/appsflyer/AppsFlyerLibCore;->ˍ:Z

    if-eqz p1, :cond_1

    .line 8850
    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    const/4 p2, 0x0

    const-string v0, "appsflyer-data"

    .line 8851
    invoke-virtual {p1, v0, p2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    .line 8528
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const/4 p2, 0x1

    const-string v0, "is_stop_tracking_used"

    .line 8529
    invoke-interface {p1, v0, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 9377
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x9

    if-lt p2, v0, :cond_0

    .line 9378
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void

    .line 9380
    :cond_0
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    :cond_1
    return-void
.end method

.method public trackAppLaunch(Landroid/content/Context;Ljava/lang/String;)V
    .locals 9

    .line 1115
    invoke-static {p1}, Lcom/appsflyer/AppsFlyerLibCore;->ॱ(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1118
    iget-object v0, p0, Lcom/appsflyer/AppsFlyerLibCore;->ᐝॱ:Lcom/appsflyer/internal/g;

    if-nez v0, :cond_0

    .line 1119
    new-instance v0, Lcom/appsflyer/internal/g;

    invoke-direct {v0}, Lcom/appsflyer/internal/g;-><init>()V

    iput-object v0, p0, Lcom/appsflyer/AppsFlyerLibCore;->ᐝॱ:Lcom/appsflyer/internal/g;

    .line 1120
    invoke-virtual {v0, p1, p0}, Lcom/appsflyer/internal/g;->ˏ(Landroid/content/Context;Lcom/appsflyer/internal/h;)V

    goto :goto_0

    :cond_0
    const-string v0, "AFInstallReferrer instance already created"

    .line 1122
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afWarnLog(Ljava/lang/String;)V

    :cond_1
    :goto_0
    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v6, ""

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    .line 1126
    invoke-direct/range {v1 .. v8}, Lcom/appsflyer/AppsFlyerLibCore;->ˎ(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;Ljava/lang/String;)V

    return-void
.end method

.method public trackEvent(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1169
    new-instance v0, Lorg/json/JSONObject;

    if-nez p3, :cond_0

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    goto :goto_0

    :cond_0
    move-object v1, p3

    :goto_0
    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 50134
    sget-object v1, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v1, :cond_1

    .line 50135
    new-instance v1, Lcom/appsflyer/internal/x;

    invoke-direct {v1}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v1, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 50137
    :cond_1
    sget-object v1, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    const/4 v3, 0x1

    .line 1170
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v2, v3

    const-string v0, "public_api_call"

    const-string v3, "trackEvent"

    .line 50138
    invoke-virtual {v1, v0, v3, v2}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 1171
    invoke-virtual {p0, p1, p2, p3}, Lcom/appsflyer/AppsFlyerLibCore;->ॱ(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public trackLocation(Landroid/content/Context;DD)V
    .locals 4

    .line 50109
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v0, :cond_0

    .line 50110
    new-instance v0, Lcom/appsflyer/internal/x;

    invoke-direct {v0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 50112
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    .line 1040
    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p4, p5}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "public_api_call"

    const-string v3, "trackLocation"

    .line 50113
    invoke-virtual {v0, v2, v3, v1}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 1041
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1042
    invoke-static {p4, p5}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object p4

    const-string p5, "af_long"

    invoke-interface {v0, p5, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1043
    invoke-static {p2, p3}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object p2

    const-string p3, "af_lat"

    invoke-interface {v0, p3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "af_location_coordinates"

    .line 1045
    invoke-virtual {p0, p1, p2, v0}, Lcom/appsflyer/AppsFlyerLibCore;->ॱ(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public unregisterConversionListener()V
    .locals 4

    .line 50174
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v0, :cond_0

    .line 50175
    new-instance v0, Lcom/appsflyer/internal/x;

    invoke-direct {v0}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 50177
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "public_api_call"

    const-string v3, "unregisterConversionListener"

    .line 50178
    invoke-virtual {v0, v2, v3, v1}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 1368
    sput-object v0, Lcom/appsflyer/AppsFlyerLibCore;->ͺ:Lcom/appsflyer/AppsFlyerConversionListener;

    return-void
.end method

.method public updateServerUninstallToken(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    if-eqz p2, :cond_0

    .line 485
    new-instance v0, Lcom/appsflyer/internal/b$b$a;

    invoke-direct {v0, p2}, Lcom/appsflyer/internal/b$b$a;-><init>(Ljava/lang/String;)V

    .line 486
    invoke-static {p1, v0}, Lcom/appsflyer/internal/v;->ॱ(Landroid/content/Context;Lcom/appsflyer/internal/b$b$a;)V

    :cond_0
    return-void
.end method

.method public validateAndTrackInAppPurchase(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    move-object v0, p1

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    .line 50731
    sget-object v1, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    if-nez v1, :cond_0

    .line 50732
    new-instance v1, Lcom/appsflyer/internal/x;

    invoke-direct {v1}, Lcom/appsflyer/internal/x;-><init>()V

    sput-object v1, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    .line 50734
    :cond_0
    sget-object v1, Lcom/appsflyer/internal/x;->ˏ:Lcom/appsflyer/internal/x;

    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    const/4 v3, 0x1

    aput-object p3, v2, v3

    const/4 v3, 0x2

    aput-object v5, v2, v3

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const/4 v3, 0x4

    aput-object v7, v2, v3

    const/4 v3, 0x5

    if-nez p7, :cond_1

    const-string v4, ""

    goto :goto_0

    .line 3082
    :cond_1
    invoke-virtual/range {p7 .. p7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    :goto_0
    aput-object v4, v2, v3

    const-string v3, "public_api_call"

    const-string v4, "validateAndTrackInAppPurchase"

    .line 50735
    invoke-virtual {v1, v3, v4, v2}, Lcom/appsflyer/internal/x;->ˋ(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 3084
    invoke-virtual {p0}, Lcom/appsflyer/AppsFlyerLib;->isTrackingStopped()Z

    move-result v1

    if-nez v1, :cond_2

    .line 3085
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Validate in app called with parameters: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    :cond_2
    if-eqz p2, :cond_5

    if-eqz v6, :cond_5

    if-eqz p3, :cond_5

    if-eqz v7, :cond_5

    if-nez v5, :cond_3

    goto :goto_2

    .line 3092
    :cond_3
    invoke-static {}, Lcom/appsflyer/AFExecutor;->getInstance()Lcom/appsflyer/AFExecutor;

    move-result-object v1

    invoke-virtual {v1}, Lcom/appsflyer/AFExecutor;->ˏ()Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    move-result-object v10

    .line 3093
    new-instance v11, Lcom/appsflyer/internal/l;

    .line 3094
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 50737
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v2

    const-string v3, "AppsFlyerKey"

    invoke-virtual {v2, v3}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 3095
    instance-of v3, v0, Landroid/app/Activity;

    if-eqz v3, :cond_4

    check-cast v0, Landroid/app/Activity;

    .line 3102
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    goto :goto_1

    :cond_4
    const/4 v0, 0x0

    :goto_1
    move-object v9, v0

    move-object v0, v11

    move-object v3, p2

    move-object v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    invoke-direct/range {v0 .. v9}, Lcom/appsflyer/internal/l;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Landroid/content/Intent;)V

    const-wide/16 v0, 0xa

    .line 3103
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {v10, v11, v0, v1, v2}, Lcom/appsflyer/AppsFlyerLibCore;->ˏ(Ljava/util/concurrent/ScheduledExecutorService;Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)V

    goto :goto_3

    .line 3088
    :cond_5
    :goto_2
    sget-object v0, Lcom/appsflyer/AppsFlyerLibCore;->ˊ:Lcom/appsflyer/AppsFlyerInAppPurchaseValidatorListener;

    if-eqz v0, :cond_6

    const-string v1, "Please provide purchase parameters"

    .line 3089
    invoke-interface {v0, v1}, Lcom/appsflyer/AppsFlyerInAppPurchaseValidatorListener;->onValidateInAppFailure(Ljava/lang/String;)V

    :cond_6
    :goto_3
    return-void
.end method

.method public waitForCustomerUserId(Z)V
    .locals 2

    .line 601
    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v0

    const-string v1, "initAfterCustomerUserID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;Z)V

    .line 26565
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "waitForCustomerId"

    invoke-virtual {v0, v1, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Z)V

    return-void
.end method

.method public final ˋ(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/content/SharedPreferences;ZLandroid/content/Intent;Ljava/lang/String;)Ljava/util/Map;
    .locals 27
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z",
            "Landroid/content/SharedPreferences;",
            "Z",
            "Landroid/content/Intent;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p7

    move/from16 v7, p8

    const-string v8, "yyyy-MM-dd_HHmmssZ"

    const-string v9, "use cached IMEI: "

    const-string v10, "uid"

    const-string v11, "appid"

    const-string v12, "INSTALL_STORE"

    const-string v13, "prev_event_name"

    const-string v14, "preInstallName"

    .line 1711
    new-instance v15, Ljava/util/HashMap;

    invoke-direct {v15}, Ljava/util/HashMap;-><init>()V

    .line 1712
    invoke-static {v2, v15}, Lcom/appsflyer/internal/r;->ˊ(Landroid/content/Context;Ljava/util/Map;)V

    .line 1714
    new-instance v16, Ljava/util/Date;

    invoke-direct/range {v16 .. v16}, Ljava/util/Date;-><init>()V

    move-object/from16 v17, v8

    move-object/from16 v18, v9

    invoke-virtual/range {v16 .. v16}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    move-object/from16 v16, v10

    .line 1715
    invoke-static {v8, v9}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v10

    const-string v1, "af_timestamp"

    invoke-interface {v15, v1, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1717
    invoke-static {v2, v8, v9}, Lcom/appsflyer/internal/b;->ˎ(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_0

    const-string v9, "cksm_v1"

    .line 1719
    invoke-interface {v15, v9, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1723
    :cond_0
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lcom/appsflyer/AppsFlyerLib;->isTrackingStopped()Z

    move-result v8

    if-nez v8, :cond_2

    .line 1724
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "******* sendTrackingWithEvent: "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-eqz v7, :cond_1

    const-string v9, "Launch"

    goto :goto_0

    :cond_1
    move-object v9, v4

    :goto_0
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    const-string v8, "SDK tracking has been stopped"

    .line 1726
    invoke-static {v8}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    :goto_1
    const-string v8, "AppsFlyer_4.10.0"

    const-string v9, "EVENT_CREATED_WITH_NAME"

    if-eqz v7, :cond_3

    const-string v10, "Launch"

    goto :goto_2

    :cond_3
    move-object v10, v4

    .line 1728
    :goto_2
    invoke-static {v2, v8, v9, v10}, Lcom/appsflyer/AppsFlyerLibCore;->ˎ(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1729
    invoke-static {}, Lcom/appsflyer/cache/CacheManager;->getInstance()Lcom/appsflyer/cache/CacheManager;

    move-result-object v8

    invoke-virtual {v8, v2}, Lcom/appsflyer/cache/CacheManager;->init(Landroid/content/Context;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_a

    .line 1733
    :try_start_1
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v9

    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v10

    const/16 v8, 0x1000

    invoke-virtual {v9, v10, v8}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v8

    .line 1734
    iget-object v8, v8, Landroid/content/pm/PackageInfo;->requestedPermissions:[Ljava/lang/String;

    invoke-static {v8}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    const-string v9, "android.permission.INTERNET"

    .line 1735
    invoke-interface {v8, v9}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_4

    const-string v9, "Permission android.permission.INTERNET is missing in the AndroidManifest.xml"

    .line 1736
    invoke-static {v9}, Lcom/appsflyer/AFLogger;->afWarnLog(Ljava/lang/String;)V

    const-string v9, "PERMISSION_INTERNET_MISSING"

    const/4 v10, 0x0

    .line 1737
    invoke-static {v2, v10, v9, v10}, Lcom/appsflyer/AppsFlyerLibCore;->ˎ(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_4
    const-string v9, "android.permission.ACCESS_NETWORK_STATE"

    .line 1739
    invoke-interface {v8, v9}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_5

    const-string v9, "Permission android.permission.ACCESS_NETWORK_STATE is missing in the AndroidManifest.xml"

    .line 1740
    invoke-static {v9}, Lcom/appsflyer/AFLogger;->afWarnLog(Ljava/lang/String;)V

    :cond_5
    const-string v9, "android.permission.ACCESS_WIFI_STATE"

    .line 1742
    invoke-interface {v8, v9}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_6

    const-string v8, "Permission android.permission.ACCESS_WIFI_STATE is missing in the AndroidManifest.xml"

    .line 1743
    invoke-static {v8}, Lcom/appsflyer/AFLogger;->afWarnLog(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_a

    goto :goto_3

    :catch_0
    move-exception v0

    move-object v8, v0

    :try_start_2
    const-string v9, "Exception while validation permissions. "

    .line 1746
    invoke-static {v9, v8}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_6
    :goto_3
    if-eqz p6, :cond_7

    const-string v8, "af_events_api"

    const-string v9, "1"

    .line 1750
    invoke-interface {v15, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_7
    const-string v8, "brand"

    .line 1752
    sget-object v9, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-interface {v15, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v8, "device"

    .line 1753
    sget-object v9, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-interface {v15, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v8, "product"

    .line 1754
    sget-object v9, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-interface {v15, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v8, "sdk"

    .line 1755
    sget v9, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {v9}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v15, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v8, "model"

    .line 1756
    sget-object v9, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-interface {v15, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v8, "deviceType"

    .line 1757
    sget-object v9, Landroid/os/Build;->TYPE:Ljava/lang/String;

    invoke-interface {v15, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v8, "window"

    .line 50202
    invoke-virtual {v2, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/view/WindowManager;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_a

    const-string v10, ""

    const/4 v9, 0x1

    if-eqz v8, :cond_c

    .line 50205
    :try_start_3
    invoke-interface {v8}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v8

    .line 50206
    invoke-virtual {v8}, Landroid/view/Display;->getRotation()I

    move-result v8

    if-eqz v8, :cond_b

    if-eq v8, v9, :cond_a

    const/4 v9, 0x2

    if-eq v8, v9, :cond_9

    const/4 v9, 0x3

    if-eq v8, v9, :cond_8

    move-object v8, v10

    goto :goto_4

    :cond_8
    const-string v8, "lr"

    goto :goto_4

    :cond_9
    const-string v8, "pr"

    goto :goto_4

    :cond_a
    const-string v8, "l"

    goto :goto_4

    :cond_b
    const-string v8, "p"

    :goto_4
    const-string v9, "sc_o"

    .line 50221
    invoke-interface {v15, v9, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_a

    :cond_c
    const-string v8, "appsFlyerCount"

    const-string v9, "appsflyer-data"

    move-object/from16 v22, v1

    const/4 v1, 0x0

    if-eqz v7, :cond_13

    .line 50227
    :try_start_4
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v13

    .line 50228
    invoke-virtual {v13, v9, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v13

    .line 50226
    invoke-interface {v13, v8}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v13

    const/16 v19, 0x1

    xor-int/lit8 v13, v13, 0x1

    if-eqz v13, :cond_e

    .line 1762
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v13

    invoke-virtual {v13}, Lcom/appsflyer/AppsFlyerProperties;->isOtherSdkStringDisabled()Z

    move-result v13

    if-nez v13, :cond_d

    .line 1763
    invoke-static/range {p1 .. p1}, Lcom/appsflyer/AppsFlyerLibCore;->ॱॱ(Landroid/content/Context;)F

    move-result v13

    const-string v1, "batteryLevel"

    .line 1764
    invoke-static {v13}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v13

    invoke-interface {v15, v1, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1766
    :cond_d
    invoke-static/range {p1 .. p1}, Lcom/appsflyer/AppsFlyerLibCore;->ˋ(Landroid/content/Context;)V

    :cond_e
    const-string v1, "timepassedsincelastlaunch"

    .line 50247
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v13

    move-object/from16 v23, v10

    const/4 v10, 0x0

    .line 50248
    invoke-virtual {v13, v9, v10}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v13

    const-string v10, "AppsFlyerTimePassedSincePrevLaunch"

    move-object/from16 v24, v8

    const-wide/16 v7, 0x0

    .line 50231
    invoke-interface {v13, v10, v7, v8}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v25

    .line 50233
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    const-string v10, "AppsFlyerTimePassedSincePrevLaunch"

    .line 50236
    invoke-static {v2, v10, v7, v8}, Lcom/appsflyer/AppsFlyerLibCore;->ˎ(Landroid/content/Context;Ljava/lang/String;J)V

    const-wide/16 v20, 0x0

    cmp-long v10, v25, v20

    if-lez v10, :cond_f

    sub-long v7, v7, v25

    const-wide/16 v25, 0x3e8

    .line 50246
    div-long v7, v7, v25

    goto :goto_5

    :cond_f
    const-wide/16 v7, -0x1

    .line 1768
    :goto_5
    invoke-static {v7, v8}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v15, v1, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50249
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v1

    const-string v7, "oneLinkSlug"

    invoke-virtual {v1, v7}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_10

    const-string v7, "onelink_id"

    .line 50251
    invoke-interface {v15, v7, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "ol_ver"

    .line 50252
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v7

    const-string v8, "onelinkVersion"

    invoke-virtual {v7, v8}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v15, v1, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_10
    const-string v1, "appsflyerGetConversionDataTiming"

    const-wide/16 v7, 0x0

    .line 50255
    invoke-interface {v6, v1, v7, v8}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v25

    cmp-long v1, v25, v7

    if-lez v1, :cond_12

    const-string v1, "gcd_timing"

    .line 50258
    invoke-static/range {v25 .. v26}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v15, v1, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "appsflyerGetConversionDataTiming"

    .line 50263
    invoke-interface/range {p7 .. p7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    move-object v8, v11

    const-wide/16 v10, 0x0

    .line 50264
    invoke-interface {v7, v1, v10, v11}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 50267
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v10, 0x9

    if-lt v1, v10, :cond_11

    .line 50268
    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_6

    .line 50270
    :cond_11
    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_6

    :cond_12
    move-object v8, v11

    :goto_6
    move-object v1, v4

    move-object v3, v5

    move-object/from16 v25, v8

    goto/16 :goto_a

    :cond_13
    move-object/from16 v24, v8

    move-object/from16 v23, v10

    move-object v8, v11

    .line 50296
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const/4 v7, 0x0

    .line 50297
    invoke-virtual {v1, v9, v7}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 50274
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_a

    const/4 v10, 0x0

    .line 50277
    :try_start_5
    invoke-interface {v1, v13, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4
    .catchall {:try_start_5 .. :try_end_5} :catchall_a

    const-string v10, "prev_event_timestamp"

    move-object/from16 v25, v8

    const-string v8, "prev_event_value"

    if-eqz v11, :cond_14

    .line 50280
    :try_start_6
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 50281
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-wide/16 v4, -0x1

    invoke-interface {v1, v10, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v10, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const/4 v3, 0x0

    .line 50282
    invoke-interface {v1, v8, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v8, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 50283
    invoke-virtual {v6, v13, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "prev_event"

    .line 50284
    invoke-virtual {v6}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v15, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_a

    goto :goto_8

    :catch_1
    move-exception v0

    move-object/from16 v1, p3

    :goto_7
    move-object/from16 v3, p4

    goto :goto_9

    :cond_14
    :goto_8
    move-object/from16 v1, p3

    .line 50287
    :try_start_7
    invoke-interface {v7, v13, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_a

    move-object/from16 v3, p4

    .line 50288
    :try_start_8
    invoke-interface {v7, v8, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 50289
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-interface {v7, v10, v4, v5}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 50298
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x9

    if-lt v4, v5, :cond_15

    .line 50299
    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_a

    .line 50301
    :cond_15
    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_2
    .catchall {:try_start_8 .. :try_end_8} :catchall_a

    goto :goto_a

    :catch_2
    move-exception v0

    goto :goto_9

    :catch_3
    move-exception v0

    goto :goto_7

    :catch_4
    move-exception v0

    move-object v1, v4

    move-object v3, v5

    move-object/from16 v25, v8

    :goto_9
    move-object v4, v0

    :try_start_9
    const-string v5, "Error while processing previous event."

    .line 50292
    invoke-static {v5, v4}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_a
    const-string v4, "KSAppsFlyerId"

    .line 50304
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v5

    invoke-virtual {v5, v4}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "KSAppsFlyerRICounter"

    .line 50305
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v6

    invoke-virtual {v6, v5}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v4, :cond_16

    if-eqz v5, :cond_16

    .line 1779
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Number;->intValue()I

    move-result v6

    if-lez v6, :cond_16

    const-string v6, "reinstallCounter"

    .line 1780
    invoke-interface {v15, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v5, "originalAppsflyerId"

    .line 1781
    invoke-interface {v15, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_16
    const-string v4, "additionalCustomData"

    .line 50306
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v5

    invoke-virtual {v5, v4}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_17

    const-string v5, "customData"

    .line 1786
    invoke-interface {v15, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_a

    .line 1790
    :cond_17
    :try_start_a
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/content/pm/PackageManager;->getInstallerPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_18

    const-string v5, "installer_package"

    .line 1792
    invoke-interface {v15, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_5
    .catchall {:try_start_a .. :try_end_a} :catchall_a

    goto :goto_b

    :catch_5
    move-exception v0

    move-object v4, v0

    :try_start_b
    const-string v5, "Exception while getting the app\'s installer package. "

    .line 1795
    invoke-static {v5, v4}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1798
    :cond_18
    :goto_b
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v4

    const-string v5, "sdkExtension"

    invoke-virtual {v4, v5}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_19

    .line 1799
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_19

    const-string v5, "sdkExtension"

    .line 1800
    invoke-interface {v15, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1803
    :cond_19
    new-instance v4, Ljava/lang/ref/WeakReference;

    invoke-direct {v4, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {v4}, Lcom/appsflyer/AppsFlyerLibCore;->ˋ(Ljava/lang/ref/WeakReference;)Ljava/lang/String;

    move-result-object v4

    .line 1805
    invoke-static {v2, v4}, Lcom/appsflyer/AppsFlyerLibCore;->ʼ(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_1a

    const-string v6, "channel"

    .line 1807
    invoke-interface {v15, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1a
    if-eqz v5, :cond_1b

    .line 1810
    invoke-virtual {v5, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1c

    :cond_1b
    if-nez v5, :cond_1d

    if-eqz v4, :cond_1d

    :cond_1c
    const-string v5, "af_latestchannel"

    .line 1812
    invoke-interface {v15, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50315
    :cond_1d
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    const/4 v5, 0x0

    .line 50316
    invoke-virtual {v4, v9, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 50308
    invoke-interface {v4, v12}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1e

    const/4 v5, 0x0

    .line 50309
    invoke-interface {v4, v12, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v5, v24

    goto :goto_d

    .line 50320
    :cond_1e
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    const/4 v5, 0x0

    .line 50321
    invoke-virtual {v4, v9, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    move-object/from16 v5, v24

    .line 50319
    invoke-interface {v4, v5}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v4

    const/4 v6, 0x1

    xor-int/2addr v4, v6

    if-eqz v4, :cond_1f

    .line 50312
    invoke-static/range {p1 .. p1}, Lcom/appsflyer/AppsFlyerLibCore;->ʼ(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    goto :goto_c

    :cond_1f
    const/4 v4, 0x0

    .line 50313
    :goto_c
    invoke-static {v2, v12, v4}, Lcom/appsflyer/AppsFlyerLibCore;->ˋ(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    :goto_d
    if-eqz v4, :cond_20

    const-string v6, "af_installstore"

    .line 1817
    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v15, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50346
    :cond_20
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    const/4 v6, 0x0

    .line 50347
    invoke-virtual {v4, v9, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 50348
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v6

    invoke-virtual {v6, v14}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_31

    .line 50326
    invoke-interface {v4, v14}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_21

    const/4 v6, 0x0

    .line 50327
    invoke-interface {v4, v14, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object v6, v4

    goto/16 :goto_18

    .line 50352
    :cond_21
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    const/4 v7, 0x0

    .line 50353
    invoke-virtual {v4, v9, v7}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 50351
    invoke-interface {v4, v5}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v4

    const/4 v7, 0x1

    xor-int/2addr v4, v7

    if-eqz v4, :cond_2f

    const-string v4, "ro.appsflyer.preinstall.path"

    .line 50354
    invoke-static {v4}, Lcom/appsflyer/AppsFlyerLibCore;->ॱ(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 50355
    invoke-static {v4}, Lcom/appsflyer/AppsFlyerLibCore;->ˋ(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    if-eqz v4, :cond_23

    .line 50379
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_22

    goto :goto_e

    :cond_22
    const/4 v6, 0x0

    goto :goto_f

    :cond_23
    :goto_e
    const/4 v6, 0x1

    :goto_f
    if-eqz v6, :cond_24

    const-string v4, "AF_PRE_INSTALL_PATH"

    .line 50359
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    invoke-static {v4, v6, v7}, Lcom/appsflyer/AppsFlyerLibCore;->ˊ(Ljava/lang/String;Landroid/content/pm/PackageManager;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 50360
    invoke-static {v4}, Lcom/appsflyer/AppsFlyerLibCore;->ˋ(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    :cond_24
    if-eqz v4, :cond_26

    .line 50380
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_25

    goto :goto_10

    :cond_25
    const/4 v6, 0x0

    goto :goto_11

    :cond_26
    :goto_10
    const/4 v6, 0x1

    :goto_11
    if-eqz v6, :cond_27

    const-string v4, "/data/local/tmp/pre_install.appsflyer"

    .line 50364
    invoke-static {v4}, Lcom/appsflyer/AppsFlyerLibCore;->ˋ(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    :cond_27
    if-eqz v4, :cond_29

    .line 50381
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_28

    goto :goto_12

    :cond_28
    const/4 v6, 0x0

    goto :goto_13

    :cond_29
    :goto_12
    const/4 v6, 0x1

    :goto_13
    if-eqz v6, :cond_2a

    const-string v4, "/etc/pre_install.appsflyer"

    .line 50367
    invoke-static {v4}, Lcom/appsflyer/AppsFlyerLibCore;->ˋ(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    :cond_2a
    if-eqz v4, :cond_2c

    .line 50382
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_2b

    goto :goto_14

    :cond_2b
    const/4 v6, 0x0

    goto :goto_15

    :cond_2c
    :goto_14
    const/4 v6, 0x1

    :goto_15
    if-nez v6, :cond_2d

    .line 50374
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Lcom/appsflyer/AppsFlyerLibCore;->ˊ(Ljava/io/File;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_2d

    goto :goto_16

    :cond_2d
    const/4 v4, 0x0

    :goto_16
    if-eqz v4, :cond_2e

    move-object v6, v4

    goto :goto_17

    .line 50335
    :cond_2e
    new-instance v4, Ljava/lang/ref/WeakReference;

    invoke-direct {v4, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    const-string v6, "AF_PRE_INSTALL_NAME"

    invoke-static {v4, v6}, Lcom/appsflyer/AppsFlyerLibCore;->ˋ(Ljava/lang/ref/WeakReference;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    :cond_2f
    :goto_17
    if-eqz v6, :cond_30

    .line 50339
    invoke-static {v2, v14, v6}, Lcom/appsflyer/AppsFlyerLibCore;->ˋ(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    :cond_30
    :goto_18
    if-eqz v6, :cond_31

    .line 50383
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v4

    invoke-virtual {v4, v14, v6}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    :cond_31
    if-eqz v6, :cond_32

    const-string v4, "af_preinstall_name"

    .line 1822
    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v15, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1825
    :cond_32
    invoke-static/range {p1 .. p1}, Lcom/appsflyer/AppsFlyerLibCore;->ʼ(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_33

    const-string v6, "af_currentstore"

    .line 1827
    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v15, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_a

    :cond_33
    const-string v4, "appsflyerKey"

    move-object/from16 v6, p2

    if-eqz v6, :cond_34

    .line 1830
    :try_start_c
    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_34

    .line 1831
    invoke-interface {v15, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_19

    :cond_34
    const-string v6, "AppsFlyerKey"

    .line 50385
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v7

    invoke-virtual {v7, v6}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_68

    .line 1834
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_68

    .line 1835
    invoke-interface {v15, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_19
    const-string v6, "AppUserId"

    .line 50387
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v7

    invoke-virtual {v7, v6}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_35

    const-string v7, "appUserId"

    .line 1846
    invoke-interface {v15, v7, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1849
    :cond_35
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v6

    const-string v7, "userEmails"

    invoke-virtual {v6, v7}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_36

    const-string v7, "user_emails"

    .line 1852
    invoke-interface {v15, v7, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1a

    :cond_36
    const-string v6, "userEmail"

    .line 50388
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v7

    invoke-virtual {v7, v6}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_37

    const-string v7, "sha1_el"

    .line 1856
    invoke-static {v6}, Lcom/appsflyer/internal/y;->ˎ(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v15, v7, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_37
    :goto_1a
    if-eqz v1, :cond_38

    const-string v6, "eventName"

    .line 1861
    invoke-interface {v15, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz v3, :cond_38

    const-string v6, "eventValue"

    .line 1863
    invoke-interface {v15, v6, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50390
    :cond_38
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v3

    move-object/from16 v6, v25

    invoke-virtual {v3, v6}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_39

    .line 50391
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v3

    invoke-virtual {v3, v6}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1868
    invoke-interface {v15, v6, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_39
    const-string v3, "currencyCode"

    .line 50392
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v6

    invoke-virtual {v6, v3}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_3b

    .line 1872
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    const/4 v7, 0x3

    if-eq v6, v7, :cond_3a

    .line 1873
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "WARNING: currency code should be 3 characters!!! \'"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "\' is not a legal value."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/appsflyer/AFLogger;->afWarnLog(Ljava/lang/String;)V

    :cond_3a
    const-string v6, "currency"

    .line 1875
    invoke-interface {v15, v6, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3b
    const-string v3, "IS_UPDATE"

    .line 50393
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v6

    invoke-virtual {v6, v3}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_3c

    const-string v6, "isUpdate"

    .line 1880
    invoke-interface {v15, v6, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1882
    :cond_3c
    invoke-virtual/range {p0 .. p1}, Lcom/appsflyer/AppsFlyerLib;->isPreInstalledApp(Landroid/content/Context;)Z

    move-result v3

    const-string v6, "af_preinstalled"

    .line 1883
    invoke-static {v3}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v15, v6, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1885
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v3

    const-string v6, "collectFacebookAttrId"

    const/4 v7, 0x1

    invoke-virtual {v3, v6, v7}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_a

    if-eqz v3, :cond_3d

    .line 1890
    :try_start_d
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    const-string v6, "com.facebook.katana"

    const/4 v7, 0x0

    invoke-virtual {v3, v6, v7}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    .line 1891
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3
    :try_end_d
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_d .. :try_end_d} :catch_6
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    move-object/from16 v6, p0

    move-object/from16 v7, v22

    :try_start_e
    invoke-virtual {v6, v3}, Lcom/appsflyer/AppsFlyerLib;->getAttributionId(Landroid/content/ContentResolver;)Ljava/lang/String;

    move-result-object v3
    :try_end_e
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_e .. :try_end_e} :catch_7
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    goto :goto_1d

    :catchall_0
    move-exception v0

    goto :goto_1b

    :catchall_1
    move-exception v0

    move-object/from16 v6, p0

    move-object/from16 v7, v22

    :goto_1b
    move-object v3, v0

    :try_start_f
    const-string v8, "Exception while collecting facebook\'s attribution ID. "

    .line 1897
    invoke-static {v8, v3}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_1c
    const/4 v3, 0x0

    goto :goto_1d

    :catch_6
    move-object/from16 v6, p0

    move-object/from16 v7, v22

    :catch_7
    const-string v3, "Exception while collecting facebook\'s attribution ID. "

    .line 1894
    invoke-static {v3}, Lcom/appsflyer/AFLogger;->afWarnLog(Ljava/lang/String;)V

    goto :goto_1c

    :goto_1d
    if-eqz v3, :cond_3e

    const-string v8, "fb"

    .line 1900
    invoke-interface {v15, v8, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1e

    :cond_3d
    move-object/from16 v6, p0

    move-object/from16 v7, v22

    .line 50394
    :cond_3e
    :goto_1e
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v3

    const-string v8, "deviceTrackingDisabled"

    const/4 v10, 0x0

    invoke-virtual {v3, v8, v10}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_9

    const-string v8, "true"

    if-eqz v3, :cond_3f

    :try_start_10
    const-string v3, "deviceTrackingDisabled"

    .line 50397
    invoke-interface {v15, v3, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v22, v7

    goto/16 :goto_2a

    .line 50478
    :cond_3f
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const/4 v10, 0x0

    .line 50479
    invoke-virtual {v3, v9, v10}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 50400
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v10

    const-string v11, "collectIMEI"

    const/4 v12, 0x1

    invoke-virtual {v10, v11, v12}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v10

    const-string v11, "imeiCached"

    const/4 v12, 0x0

    .line 50401
    invoke-interface {v3, v11, v12}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    if-eqz v10, :cond_44

    .line 50403
    iget-object v10, v6, Lcom/appsflyer/AppsFlyerLibCore;->ˎ:Ljava/lang/String;

    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_44

    .line 50404
    invoke-static/range {p1 .. p1}, Lcom/appsflyer/AppsFlyerLibCore;->ʻ(Landroid/content/Context;)Z

    move-result v10
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_9

    if-eqz v10, :cond_43

    :try_start_11
    const-string v10, "phone"

    .line 50406
    invoke-virtual {v2, v10}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/telephony/TelephonyManager;

    .line 50407
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v12

    const-string v13, "getDeviceId"
    :try_end_11
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_11 .. :try_end_11} :catch_c
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_b
    .catchall {:try_start_11 .. :try_end_11} :catchall_9

    move-object/from16 v22, v7

    const/4 v14, 0x0

    :try_start_12
    new-array v7, v14, [Ljava/lang/Class;

    invoke-virtual {v12, v13, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    new-array v12, v14, [Ljava/lang/Object;

    invoke-virtual {v7, v10, v12}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    if-eqz v7, :cond_40

    goto :goto_24

    :cond_40
    if-eqz v11, :cond_45

    .line 50411
    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7
    :try_end_12
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_12 .. :try_end_12} :catch_d
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_a
    .catchall {:try_start_12 .. :try_end_12} :catchall_9

    move-object/from16 v10, v18

    :try_start_13
    invoke-virtual {v10, v7}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V
    :try_end_13
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_13 .. :try_end_13} :catch_9
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_8
    .catchall {:try_start_13 .. :try_end_13} :catchall_9

    goto :goto_26

    :catch_8
    move-exception v0

    goto :goto_20

    :catch_9
    nop

    goto :goto_22

    :catch_a
    move-exception v0

    goto :goto_1f

    :catch_b
    move-exception v0

    move-object/from16 v22, v7

    :goto_1f
    move-object/from16 v10, v18

    :goto_20
    move-object v7, v0

    if-eqz v11, :cond_41

    .line 50422
    :try_start_14
    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v12}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    goto :goto_21

    :cond_41
    const/4 v11, 0x0

    :goto_21
    const-string v10, "WARNING: other reason: "

    .line 50425
    invoke-static {v10, v7}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_26

    :catch_c
    move-object/from16 v22, v7

    :catch_d
    move-object/from16 v10, v18

    :goto_22
    if-eqz v11, :cond_42

    .line 50416
    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v10, v7}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    goto :goto_23

    :cond_42
    const/4 v11, 0x0

    :goto_23
    const-string v7, "WARNING: READ_PHONE_STATE is missing."

    .line 50419
    invoke-static {v7}, Lcom/appsflyer/AFLogger;->afWarnLog(Ljava/lang/String;)V

    goto :goto_26

    :cond_43
    move-object/from16 v22, v7

    goto :goto_25

    :cond_44
    move-object/from16 v22, v7

    .line 50429
    iget-object v7, v6, Lcom/appsflyer/AppsFlyerLibCore;->ˎ:Ljava/lang/String;

    if-eqz v7, :cond_45

    .line 50430
    iget-object v7, v6, Lcom/appsflyer/AppsFlyerLibCore;->ˎ:Ljava/lang/String;

    :goto_24
    move-object v11, v7

    goto :goto_26

    :cond_45
    :goto_25
    const/4 v11, 0x0

    :goto_26
    if-eqz v11, :cond_46

    const-string v7, "imeiCached"

    .line 50435
    invoke-static {v2, v7, v11}, Lcom/appsflyer/AppsFlyerLibCore;->ˋ(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    const-string v7, "imei"

    .line 50436
    invoke-interface {v15, v7, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_27

    :cond_46
    const-string v7, "IMEI was not collected."

    .line 50438
    invoke-static {v7}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 50442
    :goto_27
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v7

    const-string v10, "collectAndroidId"

    const/4 v11, 0x1

    invoke-virtual {v7, v10, v11}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v7

    const-string v10, "androidIdCached"

    const/4 v11, 0x0

    .line 50443
    invoke-interface {v3, v10, v11}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v7, :cond_49

    .line 50445
    iget-object v7, v6, Lcom/appsflyer/AppsFlyerLibCore;->ˋ:Ljava/lang/String;

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_49

    .line 50446
    invoke-static/range {p1 .. p1}, Lcom/appsflyer/AppsFlyerLibCore;->ʻ(Landroid/content/Context;)Z

    move-result v7
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_9

    if-eqz v7, :cond_4a

    .line 50448
    :try_start_15
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    const-string v10, "android_id"

    invoke-static {v7, v10}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_47

    move-object v3, v7

    goto :goto_29

    :cond_47
    if-eqz v3, :cond_4a

    const-string v7, "use cached AndroidId: "

    .line 50452
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v10}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_e
    .catchall {:try_start_15 .. :try_end_15} :catchall_9

    goto :goto_29

    :catch_e
    move-exception v0

    move-object v7, v0

    if-eqz v3, :cond_48

    :try_start_16
    const-string v10, "use cached AndroidId: "

    .line 50457
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    goto :goto_28

    :cond_48
    const/4 v3, 0x0

    .line 50460
    :goto_28
    invoke-virtual {v7}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10, v7}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_29

    .line 50464
    :cond_49
    iget-object v3, v6, Lcom/appsflyer/AppsFlyerLibCore;->ˋ:Ljava/lang/String;

    if-eqz v3, :cond_4a

    .line 50465
    iget-object v3, v6, Lcom/appsflyer/AppsFlyerLibCore;->ˋ:Ljava/lang/String;

    goto :goto_29

    :cond_4a
    const/4 v3, 0x0

    :goto_29
    if-eqz v3, :cond_4b

    const-string v7, "androidIdCached"

    .line 50470
    invoke-static {v2, v7, v3}, Lcom/appsflyer/AppsFlyerLibCore;->ˋ(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    const-string v7, "android_id"

    .line 50471
    invoke-interface {v15, v7, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2a

    :cond_4b
    const-string v3, "Android ID was not collected."

    .line 50473
    invoke-static {v3}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_9

    .line 1907
    :goto_2a
    :try_start_17
    new-instance v3, Ljava/lang/ref/WeakReference;

    invoke-direct {v3, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {v3}, Lcom/appsflyer/internal/u;->ˋ(Ljava/lang/ref/WeakReference;)Ljava/lang/String;

    move-result-object v3
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_17} :catch_10
    .catchall {:try_start_17 .. :try_end_17} :catchall_9

    move-object/from16 v7, v16

    if-eqz v3, :cond_4c

    .line 1909
    :try_start_18
    invoke-interface {v15, v7, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_18} :catch_f
    .catchall {:try_start_18 .. :try_end_18} :catchall_9

    goto :goto_2c

    :catch_f
    move-exception v0

    goto :goto_2b

    :catch_10
    move-exception v0

    move-object/from16 v7, v16

    :goto_2b
    move-object v3, v0

    .line 1911
    :try_start_19
    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "ERROR: could not get uid "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10, v3}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_9

    :cond_4c
    :goto_2c
    :try_start_1a
    const-string v3, "lang"

    .line 1915
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v10

    invoke-virtual {v10}, Ljava/util/Locale;->getDisplayLanguage()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v15, v3, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_1a} :catch_11
    .catchall {:try_start_1a .. :try_end_1a} :catchall_9

    goto :goto_2d

    :catch_11
    move-exception v0

    move-object v3, v0

    :try_start_1b
    const-string v10, "Exception while collecting display language name. "

    .line 1917
    invoke-static {v10, v3}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_9

    :goto_2d
    :try_start_1c
    const-string v3, "lang_code"

    .line 1921
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v10

    invoke-virtual {v10}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v15, v3, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_1c .. :try_end_1c} :catch_12
    .catchall {:try_start_1c .. :try_end_1c} :catchall_9

    goto :goto_2e

    :catch_12
    move-exception v0

    move-object v3, v0

    :try_start_1d
    const-string v10, "Exception while collecting display language code. "

    .line 1923
    invoke-static {v10, v3}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1d
    .catchall {:try_start_1d .. :try_end_1d} :catchall_9

    :goto_2e
    :try_start_1e
    const-string v3, "country"

    .line 1927
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v10

    invoke-virtual {v10}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v15, v3, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_1e} :catch_13
    .catchall {:try_start_1e .. :try_end_1e} :catchall_9

    goto :goto_2f

    :catch_13
    move-exception v0

    move-object v3, v0

    :try_start_1f
    const-string v10, "Exception while collecting country name. "

    .line 1929
    invoke-static {v10, v3}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_2f
    const-string v3, "platformextension"

    .line 1932
    iget-object v10, v6, Lcom/appsflyer/AppsFlyerLibCore;->ˋᐝ:Lcom/appsflyer/internal/w;

    invoke-virtual {v10}, Lcom/appsflyer/internal/w;->ॱ()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v15, v3, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1934
    invoke-static {v2, v15}, Lcom/appsflyer/AppsFlyerLibCore;->ˋ(Landroid/content/Context;Ljava/util/Map;)V

    .line 50480
    new-instance v3, Ljava/text/SimpleDateFormat;

    sget-object v10, Ljava/util/Locale;->US:Ljava/util/Locale;

    move-object/from16 v11, v17

    invoke-direct {v3, v11, v10}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V
    :try_end_1f
    .catchall {:try_start_1f .. :try_end_1f} :catchall_9

    .line 1940
    :try_start_20
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v10

    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x0

    invoke-virtual {v10, v12, v13}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v10

    iget-wide v12, v10, Landroid/content/pm/PackageInfo;->firstInstallTime:J

    const-string v10, "installDate"

    const-string v14, "UTC"

    .line 50481
    invoke-static {v14}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v14

    invoke-virtual {v3, v14}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 50482
    new-instance v14, Ljava/util/Date;

    invoke-direct {v14, v12, v13}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v3, v14}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v12

    .line 1941
    invoke-interface {v15, v10, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_20} :catch_14
    .catchall {:try_start_20 .. :try_end_20} :catchall_9

    goto :goto_30

    :catch_14
    move-exception v0

    move-object v10, v0

    :try_start_21
    const-string v12, "Exception while collecting install date. "

    .line 1943
    invoke-static {v12, v10}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_21
    .catchall {:try_start_21 .. :try_end_21} :catchall_9

    .line 1947
    :goto_30
    :try_start_22
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v10

    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x0

    invoke-virtual {v10, v12, v13}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v10

    const-string v12, "versionCode"
    :try_end_22
    .catchall {:try_start_22 .. :try_end_22} :catchall_6

    move-object/from16 v14, p7

    .line 1949
    :try_start_23
    invoke-interface {v14, v12, v13}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v12

    .line 1951
    iget v13, v10, Landroid/content/pm/PackageInfo;->versionCode:I
    :try_end_23
    .catchall {:try_start_23 .. :try_end_23} :catchall_5

    if-le v13, v12, :cond_4d

    :try_start_24
    const-string v12, "appsflyerConversionDataRequestRetries"

    const/4 v13, 0x0

    .line 1954
    invoke-static {v2, v12, v13}, Lcom/appsflyer/AppsFlyerLibCore;->ˏ(Landroid/content/Context;Ljava/lang/String;I)V

    const-string v12, "versionCode"

    .line 1955
    iget v13, v10, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v2, v12, v13}, Lcom/appsflyer/AppsFlyerLibCore;->ˏ(Landroid/content/Context;Ljava/lang/String;I)V
    :try_end_24
    .catchall {:try_start_24 .. :try_end_24} :catchall_2

    goto :goto_31

    :catchall_2
    move-exception v0

    move-object v1, v0

    move-object/from16 v17, v4

    move-object/from16 v16, v7

    move-object/from16 p2, v8

    goto/16 :goto_35

    :cond_4d
    :goto_31
    :try_start_25
    const-string v12, "app_version_code"

    .line 1959
    iget v13, v10, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v13}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v13

    invoke-interface {v15, v12, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v12, "app_version_name"

    .line 1960
    iget-object v13, v10, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-interface {v15, v12, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1962
    iget-wide v12, v10, Landroid/content/pm/PackageInfo;->firstInstallTime:J
    :try_end_25
    .catchall {:try_start_25 .. :try_end_25} :catchall_5

    move-object/from16 v16, v7

    move-object/from16 p2, v8

    .line 1963
    :try_start_26
    iget-wide v7, v10, Landroid/content/pm/PackageInfo;->lastUpdateTime:J

    const-string v10, "date1"
    :try_end_26
    .catchall {:try_start_26 .. :try_end_26} :catchall_4

    move-object/from16 v17, v4

    .line 50483
    :try_start_27
    new-instance v4, Ljava/text/SimpleDateFormat;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v4, v11, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 1964
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1, v12, v13}, Ljava/util/Date;-><init>(J)V

    .line 1965
    invoke-virtual {v4, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    .line 1964
    invoke-interface {v15, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "date2"

    .line 50484
    new-instance v4, Ljava/text/SimpleDateFormat;

    sget-object v10, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v4, v11, v10}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 1966
    new-instance v10, Ljava/util/Date;

    invoke-direct {v10, v7, v8}, Ljava/util/Date;-><init>(J)V

    .line 1967
    invoke-virtual {v4, v10}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    .line 1966
    invoke-interface {v15, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50500
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const/4 v4, 0x0

    .line 50501
    invoke-virtual {v1, v9, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v7, "appsFlyerFirstInstall"

    const/4 v8, 0x0

    .line 50486
    invoke-interface {v1, v7, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_4f

    .line 50505
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 50506
    invoke-virtual {v1, v9, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 50504
    invoke-interface {v1, v5}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v1

    const/4 v4, 0x1

    xor-int/2addr v1, v4

    if-eqz v1, :cond_4e

    const-string v1, "AppsFlyer: first launch detected"

    .line 50489
    invoke-static {v1}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 50490
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v3, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    goto :goto_32

    :cond_4e
    move-object/from16 v1, v23

    :goto_32
    const-string v3, "appsFlyerFirstInstall"

    .line 50494
    invoke-static {v2, v3, v1}, Lcom/appsflyer/AppsFlyerLibCore;->ˋ(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    :cond_4f
    const-string v3, "AppsFlyer: first launch date: "

    .line 50497
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    const-string v3, "firstLaunchDate"

    .line 1969
    invoke-interface {v15, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_27
    .catchall {:try_start_27 .. :try_end_27} :catchall_3

    goto :goto_36

    :catchall_3
    move-exception v0

    goto :goto_34

    :catchall_4
    move-exception v0

    move-object/from16 v17, v4

    goto :goto_34

    :catchall_5
    move-exception v0

    goto :goto_33

    :catchall_6
    move-exception v0

    move-object/from16 v14, p7

    :goto_33
    move-object/from16 v17, v4

    move-object/from16 v16, v7

    move-object/from16 p2, v8

    :goto_34
    move-object v1, v0

    :goto_35
    :try_start_28
    const-string v3, "Exception while collecting app version data "

    .line 1971
    invoke-static {v3, v1}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1974
    :goto_36
    invoke-virtual/range {p5 .. p5}, Ljava/lang/String;->length()I

    move-result v1
    :try_end_28
    .catchall {:try_start_28 .. :try_end_28} :catchall_9

    const-string v3, "referrer"

    if-lez v1, :cond_50

    move-object/from16 v1, p5

    .line 1975
    :try_start_29
    invoke-interface {v15, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_50
    const-string v1, "extraReferrers"

    const/4 v4, 0x0

    .line 1983
    invoke-interface {v14, v1, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_51

    const-string v4, "extraReferrers"

    .line 1985
    invoke-interface {v15, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_51
    const-string v1, "afUninstallToken"

    .line 50507
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v4

    invoke-virtual {v4, v1}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_52

    .line 1991
    invoke-static {v1}, Lcom/appsflyer/internal/b$b$a;->ˎ(Ljava/lang/String;)Lcom/appsflyer/internal/b$b$a;

    move-result-object v1

    const-string v4, "af_gcm_token"

    .line 50508
    iget-object v1, v1, Lcom/appsflyer/internal/b$b$a;->ˎ:Ljava/lang/String;

    .line 1993
    invoke-interface {v15, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50509
    :cond_52
    invoke-static/range {p1 .. p1}, Lcom/appsflyer/internal/v;->ˊ(Landroid/content/Context;)Z

    move-result v1

    .line 50510
    invoke-static/range {p1 .. p1}, Lcom/appsflyer/internal/v;->ˏ(Landroid/content/Context;)Z

    move-result v4

    or-int/2addr v1, v4

    .line 1998
    iput-boolean v1, v6, Lcom/appsflyer/AppsFlyerLibCore;->ˌ:Z

    .line 1999
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v4, "didConfigureTokenRefreshService="

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v4, v6, Lcom/appsflyer/AppsFlyerLibCore;->ˌ:Z

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 2000
    iget-boolean v1, v6, Lcom/appsflyer/AppsFlyerLibCore;->ˌ:Z

    if-nez v1, :cond_53

    const-string v1, "tokenRefreshConfigured"

    .line 2001
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {v15, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_53
    move/from16 v1, p8

    if-eqz v1, :cond_55

    .line 2007
    invoke-static {}, Lcom/appsflyer/AFDeepLinkManager;->getInstance()Lcom/appsflyer/AFDeepLinkManager;

    move-result-object v4

    move-object/from16 v7, p9

    invoke-virtual {v4, v7, v2, v15}, Lcom/appsflyer/AFDeepLinkManager;->processIntentForDeepLink(Landroid/content/Intent;Landroid/content/Context;Ljava/util/Map;)V

    .line 2010
    iget-object v4, v6, Lcom/appsflyer/AppsFlyerLibCore;->ˉ:Ljava/lang/String;

    if-eqz v4, :cond_54

    .line 2011
    new-instance v4, Lorg/json/JSONObject;

    iget-object v7, v6, Lcom/appsflyer/AppsFlyerLibCore;->ˉ:Ljava/lang/String;

    invoke-direct {v4, v7}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v7, "isPush"

    move-object/from16 v8, p2

    .line 2012
    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v7, "af_deeplink"

    .line 2013
    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v15, v7, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_37

    :cond_54
    move-object/from16 v8, p2

    :goto_37
    const/4 v4, 0x0

    .line 2015
    iput-object v4, v6, Lcom/appsflyer/AppsFlyerLibCore;->ˉ:Ljava/lang/String;

    const-string v4, "open_referrer"

    move-object/from16 v7, p10

    .line 2017
    invoke-interface {v15, v4, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_38

    :cond_55
    move-object/from16 v8, p2

    .line 2021
    :goto_38
    iget-boolean v4, v6, Lcom/appsflyer/AppsFlyerLibCore;->ˊᐝ:Z

    if-eqz v4, :cond_56

    const-string v4, "testAppMode_retargeting"

    .line 2022
    invoke-interface {v15, v4, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2023
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, v15}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 2024
    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/appsflyer/AppsFlyerLibCore;->ˊ(Landroid/content/Context;Ljava/lang/String;)V

    const-string v4, "Sent retargeting params to test app"

    .line 2025
    invoke-static {v4}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 50512
    :cond_56
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    iget-wide v11, v6, Lcom/appsflyer/AppsFlyerLibCore;->ˊˊ:J

    sub-long/2addr v9, v11

    .line 50513
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v4

    invoke-virtual {v4, v2}, Lcom/appsflyer/AppsFlyerProperties;->getReferrer(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    const-wide/16 v11, 0x7530

    cmp-long v7, v9, v11

    if-gtz v7, :cond_57

    if-eqz v4, :cond_57

    const-string v7, "AppsFlyer_Test"

    .line 50514
    invoke-virtual {v4, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_57

    const/4 v4, 0x1

    goto :goto_39

    :cond_57
    const/4 v4, 0x0

    :goto_39
    if-eqz v4, :cond_58

    const-string v4, "testAppMode"

    .line 2030
    invoke-interface {v15, v4, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2031
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, v15}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 2032
    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/appsflyer/AppsFlyerLibCore;->ˊ(Landroid/content/Context;Ljava/lang/String;)V

    const-string v4, "Sent params to test app"

    .line 2033
    invoke-static {v4}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    const-string v4, "Test mode ended!"

    .line 50515
    invoke-static {v4}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    const-wide/16 v9, 0x0

    .line 50516
    iput-wide v9, v6, Lcom/appsflyer/AppsFlyerLibCore;->ˊˊ:J

    :cond_58
    const-string v4, "advertiserId"

    .line 50518
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v7

    invoke-virtual {v7, v4}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_5a

    .line 2038
    invoke-static {v2, v15}, Lcom/appsflyer/internal/r;->ˊ(Landroid/content/Context;Ljava/util/Map;)V

    const-string v4, "advertiserId"

    .line 50519
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v7

    invoke-virtual {v7, v4}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_59

    const-string v4, "GAID_retry"

    .line 2040
    invoke-interface {v15, v4, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3a

    :cond_59
    const-string v4, "GAID_retry"

    const-string v7, "false"

    .line 2042
    invoke-interface {v15, v4, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2046
    :cond_5a
    :goto_3a
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-static {v4}, Lcom/appsflyer/internal/r;->ˏ(Landroid/content/ContentResolver;)Lcom/appsflyer/internal/n;

    move-result-object v4

    if-eqz v4, :cond_5b

    const-string v7, "amazon_aid"

    .line 50520
    iget-object v9, v4, Lcom/appsflyer/internal/n;->ˋ:Ljava/lang/String;

    .line 2048
    invoke-interface {v15, v7, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v7, "amazon_aid_limit"

    .line 50521
    iget-boolean v4, v4, Lcom/appsflyer/internal/n;->ॱ:Z

    .line 2049
    invoke-static {v4}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v15, v7, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2054
    :cond_5b
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v4

    invoke-virtual {v4, v2}, Lcom/appsflyer/AppsFlyerProperties;->getReferrer(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_5c

    .line 2055
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_5c

    invoke-interface {v15, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    if-nez v7, :cond_5c

    .line 2057
    invoke-interface {v15, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_5c
    const-string v3, "sentSuccessfully"

    move-object/from16 v4, v23

    .line 2059
    invoke-interface {v14, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v8, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    const-string v4, "sentRegisterRequestToAF"

    const/4 v7, 0x0

    .line 2061
    invoke-interface {v14, v4, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    const-string v7, "registeredUninstall"

    .line 2062
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-interface {v15, v7, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50522
    invoke-static {v14, v5, v1}, Lcom/appsflyer/AppsFlyerLibCore;->ˊ(Landroid/content/SharedPreferences;Ljava/lang/String;Z)I

    move-result v4

    const-string v7, "counter"

    .line 2064
    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v15, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v7, "iaecounter"

    if-eqz p3, :cond_5d

    const/4 v8, 0x1

    goto :goto_3b

    :cond_5d
    const/4 v8, 0x0

    :goto_3b
    const-string v9, "appsFlyerInAppEventCount"

    .line 50523
    invoke-static {v14, v9, v8}, Lcom/appsflyer/AppsFlyerLibCore;->ˊ(Landroid/content/SharedPreferences;Ljava/lang/String;Z)I

    move-result v8

    .line 2065
    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v15, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz v1, :cond_5e

    const/4 v7, 0x1

    if-ne v4, v7, :cond_5e

    .line 2068
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v7

    invoke-virtual {v7}, Lcom/appsflyer/AppsFlyerProperties;->setFirstLaunchCalled()V

    const-string v7, "waitForCustomerId"

    .line 50524
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {v8, v7, v9}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v7

    if-eqz v7, :cond_5e

    const-string v7, "wait_cid"

    const/4 v8, 0x1

    .line 2070
    invoke-static {v8}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v15, v7, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_5e
    const-string v7, "isFirstCall"

    if-nez v3, :cond_5f

    const/4 v3, 0x1

    goto :goto_3c

    :cond_5f
    const/4 v3, 0x0

    .line 2073
    :goto_3c
    invoke-static {v3}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v15, v7, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50525
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    const-string v7, "cpu_abi"

    const-string v8, "ro.product.cpu.abi"

    .line 50526
    invoke-static {v8}, Lcom/appsflyer/AppsFlyerLibCore;->ॱ(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v3, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v7, "cpu_abi2"

    const-string v8, "ro.product.cpu.abi2"

    .line 50527
    invoke-static {v8}, Lcom/appsflyer/AppsFlyerLibCore;->ॱ(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v3, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v7, "arch"

    const-string v8, "os.arch"

    .line 50528
    invoke-static {v8}, Lcom/appsflyer/AppsFlyerLibCore;->ॱ(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v3, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v7, "build_display_id"

    const-string v8, "ro.build.display.id"

    .line 50529
    invoke-static {v8}, Lcom/appsflyer/AppsFlyerLibCore;->ॱ(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v3, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz v1, :cond_63

    .line 50532
    iget-boolean v7, v6, Lcom/appsflyer/AppsFlyerLibCore;->ˊˋ:Z

    if-eqz v7, :cond_61

    .line 50558
    invoke-static {}, Lcom/appsflyer/internal/i;->ॱ()Lcom/appsflyer/internal/i;

    invoke-static/range {p1 .. p1}, Lcom/appsflyer/internal/i;->ˊ(Landroid/content/Context;)Landroid/location/Location;

    move-result-object v7

    .line 50559
    new-instance v8, Ljava/util/HashMap;

    const/4 v9, 0x3

    invoke-direct {v8, v9}, Ljava/util/HashMap;-><init>(I)V

    if-eqz v7, :cond_60

    const-string v9, "lat"

    .line 50561
    invoke-virtual {v7}, Landroid/location/Location;->getLatitude()D

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v8, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v9, "lon"

    .line 50562
    invoke-virtual {v7}, Landroid/location/Location;->getLongitude()D

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v8, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v9, "ts"

    .line 50563
    invoke-virtual {v7}, Landroid/location/Location;->getTime()J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v8, v9, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50535
    :cond_60
    invoke-interface {v8}, Ljava/util/Map;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_61

    const-string v7, "loc"

    .line 50536
    invoke-interface {v3, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50566
    :cond_61
    invoke-static {}, Lcom/appsflyer/internal/e;->ˋ()Lcom/appsflyer/internal/e;

    move-result-object v7

    invoke-virtual {v7, v2}, Lcom/appsflyer/internal/e;->ˊ(Landroid/content/Context;)Lcom/appsflyer/internal/e$c;

    move-result-object v7

    const-string v8, "btl"

    .line 50572
    iget v9, v7, Lcom/appsflyer/internal/e$c;->ॱ:F

    .line 50567
    invoke-static {v9}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v3, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50573
    iget-object v8, v7, Lcom/appsflyer/internal/e$c;->ˎ:Ljava/lang/String;

    if-eqz v8, :cond_62

    const-string v8, "btch"

    .line 50574
    iget-object v7, v7, Lcom/appsflyer/internal/e$c;->ˎ:Ljava/lang/String;

    .line 50569
    invoke-interface {v3, v8, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_62
    const/4 v7, 0x2

    if-lt v7, v4, :cond_63

    .line 50545
    invoke-static/range {p1 .. p1}, Lcom/appsflyer/internal/o;->ˏ(Landroid/content/Context;)Lcom/appsflyer/internal/o;

    move-result-object v4

    invoke-virtual {v4}, Lcom/appsflyer/internal/o;->ˊ()Ljava/util/List;

    move-result-object v4

    .line 50546
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_63

    const-string v7, "sensors"

    .line 50547
    invoke-interface {v3, v7, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50552
    :cond_63
    invoke-static/range {p1 .. p1}, Lcom/appsflyer/AFScreenManager;->getScreenMetrics(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v4

    const-string v7, "dim"

    .line 50553
    invoke-interface {v3, v7, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "deviceData"

    .line 50556
    invoke-interface {v15, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2079
    new-instance v3, Lcom/appsflyer/internal/y;

    invoke-direct {v3}, Lcom/appsflyer/internal/y;-><init>()V

    move-object/from16 v3, v17

    .line 50575
    invoke-interface {v15, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    move-object/from16 v7, v22

    .line 50576
    invoke-interface {v15, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    move-object/from16 v9, v16

    .line 50577
    invoke-interface {v15, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 50580
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v12, 0x7

    const/4 v13, 0x0

    invoke-virtual {v4, v13, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v4, 0x7

    invoke-virtual {v10, v13, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x7

    invoke-virtual {v8, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/appsflyer/internal/y;->ˎ(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v8, "af_v"

    .line 2080
    invoke-interface {v15, v8, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2082
    new-instance v4, Lcom/appsflyer/internal/y;

    invoke-direct {v4}, Lcom/appsflyer/internal/y;-><init>()V

    .line 50582
    invoke-interface {v15, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 50583
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v15, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 50584
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v15, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 50585
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "installDate"

    invoke-interface {v15, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 50586
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "counter"

    invoke-interface {v15, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 50587
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "iaecounter"

    invoke-interface {v15, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 50588
    invoke-static {v3}, Lcom/appsflyer/internal/y;->ˊ(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/appsflyer/internal/y;->ˎ(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "af_v2"

    .line 2083
    invoke-interface {v15, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2086
    invoke-static/range {p1 .. p1}, Lcom/appsflyer/AppsFlyerLibCore;->ᐝ(Landroid/content/Context;)Z

    move-result v3

    const-string v4, "ivc"

    .line 2087
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {v15, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz v1, :cond_66

    const/4 v1, 0x0

    .line 50589
    invoke-static {v14, v5, v1}, Lcom/appsflyer/AppsFlyerLibCore;->ˊ(Landroid/content/SharedPreferences;Ljava/lang/String;Z)I

    move-result v3
    :try_end_29
    .catchall {:try_start_29 .. :try_end_29} :catchall_9

    const/4 v4, 0x2

    if-gt v3, v4, :cond_66

    const/16 v3, 0x6e64

    const/16 v4, 0x18

    .line 2091
    :try_start_2a
    invoke-static {v1, v3, v4}, Lcom/appsflyer/internal/c;->ॱ(ICI)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Class;

    const-string v1, "\u02ca"

    const/4 v4, 0x0

    invoke-virtual {v3, v1, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    invoke-virtual {v1, v4, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_2a
    .catchall {:try_start_2a .. :try_end_2a} :catchall_8

    const/4 v3, 0x2

    :try_start_2b
    new-array v4, v3, [Ljava/lang/Object;

    const/4 v3, 0x1

    aput-object v15, v4, v3

    const/4 v3, 0x0

    aput-object v2, v4, v3

    const/16 v2, 0x6e64

    const/16 v5, 0x18

    invoke-static {v3, v2, v5}, Lcom/appsflyer/internal/c;->ॱ(ICI)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Class;

    const-string v5, "\u02cf"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Class;

    const-class v8, Landroid/content/Context;

    aput-object v8, v7, v3

    const-class v3, Ljava/util/Map;

    const/4 v8, 0x1

    aput-object v3, v7, v8

    invoke-virtual {v2, v5, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    invoke-virtual {v2, v1, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2b
    .catchall {:try_start_2b .. :try_end_2b} :catchall_7

    goto :goto_3d

    :catchall_7
    move-exception v0

    move-object v1, v0

    :try_start_2c
    invoke-virtual {v1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_64

    throw v2

    :cond_64
    throw v1

    :catchall_8
    move-exception v0

    move-object v1, v0

    invoke-virtual {v1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_65

    throw v2

    :cond_65
    throw v1

    :cond_66
    :goto_3d
    const-string v1, "is_stop_tracking_used"

    .line 2095
    invoke-interface {v14, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_67

    const-string v1, "istu"

    const-string v2, "is_stop_tracking_used"

    const/4 v3, 0x0

    .line 2096
    invoke-interface {v14, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v15, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2100
    :cond_67
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v1

    const-string v2, "consumeAfDeepLink"

    invoke-virtual {v1, v2}, Lcom/appsflyer/AppsFlyerProperties;->getObject(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_69

    .line 2101
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v1

    const-string v2, "consumeAfDeepLink"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v1

    const-string v2, "is_dp_api"

    .line 2102
    invoke-interface {v15, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3f

    :cond_68
    move-object/from16 v6, p0

    const-string v1, "AppsFlyer dev key is missing!!! Please use  AppsFlyerLib.getInstance().setAppsFlyerKey(...) to set it. "

    .line 1837
    invoke-static {v1}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    const-string v1, "AppsFlyer_4.10.0"

    const-string v3, "DEV_KEY_MISSING"

    const/4 v4, 0x0

    .line 1838
    invoke-static {v2, v1, v3, v4}, Lcom/appsflyer/AppsFlyerLibCore;->ˎ(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "AppsFlyer will not track this event."

    .line 1839
    invoke-static {v1}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V
    :try_end_2c
    .catchall {:try_start_2c .. :try_end_2c} :catchall_9

    return-object v4

    :catchall_9
    move-exception v0

    goto :goto_3e

    :catchall_a
    move-exception v0

    move-object/from16 v6, p0

    :goto_3e
    move-object v1, v0

    .line 2106
    invoke-virtual {v1}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v1}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_69
    :goto_3f
    return-object v15
.end method

.method public final ˋ(Landroid/content/Context;Ljava/lang/String;)V
    .locals 11

    .line 50142
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "waitForCustomerId"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    const-string v1, "AppUserId"

    const/4 v3, 0x1

    if-eqz v0, :cond_0

    .line 50143
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    const-string p1, "CustomerUserId not set, Tracking is disabled"

    .line 1241
    invoke-static {p1, v3}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;Z)V

    return-void

    .line 1245
    :cond_1
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 50144
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v4

    const-string v5, "AppsFlyerKey"

    invoke-virtual {v4, v5}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_2

    const-string p1, "[registerUninstall] AppsFlyer\'s SDK cannot send any event without providing DevKey."

    .line 1248
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->afWarnLog(Ljava/lang/String;)V

    return-void

    .line 1253
    :cond_2
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    .line 1254
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    .line 1257
    :try_start_0
    invoke-virtual {v5, v6, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v7

    const-string v8, "app_version_code"

    .line 1258
    iget v9, v7, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v9}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v0, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v8, "app_version_name"

    .line 1259
    iget-object v9, v7, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-interface {v0, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1262
    iget-object v8, v7, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    invoke-virtual {v5, v8}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v8, "app_name"

    .line 1263
    invoke-interface {v0, v8, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1266
    iget-wide v7, v7, Landroid/content/pm/PackageInfo;->firstInstallTime:J

    const-string v5, "yyyy-MM-dd_HHmmssZ"

    .line 50145
    new-instance v9, Ljava/text/SimpleDateFormat;

    sget-object v10, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v9, v5, v10}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    const-string v5, "installDate"

    const-string v10, "UTC"

    .line 50146
    invoke-static {v10}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 50147
    new-instance v10, Ljava/util/Date;

    invoke-direct {v10, v7, v8}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v9, v10}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v7

    .line 1268
    invoke-interface {v0, v5, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v5

    const-string v7, "Exception while collecting application version info."

    .line 1270
    invoke-static {v7, v5}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1272
    :goto_1
    invoke-static {p1, v0}, Lcom/appsflyer/AppsFlyerLibCore;->ˋ(Landroid/content/Context;Ljava/util/Map;)V

    .line 50149
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v5

    invoke-virtual {v5, v1}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    const-string v5, "appUserId"

    .line 1277
    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    :try_start_1
    const-string v1, "model"

    .line 1282
    sget-object v5, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-interface {v0, v1, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "brand"

    .line 1283
    sget-object v5, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-interface {v0, v1, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v1

    const-string v5, "Exception while collecting device brand and model."

    .line 1285
    invoke-static {v5, v1}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1289
    :goto_2
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v1

    const-string v5, "deviceTrackingDisabled"

    invoke-virtual {v1, v5, v2}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_4

    const-string v1, "true"

    .line 1291
    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1294
    :cond_4
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-static {v1}, Lcom/appsflyer/internal/r;->ˏ(Landroid/content/ContentResolver;)Lcom/appsflyer/internal/n;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 50150
    iget-object v5, v1, Lcom/appsflyer/internal/n;->ˋ:Ljava/lang/String;

    const-string v7, "amazon_aid"

    .line 1296
    invoke-interface {v0, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50151
    iget-boolean v1, v1, Lcom/appsflyer/internal/n;->ॱ:Z

    .line 1297
    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v1

    const-string v5, "amazon_aid_limit"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1300
    :cond_5
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v1

    const-string v5, "advertiserId"

    invoke-virtual {v1, v5}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_6

    .line 1302
    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_6
    const-string v1, "devkey"

    .line 1305
    invoke-interface {v0, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1306
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {v1}, Lcom/appsflyer/internal/u;->ˋ(Ljava/lang/ref/WeakReference;)Ljava/lang/String;

    move-result-object v1

    const-string v4, "uid"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "af_gcm_token"

    .line 1307
    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50152
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    const-string v1, "appsflyer-data"

    .line 50153
    invoke-virtual {p2, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p2

    const-string v1, "appsFlyerCount"

    .line 50154
    invoke-static {p2, v1, v2}, Lcom/appsflyer/AppsFlyerLibCore;->ˊ(Landroid/content/SharedPreferences;Ljava/lang/String;Z)I

    move-result p2

    .line 1309
    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p2

    const-string v1, "launch_counter"

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1310
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p2

    const-string v1, "sdk"

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1311
    new-instance p2, Ljava/lang/ref/WeakReference;

    invoke-direct {p2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {p2}, Lcom/appsflyer/AppsFlyerLibCore;->ˋ(Ljava/lang/ref/WeakReference;)Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_7

    const-string v1, "channel"

    .line 1313
    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1317
    :cond_7
    :try_start_2
    new-instance p2, Lcom/appsflyer/internal/q;

    invoke-virtual {p0}, Lcom/appsflyer/AppsFlyerLib;->isTrackingStopped()Z

    move-result v1

    invoke-direct {p2, p1, v1}, Lcom/appsflyer/internal/q;-><init>(Landroid/content/Context;Z)V

    .line 1318
    iput-object v0, p2, Lcom/appsflyer/internal/q;->ॱ:Ljava/util/Map;

    .line 1319
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v0, Lcom/appsflyer/AppsFlyerLibCore;->ˏ:Ljava/lang/String;

    invoke-static {v0}, Lcom/appsflyer/ServerConfigHandler;->getUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    new-array v0, v3, [Ljava/lang/String;

    aput-object p1, v0, v2

    .line 1320
    invoke-virtual {p2, v0}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    return-void

    :catchall_2
    move-exception p1

    .line 1322
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2, p1}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method final ॱ(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 13

    const-string v0, "shouldMonitor"

    .line 215
    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string p2, "Turning on monitoring."

    .line 217
    invoke-static {p2}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 218
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object p2

    const-string v2, "true"

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {p2, v0, v1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Z)V

    const/4 p2, 0x0

    .line 219
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "START_TRACKING"

    invoke-static {p1, p2, v1, v0}, Lcom/appsflyer/AppsFlyerLibCore;->ˎ(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    const-string v0, "****** onReceive called *******"

    .line 223
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 225
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    invoke-virtual {v0}, Lcom/appsflyer/AppsFlyerProperties;->setOnReceiveCalled()V

    const-string v0, "referrer"

    .line 227
    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 228
    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Play store referrer: "

    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    if-eqz v7, :cond_4

    const-string v1, "TestIntegrationMode"

    .line 232
    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "AppsFlyer_Test"

    .line 234
    invoke-virtual {v2, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/16 v2, 0x9

    const-string v3, "appsflyer-data"

    const/4 v4, 0x0

    if-eqz v1, :cond_2

    .line 4850
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 4851
    invoke-virtual {v1, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 237
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 238
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    .line 5377
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v5, v2, :cond_1

    .line 5378
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_0

    .line 5380
    :cond_1
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 241
    :goto_0
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v1

    invoke-virtual {v1, v4}, Lcom/appsflyer/AppsFlyerProperties;->setFirstLaunchCalled(Z)V

    const-string v1, "Test mode started.."

    .line 5385
    invoke-static {v1}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 5386
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    iput-wide v5, p0, Lcom/appsflyer/AppsFlyerLibCore;->ˊˊ:J

    .line 5850
    :cond_2
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 5851
    invoke-virtual {v1, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 5521
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 5522
    invoke-interface {v1, v0, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 6377
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v2, :cond_3

    .line 6378
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_1

    .line 6380
    :cond_3
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 248
    :goto_1
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    invoke-virtual {v0, v7}, Lcom/appsflyer/AppsFlyerProperties;->setReferrer(Ljava/lang/String;)V

    .line 250
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    invoke-virtual {v0}, Lcom/appsflyer/AppsFlyerProperties;->isFirstLaunchCalled()Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "onReceive: isLaunchCalled"

    .line 251
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    if-eqz v7, :cond_4

    .line 6560
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x5

    if-le v0, v1, :cond_4

    .line 6561
    invoke-static {}, Lcom/appsflyer/AFExecutor;->getInstance()Lcom/appsflyer/AFExecutor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/appsflyer/AFExecutor;->ˏ()Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    move-result-object v0

    .line 6562
    new-instance v12, Lcom/appsflyer/AppsFlyerLibCore$b;

    new-instance v3, Ljava/lang/ref/WeakReference;

    .line 6563
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v3, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v8, 0x1

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object v1, v12

    move-object v2, p0

    move-object v9, p2

    invoke-direct/range {v1 .. v11}, Lcom/appsflyer/AppsFlyerLibCore$b;-><init>(Lcom/appsflyer/AppsFlyerLibCore;Ljava/lang/ref/WeakReference;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/content/Intent;Ljava/lang/String;B)V

    const-wide/16 p1, 0x5

    .line 6572
    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {v0, v12, p1, p2, v1}, Lcom/appsflyer/AppsFlyerLibCore;->ˏ(Ljava/util/concurrent/ScheduledExecutorService;Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)V

    :cond_4
    return-void
.end method

.method final ॱ(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1178
    instance-of v0, p1, Landroid/app/Activity;

    const-string v1, ""

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 1179
    move-object v0, p1

    check-cast v0, Landroid/app/Activity;

    .line 1181
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    .line 1183
    invoke-static {}, Lcom/appsflyer/AFDeepLinkManager;->getInstance()Lcom/appsflyer/AFDeepLinkManager;

    move-result-object v4

    invoke-static {v0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v5

    iput v5, v4, Lcom/appsflyer/AFDeepLinkManager;->currentActivityHash:I

    .line 1193
    :try_start_0
    invoke-static {v0}, Landroid/support/v4/app/ActivityCompat;->getReferrer(Landroid/app/Activity;)Landroid/net/Uri;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 1195
    invoke-virtual {v0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    if-eqz v2, :cond_0

    .line 1198
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v11, v0

    goto :goto_1

    :cond_0
    move-object v11, v1

    :goto_1
    move-object v10, v3

    goto :goto_2

    :cond_1
    move-object v11, v1

    move-object v10, v2

    .line 50140
    :goto_2
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v2, "AppsFlyerKey"

    invoke-virtual {v0, v2}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_2

    const-string p1, "[TrackEvent/Launch] AppsFlyer\'s SDK cannot send any event without providing DevKey."

    .line 1203
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->afWarnLog(Ljava/lang/String;)V

    return-void

    .line 1207
    :cond_2
    new-instance v0, Lorg/json/JSONObject;

    if-nez p3, :cond_3

    new-instance p3, Ljava/util/HashMap;

    invoke-direct {p3}, Ljava/util/HashMap;-><init>()V

    :cond_3
    invoke-direct {v0, p3}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 1208
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object p3

    invoke-virtual {p3, p1}, Lcom/appsflyer/AppsFlyerProperties;->getReferrer(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p3

    const/4 v6, 0x0

    .line 1212
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v8

    if-nez p3, :cond_4

    move-object v9, v1

    goto :goto_3

    :cond_4
    move-object v9, p3

    :goto_3
    move-object v4, p0

    move-object v5, p1

    move-object v7, p2

    .line 1209
    invoke-direct/range {v4 .. v11}, Lcom/appsflyer/AppsFlyerLibCore;->ˎ(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;Ljava/lang/String;)V

    return-void
.end method

.method final ॱ(Ljava/lang/ref/WeakReference;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;)V"
        }
    .end annotation

    .line 1049
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const-string v0, "app went to background"

    .line 1053
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 1054
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    .line 50115
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "appsflyer-data"

    const/4 v2, 0x0

    .line 50116
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 1055
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/appsflyer/AppsFlyerProperties;->saveProperties(Landroid/content/SharedPreferences;)V

    .line 1058
    iget-wide v3, p0, Lcom/appsflyer/AppsFlyerLibCore;->ᐝ:J

    iget-wide v5, p0, Lcom/appsflyer/AppsFlyerLibCore;->ʽ:J

    sub-long/2addr v3, v5

    .line 1060
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 50117
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v5

    const-string v6, "AppsFlyerKey"

    invoke-virtual {v5, v6}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_1

    const-string p1, "[callStats] AppsFlyer\'s SDK cannot send any event without providing DevKey."

    .line 1063
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->afWarnLog(Ljava/lang/String;)V

    return-void

    .line 50118
    :cond_1
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v6

    const-string v7, "KSAppsFlyerId"

    invoke-virtual {v6, v7}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1068
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v7

    const-string v8, "deviceTrackingDisabled"

    invoke-virtual {v7, v8, v2}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v7

    if-eqz v7, :cond_2

    const-string v7, "true"

    .line 1070
    invoke-interface {v1, v8, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1072
    :cond_2
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    invoke-static {v7}, Lcom/appsflyer/internal/r;->ˏ(Landroid/content/ContentResolver;)Lcom/appsflyer/internal/n;

    move-result-object v7

    if-eqz v7, :cond_3

    .line 50119
    iget-object v8, v7, Lcom/appsflyer/internal/n;->ˋ:Ljava/lang/String;

    const-string v9, "amazon_aid"

    .line 1074
    invoke-interface {v1, v9, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50120
    iget-boolean v7, v7, Lcom/appsflyer/internal/n;->ॱ:Z

    .line 1075
    invoke-static {v7}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v7

    const-string v8, "amazon_aid_limit"

    invoke-interface {v1, v8, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1077
    :cond_3
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v7

    const-string v8, "advertiserId"

    invoke-virtual {v7, v8}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_4

    .line 1079
    invoke-interface {v1, v8, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1081
    :cond_4
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "app_id"

    invoke-interface {v1, v8, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v7, "devkey"

    .line 1082
    invoke-interface {v1, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1083
    invoke-static {p1}, Lcom/appsflyer/internal/u;->ˋ(Ljava/lang/ref/WeakReference;)Ljava/lang/String;

    move-result-object v5

    const-string v7, "uid"

    invoke-interface {v1, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-wide/16 v7, 0x3e8

    .line 1084
    div-long/2addr v3, v7

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    const-string v4, "time_in_app"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "statType"

    const-string v4, "user_closed_app"

    .line 1085
    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "platform"

    const-string v4, "Android"

    .line 1086
    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "appsFlyerCount"

    .line 50121
    invoke-static {v0, v3, v2}, Lcom/appsflyer/AppsFlyerLibCore;->ˊ(Landroid/content/SharedPreferences;Ljava/lang/String;Z)I

    move-result v0

    .line 1087
    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    const-string v3, "launch_counter"

    invoke-interface {v1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1088
    invoke-static {p1}, Lcom/appsflyer/AppsFlyerLibCore;->ˋ(Ljava/lang/ref/WeakReference;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "channel"

    invoke-interface {v1, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz v6, :cond_5

    goto :goto_0

    :cond_5
    const-string v6, ""

    :goto_0
    const-string p1, "originalAppsflyerId"

    .line 1089
    invoke-interface {v1, p1, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1091
    iget-boolean p1, p0, Lcom/appsflyer/AppsFlyerLibCore;->ˎˎ:Z

    if-eqz p1, :cond_7

    .line 1093
    :try_start_0
    new-instance p1, Lcom/appsflyer/internal/q;

    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/appsflyer/AppsFlyerLib;->isTrackingStopped()Z

    move-result v3

    invoke-direct {p1, v0, v3}, Lcom/appsflyer/internal/q;-><init>(Landroid/content/Context;Z)V

    .line 1094
    iput-object v1, p1, Lcom/appsflyer/internal/q;->ॱ:Ljava/util/Map;

    .line 1095
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v3, "https://%sstats.%s/stats"

    const/4 v4, 0x1

    if-ne v0, v1, :cond_6

    :try_start_1
    const-string v0, "Main thread detected. Running callStats task in a new thread."

    .line 1096
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    new-array v0, v4, [Ljava/lang/String;

    .line 1097
    invoke-static {v3}, Lcom/appsflyer/ServerConfigHandler;->getUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v2

    invoke-virtual {p1, v0}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void

    .line 1099
    :cond_6
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Running callStats task (on current thread: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " )"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 1100
    invoke-virtual {p1}, Lcom/appsflyer/internal/q;->onPreExecute()V

    new-array v0, v4, [Ljava/lang/String;

    .line 1101
    invoke-static {v3}, Lcom/appsflyer/ServerConfigHandler;->getUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v2

    invoke-virtual {p1, v0}, Lcom/appsflyer/internal/q;->ˊ([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/appsflyer/internal/q;->ˎ(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    const-string v0, "Could not send callStats request"

    .line 1104
    invoke-static {v0, p1}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void

    :cond_7
    const-string p1, "Stats call is disabled, ignore ..."

    .line 1107
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    return-void
.end method
