.class final Lcom/appsflyer/internal/l$2;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/appsflyer/internal/l;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private synthetic ˊ:Lcom/appsflyer/internal/l;

.field private synthetic ˎ:Ljava/util/Map;


# direct methods
.method constructor <init>(Lcom/appsflyer/internal/l;Ljava/util/Map;)V
    .locals 0

    .line 79
    iput-object p1, p0, Lcom/appsflyer/internal/l$2;->ˊ:Lcom/appsflyer/internal/l;

    iput-object p2, p0, Lcom/appsflyer/internal/l$2;->ˎ:Ljava/util/Map;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 82
    iget-object v0, p0, Lcom/appsflyer/internal/l$2;->ˊ:Lcom/appsflyer/internal/l;

    iget-object v1, p0, Lcom/appsflyer/internal/l$2;->ˎ:Ljava/util/Map;

    invoke-static {v0}, Lcom/appsflyer/internal/l;->ˎ(Lcom/appsflyer/internal/l;)Ljava/util/Map;

    move-result-object v2

    iget-object v3, p0, Lcom/appsflyer/internal/l$2;->ˊ:Lcom/appsflyer/internal/l;

    invoke-static {v3}, Lcom/appsflyer/internal/l;->ˋ(Lcom/appsflyer/internal/l;)Ljava/lang/ref/WeakReference;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/appsflyer/internal/l;->ˋ(Lcom/appsflyer/internal/l;Ljava/util/Map;Ljava/util/Map;Ljava/lang/ref/WeakReference;)V

    return-void
.end method
