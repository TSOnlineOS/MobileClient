.class final Lcom/appsflyer/internal/o$1;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/appsflyer/internal/o;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private synthetic ˋ:Lcom/appsflyer/internal/o;


# direct methods
.method constructor <init>(Lcom/appsflyer/internal/o;)V
    .locals 0

    .line 53
    iput-object p1, p0, Lcom/appsflyer/internal/o$1;->ˋ:Lcom/appsflyer/internal/o;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .line 56
    iget-object v0, p0, Lcom/appsflyer/internal/o$1;->ˋ:Lcom/appsflyer/internal/o;

    iget-object v0, v0, Lcom/appsflyer/internal/o;->ॱ:Ljava/lang/Object;

    monitor-enter v0

    .line 57
    :try_start_0
    iget-object v1, p0, Lcom/appsflyer/internal/o$1;->ˋ:Lcom/appsflyer/internal/o;

    invoke-virtual {v1}, Lcom/appsflyer/internal/o;->ˋ()V

    .line 58
    iget-object v1, p0, Lcom/appsflyer/internal/o$1;->ˋ:Lcom/appsflyer/internal/o;

    iget-object v1, v1, Lcom/appsflyer/internal/o;->ˏ:Landroid/os/Handler;

    iget-object v2, p0, Lcom/appsflyer/internal/o$1;->ˋ:Lcom/appsflyer/internal/o;

    iget-object v2, v2, Lcom/appsflyer/internal/o;->ʽ:Ljava/lang/Runnable;

    const-wide/32 v3, 0x1b7740

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 59
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method
