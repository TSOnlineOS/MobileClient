.class public final Lcom/appsflyer/internal/e$c;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/appsflyer/internal/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "c"
.end annotation


# instance fields
.field public final ˎ:Ljava/lang/String;

.field public final ॱ:F


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1012
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(FLjava/lang/String;)V
    .locals 0

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    iput p1, p0, Lcom/appsflyer/internal/e$c;->ॱ:F

    .line 85
    iput-object p2, p0, Lcom/appsflyer/internal/e$c;->ˎ:Ljava/lang/String;

    return-void
.end method
