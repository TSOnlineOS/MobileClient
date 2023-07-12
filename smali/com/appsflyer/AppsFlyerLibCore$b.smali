.class final Lcom/appsflyer/AppsFlyerLibCore$b;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/appsflyer/AppsFlyerLibCore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "b"
.end annotation


# instance fields
.field private ʻ:Z

.field private ʼ:Ljava/lang/String;

.field private synthetic ʽ:Lcom/appsflyer/AppsFlyerLibCore;

.field private ˊ:Ljava/lang/String;

.field private ˋ:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private ˎ:Ljava/lang/String;

.field private final ˏ:Ljava/lang/String;

.field private final ॱ:Landroid/content/Intent;

.field private ॱॱ:Ljava/lang/String;

.field private ᐝ:Z


# direct methods
.method private constructor <init>(Lcom/appsflyer/AppsFlyerLibCore;Ljava/lang/ref/WeakReference;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/content/Intent;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z",
            "Landroid/content/Intent;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 3304
    iput-object p1, p0, Lcom/appsflyer/AppsFlyerLibCore$b;->ʽ:Lcom/appsflyer/AppsFlyerLibCore;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3305
    iput-object p2, p0, Lcom/appsflyer/AppsFlyerLibCore$b;->ˋ:Ljava/lang/ref/WeakReference;

    .line 3306
    iput-object p3, p0, Lcom/appsflyer/AppsFlyerLibCore$b;->ˎ:Ljava/lang/String;

    .line 3307
    iput-object p4, p0, Lcom/appsflyer/AppsFlyerLibCore$b;->ˊ:Ljava/lang/String;

    .line 3308
    iput-object p5, p0, Lcom/appsflyer/AppsFlyerLibCore$b;->ॱॱ:Ljava/lang/String;

    .line 3309
    iput-object p6, p0, Lcom/appsflyer/AppsFlyerLibCore$b;->ʼ:Ljava/lang/String;

    const/4 p1, 0x1

    .line 3310
    iput-boolean p1, p0, Lcom/appsflyer/AppsFlyerLibCore$b;->ᐝ:Z

    .line 3311
    iput-boolean p7, p0, Lcom/appsflyer/AppsFlyerLibCore$b;->ʻ:Z

    .line 3312
    iput-object p8, p0, Lcom/appsflyer/AppsFlyerLibCore$b;->ॱ:Landroid/content/Intent;

    .line 3313
    iput-object p9, p0, Lcom/appsflyer/AppsFlyerLibCore$b;->ˏ:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Lcom/appsflyer/AppsFlyerLibCore;Ljava/lang/ref/WeakReference;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/content/Intent;Ljava/lang/String;B)V
    .locals 0

    .line 3284
    invoke-direct/range {p0 .. p9}, Lcom/appsflyer/AppsFlyerLibCore$b;-><init>(Lcom/appsflyer/AppsFlyerLibCore;Ljava/lang/ref/WeakReference;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/content/Intent;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 10

    .line 3317
    iget-object v0, p0, Lcom/appsflyer/AppsFlyerLibCore$b;->ʽ:Lcom/appsflyer/AppsFlyerLibCore;

    iget-object v1, p0, Lcom/appsflyer/AppsFlyerLibCore$b;->ˋ:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Context;

    iget-object v2, p0, Lcom/appsflyer/AppsFlyerLibCore$b;->ˎ:Ljava/lang/String;

    iget-object v3, p0, Lcom/appsflyer/AppsFlyerLibCore$b;->ˊ:Ljava/lang/String;

    iget-object v4, p0, Lcom/appsflyer/AppsFlyerLibCore$b;->ॱॱ:Ljava/lang/String;

    iget-object v5, p0, Lcom/appsflyer/AppsFlyerLibCore$b;->ʼ:Ljava/lang/String;

    iget-boolean v6, p0, Lcom/appsflyer/AppsFlyerLibCore$b;->ᐝ:Z

    iget-boolean v7, p0, Lcom/appsflyer/AppsFlyerLibCore$b;->ʻ:Z

    iget-object v8, p0, Lcom/appsflyer/AppsFlyerLibCore$b;->ॱ:Landroid/content/Intent;

    iget-object v9, p0, Lcom/appsflyer/AppsFlyerLibCore$b;->ˏ:Ljava/lang/String;

    invoke-static/range {v0 .. v9}, Lcom/appsflyer/AppsFlyerLibCore;->ॱ(Lcom/appsflyer/AppsFlyerLibCore;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLandroid/content/Intent;Ljava/lang/String;)V

    return-void
.end method
