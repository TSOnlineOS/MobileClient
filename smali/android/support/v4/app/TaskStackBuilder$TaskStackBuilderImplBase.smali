.class Landroid/support/v4/app/TaskStackBuilder$TaskStackBuilderImplBase;
.super Ljava/lang/Object;
.source "TaskStackBuilder.java"

# interfaces
.implements Landroid/support/v4/app/TaskStackBuilder$TaskStackBuilderImpl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/app/TaskStackBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "TaskStackBuilderImplBase"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getPendingIntent(Landroid/content/Context;[Landroid/content/Intent;II)Landroid/app/PendingIntent;
    .locals 1

    .line 77
    array-length v0, p2

    add-int/lit8 v0, v0, -0x1

    aget-object p2, p2, v0

    const/high16 v0, 0x10000000

    .line 78
    invoke-virtual {p2, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 79
    invoke-static {p1, p3, p2, p4}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p1

    return-object p1
.end method
