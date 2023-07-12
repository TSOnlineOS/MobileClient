.class final Lcom/google/android/gms/measurement/internal/zzfk;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-measurement@@21.2.2"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic zza:Lcom/google/android/gms/internal/measurement/zzbr;

.field final synthetic zzb:Landroid/content/ServiceConnection;

.field final synthetic zzc:Lcom/google/android/gms/measurement/internal/zzfl;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzfl;Lcom/google/android/gms/internal/measurement/zzbr;Landroid/content/ServiceConnection;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzfk;->zzc:Lcom/google/android/gms/measurement/internal/zzfl;

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzfk;->zza:Lcom/google/android/gms/internal/measurement/zzbr;

    iput-object p3, p0, Lcom/google/android/gms/measurement/internal/zzfk;->zzb:Landroid/content/ServiceConnection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 15

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzfk;->zzc:Lcom/google/android/gms/measurement/internal/zzfl;

    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzfl;->zza:Lcom/google/android/gms/measurement/internal/zzfm;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzfl;->zza(Lcom/google/android/gms/measurement/internal/zzfl;)Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzfk;->zza:Lcom/google/android/gms/internal/measurement/zzbr;

    iget-object v3, p0, Lcom/google/android/gms/measurement/internal/zzfk;->zzb:Landroid/content/ServiceConnection;

    iget-object v4, v1, Lcom/google/android/gms/measurement/internal/zzfm;->zza:Lcom/google/android/gms/measurement/internal/zzge;

    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzge;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v4

    .line 2
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    new-instance v4, Landroid/os/Bundle;

    .line 3
    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    const-string v5, "package_name"

    .line 4
    invoke-virtual {v4, v5, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v5, 0x0

    .line 5
    :try_start_0
    invoke-interface {v2, v4}, Lcom/google/android/gms/internal/measurement/zzbr;->zzd(Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v2

    if-nez v2, :cond_0

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzfm;->zza:Lcom/google/android/gms/measurement/internal/zzge;

    .line 6
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v2

    const-string v4, "Install Referrer Service returned a null response"

    invoke-virtual {v2, v4}, Lcom/google/android/gms/measurement/internal/zzes;->zza(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v2

    .line 45
    iget-object v4, v1, Lcom/google/android/gms/measurement/internal/zzfm;->zza:Lcom/google/android/gms/measurement/internal/zzge;

    .line 7
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v4

    .line 8
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v4

    .line 9
    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    const-string v6, "Exception occurred while retrieving the Install Referrer"

    invoke-virtual {v4, v6, v2}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    move-object v2, v5

    .line 6
    :cond_0
    iget-object v4, v1, Lcom/google/android/gms/measurement/internal/zzfm;->zza:Lcom/google/android/gms/measurement/internal/zzge;

    .line 10
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzge;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v4

    .line 11
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 12
    invoke-static {}, Lcom/google/android/gms/measurement/internal/zzge;->zzO()V

    if-nez v2, :cond_1

    goto/16 :goto_2

    :cond_1
    const-string v4, "install_begin_timestamp_seconds"

    const-wide/16 v6, 0x0

    .line 13
    invoke-virtual {v2, v4, v6, v7}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v8

    const-wide/16 v10, 0x3e8

    mul-long v8, v8, v10

    cmp-long v4, v8, v6

    if-nez v4, :cond_2

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzfm;->zza:Lcom/google/android/gms/measurement/internal/zzge;

    .line 14
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeu;->zzk()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v0

    const-string v2, "Service response is missing Install Referrer install timestamp"

    .line 16
    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzes;->zza(Ljava/lang/String;)V

    goto/16 :goto_2

    :cond_2
    const-string v4, "install_referrer"

    .line 17
    invoke-virtual {v2, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_8

    .line 18
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v12

    if-eqz v12, :cond_3

    goto/16 :goto_1

    .line 19
    :cond_3
    iget-object v12, v1, Lcom/google/android/gms/measurement/internal/zzfm;->zza:Lcom/google/android/gms/measurement/internal/zzge;

    .line 20
    invoke-virtual {v12}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v12

    invoke-virtual {v12}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v12

    const-string v13, "InstallReferrer API result"

    invoke-virtual {v12, v13, v4}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v12, v1, Lcom/google/android/gms/measurement/internal/zzfm;->zza:Lcom/google/android/gms/measurement/internal/zzge;

    .line 21
    invoke-virtual {v12}, Lcom/google/android/gms/measurement/internal/zzge;->zzv()Lcom/google/android/gms/measurement/internal/zzlo;

    move-result-object v12

    const-string v13, "?"

    invoke-virtual {v13, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 22
    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    .line 23
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzqx;->zzc()Z

    iget-object v13, v1, Lcom/google/android/gms/measurement/internal/zzfm;->zza:Lcom/google/android/gms/measurement/internal/zzge;

    invoke-virtual {v13}, Lcom/google/android/gms/measurement/internal/zzge;->zzf()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v13

    sget-object v14, Lcom/google/android/gms/measurement/internal/zzeh;->zzaw:Lcom/google/android/gms/measurement/internal/zzeg;

    invoke-virtual {v13, v5, v14}, Lcom/google/android/gms/measurement/internal/zzag;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzeg;)Z

    move-result v5

    .line 24
    invoke-virtual {v12, v4, v5}, Lcom/google/android/gms/measurement/internal/zzlo;->zzs(Landroid/net/Uri;Z)Landroid/os/Bundle;

    move-result-object v4

    if-nez v4, :cond_4

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzfm;->zza:Lcom/google/android/gms/measurement/internal/zzge;

    .line 25
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v0

    const-string v2, "No campaign params defined in Install Referrer result"

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzes;->zza(Ljava/lang/String;)V

    goto/16 :goto_2

    :cond_4
    const-string v5, "medium"

    .line 26
    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_6

    const-string v12, "(not set)"

    .line 27
    invoke-virtual {v12, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_6

    const-string v12, "organic"

    .line 28
    invoke-virtual {v12, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_6

    const-string v5, "referrer_click_timestamp_seconds"

    .line 29
    invoke-virtual {v2, v5, v6, v7}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v12

    mul-long v12, v12, v10

    cmp-long v2, v12, v6

    if-nez v2, :cond_5

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzfm;->zza:Lcom/google/android/gms/measurement/internal/zzge;

    .line 30
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v0

    const-string v2, "Install Referrer is missing click timestamp for ad campaign"

    .line 32
    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzes;->zza(Ljava/lang/String;)V

    goto :goto_2

    :cond_5
    const-string v2, "click_timestamp"

    .line 33
    invoke-virtual {v4, v2, v12, v13}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    :cond_6
    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzfm;->zza:Lcom/google/android/gms/measurement/internal/zzge;

    .line 34
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzge;->zzm()Lcom/google/android/gms/measurement/internal/zzfj;

    move-result-object v2

    iget-object v2, v2, Lcom/google/android/gms/measurement/internal/zzfj;->zzd:Lcom/google/android/gms/measurement/internal/zzff;

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzff;->zza()J

    move-result-wide v5

    cmp-long v2, v8, v5

    if-nez v2, :cond_7

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzfm;->zza:Lcom/google/android/gms/measurement/internal/zzge;

    .line 35
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v2

    .line 36
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v2

    const-string v5, "Logging Install Referrer campaign from module while it may have already been logged."

    .line 37
    invoke-virtual {v2, v5}, Lcom/google/android/gms/measurement/internal/zzes;->zza(Ljava/lang/String;)V

    :cond_7
    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzfm;->zza:Lcom/google/android/gms/measurement/internal/zzge;

    .line 38
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzge;->zzJ()Z

    move-result v2

    if-eqz v2, :cond_9

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzfm;->zza:Lcom/google/android/gms/measurement/internal/zzge;

    .line 39
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzge;->zzm()Lcom/google/android/gms/measurement/internal/zzfj;

    move-result-object v2

    iget-object v2, v2, Lcom/google/android/gms/measurement/internal/zzfj;->zzd:Lcom/google/android/gms/measurement/internal/zzff;

    invoke-virtual {v2, v8, v9}, Lcom/google/android/gms/measurement/internal/zzff;->zzb(J)V

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzfm;->zza:Lcom/google/android/gms/measurement/internal/zzge;

    .line 40
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v2

    .line 41
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v2

    const-string v5, "Logging Install Referrer campaign from gmscore with "

    const-string v6, "referrer API v2"

    .line 42
    invoke-virtual {v2, v5, v6}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v2, "_cis"

    .line 43
    invoke-virtual {v4, v2, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzfm;->zza:Lcom/google/android/gms/measurement/internal/zzge;

    .line 44
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzge;->zzq()Lcom/google/android/gms/measurement/internal/zzij;

    move-result-object v2

    const-string v5, "auto"

    const-string v6, "_cmp"

    .line 45
    invoke-virtual {v2, v5, v6, v4, v0}, Lcom/google/android/gms/measurement/internal/zzij;->zzF(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;)V

    goto :goto_2

    .line 18
    :cond_8
    :goto_1
    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzfm;->zza:Lcom/google/android/gms/measurement/internal/zzge;

    .line 19
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v0

    const-string v2, "No referrer defined in Install Referrer response"

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzes;->zza(Ljava/lang/String;)V

    .line 46
    :cond_9
    :goto_2
    invoke-static {}, Lcom/google/android/gms/common/stats/ConnectionTracker;->getInstance()Lcom/google/android/gms/common/stats/ConnectionTracker;

    move-result-object v0

    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzfm;->zza:Lcom/google/android/gms/measurement/internal/zzge;

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzge;->zzaw()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1, v3}, Lcom/google/android/gms/common/stats/ConnectionTracker;->unbindService(Landroid/content/Context;Landroid/content/ServiceConnection;)V

    return-void
.end method
