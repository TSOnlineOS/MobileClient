.class public Lcom/dzogame/installreferrer/InstallReferrerReceiver;
.super Landroid/content/BroadcastReceiver;
.source "InstallReferrerReceiver.java"


# instance fields
.field public installRef_Str:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method public static getMessage()Ljava/lang/String;
    .locals 1

    const-string v0, "Hello World!"

    return-object v0
.end method


# virtual methods
.method public GetString()Ljava/lang/String;
    .locals 1

    .line 34
    iget-object v0, p0, Lcom/dzogame/installreferrer/InstallReferrerReceiver;->installRef_Str:Ljava/lang/String;

    return-object v0
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3

    const-string v0, "referrer"

    .line 20
    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 21
    iput-object p2, p0, Lcom/dzogame/installreferrer/InstallReferrerReceiver;->installRef_Str:Ljava/lang/String;

    const-string v1, "DzoManager"

    const-string v2, "SendReferer"

    .line 22
    invoke-static {v1, v2, p2}, Lcom/unity3d/player/UnityPlayer;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "unity"

    const-string v2, "onReceive installReferrer native android: "

    .line 23
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    .line 27
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 28
    invoke-interface {p1, v0, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 29
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method
