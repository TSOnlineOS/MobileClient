.class Landroid/support/v4/app/NotificationCompatHoneycomb;
.super Ljava/lang/Object;
.source "NotificationCompatHoneycomb.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static add(Landroid/content/Context;Landroid/app/Notification;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/widget/RemoteViews;ILandroid/app/PendingIntent;Landroid/app/PendingIntent;Landroid/graphics/Bitmap;)Landroid/app/Notification;
    .locals 2

    .line 30
    new-instance p6, Landroid/app/Notification$Builder;

    invoke-direct {p6, p0}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    iget-wide v0, p1, Landroid/app/Notification;->when:J

    invoke-virtual {p6, v0, v1}, Landroid/app/Notification$Builder;->setWhen(J)Landroid/app/Notification$Builder;

    move-result-object p0

    iget p6, p1, Landroid/app/Notification;->icon:I

    iget v0, p1, Landroid/app/Notification;->iconLevel:I

    invoke-virtual {p0, p6, v0}, Landroid/app/Notification$Builder;->setSmallIcon(II)Landroid/app/Notification$Builder;

    move-result-object p0

    iget-object p6, p1, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    invoke-virtual {p0, p6}, Landroid/app/Notification$Builder;->setContent(Landroid/widget/RemoteViews;)Landroid/app/Notification$Builder;

    move-result-object p0

    iget-object p6, p1, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    invoke-virtual {p0, p6, p5}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;Landroid/widget/RemoteViews;)Landroid/app/Notification$Builder;

    move-result-object p0

    iget-object p5, p1, Landroid/app/Notification;->sound:Landroid/net/Uri;

    iget p6, p1, Landroid/app/Notification;->audioStreamType:I

    invoke-virtual {p0, p5, p6}, Landroid/app/Notification$Builder;->setSound(Landroid/net/Uri;I)Landroid/app/Notification$Builder;

    move-result-object p0

    iget-object p5, p1, Landroid/app/Notification;->vibrate:[J

    invoke-virtual {p0, p5}, Landroid/app/Notification$Builder;->setVibrate([J)Landroid/app/Notification$Builder;

    move-result-object p0

    iget p5, p1, Landroid/app/Notification;->ledARGB:I

    iget p6, p1, Landroid/app/Notification;->ledOnMS:I

    iget v0, p1, Landroid/app/Notification;->ledOffMS:I

    invoke-virtual {p0, p5, p6, v0}, Landroid/app/Notification$Builder;->setLights(III)Landroid/app/Notification$Builder;

    move-result-object p0

    iget p5, p1, Landroid/app/Notification;->flags:I

    and-int/lit8 p5, p5, 0x2

    const/4 p6, 0x1

    const/4 v0, 0x0

    if-eqz p5, :cond_0

    const/4 p5, 0x1

    goto :goto_0

    :cond_0
    const/4 p5, 0x0

    :goto_0
    invoke-virtual {p0, p5}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    move-result-object p0

    iget p5, p1, Landroid/app/Notification;->flags:I

    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_1

    const/4 p5, 0x1

    goto :goto_1

    :cond_1
    const/4 p5, 0x0

    :goto_1
    invoke-virtual {p0, p5}, Landroid/app/Notification$Builder;->setOnlyAlertOnce(Z)Landroid/app/Notification$Builder;

    move-result-object p0

    iget p5, p1, Landroid/app/Notification;->flags:I

    and-int/lit8 p5, p5, 0x10

    if-eqz p5, :cond_2

    const/4 p5, 0x1

    goto :goto_2

    :cond_2
    const/4 p5, 0x0

    :goto_2
    invoke-virtual {p0, p5}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    move-result-object p0

    iget p5, p1, Landroid/app/Notification;->defaults:I

    invoke-virtual {p0, p5}, Landroid/app/Notification$Builder;->setDefaults(I)Landroid/app/Notification$Builder;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object p0

    invoke-virtual {p0, p3}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object p0

    invoke-virtual {p0, p4}, Landroid/app/Notification$Builder;->setContentInfo(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object p0

    invoke-virtual {p0, p7}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object p0

    iget-object p2, p1, Landroid/app/Notification;->deleteIntent:Landroid/app/PendingIntent;

    invoke-virtual {p0, p2}, Landroid/app/Notification$Builder;->setDeleteIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object p0

    iget p1, p1, Landroid/app/Notification;->flags:I

    and-int/lit16 p1, p1, 0x80

    if-eqz p1, :cond_3

    goto :goto_3

    :cond_3
    const/4 p6, 0x0

    :goto_3
    invoke-virtual {p0, p8, p6}, Landroid/app/Notification$Builder;->setFullScreenIntent(Landroid/app/PendingIntent;Z)Landroid/app/Notification$Builder;

    move-result-object p0

    invoke-virtual {p0, p9}, Landroid/app/Notification$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/app/Notification$Builder;

    move-result-object p0

    .line 51
    invoke-virtual {p0}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object p0

    return-object p0
.end method
