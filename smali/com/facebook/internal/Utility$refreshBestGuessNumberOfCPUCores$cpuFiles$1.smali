.class final Lcom/facebook/internal/Utility$refreshBestGuessNumberOfCPUCores$cpuFiles$1;
.super Ljava/lang/Object;
.source "Utility.kt"

# interfaces
.implements Ljava/io/FilenameFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/internal/Utility;->refreshBestGuessNumberOfCPUCores()I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0016\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\u0010\u0000\u001a\u00020\u00012\u000e\u0010\u0002\u001a\n \u0004*\u0004\u0018\u00010\u00030\u00032\u000e\u0010\u0005\u001a\n \u0004*\u0004\u0018\u00010\u00060\u0006H\n\u00a2\u0006\u0002\u0008\u0007"
    }
    d2 = {
        "<anonymous>",
        "",
        "dir",
        "Ljava/io/File;",
        "kotlin.jvm.PlatformType",
        "fileName",
        "",
        "accept"
    }
    k = 0x3
    mv = {
        0x1,
        0x5,
        0x1
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/facebook/internal/Utility$refreshBestGuessNumberOfCPUCores$cpuFiles$1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/facebook/internal/Utility$refreshBestGuessNumberOfCPUCores$cpuFiles$1;

    invoke-direct {v0}, Lcom/facebook/internal/Utility$refreshBestGuessNumberOfCPUCores$cpuFiles$1;-><init>()V

    sput-object v0, Lcom/facebook/internal/Utility$refreshBestGuessNumberOfCPUCores$cpuFiles$1;->INSTANCE:Lcom/facebook/internal/Utility$refreshBestGuessNumberOfCPUCores$cpuFiles$1;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final accept(Ljava/io/File;Ljava/lang/String;)Z
    .locals 0

    .line 1152
    check-cast p2, Ljava/lang/CharSequence;

    const-string p1, "cpu[0-9]+"

    invoke-static {p1, p2}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result p1

    return p1
.end method
