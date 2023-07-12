.class public final Lcom/appsflyer/internal/n;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/appsflyer/internal/n$b;
    }
.end annotation


# instance fields
.field private ˊ:Lcom/appsflyer/internal/n$b;

.field public ˋ:Ljava/lang/String;

.field public ॱ:Z


# direct methods
.method constructor <init>(Lcom/appsflyer/internal/n$b;Ljava/lang/String;Z)V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/appsflyer/internal/n;->ˊ:Lcom/appsflyer/internal/n$b;

    .line 19
    iput-object p2, p0, Lcom/appsflyer/internal/n;->ˋ:Ljava/lang/String;

    .line 20
    iput-boolean p3, p0, Lcom/appsflyer/internal/n;->ॱ:Z

    return-void
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .locals 3

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    .line 61
    iget-object v1, p0, Lcom/appsflyer/internal/n;->ˋ:Ljava/lang/String;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    iget-boolean v1, p0, Lcom/appsflyer/internal/n;->ॱ:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const-string v1, "%s,%s"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
