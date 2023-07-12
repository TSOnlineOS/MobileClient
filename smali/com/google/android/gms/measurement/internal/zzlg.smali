.class public final Lcom/google/android/gms/measurement/internal/zzlg;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-measurement@@21.2.2"

# interfaces
.implements Lcom/google/android/gms/measurement/internal/zzgz;


# static fields
.field private static volatile zzb:Lcom/google/android/gms/measurement/internal/zzlg;


# instance fields
.field private zzA:J

.field private final zzB:Ljava/util/Map;

.field private final zzC:Ljava/util/Map;

.field private zzD:Lcom/google/android/gms/measurement/internal/zziq;

.field private zzE:Ljava/lang/String;

.field private final zzF:Lcom/google/android/gms/measurement/internal/zzln;

.field zza:J

.field private final zzc:Lcom/google/android/gms/measurement/internal/zzfv;

.field private final zzd:Lcom/google/android/gms/measurement/internal/zzfa;

.field private zze:Lcom/google/android/gms/measurement/internal/zzam;

.field private zzf:Lcom/google/android/gms/measurement/internal/zzfc;

.field private zzg:Lcom/google/android/gms/measurement/internal/zzkr;

.field private zzh:Lcom/google/android/gms/measurement/internal/zzaa;

.field private final zzi:Lcom/google/android/gms/measurement/internal/zzli;

.field private zzj:Lcom/google/android/gms/measurement/internal/zzio;

.field private zzk:Lcom/google/android/gms/measurement/internal/zzka;

.field private final zzl:Lcom/google/android/gms/measurement/internal/zzkv;

.field private zzm:Lcom/google/android/gms/measurement/internal/zzfm;

.field private final zzn:Lcom/google/android/gms/measurement/internal/zzge;

.field private zzo:Z

.field private zzp:Z

.field private zzq:Ljava/util/List;

.field private zzr:I

.field private zzs:I

.field private zzt:Z

.field private zzu:Z

.field private zzv:Z

.field private zzw:Ljava/nio/channels/FileLock;

.field private zzx:Ljava/nio/channels/FileChannel;

.field private zzy:Ljava/util/List;

.field private zzz:Ljava/util/List;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzlh;Lcom/google/android/gms/measurement/internal/zzge;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p2, 0x0

    iput-boolean p2, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzo:Z

    new-instance p2, Lcom/google/android/gms/measurement/internal/zzlb;

    invoke-direct {p2, p0}, Lcom/google/android/gms/measurement/internal/zzlb;-><init>(Lcom/google/android/gms/measurement/internal/zzlg;)V

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzF:Lcom/google/android/gms/measurement/internal/zzln;

    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p2, p1, Lcom/google/android/gms/measurement/internal/zzlh;->zza:Landroid/content/Context;

    const/4 v0, 0x0

    .line 2
    invoke-static {p2, v0, v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzp(Landroid/content/Context;Lcom/google/android/gms/internal/measurement/zzcl;Ljava/lang/Long;)Lcom/google/android/gms/measurement/internal/zzge;

    move-result-object p2

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzA:J

    new-instance p2, Lcom/google/android/gms/measurement/internal/zzkv;

    .line 3
    invoke-direct {p2, p0}, Lcom/google/android/gms/measurement/internal/zzkv;-><init>(Lcom/google/android/gms/measurement/internal/zzlg;)V

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzl:Lcom/google/android/gms/measurement/internal/zzkv;

    new-instance p2, Lcom/google/android/gms/measurement/internal/zzli;

    .line 4
    invoke-direct {p2, p0}, Lcom/google/android/gms/measurement/internal/zzli;-><init>(Lcom/google/android/gms/measurement/internal/zzlg;)V

    .line 5
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzkt;->zzX()V

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzi:Lcom/google/android/gms/measurement/internal/zzli;

    new-instance p2, Lcom/google/android/gms/measurement/internal/zzfa;

    .line 6
    invoke-direct {p2, p0}, Lcom/google/android/gms/measurement/internal/zzfa;-><init>(Lcom/google/android/gms/measurement/internal/zzlg;)V

    .line 7
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzkt;->zzX()V

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzd:Lcom/google/android/gms/measurement/internal/zzfa;

    new-instance p2, Lcom/google/android/gms/measurement/internal/zzfv;

    .line 8
    invoke-direct {p2, p0}, Lcom/google/android/gms/measurement/internal/zzfv;-><init>(Lcom/google/android/gms/measurement/internal/zzlg;)V

    .line 9
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzkt;->zzX()V

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzc:Lcom/google/android/gms/measurement/internal/zzfv;

    new-instance p2, Ljava/util/HashMap;

    .line 10
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzB:Ljava/util/Map;

    new-instance p2, Ljava/util/HashMap;

    .line 11
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzC:Ljava/util/Map;

    .line 12
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object p2

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzkw;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/measurement/internal/zzkw;-><init>(Lcom/google/android/gms/measurement/internal/zzlg;Lcom/google/android/gms/measurement/internal/zzlh;)V

    .line 13
    invoke-virtual {p2, v0}, Lcom/google/android/gms/measurement/internal/zzgb;->zzp(Ljava/lang/Runnable;)V

    return-void
.end method

.method static final zzaa(Lcom/google/android/gms/internal/measurement/zzfs;ILjava/lang/String;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/measurement/zzfs;->zzp()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    .line 2
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    const-string v3, "_err"

    if-ge v1, v2, :cond_1

    .line 3
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/measurement/zzfx;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/measurement/zzfx;->zzg()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-void

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 4
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzfx;->zze()Lcom/google/android/gms/internal/measurement/zzfw;

    move-result-object v0

    .line 5
    invoke-virtual {v0, v3}, Lcom/google/android/gms/internal/measurement/zzfw;->zzj(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfw;

    int-to-long v1, p1

    .line 6
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/measurement/zzfw;->zzi(J)Lcom/google/android/gms/internal/measurement/zzfw;

    .line 7
    invoke-virtual {v0}, Lcom/google/android/gms/internal/measurement/zzkx;->zzaD()Lcom/google/android/gms/internal/measurement/zzlb;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/measurement/zzfx;

    .line 8
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzfx;->zze()Lcom/google/android/gms/internal/measurement/zzfw;

    move-result-object v0

    const-string v1, "_ev"

    .line 9
    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/measurement/zzfw;->zzj(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfw;

    .line 10
    invoke-virtual {v0, p2}, Lcom/google/android/gms/internal/measurement/zzfw;->zzk(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfw;

    .line 11
    invoke-virtual {v0}, Lcom/google/android/gms/internal/measurement/zzkx;->zzaD()Lcom/google/android/gms/internal/measurement/zzlb;

    move-result-object p2

    check-cast p2, Lcom/google/android/gms/internal/measurement/zzfx;

    .line 12
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/measurement/zzfs;->zzf(Lcom/google/android/gms/internal/measurement/zzfx;)Lcom/google/android/gms/internal/measurement/zzfs;

    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/measurement/zzfs;->zzf(Lcom/google/android/gms/internal/measurement/zzfx;)Lcom/google/android/gms/internal/measurement/zzfs;

    return-void
.end method

.method static final zzab(Lcom/google/android/gms/internal/measurement/zzfs;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/measurement/zzfs;->zzp()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    .line 2
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 3
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/measurement/zzfx;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/measurement/zzfx;->zzg()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 4
    invoke-virtual {p0, v1}, Lcom/google/android/gms/internal/measurement/zzfs;->zzh(I)Lcom/google/android/gms/internal/measurement/zzfs;

    return-void

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private final zzac(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzq;
    .locals 36

    move-object/from16 v0, p0

    move-object/from16 v2, p1

    .line 1
    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 2
    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzam;->zzj(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzh;

    move-result-object v15

    const/4 v1, 0x0

    if-eqz v15, :cond_2

    .line 3
    invoke-virtual {v15}, Lcom/google/android/gms/measurement/internal/zzh;->zzx()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto/16 :goto_0

    .line 5
    :cond_0
    invoke-direct {v0, v15}, Lcom/google/android/gms/measurement/internal/zzlg;->zzad(Lcom/google/android/gms/measurement/internal/zzh;)Ljava/lang/Boolean;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 6
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_1

    .line 25
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v3

    .line 26
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v3

    invoke-static/range {p1 .. p1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    const-string v4, "App version does not match; dropping. appId"

    .line 27
    invoke-virtual {v3, v4, v2}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    return-object v1

    .line 7
    :cond_1
    new-instance v35, Lcom/google/android/gms/measurement/internal/zzq;

    move-object/from16 v1, v35

    .line 8
    invoke-virtual {v15}, Lcom/google/android/gms/measurement/internal/zzh;->zzz()Ljava/lang/String;

    move-result-object v3

    .line 9
    invoke-virtual {v15}, Lcom/google/android/gms/measurement/internal/zzh;->zzx()Ljava/lang/String;

    move-result-object v4

    .line 10
    invoke-virtual {v15}, Lcom/google/android/gms/measurement/internal/zzh;->zzb()J

    move-result-wide v5

    .line 11
    invoke-virtual {v15}, Lcom/google/android/gms/measurement/internal/zzh;->zzw()Ljava/lang/String;

    move-result-object v7

    .line 12
    invoke-virtual {v15}, Lcom/google/android/gms/measurement/internal/zzh;->zzm()J

    move-result-wide v8

    .line 13
    invoke-virtual {v15}, Lcom/google/android/gms/measurement/internal/zzh;->zzj()J

    move-result-wide v10

    const/4 v12, 0x0

    .line 14
    invoke-virtual {v15}, Lcom/google/android/gms/measurement/internal/zzh;->zzal()Z

    move-result v13

    const/4 v14, 0x0

    .line 15
    invoke-virtual {v15}, Lcom/google/android/gms/measurement/internal/zzh;->zzy()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v30, v15

    move-object/from16 v15, v16

    .line 16
    invoke-virtual/range {v30 .. v30}, Lcom/google/android/gms/measurement/internal/zzh;->zza()J

    const-wide/16 v16, 0x0

    const-wide/16 v18, 0x0

    const/16 v20, 0x0

    .line 17
    invoke-virtual/range {v30 .. v30}, Lcom/google/android/gms/measurement/internal/zzh;->zzak()Z

    move-result v21

    const/16 v22, 0x0

    .line 18
    invoke-virtual/range {v30 .. v30}, Lcom/google/android/gms/measurement/internal/zzh;->zzs()Ljava/lang/String;

    move-result-object v23

    .line 19
    invoke-virtual/range {v30 .. v30}, Lcom/google/android/gms/measurement/internal/zzh;->zzr()Ljava/lang/Boolean;

    move-result-object v24

    .line 20
    invoke-virtual/range {v30 .. v30}, Lcom/google/android/gms/measurement/internal/zzh;->zzk()J

    move-result-wide v25

    .line 21
    invoke-virtual/range {v30 .. v30}, Lcom/google/android/gms/measurement/internal/zzh;->zzD()Ljava/util/List;

    move-result-object v27

    const/16 v28, 0x0

    .line 22
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzh(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzai;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Lcom/google/android/gms/measurement/internal/zzai;->zzh()Ljava/lang/String;

    move-result-object v29

    .line 23
    invoke-virtual/range {v30 .. v30}, Lcom/google/android/gms/measurement/internal/zzh;->zzan()Z

    move-result v32

    .line 24
    invoke-virtual/range {v30 .. v30}, Lcom/google/android/gms/measurement/internal/zzh;->zzq()J

    move-result-wide v33

    const/16 v31, 0x0

    const-string v30, ""

    move-object/from16 v2, p1

    invoke-direct/range {v1 .. v34}, Lcom/google/android/gms/measurement/internal/zzq;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;JJLjava/lang/String;ZZLjava/lang/String;JJIZZLjava/lang/String;Ljava/lang/Boolean;JLjava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZJ)V

    return-object v35

    .line 4
    :cond_2
    :goto_0
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzeu;->zzc()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v3

    const-string v4, "No app data available; dropping"

    invoke-virtual {v3, v4, v2}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    return-object v1
.end method

.method private final zzad(Lcom/google/android/gms/measurement/internal/zzh;)Ljava/lang/Boolean;
    .locals 8

    .line 1
    :try_start_0
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzh;->zzb()J

    move-result-wide v0

    const-wide/32 v2, -0x80000000

    const/4 v4, 0x1

    const/4 v5, 0x0

    cmp-long v6, v0, v2

    if-eqz v6, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 7
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzaw()Landroid/content/Context;

    move-result-object v0

    .line 8
    invoke-static {v0}, Lcom/google/android/gms/common/wrappers/Wrappers;->packageManager(Landroid/content/Context;)Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzh;->zzu()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v5}, Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    iget v0, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 9
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzh;->zzb()J

    move-result-wide v1

    int-to-long v6, v0

    cmp-long p1, v1, v6

    if-nez p1, :cond_1

    .line 11
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzaw()Landroid/content/Context;

    move-result-object v0

    .line 3
    invoke-static {v0}, Lcom/google/android/gms/common/wrappers/Wrappers;->packageManager(Landroid/content/Context;)Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzh;->zzu()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v5}, Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzh;->zzx()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 5
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 6
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    .line 10
    :cond_1
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    :catch_0
    const/4 p1, 0x0

    return-object p1
.end method

.method private final zzae()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    iget-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzt:Z

    if-nez v0, :cond_3

    iget-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzu:Z

    if-nez v0, :cond_3

    iget-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzv:Z

    if-eqz v0, :cond_0

    goto :goto_1

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v0

    const-string v1, "Stopping uploading service(s)"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzes;->zza(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzq:Ljava/util/List;

    if-nez v0, :cond_1

    return-void

    .line 9
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;

    .line 10
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzq:Ljava/util/List;

    .line 11
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    return-void

    .line 2
    :cond_3
    :goto_1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v0

    iget-boolean v1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzt:Z

    .line 4
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iget-boolean v2, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzu:Z

    .line 5
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iget-boolean v3, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzv:Z

    .line 6
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    const-string v4, "Not stopping services. fetch, network, upload"

    .line 7
    invoke-virtual {v0, v4, v1, v2, v3}, Lcom/google/android/gms/measurement/internal/zzes;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method private final zzaf(Lcom/google/android/gms/internal/measurement/zzgc;JZ)V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    const/4 v1, 0x1

    if-eq v1, p4, :cond_0

    const-string v2, "_lte"

    goto :goto_0

    :cond_0
    const-string v2, "_se"

    .line 2
    :goto_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/measurement/zzgc;->zzaq()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3, v2}, Lcom/google/android/gms/measurement/internal/zzam;->zzp(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzll;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v3, v0, Lcom/google/android/gms/measurement/internal/zzll;->zze:Ljava/lang/Object;

    if-nez v3, :cond_1

    goto :goto_1

    .line 15
    :cond_1
    new-instance v10, Lcom/google/android/gms/measurement/internal/zzll;

    .line 6
    invoke-virtual {p1}, Lcom/google/android/gms/internal/measurement/zzgc;->zzaq()Ljava/lang/String;

    move-result-object v4

    .line 7
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzax()Lcom/google/android/gms/common/util/Clock;

    move-result-object v3

    invoke-interface {v3}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v7

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzll;->zze:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Long;

    .line 8
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    add-long/2addr v5, p2

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    const-string v5, "auto"

    move-object v3, v10

    move-object v6, v2

    invoke-direct/range {v3 .. v9}, Lcom/google/android/gms/measurement/internal/zzll;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/Object;)V

    goto :goto_2

    .line 2
    :cond_2
    :goto_1
    new-instance v10, Lcom/google/android/gms/measurement/internal/zzll;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/measurement/zzgc;->zzaq()Ljava/lang/String;

    move-result-object v4

    .line 4
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzax()Lcom/google/android/gms/common/util/Clock;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v7

    .line 5
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    const-string v5, "auto"

    move-object v3, v10

    move-object v6, v2

    invoke-direct/range {v3 .. v9}, Lcom/google/android/gms/measurement/internal/zzll;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/Object;)V

    .line 9
    :goto_2
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzgm;->zzd()Lcom/google/android/gms/internal/measurement/zzgl;

    move-result-object v0

    .line 10
    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/measurement/zzgl;->zzf(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzgl;

    .line 11
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzax()Lcom/google/android/gms/common/util/Clock;

    move-result-object v3

    invoke-interface {v3}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Lcom/google/android/gms/internal/measurement/zzgl;->zzg(J)Lcom/google/android/gms/internal/measurement/zzgl;

    iget-object v3, v10, Lcom/google/android/gms/measurement/internal/zzll;->zze:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Long;

    .line 12
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Lcom/google/android/gms/internal/measurement/zzgl;->zze(J)Lcom/google/android/gms/internal/measurement/zzgl;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/gms/internal/measurement/zzkx;->zzaD()Lcom/google/android/gms/internal/measurement/zzlb;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/measurement/zzgm;

    .line 14
    invoke-static {p1, v2}, Lcom/google/android/gms/measurement/internal/zzli;->zza(Lcom/google/android/gms/internal/measurement/zzgc;Ljava/lang/String;)I

    move-result v2

    if-ltz v2, :cond_3

    .line 16
    invoke-virtual {p1, v2, v0}, Lcom/google/android/gms/internal/measurement/zzgc;->zzan(ILcom/google/android/gms/internal/measurement/zzgm;)Lcom/google/android/gms/internal/measurement/zzgc;

    goto :goto_3

    .line 15
    :cond_3
    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/measurement/zzgc;->zzm(Lcom/google/android/gms/internal/measurement/zzgm;)Lcom/google/android/gms/internal/measurement/zzgc;

    :goto_3
    const-wide/16 v2, 0x0

    cmp-long p1, p2, v2

    if-lez p1, :cond_5

    .line 16
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 17
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 18
    invoke-virtual {p1, v10}, Lcom/google/android/gms/measurement/internal/zzam;->zzL(Lcom/google/android/gms/measurement/internal/zzll;)Z

    if-eq v1, p4, :cond_4

    const-string p1, "lifetime"

    goto :goto_4

    :cond_4
    const-string p1, "session-scoped"

    .line 19
    :goto_4
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object p2

    .line 20
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object p2

    iget-object p3, v10, Lcom/google/android/gms/measurement/internal/zzll;->zze:Ljava/lang/Object;

    const-string p4, "Updated engagement user property. scope, value"

    .line 21
    invoke-virtual {p2, p4, p1, p3}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_5
    return-void
.end method

.method private final zzag()V
    .locals 20

    move-object/from16 v0, p0

    .line 1
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 2
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzB()V

    iget-wide v1, v0, Lcom/google/android/gms/measurement/internal/zzlg;->zza:J

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-lez v5, :cond_1

    const-wide/32 v1, 0x36ee80

    .line 3
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzax()Lcom/google/android/gms/common/util/Clock;

    move-result-object v5

    invoke-interface {v5}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    move-result-wide v5

    iget-wide v7, v0, Lcom/google/android/gms/measurement/internal/zzlg;->zza:J

    sub-long/2addr v5, v7

    .line 4
    invoke-static {v5, v6}, Ljava/lang/Math;->abs(J)J

    move-result-wide v5

    sub-long/2addr v1, v5

    cmp-long v5, v1, v3

    if-lez v5, :cond_0

    .line 5
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v3

    .line 6
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v3

    .line 7
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-string v2, "Upload has been suspended. Will update scheduling later in approximately ms"

    .line 8
    invoke-virtual {v3, v2, v1}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    .line 9
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzm()Lcom/google/android/gms/measurement/internal/zzfc;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzfc;->zzc()V

    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzlg;->zzg:Lcom/google/android/gms/measurement/internal/zzkr;

    .line 10
    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 11
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzkr;->zza()V

    return-void

    :cond_0
    iput-wide v3, v0, Lcom/google/android/gms/measurement/internal/zzlg;->zza:J

    :cond_1
    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 12
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzge;->zzM()Z

    move-result v1

    if-eqz v1, :cond_11

    invoke-direct/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzai()Z

    move-result v1

    if-nez v1, :cond_2

    goto/16 :goto_4

    .line 17
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzax()Lcom/google/android/gms/common/util/Clock;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v1

    .line 18
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    .line 19
    sget-object v5, Lcom/google/android/gms/measurement/internal/zzeh;->zzA:Lcom/google/android/gms/measurement/internal/zzeg;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    invoke-static {v3, v4, v7, v8}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v7

    iget-object v5, v0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 20
    invoke-static {v5}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 21
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzam;->zzH()Z

    move-result v5

    const/4 v10, 0x1

    if-nez v5, :cond_4

    iget-object v5, v0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 20
    invoke-static {v5}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 21
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzam;->zzG()Z

    move-result v5

    if-eqz v5, :cond_3

    goto :goto_0

    :cond_3
    const/4 v10, 0x0

    :cond_4
    :goto_0
    if-eqz v10, :cond_6

    .line 22
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzag;->zzl()Ljava/lang/String;

    move-result-object v5

    .line 23
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_5

    const-string v11, ".none."

    invoke-virtual {v11, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_5

    .line 26
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    sget-object v5, Lcom/google/android/gms/measurement/internal/zzeh;->zzv:Lcom/google/android/gms/measurement/internal/zzeg;

    .line 27
    invoke-virtual {v5, v6}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v11

    invoke-static {v3, v4, v11, v12}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v11

    goto :goto_1

    .line 24
    :cond_5
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    sget-object v5, Lcom/google/android/gms/measurement/internal/zzeh;->zzu:Lcom/google/android/gms/measurement/internal/zzeg;

    .line 25
    invoke-virtual {v5, v6}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v11

    invoke-static {v3, v4, v11, v12}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v11

    goto :goto_1

    .line 28
    :cond_6
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    sget-object v5, Lcom/google/android/gms/measurement/internal/zzeh;->zzt:Lcom/google/android/gms/measurement/internal/zzeg;

    .line 29
    invoke-virtual {v5, v6}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v11

    invoke-static {v3, v4, v11, v12}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v11

    .line 27
    :goto_1
    iget-object v5, v0, Lcom/google/android/gms/measurement/internal/zzlg;->zzk:Lcom/google/android/gms/measurement/internal/zzka;

    .line 30
    iget-object v5, v5, Lcom/google/android/gms/measurement/internal/zzka;->zzc:Lcom/google/android/gms/measurement/internal/zzff;

    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzff;->zza()J

    move-result-wide v13

    iget-object v5, v0, Lcom/google/android/gms/measurement/internal/zzlg;->zzk:Lcom/google/android/gms/measurement/internal/zzka;

    .line 31
    iget-object v5, v5, Lcom/google/android/gms/measurement/internal/zzka;->zzd:Lcom/google/android/gms/measurement/internal/zzff;

    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzff;->zza()J

    move-result-wide v15

    iget-object v5, v0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 32
    invoke-static {v5}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    move/from16 v17, v10

    .line 33
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzam;->zzd()J

    move-result-wide v9

    iget-object v5, v0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 34
    invoke-static {v5}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    move-wide/from16 v18, v7

    .line 35
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzam;->zze()J

    move-result-wide v6

    .line 36
    invoke-static {v9, v10, v6, v7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v5

    cmp-long v7, v5, v3

    if-nez v7, :cond_8

    :cond_7
    move-wide v9, v3

    goto/16 :goto_3

    :cond_8
    sub-long/2addr v5, v1

    .line 37
    invoke-static {v5, v6}, Ljava/lang/Math;->abs(J)J

    move-result-wide v5

    sub-long v5, v1, v5

    sub-long/2addr v13, v1

    .line 38
    invoke-static {v13, v14}, Ljava/lang/Math;->abs(J)J

    move-result-wide v7

    sub-long v7, v1, v7

    sub-long/2addr v15, v1

    .line 39
    invoke-static/range {v15 .. v16}, Ljava/lang/Math;->abs(J)J

    move-result-wide v9

    sub-long/2addr v1, v9

    add-long v9, v5, v18

    .line 40
    invoke-static {v7, v8, v1, v2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v7

    if-eqz v17, :cond_9

    cmp-long v13, v7, v3

    if-lez v13, :cond_9

    .line 41
    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v9

    add-long/2addr v9, v11

    :cond_9
    iget-object v13, v0, Lcom/google/android/gms/measurement/internal/zzlg;->zzi:Lcom/google/android/gms/measurement/internal/zzli;

    .line 42
    invoke-static {v13}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 43
    invoke-virtual {v13, v7, v8, v11, v12}, Lcom/google/android/gms/measurement/internal/zzli;->zzw(JJ)Z

    move-result v13

    if-nez v13, :cond_a

    add-long v9, v7, v11

    :cond_a
    cmp-long v7, v1, v3

    if-eqz v7, :cond_c

    cmp-long v7, v1, v5

    if-ltz v7, :cond_c

    const/4 v5, 0x0

    .line 44
    :goto_2
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    const/16 v6, 0x14

    sget-object v7, Lcom/google/android/gms/measurement/internal/zzeh;->zzC:Lcom/google/android/gms/measurement/internal/zzeg;

    const/4 v8, 0x0

    .line 45
    invoke-virtual {v7, v8}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    const/4 v11, 0x0

    invoke-static {v11, v7}, Ljava/lang/Math;->max(II)I

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v6

    if-ge v5, v6, :cond_7

    const-wide/16 v6, 0x1

    shl-long/2addr v6, v5

    .line 46
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    sget-object v12, Lcom/google/android/gms/measurement/internal/zzeh;->zzB:Lcom/google/android/gms/measurement/internal/zzeg;

    .line 47
    invoke-virtual {v12, v8}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Long;

    invoke-virtual {v12}, Ljava/lang/Long;->longValue()J

    move-result-wide v12

    invoke-static {v3, v4, v12, v13}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v12

    mul-long v12, v12, v6

    add-long/2addr v9, v12

    cmp-long v6, v9, v1

    if-lez v6, :cond_b

    goto :goto_3

    :cond_b
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    :cond_c
    :goto_3
    cmp-long v1, v9, v3

    if-eqz v1, :cond_10

    .line 36
    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzlg;->zzd:Lcom/google/android/gms/measurement/internal/zzfa;

    .line 48
    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 49
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzfa;->zza()Z

    move-result v1

    if-eqz v1, :cond_f

    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzlg;->zzk:Lcom/google/android/gms/measurement/internal/zzka;

    .line 50
    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzka;->zzb:Lcom/google/android/gms/measurement/internal/zzff;

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzff;->zza()J

    move-result-wide v1

    .line 51
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    sget-object v5, Lcom/google/android/gms/measurement/internal/zzeh;->zzr:Lcom/google/android/gms/measurement/internal/zzeg;

    const/4 v6, 0x0

    .line 52
    invoke-virtual {v5, v6}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v5

    iget-object v7, v0, Lcom/google/android/gms/measurement/internal/zzlg;->zzi:Lcom/google/android/gms/measurement/internal/zzli;

    .line 53
    invoke-static {v7}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 54
    invoke-virtual {v7, v1, v2, v5, v6}, Lcom/google/android/gms/measurement/internal/zzli;->zzw(JJ)Z

    move-result v7

    if-nez v7, :cond_d

    add-long/2addr v1, v5

    .line 55
    invoke-static {v9, v10, v1, v2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v9

    .line 56
    :cond_d
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzm()Lcom/google/android/gms/measurement/internal/zzfc;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzfc;->zzc()V

    .line 57
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzax()Lcom/google/android/gms/common/util/Clock;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v1

    sub-long/2addr v9, v1

    cmp-long v1, v9, v3

    if-gtz v1, :cond_e

    .line 58
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    sget-object v1, Lcom/google/android/gms/measurement/internal/zzeh;->zzw:Lcom/google/android/gms/measurement/internal/zzeg;

    const/4 v2, 0x0

    .line 59
    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-static {v3, v4, v1, v2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v9

    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzlg;->zzk:Lcom/google/android/gms/measurement/internal/zzka;

    .line 60
    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzka;->zzc:Lcom/google/android/gms/measurement/internal/zzff;

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzax()Lcom/google/android/gms/common/util/Clock;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/measurement/internal/zzff;->zzb(J)V

    .line 61
    :cond_e
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v1

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const-string v3, "Upload scheduled in approximately ms"

    invoke-virtual {v1, v3, v2}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzlg;->zzg:Lcom/google/android/gms/measurement/internal/zzkr;

    .line 62
    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 63
    invoke-virtual {v1, v9, v10}, Lcom/google/android/gms/measurement/internal/zzkr;->zzd(J)V

    return-void

    .line 64
    :cond_f
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v1

    const-string v2, "No network"

    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzes;->zza(Ljava/lang/String;)V

    .line 65
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzm()Lcom/google/android/gms/measurement/internal/zzfc;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzfc;->zzb()V

    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzlg;->zzg:Lcom/google/android/gms/measurement/internal/zzkr;

    .line 66
    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 67
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzkr;->zza()V

    return-void

    .line 68
    :cond_10
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v1

    const-string v2, "Next upload time is 0"

    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzes;->zza(Ljava/lang/String;)V

    .line 69
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzm()Lcom/google/android/gms/measurement/internal/zzfc;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzfc;->zzc()V

    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzlg;->zzg:Lcom/google/android/gms/measurement/internal/zzkr;

    .line 70
    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 71
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzkr;->zza()V

    return-void

    .line 13
    :cond_11
    :goto_4
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v1

    const-string v2, "Nothing to upload or uploading impossible"

    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzes;->zza(Ljava/lang/String;)V

    .line 14
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzm()Lcom/google/android/gms/measurement/internal/zzfc;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzfc;->zzc()V

    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzlg;->zzg:Lcom/google/android/gms/measurement/internal/zzkr;

    .line 15
    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 16
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzkr;->zza()V

    return-void
.end method

.method private final zzah(Ljava/lang/String;J)Z
    .locals 40

    move-object/from16 v1, p0

    const-string v2, "_npa"

    const-string v3, "_ai"

    .line 1
    iget-object v4, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    invoke-static {v4}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 2
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzam;->zzw()V

    :try_start_0
    new-instance v4, Lcom/google/android/gms/measurement/internal/zzld;

    const/4 v12, 0x0

    invoke-direct {v4, v1, v12}, Lcom/google/android/gms/measurement/internal/zzld;-><init>(Lcom/google/android/gms/measurement/internal/zzlg;Lcom/google/android/gms/measurement/internal/zzlc;)V

    iget-object v5, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 3
    invoke-static {v5}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    const/4 v6, 0x0

    iget-wide v9, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzA:J

    move-wide/from16 v7, p2

    move-object v11, v4

    .line 4
    invoke-virtual/range {v5 .. v11}, Lcom/google/android/gms/measurement/internal/zzam;->zzU(Ljava/lang/String;JJLcom/google/android/gms/measurement/internal/zzld;)V

    iget-object v5, v4, Lcom/google/android/gms/measurement/internal/zzld;->zzc:Ljava/util/List;

    if-eqz v5, :cond_5c

    .line 5
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_0

    goto/16 :goto_32

    .line 9
    :cond_0
    iget-object v5, v4, Lcom/google/android/gms/measurement/internal/zzld;->zza:Lcom/google/android/gms/internal/measurement/zzgd;

    .line 10
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzlb;->zzbB()Lcom/google/android/gms/internal/measurement/zzkx;

    move-result-object v5

    check-cast v5, Lcom/google/android/gms/internal/measurement/zzgc;

    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzgc;->zzr()Lcom/google/android/gms/internal/measurement/zzgc;

    move-object v11, v12

    move-object v14, v11

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v13, -0x1

    const/4 v15, -0x1

    :goto_0
    iget-object v12, v4, Lcom/google/android/gms/measurement/internal/zzld;->zzc:Ljava/util/List;

    .line 11
    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v12
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v6, "_fr"

    const-string v7, "_et"

    move/from16 v16, v10

    const-string v10, "_e"

    move/from16 v17, v13

    move-object/from16 v18, v14

    if-ge v8, v12, :cond_24

    :try_start_1
    iget-object v12, v4, Lcom/google/android/gms/measurement/internal/zzld;->zzc:Ljava/util/List;

    .line 12
    invoke-interface {v12, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/google/android/gms/internal/measurement/zzft;

    invoke-virtual {v12}, Lcom/google/android/gms/internal/measurement/zzlb;->zzbB()Lcom/google/android/gms/internal/measurement/zzkx;

    move-result-object v12

    check-cast v12, Lcom/google/android/gms/internal/measurement/zzfs;

    iget-object v14, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzc:Lcom/google/android/gms/measurement/internal/zzfv;

    .line 13
    invoke-static {v14}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    iget-object v13, v4, Lcom/google/android/gms/measurement/internal/zzld;->zza:Lcom/google/android/gms/internal/measurement/zzgd;

    .line 14
    invoke-virtual {v13}, Lcom/google/android/gms/internal/measurement/zzgd;->zzy()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v19, v2

    invoke-virtual {v12}, Lcom/google/android/gms/internal/measurement/zzfs;->zzo()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v14, v13, v2}, Lcom/google/android/gms/measurement/internal/zzfv;->zzr(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const-string v13, "_err"

    if-eqz v2, :cond_3

    .line 15
    :try_start_2
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v2

    .line 16
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzk()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v2

    const-string v6, "Dropping blocked raw event. appId"

    iget-object v7, v4, Lcom/google/android/gms/measurement/internal/zzld;->zza:Lcom/google/android/gms/internal/measurement/zzgd;

    .line 17
    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/zzgd;->zzy()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    iget-object v10, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 18
    invoke-virtual {v10}, Lcom/google/android/gms/measurement/internal/zzge;->zzj()Lcom/google/android/gms/measurement/internal/zzep;

    move-result-object v10

    .line 19
    invoke-virtual {v12}, Lcom/google/android/gms/internal/measurement/zzfs;->zzo()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v10, v14}, Lcom/google/android/gms/measurement/internal/zzep;->zzd(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 20
    invoke-virtual {v2, v6, v7, v10}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzc:Lcom/google/android/gms/measurement/internal/zzfv;

    .line 21
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    iget-object v6, v4, Lcom/google/android/gms/measurement/internal/zzld;->zza:Lcom/google/android/gms/internal/measurement/zzgd;

    .line 22
    invoke-virtual {v6}, Lcom/google/android/gms/internal/measurement/zzgd;->zzy()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Lcom/google/android/gms/measurement/internal/zzfv;->zzp(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzc:Lcom/google/android/gms/measurement/internal/zzfv;

    .line 23
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    iget-object v6, v4, Lcom/google/android/gms/measurement/internal/zzld;->zza:Lcom/google/android/gms/internal/measurement/zzgd;

    .line 24
    invoke-virtual {v6}, Lcom/google/android/gms/internal/measurement/zzgd;->zzy()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Lcom/google/android/gms/measurement/internal/zzfv;->zzs(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_1

    .line 25
    :cond_1
    invoke-virtual {v12}, Lcom/google/android/gms/internal/measurement/zzfs;->zzo()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v13, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 26
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzv()Lcom/google/android/gms/measurement/internal/zzlo;

    move-result-object v20

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzF:Lcom/google/android/gms/measurement/internal/zzln;

    iget-object v6, v4, Lcom/google/android/gms/measurement/internal/zzld;->zza:Lcom/google/android/gms/internal/measurement/zzgd;

    .line 27
    invoke-virtual {v6}, Lcom/google/android/gms/internal/measurement/zzgd;->zzy()Ljava/lang/String;

    move-result-object v22

    const/16 v23, 0xb

    const-string v24, "_ev"

    .line 28
    invoke-virtual {v12}, Lcom/google/android/gms/internal/measurement/zzfs;->zzo()Ljava/lang/String;

    move-result-object v25

    const/16 v26, 0x0

    move-object/from16 v21, v2

    .line 29
    invoke-virtual/range {v20 .. v26}, Lcom/google/android/gms/measurement/internal/zzlo;->zzO(Lcom/google/android/gms/measurement/internal/zzln;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V

    :cond_2
    :goto_1
    move-object/from16 v21, v3

    move v6, v8

    move-object/from16 v23, v11

    move/from16 v10, v16

    move/from16 v13, v17

    move-object/from16 v14, v18

    move-object v11, v5

    const/4 v5, -0x1

    goto/16 :goto_13

    .line 30
    :cond_3
    invoke-virtual {v12}, Lcom/google/android/gms/internal/measurement/zzfs;->zzo()Ljava/lang/String;

    move-result-object v2

    .line 31
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzhb;->zza(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 32
    invoke-virtual {v12, v3}, Lcom/google/android/gms/internal/measurement/zzfs;->zzi(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfs;

    .line 33
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v2

    const-string v14, "Renaming ad_impression to _ai"

    invoke-virtual {v2, v14}, Lcom/google/android/gms/measurement/internal/zzes;->zza(Ljava/lang/String;)V

    .line 34
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzr()Ljava/lang/String;

    move-result-object v2

    const/4 v14, 0x5

    .line 35
    invoke-static {v2, v14}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_5

    const/4 v2, 0x0

    .line 36
    :goto_2
    invoke-virtual {v12}, Lcom/google/android/gms/internal/measurement/zzfs;->zza()I

    move-result v14

    if-ge v2, v14, :cond_5

    const-string v14, "ad_platform"

    .line 37
    invoke-virtual {v12, v2}, Lcom/google/android/gms/internal/measurement/zzfs;->zzn(I)Lcom/google/android/gms/internal/measurement/zzfx;

    move-result-object v20

    move-object/from16 v21, v3

    invoke-virtual/range {v20 .. v20}, Lcom/google/android/gms/internal/measurement/zzfx;->zzg()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v14, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 38
    invoke-virtual {v12, v2}, Lcom/google/android/gms/internal/measurement/zzfs;->zzn(I)Lcom/google/android/gms/internal/measurement/zzfx;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzfx;->zzh()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_4

    const-string v3, "admob"

    .line 39
    invoke-virtual {v12, v2}, Lcom/google/android/gms/internal/measurement/zzfs;->zzn(I)Lcom/google/android/gms/internal/measurement/zzfx;

    move-result-object v14

    invoke-virtual {v14}, Lcom/google/android/gms/internal/measurement/zzfx;->zzh()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v3, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 40
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v3

    .line 41
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzeu;->zzl()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v3

    const-string v14, "AdMob ad impression logged from app. Potentially duplicative."

    .line 42
    invoke-virtual {v3, v14}, Lcom/google/android/gms/measurement/internal/zzes;->zza(Ljava/lang/String;)V

    :cond_4
    add-int/lit8 v2, v2, 0x1

    move-object/from16 v3, v21

    goto :goto_2

    :cond_5
    move-object/from16 v21, v3

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzc:Lcom/google/android/gms/measurement/internal/zzfv;

    .line 43
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    iget-object v3, v4, Lcom/google/android/gms/measurement/internal/zzld;->zza:Lcom/google/android/gms/internal/measurement/zzgd;

    .line 44
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzgd;->zzy()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v12}, Lcom/google/android/gms/internal/measurement/zzfs;->zzo()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v3, v14}, Lcom/google/android/gms/measurement/internal/zzfv;->zzq(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    const-string v3, "_c"

    if-nez v2, :cond_8

    :try_start_3
    iget-object v14, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzi:Lcom/google/android/gms/measurement/internal/zzli;

    .line 45
    invoke-static {v14}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 46
    invoke-virtual {v12}, Lcom/google/android/gms/internal/measurement/zzfs;->zzo()Ljava/lang/String;

    move-result-object v14

    .line 47
    invoke-static {v14}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    move/from16 v20, v9

    .line 48
    invoke-virtual {v14}, Ljava/lang/String;->hashCode()I

    move-result v9
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move/from16 v22, v8

    const v8, 0x17333

    if-eq v9, v8, :cond_6

    goto :goto_3

    :cond_6
    const-string v8, "_ui"

    invoke-virtual {v14, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_7

    const/4 v8, 0x0

    goto :goto_4

    :cond_7
    :goto_3
    const/4 v8, -0x1

    :goto_4
    if-eqz v8, :cond_9

    move-object/from16 v25, v6

    move-object/from16 v24, v7

    move-object/from16 v23, v11

    const/4 v2, 0x0

    move-object v11, v5

    goto/16 :goto_a

    :cond_8
    move/from16 v22, v8

    move/from16 v20, v9

    :cond_9
    move-object/from16 v23, v11

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v14, 0x0

    .line 49
    :goto_5
    :try_start_4
    invoke-virtual {v12}, Lcom/google/android/gms/internal/measurement/zzfs;->zza()I

    move-result v11
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-object/from16 v24, v7

    const-string v7, "_r"

    if-ge v8, v11, :cond_c

    .line 50
    :try_start_5
    invoke-virtual {v12, v8}, Lcom/google/android/gms/internal/measurement/zzfs;->zzn(I)Lcom/google/android/gms/internal/measurement/zzfx;

    move-result-object v11

    invoke-virtual {v11}, Lcom/google/android/gms/internal/measurement/zzfx;->zzg()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v3, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_a

    .line 51
    invoke-virtual {v12, v8}, Lcom/google/android/gms/internal/measurement/zzfs;->zzn(I)Lcom/google/android/gms/internal/measurement/zzfx;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/zzlb;->zzbB()Lcom/google/android/gms/internal/measurement/zzkx;

    move-result-object v7

    check-cast v7, Lcom/google/android/gms/internal/measurement/zzfw;

    move-object v11, v5

    move-object/from16 v25, v6

    const-wide/16 v5, 0x1

    .line 52
    invoke-virtual {v7, v5, v6}, Lcom/google/android/gms/internal/measurement/zzfw;->zzi(J)Lcom/google/android/gms/internal/measurement/zzfw;

    .line 53
    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/zzkx;->zzaD()Lcom/google/android/gms/internal/measurement/zzlb;

    move-result-object v5

    check-cast v5, Lcom/google/android/gms/internal/measurement/zzfx;

    .line 54
    invoke-virtual {v12, v8, v5}, Lcom/google/android/gms/internal/measurement/zzfs;->zzk(ILcom/google/android/gms/internal/measurement/zzfx;)Lcom/google/android/gms/internal/measurement/zzfs;

    const/4 v9, 0x1

    goto :goto_6

    :cond_a
    move-object v11, v5

    move-object/from16 v25, v6

    .line 55
    invoke-virtual {v12, v8}, Lcom/google/android/gms/internal/measurement/zzfs;->zzn(I)Lcom/google/android/gms/internal/measurement/zzfx;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzfx;->zzg()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_b

    .line 56
    invoke-virtual {v12, v8}, Lcom/google/android/gms/internal/measurement/zzfs;->zzn(I)Lcom/google/android/gms/internal/measurement/zzfx;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzlb;->zzbB()Lcom/google/android/gms/internal/measurement/zzkx;

    move-result-object v5

    check-cast v5, Lcom/google/android/gms/internal/measurement/zzfw;

    const-wide/16 v6, 0x1

    .line 57
    invoke-virtual {v5, v6, v7}, Lcom/google/android/gms/internal/measurement/zzfw;->zzi(J)Lcom/google/android/gms/internal/measurement/zzfw;

    .line 58
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzkx;->zzaD()Lcom/google/android/gms/internal/measurement/zzlb;

    move-result-object v5

    check-cast v5, Lcom/google/android/gms/internal/measurement/zzfx;

    .line 59
    invoke-virtual {v12, v8, v5}, Lcom/google/android/gms/internal/measurement/zzfs;->zzk(ILcom/google/android/gms/internal/measurement/zzfx;)Lcom/google/android/gms/internal/measurement/zzfs;

    const/4 v14, 0x1

    :cond_b
    :goto_6
    add-int/lit8 v8, v8, 0x1

    move-object v5, v11

    move-object/from16 v7, v24

    move-object/from16 v6, v25

    goto :goto_5

    :cond_c
    move-object v11, v5

    move-object/from16 v25, v6

    if-nez v9, :cond_d

    if-eqz v2, :cond_d

    .line 60
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v5

    .line 61
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v5

    const-string v6, "Marking event as conversion"

    iget-object v8, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 62
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzge;->zzj()Lcom/google/android/gms/measurement/internal/zzep;

    move-result-object v8

    .line 63
    invoke-virtual {v12}, Lcom/google/android/gms/internal/measurement/zzfs;->zzo()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/google/android/gms/measurement/internal/zzep;->zzd(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 64
    invoke-virtual {v5, v6, v8}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    .line 65
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzfx;->zze()Lcom/google/android/gms/internal/measurement/zzfw;

    move-result-object v5

    .line 66
    invoke-virtual {v5, v3}, Lcom/google/android/gms/internal/measurement/zzfw;->zzj(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfw;

    const-wide/16 v8, 0x1

    .line 67
    invoke-virtual {v5, v8, v9}, Lcom/google/android/gms/internal/measurement/zzfw;->zzi(J)Lcom/google/android/gms/internal/measurement/zzfw;

    .line 68
    invoke-virtual {v12, v5}, Lcom/google/android/gms/internal/measurement/zzfs;->zze(Lcom/google/android/gms/internal/measurement/zzfw;)Lcom/google/android/gms/internal/measurement/zzfs;

    :cond_d
    if-nez v14, :cond_e

    .line 69
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v5

    .line 70
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v5

    const-string v6, "Marking event as real-time"

    iget-object v8, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 71
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzge;->zzj()Lcom/google/android/gms/measurement/internal/zzep;

    move-result-object v8

    .line 72
    invoke-virtual {v12}, Lcom/google/android/gms/internal/measurement/zzfs;->zzo()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/google/android/gms/measurement/internal/zzep;->zzd(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 73
    invoke-virtual {v5, v6, v8}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    .line 74
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzfx;->zze()Lcom/google/android/gms/internal/measurement/zzfw;

    move-result-object v5

    .line 75
    invoke-virtual {v5, v7}, Lcom/google/android/gms/internal/measurement/zzfw;->zzj(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfw;

    const-wide/16 v8, 0x1

    .line 76
    invoke-virtual {v5, v8, v9}, Lcom/google/android/gms/internal/measurement/zzfw;->zzi(J)Lcom/google/android/gms/internal/measurement/zzfw;

    .line 77
    invoke-virtual {v12, v5}, Lcom/google/android/gms/internal/measurement/zzfs;->zze(Lcom/google/android/gms/internal/measurement/zzfw;)Lcom/google/android/gms/internal/measurement/zzfs;

    :cond_e
    iget-object v5, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 78
    invoke-static {v5}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 79
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zza()J

    move-result-wide v27

    iget-object v6, v4, Lcom/google/android/gms/measurement/internal/zzld;->zza:Lcom/google/android/gms/internal/measurement/zzgd;

    .line 80
    invoke-virtual {v6}, Lcom/google/android/gms/internal/measurement/zzgd;->zzy()Ljava/lang/String;

    move-result-object v29

    const/16 v30, 0x0

    const/16 v31, 0x0

    const/16 v32, 0x0

    const/16 v33, 0x0

    const/16 v34, 0x1

    move-object/from16 v26, v5

    .line 81
    invoke-virtual/range {v26 .. v34}, Lcom/google/android/gms/measurement/internal/zzam;->zzl(JLjava/lang/String;ZZZZZ)Lcom/google/android/gms/measurement/internal/zzak;

    move-result-object v5

    iget-wide v5, v5, Lcom/google/android/gms/measurement/internal/zzak;->zze:J

    .line 82
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v8

    iget-object v9, v4, Lcom/google/android/gms/measurement/internal/zzld;->zza:Lcom/google/android/gms/internal/measurement/zzgd;

    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/zzgd;->zzy()Ljava/lang/String;

    move-result-object v9

    .line 83
    sget-object v14, Lcom/google/android/gms/measurement/internal/zzeh;->zzo:Lcom/google/android/gms/measurement/internal/zzeg;

    .line 82
    invoke-virtual {v8, v9, v14}, Lcom/google/android/gms/measurement/internal/zzag;->zze(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzeg;)I

    move-result v8

    int-to-long v8, v8

    cmp-long v14, v5, v8

    if-lez v14, :cond_f

    .line 84
    invoke-static {v12, v7}, Lcom/google/android/gms/measurement/internal/zzlg;->zzab(Lcom/google/android/gms/internal/measurement/zzfs;Ljava/lang/String;)V

    goto :goto_7

    :cond_f
    const/16 v16, 0x1

    .line 85
    :goto_7
    invoke-virtual {v12}, Lcom/google/android/gms/internal/measurement/zzfs;->zzo()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/google/android/gms/measurement/internal/zzlo;->zzak(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_16

    if-eqz v2, :cond_16

    iget-object v5, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 86
    invoke-static {v5}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 87
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zza()J

    move-result-wide v27

    iget-object v6, v4, Lcom/google/android/gms/measurement/internal/zzld;->zza:Lcom/google/android/gms/internal/measurement/zzgd;

    .line 88
    invoke-virtual {v6}, Lcom/google/android/gms/internal/measurement/zzgd;->zzy()Ljava/lang/String;

    move-result-object v29

    const/16 v30, 0x0

    const/16 v31, 0x0

    const/16 v32, 0x1

    const/16 v33, 0x0

    const/16 v34, 0x0

    move-object/from16 v26, v5

    .line 89
    invoke-virtual/range {v26 .. v34}, Lcom/google/android/gms/measurement/internal/zzam;->zzl(JLjava/lang/String;ZZZZZ)Lcom/google/android/gms/measurement/internal/zzak;

    move-result-object v5

    iget-wide v5, v5, Lcom/google/android/gms/measurement/internal/zzak;->zzc:J

    .line 90
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v7

    iget-object v8, v4, Lcom/google/android/gms/measurement/internal/zzld;->zza:Lcom/google/android/gms/internal/measurement/zzgd;

    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/zzgd;->zzy()Ljava/lang/String;

    move-result-object v8

    sget-object v9, Lcom/google/android/gms/measurement/internal/zzeh;->zzn:Lcom/google/android/gms/measurement/internal/zzeg;

    invoke-virtual {v7, v8, v9}, Lcom/google/android/gms/measurement/internal/zzag;->zze(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzeg;)I

    move-result v7

    int-to-long v7, v7

    cmp-long v9, v5, v7

    if-lez v9, :cond_16

    .line 91
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v5

    .line 92
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzeu;->zzk()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v5

    const-string v6, "Too many conversions. Not logging as conversion. appId"

    iget-object v7, v4, Lcom/google/android/gms/measurement/internal/zzld;->zza:Lcom/google/android/gms/internal/measurement/zzgd;

    .line 93
    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/zzgd;->zzy()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    .line 94
    invoke-virtual {v5, v6, v7}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, -0x1

    .line 95
    :goto_8
    invoke-virtual {v12}, Lcom/google/android/gms/internal/measurement/zzfs;->zza()I

    move-result v9

    if-ge v6, v9, :cond_12

    .line 96
    invoke-virtual {v12, v6}, Lcom/google/android/gms/internal/measurement/zzfs;->zzn(I)Lcom/google/android/gms/internal/measurement/zzfx;

    move-result-object v9

    .line 97
    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/zzfx;->zzg()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v3, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_10

    .line 98
    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/zzlb;->zzbB()Lcom/google/android/gms/internal/measurement/zzkx;

    move-result-object v5

    check-cast v5, Lcom/google/android/gms/internal/measurement/zzfw;

    move v8, v6

    goto :goto_9

    .line 99
    :cond_10
    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/zzfx;->zzg()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v13, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_11

    const/4 v7, 0x1

    :cond_11
    :goto_9
    add-int/lit8 v6, v6, 0x1

    goto :goto_8

    :cond_12
    if-eqz v7, :cond_14

    if-eqz v5, :cond_13

    .line 109
    invoke-virtual {v12, v8}, Lcom/google/android/gms/internal/measurement/zzfs;->zzh(I)Lcom/google/android/gms/internal/measurement/zzfs;

    goto :goto_a

    :cond_13
    const/4 v5, 0x0

    :cond_14
    if-eqz v5, :cond_15

    .line 100
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzkx;->zzaA()Lcom/google/android/gms/internal/measurement/zzkx;

    move-result-object v5

    check-cast v5, Lcom/google/android/gms/internal/measurement/zzfw;

    .line 101
    invoke-virtual {v5, v13}, Lcom/google/android/gms/internal/measurement/zzfw;->zzj(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfw;

    const-wide/16 v6, 0xa

    .line 102
    invoke-virtual {v5, v6, v7}, Lcom/google/android/gms/internal/measurement/zzfw;->zzi(J)Lcom/google/android/gms/internal/measurement/zzfw;

    .line 103
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzkx;->zzaD()Lcom/google/android/gms/internal/measurement/zzlb;

    move-result-object v5

    check-cast v5, Lcom/google/android/gms/internal/measurement/zzfx;

    .line 104
    invoke-virtual {v12, v8, v5}, Lcom/google/android/gms/internal/measurement/zzfs;->zzk(ILcom/google/android/gms/internal/measurement/zzfx;)Lcom/google/android/gms/internal/measurement/zzfs;

    goto :goto_a

    .line 105
    :cond_15
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v5

    .line 106
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v5

    const-string v6, "Did not find conversion parameter. appId"

    iget-object v7, v4, Lcom/google/android/gms/measurement/internal/zzld;->zza:Lcom/google/android/gms/internal/measurement/zzgd;

    .line 107
    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/zzgd;->zzy()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    .line 108
    invoke-virtual {v5, v6, v7}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_16
    :goto_a
    if-eqz v2, :cond_1e

    .line 48
    new-instance v2, Ljava/util/ArrayList;

    .line 110
    invoke-virtual {v12}, Lcom/google/android/gms/internal/measurement/zzfs;->zzp()Ljava/util/List;

    move-result-object v5

    invoke-direct {v2, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    const/4 v5, 0x0

    const/4 v6, -0x1

    const/4 v7, -0x1

    .line 111
    :goto_b
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v8
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    const-string v9, "currency"

    const-string v13, "value"

    if-ge v5, v8, :cond_19

    .line 112
    :try_start_6
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/google/android/gms/internal/measurement/zzfx;

    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/zzfx;->zzg()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v13, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_17

    move v6, v5

    goto :goto_c

    .line 113
    :cond_17
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/google/android/gms/internal/measurement/zzfx;

    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/zzfx;->zzg()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_18

    move v7, v5

    :cond_18
    :goto_c
    add-int/lit8 v5, v5, 0x1

    goto :goto_b

    :cond_19
    const/4 v5, -0x1

    if-ne v6, v5, :cond_1a

    goto/16 :goto_10

    .line 114
    :cond_1a
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/gms/internal/measurement/zzfx;

    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzfx;->zzw()Z

    move-result v5

    if-nez v5, :cond_1b

    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/gms/internal/measurement/zzfx;

    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzfx;->zzu()Z

    move-result v5

    if-nez v5, :cond_1b

    .line 127
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzl()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v2

    const-string v5, "Value must be specified with a numeric type."

    invoke-virtual {v2, v5}, Lcom/google/android/gms/measurement/internal/zzes;->zza(Ljava/lang/String;)V

    .line 128
    invoke-virtual {v12, v6}, Lcom/google/android/gms/internal/measurement/zzfs;->zzh(I)Lcom/google/android/gms/internal/measurement/zzfs;

    .line 129
    invoke-static {v12, v3}, Lcom/google/android/gms/measurement/internal/zzlg;->zzab(Lcom/google/android/gms/internal/measurement/zzfs;Ljava/lang/String;)V

    const/16 v2, 0x12

    .line 130
    invoke-static {v12, v2, v13}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaa(Lcom/google/android/gms/internal/measurement/zzfs;ILjava/lang/String;)V

    goto :goto_f

    :cond_1b
    const/4 v5, -0x1

    if-ne v7, v5, :cond_1c

    goto :goto_e

    .line 115
    :cond_1c
    invoke-interface {v2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/measurement/zzfx;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/measurement/zzfx;->zzh()Ljava/lang/String;

    move-result-object v2

    .line 116
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v7

    const/4 v8, 0x3

    if-ne v7, v8, :cond_1d

    const/4 v7, 0x0

    .line 117
    :goto_d
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v8

    if-ge v7, v8, :cond_1f

    .line 118
    invoke-virtual {v2, v7}, Ljava/lang/String;->codePointAt(I)I

    move-result v8

    .line 119
    invoke-static {v8}, Ljava/lang/Character;->isLetter(I)Z

    move-result v13

    if-eqz v13, :cond_1d

    .line 120
    invoke-static {v8}, Ljava/lang/Character;->charCount(I)I

    move-result v8

    add-int/2addr v7, v8

    goto :goto_d

    .line 121
    :cond_1d
    :goto_e
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v2

    .line 122
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzl()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v2

    const-string v7, "Value parameter discarded. You must also supply a 3-letter ISO_4217 currency code in the currency parameter."

    .line 123
    invoke-virtual {v2, v7}, Lcom/google/android/gms/measurement/internal/zzes;->zza(Ljava/lang/String;)V

    .line 124
    invoke-virtual {v12, v6}, Lcom/google/android/gms/internal/measurement/zzfs;->zzh(I)Lcom/google/android/gms/internal/measurement/zzfs;

    .line 125
    invoke-static {v12, v3}, Lcom/google/android/gms/measurement/internal/zzlg;->zzab(Lcom/google/android/gms/internal/measurement/zzfs;Ljava/lang/String;)V

    const/16 v2, 0x13

    .line 126
    invoke-static {v12, v2, v9}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaa(Lcom/google/android/gms/internal/measurement/zzfs;ILjava/lang/String;)V

    goto :goto_10

    :cond_1e
    :goto_f
    const/4 v5, -0x1

    .line 131
    :cond_1f
    :goto_10
    invoke-virtual {v12}, Lcom/google/android/gms/internal/measurement/zzfs;->zzo()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v10, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const-wide/16 v6, 0x3e8

    if-eqz v2, :cond_21

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzi:Lcom/google/android/gms/measurement/internal/zzli;

    .line 132
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 133
    invoke-virtual {v12}, Lcom/google/android/gms/internal/measurement/zzkx;->zzaD()Lcom/google/android/gms/internal/measurement/zzlb;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/measurement/zzft;

    move-object/from16 v3, v25

    invoke-static {v2, v3}, Lcom/google/android/gms/measurement/internal/zzli;->zzB(Lcom/google/android/gms/internal/measurement/zzft;Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    move-result-object v2

    if-nez v2, :cond_23

    if-eqz v18, :cond_20

    .line 134
    invoke-virtual/range {v18 .. v18}, Lcom/google/android/gms/internal/measurement/zzfs;->zzc()J

    move-result-wide v2

    invoke-virtual {v12}, Lcom/google/android/gms/internal/measurement/zzfs;->zzc()J

    move-result-wide v8

    sub-long/2addr v2, v8

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    move-result-wide v2

    cmp-long v8, v2, v6

    if-gtz v8, :cond_20

    .line 135
    invoke-virtual/range {v18 .. v18}, Lcom/google/android/gms/internal/measurement/zzkx;->zzaA()Lcom/google/android/gms/internal/measurement/zzkx;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/measurement/zzfs;

    .line 136
    invoke-direct {v1, v12, v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaj(Lcom/google/android/gms/internal/measurement/zzfs;Lcom/google/android/gms/internal/measurement/zzfs;)Z

    move-result v3

    if-eqz v3, :cond_20

    .line 137
    invoke-virtual {v11, v15, v2}, Lcom/google/android/gms/internal/measurement/zzgc;->zzS(ILcom/google/android/gms/internal/measurement/zzfs;)Lcom/google/android/gms/internal/measurement/zzgc;

    move/from16 v13, v17

    :goto_11
    const/4 v14, 0x0

    const/16 v23, 0x0

    goto :goto_12

    :cond_20
    move-object/from16 v23, v12

    move-object/from16 v14, v18

    move/from16 v13, v20

    goto :goto_12

    :cond_21
    const-string v2, "_vs"

    .line 138
    invoke-virtual {v12}, Lcom/google/android/gms/internal/measurement/zzfs;->zzo()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_23

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzi:Lcom/google/android/gms/measurement/internal/zzli;

    .line 139
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 140
    invoke-virtual {v12}, Lcom/google/android/gms/internal/measurement/zzkx;->zzaD()Lcom/google/android/gms/internal/measurement/zzlb;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/measurement/zzft;

    move-object/from16 v8, v24

    invoke-static {v2, v8}, Lcom/google/android/gms/measurement/internal/zzli;->zzB(Lcom/google/android/gms/internal/measurement/zzft;Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    move-result-object v2

    if-nez v2, :cond_23

    if-eqz v23, :cond_22

    .line 141
    invoke-virtual/range {v23 .. v23}, Lcom/google/android/gms/internal/measurement/zzfs;->zzc()J

    move-result-wide v2

    invoke-virtual {v12}, Lcom/google/android/gms/internal/measurement/zzfs;->zzc()J

    move-result-wide v8

    sub-long/2addr v2, v8

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    move-result-wide v2

    cmp-long v8, v2, v6

    if-gtz v8, :cond_22

    .line 142
    invoke-virtual/range {v23 .. v23}, Lcom/google/android/gms/internal/measurement/zzkx;->zzaA()Lcom/google/android/gms/internal/measurement/zzkx;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/measurement/zzfs;

    .line 143
    invoke-direct {v1, v2, v12}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaj(Lcom/google/android/gms/internal/measurement/zzfs;Lcom/google/android/gms/internal/measurement/zzfs;)Z

    move-result v3

    if-eqz v3, :cond_22

    move/from16 v7, v17

    .line 144
    invoke-virtual {v11, v7, v2}, Lcom/google/android/gms/internal/measurement/zzgc;->zzS(ILcom/google/android/gms/internal/measurement/zzfs;)Lcom/google/android/gms/internal/measurement/zzgc;

    move v13, v7

    goto :goto_11

    :cond_22
    move/from16 v7, v17

    move v13, v7

    move-object v14, v12

    move/from16 v15, v20

    goto :goto_12

    :cond_23
    move/from16 v7, v17

    move v13, v7

    move-object/from16 v14, v18

    .line 137
    :goto_12
    iget-object v2, v4, Lcom/google/android/gms/measurement/internal/zzld;->zzc:Ljava/util/List;

    .line 145
    invoke-virtual {v12}, Lcom/google/android/gms/internal/measurement/zzkx;->zzaD()Lcom/google/android/gms/internal/measurement/zzlb;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/internal/measurement/zzft;

    move/from16 v6, v22

    invoke-interface {v2, v6, v3}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v9, v20, 0x1

    .line 146
    invoke-virtual {v11, v12}, Lcom/google/android/gms/internal/measurement/zzgc;->zzk(Lcom/google/android/gms/internal/measurement/zzfs;)Lcom/google/android/gms/internal/measurement/zzgc;

    move/from16 v10, v16

    :goto_13
    add-int/lit8 v8, v6, 0x1

    move-object v5, v11

    move-object/from16 v2, v19

    move-object/from16 v3, v21

    move-object/from16 v11, v23

    goto/16 :goto_0

    :cond_24
    move-object/from16 v19, v2

    move-object v11, v5

    move-object v3, v6

    move-object v8, v7

    move/from16 v20, v9

    const-wide/16 v5, 0x0

    move-wide v12, v5

    const/4 v2, 0x0

    :goto_14
    if-ge v2, v9, :cond_28

    .line 147
    invoke-virtual {v11, v2}, Lcom/google/android/gms/internal/measurement/zzgc;->zze(I)Lcom/google/android/gms/internal/measurement/zzft;

    move-result-object v7

    .line 148
    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/zzft;->zzh()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v10, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_25

    iget-object v14, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzi:Lcom/google/android/gms/measurement/internal/zzli;

    .line 149
    invoke-static {v14}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 150
    invoke-static {v7, v3}, Lcom/google/android/gms/measurement/internal/zzli;->zzB(Lcom/google/android/gms/internal/measurement/zzft;Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    move-result-object v14

    if-eqz v14, :cond_25

    .line 156
    invoke-virtual {v11, v2}, Lcom/google/android/gms/internal/measurement/zzgc;->zzA(I)Lcom/google/android/gms/internal/measurement/zzgc;

    add-int/lit8 v9, v9, -0x1

    add-int/lit8 v2, v2, -0x1

    goto :goto_16

    :cond_25
    iget-object v14, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzi:Lcom/google/android/gms/measurement/internal/zzli;

    .line 151
    invoke-static {v14}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 152
    invoke-static {v7, v8}, Lcom/google/android/gms/measurement/internal/zzli;->zzB(Lcom/google/android/gms/internal/measurement/zzft;Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    move-result-object v7

    if-eqz v7, :cond_27

    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/zzfx;->zzw()Z

    move-result v14

    if-eqz v14, :cond_26

    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/zzfx;->zzd()J

    move-result-wide v14

    .line 153
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    goto :goto_15

    :cond_26
    const/4 v7, 0x0

    :goto_15
    if-eqz v7, :cond_27

    .line 154
    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v14

    cmp-long v17, v14, v5

    if-lez v17, :cond_27

    .line 155
    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v14

    add-long/2addr v12, v14

    :cond_27
    :goto_16
    const/4 v7, 0x1

    add-int/2addr v2, v7

    goto :goto_14

    :cond_28
    const/4 v2, 0x0

    .line 157
    invoke-direct {v1, v11, v12, v13, v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaf(Lcom/google/android/gms/internal/measurement/zzgc;JZ)V

    .line 158
    invoke-virtual {v11}, Lcom/google/android/gms/internal/measurement/zzgc;->zzat()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_29
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    const-string v7, "_se"

    if-eqz v3, :cond_2a

    :try_start_7
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/internal/measurement/zzft;

    const-string v8, "_s"

    .line 159
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzft;->zzh()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_29

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 160
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 161
    invoke-virtual {v11}, Lcom/google/android/gms/internal/measurement/zzgc;->zzaq()Ljava/lang/String;

    move-result-object v3

    .line 162
    invoke-virtual {v2, v3, v7}, Lcom/google/android/gms/measurement/internal/zzam;->zzA(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2a
    const-string v2, "_sid"

    .line 163
    invoke-static {v11, v2}, Lcom/google/android/gms/measurement/internal/zzli;->zza(Lcom/google/android/gms/internal/measurement/zzgc;Ljava/lang/String;)I

    move-result v2

    if-ltz v2, :cond_2b

    const/4 v2, 0x1

    .line 164
    invoke-direct {v1, v11, v12, v13, v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaf(Lcom/google/android/gms/internal/measurement/zzgc;JZ)V

    goto :goto_17

    .line 165
    :cond_2b
    invoke-static {v11, v7}, Lcom/google/android/gms/measurement/internal/zzli;->zza(Lcom/google/android/gms/internal/measurement/zzgc;Ljava/lang/String;)I

    move-result v2

    if-ltz v2, :cond_2c

    .line 166
    invoke-virtual {v11, v2}, Lcom/google/android/gms/internal/measurement/zzgc;->zzB(I)Lcom/google/android/gms/internal/measurement/zzgc;

    .line 167
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v2

    .line 168
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v2

    const-string v3, "Session engagement user property is in the bundle without session ID. appId"

    iget-object v7, v4, Lcom/google/android/gms/measurement/internal/zzld;->zza:Lcom/google/android/gms/internal/measurement/zzgd;

    .line 169
    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/zzgd;->zzy()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    .line 170
    invoke-virtual {v2, v3, v7}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    .line 164
    :cond_2c
    :goto_17
    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzi:Lcom/google/android/gms/measurement/internal/zzli;

    .line 171
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 172
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v3

    .line 173
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v3

    const-string v7, "Checking account type status for ad personalization signals"

    invoke-virtual {v3, v7}, Lcom/google/android/gms/measurement/internal/zzes;->zza(Ljava/lang/String;)V

    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzks;->zzf:Lcom/google/android/gms/measurement/internal/zzlg;

    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzlg;->zzc:Lcom/google/android/gms/measurement/internal/zzfv;

    .line 174
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 175
    invoke-virtual {v11}, Lcom/google/android/gms/internal/measurement/zzgc;->zzaq()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Lcom/google/android/gms/measurement/internal/zzfv;->zzn(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2f

    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzks;->zzf:Lcom/google/android/gms/measurement/internal/zzlg;

    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 176
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 177
    invoke-virtual {v11}, Lcom/google/android/gms/internal/measurement/zzgc;->zzaq()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Lcom/google/android/gms/measurement/internal/zzam;->zzj(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzh;

    move-result-object v3

    if-eqz v3, :cond_2f

    .line 178
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzh;->zzak()Z

    move-result v3

    if-eqz v3, :cond_2f

    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 179
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzge;->zzg()Lcom/google/android/gms/measurement/internal/zzaq;

    move-result-object v3

    .line 180
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzaq;->zze()Z

    move-result v3

    if-eqz v3, :cond_2f

    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 181
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v3

    .line 182
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzeu;->zzc()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v3

    const-string v7, "Turning off ad personalization due to account type"

    invoke-virtual {v3, v7}, Lcom/google/android/gms/measurement/internal/zzes;->zza(Ljava/lang/String;)V

    .line 183
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzgm;->zzd()Lcom/google/android/gms/internal/measurement/zzgl;

    move-result-object v3

    move-object/from16 v7, v19

    .line 184
    invoke-virtual {v3, v7}, Lcom/google/android/gms/internal/measurement/zzgl;->zzf(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzgl;

    iget-object v2, v2, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 185
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzge;->zzg()Lcom/google/android/gms/measurement/internal/zzaq;

    move-result-object v2

    .line 186
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzaq;->zza()J

    move-result-wide v8

    invoke-virtual {v3, v8, v9}, Lcom/google/android/gms/internal/measurement/zzgl;->zzg(J)Lcom/google/android/gms/internal/measurement/zzgl;

    const-wide/16 v8, 0x1

    .line 187
    invoke-virtual {v3, v8, v9}, Lcom/google/android/gms/internal/measurement/zzgl;->zze(J)Lcom/google/android/gms/internal/measurement/zzgl;

    .line 188
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzkx;->zzaD()Lcom/google/android/gms/internal/measurement/zzlb;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/measurement/zzgm;

    const/4 v3, 0x0

    .line 189
    :goto_18
    invoke-virtual {v11}, Lcom/google/android/gms/internal/measurement/zzgc;->zzb()I

    move-result v8

    if-ge v3, v8, :cond_2e

    .line 190
    invoke-virtual {v11, v3}, Lcom/google/android/gms/internal/measurement/zzgc;->zzap(I)Lcom/google/android/gms/internal/measurement/zzgm;

    move-result-object v8

    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/zzgm;->zzf()Ljava/lang/String;

    move-result-object v8

    .line 191
    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2d

    .line 193
    invoke-virtual {v11, v3, v2}, Lcom/google/android/gms/internal/measurement/zzgc;->zzan(ILcom/google/android/gms/internal/measurement/zzgm;)Lcom/google/android/gms/internal/measurement/zzgc;

    goto :goto_19

    :cond_2d
    add-int/lit8 v3, v3, 0x1

    goto :goto_18

    .line 192
    :cond_2e
    invoke-virtual {v11, v2}, Lcom/google/android/gms/internal/measurement/zzgc;->zzm(Lcom/google/android/gms/internal/measurement/zzgm;)Lcom/google/android/gms/internal/measurement/zzgc;

    :cond_2f
    :goto_19
    const-wide v2, 0x7fffffffffffffffL

    .line 194
    invoke-virtual {v11, v2, v3}, Lcom/google/android/gms/internal/measurement/zzgc;->zzai(J)Lcom/google/android/gms/internal/measurement/zzgc;

    const-wide/high16 v2, -0x8000000000000000L

    invoke-virtual {v11, v2, v3}, Lcom/google/android/gms/internal/measurement/zzgc;->zzQ(J)Lcom/google/android/gms/internal/measurement/zzgc;

    const/4 v2, 0x0

    .line 195
    :goto_1a
    invoke-virtual {v11}, Lcom/google/android/gms/internal/measurement/zzgc;->zza()I

    move-result v3

    if-ge v2, v3, :cond_32

    .line 196
    invoke-virtual {v11, v2}, Lcom/google/android/gms/internal/measurement/zzgc;->zze(I)Lcom/google/android/gms/internal/measurement/zzft;

    move-result-object v3

    .line 197
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzft;->zzd()J

    move-result-wide v7

    invoke-virtual {v11}, Lcom/google/android/gms/internal/measurement/zzgc;->zzd()J

    move-result-wide v9

    cmp-long v12, v7, v9

    if-gez v12, :cond_30

    .line 198
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzft;->zzd()J

    move-result-wide v7

    invoke-virtual {v11, v7, v8}, Lcom/google/android/gms/internal/measurement/zzgc;->zzai(J)Lcom/google/android/gms/internal/measurement/zzgc;

    .line 199
    :cond_30
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzft;->zzd()J

    move-result-wide v7

    invoke-virtual {v11}, Lcom/google/android/gms/internal/measurement/zzgc;->zzc()J

    move-result-wide v9

    cmp-long v12, v7, v9

    if-lez v12, :cond_31

    .line 200
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzft;->zzd()J

    move-result-wide v7

    invoke-virtual {v11, v7, v8}, Lcom/google/android/gms/internal/measurement/zzgc;->zzQ(J)Lcom/google/android/gms/internal/measurement/zzgc;

    :cond_31
    add-int/lit8 v2, v2, 0x1

    goto :goto_1a

    .line 201
    :cond_32
    invoke-virtual {v11}, Lcom/google/android/gms/internal/measurement/zzgc;->zzz()Lcom/google/android/gms/internal/measurement/zzgc;

    .line 202
    invoke-virtual {v11}, Lcom/google/android/gms/internal/measurement/zzgc;->zzo()Lcom/google/android/gms/internal/measurement/zzgc;

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzh:Lcom/google/android/gms/measurement/internal/zzaa;

    .line 203
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 204
    invoke-virtual {v11}, Lcom/google/android/gms/internal/measurement/zzgc;->zzaq()Ljava/lang/String;

    move-result-object v20

    .line 205
    invoke-virtual {v11}, Lcom/google/android/gms/internal/measurement/zzgc;->zzat()Ljava/util/List;

    move-result-object v21

    .line 206
    invoke-virtual {v11}, Lcom/google/android/gms/internal/measurement/zzgc;->zzau()Ljava/util/List;

    move-result-object v22

    .line 207
    invoke-virtual {v11}, Lcom/google/android/gms/internal/measurement/zzgc;->zzd()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v23

    .line 208
    invoke-virtual {v11}, Lcom/google/android/gms/internal/measurement/zzgc;->zzc()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v24

    move-object/from16 v19, v2

    .line 209
    invoke-virtual/range {v19 .. v24}, Lcom/google/android/gms/measurement/internal/zzaa;->zza(Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/lang/Long;Ljava/lang/Long;)Ljava/util/List;

    move-result-object v2

    .line 210
    invoke-virtual {v11, v2}, Lcom/google/android/gms/internal/measurement/zzgc;->zzf(Ljava/lang/Iterable;)Lcom/google/android/gms/internal/measurement/zzgc;

    .line 211
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v2

    iget-object v3, v4, Lcom/google/android/gms/measurement/internal/zzld;->zza:Lcom/google/android/gms/internal/measurement/zzgd;

    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzgd;->zzy()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zzag;->zzw(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4a

    new-instance v2, Ljava/util/HashMap;

    .line 212
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    new-instance v3, Ljava/util/ArrayList;

    .line 213
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 214
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzv()Lcom/google/android/gms/measurement/internal/zzlo;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/android/gms/measurement/internal/zzlo;->zzG()Ljava/security/SecureRandom;

    move-result-object v7

    const/4 v8, 0x0

    .line 215
    :goto_1b
    invoke-virtual {v11}, Lcom/google/android/gms/internal/measurement/zzgc;->zza()I

    move-result v9

    if-ge v8, v9, :cond_48

    .line 216
    invoke-virtual {v11, v8}, Lcom/google/android/gms/internal/measurement/zzgc;->zze(I)Lcom/google/android/gms/internal/measurement/zzft;

    move-result-object v9

    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/zzlb;->zzbB()Lcom/google/android/gms/internal/measurement/zzkx;

    move-result-object v9

    check-cast v9, Lcom/google/android/gms/internal/measurement/zzfs;

    .line 217
    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/zzfs;->zzo()Ljava/lang/String;

    move-result-object v10

    const-string v12, "_ep"

    invoke-virtual {v10, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    const-string v12, "_efs"

    const-string v13, "_sr"

    if-eqz v10, :cond_37

    :try_start_8
    iget-object v10, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzi:Lcom/google/android/gms/measurement/internal/zzli;

    .line 284
    invoke-static {v10}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 285
    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/zzkx;->zzaD()Lcom/google/android/gms/internal/measurement/zzlb;

    move-result-object v10

    check-cast v10, Lcom/google/android/gms/internal/measurement/zzft;

    const-string v14, "_en"

    invoke-static {v10, v14}, Lcom/google/android/gms/measurement/internal/zzli;->zzC(Lcom/google/android/gms/internal/measurement/zzft;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 286
    invoke-interface {v2, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/google/android/gms/measurement/internal/zzas;

    if-nez v14, :cond_33

    iget-object v14, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 287
    invoke-static {v14}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    iget-object v15, v4, Lcom/google/android/gms/measurement/internal/zzld;->zza:Lcom/google/android/gms/internal/measurement/zzgd;

    .line 288
    invoke-virtual {v15}, Lcom/google/android/gms/internal/measurement/zzgd;->zzy()Ljava/lang/String;

    move-result-object v15

    invoke-static {v10}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v5, v17

    check-cast v5, Ljava/lang/String;

    .line 289
    invoke-virtual {v14, v15, v5}, Lcom/google/android/gms/measurement/internal/zzam;->zzn(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzas;

    move-result-object v14

    if-eqz v14, :cond_33

    .line 290
    invoke-interface {v2, v10, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_33
    if-eqz v14, :cond_36

    iget-object v5, v14, Lcom/google/android/gms/measurement/internal/zzas;->zzi:Ljava/lang/Long;

    if-nez v5, :cond_36

    iget-object v5, v14, Lcom/google/android/gms/measurement/internal/zzas;->zzj:Ljava/lang/Long;

    if-eqz v5, :cond_34

    .line 291
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    const-wide/16 v17, 0x1

    cmp-long v10, v5, v17

    if-lez v10, :cond_34

    iget-object v5, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzi:Lcom/google/android/gms/measurement/internal/zzli;

    .line 292
    invoke-static {v5}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    iget-object v5, v14, Lcom/google/android/gms/measurement/internal/zzas;->zzj:Ljava/lang/Long;

    .line 293
    invoke-static {v9, v13, v5}, Lcom/google/android/gms/measurement/internal/zzli;->zzz(Lcom/google/android/gms/internal/measurement/zzfs;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_34
    iget-object v5, v14, Lcom/google/android/gms/measurement/internal/zzas;->zzk:Ljava/lang/Boolean;

    if-eqz v5, :cond_35

    .line 294
    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_35

    iget-object v5, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzi:Lcom/google/android/gms/measurement/internal/zzli;

    .line 295
    invoke-static {v5}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    const-wide/16 v5, 0x1

    .line 296
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-static {v9, v12, v10}, Lcom/google/android/gms/measurement/internal/zzli;->zzz(Lcom/google/android/gms/internal/measurement/zzfs;Ljava/lang/String;Ljava/lang/Object;)V

    .line 297
    :cond_35
    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/zzkx;->zzaD()Lcom/google/android/gms/internal/measurement/zzlb;

    move-result-object v5

    check-cast v5, Lcom/google/android/gms/internal/measurement/zzft;

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 298
    :cond_36
    invoke-virtual {v11, v8, v9}, Lcom/google/android/gms/internal/measurement/zzgc;->zzS(ILcom/google/android/gms/internal/measurement/zzfs;)Lcom/google/android/gms/internal/measurement/zzgc;

    :goto_1c
    move-object v10, v3

    move-object/from16 v21, v7

    move-object v5, v11

    move-object v7, v2

    const-wide/16 v2, 0x1

    goto/16 :goto_26

    :cond_37
    iget-object v5, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzc:Lcom/google/android/gms/measurement/internal/zzfv;

    .line 218
    invoke-static {v5}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    iget-object v6, v4, Lcom/google/android/gms/measurement/internal/zzld;->zza:Lcom/google/android/gms/internal/measurement/zzgd;

    .line 219
    invoke-virtual {v6}, Lcom/google/android/gms/internal/measurement/zzgd;->zzy()Ljava/lang/String;

    move-result-object v6

    const-string v10, "measurement.account.time_zone_offset_minutes"

    .line 220
    invoke-virtual {v5, v6, v10}, Lcom/google/android/gms/measurement/internal/zzfv;->zza(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 221
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v14
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    if-nez v14, :cond_38

    .line 222
    :try_start_9
    invoke-static {v10}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v5
    :try_end_9
    .catch Ljava/lang/NumberFormatException; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto :goto_1d

    :catch_0
    move-exception v0

    move-object v10, v0

    .line 407
    :try_start_a
    iget-object v5, v5, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 223
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v5

    .line 224
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzeu;->zzk()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v5

    const-string v14, "Unable to parse timezone offset. appId"

    invoke-static {v6}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    .line 225
    invoke-virtual {v5, v14, v6, v10}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_38
    const-wide/16 v5, 0x0

    .line 226
    :goto_1d
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzv()Lcom/google/android/gms/measurement/internal/zzlo;

    move-result-object v10

    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/zzfs;->zzc()J

    move-result-wide v14

    invoke-virtual {v10, v14, v15, v5, v6}, Lcom/google/android/gms/measurement/internal/zzlo;->zzr(JJ)J

    move-result-wide v14

    .line 227
    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/zzkx;->zzaD()Lcom/google/android/gms/internal/measurement/zzlb;

    move-result-object v10

    check-cast v10, Lcom/google/android/gms/internal/measurement/zzft;

    move-object/from16 p3, v12

    const-wide/16 v17, 0x1

    invoke-static/range {v17 .. v18}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    move-wide/from16 v17, v5

    const-string v5, "_dbg"

    .line 228
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_3b

    .line 229
    invoke-virtual {v10}, Lcom/google/android/gms/internal/measurement/zzft;->zzi()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1e
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_3b

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/google/android/gms/internal/measurement/zzfx;

    move-object/from16 v21, v6

    .line 230
    invoke-virtual {v10}, Lcom/google/android/gms/internal/measurement/zzfx;->zzg()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3a

    .line 231
    invoke-virtual {v10}, Lcom/google/android/gms/internal/measurement/zzfx;->zzd()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v12, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_39

    goto :goto_1f

    :cond_39
    const/4 v5, 0x1

    goto :goto_20

    :cond_3a
    move-object/from16 v6, v21

    goto :goto_1e

    :cond_3b
    :goto_1f
    iget-object v5, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzc:Lcom/google/android/gms/measurement/internal/zzfv;

    .line 232
    invoke-static {v5}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    iget-object v6, v4, Lcom/google/android/gms/measurement/internal/zzld;->zza:Lcom/google/android/gms/internal/measurement/zzgd;

    .line 233
    invoke-virtual {v6}, Lcom/google/android/gms/internal/measurement/zzgd;->zzy()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/zzfs;->zzo()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v5, v6, v10}, Lcom/google/android/gms/measurement/internal/zzfv;->zzc(Ljava/lang/String;Ljava/lang/String;)I

    move-result v5

    :goto_20
    if-gtz v5, :cond_3c

    .line 234
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v6

    .line 235
    invoke-virtual {v6}, Lcom/google/android/gms/measurement/internal/zzeu;->zzk()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v6

    const-string v10, "Sample rate must be positive. event, rate"

    .line 236
    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/zzfs;->zzo()Ljava/lang/String;

    move-result-object v12

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v6, v10, v12, v5}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 237
    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/zzkx;->zzaD()Lcom/google/android/gms/internal/measurement/zzlb;

    move-result-object v5

    check-cast v5, Lcom/google/android/gms/internal/measurement/zzft;

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 238
    invoke-virtual {v11, v8, v9}, Lcom/google/android/gms/internal/measurement/zzgc;->zzS(ILcom/google/android/gms/internal/measurement/zzfs;)Lcom/google/android/gms/internal/measurement/zzgc;

    goto/16 :goto_1c

    .line 239
    :cond_3c
    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/zzfs;->zzo()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/android/gms/measurement/internal/zzas;

    if-nez v6, :cond_3d

    iget-object v6, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 240
    invoke-static {v6}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    iget-object v10, v4, Lcom/google/android/gms/measurement/internal/zzld;->zza:Lcom/google/android/gms/internal/measurement/zzgd;

    .line 241
    invoke-virtual {v10}, Lcom/google/android/gms/internal/measurement/zzgd;->zzy()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/zzfs;->zzo()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v6, v10, v12}, Lcom/google/android/gms/measurement/internal/zzam;->zzn(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzas;

    move-result-object v6

    if-nez v6, :cond_3d

    .line 242
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v6

    .line 243
    invoke-virtual {v6}, Lcom/google/android/gms/measurement/internal/zzeu;->zzk()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v6

    const-string v10, "Event being bundled has no eventAggregate. appId, eventName"

    iget-object v12, v4, Lcom/google/android/gms/measurement/internal/zzld;->zza:Lcom/google/android/gms/internal/measurement/zzgd;

    .line 244
    invoke-virtual {v12}, Lcom/google/android/gms/internal/measurement/zzgd;->zzy()Ljava/lang/String;

    move-result-object v12

    move-wide/from16 v21, v14

    .line 245
    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/zzfs;->zzo()Ljava/lang/String;

    move-result-object v14

    .line 246
    invoke-virtual {v6, v10, v12, v14}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v6, Lcom/google/android/gms/measurement/internal/zzas;

    iget-object v10, v4, Lcom/google/android/gms/measurement/internal/zzld;->zza:Lcom/google/android/gms/internal/measurement/zzgd;

    .line 247
    invoke-virtual {v10}, Lcom/google/android/gms/internal/measurement/zzgd;->zzy()Ljava/lang/String;

    move-result-object v24

    .line 248
    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/zzfs;->zzo()Ljava/lang/String;

    move-result-object v25

    const-wide/16 v26, 0x1

    const-wide/16 v28, 0x1

    const-wide/16 v30, 0x1

    .line 249
    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/zzfs;->zzc()J

    move-result-wide v32

    const-wide/16 v34, 0x0

    const/16 v36, 0x0

    const/16 v37, 0x0

    const/16 v38, 0x0

    const/16 v39, 0x0

    move-object/from16 v23, v6

    invoke-direct/range {v23 .. v39}, Lcom/google/android/gms/measurement/internal/zzas;-><init>(Ljava/lang/String;Ljava/lang/String;JJJJJLjava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Boolean;)V

    goto :goto_21

    :cond_3d
    move-wide/from16 v21, v14

    :goto_21
    iget-object v10, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzi:Lcom/google/android/gms/measurement/internal/zzli;

    .line 250
    invoke-static {v10}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 251
    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/zzkx;->zzaD()Lcom/google/android/gms/internal/measurement/zzlb;

    move-result-object v10

    check-cast v10, Lcom/google/android/gms/internal/measurement/zzft;

    const-string v12, "_eid"

    invoke-static {v10, v12}, Lcom/google/android/gms/measurement/internal/zzli;->zzC(Lcom/google/android/gms/internal/measurement/zzft;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Long;

    if-eqz v10, :cond_3e

    const/4 v12, 0x1

    goto :goto_22

    :cond_3e
    const/4 v12, 0x0

    .line 252
    :goto_22
    invoke-static {v12}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v12

    const/4 v14, 0x1

    if-ne v5, v14, :cond_41

    .line 253
    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/zzkx;->zzaD()Lcom/google/android/gms/internal/measurement/zzlb;

    move-result-object v5

    check-cast v5, Lcom/google/android/gms/internal/measurement/zzft;

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 254
    invoke-virtual {v12}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_40

    iget-object v5, v6, Lcom/google/android/gms/measurement/internal/zzas;->zzi:Ljava/lang/Long;

    if-nez v5, :cond_3f

    iget-object v5, v6, Lcom/google/android/gms/measurement/internal/zzas;->zzj:Ljava/lang/Long;

    if-nez v5, :cond_3f

    iget-object v5, v6, Lcom/google/android/gms/measurement/internal/zzas;->zzk:Ljava/lang/Boolean;

    if-eqz v5, :cond_40

    :cond_3f
    const/4 v5, 0x0

    .line 255
    invoke-virtual {v6, v5, v5, v5}, Lcom/google/android/gms/measurement/internal/zzas;->zza(Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Boolean;)Lcom/google/android/gms/measurement/internal/zzas;

    move-result-object v6

    .line 256
    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/zzfs;->zzo()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 257
    :cond_40
    invoke-virtual {v11, v8, v9}, Lcom/google/android/gms/internal/measurement/zzgc;->zzS(ILcom/google/android/gms/internal/measurement/zzfs;)Lcom/google/android/gms/internal/measurement/zzgc;

    goto/16 :goto_1c

    .line 258
    :cond_41
    invoke-virtual {v7, v5}, Ljava/security/SecureRandom;->nextInt(I)I

    move-result v14

    if-nez v14, :cond_43

    iget-object v10, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzi:Lcom/google/android/gms/measurement/internal/zzli;

    .line 259
    invoke-static {v10}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    int-to-long v14, v5

    .line 260
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-static {v9, v13, v5}, Lcom/google/android/gms/measurement/internal/zzli;->zzz(Lcom/google/android/gms/internal/measurement/zzfs;Ljava/lang/String;Ljava/lang/Object;)V

    .line 261
    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/zzkx;->zzaD()Lcom/google/android/gms/internal/measurement/zzlb;

    move-result-object v10

    check-cast v10, Lcom/google/android/gms/internal/measurement/zzft;

    invoke-interface {v3, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 262
    invoke-virtual {v12}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v10

    if-eqz v10, :cond_42

    const/4 v10, 0x0

    .line 263
    invoke-virtual {v6, v10, v5, v10}, Lcom/google/android/gms/measurement/internal/zzas;->zza(Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Boolean;)Lcom/google/android/gms/measurement/internal/zzas;

    move-result-object v6

    .line 264
    :cond_42
    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/zzfs;->zzo()Ljava/lang/String;

    move-result-object v5

    .line 265
    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/zzfs;->zzc()J

    move-result-wide v12

    move-wide/from16 v14, v21

    invoke-virtual {v6, v12, v13, v14, v15}, Lcom/google/android/gms/measurement/internal/zzas;->zzb(JJ)Lcom/google/android/gms/measurement/internal/zzas;

    move-result-object v6

    .line 266
    invoke-interface {v2, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v10, v3

    move-object/from16 v21, v7

    move-object v5, v11

    move-object v7, v2

    const-wide/16 v2, 0x1

    goto/16 :goto_25

    :cond_43
    move-wide/from16 v14, v21

    move-object/from16 v21, v7

    .line 267
    iget-object v7, v6, Lcom/google/android/gms/measurement/internal/zzas;->zzh:Ljava/lang/Long;

    if-eqz v7, :cond_44

    .line 268
    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v17

    move-object/from16 v24, v2

    move-object/from16 v25, v3

    move-object/from16 v23, v10

    move-object/from16 v22, v11

    goto :goto_23

    .line 269
    :cond_44
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzv()Lcom/google/android/gms/measurement/internal/zzlo;

    move-result-object v7

    move-object/from16 v23, v10

    move-object/from16 v22, v11

    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/zzfs;->zzb()J

    move-result-wide v10

    move-object/from16 v24, v2

    move-object/from16 v25, v3

    move-wide/from16 v2, v17

    invoke-virtual {v7, v10, v11, v2, v3}, Lcom/google/android/gms/measurement/internal/zzlo;->zzr(JJ)J

    move-result-wide v17

    :goto_23
    cmp-long v2, v17, v14

    if-eqz v2, :cond_46

    .line 268
    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzi:Lcom/google/android/gms/measurement/internal/zzli;

    .line 270
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    const-wide/16 v2, 0x1

    .line 271
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    move-object/from16 v10, p3

    invoke-static {v9, v10, v7}, Lcom/google/android/gms/measurement/internal/zzli;->zzz(Lcom/google/android/gms/internal/measurement/zzfs;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v7, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzi:Lcom/google/android/gms/measurement/internal/zzli;

    .line 272
    invoke-static {v7}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    int-to-long v10, v5

    .line 273
    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-static {v9, v13, v5}, Lcom/google/android/gms/measurement/internal/zzli;->zzz(Lcom/google/android/gms/internal/measurement/zzfs;Ljava/lang/String;Ljava/lang/Object;)V

    .line 274
    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/zzkx;->zzaD()Lcom/google/android/gms/internal/measurement/zzlb;

    move-result-object v7

    check-cast v7, Lcom/google/android/gms/internal/measurement/zzft;

    move-object/from16 v10, v25

    invoke-interface {v10, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 275
    invoke-virtual {v12}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    if-eqz v7, :cond_45

    const/4 v7, 0x1

    .line 276
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    const/4 v7, 0x0

    invoke-virtual {v6, v7, v5, v11}, Lcom/google/android/gms/measurement/internal/zzas;->zza(Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Boolean;)Lcom/google/android/gms/measurement/internal/zzas;

    move-result-object v6

    .line 277
    :cond_45
    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/zzfs;->zzo()Ljava/lang/String;

    move-result-object v5

    .line 278
    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/zzfs;->zzc()J

    move-result-wide v11

    invoke-virtual {v6, v11, v12, v14, v15}, Lcom/google/android/gms/measurement/internal/zzas;->zzb(JJ)Lcom/google/android/gms/measurement/internal/zzas;

    move-result-object v6

    move-object/from16 v7, v24

    .line 279
    invoke-interface {v7, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_24

    :cond_46
    move-object/from16 v7, v24

    move-object/from16 v10, v25

    const-wide/16 v2, 0x1

    .line 280
    invoke-virtual {v12}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_47

    .line 281
    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/zzfs;->zzo()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v11, v23

    const/4 v12, 0x0

    invoke-virtual {v6, v11, v12, v12}, Lcom/google/android/gms/measurement/internal/zzas;->zza(Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Boolean;)Lcom/google/android/gms/measurement/internal/zzas;

    move-result-object v6

    .line 282
    invoke-interface {v7, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_47
    :goto_24
    move-object/from16 v5, v22

    .line 283
    :goto_25
    invoke-virtual {v5, v8, v9}, Lcom/google/android/gms/internal/measurement/zzgc;->zzS(ILcom/google/android/gms/internal/measurement/zzfs;)Lcom/google/android/gms/internal/measurement/zzgc;

    :goto_26
    add-int/lit8 v8, v8, 0x1

    move-object v11, v5

    move-object v2, v7

    move-object v3, v10

    move-object/from16 v7, v21

    const-wide/16 v5, 0x0

    goto/16 :goto_1b

    :cond_48
    move-object v7, v2

    move-object v10, v3

    move-object v5, v11

    .line 299
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzgc;->zza()I

    move-result v3

    if-ge v2, v3, :cond_49

    .line 300
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzgc;->zzr()Lcom/google/android/gms/internal/measurement/zzgc;

    invoke-virtual {v5, v10}, Lcom/google/android/gms/internal/measurement/zzgc;->zzg(Ljava/lang/Iterable;)Lcom/google/android/gms/internal/measurement/zzgc;

    .line 301
    :cond_49
    invoke-interface {v7}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_27
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    iget-object v6, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 302
    invoke-static {v6}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 303
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/measurement/internal/zzas;

    invoke-virtual {v6, v3}, Lcom/google/android/gms/measurement/internal/zzam;->zzE(Lcom/google/android/gms/measurement/internal/zzas;)V

    goto :goto_27

    :cond_4a
    move-object v5, v11

    :cond_4b
    iget-object v2, v4, Lcom/google/android/gms/measurement/internal/zzld;->zza:Lcom/google/android/gms/internal/measurement/zzgd;

    .line 304
    invoke-virtual {v2}, Lcom/google/android/gms/internal/measurement/zzgd;->zzy()Ljava/lang/String;

    move-result-object v2

    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 305
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 306
    invoke-virtual {v3, v2}, Lcom/google/android/gms/measurement/internal/zzam;->zzj(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzh;

    move-result-object v3

    if-nez v3, :cond_4c

    .line 307
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v3

    .line 308
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v3

    const-string v6, "Bundling raw events w/o app info. appId"

    iget-object v7, v4, Lcom/google/android/gms/measurement/internal/zzld;->zza:Lcom/google/android/gms/internal/measurement/zzgd;

    .line 309
    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/zzgd;->zzy()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    .line 310
    invoke-virtual {v3, v6, v7}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_2c

    .line 311
    :cond_4c
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzgc;->zza()I

    move-result v6

    if-lez v6, :cond_51

    .line 312
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzh;->zzn()J

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmp-long v10, v6, v8

    if-eqz v10, :cond_4d

    .line 313
    invoke-virtual {v5, v6, v7}, Lcom/google/android/gms/internal/measurement/zzgc;->zzab(J)Lcom/google/android/gms/internal/measurement/zzgc;

    goto :goto_28

    .line 314
    :cond_4d
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzgc;->zzv()Lcom/google/android/gms/internal/measurement/zzgc;

    .line 315
    :goto_28
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzh;->zzp()J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v12, v8, v10

    if-nez v12, :cond_4e

    goto :goto_29

    :cond_4e
    move-wide v6, v8

    :goto_29
    cmp-long v8, v6, v10

    if-eqz v8, :cond_4f

    .line 316
    invoke-virtual {v5, v6, v7}, Lcom/google/android/gms/internal/measurement/zzgc;->zzac(J)Lcom/google/android/gms/internal/measurement/zzgc;

    goto :goto_2a

    .line 317
    :cond_4f
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzgc;->zzw()Lcom/google/android/gms/internal/measurement/zzgc;

    .line 318
    :goto_2a
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzh;->zzF()V

    .line 319
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzh;->zzo()J

    move-result-wide v6

    long-to-int v7, v6

    invoke-virtual {v5, v7}, Lcom/google/android/gms/internal/measurement/zzgc;->zzI(I)Lcom/google/android/gms/internal/measurement/zzgc;

    .line 320
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzgc;->zzd()J

    move-result-wide v6

    invoke-virtual {v3, v6, v7}, Lcom/google/android/gms/measurement/internal/zzh;->zzac(J)V

    .line 321
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzgc;->zzc()J

    move-result-wide v6

    invoke-virtual {v3, v6, v7}, Lcom/google/android/gms/measurement/internal/zzh;->zzaa(J)V

    .line 322
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzh;->zzt()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_50

    .line 323
    invoke-virtual {v5, v6}, Lcom/google/android/gms/internal/measurement/zzgc;->zzW(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzgc;

    goto :goto_2b

    .line 324
    :cond_50
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzgc;->zzs()Lcom/google/android/gms/internal/measurement/zzgc;

    .line 323
    :goto_2b
    iget-object v6, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 325
    invoke-static {v6}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 326
    invoke-virtual {v6, v3}, Lcom/google/android/gms/measurement/internal/zzam;->zzD(Lcom/google/android/gms/measurement/internal/zzh;)V

    .line 327
    :cond_51
    :goto_2c
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzgc;->zza()I

    move-result v3

    if-lez v3, :cond_58

    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 328
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzge;->zzay()Lcom/google/android/gms/measurement/internal/zzab;

    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzc:Lcom/google/android/gms/measurement/internal/zzfv;

    .line 329
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    iget-object v6, v4, Lcom/google/android/gms/measurement/internal/zzld;->zza:Lcom/google/android/gms/internal/measurement/zzgd;

    .line 330
    invoke-virtual {v6}, Lcom/google/android/gms/internal/measurement/zzgd;->zzy()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Lcom/google/android/gms/measurement/internal/zzfv;->zze(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzff;

    move-result-object v3

    const-wide/16 v6, -0x1

    if-eqz v3, :cond_53

    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzff;->zzu()Z

    move-result v8

    if-nez v8, :cond_52

    goto :goto_2d

    .line 336
    :cond_52
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzff;->zzc()J

    move-result-wide v8

    .line 337
    invoke-virtual {v5, v8, v9}, Lcom/google/android/gms/internal/measurement/zzgc;->zzK(J)Lcom/google/android/gms/internal/measurement/zzgc;

    goto :goto_2e

    .line 330
    :cond_53
    :goto_2d
    iget-object v3, v4, Lcom/google/android/gms/measurement/internal/zzld;->zza:Lcom/google/android/gms/internal/measurement/zzgd;

    .line 331
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzgd;->zzG()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_54

    .line 332
    invoke-virtual {v5, v6, v7}, Lcom/google/android/gms/internal/measurement/zzgc;->zzK(J)Lcom/google/android/gms/internal/measurement/zzgc;

    goto :goto_2e

    .line 333
    :cond_54
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v3

    .line 334
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzeu;->zzk()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v3

    const-string v8, "Did not find measurement config or missing version info. appId"

    iget-object v9, v4, Lcom/google/android/gms/measurement/internal/zzld;->zza:Lcom/google/android/gms/internal/measurement/zzgd;

    .line 335
    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/zzgd;->zzy()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    .line 336
    invoke-virtual {v3, v8, v9}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    .line 332
    :goto_2e
    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 338
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 339
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzkx;->zzaD()Lcom/google/android/gms/internal/measurement/zzlb;

    move-result-object v5

    check-cast v5, Lcom/google/android/gms/internal/measurement/zzgd;

    .line 340
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 341
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzkt;->zzW()V

    .line 342
    invoke-static {v5}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 343
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzgd;->zzy()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 344
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzgd;->zzbg()Z

    move-result v8

    invoke-static {v8}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(Z)V

    .line 345
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzam;->zzz()V

    iget-object v8, v3, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 346
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzge;->zzax()Lcom/google/android/gms/common/util/Clock;

    move-result-object v8

    .line 347
    invoke-interface {v8}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v8

    .line 348
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzgd;->zzk()J

    move-result-wide v10

    iget-object v12, v3, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 349
    invoke-virtual {v12}, Lcom/google/android/gms/measurement/internal/zzge;->zzf()Lcom/google/android/gms/measurement/internal/zzag;

    .line 348
    invoke-static {}, Lcom/google/android/gms/measurement/internal/zzag;->zzA()J

    move-result-wide v12

    sub-long v12, v8, v12

    cmp-long v14, v10, v12

    if-ltz v14, :cond_55

    .line 350
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzgd;->zzk()J

    move-result-wide v10

    iget-object v12, v3, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 351
    invoke-virtual {v12}, Lcom/google/android/gms/measurement/internal/zzge;->zzf()Lcom/google/android/gms/measurement/internal/zzag;

    .line 350
    invoke-static {}, Lcom/google/android/gms/measurement/internal/zzag;->zzA()J

    move-result-wide v12

    add-long/2addr v12, v8

    cmp-long v14, v10, v12

    if-lez v14, :cond_56

    :cond_55
    iget-object v10, v3, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 352
    invoke-virtual {v10}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v10

    .line 353
    invoke-virtual {v10}, Lcom/google/android/gms/measurement/internal/zzeu;->zzk()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v10

    const-string v11, "Storing bundle outside of the max uploading time span. appId, now, timestamp"

    .line 354
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzgd;->zzy()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    .line 355
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    .line 356
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzgd;->zzk()J

    move-result-wide v13

    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    .line 357
    invoke-virtual {v10, v11, v12, v8, v9}, Lcom/google/android/gms/measurement/internal/zzes;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 358
    :cond_56
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzjk;->zzbx()[B

    move-result-object v8
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    :try_start_b
    iget-object v9, v3, Lcom/google/android/gms/measurement/internal/zzks;->zzf:Lcom/google/android/gms/measurement/internal/zzlg;

    iget-object v9, v9, Lcom/google/android/gms/measurement/internal/zzlg;->zzi:Lcom/google/android/gms/measurement/internal/zzli;

    .line 359
    invoke-static {v9}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 360
    invoke-virtual {v9, v8}, Lcom/google/android/gms/measurement/internal/zzli;->zzy([B)[B

    move-result-object v8
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_2
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    :try_start_c
    iget-object v9, v3, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 365
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v9

    .line 366
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v9

    const-string v10, "Saving bundle, size"

    array-length v11, v8

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v9, Landroid/content/ContentValues;

    .line 367
    invoke-direct {v9}, Landroid/content/ContentValues;-><init>()V

    const-string v10, "app_id"

    .line 368
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzgd;->zzy()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v10, "bundle_end_timestamp"

    .line 369
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzgd;->zzk()J

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v10, "data"

    .line 370
    invoke-virtual {v9, v10, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    const-string v8, "has_realtime"

    .line 371
    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v9, v8, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 372
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzgd;->zzbm()Z

    move-result v8

    if-eqz v8, :cond_57

    const-string v8, "retry_count"

    .line 373
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzgd;->zze()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v9, v8, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 374
    :cond_57
    :try_start_d
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzam;->zzh()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v8

    const-string v10, "queue"

    const/4 v11, 0x0

    .line 375
    invoke-virtual {v8, v10, v11, v9}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v8

    cmp-long v10, v8, v6

    if-nez v10, :cond_58

    iget-object v6, v3, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 376
    invoke-virtual {v6}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v6

    .line 377
    invoke-virtual {v6}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v6

    const-string v7, "Failed to insert bundle (got -1). appId"

    .line 378
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzgd;->zzy()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_d
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_d .. :try_end_d} :catch_1
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    goto :goto_2f

    :catch_1
    move-exception v0

    move-object v6, v0

    .line 364
    :try_start_e
    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 379
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v3

    .line 380
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v3

    const-string v7, "Error storing bundle. appId"

    .line 381
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzgd;->zzy()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v3, v7, v5, v6}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_2f

    :catch_2
    move-exception v0

    move-object v6, v0

    .line 225
    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 361
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v3

    .line 362
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v3

    const-string v7, "Data loss. Failed to serialize bundle. appId"

    .line 363
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/zzgd;->zzy()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .line 364
    invoke-virtual {v3, v7, v5, v6}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 378
    :cond_58
    :goto_2f
    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 382
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    iget-object v4, v4, Lcom/google/android/gms/measurement/internal/zzld;->zzb:Ljava/util/List;

    .line 383
    invoke-static {v4}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 384
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 385
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzkt;->zzW()V

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "rowid in ("

    .line 386
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v6, 0x0

    .line 387
    :goto_30
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v7

    if-ge v6, v7, :cond_5a

    if-eqz v6, :cond_59

    const-string v7, ","

    .line 388
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 389
    :cond_59
    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Long;

    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    invoke-virtual {v5, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    add-int/lit8 v6, v6, 0x1

    goto :goto_30

    :cond_5a
    const-string v6, ")"

    .line 390
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 391
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzam;->zzh()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v6

    const-string v7, "raw_events"

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v8, 0x0

    .line 392
    invoke-virtual {v6, v7, v5, v8}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v5

    .line 393
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v6

    if-eq v5, v6, :cond_5b

    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 394
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v3

    .line 395
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v3

    const-string v6, "Deleted fewer rows from raw events table than expected"

    .line 396
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 397
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 398
    invoke-virtual {v3, v6, v5, v4}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_5b
    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 399
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 400
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzam;->zzh()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    :try_start_f
    const-string v5, "delete from raw_events_metadata where app_id=? and metadata_fingerprint not in (select distinct metadata_fingerprint from raw_events where app_id=?)"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    aput-object v2, v6, v7

    const/4 v7, 0x1

    aput-object v2, v6, v7

    .line 401
    invoke-virtual {v4, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_f
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_f .. :try_end_f} :catch_3
    .catchall {:try_start_f .. :try_end_f} :catchall_0

    goto :goto_31

    :catch_3
    move-exception v0

    move-object v4, v0

    .line 381
    :try_start_10
    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 402
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v3

    .line 403
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v3

    const-string v5, "Failed to remove unused event metadata. appId"

    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 404
    invoke-virtual {v3, v5, v2, v4}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 401
    :goto_31
    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 405
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 406
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzam;->zzC()V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_0

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 8
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 9
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzam;->zzx()V

    const/4 v2, 0x1

    return v2

    .line 5
    :cond_5c
    :goto_32
    :try_start_11
    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 6
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 7
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzam;->zzC()V
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_0

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 8
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 9
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzam;->zzx()V

    const/4 v2, 0x0

    return v2

    :catchall_0
    move-exception v0

    move-object v2, v0

    .line 170
    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 8
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 9
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzam;->zzx()V

    .line 407
    throw v2
.end method

.method private final zzai()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzB()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 3
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 4
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzam;->zzF()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 5
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 6
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzam;->zzr()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method private final zzaj(Lcom/google/android/gms/internal/measurement/zzfs;Lcom/google/android/gms/internal/measurement/zzfs;)Z
    .locals 9

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/measurement/zzfs;->zzo()Ljava/lang/String;

    move-result-object v0

    const-string v1, "_e"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 2
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkArgument(Z)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzi:Lcom/google/android/gms/measurement/internal/zzli;

    .line 3
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/measurement/zzkx;->zzaD()Lcom/google/android/gms/internal/measurement/zzlb;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/measurement/zzft;

    const-string v2, "_sc"

    invoke-static {v0, v2}, Lcom/google/android/gms/measurement/internal/zzli;->zzB(Lcom/google/android/gms/internal/measurement/zzft;Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    move-result-object v0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    move-object v0, v2

    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {v0}, Lcom/google/android/gms/internal/measurement/zzfx;->zzh()Ljava/lang/String;

    move-result-object v0

    .line 4
    :goto_0
    iget-object v3, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzi:Lcom/google/android/gms/measurement/internal/zzli;

    .line 5
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 6
    invoke-virtual {p2}, Lcom/google/android/gms/internal/measurement/zzkx;->zzaD()Lcom/google/android/gms/internal/measurement/zzlb;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/internal/measurement/zzft;

    const-string v4, "_pc"

    invoke-static {v3, v4}, Lcom/google/android/gms/measurement/internal/zzli;->zzB(Lcom/google/android/gms/internal/measurement/zzft;Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    move-result-object v3

    if-nez v3, :cond_1

    goto :goto_1

    .line 17
    :cond_1
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzfx;->zzh()Ljava/lang/String;

    move-result-object v2

    :goto_1
    if-eqz v2, :cond_5

    .line 7
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 8
    invoke-virtual {p1}, Lcom/google/android/gms/internal/measurement/zzfs;->zzo()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 9
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkArgument(Z)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzi:Lcom/google/android/gms/measurement/internal/zzli;

    .line 10
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 11
    invoke-virtual {p1}, Lcom/google/android/gms/internal/measurement/zzkx;->zzaD()Lcom/google/android/gms/internal/measurement/zzlb;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/measurement/zzft;

    const-string v1, "_et"

    invoke-static {v0, v1}, Lcom/google/android/gms/measurement/internal/zzli;->zzB(Lcom/google/android/gms/internal/measurement/zzft;Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-virtual {v0}, Lcom/google/android/gms/internal/measurement/zzfx;->zzw()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-virtual {v0}, Lcom/google/android/gms/internal/measurement/zzfx;->zzd()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-gtz v6, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/measurement/zzfx;->zzd()J

    move-result-wide v2

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzi:Lcom/google/android/gms/measurement/internal/zzli;

    .line 12
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 13
    invoke-virtual {p2}, Lcom/google/android/gms/internal/measurement/zzkx;->zzaD()Lcom/google/android/gms/internal/measurement/zzlb;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/measurement/zzft;

    invoke-static {v0, v1}, Lcom/google/android/gms/measurement/internal/zzli;->zzB(Lcom/google/android/gms/internal/measurement/zzft;Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzfx;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lcom/google/android/gms/internal/measurement/zzfx;->zzd()J

    move-result-wide v6

    cmp-long v8, v6, v4

    if-lez v8, :cond_3

    invoke-virtual {v0}, Lcom/google/android/gms/internal/measurement/zzfx;->zzd()J

    move-result-wide v4

    add-long/2addr v2, v4

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzi:Lcom/google/android/gms/measurement/internal/zzli;

    .line 14
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 15
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {p2, v1, v0}, Lcom/google/android/gms/measurement/internal/zzli;->zzz(Lcom/google/android/gms/internal/measurement/zzfs;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzi:Lcom/google/android/gms/measurement/internal/zzli;

    .line 16
    invoke-static {p2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    const-wide/16 v0, 0x1

    .line 17
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    const-string v0, "_fr"

    invoke-static {p1, v0, p2}, Lcom/google/android/gms/measurement/internal/zzli;->zzz(Lcom/google/android/gms/internal/measurement/zzfs;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_4
    :goto_2
    const/4 p1, 0x1

    return p1

    :cond_5
    const/4 p1, 0x0

    return p1
.end method

.method private static final zzak(Lcom/google/android/gms/measurement/internal/zzq;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzq;->zzb:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/zzq;->zzq:Ljava/lang/String;

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method private static final zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;
    .locals 2

    if-eqz p0, :cond_1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkt;->zzY()Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    new-instance v0, Ljava/lang/IllegalStateException;

    .line 2
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const-string v1, "Component not initialized: "

    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Upload Component not created"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static bridge synthetic zzp(Lcom/google/android/gms/measurement/internal/zzlg;)Lcom/google/android/gms/measurement/internal/zzge;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    return-object p0
.end method

.method public static zzt(Landroid/content/Context;)Lcom/google/android/gms/measurement/internal/zzlg;
    .locals 3

    .line 1
    invoke-static {p0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/google/android/gms/measurement/internal/zzlg;->zzb:Lcom/google/android/gms/measurement/internal/zzlg;

    if-nez v0, :cond_1

    const-class v0, Lcom/google/android/gms/measurement/internal/zzlg;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzb:Lcom/google/android/gms/measurement/internal/zzlg;

    if-nez v1, :cond_0

    new-instance v1, Lcom/google/android/gms/measurement/internal/zzlh;

    .line 3
    invoke-direct {v1, p0}, Lcom/google/android/gms/measurement/internal/zzlh;-><init>(Landroid/content/Context;)V

    .line 4
    invoke-static {v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/measurement/internal/zzlh;

    new-instance v1, Lcom/google/android/gms/measurement/internal/zzlg;

    const/4 v2, 0x0

    .line 5
    invoke-direct {v1, p0, v2}, Lcom/google/android/gms/measurement/internal/zzlg;-><init>(Lcom/google/android/gms/measurement/internal/zzlh;Lcom/google/android/gms/measurement/internal/zzge;)V

    sput-object v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzb:Lcom/google/android/gms/measurement/internal/zzlg;

    .line 6
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_1
    :goto_0
    sget-object p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzb:Lcom/google/android/gms/measurement/internal/zzlg;

    return-object p0
.end method

.method static bridge synthetic zzy(Lcom/google/android/gms/measurement/internal/zzlg;Lcom/google/android/gms/measurement/internal/zzlh;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    new-instance p1, Lcom/google/android/gms/measurement/internal/zzfm;

    invoke-direct {p1, p0}, Lcom/google/android/gms/measurement/internal/zzfm;-><init>(Lcom/google/android/gms/measurement/internal/zzlg;)V

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzm:Lcom/google/android/gms/measurement/internal/zzfm;

    .line 2
    new-instance p1, Lcom/google/android/gms/measurement/internal/zzam;

    invoke-direct {p1, p0}, Lcom/google/android/gms/measurement/internal/zzam;-><init>(Lcom/google/android/gms/measurement/internal/zzlg;)V

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzkt;->zzX()V

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 4
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzc:Lcom/google/android/gms/measurement/internal/zzfv;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/measurement/internal/zzaf;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/measurement/internal/zzag;->zzq(Lcom/google/android/gms/measurement/internal/zzaf;)V

    new-instance p1, Lcom/google/android/gms/measurement/internal/zzka;

    .line 5
    invoke-direct {p1, p0}, Lcom/google/android/gms/measurement/internal/zzka;-><init>(Lcom/google/android/gms/measurement/internal/zzlg;)V

    .line 6
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzkt;->zzX()V

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzk:Lcom/google/android/gms/measurement/internal/zzka;

    new-instance p1, Lcom/google/android/gms/measurement/internal/zzaa;

    .line 7
    invoke-direct {p1, p0}, Lcom/google/android/gms/measurement/internal/zzaa;-><init>(Lcom/google/android/gms/measurement/internal/zzlg;)V

    .line 8
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzkt;->zzX()V

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzh:Lcom/google/android/gms/measurement/internal/zzaa;

    new-instance p1, Lcom/google/android/gms/measurement/internal/zzio;

    .line 9
    invoke-direct {p1, p0}, Lcom/google/android/gms/measurement/internal/zzio;-><init>(Lcom/google/android/gms/measurement/internal/zzlg;)V

    .line 10
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzkt;->zzX()V

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzj:Lcom/google/android/gms/measurement/internal/zzio;

    new-instance p1, Lcom/google/android/gms/measurement/internal/zzkr;

    .line 11
    invoke-direct {p1, p0}, Lcom/google/android/gms/measurement/internal/zzkr;-><init>(Lcom/google/android/gms/measurement/internal/zzlg;)V

    .line 12
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzkt;->zzX()V

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzg:Lcom/google/android/gms/measurement/internal/zzkr;

    .line 13
    new-instance p1, Lcom/google/android/gms/measurement/internal/zzfc;

    invoke-direct {p1, p0}, Lcom/google/android/gms/measurement/internal/zzfc;-><init>(Lcom/google/android/gms/measurement/internal/zzlg;)V

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzf:Lcom/google/android/gms/measurement/internal/zzfc;

    iget p1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzr:I

    iget v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzs:I

    if-eq p1, v0, :cond_0

    .line 14
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object p1

    .line 15
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object p1

    iget v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzr:I

    .line 16
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget v1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzs:I

    .line 17
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Not all upload components initialized"

    .line 18
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzo:Z

    return-void
.end method


# virtual methods
.method final zzA()V
    .locals 9

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzB()V

    iget-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzp:Z

    if-nez v0, :cond_8

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzp:Z

    .line 3
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzZ()Z

    move-result v1

    if-eqz v1, :cond_8

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzx:Ljava/nio/channels/FileChannel;

    .line 4
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    const-wide/16 v2, 0x0

    const-string v4, "Bad channel to read from"

    const/4 v5, 0x4

    const/4 v6, 0x0

    if-eqz v1, :cond_2

    .line 5
    invoke-virtual {v1}, Ljava/nio/channels/FileChannel;->isOpen()Z

    move-result v7

    if-nez v7, :cond_0

    goto :goto_0

    .line 7
    :cond_0
    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v7

    .line 8
    :try_start_0
    invoke-virtual {v1, v2, v3}, Ljava/nio/channels/FileChannel;->position(J)Ljava/nio/channels/FileChannel;

    .line 9
    invoke-virtual {v1, v7}, Ljava/nio/channels/FileChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v1

    if-eq v1, v5, :cond_1

    const/4 v7, -0x1

    if-eq v1, v7, :cond_3

    .line 10
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/android/gms/measurement/internal/zzeu;->zzk()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v7

    const-string v8, "Unexpected data length. Bytes read"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v7, v8, v1}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    .line 11
    :cond_1
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 12
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v6
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v1

    .line 13
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v7

    const-string v8, "Failed to read from channel"

    invoke-virtual {v7, v8, v1}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    .line 6
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v1

    invoke-virtual {v1, v4}, Lcom/google/android/gms/measurement/internal/zzes;->zza(Ljava/lang/String;)V

    :cond_3
    :goto_1
    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 14
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzge;->zzh()Lcom/google/android/gms/measurement/internal/zzel;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzel;->zzi()I

    move-result v1

    .line 15
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    if-le v6, v1, :cond_4

    .line 16
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v0

    .line 18
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 19
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v3, "Panic: can\'t downgrade version. Previous, current version"

    .line 20
    invoke-virtual {v0, v3, v2, v1}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :cond_4
    if-ge v6, v1, :cond_8

    iget-object v7, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzx:Ljava/nio/channels/FileChannel;

    .line 21
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v8

    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    if-eqz v7, :cond_7

    .line 22
    invoke-virtual {v7}, Ljava/nio/channels/FileChannel;->isOpen()Z

    move-result v8

    if-nez v8, :cond_5

    goto :goto_2

    .line 24
    :cond_5
    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 25
    invoke-virtual {v4, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 26
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 27
    :try_start_1
    invoke-virtual {v7, v2, v3}, Ljava/nio/channels/FileChannel;->truncate(J)Ljava/nio/channels/FileChannel;

    .line 28
    invoke-virtual {v7, v4}, Ljava/nio/channels/FileChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 29
    invoke-virtual {v7, v0}, Ljava/nio/channels/FileChannel;->force(Z)V

    .line 30
    invoke-virtual {v7}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v2

    const-wide/16 v4, 0x4

    cmp-long v0, v2, v4

    if-eqz v0, :cond_6

    .line 31
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v0

    const-string v2, "Error writing to channel. Bytes written"

    invoke-virtual {v7}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 38
    :cond_6
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    .line 39
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v0

    .line 40
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v3, "Storage version upgraded. Previous, current version"

    invoke-virtual {v0, v3, v2, v1}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :catch_1
    move-exception v0

    .line 32
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v2

    const-string v3, "Failed to write to channel"

    invoke-virtual {v2, v3, v0}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_3

    .line 23
    :cond_7
    :goto_2
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v0

    invoke-virtual {v0, v4}, Lcom/google/android/gms/measurement/internal/zzes;->zza(Ljava/lang/String;)V

    .line 33
    :goto_3
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    .line 34
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v0

    .line 35
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 36
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v3, "Storage version upgrade failed. Previous, current version"

    .line 37
    invoke-virtual {v0, v3, v2, v1}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_8
    return-void
.end method

.method final zzB()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzo:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "UploadController is not initialized"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method final zzC(Ljava/lang/String;Lcom/google/android/gms/internal/measurement/zzgc;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzc:Lcom/google/android/gms/measurement/internal/zzfv;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 2
    invoke-virtual {v0, p1}, Lcom/google/android/gms/measurement/internal/zzfv;->zzk(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 3
    invoke-virtual {p2, v0}, Lcom/google/android/gms/internal/measurement/zzgc;->zzi(Ljava/lang/Iterable;)Lcom/google/android/gms/internal/measurement/zzgc;

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzc:Lcom/google/android/gms/measurement/internal/zzfv;

    .line 4
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 5
    invoke-virtual {v0, p1}, Lcom/google/android/gms/measurement/internal/zzfv;->zzv(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 6
    invoke-virtual {p2}, Lcom/google/android/gms/internal/measurement/zzgc;->zzp()Lcom/google/android/gms/internal/measurement/zzgc;

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzc:Lcom/google/android/gms/measurement/internal/zzfv;

    .line 7
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 8
    invoke-virtual {v0, p1}, Lcom/google/android/gms/measurement/internal/zzfv;->zzy(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, -0x1

    if-eqz v0, :cond_3

    .line 9
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v0

    sget-object v2, Lcom/google/android/gms/measurement/internal/zzeh;->zzar:Lcom/google/android/gms/measurement/internal/zzeg;

    invoke-virtual {v0, p1, v2}, Lcom/google/android/gms/measurement/internal/zzag;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzeg;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 10
    invoke-virtual {p2}, Lcom/google/android/gms/internal/measurement/zzgc;->zzas()Ljava/lang/String;

    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_3

    const-string v2, "."

    .line 12
    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-eq v2, v1, :cond_3

    const/4 v3, 0x0

    .line 13
    invoke-virtual {v0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 14
    invoke-virtual {p2, v0}, Lcom/google/android/gms/internal/measurement/zzgc;->zzY(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzgc;

    goto :goto_0

    .line 15
    :cond_2
    invoke-virtual {p2}, Lcom/google/android/gms/internal/measurement/zzgc;->zzu()Lcom/google/android/gms/internal/measurement/zzgc;

    .line 14
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzc:Lcom/google/android/gms/measurement/internal/zzfv;

    .line 16
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 17
    invoke-virtual {v0, p1}, Lcom/google/android/gms/measurement/internal/zzfv;->zzz(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "_id"

    .line 18
    invoke-static {p2, v0}, Lcom/google/android/gms/measurement/internal/zzli;->zza(Lcom/google/android/gms/internal/measurement/zzgc;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v1, :cond_4

    .line 19
    invoke-virtual {p2, v0}, Lcom/google/android/gms/internal/measurement/zzgc;->zzB(I)Lcom/google/android/gms/internal/measurement/zzgc;

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzc:Lcom/google/android/gms/measurement/internal/zzfv;

    .line 20
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 21
    invoke-virtual {v0, p1}, Lcom/google/android/gms/measurement/internal/zzfv;->zzx(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 22
    invoke-virtual {p2}, Lcom/google/android/gms/internal/measurement/zzgc;->zzq()Lcom/google/android/gms/internal/measurement/zzgc;

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzc:Lcom/google/android/gms/measurement/internal/zzfv;

    .line 23
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 24
    invoke-virtual {v0, p1}, Lcom/google/android/gms/measurement/internal/zzfv;->zzu(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 25
    invoke-virtual {p2}, Lcom/google/android/gms/internal/measurement/zzgc;->zzn()Lcom/google/android/gms/internal/measurement/zzgc;

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzC:Ljava/util/Map;

    .line 26
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/measurement/internal/zzlf;

    if-eqz v0, :cond_6

    iget-wide v1, v0, Lcom/google/android/gms/measurement/internal/zzlf;->zzb:J

    .line 27
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v3

    sget-object v4, Lcom/google/android/gms/measurement/internal/zzeh;->zzT:Lcom/google/android/gms/measurement/internal/zzeg;

    invoke-virtual {v3, p1, v4}, Lcom/google/android/gms/measurement/internal/zzag;->zzi(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzeg;)J

    move-result-wide v3

    add-long/2addr v1, v3

    .line 28
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzax()Lcom/google/android/gms/common/util/Clock;

    move-result-object v3

    invoke-interface {v3}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    move-result-wide v3

    cmp-long v5, v1, v3

    if-gez v5, :cond_7

    :cond_6
    new-instance v0, Lcom/google/android/gms/measurement/internal/zzlf;

    const/4 v1, 0x0

    .line 29
    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/measurement/internal/zzlf;-><init>(Lcom/google/android/gms/measurement/internal/zzlg;Lcom/google/android/gms/measurement/internal/zzle;)V

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzC:Ljava/util/Map;

    .line 30
    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_7
    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzlf;->zza:Ljava/lang/String;

    .line 31
    invoke-virtual {p2, v0}, Lcom/google/android/gms/internal/measurement/zzgc;->zzR(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzgc;

    :cond_8
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzc:Lcom/google/android/gms/measurement/internal/zzfv;

    .line 32
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 33
    invoke-virtual {v0, p1}, Lcom/google/android/gms/measurement/internal/zzfv;->zzw(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_9

    .line 34
    invoke-virtual {p2}, Lcom/google/android/gms/internal/measurement/zzgc;->zzy()Lcom/google/android/gms/internal/measurement/zzgc;

    :cond_9
    return-void
.end method

.method final zzD(Lcom/google/android/gms/measurement/internal/zzh;)V
    .locals 12

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzh;->zzz()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzh;->zzs()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 43
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzh;->zzu()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Ljava/lang/String;

    const/16 v2, 0xcc

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    .line 44
    invoke-virtual/range {v0 .. v5}, Lcom/google/android/gms/measurement/internal/zzlg;->zzI(Ljava/lang/String;ILjava/lang/Throwable;[BLjava/util/Map;)V

    return-void

    .line 2
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzl:Lcom/google/android/gms/measurement/internal/zzkv;

    new-instance v1, Landroid/net/Uri$Builder;

    .line 3
    invoke-direct {v1}, Landroid/net/Uri$Builder;-><init>()V

    .line 4
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzh;->zzz()Ljava/lang/String;

    move-result-object v2

    .line 5
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 6
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzh;->zzs()Ljava/lang/String;

    move-result-object v2

    .line 7
    :cond_2
    sget-object v3, Lcom/google/android/gms/measurement/internal/zzeh;->zze:Lcom/google/android/gms/measurement/internal/zzeg;

    const/4 v4, 0x0

    .line 8
    invoke-virtual {v3, v4}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v3

    sget-object v5, Lcom/google/android/gms/measurement/internal/zzeh;->zzf:Lcom/google/android/gms/measurement/internal/zzeg;

    .line 9
    invoke-virtual {v5, v4}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v3, v5}, Landroid/net/Uri$Builder;->encodedAuthority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v3

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const-string v5, "config/app/"

    invoke-virtual {v5, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 10
    invoke-virtual {v3, v2}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v2

    const-string v3, "platform"

    const-string v5, "android"

    .line 11
    invoke-virtual {v2, v3, v5}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v2

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzf()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzag;->zzh()J

    const-wide/32 v5, 0x12cc8

    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    const-string v3, "gmp_version"

    invoke-virtual {v2, v3, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v2, "runtime_version"

    const-string v3, "0"

    .line 14
    invoke-virtual {v0, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 15
    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    .line 16
    :try_start_0
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzh;->zzu()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Ljava/lang/String;

    .line 17
    new-instance v8, Ljava/net/URL;

    invoke-direct {v8, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 18
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v1

    const-string v2, "Fetching remote configuration"

    invoke-virtual {v1, v2, v7}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzc:Lcom/google/android/gms/measurement/internal/zzfv;

    .line 19
    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 20
    invoke-virtual {v1, v7}, Lcom/google/android/gms/measurement/internal/zzfv;->zze(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzff;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzc:Lcom/google/android/gms/measurement/internal/zzfv;

    .line 21
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 22
    invoke-virtual {v2, v7}, Lcom/google/android/gms/measurement/internal/zzfv;->zzh(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v1, :cond_5

    .line 23
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 24
    new-instance v1, Landroidx/collection/ArrayMap;

    invoke-direct {v1}, Landroidx/collection/ArrayMap;-><init>()V

    const-string v3, "If-Modified-Since"

    .line 25
    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v4, v1

    :cond_3
    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzc:Lcom/google/android/gms/measurement/internal/zzfv;

    .line 26
    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 27
    invoke-virtual {v1, v7}, Lcom/google/android/gms/measurement/internal/zzfv;->zzf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 28
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    if-nez v4, :cond_4

    .line 29
    new-instance v2, Landroidx/collection/ArrayMap;

    invoke-direct {v2}, Landroidx/collection/ArrayMap;-><init>()V

    move-object v4, v2

    :cond_4
    const-string v2, "If-None-Match"

    .line 30
    invoke-interface {v4, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_5
    move-object v10, v4

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzt:Z

    iget-object v6, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzd:Lcom/google/android/gms/measurement/internal/zzfa;

    .line 31
    invoke-static {v6}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    new-instance v11, Lcom/google/android/gms/measurement/internal/zzky;

    invoke-direct {v11, p0}, Lcom/google/android/gms/measurement/internal/zzky;-><init>(Lcom/google/android/gms/measurement/internal/zzlg;)V

    .line 32
    invoke-virtual {v6}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 33
    invoke-virtual {v6}, Lcom/google/android/gms/measurement/internal/zzkt;->zzW()V

    .line 34
    invoke-static {v8}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    invoke-static {v11}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, v6, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 36
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzge;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v1

    new-instance v2, Lcom/google/android/gms/measurement/internal/zzez;

    const/4 v9, 0x0

    move-object v5, v2

    .line 37
    invoke-direct/range {v5 .. v11}, Lcom/google/android/gms/measurement/internal/zzez;-><init>(Lcom/google/android/gms/measurement/internal/zzfa;Ljava/lang/String;Ljava/net/URL;[BLjava/util/Map;Lcom/google/android/gms/measurement/internal/zzew;)V

    .line 38
    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzgb;->zzo(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    .line 39
    :catch_0
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v1

    .line 40
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v1

    .line 41
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzh;->zzu()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    const-string v2, "Failed to parse config URL. Not fetching. appId"

    .line 42
    invoke-virtual {v1, v2, p1, v0}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method final zzE(Lcom/google/android/gms/measurement/internal/zzaw;Lcom/google/android/gms/measurement/internal/zzq;)V
    .locals 18

    move-object/from16 v1, p0

    move-object/from16 v0, p2

    .line 1
    invoke-static/range {p2 .. p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    iget-object v2, v0, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    invoke-static {v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 3
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 4
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzB()V

    .line 5
    iget-object v2, v0, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    move-object/from16 v3, p1

    .line 6
    iget-wide v10, v3, Lcom/google/android/gms/measurement/internal/zzaw;->zzd:J

    .line 7
    invoke-static/range {p1 .. p1}, Lcom/google/android/gms/measurement/internal/zzev;->zzb(Lcom/google/android/gms/measurement/internal/zzaw;)Lcom/google/android/gms/measurement/internal/zzev;

    move-result-object v3

    .line 8
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    iget-object v4, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzD:Lcom/google/android/gms/measurement/internal/zziq;

    const/4 v5, 0x0

    if-eqz v4, :cond_1

    iget-object v4, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzE:Ljava/lang/String;

    if-eqz v4, :cond_1

    .line 9
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    goto :goto_0

    .line 114
    :cond_0
    iget-object v5, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzD:Lcom/google/android/gms/measurement/internal/zziq;

    .line 9
    :cond_1
    :goto_0
    iget-object v4, v3, Lcom/google/android/gms/measurement/internal/zzev;->zzd:Landroid/os/Bundle;

    const/4 v6, 0x0

    .line 10
    invoke-static {v5, v4, v6}, Lcom/google/android/gms/measurement/internal/zzlo;->zzK(Lcom/google/android/gms/measurement/internal/zziq;Landroid/os/Bundle;Z)V

    .line 11
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzev;->zza()Lcom/google/android/gms/measurement/internal/zzaw;

    move-result-object v3

    iget-object v4, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzi:Lcom/google/android/gms/measurement/internal/zzli;

    .line 12
    invoke-static {v4}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 13
    invoke-static {v3, v0}, Lcom/google/android/gms/measurement/internal/zzli;->zzA(Lcom/google/android/gms/measurement/internal/zzaw;Lcom/google/android/gms/measurement/internal/zzq;)Z

    move-result v4

    if-nez v4, :cond_2

    return-void

    .line 14
    :cond_2
    iget-boolean v4, v0, Lcom/google/android/gms/measurement/internal/zzq;->zzh:Z

    if-nez v4, :cond_3

    .line 15
    invoke-virtual {v1, v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzd(Lcom/google/android/gms/measurement/internal/zzq;)Lcom/google/android/gms/measurement/internal/zzh;

    return-void

    .line 16
    :cond_3
    iget-object v4, v0, Lcom/google/android/gms/measurement/internal/zzq;->zzt:Ljava/util/List;

    if-eqz v4, :cond_5

    iget-object v5, v3, Lcom/google/android/gms/measurement/internal/zzaw;->zza:Ljava/lang/String;

    .line 17
    invoke-interface {v4, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    iget-object v4, v3, Lcom/google/android/gms/measurement/internal/zzaw;->zzb:Lcom/google/android/gms/measurement/internal/zzau;

    .line 18
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzau;->zzc()Landroid/os/Bundle;

    move-result-object v4

    const-wide/16 v7, 0x1

    const-string v5, "ga_safelisted"

    .line 19
    invoke-virtual {v4, v5, v7, v8}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    new-instance v5, Lcom/google/android/gms/measurement/internal/zzaw;

    iget-object v13, v3, Lcom/google/android/gms/measurement/internal/zzaw;->zza:Ljava/lang/String;

    new-instance v14, Lcom/google/android/gms/measurement/internal/zzau;

    .line 20
    invoke-direct {v14, v4}, Lcom/google/android/gms/measurement/internal/zzau;-><init>(Landroid/os/Bundle;)V

    iget-object v15, v3, Lcom/google/android/gms/measurement/internal/zzaw;->zzc:Ljava/lang/String;

    iget-wide v3, v3, Lcom/google/android/gms/measurement/internal/zzaw;->zzd:J

    move-object v12, v5

    move-wide/from16 v16, v3

    invoke-direct/range {v12 .. v17}, Lcom/google/android/gms/measurement/internal/zzaw;-><init>(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzau;Ljava/lang/String;J)V

    goto :goto_1

    .line 112
    :cond_4
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    .line 113
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeu;->zzc()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v0

    iget-object v4, v3, Lcom/google/android/gms/measurement/internal/zzaw;->zza:Ljava/lang/String;

    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzaw;->zzc:Ljava/lang/String;

    const-string v5, "Dropping non-safelisted event. appId, event name, origin"

    .line 114
    invoke-virtual {v0, v5, v2, v4, v3}, Lcom/google/android/gms/measurement/internal/zzes;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :cond_5
    move-object v12, v3

    .line 20
    :goto_1
    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 21
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 22
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzam;->zzw()V

    :try_start_0
    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 23
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 24
    invoke-static {v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 25
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 26
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzkt;->zzW()V

    const-wide/16 v4, 0x0

    const/4 v7, 0x2

    const/4 v13, 0x1

    cmp-long v8, v10, v4

    if-gez v8, :cond_6

    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 27
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v3

    .line 28
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzeu;->zzk()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v3

    const-string v4, "Invalid time querying timed out conditional properties"

    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .line 29
    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    .line 30
    invoke-virtual {v3, v4, v5, v9}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 31
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v3

    goto :goto_2

    :cond_6
    const-string v4, "active=0 and app_id=? and abs(? - creation_timestamp) > trigger_timeout"

    new-array v5, v7, [Ljava/lang/String;

    aput-object v2, v5, v6

    .line 32
    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v5, v13

    .line 33
    invoke-virtual {v3, v4, v5}, Lcom/google/android/gms/measurement/internal/zzam;->zzt(Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    .line 34
    :goto_2
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_7
    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_9

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/gms/measurement/internal/zzac;

    if-eqz v4, :cond_7

    .line 35
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v5

    .line 36
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v5

    const-string v9, "User property timed out"

    iget-object v14, v4, Lcom/google/android/gms/measurement/internal/zzac;->zza:Ljava/lang/String;

    iget-object v15, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 37
    invoke-virtual {v15}, Lcom/google/android/gms/measurement/internal/zzge;->zzj()Lcom/google/android/gms/measurement/internal/zzep;

    move-result-object v15

    iget-object v13, v4, Lcom/google/android/gms/measurement/internal/zzac;->zzc:Lcom/google/android/gms/measurement/internal/zzlj;

    .line 38
    iget-object v13, v13, Lcom/google/android/gms/measurement/internal/zzlj;->zzb:Ljava/lang/String;

    invoke-virtual {v15, v13}, Lcom/google/android/gms/measurement/internal/zzep;->zzf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    iget-object v15, v4, Lcom/google/android/gms/measurement/internal/zzac;->zzc:Lcom/google/android/gms/measurement/internal/zzlj;

    .line 39
    invoke-virtual {v15}, Lcom/google/android/gms/measurement/internal/zzlj;->zza()Ljava/lang/Object;

    move-result-object v15

    .line 40
    invoke-virtual {v5, v9, v14, v13, v15}, Lcom/google/android/gms/measurement/internal/zzes;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v5, v4, Lcom/google/android/gms/measurement/internal/zzac;->zzg:Lcom/google/android/gms/measurement/internal/zzaw;

    if-eqz v5, :cond_8

    new-instance v9, Lcom/google/android/gms/measurement/internal/zzaw;

    .line 41
    invoke-direct {v9, v5, v10, v11}, Lcom/google/android/gms/measurement/internal/zzaw;-><init>(Lcom/google/android/gms/measurement/internal/zzaw;J)V

    invoke-virtual {v1, v9, v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzY(Lcom/google/android/gms/measurement/internal/zzaw;Lcom/google/android/gms/measurement/internal/zzq;)V

    :cond_8
    iget-object v5, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 42
    invoke-static {v5}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    iget-object v4, v4, Lcom/google/android/gms/measurement/internal/zzac;->zzc:Lcom/google/android/gms/measurement/internal/zzlj;

    .line 43
    iget-object v4, v4, Lcom/google/android/gms/measurement/internal/zzlj;->zzb:Ljava/lang/String;

    invoke-virtual {v5, v2, v4}, Lcom/google/android/gms/measurement/internal/zzam;->zza(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v13, 0x1

    goto :goto_3

    :cond_9
    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 44
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 45
    invoke-static {v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 46
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 47
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzkt;->zzW()V

    if-gez v8, :cond_a

    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 48
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v3

    .line 49
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzeu;->zzk()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v3

    const-string v4, "Invalid time querying expired conditional properties"

    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .line 50
    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    .line 51
    invoke-virtual {v3, v4, v5, v9}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 52
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v3

    goto :goto_4

    :cond_a
    const-string v4, "active<>0 and app_id=? and abs(? - triggered_timestamp) > time_to_live"

    new-array v5, v7, [Ljava/lang/String;

    aput-object v2, v5, v6

    .line 53
    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v9

    const/4 v13, 0x1

    aput-object v9, v5, v13

    .line 54
    invoke-virtual {v3, v4, v5}, Lcom/google/android/gms/measurement/internal/zzam;->zzt(Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    .line 52
    :goto_4
    new-instance v4, Ljava/util/ArrayList;

    .line 55
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 56
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_b
    :goto_5
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_d

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/gms/measurement/internal/zzac;

    if-eqz v5, :cond_b

    .line 57
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v9

    .line 58
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v9

    const-string v13, "User property expired"

    iget-object v14, v5, Lcom/google/android/gms/measurement/internal/zzac;->zza:Ljava/lang/String;

    iget-object v15, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 59
    invoke-virtual {v15}, Lcom/google/android/gms/measurement/internal/zzge;->zzj()Lcom/google/android/gms/measurement/internal/zzep;

    move-result-object v15

    iget-object v7, v5, Lcom/google/android/gms/measurement/internal/zzac;->zzc:Lcom/google/android/gms/measurement/internal/zzlj;

    .line 60
    iget-object v7, v7, Lcom/google/android/gms/measurement/internal/zzlj;->zzb:Ljava/lang/String;

    invoke-virtual {v15, v7}, Lcom/google/android/gms/measurement/internal/zzep;->zzf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iget-object v15, v5, Lcom/google/android/gms/measurement/internal/zzac;->zzc:Lcom/google/android/gms/measurement/internal/zzlj;

    .line 61
    invoke-virtual {v15}, Lcom/google/android/gms/measurement/internal/zzlj;->zza()Ljava/lang/Object;

    move-result-object v15

    .line 62
    invoke-virtual {v9, v13, v14, v7, v15}, Lcom/google/android/gms/measurement/internal/zzes;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v7, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 63
    invoke-static {v7}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    iget-object v9, v5, Lcom/google/android/gms/measurement/internal/zzac;->zzc:Lcom/google/android/gms/measurement/internal/zzlj;

    .line 64
    iget-object v9, v9, Lcom/google/android/gms/measurement/internal/zzlj;->zzb:Ljava/lang/String;

    invoke-virtual {v7, v2, v9}, Lcom/google/android/gms/measurement/internal/zzam;->zzA(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v7, v5, Lcom/google/android/gms/measurement/internal/zzac;->zzk:Lcom/google/android/gms/measurement/internal/zzaw;

    if-eqz v7, :cond_c

    .line 65
    invoke-interface {v4, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_c
    iget-object v7, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 66
    invoke-static {v7}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    iget-object v5, v5, Lcom/google/android/gms/measurement/internal/zzac;->zzc:Lcom/google/android/gms/measurement/internal/zzlj;

    .line 67
    iget-object v5, v5, Lcom/google/android/gms/measurement/internal/zzlj;->zzb:Ljava/lang/String;

    invoke-virtual {v7, v2, v5}, Lcom/google/android/gms/measurement/internal/zzam;->zza(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v7, 0x2

    goto :goto_5

    .line 68
    :cond_d
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_6
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_e

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/gms/measurement/internal/zzaw;

    new-instance v5, Lcom/google/android/gms/measurement/internal/zzaw;

    .line 69
    invoke-direct {v5, v4, v10, v11}, Lcom/google/android/gms/measurement/internal/zzaw;-><init>(Lcom/google/android/gms/measurement/internal/zzaw;J)V

    invoke-virtual {v1, v5, v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzY(Lcom/google/android/gms/measurement/internal/zzaw;Lcom/google/android/gms/measurement/internal/zzq;)V

    goto :goto_6

    :cond_e
    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 70
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    iget-object v4, v12, Lcom/google/android/gms/measurement/internal/zzaw;->zza:Ljava/lang/String;

    .line 71
    invoke-static {v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 72
    invoke-static {v4}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 73
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 74
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzkt;->zzW()V

    if-gez v8, :cond_f

    iget-object v5, v3, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 75
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v5

    .line 76
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzeu;->zzk()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v5

    const-string v6, "Invalid time querying triggered conditional properties"

    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 77
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzge;->zzj()Lcom/google/android/gms/measurement/internal/zzep;

    move-result-object v3

    .line 78
    invoke-virtual {v3, v4}, Lcom/google/android/gms/measurement/internal/zzep;->zzd(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 79
    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    .line 80
    invoke-virtual {v5, v6, v2, v3, v4}, Lcom/google/android/gms/measurement/internal/zzes;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 81
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    goto :goto_7

    :cond_f
    const-string v5, "active=0 and app_id=? and trigger_event_name=? and abs(? - creation_timestamp) <= trigger_timeout"

    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/String;

    aput-object v2, v7, v6

    const/4 v2, 0x1

    aput-object v4, v7, v2

    .line 82
    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    const/4 v4, 0x2

    aput-object v2, v7, v4

    .line 83
    invoke-virtual {v3, v5, v7}, Lcom/google/android/gms/measurement/internal/zzam;->zzt(Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    .line 81
    :goto_7
    new-instance v13, Ljava/util/ArrayList;

    .line 84
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v13, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 85
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_10
    :goto_8
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_13

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v14, v3

    check-cast v14, Lcom/google/android/gms/measurement/internal/zzac;

    if-eqz v14, :cond_10

    iget-object v3, v14, Lcom/google/android/gms/measurement/internal/zzac;->zzc:Lcom/google/android/gms/measurement/internal/zzlj;

    new-instance v15, Lcom/google/android/gms/measurement/internal/zzll;

    iget-object v4, v14, Lcom/google/android/gms/measurement/internal/zzac;->zza:Ljava/lang/String;

    .line 86
    invoke-static {v4}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    iget-object v5, v14, Lcom/google/android/gms/measurement/internal/zzac;->zzb:Ljava/lang/String;

    iget-object v6, v3, Lcom/google/android/gms/measurement/internal/zzlj;->zzb:Ljava/lang/String;

    .line 87
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzlj;->zza()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    move-object v3, v15

    move-wide v7, v10

    invoke-direct/range {v3 .. v9}, Lcom/google/android/gms/measurement/internal/zzll;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/Object;)V

    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 88
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 89
    invoke-virtual {v3, v15}, Lcom/google/android/gms/measurement/internal/zzam;->zzL(Lcom/google/android/gms/measurement/internal/zzll;)Z

    move-result v3

    if-eqz v3, :cond_11

    .line 90
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v3

    .line 91
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v3

    const-string v4, "User property triggered"

    iget-object v5, v14, Lcom/google/android/gms/measurement/internal/zzac;->zza:Ljava/lang/String;

    iget-object v6, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 92
    invoke-virtual {v6}, Lcom/google/android/gms/measurement/internal/zzge;->zzj()Lcom/google/android/gms/measurement/internal/zzep;

    move-result-object v6

    iget-object v7, v15, Lcom/google/android/gms/measurement/internal/zzll;->zzc:Ljava/lang/String;

    .line 93
    invoke-virtual {v6, v7}, Lcom/google/android/gms/measurement/internal/zzep;->zzf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, v15, Lcom/google/android/gms/measurement/internal/zzll;->zze:Ljava/lang/Object;

    .line 94
    invoke-virtual {v3, v4, v5, v6, v7}, Lcom/google/android/gms/measurement/internal/zzes;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_9

    .line 95
    :cond_11
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v3

    .line 96
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v3

    const-string v4, "Too many active user properties, ignoring"

    iget-object v5, v14, Lcom/google/android/gms/measurement/internal/zzac;->zza:Ljava/lang/String;

    invoke-static {v5}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    iget-object v6, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 97
    invoke-virtual {v6}, Lcom/google/android/gms/measurement/internal/zzge;->zzj()Lcom/google/android/gms/measurement/internal/zzep;

    move-result-object v6

    iget-object v7, v15, Lcom/google/android/gms/measurement/internal/zzll;->zzc:Ljava/lang/String;

    .line 98
    invoke-virtual {v6, v7}, Lcom/google/android/gms/measurement/internal/zzep;->zzf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, v15, Lcom/google/android/gms/measurement/internal/zzll;->zze:Ljava/lang/Object;

    .line 99
    invoke-virtual {v3, v4, v5, v6, v7}, Lcom/google/android/gms/measurement/internal/zzes;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 94
    :goto_9
    iget-object v3, v14, Lcom/google/android/gms/measurement/internal/zzac;->zzi:Lcom/google/android/gms/measurement/internal/zzaw;

    if-eqz v3, :cond_12

    .line 100
    invoke-interface {v13, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_12
    new-instance v3, Lcom/google/android/gms/measurement/internal/zzlj;

    .line 101
    invoke-direct {v3, v15}, Lcom/google/android/gms/measurement/internal/zzlj;-><init>(Lcom/google/android/gms/measurement/internal/zzll;)V

    iput-object v3, v14, Lcom/google/android/gms/measurement/internal/zzac;->zzc:Lcom/google/android/gms/measurement/internal/zzlj;

    const/4 v3, 0x1

    iput-boolean v3, v14, Lcom/google/android/gms/measurement/internal/zzac;->zze:Z

    iget-object v4, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 102
    invoke-static {v4}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 103
    invoke-virtual {v4, v14}, Lcom/google/android/gms/measurement/internal/zzam;->zzK(Lcom/google/android/gms/measurement/internal/zzac;)Z

    goto/16 :goto_8

    .line 104
    :cond_13
    invoke-virtual {v1, v12, v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzY(Lcom/google/android/gms/measurement/internal/zzaw;Lcom/google/android/gms/measurement/internal/zzq;)V

    .line 105
    invoke-interface {v13}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_14

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/measurement/internal/zzaw;

    new-instance v4, Lcom/google/android/gms/measurement/internal/zzaw;

    .line 106
    invoke-direct {v4, v3, v10, v11}, Lcom/google/android/gms/measurement/internal/zzaw;-><init>(Lcom/google/android/gms/measurement/internal/zzaw;J)V

    invoke-virtual {v1, v4, v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzY(Lcom/google/android/gms/measurement/internal/zzaw;Lcom/google/android/gms/measurement/internal/zzq;)V

    goto :goto_a

    :cond_14
    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 107
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 108
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzam;->zzC()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 109
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 110
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzam;->zzx()V

    return-void

    :catchall_0
    move-exception v0

    .line 114
    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 109
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 110
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzam;->zzx()V

    .line 111
    throw v0
.end method

.method final zzF(Lcom/google/android/gms/measurement/internal/zzaw;Ljava/lang/String;)V
    .locals 37

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v3, p2

    .line 1
    iget-object v2, v0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 2
    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zzam;->zzj(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzh;

    move-result-object v15

    if-eqz v15, :cond_3

    .line 3
    invoke-virtual {v15}, Lcom/google/android/gms/measurement/internal/zzh;->zzx()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto/16 :goto_1

    .line 5
    :cond_0
    invoke-direct {v0, v15}, Lcom/google/android/gms/measurement/internal/zzlg;->zzad(Lcom/google/android/gms/measurement/internal/zzh;)Ljava/lang/Boolean;

    move-result-object v2

    if-nez v2, :cond_1

    .line 6
    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzaw;->zza:Ljava/lang/String;

    const-string v4, "_ui"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 7
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzk()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v2

    invoke-static/range {p2 .. p2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    const-string v5, "Could not find package. appId"

    invoke-virtual {v2, v5, v4}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    .line 8
    :cond_1
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_2

    .line 28
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v1

    .line 29
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v1

    invoke-static/range {p2 .. p2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    const-string v3, "App version does not match; dropping event. appId"

    .line 30
    invoke-virtual {v1, v3, v2}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    .line 9
    :cond_2
    :goto_0
    new-instance v14, Lcom/google/android/gms/measurement/internal/zzq;

    move-object v2, v14

    .line 10
    invoke-virtual {v15}, Lcom/google/android/gms/measurement/internal/zzh;->zzz()Ljava/lang/String;

    move-result-object v4

    .line 11
    invoke-virtual {v15}, Lcom/google/android/gms/measurement/internal/zzh;->zzx()Ljava/lang/String;

    move-result-object v5

    .line 12
    invoke-virtual {v15}, Lcom/google/android/gms/measurement/internal/zzh;->zzb()J

    move-result-wide v6

    .line 13
    invoke-virtual {v15}, Lcom/google/android/gms/measurement/internal/zzh;->zzw()Ljava/lang/String;

    move-result-object v8

    .line 14
    invoke-virtual {v15}, Lcom/google/android/gms/measurement/internal/zzh;->zzm()J

    move-result-wide v9

    .line 15
    invoke-virtual {v15}, Lcom/google/android/gms/measurement/internal/zzh;->zzj()J

    move-result-wide v11

    const/4 v13, 0x0

    .line 16
    invoke-virtual {v15}, Lcom/google/android/gms/measurement/internal/zzh;->zzal()Z

    move-result v16

    move-object/from16 v36, v14

    move/from16 v14, v16

    const/16 v16, 0x0

    move-object/from16 v31, v15

    move/from16 v15, v16

    .line 17
    invoke-virtual/range {v31 .. v31}, Lcom/google/android/gms/measurement/internal/zzh;->zzy()Ljava/lang/String;

    move-result-object v16

    .line 18
    invoke-virtual/range {v31 .. v31}, Lcom/google/android/gms/measurement/internal/zzh;->zza()J

    const-wide/16 v17, 0x0

    const-wide/16 v19, 0x0

    const/16 v21, 0x0

    .line 19
    invoke-virtual/range {v31 .. v31}, Lcom/google/android/gms/measurement/internal/zzh;->zzak()Z

    move-result v22

    const/16 v23, 0x0

    .line 20
    invoke-virtual/range {v31 .. v31}, Lcom/google/android/gms/measurement/internal/zzh;->zzs()Ljava/lang/String;

    move-result-object v24

    .line 21
    invoke-virtual/range {v31 .. v31}, Lcom/google/android/gms/measurement/internal/zzh;->zzr()Ljava/lang/Boolean;

    move-result-object v25

    .line 22
    invoke-virtual/range {v31 .. v31}, Lcom/google/android/gms/measurement/internal/zzh;->zzk()J

    move-result-wide v26

    .line 23
    invoke-virtual/range {v31 .. v31}, Lcom/google/android/gms/measurement/internal/zzh;->zzD()Ljava/util/List;

    move-result-object v28

    const/16 v29, 0x0

    .line 24
    invoke-virtual {v0, v3}, Lcom/google/android/gms/measurement/internal/zzlg;->zzh(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzai;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Lcom/google/android/gms/measurement/internal/zzai;->zzh()Ljava/lang/String;

    move-result-object v30

    .line 25
    invoke-virtual/range {v31 .. v31}, Lcom/google/android/gms/measurement/internal/zzh;->zzan()Z

    move-result v33

    .line 26
    invoke-virtual/range {v31 .. v31}, Lcom/google/android/gms/measurement/internal/zzh;->zzq()J

    move-result-wide v34

    const/16 v32, 0x0

    const-string v31, ""

    move-object/from16 v3, p2

    invoke-direct/range {v2 .. v35}, Lcom/google/android/gms/measurement/internal/zzq;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;JJLjava/lang/String;ZZLjava/lang/String;JJIZZLjava/lang/String;Ljava/lang/Boolean;JLjava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZJ)V

    move-object/from16 v2, v36

    .line 27
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzG(Lcom/google/android/gms/measurement/internal/zzaw;Lcom/google/android/gms/measurement/internal/zzq;)V

    return-void

    .line 4
    :cond_3
    :goto_1
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzc()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v1

    const-string v2, "No app data available; dropping event"

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method final zzG(Lcom/google/android/gms/measurement/internal/zzaw;Lcom/google/android/gms/measurement/internal/zzq;)V
    .locals 8

    .line 1
    iget-object v0, p2, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzev;->zzb(Lcom/google/android/gms/measurement/internal/zzaw;)Lcom/google/android/gms/measurement/internal/zzev;

    move-result-object p1

    .line 3
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzv()Lcom/google/android/gms/measurement/internal/zzlo;

    move-result-object v0

    iget-object v1, p1, Lcom/google/android/gms/measurement/internal/zzev;->zzd:Landroid/os/Bundle;

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 4
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 5
    iget-object v3, p2, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zzam;->zzi(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v2

    .line 6
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzlo;->zzL(Landroid/os/Bundle;Landroid/os/Bundle;)V

    .line 7
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzv()Lcom/google/android/gms/measurement/internal/zzlo;

    move-result-object v0

    .line 8
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v1

    iget-object v2, p2, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzag;->zzd(Ljava/lang/String;)I

    move-result v1

    .line 9
    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/measurement/internal/zzlo;->zzN(Lcom/google/android/gms/measurement/internal/zzev;I)V

    .line 10
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzev;->zza()Lcom/google/android/gms/measurement/internal/zzaw;

    move-result-object p1

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzaw;->zza:Ljava/lang/String;

    const-string v1, "_cmp"

    .line 11
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 18
    :cond_0
    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzaw;->zzb:Lcom/google/android/gms/measurement/internal/zzau;

    const-string v1, "_cis"

    .line 12
    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzau;->zzg(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "referrer API v2"

    .line 13
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzaw;->zzb:Lcom/google/android/gms/measurement/internal/zzau;

    const-string v1, "gclid"

    .line 14
    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzau;->zzg(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 15
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 16
    new-instance v0, Lcom/google/android/gms/measurement/internal/zzlj;

    iget-wide v4, p1, Lcom/google/android/gms/measurement/internal/zzaw;->zzd:J

    const-string v3, "_lgclid"

    const-string v7, "auto"

    move-object v2, v0

    invoke-direct/range {v2 .. v7}, Lcom/google/android/gms/measurement/internal/zzlj;-><init>(Ljava/lang/String;JLjava/lang/Object;Ljava/lang/String;)V

    .line 17
    invoke-virtual {p0, v0, p2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzW(Lcom/google/android/gms/measurement/internal/zzlj;Lcom/google/android/gms/measurement/internal/zzq;)V

    .line 18
    :cond_1
    :goto_0
    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzE(Lcom/google/android/gms/measurement/internal/zzaw;Lcom/google/android/gms/measurement/internal/zzq;)V

    return-void
.end method

.method final zzH()V
    .locals 1

    iget v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzs:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzs:I

    return-void
.end method

.method final zzI(Ljava/lang/String;ILjava/lang/Throwable;[BLjava/util/Map;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzB()V

    .line 3
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    const/4 v0, 0x0

    if-nez p4, :cond_0

    :try_start_0
    new-array p4, v0, [B

    .line 4
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v1

    const-string v2, "onConfigFetched. Response size"

    array-length v3, p4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 5
    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 6
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzam;->zzw()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 7
    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 8
    invoke-virtual {v1, p1}, Lcom/google/android/gms/measurement/internal/zzam;->zzj(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzh;

    move-result-object v1

    const/16 v2, 0xc8

    const/16 v4, 0x130

    if-eq p2, v2, :cond_1

    const/16 v2, 0xcc

    if-eq p2, v2, :cond_1

    if-ne p2, v4, :cond_2

    const/16 p2, 0x130

    :cond_1
    if-nez p3, :cond_2

    const/4 v2, 0x1

    goto :goto_0

    :cond_2
    const/4 v2, 0x0

    :goto_0
    if-nez v1, :cond_3

    .line 9
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object p2

    .line 10
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzk()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object p2

    const-string p3, "App does not exist in onConfigFetched. appId"

    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    .line 11
    invoke-virtual {p2, p3, p1}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_9

    :cond_3
    const/16 v5, 0x194

    if-nez v2, :cond_7

    if-ne p2, v5, :cond_4

    goto :goto_1

    .line 37
    :cond_4
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzax()Lcom/google/android/gms/common/util/Clock;

    move-result-object p4

    invoke-interface {p4}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide p4

    invoke-virtual {v1, p4, p5}, Lcom/google/android/gms/measurement/internal/zzh;->zzV(J)V

    iget-object p4, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 38
    invoke-static {p4}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 39
    invoke-virtual {p4, v1}, Lcom/google/android/gms/measurement/internal/zzam;->zzD(Lcom/google/android/gms/measurement/internal/zzh;)V

    .line 40
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object p4

    invoke-virtual {p4}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object p4

    const-string p5, "Fetching config failed. code, error"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p4, p5, v1, p3}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object p3, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzc:Lcom/google/android/gms/measurement/internal/zzfv;

    .line 41
    invoke-static {p3}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 42
    invoke-virtual {p3, p1}, Lcom/google/android/gms/measurement/internal/zzfv;->zzl(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzk:Lcom/google/android/gms/measurement/internal/zzka;

    .line 43
    iget-object p1, p1, Lcom/google/android/gms/measurement/internal/zzka;->zzd:Lcom/google/android/gms/measurement/internal/zzff;

    .line 44
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzax()Lcom/google/android/gms/common/util/Clock;

    move-result-object p3

    invoke-interface {p3}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide p3

    invoke-virtual {p1, p3, p4}, Lcom/google/android/gms/measurement/internal/zzff;->zzb(J)V

    const/16 p1, 0x1f7

    if-eq p2, p1, :cond_5

    const/16 p1, 0x1ad

    if-ne p2, p1, :cond_6

    :cond_5
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzk:Lcom/google/android/gms/measurement/internal/zzka;

    .line 45
    iget-object p1, p1, Lcom/google/android/gms/measurement/internal/zzka;->zzb:Lcom/google/android/gms/measurement/internal/zzff;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzax()Lcom/google/android/gms/common/util/Clock;

    move-result-object p2

    invoke-interface {p2}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide p2

    invoke-virtual {p1, p2, p3}, Lcom/google/android/gms/measurement/internal/zzff;->zzb(J)V

    .line 46
    :cond_6
    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzag()V

    goto/16 :goto_9

    :cond_7
    :goto_1
    const/4 p3, 0x0

    if-eqz p5, :cond_8

    const-string v2, "Last-Modified"

    .line 12
    invoke-interface {p5, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    goto :goto_2

    :cond_8
    move-object v2, p3

    :goto_2
    if-eqz v2, :cond_9

    .line 13
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_9

    .line 14
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    goto :goto_3

    :cond_9
    move-object v2, p3

    :goto_3
    if-eqz p5, :cond_a

    const-string v6, "ETag"

    .line 15
    invoke-interface {p5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Ljava/util/List;

    goto :goto_4

    :cond_a
    move-object p5, p3

    :goto_4
    if-eqz p5, :cond_b

    .line 16
    invoke-interface {p5}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_b

    invoke-interface {p5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Ljava/lang/String;

    goto :goto_5

    :cond_b
    move-object p5, p3

    :goto_5
    if-eq p2, v5, :cond_d

    if-ne p2, v4, :cond_c

    goto :goto_6

    .line 32
    :cond_c
    iget-object p3, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzc:Lcom/google/android/gms/measurement/internal/zzfv;

    .line 21
    invoke-static {p3}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 22
    invoke-virtual {p3, p1, p4, v2, p5}, Lcom/google/android/gms/measurement/internal/zzfv;->zzt(Ljava/lang/String;[BLjava/lang/String;Ljava/lang/String;)Z

    goto :goto_7

    .line 16
    :cond_d
    :goto_6
    iget-object p4, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzc:Lcom/google/android/gms/measurement/internal/zzfv;

    .line 17
    invoke-static {p4}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 18
    invoke-virtual {p4, p1}, Lcom/google/android/gms/measurement/internal/zzfv;->zze(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzff;

    move-result-object p4

    if-nez p4, :cond_e

    iget-object p4, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzc:Lcom/google/android/gms/measurement/internal/zzfv;

    .line 19
    invoke-static {p4}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 20
    invoke-virtual {p4, p1, p3, p3, p3}, Lcom/google/android/gms/measurement/internal/zzfv;->zzt(Ljava/lang/String;[BLjava/lang/String;Ljava/lang/String;)Z

    .line 23
    :cond_e
    :goto_7
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzax()Lcom/google/android/gms/common/util/Clock;

    move-result-object p3

    invoke-interface {p3}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide p3

    invoke-virtual {v1, p3, p4}, Lcom/google/android/gms/measurement/internal/zzh;->zzM(J)V

    iget-object p3, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 24
    invoke-static {p3}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 25
    invoke-virtual {p3, v1}, Lcom/google/android/gms/measurement/internal/zzam;->zzD(Lcom/google/android/gms/measurement/internal/zzh;)V

    if-ne p2, v5, :cond_f

    .line 26
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object p2

    .line 27
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzl()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object p2

    const-string p3, "Config not found. Using empty config. appId"

    .line 28
    invoke-virtual {p2, p3, p1}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_8

    .line 29
    :cond_f
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object p1

    .line 30
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object p1

    const-string p3, "Successfully fetched config. Got network response. code, size"

    .line 31
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    .line 32
    invoke-virtual {p1, p3, p2, v3}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 28
    :goto_8
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzd:Lcom/google/android/gms/measurement/internal/zzfa;

    .line 33
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 34
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzfa;->zza()Z

    move-result p1

    if-eqz p1, :cond_10

    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzai()Z

    move-result p1

    if-eqz p1, :cond_10

    .line 36
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzX()V

    goto :goto_9

    .line 35
    :cond_10
    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzag()V

    .line 11
    :goto_9
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 47
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 48
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzam;->zzC()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 49
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 50
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzam;->zzx()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    iput-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzt:Z

    .line 52
    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzae()V

    return-void

    :catchall_0
    move-exception p1

    .line 53
    :try_start_3
    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 49
    invoke-static {p2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 50
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzam;->zzx()V

    .line 51
    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :catchall_1
    move-exception p1

    .line 46
    iput-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzt:Z

    .line 52
    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzae()V

    .line 53
    throw p1
.end method

.method final zzJ(Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzag()V

    return-void
.end method

.method final zzK(ILjava/lang/Throwable;[BLjava/lang/String;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object p4

    invoke-virtual {p4}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzB()V

    const/4 p4, 0x0

    if-nez p3, :cond_0

    :try_start_0
    new-array p3, p4, [B

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzy:Ljava/util/List;

    .line 3
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzy:Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/16 v2, 0xc8

    const/16 v3, 0xcc

    if-eq p1, v2, :cond_1

    if-ne p1, v3, :cond_6

    const/16 p1, 0xcc

    :cond_1
    if-nez p2, :cond_6

    :try_start_1
    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzk:Lcom/google/android/gms/measurement/internal/zzka;

    .line 4
    iget-object p2, p2, Lcom/google/android/gms/measurement/internal/zzka;->zzc:Lcom/google/android/gms/measurement/internal/zzff;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzax()Lcom/google/android/gms/common/util/Clock;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {p2, v2, v3}, Lcom/google/android/gms/measurement/internal/zzff;->zzb(J)V

    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzk:Lcom/google/android/gms/measurement/internal/zzka;

    .line 5
    iget-object p2, p2, Lcom/google/android/gms/measurement/internal/zzka;->zzd:Lcom/google/android/gms/measurement/internal/zzff;

    const-wide/16 v2, 0x0

    invoke-virtual {p2, v2, v3}, Lcom/google/android/gms/measurement/internal/zzff;->zzb(J)V

    .line 6
    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzag()V

    .line 7
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object p2

    .line 8
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object p2

    const-string v4, "Successful upload. Got network response. code, size"

    .line 9
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    array-length p3, p3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {p2, v4, p1, p3}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 10
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 11
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzam;->zzw()V
    :try_end_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 12
    :try_start_2
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Long;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    iget-object p3, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 13
    invoke-static {p3}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 14
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    .line 15
    invoke-virtual {p3}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 16
    invoke-virtual {p3}, Lcom/google/android/gms/measurement/internal/zzkt;->zzW()V

    .line 17
    invoke-virtual {p3}, Lcom/google/android/gms/measurement/internal/zzam;->zzh()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const/4 v6, 0x1

    new-array v7, v6, [Ljava/lang/String;

    .line 18
    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v7, p4
    :try_end_3
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    const-string v4, "queue"

    const-string v5, "rowid=?"

    .line 19
    invoke-virtual {v0, v4, v5, v7}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    if-ne v0, v6, :cond_2

    goto :goto_0

    .line 20
    :cond_2
    new-instance v0, Landroid/database/sqlite/SQLiteException;

    const-string v4, "Deleted fewer rows from queue than expected"

    invoke-direct {v0, v4}, Landroid/database/sqlite/SQLiteException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_4
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :catch_0
    move-exception v0

    .line 33
    :try_start_5
    iget-object p3, p3, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 21
    invoke-virtual {p3}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object p3

    .line 22
    invoke-virtual {p3}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object p3

    const-string v4, "Failed to delete a bundle in a queue table"

    invoke-virtual {p3, v4, v0}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    .line 23
    throw v0
    :try_end_5
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :catch_1
    move-exception p3

    .line 34
    :try_start_6
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzz:Ljava/util/List;

    if-eqz v0, :cond_3

    .line 24
    invoke-interface {v0, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_3

    goto :goto_0

    .line 33
    :cond_3
    throw p3

    .line 20
    :cond_4
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 25
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 26
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzam;->zzC()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    :try_start_7
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 27
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 28
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzam;->zzx()V

    iput-object v1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzz:Ljava/util/List;

    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzd:Lcom/google/android/gms/measurement/internal/zzfa;

    .line 29
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 30
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzfa;->zza()Z

    move-result p1

    if-eqz p1, :cond_5

    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzai()Z

    move-result p1

    if-eqz p1, :cond_5

    .line 32
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzX()V

    goto :goto_1

    :cond_5
    const-wide/16 p1, -0x1

    .line 46
    iput-wide p1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzA:J

    .line 31
    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzag()V

    .line 32
    :goto_1
    iput-wide v2, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zza:J

    goto :goto_2

    :catchall_0
    move-exception p1

    .line 37
    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 27
    invoke-static {p2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 28
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzam;->zzx()V

    .line 34
    throw p1
    :try_end_7
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    :catch_2
    move-exception p1

    .line 35
    :try_start_8
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object p2

    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object p2

    const-string p3, "Database error while trying to delete uploaded bundles"

    invoke-virtual {p2, p3, p1}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    .line 36
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzax()Lcom/google/android/gms/common/util/Clock;

    move-result-object p1

    invoke-interface {p1}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zza:J

    .line 37
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object p1

    const-string p2, "Disable upload, time"

    iget-wide v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zza:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    invoke-virtual {p1, p2, p3}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_2

    .line 38
    :cond_6
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object p3

    .line 39
    invoke-virtual {p3}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object p3

    const-string v1, "Network upload failed. Will retry later. code, error"

    .line 40
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p3, v1, v2, p2}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzk:Lcom/google/android/gms/measurement/internal/zzka;

    .line 41
    iget-object p2, p2, Lcom/google/android/gms/measurement/internal/zzka;->zzd:Lcom/google/android/gms/measurement/internal/zzff;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzax()Lcom/google/android/gms/common/util/Clock;

    move-result-object p3

    invoke-interface {p3}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {p2, v1, v2}, Lcom/google/android/gms/measurement/internal/zzff;->zzb(J)V

    const/16 p2, 0x1f7

    if-eq p1, p2, :cond_7

    const/16 p2, 0x1ad

    if-ne p1, p2, :cond_8

    :cond_7
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzk:Lcom/google/android/gms/measurement/internal/zzka;

    .line 42
    iget-object p1, p1, Lcom/google/android/gms/measurement/internal/zzka;->zzb:Lcom/google/android/gms/measurement/internal/zzff;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzax()Lcom/google/android/gms/common/util/Clock;

    move-result-object p2

    invoke-interface {p2}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide p2

    invoke-virtual {p1, p2, p3}, Lcom/google/android/gms/measurement/internal/zzff;->zzb(J)V

    :cond_8
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 43
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 44
    invoke-virtual {p1, v0}, Lcom/google/android/gms/measurement/internal/zzam;->zzy(Ljava/util/List;)V

    .line 45
    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzag()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 32
    :goto_2
    iput-boolean p4, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzu:Z

    .line 46
    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzae()V

    return-void

    :catchall_1
    move-exception p1

    .line 45
    iput-boolean p4, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzu:Z

    .line 46
    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzae()V

    .line 47
    throw p1
.end method

.method final zzL(Lcom/google/android/gms/measurement/internal/zzq;)V
    .locals 23

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    const-string v3, "_sysu"

    const-string v4, "_sys"

    const-string v5, "com.android.vending"

    const-string v6, "_pfo"

    const-string v0, "_npa"

    const-string v7, "_uwa"

    const-string v8, "app_id=?"

    .line 1
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v9

    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 2
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzB()V

    .line 3
    invoke-static/range {p1 .. p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    iget-object v9, v2, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    invoke-static {v9}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 5
    invoke-static/range {p1 .. p1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzak(Lcom/google/android/gms/measurement/internal/zzq;)Z

    move-result v9

    if-eqz v9, :cond_27

    iget-object v9, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 6
    invoke-static {v9}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 7
    iget-object v10, v2, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    invoke-virtual {v9, v10}, Lcom/google/android/gms/measurement/internal/zzam;->zzj(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzh;

    move-result-object v9

    const-wide/16 v10, 0x0

    if-eqz v9, :cond_0

    .line 8
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzh;->zzz()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-eqz v12, :cond_0

    iget-object v12, v2, Lcom/google/android/gms/measurement/internal/zzq;->zzb:Ljava/lang/String;

    .line 9
    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_0

    .line 10
    invoke-virtual {v9, v10, v11}, Lcom/google/android/gms/measurement/internal/zzh;->zzM(J)V

    iget-object v12, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 11
    invoke-static {v12}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 12
    invoke-virtual {v12, v9}, Lcom/google/android/gms/measurement/internal/zzam;->zzD(Lcom/google/android/gms/measurement/internal/zzh;)V

    iget-object v9, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzc:Lcom/google/android/gms/measurement/internal/zzfv;

    .line 13
    invoke-static {v9}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 14
    iget-object v12, v2, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    invoke-virtual {v9, v12}, Lcom/google/android/gms/measurement/internal/zzfv;->zzm(Ljava/lang/String;)V

    .line 15
    :cond_0
    iget-boolean v9, v2, Lcom/google/android/gms/measurement/internal/zzq;->zzh:Z

    if-nez v9, :cond_1

    .line 16
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzd(Lcom/google/android/gms/measurement/internal/zzq;)Lcom/google/android/gms/measurement/internal/zzh;

    return-void

    .line 17
    :cond_1
    iget-wide v12, v2, Lcom/google/android/gms/measurement/internal/zzq;->zzm:J

    cmp-long v9, v12, v10

    if-nez v9, :cond_2

    .line 18
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzax()Lcom/google/android/gms/common/util/Clock;

    move-result-object v9

    invoke-interface {v9}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v12

    :cond_2
    iget-object v9, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 19
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzge;->zzg()Lcom/google/android/gms/measurement/internal/zzaq;

    move-result-object v9

    .line 20
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzaq;->zzd()V

    .line 21
    iget v9, v2, Lcom/google/android/gms/measurement/internal/zzq;->zzn:I

    const/4 v15, 0x1

    if-eqz v9, :cond_3

    if-eq v9, v15, :cond_3

    .line 22
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v16

    .line 23
    invoke-virtual/range {v16 .. v16}, Lcom/google/android/gms/measurement/internal/zzeu;->zzk()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v14

    iget-object v10, v2, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    invoke-static {v10}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    .line 24
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v11, "Incorrect app type, assuming installed app. appId, appType"

    .line 25
    invoke-virtual {v14, v11, v10, v9}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    const/4 v9, 0x0

    :cond_3
    iget-object v10, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 26
    invoke-static {v10}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 27
    invoke-virtual {v10}, Lcom/google/android/gms/measurement/internal/zzam;->zzw()V

    :try_start_0
    iget-object v10, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 28
    invoke-static {v10}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 29
    iget-object v11, v2, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    .line 30
    invoke-virtual {v10, v11, v0}, Lcom/google/android/gms/measurement/internal/zzam;->zzp(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzll;

    move-result-object v10

    move-object v11, v3

    move-object/from16 v20, v4

    if-eqz v10, :cond_5

    const-string v14, "auto"

    iget-object v3, v10, Lcom/google/android/gms/measurement/internal/zzll;->zzb:Ljava/lang/String;

    .line 31
    invoke-virtual {v14, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    goto :goto_0

    :cond_4
    const/4 v4, 0x1

    goto :goto_2

    .line 32
    :cond_5
    :goto_0
    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzq;->zzr:Ljava/lang/Boolean;

    if-eqz v3, :cond_8

    .line 33
    new-instance v0, Lcom/google/android/gms/measurement/internal/zzlj;

    const-string v3, "_npa"

    .line 34
    iget-object v4, v2, Lcom/google/android/gms/measurement/internal/zzq;->zzr:Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eq v15, v4, :cond_6

    const-wide/16 v18, 0x0

    goto :goto_1

    :cond_6
    const-wide/16 v18, 0x1

    :goto_1
    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    const-string v19, "auto"

    const/4 v4, 0x0

    move-object v14, v0

    const/4 v4, 0x1

    move-object v15, v3

    move-wide/from16 v16, v12

    invoke-direct/range {v14 .. v19}, Lcom/google/android/gms/measurement/internal/zzlj;-><init>(Ljava/lang/String;JLjava/lang/Object;Ljava/lang/String;)V

    if-eqz v10, :cond_7

    iget-object v3, v10, Lcom/google/android/gms/measurement/internal/zzll;->zze:Ljava/lang/Object;

    iget-object v10, v0, Lcom/google/android/gms/measurement/internal/zzlj;->zzd:Ljava/lang/Long;

    .line 35
    invoke-virtual {v3, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_9

    .line 36
    :cond_7
    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzW(Lcom/google/android/gms/measurement/internal/zzlj;Lcom/google/android/gms/measurement/internal/zzq;)V

    goto :goto_2

    :cond_8
    const/4 v4, 0x1

    if-eqz v10, :cond_9

    .line 37
    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzP(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzq;)V

    .line 36
    :cond_9
    :goto_2
    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 38
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 39
    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    invoke-static {v3}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0, v3}, Lcom/google/android/gms/measurement/internal/zzam;->zzj(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzh;

    move-result-object v0

    if-eqz v0, :cond_c

    .line 40
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzv()Lcom/google/android/gms/measurement/internal/zzlo;

    move-result-object v10

    iget-object v14, v2, Lcom/google/android/gms/measurement/internal/zzq;->zzb:Ljava/lang/String;

    .line 41
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzh;->zzz()Ljava/lang/String;

    move-result-object v15

    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzq;->zzq:Ljava/lang/String;

    .line 42
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzh;->zzs()Ljava/lang/String;

    move-result-object v4

    .line 43
    invoke-virtual {v10, v14, v15, v3, v4}, Lcom/google/android/gms/measurement/internal/zzlo;->zzao(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 44
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v3

    .line 45
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzeu;->zzk()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v3

    const-string v4, "New GMP App Id passed in. Removing cached database data. appId"

    .line 46
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzh;->zzu()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    .line 47
    invoke-virtual {v3, v4, v10}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 48
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 49
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzh;->zzu()Ljava/lang/String;

    move-result-object v4

    .line 50
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzkt;->zzW()V

    .line 51
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 52
    invoke-static {v4}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    :try_start_1
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzam;->zzh()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const/4 v10, 0x1

    new-array v14, v10, [Ljava/lang/String;

    const/4 v10, 0x0

    aput-object v4, v14, v10

    const-string v10, "events"

    .line 54
    invoke-virtual {v0, v10, v8, v14}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v10

    const-string v15, "user_attributes"

    .line 55
    invoke-virtual {v0, v15, v8, v14}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v15

    add-int/2addr v10, v15

    const-string v15, "conditional_properties"

    .line 56
    invoke-virtual {v0, v15, v8, v14}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v15

    add-int/2addr v10, v15

    const-string v15, "apps"

    .line 57
    invoke-virtual {v0, v15, v8, v14}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v15

    add-int/2addr v10, v15

    const-string v15, "raw_events"

    .line 58
    invoke-virtual {v0, v15, v8, v14}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v15

    add-int/2addr v10, v15

    const-string v15, "raw_events_metadata"

    .line 59
    invoke-virtual {v0, v15, v8, v14}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v15

    add-int/2addr v10, v15

    const-string v15, "event_filters"

    .line 60
    invoke-virtual {v0, v15, v8, v14}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v15

    add-int/2addr v10, v15

    const-string v15, "property_filters"

    .line 61
    invoke-virtual {v0, v15, v8, v14}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v15

    add-int/2addr v10, v15

    const-string v15, "audience_filter_values"

    .line 62
    invoke-virtual {v0, v15, v8, v14}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v15

    add-int/2addr v10, v15

    const-string v15, "consent_settings"

    .line 63
    invoke-virtual {v0, v15, v8, v14}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v15

    add-int/2addr v10, v15

    .line 64
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzph;->zzc()Z

    iget-object v15, v3, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 65
    invoke-virtual {v15}, Lcom/google/android/gms/measurement/internal/zzge;->zzf()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v15
    :try_end_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object/from16 v21, v11

    .line 64
    :try_start_2
    sget-object v11, Lcom/google/android/gms/measurement/internal/zzeh;->zzat:Lcom/google/android/gms/measurement/internal/zzeg;
    :try_end_2
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-object/from16 v22, v6

    const/4 v6, 0x0

    :try_start_3
    invoke-virtual {v15, v6, v11}, Lcom/google/android/gms/measurement/internal/zzag;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzeg;)Z

    move-result v11

    if-eqz v11, :cond_a

    const-string v6, "default_event_params"

    .line 66
    invoke-virtual {v0, v6, v8, v14}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    add-int/2addr v10, v0

    :cond_a
    if-lez v10, :cond_b

    iget-object v0, v3, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 67
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    .line 68
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v0

    const-string v6, "Deleted application data. app, records"

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v0, v6, v4, v8}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_3
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_4

    :catch_0
    move-exception v0

    goto :goto_3

    :catch_1
    move-exception v0

    move-object/from16 v22, v6

    goto :goto_3

    :catch_2
    move-exception v0

    move-object/from16 v22, v6

    move-object/from16 v21, v11

    .line 201
    :goto_3
    :try_start_4
    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 69
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v3

    .line 70
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v3

    const-string v6, "Error deleting application data. appId, error"

    invoke-static {v4}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 71
    invoke-virtual {v3, v6, v4, v0}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_b
    :goto_4
    const/4 v0, 0x0

    goto :goto_5

    :cond_c
    move-object/from16 v22, v6

    move-object/from16 v21, v11

    :goto_5
    if-eqz v0, :cond_f

    .line 72
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzh;->zzb()J

    move-result-wide v3

    const-wide/32 v10, -0x80000000

    cmp-long v6, v3, v10

    if-eqz v6, :cond_d

    .line 73
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzh;->zzb()J

    move-result-wide v3

    iget-wide v14, v2, Lcom/google/android/gms/measurement/internal/zzq;->zzj:J

    cmp-long v6, v3, v14

    if-eqz v6, :cond_d

    const/4 v15, 0x1

    goto :goto_6

    :cond_d
    const/4 v15, 0x0

    .line 74
    :goto_6
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzh;->zzx()Ljava/lang/String;

    move-result-object v3

    .line 75
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzh;->zzb()J

    move-result-wide v16

    cmp-long v0, v16, v10

    if-nez v0, :cond_e

    if-eqz v3, :cond_e

    iget-object v0, v2, Lcom/google/android/gms/measurement/internal/zzq;->zzc:Ljava/lang/String;

    .line 76
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e

    const/4 v0, 0x1

    goto :goto_7

    :cond_e
    const/4 v0, 0x0

    :goto_7
    or-int/2addr v0, v15

    if-eqz v0, :cond_f

    new-instance v0, Landroid/os/Bundle;

    .line 77
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v4, "_pv"

    .line 78
    invoke-virtual {v0, v4, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    new-instance v3, Lcom/google/android/gms/measurement/internal/zzaw;

    const-string v15, "_au"

    new-instance v4, Lcom/google/android/gms/measurement/internal/zzau;

    invoke-direct {v4, v0}, Lcom/google/android/gms/measurement/internal/zzau;-><init>(Landroid/os/Bundle;)V

    const-string v17, "auto"

    move-object v14, v3

    move-object/from16 v16, v4

    move-wide/from16 v18, v12

    invoke-direct/range {v14 .. v19}, Lcom/google/android/gms/measurement/internal/zzaw;-><init>(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzau;Ljava/lang/String;J)V

    .line 80
    invoke-virtual {v1, v3, v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzE(Lcom/google/android/gms/measurement/internal/zzaw;Lcom/google/android/gms/measurement/internal/zzq;)V

    .line 81
    :cond_f
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzd(Lcom/google/android/gms/measurement/internal/zzq;)Lcom/google/android/gms/measurement/internal/zzh;

    if-nez v9, :cond_10

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 82
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 83
    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    const-string v4, "_f"

    .line 84
    invoke-virtual {v0, v3, v4}, Lcom/google/android/gms/measurement/internal/zzam;->zzn(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzas;

    move-result-object v0

    const/4 v15, 0x0

    goto :goto_8

    .line 196
    :cond_10
    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 85
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 86
    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    const-string v4, "_v"

    .line 87
    invoke-virtual {v0, v3, v4}, Lcom/google/android/gms/measurement/internal/zzam;->zzn(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzas;

    move-result-object v0

    const/4 v15, 0x1

    :goto_8
    if-nez v0, :cond_25

    const-wide/32 v3, 0x36ee80

    .line 84
    div-long v8, v12, v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    const-wide/16 v10, 0x1

    add-long/2addr v8, v10

    mul-long v8, v8, v3

    const-string v3, "_dac"

    const-string v4, "_et"

    const-string v6, "_r"

    const-string v10, "_c"

    if-nez v15, :cond_23

    .line 101
    :try_start_5
    new-instance v0, Lcom/google/android/gms/measurement/internal/zzlj;

    const-string v15, "_fot"

    .line 102
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    const-string v19, "auto"

    move-object v14, v0

    move-wide/from16 v16, v12

    invoke-direct/range {v14 .. v19}, Lcom/google/android/gms/measurement/internal/zzlj;-><init>(Ljava/lang/String;JLjava/lang/Object;Ljava/lang/String;)V

    .line 103
    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzW(Lcom/google/android/gms/measurement/internal/zzlj;Lcom/google/android/gms/measurement/internal/zzq;)V

    .line 104
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzm:Lcom/google/android/gms/measurement/internal/zzfm;

    .line 105
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Lcom/google/android/gms/measurement/internal/zzfm;

    iget-object v0, v2, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    if-eqz v0, :cond_17

    .line 106
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_11

    goto/16 :goto_a

    .line 175
    :cond_11
    iget-object v9, v8, Lcom/google/android/gms/measurement/internal/zzfm;->zza:Lcom/google/android/gms/measurement/internal/zzge;

    .line 110
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzge;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v9

    .line 111
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 112
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzfm;->zza()Z

    move-result v9

    if-nez v9, :cond_12

    iget-object v0, v8, Lcom/google/android/gms/measurement/internal/zzfm;->zza:Lcom/google/android/gms/measurement/internal/zzge;

    .line 113
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeu;->zzi()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v0

    const-string v5, "Install Referrer Reporter is not available"

    invoke-virtual {v0, v5}, Lcom/google/android/gms/measurement/internal/zzes;->zza(Ljava/lang/String;)V

    goto/16 :goto_b

    :cond_12
    new-instance v9, Lcom/google/android/gms/measurement/internal/zzfl;

    invoke-direct {v9, v8, v0}, Lcom/google/android/gms/measurement/internal/zzfl;-><init>(Lcom/google/android/gms/measurement/internal/zzfm;Ljava/lang/String;)V

    iget-object v0, v8, Lcom/google/android/gms/measurement/internal/zzfm;->zza:Lcom/google/android/gms/measurement/internal/zzge;

    .line 114
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v0

    .line 115
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    new-instance v0, Landroid/content/Intent;

    const-string v11, "com.google.android.finsky.BIND_GET_INSTALL_REFERRER_SERVICE"

    .line 116
    invoke-direct {v0, v11}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    new-instance v11, Landroid/content/ComponentName;

    const-string v14, "com.google.android.finsky.externalreferrer.GetInstallReferrerService"

    .line 117
    invoke-direct {v11, v5, v14}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v11}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    iget-object v11, v8, Lcom/google/android/gms/measurement/internal/zzfm;->zza:Lcom/google/android/gms/measurement/internal/zzge;

    .line 118
    invoke-virtual {v11}, Lcom/google/android/gms/measurement/internal/zzge;->zzaw()Landroid/content/Context;

    move-result-object v11

    invoke-virtual {v11}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v11

    if-nez v11, :cond_13

    iget-object v0, v8, Lcom/google/android/gms/measurement/internal/zzfm;->zza:Lcom/google/android/gms/measurement/internal/zzge;

    .line 119
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    .line 120
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeu;->zzm()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v0

    const-string v5, "Failed to obtain Package Manager to verify binding conditions for Install Referrer"

    .line 121
    invoke-virtual {v0, v5}, Lcom/google/android/gms/measurement/internal/zzes;->zza(Ljava/lang/String;)V

    goto/16 :goto_b

    :cond_13
    const/4 v14, 0x0

    .line 122
    invoke-virtual {v11, v0, v14}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v11

    if-eqz v11, :cond_16

    .line 123
    invoke-interface {v11}, Ljava/util/List;->isEmpty()Z

    move-result v15

    if-nez v15, :cond_16

    .line 127
    invoke-interface {v11, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/content/pm/ResolveInfo;

    .line 128
    iget-object v14, v11, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    if-eqz v14, :cond_18

    .line 129
    iget-object v14, v11, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    iget-object v14, v14, Landroid/content/pm/ServiceInfo;->packageName:Ljava/lang/String;

    .line 130
    iget-object v11, v11, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    iget-object v11, v11, Landroid/content/pm/ServiceInfo;->name:Ljava/lang/String;

    if-eqz v11, :cond_15

    .line 131
    invoke-virtual {v5, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_15

    .line 112
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzfm;->zza()Z

    move-result v5

    if-eqz v5, :cond_15

    new-instance v5, Landroid/content/Intent;

    .line 135
    invoke-direct {v5, v0}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 136
    :try_start_6
    invoke-static {}, Lcom/google/android/gms/common/stats/ConnectionTracker;->getInstance()Lcom/google/android/gms/common/stats/ConnectionTracker;

    move-result-object v0

    iget-object v11, v8, Lcom/google/android/gms/measurement/internal/zzfm;->zza:Lcom/google/android/gms/measurement/internal/zzge;

    .line 137
    invoke-virtual {v11}, Lcom/google/android/gms/measurement/internal/zzge;->zzaw()Landroid/content/Context;

    move-result-object v11

    const/4 v14, 0x1

    .line 138
    invoke-virtual {v0, v11, v5, v9, v14}, Lcom/google/android/gms/common/stats/ConnectionTracker;->bindService(Landroid/content/Context;Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v0

    iget-object v5, v8, Lcom/google/android/gms/measurement/internal/zzfm;->zza:Lcom/google/android/gms/measurement/internal/zzge;

    .line 139
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v5

    .line 140
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v5

    const-string v9, "Install Referrer Service is"

    if-eqz v0, :cond_14

    const-string v0, "available"

    goto :goto_9

    :cond_14
    const-string v0, "not available"

    .line 141
    :goto_9
    invoke-virtual {v5, v9, v0}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_6
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_b

    :catch_3
    move-exception v0

    .line 182
    :try_start_7
    iget-object v5, v8, Lcom/google/android/gms/measurement/internal/zzfm;->zza:Lcom/google/android/gms/measurement/internal/zzge;

    .line 142
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v5

    .line 143
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v5

    const-string v8, "Exception occurred while binding to Install Referrer Service"

    .line 144
    invoke-virtual {v0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v0

    .line 145
    invoke-virtual {v5, v8, v0}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_b

    .line 141
    :cond_15
    iget-object v0, v8, Lcom/google/android/gms/measurement/internal/zzfm;->zza:Lcom/google/android/gms/measurement/internal/zzge;

    .line 132
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    .line 133
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeu;->zzk()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v0

    const-string v5, "Play Store version 8.3.73 or higher required for Install Referrer"

    .line 134
    invoke-virtual {v0, v5}, Lcom/google/android/gms/measurement/internal/zzes;->zza(Ljava/lang/String;)V

    goto :goto_b

    :cond_16
    iget-object v0, v8, Lcom/google/android/gms/measurement/internal/zzfm;->zza:Lcom/google/android/gms/measurement/internal/zzge;

    .line 124
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    .line 125
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeu;->zzi()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v0

    const-string v5, "Play Service for fetching Install Referrer is unavailable on device"

    .line 126
    invoke-virtual {v0, v5}, Lcom/google/android/gms/measurement/internal/zzes;->zza(Ljava/lang/String;)V

    goto :goto_b

    .line 106
    :cond_17
    :goto_a
    iget-object v0, v8, Lcom/google/android/gms/measurement/internal/zzfm;->zza:Lcom/google/android/gms/measurement/internal/zzge;

    .line 107
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    .line 108
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeu;->zzm()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v0

    const-string v5, "Install Referrer Reporter was called with invalid app package name"

    .line 109
    invoke-virtual {v0, v5}, Lcom/google/android/gms/measurement/internal/zzes;->zza(Ljava/lang/String;)V

    .line 146
    :cond_18
    :goto_b
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 147
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzB()V

    new-instance v5, Landroid/os/Bundle;

    .line 148
    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    const-wide/16 v8, 0x1

    .line 149
    invoke-virtual {v5, v10, v8, v9}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 150
    invoke-virtual {v5, v6, v8, v9}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-wide/16 v8, 0x0

    .line 151
    invoke-virtual {v5, v7, v8, v9}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    move-object/from16 v6, v22

    .line 152
    invoke-virtual {v5, v6, v8, v9}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    move-object/from16 v10, v20

    .line 153
    invoke-virtual {v5, v10, v8, v9}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    move-object/from16 v11, v21

    .line 154
    invoke-virtual {v5, v11, v8, v9}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-wide/16 v8, 0x1

    .line 155
    invoke-virtual {v5, v4, v8, v9}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 156
    iget-boolean v0, v2, Lcom/google/android/gms/measurement/internal/zzq;->zzp:Z

    if-eqz v0, :cond_19

    .line 157
    invoke-virtual {v5, v3, v8, v9}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 158
    :cond_19
    iget-object v0, v2, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Ljava/lang/String;

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 159
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 160
    invoke-static {v3}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 161
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 162
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkt;->zzW()V

    const-string v4, "first_open_count"

    .line 163
    invoke-virtual {v0, v3, v4}, Lcom/google/android/gms/measurement/internal/zzam;->zzc(Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v8

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 164
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzaw()Landroid/content/Context;

    move-result-object v0

    .line 165
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    if-nez v0, :cond_1b

    .line 187
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    .line 188
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v0

    const-string v4, "PackageManager is null, first open report might be inaccurate. appId"

    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 189
    invoke-virtual {v0, v4, v3}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    :cond_1a
    :goto_c
    const-wide/16 v3, 0x0

    goto/16 :goto_13

    .line 200
    :cond_1b
    :try_start_8
    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 166
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzaw()Landroid/content/Context;

    move-result-object v0

    .line 167
    invoke-static {v0}, Lcom/google/android/gms/common/wrappers/Wrappers;->packageManager(Landroid/content/Context;)Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;

    move-result-object v0

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0
    :try_end_8
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_8 .. :try_end_8} :catch_4
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto :goto_d

    :catch_4
    move-exception v0

    .line 168
    :try_start_9
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v4

    .line 169
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v4

    const-string v14, "Package info is null, first open report might be inaccurate. appId"

    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v15

    .line 170
    invoke-virtual {v4, v14, v15, v0}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    const/4 v0, 0x0

    :goto_d
    if-eqz v0, :cond_20

    .line 171
    iget-wide v14, v0, Landroid/content/pm/PackageInfo;->firstInstallTime:J

    const-wide/16 v16, 0x0

    cmp-long v4, v14, v16

    if-eqz v4, :cond_20

    .line 172
    iget-wide v14, v0, Landroid/content/pm/PackageInfo;->firstInstallTime:J

    move-object/from16 v20, v10

    move-object/from16 v21, v11

    iget-wide v10, v0, Landroid/content/pm/PackageInfo;->lastUpdateTime:J

    cmp-long v0, v14, v10

    if-eqz v0, :cond_1e

    .line 173
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v0

    sget-object v4, Lcom/google/android/gms/measurement/internal/zzeh;->zzad:Lcom/google/android/gms/measurement/internal/zzeg;

    const/4 v10, 0x0

    invoke-virtual {v0, v10, v4}, Lcom/google/android/gms/measurement/internal/zzag;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzeg;)Z

    move-result v0

    if-eqz v0, :cond_1d

    const-wide/16 v14, 0x0

    cmp-long v0, v8, v14

    if-nez v0, :cond_1c

    const-wide/16 v14, 0x1

    .line 174
    invoke-virtual {v5, v7, v14, v15}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-wide/16 v8, 0x0

    :cond_1c
    :goto_e
    const/4 v15, 0x0

    goto :goto_f

    :cond_1d
    const-wide/16 v14, 0x1

    .line 175
    invoke-virtual {v5, v7, v14, v15}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    goto :goto_e

    :cond_1e
    const/4 v10, 0x0

    const/4 v15, 0x1

    .line 174
    :goto_f
    new-instance v0, Lcom/google/android/gms/measurement/internal/zzlj;

    const-string v4, "_fi"

    const/4 v7, 0x1

    if-eq v7, v15, :cond_1f

    const-wide/16 v14, 0x0

    goto :goto_10

    :cond_1f
    const-wide/16 v14, 0x1

    .line 176
    :goto_10
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    const-string v19, "auto"

    move-object v14, v0

    move-object v15, v4

    move-wide/from16 v16, v12

    invoke-direct/range {v14 .. v19}, Lcom/google/android/gms/measurement/internal/zzlj;-><init>(Ljava/lang/String;JLjava/lang/Object;Ljava/lang/String;)V

    .line 177
    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzW(Lcom/google/android/gms/measurement/internal/zzlj;Lcom/google/android/gms/measurement/internal/zzq;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto :goto_11

    :cond_20
    move-object/from16 v20, v10

    move-object/from16 v21, v11

    const/4 v10, 0x0

    :goto_11
    :try_start_a
    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 178
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzaw()Landroid/content/Context;

    move-result-object v0

    .line 179
    invoke-static {v0}, Lcom/google/android/gms/common/wrappers/Wrappers;->packageManager(Landroid/content/Context;)Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;

    move-result-object v0

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v3
    :try_end_a
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_a .. :try_end_a} :catch_5
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto :goto_12

    :catch_5
    move-exception v0

    .line 180
    :try_start_b
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v4

    .line 181
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v4

    const-string v7, "Application info is null, first open report might be inaccurate. appId"

    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 182
    invoke-virtual {v4, v7, v3, v0}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    move-object v3, v10

    :goto_12
    if-eqz v3, :cond_1a

    .line 183
    iget v0, v3, Landroid/content/pm/ApplicationInfo;->flags:I

    const/4 v4, 0x1

    and-int/2addr v0, v4

    if-eqz v0, :cond_21

    move-object/from16 v4, v20

    const-wide/16 v10, 0x1

    .line 184
    invoke-virtual {v5, v4, v10, v11}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 185
    :cond_21
    iget v0, v3, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit16 v0, v0, 0x80

    if-eqz v0, :cond_1a

    move-object/from16 v3, v21

    const-wide/16 v10, 0x1

    .line 186
    invoke-virtual {v5, v3, v10, v11}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    goto/16 :goto_c

    :goto_13
    cmp-long v0, v8, v3

    if-ltz v0, :cond_22

    .line 190
    invoke-virtual {v5, v6, v8, v9}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 191
    :cond_22
    new-instance v0, Lcom/google/android/gms/measurement/internal/zzaw;

    const-string v15, "_f"

    new-instance v3, Lcom/google/android/gms/measurement/internal/zzau;

    invoke-direct {v3, v5}, Lcom/google/android/gms/measurement/internal/zzau;-><init>(Landroid/os/Bundle;)V

    const-string v17, "auto"

    move-object v14, v0

    move-object/from16 v16, v3

    move-wide/from16 v18, v12

    invoke-direct/range {v14 .. v19}, Lcom/google/android/gms/measurement/internal/zzaw;-><init>(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzau;Ljava/lang/String;J)V

    .line 192
    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzG(Lcom/google/android/gms/measurement/internal/zzaw;Lcom/google/android/gms/measurement/internal/zzq;)V

    goto :goto_14

    .line 88
    :cond_23
    new-instance v0, Lcom/google/android/gms/measurement/internal/zzlj;

    const-string v15, "_fvt"

    .line 89
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    const-string v19, "auto"

    move-object v14, v0

    move-wide/from16 v16, v12

    invoke-direct/range {v14 .. v19}, Lcom/google/android/gms/measurement/internal/zzlj;-><init>(Ljava/lang/String;JLjava/lang/Object;Ljava/lang/String;)V

    .line 90
    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzW(Lcom/google/android/gms/measurement/internal/zzlj;Lcom/google/android/gms/measurement/internal/zzq;)V

    .line 91
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 92
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzB()V

    new-instance v0, Landroid/os/Bundle;

    .line 93
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-wide/16 v7, 0x1

    .line 94
    invoke-virtual {v0, v10, v7, v8}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 95
    invoke-virtual {v0, v6, v7, v8}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 96
    invoke-virtual {v0, v4, v7, v8}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 97
    iget-boolean v4, v2, Lcom/google/android/gms/measurement/internal/zzq;->zzp:Z

    if-eqz v4, :cond_24

    .line 98
    invoke-virtual {v0, v3, v7, v8}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 99
    :cond_24
    new-instance v3, Lcom/google/android/gms/measurement/internal/zzaw;

    const-string v15, "_v"

    new-instance v4, Lcom/google/android/gms/measurement/internal/zzau;

    invoke-direct {v4, v0}, Lcom/google/android/gms/measurement/internal/zzau;-><init>(Landroid/os/Bundle;)V

    const-string v17, "auto"

    move-object v14, v3

    move-object/from16 v16, v4

    move-wide/from16 v18, v12

    invoke-direct/range {v14 .. v19}, Lcom/google/android/gms/measurement/internal/zzaw;-><init>(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzau;Ljava/lang/String;J)V

    .line 100
    invoke-virtual {v1, v3, v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzG(Lcom/google/android/gms/measurement/internal/zzaw;Lcom/google/android/gms/measurement/internal/zzq;)V

    goto :goto_14

    .line 193
    :cond_25
    iget-boolean v0, v2, Lcom/google/android/gms/measurement/internal/zzq;->zzi:Z

    if-eqz v0, :cond_26

    new-instance v0, Landroid/os/Bundle;

    .line 194
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 195
    new-instance v3, Lcom/google/android/gms/measurement/internal/zzaw;

    const-string v15, "_cd"

    new-instance v4, Lcom/google/android/gms/measurement/internal/zzau;

    invoke-direct {v4, v0}, Lcom/google/android/gms/measurement/internal/zzau;-><init>(Landroid/os/Bundle;)V

    const-string v17, "auto"

    move-object v14, v3

    move-object/from16 v16, v4

    move-wide/from16 v18, v12

    invoke-direct/range {v14 .. v19}, Lcom/google/android/gms/measurement/internal/zzaw;-><init>(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzau;Ljava/lang/String;J)V

    .line 196
    invoke-virtual {v1, v3, v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzG(Lcom/google/android/gms/measurement/internal/zzaw;Lcom/google/android/gms/measurement/internal/zzq;)V

    .line 192
    :cond_26
    :goto_14
    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 197
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 198
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzam;->zzC()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 199
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 200
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzam;->zzx()V

    return-void

    :catchall_0
    move-exception v0

    .line 37
    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 199
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 200
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzam;->zzx()V

    .line 201
    throw v0

    :cond_27
    return-void
.end method

.method final zzM()V
    .locals 1

    iget v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzr:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzr:I

    return-void
.end method

.method final zzN(Lcom/google/android/gms/measurement/internal/zzac;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzac;->zza:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzac(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzO(Lcom/google/android/gms/measurement/internal/zzac;Lcom/google/android/gms/measurement/internal/zzq;)V

    :cond_0
    return-void
.end method

.method final zzO(Lcom/google/android/gms/measurement/internal/zzac;Lcom/google/android/gms/measurement/internal/zzq;)V
    .locals 10

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzac;->zza:Ljava/lang/String;

    .line 2
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzac;->zzc:Lcom/google/android/gms/measurement/internal/zzlj;

    .line 3
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzac;->zzc:Lcom/google/android/gms/measurement/internal/zzlj;

    .line 4
    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzlj;->zzb:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 5
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 6
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzB()V

    .line 7
    invoke-static {p2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzak(Lcom/google/android/gms/measurement/internal/zzq;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 8
    :cond_0
    iget-boolean v0, p2, Lcom/google/android/gms/measurement/internal/zzq;->zzh:Z

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 9
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 10
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzam;->zzw()V

    .line 11
    :try_start_0
    invoke-virtual {p0, p2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzd(Lcom/google/android/gms/measurement/internal/zzq;)Lcom/google/android/gms/measurement/internal/zzh;

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzac;->zza:Ljava/lang/String;

    .line 12
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 13
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    iget-object v1, p1, Lcom/google/android/gms/measurement/internal/zzac;->zzc:Lcom/google/android/gms/measurement/internal/zzlj;

    .line 14
    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzlj;->zzb:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/measurement/internal/zzam;->zzk(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzac;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 15
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v1

    .line 16
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzc()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v1

    const-string v3, "Removing conditional user property"

    iget-object v4, p1, Lcom/google/android/gms/measurement/internal/zzac;->zza:Ljava/lang/String;

    iget-object v5, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 17
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzge;->zzj()Lcom/google/android/gms/measurement/internal/zzep;

    move-result-object v5

    iget-object v6, p1, Lcom/google/android/gms/measurement/internal/zzac;->zzc:Lcom/google/android/gms/measurement/internal/zzlj;

    .line 18
    iget-object v6, v6, Lcom/google/android/gms/measurement/internal/zzlj;->zzb:Ljava/lang/String;

    invoke-virtual {v5, v6}, Lcom/google/android/gms/measurement/internal/zzep;->zzf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 19
    invoke-virtual {v1, v3, v4, v5}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 20
    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    iget-object v3, p1, Lcom/google/android/gms/measurement/internal/zzac;->zzc:Lcom/google/android/gms/measurement/internal/zzlj;

    .line 21
    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzlj;->zzb:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/measurement/internal/zzam;->zza(Ljava/lang/String;Ljava/lang/String;)I

    iget-boolean v1, v0, Lcom/google/android/gms/measurement/internal/zzac;->zze:Z

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 22
    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    iget-object v3, p1, Lcom/google/android/gms/measurement/internal/zzac;->zzc:Lcom/google/android/gms/measurement/internal/zzlj;

    .line 23
    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzlj;->zzb:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/measurement/internal/zzam;->zzA(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    iget-object v1, p1, Lcom/google/android/gms/measurement/internal/zzac;->zzk:Lcom/google/android/gms/measurement/internal/zzaw;

    if-eqz v1, :cond_4

    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzaw;->zzb:Lcom/google/android/gms/measurement/internal/zzau;

    if-eqz v1, :cond_2

    .line 24
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzau;->zzc()Landroid/os/Bundle;

    move-result-object v1

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    :goto_0
    move-object v4, v1

    .line 25
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzv()Lcom/google/android/gms/measurement/internal/zzlo;

    move-result-object v1

    iget-object v3, p1, Lcom/google/android/gms/measurement/internal/zzac;->zzk:Lcom/google/android/gms/measurement/internal/zzaw;

    .line 26
    invoke-static {v3}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/measurement/internal/zzaw;

    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzaw;->zza:Ljava/lang/String;

    iget-object v5, v0, Lcom/google/android/gms/measurement/internal/zzac;->zzb:Ljava/lang/String;

    iget-object p1, p1, Lcom/google/android/gms/measurement/internal/zzac;->zzk:Lcom/google/android/gms/measurement/internal/zzaw;

    iget-wide v6, p1, Lcom/google/android/gms/measurement/internal/zzaw;->zzd:J

    const/4 v8, 0x1

    const/4 v9, 0x1

    .line 27
    invoke-virtual/range {v1 .. v9}, Lcom/google/android/gms/measurement/internal/zzlo;->zzz(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;JZZ)Lcom/google/android/gms/measurement/internal/zzaw;

    move-result-object p1

    .line 28
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/measurement/internal/zzaw;

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzY(Lcom/google/android/gms/measurement/internal/zzaw;Lcom/google/android/gms/measurement/internal/zzq;)V

    goto :goto_1

    .line 29
    :cond_3
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object p2

    .line 30
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzk()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object p2

    const-string v0, "Conditional user property doesn\'t exist"

    iget-object v1, p1, Lcom/google/android/gms/measurement/internal/zzac;->zza:Ljava/lang/String;

    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 31
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzge;->zzj()Lcom/google/android/gms/measurement/internal/zzep;

    move-result-object v2

    iget-object p1, p1, Lcom/google/android/gms/measurement/internal/zzac;->zzc:Lcom/google/android/gms/measurement/internal/zzlj;

    .line 32
    iget-object p1, p1, Lcom/google/android/gms/measurement/internal/zzlj;->zzb:Ljava/lang/String;

    invoke-virtual {v2, p1}, Lcom/google/android/gms/measurement/internal/zzep;->zzf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 33
    invoke-virtual {p2, v0, v1, p1}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 28
    :cond_4
    :goto_1
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 34
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 35
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzam;->zzC()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 36
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 37
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzam;->zzx()V

    return-void

    :catchall_0
    move-exception p1

    .line 33
    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 36
    invoke-static {p2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 37
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzam;->zzx()V

    .line 38
    throw p1

    .line 39
    :cond_5
    invoke-virtual {p0, p2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzd(Lcom/google/android/gms/measurement/internal/zzq;)Lcom/google/android/gms/measurement/internal/zzh;

    return-void
.end method

.method final zzP(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzq;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzB()V

    .line 3
    invoke-static {p2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzak(Lcom/google/android/gms/measurement/internal/zzq;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 4
    :cond_0
    iget-boolean v0, p2, Lcom/google/android/gms/measurement/internal/zzq;->zzh:Z

    if-nez v0, :cond_1

    .line 5
    invoke-virtual {p0, p2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzd(Lcom/google/android/gms/measurement/internal/zzq;)Lcom/google/android/gms/measurement/internal/zzh;

    return-void

    :cond_1
    const-string v0, "_npa"

    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p2, Lcom/google/android/gms/measurement/internal/zzq;->zzr:Ljava/lang/Boolean;

    if-eqz v0, :cond_3

    .line 34
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzc()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object p1

    const-string v0, "Falling back to manifest metadata value for ad personalization"

    invoke-virtual {p1, v0}, Lcom/google/android/gms/measurement/internal/zzes;->zza(Ljava/lang/String;)V

    .line 35
    new-instance p1, Lcom/google/android/gms/measurement/internal/zzlj;

    .line 36
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzax()Lcom/google/android/gms/common/util/Clock;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v3

    const/4 v0, 0x1

    .line 37
    iget-object v1, p2, Lcom/google/android/gms/measurement/internal/zzq;->zzr:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eq v0, v1, :cond_2

    const-wide/16 v0, 0x0

    goto :goto_0

    :cond_2
    const-wide/16 v0, 0x1

    :goto_0
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    const-string v2, "_npa"

    const-string v6, "auto"

    move-object v1, p1

    invoke-direct/range {v1 .. v6}, Lcom/google/android/gms/measurement/internal/zzlj;-><init>(Ljava/lang/String;JLjava/lang/Object;Ljava/lang/String;)V

    .line 38
    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzW(Lcom/google/android/gms/measurement/internal/zzlj;Lcom/google/android/gms/measurement/internal/zzq;)V

    return-void

    .line 7
    :cond_3
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    .line 8
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeu;->zzc()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 9
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzge;->zzj()Lcom/google/android/gms/measurement/internal/zzep;

    move-result-object v1

    .line 10
    invoke-virtual {v1, p1}, Lcom/google/android/gms/measurement/internal/zzep;->zzf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Removing user property"

    .line 11
    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 12
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzam;->zzw()V

    .line 14
    :try_start_0
    invoke-virtual {p0, p2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzd(Lcom/google/android/gms/measurement/internal/zzq;)Lcom/google/android/gms/measurement/internal/zzh;

    const-string v0, "_id"

    .line 15
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 16
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 17
    iget-object v1, p2, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    .line 18
    invoke-static {v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "_lair"

    .line 19
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzam;->zzA(Ljava/lang/String;Ljava/lang/String;)V

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 20
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 21
    iget-object p2, p2, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    .line 22
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    .line 23
    invoke-virtual {v0, p2, p1}, Lcom/google/android/gms/measurement/internal/zzam;->zzA(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 24
    invoke-static {p2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 25
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzam;->zzC()V

    .line 26
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object p2

    .line 27
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzc()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object p2

    const-string v0, "User property removed"

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 28
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzge;->zzj()Lcom/google/android/gms/measurement/internal/zzep;

    move-result-object v1

    .line 29
    invoke-virtual {v1, p1}, Lcom/google/android/gms/measurement/internal/zzep;->zzf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 30
    invoke-virtual {p2, v0, p1}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 31
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 32
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzam;->zzx()V

    return-void

    :catchall_0
    move-exception p1

    .line 30
    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 31
    invoke-static {p2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 32
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzam;->zzx()V

    .line 33
    throw p1
.end method

.method final zzQ(Lcom/google/android/gms/measurement/internal/zzq;)V
    .locals 7

    const-string v0, "app_id=?"

    .line 1
    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzy:Ljava/util/List;

    if-eqz v1, :cond_0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzz:Ljava/util/List;

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzy:Ljava/util/List;

    .line 2
    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 3
    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 4
    iget-object v2, p1, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    invoke-static {v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 5
    invoke-static {v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 7
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzkt;->zzW()V

    .line 8
    :try_start_0
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzam;->zzh()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v2, v4, v5

    const-string v5, "apps"

    .line 9
    invoke-virtual {v3, v5, v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v5

    const-string v6, "events"

    .line 10
    invoke-virtual {v3, v6, v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    add-int/2addr v5, v6

    const-string v6, "user_attributes"

    .line 11
    invoke-virtual {v3, v6, v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    add-int/2addr v5, v6

    const-string v6, "conditional_properties"

    .line 12
    invoke-virtual {v3, v6, v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    add-int/2addr v5, v6

    const-string v6, "raw_events"

    .line 13
    invoke-virtual {v3, v6, v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    add-int/2addr v5, v6

    const-string v6, "raw_events_metadata"

    .line 14
    invoke-virtual {v3, v6, v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    add-int/2addr v5, v6

    const-string v6, "queue"

    .line 15
    invoke-virtual {v3, v6, v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    add-int/2addr v5, v6

    const-string v6, "audience_filter_values"

    .line 16
    invoke-virtual {v3, v6, v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    add-int/2addr v5, v6

    const-string v6, "main_event_params"

    .line 17
    invoke-virtual {v3, v6, v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    add-int/2addr v5, v6

    const-string v6, "default_event_params"

    .line 18
    invoke-virtual {v3, v6, v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    add-int/2addr v5, v0

    if-lez v5, :cond_1

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 19
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v0

    const-string v3, "Reset analytics data. app, records"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v3, v2, v4}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 25
    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 21
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v1

    .line 22
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v1

    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    const-string v3, "Error resetting analytics data. appId, error"

    .line 23
    invoke-virtual {v1, v3, v2, v0}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 24
    :cond_1
    :goto_0
    iget-boolean v0, p1, Lcom/google/android/gms/measurement/internal/zzq;->zzh:Z

    if-eqz v0, :cond_2

    .line 25
    invoke-virtual {p0, p1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzL(Lcom/google/android/gms/measurement/internal/zzq;)V

    :cond_2
    return-void
.end method

.method public final zzR(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zziq;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzE:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 2
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    if-eqz p2, :cond_0

    goto :goto_0

    :cond_0
    return-void

    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzE:Ljava/lang/String;

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzD:Lcom/google/android/gms/measurement/internal/zziq;

    return-void
.end method

.method protected final zzS()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 2
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzam;->zzz()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzk:Lcom/google/android/gms/measurement/internal/zzka;

    .line 4
    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzka;->zzc:Lcom/google/android/gms/measurement/internal/zzff;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzff;->zza()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzk:Lcom/google/android/gms/measurement/internal/zzka;

    .line 5
    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzka;->zzc:Lcom/google/android/gms/measurement/internal/zzff;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzax()Lcom/google/android/gms/common/util/Clock;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzff;->zzb(J)V

    .line 6
    :cond_0
    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzag()V

    return-void
.end method

.method final zzT(Lcom/google/android/gms/measurement/internal/zzac;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzac;->zza:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzac(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzU(Lcom/google/android/gms/measurement/internal/zzac;Lcom/google/android/gms/measurement/internal/zzq;)V

    :cond_0
    return-void
.end method

.method final zzU(Lcom/google/android/gms/measurement/internal/zzac;Lcom/google/android/gms/measurement/internal/zzq;)V
    .locals 10

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzac;->zza:Ljava/lang/String;

    .line 2
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzac;->zzb:Ljava/lang/String;

    .line 3
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzac;->zzc:Lcom/google/android/gms/measurement/internal/zzlj;

    .line 4
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzac;->zzc:Lcom/google/android/gms/measurement/internal/zzlj;

    .line 5
    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzlj;->zzb:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 7
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzB()V

    .line 8
    invoke-static {p2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzak(Lcom/google/android/gms/measurement/internal/zzq;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 9
    :cond_0
    iget-boolean v0, p2, Lcom/google/android/gms/measurement/internal/zzq;->zzh:Z

    if-nez v0, :cond_1

    .line 10
    invoke-virtual {p0, p2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzd(Lcom/google/android/gms/measurement/internal/zzq;)Lcom/google/android/gms/measurement/internal/zzh;

    return-void

    :cond_1
    new-instance v0, Lcom/google/android/gms/measurement/internal/zzac;

    .line 11
    invoke-direct {v0, p1}, Lcom/google/android/gms/measurement/internal/zzac;-><init>(Lcom/google/android/gms/measurement/internal/zzac;)V

    const/4 p1, 0x0

    iput-boolean p1, v0, Lcom/google/android/gms/measurement/internal/zzac;->zze:Z

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 12
    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 13
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzam;->zzw()V

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 14
    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    iget-object v2, v0, Lcom/google/android/gms/measurement/internal/zzac;->zza:Ljava/lang/String;

    .line 15
    invoke-static {v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v3, v0, Lcom/google/android/gms/measurement/internal/zzac;->zzc:Lcom/google/android/gms/measurement/internal/zzlj;

    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzlj;->zzb:Ljava/lang/String;

    .line 16
    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/measurement/internal/zzam;->zzk(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzac;

    move-result-object v1

    if-eqz v1, :cond_2

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzac;->zzb:Ljava/lang/String;

    iget-object v3, v0, Lcom/google/android/gms/measurement/internal/zzac;->zzb:Ljava/lang/String;

    .line 17
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 18
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v2

    .line 19
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzk()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v2

    const-string v3, "Updating a conditional user property with different origin. name, origin, origin (from DB)"

    iget-object v4, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 20
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzge;->zzj()Lcom/google/android/gms/measurement/internal/zzep;

    move-result-object v4

    iget-object v5, v0, Lcom/google/android/gms/measurement/internal/zzac;->zzc:Lcom/google/android/gms/measurement/internal/zzlj;

    .line 21
    iget-object v5, v5, Lcom/google/android/gms/measurement/internal/zzlj;->zzb:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/google/android/gms/measurement/internal/zzep;->zzf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, v0, Lcom/google/android/gms/measurement/internal/zzac;->zzb:Ljava/lang/String;

    iget-object v6, v1, Lcom/google/android/gms/measurement/internal/zzac;->zzb:Ljava/lang/String;

    .line 22
    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/google/android/gms/measurement/internal/zzes;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_2
    const/4 v2, 0x1

    if-eqz v1, :cond_3

    iget-boolean v3, v1, Lcom/google/android/gms/measurement/internal/zzac;->zze:Z

    if-eqz v3, :cond_3

    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzac;->zzb:Ljava/lang/String;

    iput-object v3, v0, Lcom/google/android/gms/measurement/internal/zzac;->zzb:Ljava/lang/String;

    iget-wide v3, v1, Lcom/google/android/gms/measurement/internal/zzac;->zzd:J

    iput-wide v3, v0, Lcom/google/android/gms/measurement/internal/zzac;->zzd:J

    iget-wide v3, v1, Lcom/google/android/gms/measurement/internal/zzac;->zzh:J

    iput-wide v3, v0, Lcom/google/android/gms/measurement/internal/zzac;->zzh:J

    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzac;->zzf:Ljava/lang/String;

    iput-object v3, v0, Lcom/google/android/gms/measurement/internal/zzac;->zzf:Ljava/lang/String;

    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzac;->zzi:Lcom/google/android/gms/measurement/internal/zzaw;

    iput-object v3, v0, Lcom/google/android/gms/measurement/internal/zzac;->zzi:Lcom/google/android/gms/measurement/internal/zzaw;

    iput-boolean v2, v0, Lcom/google/android/gms/measurement/internal/zzac;->zze:Z

    new-instance v2, Lcom/google/android/gms/measurement/internal/zzlj;

    iget-object v3, v0, Lcom/google/android/gms/measurement/internal/zzac;->zzc:Lcom/google/android/gms/measurement/internal/zzlj;

    .line 26
    iget-object v5, v3, Lcom/google/android/gms/measurement/internal/zzlj;->zzb:Ljava/lang/String;

    iget-object v4, v1, Lcom/google/android/gms/measurement/internal/zzac;->zzc:Lcom/google/android/gms/measurement/internal/zzlj;

    iget-wide v6, v4, Lcom/google/android/gms/measurement/internal/zzlj;->zzc:J

    .line 27
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzlj;->zza()Ljava/lang/Object;

    move-result-object v8

    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzac;->zzc:Lcom/google/android/gms/measurement/internal/zzlj;

    iget-object v9, v1, Lcom/google/android/gms/measurement/internal/zzlj;->zzf:Ljava/lang/String;

    move-object v4, v2

    invoke-direct/range {v4 .. v9}, Lcom/google/android/gms/measurement/internal/zzlj;-><init>(Ljava/lang/String;JLjava/lang/Object;Ljava/lang/String;)V

    iput-object v2, v0, Lcom/google/android/gms/measurement/internal/zzac;->zzc:Lcom/google/android/gms/measurement/internal/zzlj;

    goto :goto_0

    .line 41
    :cond_3
    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzac;->zzf:Ljava/lang/String;

    .line 23
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_4

    new-instance p1, Lcom/google/android/gms/measurement/internal/zzlj;

    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzac;->zzc:Lcom/google/android/gms/measurement/internal/zzlj;

    .line 24
    iget-object v4, v1, Lcom/google/android/gms/measurement/internal/zzlj;->zzb:Ljava/lang/String;

    iget-wide v5, v0, Lcom/google/android/gms/measurement/internal/zzac;->zzd:J

    .line 25
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzlj;->zza()Ljava/lang/Object;

    move-result-object v7

    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzac;->zzc:Lcom/google/android/gms/measurement/internal/zzlj;

    iget-object v8, v1, Lcom/google/android/gms/measurement/internal/zzlj;->zzf:Ljava/lang/String;

    move-object v3, p1

    invoke-direct/range {v3 .. v8}, Lcom/google/android/gms/measurement/internal/zzlj;-><init>(Ljava/lang/String;JLjava/lang/Object;Ljava/lang/String;)V

    iput-object p1, v0, Lcom/google/android/gms/measurement/internal/zzac;->zzc:Lcom/google/android/gms/measurement/internal/zzlj;

    iput-boolean v2, v0, Lcom/google/android/gms/measurement/internal/zzac;->zze:Z

    const/4 p1, 0x1

    .line 27
    :cond_4
    :goto_0
    iget-boolean v1, v0, Lcom/google/android/gms/measurement/internal/zzac;->zze:Z

    if-eqz v1, :cond_6

    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzac;->zzc:Lcom/google/android/gms/measurement/internal/zzlj;

    new-instance v9, Lcom/google/android/gms/measurement/internal/zzll;

    iget-object v2, v0, Lcom/google/android/gms/measurement/internal/zzac;->zza:Ljava/lang/String;

    .line 28
    invoke-static {v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Ljava/lang/String;

    iget-object v4, v0, Lcom/google/android/gms/measurement/internal/zzac;->zzb:Ljava/lang/String;

    iget-object v5, v1, Lcom/google/android/gms/measurement/internal/zzlj;->zzb:Ljava/lang/String;

    iget-wide v6, v1, Lcom/google/android/gms/measurement/internal/zzlj;->zzc:J

    .line 29
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzlj;->zza()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    move-object v2, v9

    invoke-direct/range {v2 .. v8}, Lcom/google/android/gms/measurement/internal/zzll;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/Object;)V

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 30
    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 31
    invoke-virtual {v1, v9}, Lcom/google/android/gms/measurement/internal/zzam;->zzL(Lcom/google/android/gms/measurement/internal/zzll;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 32
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v1

    .line 33
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzc()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v1

    const-string v2, "User property updated immediately"

    iget-object v3, v0, Lcom/google/android/gms/measurement/internal/zzac;->zza:Ljava/lang/String;

    iget-object v4, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 34
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzge;->zzj()Lcom/google/android/gms/measurement/internal/zzep;

    move-result-object v4

    iget-object v5, v9, Lcom/google/android/gms/measurement/internal/zzll;->zzc:Ljava/lang/String;

    .line 35
    invoke-virtual {v4, v5}, Lcom/google/android/gms/measurement/internal/zzep;->zzf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, v9, Lcom/google/android/gms/measurement/internal/zzll;->zze:Ljava/lang/Object;

    .line 36
    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/google/android/gms/measurement/internal/zzes;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_1

    .line 37
    :cond_5
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v1

    .line 38
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v1

    const-string v2, "(2)Too many active user properties, ignoring"

    iget-object v3, v0, Lcom/google/android/gms/measurement/internal/zzac;->zza:Ljava/lang/String;

    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 39
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzge;->zzj()Lcom/google/android/gms/measurement/internal/zzep;

    move-result-object v4

    iget-object v5, v9, Lcom/google/android/gms/measurement/internal/zzll;->zzc:Ljava/lang/String;

    .line 40
    invoke-virtual {v4, v5}, Lcom/google/android/gms/measurement/internal/zzep;->zzf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, v9, Lcom/google/android/gms/measurement/internal/zzll;->zze:Ljava/lang/Object;

    .line 41
    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/google/android/gms/measurement/internal/zzes;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_1
    if-eqz p1, :cond_6

    .line 36
    iget-object p1, v0, Lcom/google/android/gms/measurement/internal/zzac;->zzi:Lcom/google/android/gms/measurement/internal/zzaw;

    if-eqz p1, :cond_6

    .line 42
    new-instance p1, Lcom/google/android/gms/measurement/internal/zzaw;

    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzac;->zzi:Lcom/google/android/gms/measurement/internal/zzaw;

    iget-wide v2, v0, Lcom/google/android/gms/measurement/internal/zzac;->zzd:J

    invoke-direct {p1, v1, v2, v3}, Lcom/google/android/gms/measurement/internal/zzaw;-><init>(Lcom/google/android/gms/measurement/internal/zzaw;J)V

    .line 43
    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzY(Lcom/google/android/gms/measurement/internal/zzaw;Lcom/google/android/gms/measurement/internal/zzq;)V

    :cond_6
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 44
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 45
    invoke-virtual {p1, v0}, Lcom/google/android/gms/measurement/internal/zzam;->zzK(Lcom/google/android/gms/measurement/internal/zzac;)Z

    move-result p1

    if-eqz p1, :cond_7

    .line 46
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object p1

    .line 47
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzc()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object p1

    const-string p2, "Conditional property added"

    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzac;->zza:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 48
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzge;->zzj()Lcom/google/android/gms/measurement/internal/zzep;

    move-result-object v2

    iget-object v3, v0, Lcom/google/android/gms/measurement/internal/zzac;->zzc:Lcom/google/android/gms/measurement/internal/zzlj;

    .line 49
    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzlj;->zzb:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zzep;->zzf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzac;->zzc:Lcom/google/android/gms/measurement/internal/zzlj;

    .line 50
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzlj;->zza()Ljava/lang/Object;

    move-result-object v0

    .line 51
    invoke-virtual {p1, p2, v1, v2, v0}, Lcom/google/android/gms/measurement/internal/zzes;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_2

    .line 52
    :cond_7
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object p1

    .line 53
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object p1

    const-string p2, "Too many conditional properties, ignoring"

    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzac;->zza:Ljava/lang/String;

    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 54
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzge;->zzj()Lcom/google/android/gms/measurement/internal/zzep;

    move-result-object v2

    iget-object v3, v0, Lcom/google/android/gms/measurement/internal/zzac;->zzc:Lcom/google/android/gms/measurement/internal/zzlj;

    .line 55
    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzlj;->zzb:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zzep;->zzf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzac;->zzc:Lcom/google/android/gms/measurement/internal/zzlj;

    .line 56
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzlj;->zza()Ljava/lang/Object;

    move-result-object v0

    .line 57
    invoke-virtual {p1, p2, v1, v2, v0}, Lcom/google/android/gms/measurement/internal/zzes;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 51
    :goto_2
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 58
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 59
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzam;->zzC()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 60
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 61
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzam;->zzx()V

    return-void

    :catchall_0
    move-exception p1

    .line 25
    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 60
    invoke-static {p2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 61
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzam;->zzx()V

    .line 62
    throw p1
.end method

.method final zzV(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzai;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzB()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzB:Ljava/util/Map;

    .line 3
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 4
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 5
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 8
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkt;->zzW()V

    new-instance v1, Landroid/content/ContentValues;

    .line 9
    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    const-string v2, "app_id"

    .line 10
    invoke-virtual {v1, v2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzai;->zzh()Ljava/lang/String;

    move-result-object p2

    const-string v2, "consent_state"

    invoke-virtual {v1, v2, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    :try_start_0
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzam;->zzh()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p2

    const-string v2, "consent_settings"

    const/4 v3, 0x0

    const/4 v4, 0x5

    .line 13
    invoke-virtual {p2, v2, v3, v1, v4}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J

    move-result-wide v1

    const-wide/16 v3, -0x1

    cmp-long p2, v1, v3

    if-nez p2, :cond_0

    iget-object p2, v0, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 14
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object p2

    .line 15
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object p2

    const-string v1, "Failed to insert/update consent setting (got -1). appId"

    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 16
    invoke-virtual {p2, v1, v2}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-void

    :catch_0
    move-exception p2

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 17
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v0

    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    const-string v1, "Error storing consent setting. appId, error"

    .line 19
    invoke-virtual {v0, v1, p1, p2}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method final zzW(Lcom/google/android/gms/measurement/internal/zzlj;Lcom/google/android/gms/measurement/internal/zzq;)V
    .locals 17

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    move-object/from16 v2, p2

    const-string v3, "_id"

    .line 1
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 2
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzB()V

    .line 3
    invoke-static/range {p2 .. p2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzak(Lcom/google/android/gms/measurement/internal/zzq;)Z

    move-result v4

    if-nez v4, :cond_0

    return-void

    .line 4
    :cond_0
    iget-boolean v4, v2, Lcom/google/android/gms/measurement/internal/zzq;->zzh:Z

    if-nez v4, :cond_1

    .line 5
    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzd(Lcom/google/android/gms/measurement/internal/zzq;)Lcom/google/android/gms/measurement/internal/zzh;

    return-void

    .line 6
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzv()Lcom/google/android/gms/measurement/internal/zzlo;

    move-result-object v4

    iget-object v5, v0, Lcom/google/android/gms/measurement/internal/zzlj;->zzb:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/google/android/gms/measurement/internal/zzlo;->zzl(Ljava/lang/String;)I

    move-result v9

    const/4 v4, 0x1

    const/16 v5, 0x18

    const/4 v6, 0x0

    if-eqz v9, :cond_3

    .line 7
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzv()Lcom/google/android/gms/measurement/internal/zzlo;

    move-result-object v3

    iget-object v7, v0, Lcom/google/android/gms/measurement/internal/zzlj;->zzb:Ljava/lang/String;

    .line 8
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    .line 9
    invoke-virtual {v3, v7, v5, v4}, Lcom/google/android/gms/measurement/internal/zzlo;->zzD(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v11

    .line 10
    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzlj;->zzb:Ljava/lang/String;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    move v12, v0

    goto :goto_0

    :cond_2
    const/4 v12, 0x0

    .line 11
    :goto_0
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzv()Lcom/google/android/gms/measurement/internal/zzlo;

    move-result-object v6

    iget-object v7, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzF:Lcom/google/android/gms/measurement/internal/zzln;

    iget-object v8, v2, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    const-string v10, "_ev"

    .line 12
    invoke-virtual/range {v6 .. v12}, Lcom/google/android/gms/measurement/internal/zzlo;->zzO(Lcom/google/android/gms/measurement/internal/zzln;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V

    return-void

    .line 13
    :cond_3
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzv()Lcom/google/android/gms/measurement/internal/zzlo;

    move-result-object v7

    iget-object v8, v0, Lcom/google/android/gms/measurement/internal/zzlj;->zzb:Ljava/lang/String;

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/measurement/internal/zzlj;->zza()Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Lcom/google/android/gms/measurement/internal/zzlo;->zzd(Ljava/lang/String;Ljava/lang/Object;)I

    move-result v13

    if-eqz v13, :cond_6

    .line 14
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzv()Lcom/google/android/gms/measurement/internal/zzlo;

    move-result-object v3

    iget-object v7, v0, Lcom/google/android/gms/measurement/internal/zzlj;->zzb:Ljava/lang/String;

    .line 15
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    .line 16
    invoke-virtual {v3, v7, v5, v4}, Lcom/google/android/gms/measurement/internal/zzlo;->zzD(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v15

    .line 17
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/measurement/internal/zzlj;->zza()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 18
    instance-of v3, v0, Ljava/lang/String;

    if-nez v3, :cond_4

    instance-of v3, v0, Ljava/lang/CharSequence;

    if-eqz v3, :cond_5

    .line 19
    :cond_4
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v6

    move/from16 v16, v6

    goto :goto_1

    :cond_5
    const/16 v16, 0x0

    .line 20
    :goto_1
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzv()Lcom/google/android/gms/measurement/internal/zzlo;

    move-result-object v10

    iget-object v11, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzF:Lcom/google/android/gms/measurement/internal/zzln;

    iget-object v12, v2, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    const-string v14, "_ev"

    .line 21
    invoke-virtual/range {v10 .. v16}, Lcom/google/android/gms/measurement/internal/zzlo;->zzO(Lcom/google/android/gms/measurement/internal/zzln;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V

    return-void

    .line 22
    :cond_6
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzv()Lcom/google/android/gms/measurement/internal/zzlo;

    move-result-object v4

    iget-object v5, v0, Lcom/google/android/gms/measurement/internal/zzlj;->zzb:Ljava/lang/String;

    .line 23
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/measurement/internal/zzlj;->zza()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/google/android/gms/measurement/internal/zzlo;->zzB(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_7

    return-void

    .line 24
    :cond_7
    iget-object v5, v0, Lcom/google/android/gms/measurement/internal/zzlj;->zzb:Ljava/lang/String;

    const-string v6, "_sid"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_b

    .line 25
    iget-wide v8, v0, Lcom/google/android/gms/measurement/internal/zzlj;->zzc:J

    iget-object v11, v0, Lcom/google/android/gms/measurement/internal/zzlj;->zzf:Ljava/lang/String;

    .line 26
    iget-object v5, v2, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    invoke-static {v5}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    iget-object v6, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 27
    invoke-static {v6}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    const-string v7, "_sno"

    .line 28
    invoke-virtual {v6, v5, v7}, Lcom/google/android/gms/measurement/internal/zzam;->zzp(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzll;

    move-result-object v6

    if-eqz v6, :cond_8

    iget-object v7, v6, Lcom/google/android/gms/measurement/internal/zzll;->zze:Ljava/lang/Object;

    .line 29
    instance-of v10, v7, Ljava/lang/Long;

    if-eqz v10, :cond_8

    .line 38
    check-cast v7, Ljava/lang/Long;

    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    goto :goto_2

    :cond_8
    if-eqz v6, :cond_9

    .line 30
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v7

    .line 31
    invoke-virtual {v7}, Lcom/google/android/gms/measurement/internal/zzeu;->zzk()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v7

    iget-object v6, v6, Lcom/google/android/gms/measurement/internal/zzll;->zze:Ljava/lang/Object;

    const-string v10, "Retrieved last session number from database does not contain a valid (long) value"

    .line 32
    invoke-virtual {v7, v10, v6}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_9
    iget-object v6, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 33
    invoke-static {v6}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    const-string v7, "_s"

    .line 34
    invoke-virtual {v6, v5, v7}, Lcom/google/android/gms/measurement/internal/zzam;->zzn(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzas;

    move-result-object v5

    if-eqz v5, :cond_a

    iget-wide v5, v5, Lcom/google/android/gms/measurement/internal/zzas;->zzc:J

    .line 35
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v7

    .line 36
    invoke-virtual {v7}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v7

    .line 37
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    const-string v12, "Backfill the session number. Last used session number"

    invoke-virtual {v7, v12, v10}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_2

    :cond_a
    const-wide/16 v5, 0x0

    .line 38
    :goto_2
    new-instance v12, Lcom/google/android/gms/measurement/internal/zzlj;

    const-wide/16 v13, 0x1

    add-long/2addr v5, v13

    .line 39
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    const-string v7, "_sno"

    move-object v6, v12

    invoke-direct/range {v6 .. v11}, Lcom/google/android/gms/measurement/internal/zzlj;-><init>(Ljava/lang/String;JLjava/lang/Object;Ljava/lang/String;)V

    .line 40
    invoke-virtual {v1, v12, v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzW(Lcom/google/android/gms/measurement/internal/zzlj;Lcom/google/android/gms/measurement/internal/zzq;)V

    :cond_b
    new-instance v5, Lcom/google/android/gms/measurement/internal/zzll;

    .line 41
    iget-object v6, v2, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    .line 42
    invoke-static {v6}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    move-object v8, v6

    check-cast v8, Ljava/lang/String;

    iget-object v6, v0, Lcom/google/android/gms/measurement/internal/zzlj;->zzf:Ljava/lang/String;

    .line 43
    invoke-static {v6}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    move-object v9, v6

    check-cast v9, Ljava/lang/String;

    iget-object v10, v0, Lcom/google/android/gms/measurement/internal/zzlj;->zzb:Ljava/lang/String;

    iget-wide v11, v0, Lcom/google/android/gms/measurement/internal/zzlj;->zzc:J

    move-object v7, v5

    move-object v13, v4

    invoke-direct/range {v7 .. v13}, Lcom/google/android/gms/measurement/internal/zzll;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/Object;)V

    .line 44
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    .line 45
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v0

    iget-object v6, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 46
    invoke-virtual {v6}, Lcom/google/android/gms/measurement/internal/zzge;->zzj()Lcom/google/android/gms/measurement/internal/zzep;

    move-result-object v6

    iget-object v7, v5, Lcom/google/android/gms/measurement/internal/zzll;->zzc:Ljava/lang/String;

    .line 47
    invoke-virtual {v6, v7}, Lcom/google/android/gms/measurement/internal/zzep;->zzf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "Setting user property"

    .line 48
    invoke-virtual {v0, v7, v6, v4}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 49
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 50
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzam;->zzw()V

    :try_start_0
    iget-object v0, v5, Lcom/google/android/gms/measurement/internal/zzll;->zzc:Ljava/lang/String;

    .line 51
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 52
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 53
    iget-object v4, v2, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    .line 54
    invoke-virtual {v0, v4, v3}, Lcom/google/android/gms/measurement/internal/zzam;->zzp(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzll;

    move-result-object v0

    if-eqz v0, :cond_c

    iget-object v3, v5, Lcom/google/android/gms/measurement/internal/zzll;->zze:Ljava/lang/Object;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzll;->zze:Ljava/lang/Object;

    .line 55
    invoke-virtual {v3, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 56
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 57
    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    const-string v4, "_lair"

    .line 58
    invoke-virtual {v0, v3, v4}, Lcom/google/android/gms/measurement/internal/zzam;->zzA(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    :cond_c
    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzd(Lcom/google/android/gms/measurement/internal/zzq;)Lcom/google/android/gms/measurement/internal/zzh;

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 60
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 61
    invoke-virtual {v0, v5}, Lcom/google/android/gms/measurement/internal/zzam;->zzL(Lcom/google/android/gms/measurement/internal/zzll;)Z

    move-result v0

    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 62
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 63
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzam;->zzC()V

    if-nez v0, :cond_d

    .line 64
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    .line 65
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v0

    const-string v3, "Too many unique user properties are set. Ignoring user property"

    iget-object v4, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 66
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzge;->zzj()Lcom/google/android/gms/measurement/internal/zzep;

    move-result-object v4

    iget-object v6, v5, Lcom/google/android/gms/measurement/internal/zzll;->zzc:Ljava/lang/String;

    .line 67
    invoke-virtual {v4, v6}, Lcom/google/android/gms/measurement/internal/zzep;->zzf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, v5, Lcom/google/android/gms/measurement/internal/zzll;->zze:Ljava/lang/Object;

    .line 68
    invoke-virtual {v0, v3, v4, v5}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 69
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzv()Lcom/google/android/gms/measurement/internal/zzlo;

    move-result-object v6

    iget-object v7, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzF:Lcom/google/android/gms/measurement/internal/zzln;

    iget-object v8, v2, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    const/16 v9, 0x9

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    .line 70
    invoke-virtual/range {v6 .. v12}, Lcom/google/android/gms/measurement/internal/zzlo;->zzO(Lcom/google/android/gms/measurement/internal/zzln;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_d
    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 71
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 72
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzam;->zzx()V

    return-void

    :catchall_0
    move-exception v0

    .line 37
    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 71
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 72
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzam;->zzx()V

    .line 73
    throw v0
.end method

.method final zzX()V
    .locals 22

    move-object/from16 v1, p0

    .line 1
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 2
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzB()V

    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzv:Z

    const/4 v3, 0x0

    :try_start_0
    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzay()Lcom/google/android/gms/measurement/internal/zzab;

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 4
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzt()Lcom/google/android/gms/measurement/internal/zzjy;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzjy;->zzj()Ljava/lang/Boolean;

    move-result-object v0

    if-nez v0, :cond_0

    .line 5
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    .line 6
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeu;->zzk()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v0

    const-string v2, "Upload data called on the client side before use of service was decided"

    .line 7
    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzes;->zza(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_6

    iput-boolean v3, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzv:Z

    .line 8
    :goto_0
    invoke-direct/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzae()V

    return-void

    .line 9
    :cond_0
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 172
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v0

    const-string v2, "Upload called in the client side when service should be used"

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzes;->zza(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_6

    iput-boolean v3, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzv:Z

    goto :goto_0

    .line 8
    :cond_1
    :try_start_2
    iget-wide v4, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zza:J

    const-wide/16 v6, 0x0

    cmp-long v0, v4, v6

    if-lez v0, :cond_2

    .line 171
    invoke-direct/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzag()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_6

    iput-boolean v3, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzv:Z

    goto :goto_0

    .line 10
    :cond_2
    :try_start_3
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzy:Ljava/util/List;

    if-eqz v0, :cond_3

    .line 11
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v0

    const-string v2, "Uploading requested multiple times"

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzes;->zza(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_6

    iput-boolean v3, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzv:Z

    goto :goto_0

    .line 8
    :cond_3
    :try_start_4
    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzd:Lcom/google/android/gms/measurement/internal/zzfa;

    .line 12
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfa;->zza()Z

    move-result v0

    if-nez v0, :cond_4

    .line 14
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v0

    const-string v2, "Network not connected, ignoring upload request"

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzes;->zza(Ljava/lang/String;)V

    .line 15
    invoke-direct/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzag()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_6

    iput-boolean v3, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzv:Z

    goto :goto_0

    .line 16
    :cond_4
    :try_start_5
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzax()Lcom/google/android/gms/common/util/Clock;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v4

    .line 17
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v0

    sget-object v8, Lcom/google/android/gms/measurement/internal/zzeh;->zzR:Lcom/google/android/gms/measurement/internal/zzeg;

    const/4 v9, 0x0

    invoke-virtual {v0, v9, v8}, Lcom/google/android/gms/measurement/internal/zzag;->zze(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzeg;)I

    move-result v0

    .line 18
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    invoke-static {}, Lcom/google/android/gms/measurement/internal/zzag;->zzz()J

    move-result-wide v10

    sub-long v10, v4, v10

    const/4 v8, 0x0

    :goto_1
    if-ge v8, v0, :cond_5

    .line 19
    invoke-direct {v1, v9, v10, v11}, Lcom/google/android/gms/measurement/internal/zzlg;->zzah(Ljava/lang/String;J)Z

    move-result v12

    if-eqz v12, :cond_5

    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    :cond_5
    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzk:Lcom/google/android/gms/measurement/internal/zzka;

    .line 20
    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzka;->zzc:Lcom/google/android/gms/measurement/internal/zzff;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzff;->zza()J

    move-result-wide v10

    cmp-long v0, v10, v6

    if-eqz v0, :cond_6

    .line 21
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeu;->zzc()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v0

    const-string v6, "Uploading events. Elapsed time since last upload attempt (ms)"

    sub-long v7, v4, v10

    .line 23
    invoke-static {v7, v8}, Ljava/lang/Math;->abs(J)J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    .line 24
    invoke-virtual {v0, v6, v7}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_6
    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 25
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 26
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzam;->zzr()Ljava/lang/String;

    move-result-object v6

    .line 27
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const-wide/16 v7, -0x1

    if-nez v0, :cond_26

    iget-wide v10, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzA:J

    cmp-long v0, v10, v7

    if-nez v0, :cond_a

    iget-object v10, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 28
    invoke-static {v10}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_6

    .line 29
    :try_start_6
    invoke-virtual {v10}, Lcom/google/android/gms/measurement/internal/zzam;->zzh()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v11, "select rowid from raw_events order by rowid desc limit 1;"

    .line 30
    invoke-virtual {v0, v11, v9}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11
    :try_end_6
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 31
    :try_start_7
    invoke-interface {v11}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0
    :try_end_7
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    if-nez v0, :cond_7

    if-eqz v11, :cond_8

    .line 32
    :goto_2
    :try_start_8
    invoke-interface {v11}, Landroid/database/Cursor;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_6

    goto :goto_4

    .line 33
    :cond_7
    :try_start_9
    invoke-interface {v11, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v7
    :try_end_9
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    if-eqz v11, :cond_8

    goto :goto_2

    :catch_0
    move-exception v0

    goto :goto_3

    :catchall_0
    move-exception v0

    goto :goto_5

    :catch_1
    move-exception v0

    move-object v11, v9

    .line 173
    :goto_3
    :try_start_a
    iget-object v10, v10, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 34
    invoke-virtual {v10}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v10

    .line 35
    invoke-virtual {v10}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v10

    const-string v12, "Error querying raw events"

    invoke-virtual {v10, v12, v0}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    if-eqz v11, :cond_8

    goto :goto_2

    .line 32
    :cond_8
    :goto_4
    :try_start_b
    iput-wide v7, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzA:J

    goto :goto_6

    :catchall_1
    move-exception v0

    move-object v9, v11

    :goto_5
    if-eqz v9, :cond_9

    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 36
    :cond_9
    throw v0

    .line 37
    :cond_a
    :goto_6
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v0

    sget-object v7, Lcom/google/android/gms/measurement/internal/zzeh;->zzg:Lcom/google/android/gms/measurement/internal/zzeg;

    invoke-virtual {v0, v6, v7}, Lcom/google/android/gms/measurement/internal/zzag;->zze(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzeg;)I

    move-result v0

    .line 38
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v7

    sget-object v8, Lcom/google/android/gms/measurement/internal/zzeh;->zzh:Lcom/google/android/gms/measurement/internal/zzeg;

    invoke-virtual {v7, v6, v8}, Lcom/google/android/gms/measurement/internal/zzag;->zze(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzeg;)I

    move-result v7

    .line 39
    invoke-static {v3, v7}, Ljava/lang/Math;->max(II)I

    move-result v7

    iget-object v8, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 40
    invoke-static {v8}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 41
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 42
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzkt;->zzW()V

    if-lez v0, :cond_b

    const/4 v10, 0x1

    goto :goto_7

    :cond_b
    const/4 v10, 0x0

    .line 43
    :goto_7
    invoke-static {v10}, Lcom/google/android/gms/common/internal/Preconditions;->checkArgument(Z)V

    if-lez v7, :cond_c

    const/4 v10, 0x1

    goto :goto_8

    :cond_c
    const/4 v10, 0x0

    .line 44
    :goto_8
    invoke-static {v10}, Lcom/google/android/gms/common/internal/Preconditions;->checkArgument(Z)V

    .line 45
    invoke-static {v6}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_6

    .line 46
    :try_start_c
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzam;->zzh()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v11

    const-string v12, "queue"

    const-string v13, "rowid"

    const-string v14, "data"

    const-string v15, "retry_count"

    filled-new-array {v13, v14, v15}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "app_id=?"

    new-array v15, v2, [Ljava/lang/String;

    aput-object v6, v15, v3

    const/16 v16, 0x0

    const/16 v17, 0x0

    const-string v18, "rowid"

    .line 47
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v19

    .line 48
    invoke-virtual/range {v11 .. v19}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11
    :try_end_c
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_c .. :try_end_c} :catch_9
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    .line 49
    :try_start_d
    invoke-interface {v11}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-nez v0, :cond_e

    .line 50
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0
    :try_end_d
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_d .. :try_end_d} :catch_8
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    if-eqz v11, :cond_d

    .line 51
    :try_start_e
    invoke-interface {v11}, Landroid/database/Cursor;->close()V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_6

    :cond_d
    move-wide/from16 v20, v4

    goto/16 :goto_10

    .line 132
    :cond_e
    :try_start_f
    new-instance v12, Ljava/util/ArrayList;

    .line 52
    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    const/4 v13, 0x0

    .line 53
    :goto_9
    invoke-interface {v11, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v14
    :try_end_f
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_f .. :try_end_f} :catch_8
    .catchall {:try_start_f .. :try_end_f} :catchall_3

    .line 54
    :try_start_10
    invoke-interface {v11, v2}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v0

    iget-object v9, v8, Lcom/google/android/gms/measurement/internal/zzks;->zzf:Lcom/google/android/gms/measurement/internal/zzlg;

    iget-object v9, v9, Lcom/google/android/gms/measurement/internal/zzlg;->zzi:Lcom/google/android/gms/measurement/internal/zzli;

    .line 55
    invoke-static {v9}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_10} :catch_6
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_10 .. :try_end_10} :catch_8
    .catchall {:try_start_10 .. :try_end_10} :catchall_3

    :try_start_11
    new-instance v2, Ljava/io/ByteArrayInputStream;

    .line 56
    invoke-direct {v2, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    new-instance v0, Ljava/util/zip/GZIPInputStream;

    .line 57
    invoke-direct {v0, v2}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    .line 58
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/16 v10, 0x400

    new-array v10, v10, [B
    :try_end_11
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_11} :catch_4
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_11 .. :try_end_11} :catch_8
    .catchall {:try_start_11 .. :try_end_11} :catchall_3

    move-wide/from16 v20, v4

    .line 59
    :goto_a
    :try_start_12
    invoke-virtual {v0, v10}, Ljava/util/zip/GZIPInputStream;->read([B)I

    move-result v4

    if-gtz v4, :cond_11

    .line 61
    invoke-virtual {v0}, Ljava/util/zip/GZIPInputStream;->close()V

    .line 62
    invoke-virtual {v2}, Ljava/io/ByteArrayInputStream;->close()V

    .line 63
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_12} :catch_3
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_12 .. :try_end_12} :catch_7
    .catchall {:try_start_12 .. :try_end_12} :catchall_3

    .line 64
    :try_start_13
    invoke-interface {v12}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_f

    array-length v2, v0
    :try_end_13
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_13 .. :try_end_13} :catch_7
    .catchall {:try_start_13 .. :try_end_13} :catchall_3

    add-int/2addr v2, v13

    if-le v2, v7, :cond_f

    goto/16 :goto_e

    .line 65
    :cond_f
    :try_start_14
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzgd;->zzu()Lcom/google/android/gms/internal/measurement/zzgc;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/google/android/gms/measurement/internal/zzli;->zzl(Lcom/google/android/gms/internal/measurement/zzmh;[B)Lcom/google/android/gms/internal/measurement/zzmh;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/measurement/zzgc;
    :try_end_14
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_14} :catch_2
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_14 .. :try_end_14} :catch_7
    .catchall {:try_start_14 .. :try_end_14} :catchall_3

    const/4 v3, 0x2

    .line 69
    :try_start_15
    invoke-interface {v11, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-nez v4, :cond_10

    .line 70
    invoke-interface {v11, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    invoke-virtual {v2, v4}, Lcom/google/android/gms/internal/measurement/zzgc;->zzaf(I)Lcom/google/android/gms/internal/measurement/zzgc;

    .line 71
    :cond_10
    array-length v0, v0

    add-int/2addr v13, v0

    .line 72
    invoke-virtual {v2}, Lcom/google/android/gms/internal/measurement/zzkx;->zzaD()Lcom/google/android/gms/internal/measurement/zzlb;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/measurement/zzgd;

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v0

    invoke-interface {v12, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_d

    :catch_2
    move-exception v0

    .line 75
    iget-object v2, v8, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 66
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v2

    .line 67
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v2

    const-string v3, "Failed to merge queued bundle. appId"

    invoke-static {v6}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 68
    invoke-virtual {v2, v3, v4, v0}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_15
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_15 .. :try_end_15} :catch_7
    .catchall {:try_start_15 .. :try_end_15} :catchall_3

    goto :goto_d

    :cond_11
    const/4 v5, 0x0

    .line 60
    :try_start_16
    invoke-virtual {v3, v10, v5, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_16
    .catch Ljava/io/IOException; {:try_start_16 .. :try_end_16} :catch_3
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_16 .. :try_end_16} :catch_7
    .catchall {:try_start_16 .. :try_end_16} :catchall_3

    goto :goto_a

    :catch_3
    move-exception v0

    goto :goto_b

    :catch_4
    move-exception v0

    move-wide/from16 v20, v4

    .line 78
    :goto_b
    :try_start_17
    iget-object v2, v9, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 73
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v2

    .line 74
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v2

    const-string v3, "Failed to ungzip content"

    invoke-virtual {v2, v3, v0}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    .line 75
    throw v0
    :try_end_17
    .catch Ljava/io/IOException; {:try_start_17 .. :try_end_17} :catch_5
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_17 .. :try_end_17} :catch_7
    .catchall {:try_start_17 .. :try_end_17} :catchall_3

    :catch_5
    move-exception v0

    goto :goto_c

    :catch_6
    move-exception v0

    move-wide/from16 v20, v4

    .line 151
    :goto_c
    :try_start_18
    iget-object v2, v8, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 76
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v2

    .line 77
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v2

    const-string v3, "Failed to unzip queued bundle. appId"

    invoke-static {v6}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 78
    invoke-virtual {v2, v3, v4, v0}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 79
    :goto_d
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0
    :try_end_18
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_18 .. :try_end_18} :catch_7
    .catchall {:try_start_18 .. :try_end_18} :catchall_3

    if-eqz v0, :cond_13

    if-le v13, v7, :cond_12

    goto :goto_e

    :cond_12
    move-wide/from16 v4, v20

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v9, 0x0

    goto/16 :goto_9

    :cond_13
    :goto_e
    if-eqz v11, :cond_14

    .line 51
    :try_start_19
    invoke-interface {v11}, Landroid/database/Cursor;->close()V
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_6

    :cond_14
    move-object v0, v12

    goto :goto_10

    :catch_7
    move-exception v0

    goto :goto_f

    :catch_8
    move-exception v0

    move-wide/from16 v20, v4

    goto :goto_f

    :catchall_2
    move-exception v0

    const/4 v9, 0x0

    goto/16 :goto_19

    :catch_9
    move-exception v0

    move-wide/from16 v20, v4

    const/4 v11, 0x0

    .line 36
    :goto_f
    :try_start_1a
    iget-object v2, v8, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 80
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v2

    .line 81
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v2

    const-string v3, "Error querying bundles. appId"

    invoke-static {v6}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v3, v4, v0}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 82
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_3

    if-eqz v11, :cond_15

    .line 51
    :try_start_1b
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 84
    :cond_15
    :goto_10
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2a

    .line 85
    invoke-virtual {v1, v6}, Lcom/google/android/gms/measurement/internal/zzlg;->zzh(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzai;

    move-result-object v2

    .line 86
    sget-object v3, Lcom/google/android/gms/measurement/internal/zzah;->zza:Lcom/google/android/gms/measurement/internal/zzah;

    .line 85
    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zzai;->zzi(Lcom/google/android/gms/measurement/internal/zzah;)Z

    move-result v2

    if-eqz v2, :cond_1a

    .line 87
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_16
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_17

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/util/Pair;

    .line 88
    iget-object v3, v3, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v3, Lcom/google/android/gms/internal/measurement/zzgd;

    .line 89
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzgd;->zzK()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_16

    .line 90
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/zzgd;->zzK()Ljava/lang/String;

    move-result-object v2

    goto :goto_11

    :cond_17
    const/4 v2, 0x0

    :goto_11
    if-eqz v2, :cond_1a

    const/4 v3, 0x0

    .line 91
    :goto_12
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_1a

    .line 92
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/util/Pair;

    iget-object v4, v4, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v4, Lcom/google/android/gms/internal/measurement/zzgd;

    .line 93
    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/zzgd;->zzK()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_18

    goto :goto_13

    .line 94
    :cond_18
    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/zzgd;->zzK()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_19

    const/4 v4, 0x0

    .line 95
    invoke-interface {v0, v4, v3}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v0

    goto :goto_14

    :cond_19
    :goto_13
    add-int/lit8 v3, v3, 0x1

    goto :goto_12

    .line 96
    :cond_1a
    :goto_14
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzgb;->zza()Lcom/google/android/gms/internal/measurement/zzga;

    move-result-object v2

    .line 97
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    new-instance v4, Ljava/util/ArrayList;

    .line 98
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 99
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v5

    invoke-virtual {v5, v6}, Lcom/google/android/gms/measurement/internal/zzag;->zzt(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1b

    .line 100
    invoke-virtual {v1, v6}, Lcom/google/android/gms/measurement/internal/zzlg;->zzh(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzai;

    move-result-object v5

    sget-object v7, Lcom/google/android/gms/measurement/internal/zzah;->zza:Lcom/google/android/gms/measurement/internal/zzah;

    invoke-virtual {v5, v7}, Lcom/google/android/gms/measurement/internal/zzai;->zzi(Lcom/google/android/gms/measurement/internal/zzah;)Z

    move-result v5

    if-eqz v5, :cond_1b

    const/4 v5, 0x1

    goto :goto_15

    :cond_1b
    const/4 v5, 0x0

    .line 101
    :goto_15
    invoke-virtual {v1, v6}, Lcom/google/android/gms/measurement/internal/zzlg;->zzh(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzai;

    move-result-object v7

    sget-object v8, Lcom/google/android/gms/measurement/internal/zzah;->zza:Lcom/google/android/gms/measurement/internal/zzah;

    invoke-virtual {v7, v8}, Lcom/google/android/gms/measurement/internal/zzai;->zzi(Lcom/google/android/gms/measurement/internal/zzah;)Z

    move-result v7

    .line 102
    invoke-virtual {v1, v6}, Lcom/google/android/gms/measurement/internal/zzlg;->zzh(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzai;

    move-result-object v8

    sget-object v9, Lcom/google/android/gms/measurement/internal/zzah;->zzb:Lcom/google/android/gms/measurement/internal/zzah;

    invoke-virtual {v8, v9}, Lcom/google/android/gms/measurement/internal/zzai;->zzi(Lcom/google/android/gms/measurement/internal/zzah;)Z

    move-result v8

    .line 103
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzqr;->zzc()Z

    .line 104
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v9

    sget-object v10, Lcom/google/android/gms/measurement/internal/zzeh;->zzao:Lcom/google/android/gms/measurement/internal/zzeg;

    invoke-virtual {v9, v6, v10}, Lcom/google/android/gms/measurement/internal/zzag;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzeg;)Z

    move-result v9

    const/4 v10, 0x0

    :goto_16
    if-ge v10, v3, :cond_21

    .line 105
    invoke-interface {v0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/util/Pair;

    iget-object v11, v11, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v11, Lcom/google/android/gms/internal/measurement/zzgd;

    invoke-virtual {v11}, Lcom/google/android/gms/internal/measurement/zzlb;->zzbB()Lcom/google/android/gms/internal/measurement/zzkx;

    move-result-object v11

    check-cast v11, Lcom/google/android/gms/internal/measurement/zzgc;

    .line 106
    invoke-interface {v0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/util/Pair;

    iget-object v12, v12, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v12, Ljava/lang/Long;

    invoke-interface {v4, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 107
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v12

    invoke-virtual {v12}, Lcom/google/android/gms/measurement/internal/zzag;->zzh()J

    const-wide/32 v12, 0x12cc8

    invoke-virtual {v11, v12, v13}, Lcom/google/android/gms/internal/measurement/zzgc;->zzam(J)Lcom/google/android/gms/internal/measurement/zzgc;

    move-wide/from16 v12, v20

    .line 108
    invoke-virtual {v11, v12, v13}, Lcom/google/android/gms/internal/measurement/zzgc;->zzal(J)Lcom/google/android/gms/internal/measurement/zzgc;

    iget-object v14, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 109
    invoke-virtual {v14}, Lcom/google/android/gms/measurement/internal/zzge;->zzay()Lcom/google/android/gms/measurement/internal/zzab;

    const/4 v14, 0x0

    .line 110
    invoke-virtual {v11, v14}, Lcom/google/android/gms/internal/measurement/zzgc;->zzag(Z)Lcom/google/android/gms/internal/measurement/zzgc;

    if-nez v5, :cond_1c

    .line 111
    invoke-virtual {v11}, Lcom/google/android/gms/internal/measurement/zzgc;->zzq()Lcom/google/android/gms/internal/measurement/zzgc;

    :cond_1c
    if-nez v7, :cond_1d

    .line 112
    invoke-virtual {v11}, Lcom/google/android/gms/internal/measurement/zzgc;->zzx()Lcom/google/android/gms/internal/measurement/zzgc;

    .line 113
    invoke-virtual {v11}, Lcom/google/android/gms/internal/measurement/zzgc;->zzt()Lcom/google/android/gms/internal/measurement/zzgc;

    :cond_1d
    if-nez v8, :cond_1e

    .line 114
    invoke-virtual {v11}, Lcom/google/android/gms/internal/measurement/zzgc;->zzn()Lcom/google/android/gms/internal/measurement/zzgc;

    .line 115
    :cond_1e
    invoke-virtual {v1, v6, v11}, Lcom/google/android/gms/measurement/internal/zzlg;->zzC(Ljava/lang/String;Lcom/google/android/gms/internal/measurement/zzgc;)V

    if-nez v9, :cond_1f

    .line 116
    invoke-virtual {v11}, Lcom/google/android/gms/internal/measurement/zzgc;->zzy()Lcom/google/android/gms/internal/measurement/zzgc;

    .line 117
    :cond_1f
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v14

    sget-object v15, Lcom/google/android/gms/measurement/internal/zzeh;->zzV:Lcom/google/android/gms/measurement/internal/zzeg;

    invoke-virtual {v14, v6, v15}, Lcom/google/android/gms/measurement/internal/zzag;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzeg;)Z

    move-result v14

    if-eqz v14, :cond_20

    .line 118
    invoke-virtual {v11}, Lcom/google/android/gms/internal/measurement/zzkx;->zzaD()Lcom/google/android/gms/internal/measurement/zzlb;

    move-result-object v14

    check-cast v14, Lcom/google/android/gms/internal/measurement/zzgd;

    invoke-virtual {v14}, Lcom/google/android/gms/internal/measurement/zzjk;->zzbx()[B

    move-result-object v14

    iget-object v15, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzi:Lcom/google/android/gms/measurement/internal/zzli;

    .line 119
    invoke-static {v15}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 120
    invoke-virtual {v15, v14}, Lcom/google/android/gms/measurement/internal/zzli;->zzd([B)J

    move-result-wide v14

    invoke-virtual {v11, v14, v15}, Lcom/google/android/gms/internal/measurement/zzgc;->zzJ(J)Lcom/google/android/gms/internal/measurement/zzgc;

    .line 121
    :cond_20
    invoke-virtual {v2, v11}, Lcom/google/android/gms/internal/measurement/zzga;->zza(Lcom/google/android/gms/internal/measurement/zzgc;)Lcom/google/android/gms/internal/measurement/zzga;

    add-int/lit8 v10, v10, 0x1

    move-wide/from16 v20, v12

    goto :goto_16

    :cond_21
    move-wide/from16 v12, v20

    .line 122
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeu;->zzr()Ljava/lang/String;

    move-result-object v0

    const/4 v5, 0x2

    .line 123
    invoke-static {v0, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_22

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzi:Lcom/google/android/gms/measurement/internal/zzli;

    .line 124
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 125
    invoke-virtual {v2}, Lcom/google/android/gms/internal/measurement/zzkx;->zzaD()Lcom/google/android/gms/internal/measurement/zzlb;

    move-result-object v5

    check-cast v5, Lcom/google/android/gms/internal/measurement/zzgb;

    invoke-virtual {v0, v5}, Lcom/google/android/gms/measurement/internal/zzli;->zzm(Lcom/google/android/gms/internal/measurement/zzgb;)Ljava/lang/String;

    move-result-object v9

    goto :goto_17

    :cond_22
    const/4 v9, 0x0

    :goto_17
    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzi:Lcom/google/android/gms/measurement/internal/zzli;

    .line 126
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 127
    invoke-virtual {v2}, Lcom/google/android/gms/internal/measurement/zzkx;->zzaD()Lcom/google/android/gms/internal/measurement/zzlb;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/measurement/zzgb;

    .line 128
    invoke-virtual {v0}, Lcom/google/android/gms/internal/measurement/zzjk;->zzbx()[B

    move-result-object v14

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzl:Lcom/google/android/gms/measurement/internal/zzkv;

    .line 129
    invoke-virtual {v0, v6}, Lcom/google/android/gms/measurement/internal/zzkv;->zza(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v0
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_6

    .line 130
    :try_start_1c
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v5

    const/4 v7, 0x1

    xor-int/2addr v5, v7

    invoke-static {v5}, Lcom/google/android/gms/common/internal/Preconditions;->checkArgument(Z)V

    iget-object v5, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzy:Ljava/util/List;

    if-eqz v5, :cond_23

    .line 131
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v4

    const-string v5, "Set uploading progress before finishing the previous upload"

    invoke-virtual {v4, v5}, Lcom/google/android/gms/measurement/internal/zzes;->zza(Ljava/lang/String;)V

    goto :goto_18

    .line 8
    :cond_23
    new-instance v5, Ljava/util/ArrayList;

    .line 132
    invoke-direct {v5, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v5, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzy:Ljava/util/List;

    .line 131
    :goto_18
    iget-object v4, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzk:Lcom/google/android/gms/measurement/internal/zzka;

    .line 133
    iget-object v4, v4, Lcom/google/android/gms/measurement/internal/zzka;->zzd:Lcom/google/android/gms/measurement/internal/zzff;

    invoke-virtual {v4, v12, v13}, Lcom/google/android/gms/measurement/internal/zzff;->zzb(J)V

    const-string v4, "?"

    if-lez v3, :cond_24

    const/4 v3, 0x0

    .line 134
    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/measurement/zzga;->zzb(I)Lcom/google/android/gms/internal/measurement/zzgd;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/measurement/zzgd;->zzy()Ljava/lang/String;

    move-result-object v4

    .line 135
    :cond_24
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v2

    .line 136
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v2

    const-string v3, "Uploading data. app, uncompressed size, data"

    array-length v5, v14

    .line 137
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v2, v3, v4, v5, v9}, Lcom/google/android/gms/measurement/internal/zzes;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzu:Z

    iget-object v11, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzd:Lcom/google/android/gms/measurement/internal/zzfa;

    .line 138
    invoke-static {v11}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 139
    new-instance v13, Ljava/net/URL;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzku;->zza()Ljava/lang/String;

    move-result-object v2

    .line 140
    invoke-direct {v13, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzku;->zzb()Ljava/util/Map;

    move-result-object v15

    new-instance v2, Lcom/google/android/gms/measurement/internal/zzkx;

    invoke-direct {v2, v1, v6}, Lcom/google/android/gms/measurement/internal/zzkx;-><init>(Lcom/google/android/gms/measurement/internal/zzlg;Ljava/lang/String;)V

    .line 141
    invoke-virtual {v11}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 142
    invoke-virtual {v11}, Lcom/google/android/gms/measurement/internal/zzkt;->zzW()V

    .line 143
    invoke-static {v13}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    invoke-static {v14}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    invoke-static {v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v3, v11, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 146
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzge;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v3

    new-instance v4, Lcom/google/android/gms/measurement/internal/zzez;

    move-object v10, v4

    move-object v12, v6

    move-object/from16 v16, v2

    .line 147
    invoke-direct/range {v10 .. v16}, Lcom/google/android/gms/measurement/internal/zzez;-><init>(Lcom/google/android/gms/measurement/internal/zzfa;Ljava/lang/String;Ljava/net/URL;[BLjava/util/Map;Lcom/google/android/gms/measurement/internal/zzew;)V

    .line 148
    invoke-virtual {v3, v4}, Lcom/google/android/gms/measurement/internal/zzgb;->zzo(Ljava/lang/Runnable;)V
    :try_end_1c
    .catch Ljava/net/MalformedURLException; {:try_start_1c .. :try_end_1c} :catch_a
    .catchall {:try_start_1c .. :try_end_1c} :catchall_6

    goto/16 :goto_1e

    .line 149
    :catch_a
    :try_start_1d
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v2

    .line 150
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v2

    const-string v3, "Failed to parse upload URL. Not uploading. appId"

    invoke-static {v6}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzku;->zza()Ljava/lang/String;

    move-result-object v0

    .line 151
    invoke-virtual {v2, v3, v4, v0}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_1e

    :catchall_3
    move-exception v0

    move-object v9, v11

    :goto_19
    if-eqz v9, :cond_25

    .line 51
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 83
    :cond_25
    throw v0

    :cond_26
    move-wide v12, v4

    .line 32
    iput-wide v7, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzA:J

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 152
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 153
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    invoke-static {}, Lcom/google/android/gms/measurement/internal/zzag;->zzz()J

    move-result-wide v3

    sub-long v4, v12, v3

    .line 154
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 155
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzkt;->zzW()V
    :try_end_1d
    .catchall {:try_start_1d .. :try_end_1d} :catchall_6

    .line 156
    :try_start_1e
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzam;->zzh()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v3, "select app_id from apps where app_id in (select distinct app_id from raw_events) and config_fetched_time < ? order by failed_config_fetch_time limit 1;"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    .line 157
    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v6, v5

    .line 158
    invoke-virtual {v0, v3, v6}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3
    :try_end_1e
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1e .. :try_end_1e} :catch_c
    .catchall {:try_start_1e .. :try_end_1e} :catchall_4

    .line 159
    :try_start_1f
    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-nez v0, :cond_27

    iget-object v0, v2, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 160
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    .line 161
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v0

    const-string v4, "No expired configs for apps with pending events"

    invoke-virtual {v0, v4}, Lcom/google/android/gms/measurement/internal/zzes;->zza(Ljava/lang/String;)V
    :try_end_1f
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1f .. :try_end_1f} :catch_b
    .catchall {:try_start_1f .. :try_end_1f} :catchall_5

    if-eqz v3, :cond_28

    .line 162
    :goto_1a
    :try_start_20
    invoke-interface {v3}, Landroid/database/Cursor;->close()V
    :try_end_20
    .catchall {:try_start_20 .. :try_end_20} :catchall_6

    goto :goto_1c

    :cond_27
    const/4 v4, 0x0

    .line 163
    :try_start_21
    invoke-interface {v3, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9
    :try_end_21
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_21 .. :try_end_21} :catch_b
    .catchall {:try_start_21 .. :try_end_21} :catchall_5

    if-eqz v3, :cond_29

    .line 162
    :try_start_22
    invoke-interface {v3}, Landroid/database/Cursor;->close()V
    :try_end_22
    .catchall {:try_start_22 .. :try_end_22} :catchall_6

    goto :goto_1d

    :catch_b
    move-exception v0

    goto :goto_1b

    :catchall_4
    move-exception v0

    const/4 v9, 0x0

    goto :goto_1f

    :catch_c
    move-exception v0

    const/4 v3, 0x0

    .line 68
    :goto_1b
    :try_start_23
    iget-object v2, v2, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 164
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v2

    .line 165
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v2

    const-string v4, "Error selecting expired configs"

    invoke-virtual {v2, v4, v0}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_23
    .catchall {:try_start_23 .. :try_end_23} :catchall_5

    if-eqz v3, :cond_28

    goto :goto_1a

    :cond_28
    :goto_1c
    const/4 v9, 0x0

    .line 167
    :cond_29
    :goto_1d
    :try_start_24
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2a

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 168
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 169
    invoke-virtual {v0, v9}, Lcom/google/android/gms/measurement/internal/zzam;->zzj(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzh;

    move-result-object v0

    if-eqz v0, :cond_2a

    .line 170
    invoke-virtual {v1, v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzD(Lcom/google/android/gms/measurement/internal/zzh;)V
    :try_end_24
    .catchall {:try_start_24 .. :try_end_24} :catchall_6

    :cond_2a
    :goto_1e
    const/4 v2, 0x0

    .line 148
    iput-boolean v2, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzv:Z

    goto/16 :goto_0

    :catchall_5
    move-exception v0

    move-object v9, v3

    :goto_1f
    if-eqz v9, :cond_2b

    .line 162
    :try_start_25
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 166
    :cond_2b
    throw v0
    :try_end_25
    .catchall {:try_start_25 .. :try_end_25} :catchall_6

    :catchall_6
    move-exception v0

    const/4 v2, 0x0

    .line 162
    iput-boolean v2, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzv:Z

    .line 8
    invoke-direct/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzae()V

    .line 173
    throw v0
.end method

.method final zzY(Lcom/google/android/gms/measurement/internal/zzaw;Lcom/google/android/gms/measurement/internal/zzq;)V
    .locals 35

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    const-string v4, "metadata_fingerprint"

    const-string v5, "app_id"

    const-string v6, "raw_events"

    const-string v7, "_sno"

    .line 1
    invoke-static/range {p2 .. p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    iget-object v8, v3, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    invoke-static {v8}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 3
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v8

    .line 4
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v10

    invoke-virtual {v10}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 5
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzB()V

    .line 6
    iget-object v10, v3, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    iget-object v11, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzi:Lcom/google/android/gms/measurement/internal/zzli;

    .line 7
    invoke-static {v11}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 8
    invoke-static/range {p1 .. p2}, Lcom/google/android/gms/measurement/internal/zzli;->zzA(Lcom/google/android/gms/measurement/internal/zzaw;Lcom/google/android/gms/measurement/internal/zzq;)Z

    move-result v11

    if-nez v11, :cond_0

    return-void

    .line 9
    :cond_0
    iget-boolean v11, v3, Lcom/google/android/gms/measurement/internal/zzq;->zzh:Z

    if-eqz v11, :cond_3e

    iget-object v11, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzc:Lcom/google/android/gms/measurement/internal/zzfv;

    .line 10
    invoke-static {v11}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 11
    iget-object v12, v2, Lcom/google/android/gms/measurement/internal/zzaw;->zza:Ljava/lang/String;

    invoke-virtual {v11, v10, v12}, Lcom/google/android/gms/measurement/internal/zzfv;->zzr(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v11

    const-string v15, "_err"

    const/4 v14, 0x0

    if-eqz v11, :cond_4

    .line 12
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v3

    .line 13
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzeu;->zzk()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v3

    invoke-static {v10}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    iget-object v5, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 14
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzge;->zzj()Lcom/google/android/gms/measurement/internal/zzep;

    move-result-object v5

    .line 15
    iget-object v6, v2, Lcom/google/android/gms/measurement/internal/zzaw;->zza:Ljava/lang/String;

    invoke-virtual {v5, v6}, Lcom/google/android/gms/measurement/internal/zzep;->zzd(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "Dropping blocked event. appId"

    .line 16
    invoke-virtual {v3, v6, v4, v5}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzc:Lcom/google/android/gms/measurement/internal/zzfv;

    .line 17
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 18
    invoke-virtual {v3, v10}, Lcom/google/android/gms/measurement/internal/zzfv;->zzp(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2

    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzc:Lcom/google/android/gms/measurement/internal/zzfv;

    .line 19
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 20
    invoke-virtual {v3, v10}, Lcom/google/android/gms/measurement/internal/zzfv;->zzs(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    .line 30
    :cond_1
    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzaw;->zza:Ljava/lang/String;

    invoke-virtual {v15, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 31
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzv()Lcom/google/android/gms/measurement/internal/zzlo;

    move-result-object v11

    iget-object v12, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzF:Lcom/google/android/gms/measurement/internal/zzln;

    iget-object v2, v2, Lcom/google/android/gms/measurement/internal/zzaw;->zza:Ljava/lang/String;

    const/16 v14, 0xb

    const/16 v17, 0x0

    const-string v15, "_ev"

    move-object v13, v10

    move-object/from16 v16, v2

    .line 32
    invoke-virtual/range {v11 .. v17}, Lcom/google/android/gms/measurement/internal/zzlo;->zzO(Lcom/google/android/gms/measurement/internal/zzln;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V

    return-void

    .line 20
    :cond_2
    :goto_0
    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 21
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 22
    invoke-virtual {v2, v10}, Lcom/google/android/gms/measurement/internal/zzam;->zzj(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzh;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 23
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzh;->zzl()J

    move-result-wide v3

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzh;->zzc()J

    move-result-wide v5

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v3

    .line 24
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzax()Lcom/google/android/gms/common/util/Clock;

    move-result-object v5

    invoke-interface {v5}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v5

    sub-long/2addr v5, v3

    .line 25
    invoke-static {v5, v6}, Ljava/lang/Math;->abs(J)J

    move-result-wide v3

    .line 26
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    .line 27
    sget-object v5, Lcom/google/android/gms/measurement/internal/zzeh;->zzz:Lcom/google/android/gms/measurement/internal/zzeg;

    invoke-virtual {v5, v14}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    cmp-long v7, v3, v5

    if-lez v7, :cond_3

    .line 28
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzeu;->zzc()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v3

    const-string v4, "Fetching config for blocked app"

    invoke-virtual {v3, v4}, Lcom/google/android/gms/measurement/internal/zzes;->zza(Ljava/lang/String;)V

    .line 29
    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzD(Lcom/google/android/gms/measurement/internal/zzh;)V

    :cond_3
    return-void

    .line 33
    :cond_4
    invoke-static/range {p1 .. p1}, Lcom/google/android/gms/measurement/internal/zzev;->zzb(Lcom/google/android/gms/measurement/internal/zzaw;)Lcom/google/android/gms/measurement/internal/zzev;

    move-result-object v2

    .line 34
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzv()Lcom/google/android/gms/measurement/internal/zzlo;

    move-result-object v11

    .line 35
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v12

    invoke-virtual {v12, v10}, Lcom/google/android/gms/measurement/internal/zzag;->zzd(Ljava/lang/String;)I

    move-result v12

    .line 36
    invoke-virtual {v11, v2, v12}, Lcom/google/android/gms/measurement/internal/zzlo;->zzN(Lcom/google/android/gms/measurement/internal/zzev;I)V

    .line 37
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzpn;->zzc()Z

    .line 38
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v11

    sget-object v12, Lcom/google/android/gms/measurement/internal/zzeh;->zzaA:Lcom/google/android/gms/measurement/internal/zzeg;

    invoke-virtual {v11, v14, v12}, Lcom/google/android/gms/measurement/internal/zzag;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzeg;)Z

    move-result v11

    if-eqz v11, :cond_5

    .line 39
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v11

    sget-object v12, Lcom/google/android/gms/measurement/internal/zzeh;->zzQ:Lcom/google/android/gms/measurement/internal/zzeg;

    const/16 v13, 0xa

    const/16 v14, 0x23

    invoke-virtual {v11, v10, v12, v13, v14}, Lcom/google/android/gms/measurement/internal/zzag;->zzf(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzeg;II)I

    move-result v11

    goto :goto_1

    :cond_5
    const/4 v11, 0x0

    :goto_1
    new-instance v12, Ljava/util/TreeSet;

    iget-object v13, v2, Lcom/google/android/gms/measurement/internal/zzev;->zzd:Landroid/os/Bundle;

    .line 40
    invoke-virtual {v13}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/util/TreeSet;-><init>(Ljava/util/Collection;)V

    .line 41
    invoke-interface {v12}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_6
    :goto_2
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_7

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    const-string v14, "items"

    .line 42
    invoke-virtual {v14, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_6

    .line 43
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzv()Lcom/google/android/gms/measurement/internal/zzlo;

    move-result-object v14

    move-object/from16 v17, v12

    iget-object v12, v2, Lcom/google/android/gms/measurement/internal/zzev;->zzd:Landroid/os/Bundle;

    .line 44
    invoke-virtual {v12, v13}, Landroid/os/Bundle;->getParcelableArray(Ljava/lang/String;)[Landroid/os/Parcelable;

    move-result-object v12

    .line 45
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzpn;->zzc()Z

    .line 46
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v13

    move-object/from16 v18, v15

    sget-object v15, Lcom/google/android/gms/measurement/internal/zzeh;->zzaA:Lcom/google/android/gms/measurement/internal/zzeg;

    move-wide/from16 v28, v8

    const/4 v8, 0x0

    invoke-virtual {v13, v8, v15}, Lcom/google/android/gms/measurement/internal/zzag;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzeg;)Z

    move-result v9

    .line 47
    invoke-virtual {v14, v12, v11, v9}, Lcom/google/android/gms/measurement/internal/zzlo;->zzM([Landroid/os/Parcelable;IZ)V

    move-object/from16 v12, v17

    move-object/from16 v15, v18

    move-wide/from16 v8, v28

    goto :goto_2

    :cond_7
    move-wide/from16 v28, v8

    move-object/from16 v18, v15

    .line 48
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzev;->zza()Lcom/google/android/gms/measurement/internal/zzaw;

    move-result-object v2

    .line 49
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v8

    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzeu;->zzr()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x2

    .line 50
    invoke-static {v8, v9}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v8

    if-eqz v8, :cond_8

    .line 51
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v8

    .line 52
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v8

    iget-object v11, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 53
    invoke-virtual {v11}, Lcom/google/android/gms/measurement/internal/zzge;->zzj()Lcom/google/android/gms/measurement/internal/zzep;

    move-result-object v11

    .line 54
    invoke-virtual {v11, v2}, Lcom/google/android/gms/measurement/internal/zzep;->zzc(Lcom/google/android/gms/measurement/internal/zzaw;)Ljava/lang/String;

    move-result-object v11

    const-string v12, "Logging event"

    invoke-virtual {v8, v12, v11}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    .line 55
    :cond_8
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzpk;->zzc()Z

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v8

    sget-object v11, Lcom/google/android/gms/measurement/internal/zzeh;->zzax:Lcom/google/android/gms/measurement/internal/zzeg;

    const/4 v14, 0x0

    invoke-virtual {v8, v14, v11}, Lcom/google/android/gms/measurement/internal/zzag;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzeg;)Z

    iget-object v8, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 56
    invoke-static {v8}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 57
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzam;->zzw()V

    .line 58
    :try_start_0
    invoke-virtual {v1, v3}, Lcom/google/android/gms/measurement/internal/zzlg;->zzd(Lcom/google/android/gms/measurement/internal/zzq;)Lcom/google/android/gms/measurement/internal/zzh;

    const-string v8, "ecommerce_purchase"

    iget-object v11, v2, Lcom/google/android/gms/measurement/internal/zzaw;->zza:Ljava/lang/String;

    .line 59
    invoke-virtual {v8, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v11, "refund"

    if-nez v8, :cond_a

    :try_start_1
    const-string v8, "purchase"

    iget-object v12, v2, Lcom/google/android/gms/measurement/internal/zzaw;->zza:Ljava/lang/String;

    .line 60
    invoke-virtual {v8, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_a

    iget-object v8, v2, Lcom/google/android/gms/measurement/internal/zzaw;->zza:Ljava/lang/String;

    .line 61
    invoke-virtual {v11, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_9

    goto :goto_3

    :cond_9
    const/4 v8, 0x0

    goto :goto_4

    :cond_a
    :goto_3
    const/4 v8, 0x1

    :goto_4
    const-string v12, "_iap"

    iget-object v13, v2, Lcom/google/android/gms/measurement/internal/zzaw;->zza:Ljava/lang/String;

    .line 62
    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_c

    if-eqz v8, :cond_b

    const/4 v8, 0x1

    goto :goto_5

    :cond_b
    move-object/from16 v32, v4

    move-object/from16 v33, v5

    move-object/from16 v4, v18

    const/4 v5, 0x1

    goto/16 :goto_d

    :cond_c
    :goto_5
    iget-object v12, v2, Lcom/google/android/gms/measurement/internal/zzaw;->zzb:Lcom/google/android/gms/measurement/internal/zzau;

    const-string v13, "currency"

    .line 63
    invoke-virtual {v12, v13}, Lcom/google/android/gms/measurement/internal/zzau;->zzg(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const-string v13, "value"

    if-eqz v8, :cond_f

    :try_start_2
    iget-object v8, v2, Lcom/google/android/gms/measurement/internal/zzaw;->zzb:Lcom/google/android/gms/measurement/internal/zzau;

    .line 64
    invoke-virtual {v8, v13}, Lcom/google/android/gms/measurement/internal/zzau;->zzd(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v16

    const-wide v19, 0x412e848000000000L    # 1000000.0

    mul-double v16, v16, v19

    const-wide/16 v21, 0x0

    cmpl-double v8, v16, v21

    if-nez v8, :cond_d

    iget-object v8, v2, Lcom/google/android/gms/measurement/internal/zzaw;->zzb:Lcom/google/android/gms/measurement/internal/zzau;

    .line 65
    invoke-virtual {v8, v13}, Lcom/google/android/gms/measurement/internal/zzau;->zze(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    move-result-wide v14

    long-to-double v13, v14

    mul-double v16, v13, v19

    :cond_d
    const-wide/high16 v13, 0x43e0000000000000L    # 9.223372036854776E18

    cmpg-double v8, v16, v13

    if-gtz v8, :cond_e

    const-wide/high16 v13, -0x3c20000000000000L    # -9.223372036854776E18

    cmpl-double v8, v16, v13

    if-ltz v8, :cond_e

    .line 74
    invoke-static/range {v16 .. v17}, Ljava/lang/Math;->round(D)J

    move-result-wide v13

    iget-object v8, v2, Lcom/google/android/gms/measurement/internal/zzaw;->zza:Ljava/lang/String;

    .line 75
    invoke-virtual {v11, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_10

    neg-long v13, v13

    goto :goto_6

    .line 66
    :cond_e
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v2

    .line 67
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzk()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v2

    const-string v3, "Data lost. Currency value is too big. appId"

    invoke-static {v10}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 68
    invoke-static/range {v16 .. v17}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    .line 69
    invoke-virtual {v2, v3, v4, v5}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 70
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 71
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzam;->zzC()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 72
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 73
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzam;->zzx()V

    return-void

    :cond_f
    :try_start_3
    iget-object v8, v2, Lcom/google/android/gms/measurement/internal/zzaw;->zzb:Lcom/google/android/gms/measurement/internal/zzau;

    .line 76
    invoke-virtual {v8, v13}, Lcom/google/android/gms/measurement/internal/zzau;->zze(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    move-result-wide v13

    .line 77
    :cond_10
    :goto_6
    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_b

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 78
    invoke-virtual {v12, v8}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v8

    const-string v11, "[A-Z]{3}"

    .line 79
    invoke-virtual {v8, v11}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_b

    const-string v11, "_ltv_"

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v11, v8}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iget-object v11, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 80
    invoke-static {v11}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 81
    invoke-virtual {v11, v10, v8}, Lcom/google/android/gms/measurement/internal/zzam;->zzp(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzll;

    move-result-object v11

    if-eqz v11, :cond_12

    iget-object v11, v11, Lcom/google/android/gms/measurement/internal/zzll;->zze:Ljava/lang/Object;

    .line 82
    instance-of v12, v11, Ljava/lang/Long;

    if-nez v12, :cond_11

    goto :goto_7

    .line 94
    :cond_11
    check-cast v11, Ljava/lang/Long;

    invoke-virtual {v11}, Ljava/lang/Long;->longValue()J

    move-result-wide v11

    new-instance v19, Lcom/google/android/gms/measurement/internal/zzll;

    iget-object v15, v2, Lcom/google/android/gms/measurement/internal/zzaw;->zzc:Ljava/lang/String;

    .line 95
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzax()Lcom/google/android/gms/common/util/Clock;

    move-result-object v16

    invoke-interface/range {v16 .. v16}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v16

    add-long/2addr v11, v13

    .line 96
    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v20

    move-object/from16 v11, v19

    move-object v12, v10

    const/4 v14, 0x0

    move-object v13, v15

    const/4 v9, 0x0

    const/4 v15, 0x0

    move-object v14, v8

    move-object/from16 v8, v18

    move-wide/from16 v15, v16

    move-object/from16 v17, v20

    invoke-direct/range {v11 .. v17}, Lcom/google/android/gms/measurement/internal/zzll;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/Object;)V

    move-object/from16 v32, v4

    move-object/from16 v33, v5

    move-object v4, v8

    move-object/from16 v8, v19

    const/4 v5, 0x1

    goto/16 :goto_c

    :cond_12
    :goto_7
    move-object/from16 v15, v18

    const/4 v9, 0x0

    .line 82
    iget-object v11, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 83
    invoke-static {v11}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 84
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v12

    sget-object v9, Lcom/google/android/gms/measurement/internal/zzeh;->zzE:Lcom/google/android/gms/measurement/internal/zzeg;

    invoke-virtual {v12, v10, v9}, Lcom/google/android/gms/measurement/internal/zzag;->zze(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzeg;)I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    .line 85
    invoke-static {v10}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 86
    invoke-virtual {v11}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 87
    invoke-virtual {v11}, Lcom/google/android/gms/measurement/internal/zzkt;->zzW()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 88
    :try_start_4
    invoke-virtual {v11}, Lcom/google/android/gms/measurement/internal/zzam;->zzh()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v12
    :try_end_4
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-object/from16 v18, v15

    :try_start_5
    const-string v15, "delete from user_attributes where app_id=? and name in (select name from user_attributes where app_id=? and name like \'_ltv_%\' order by set_timestamp desc limit ?,10);"
    :try_end_5
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move-object/from16 v32, v4

    const/4 v4, 0x3

    :try_start_6
    new-array v4, v4, [Ljava/lang/String;

    const/16 v16, 0x0

    aput-object v10, v4, v16
    :try_end_6
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    move-object/from16 v33, v5

    const/4 v5, 0x1

    :try_start_7
    aput-object v10, v4, v5

    .line 89
    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    const/16 v16, 0x2

    aput-object v9, v4, v16

    .line 90
    invoke-virtual {v12, v15, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_7
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_b

    :catch_0
    move-exception v0

    goto :goto_a

    :catch_1
    move-exception v0

    goto :goto_8

    :catch_2
    move-exception v0

    move-object/from16 v32, v4

    :goto_8
    move-object/from16 v33, v5

    goto :goto_9

    :catch_3
    move-exception v0

    move-object/from16 v32, v4

    move-object/from16 v33, v5

    move-object/from16 v18, v15

    :goto_9
    const/4 v5, 0x1

    :goto_a
    move-object v4, v0

    .line 370
    :try_start_8
    iget-object v9, v11, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 91
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v9

    .line 92
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v9

    const-string v11, "Error pruning currencies. appId"

    invoke-static {v10}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v9, v11, v12, v4}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 90
    :goto_b
    new-instance v19, Lcom/google/android/gms/measurement/internal/zzll;

    iget-object v4, v2, Lcom/google/android/gms/measurement/internal/zzaw;->zzc:Ljava/lang/String;

    .line 93
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzax()Lcom/google/android/gms/common/util/Clock;

    move-result-object v9

    invoke-interface {v9}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v15

    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v17

    move-object/from16 v11, v19

    move-object v12, v10

    move-object v13, v4

    move-object v14, v8

    move-object/from16 v4, v18

    invoke-direct/range {v11 .. v17}, Lcom/google/android/gms/measurement/internal/zzll;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/Object;)V

    move-object/from16 v8, v19

    :goto_c
    iget-object v9, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 97
    invoke-static {v9}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 98
    invoke-virtual {v9, v8}, Lcom/google/android/gms/measurement/internal/zzam;->zzL(Lcom/google/android/gms/measurement/internal/zzll;)Z

    move-result v9

    if-nez v9, :cond_13

    .line 99
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v9

    .line 100
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v9

    const-string v11, "Too many unique user properties are set. Ignoring user property. appId"

    invoke-static {v10}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    iget-object v13, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 101
    invoke-virtual {v13}, Lcom/google/android/gms/measurement/internal/zzge;->zzj()Lcom/google/android/gms/measurement/internal/zzep;

    move-result-object v13

    iget-object v14, v8, Lcom/google/android/gms/measurement/internal/zzll;->zzc:Ljava/lang/String;

    .line 102
    invoke-virtual {v13, v14}, Lcom/google/android/gms/measurement/internal/zzep;->zzf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    iget-object v8, v8, Lcom/google/android/gms/measurement/internal/zzll;->zze:Ljava/lang/Object;

    .line 103
    invoke-virtual {v9, v11, v12, v13, v8}, Lcom/google/android/gms/measurement/internal/zzes;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 104
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzv()Lcom/google/android/gms/measurement/internal/zzlo;

    move-result-object v11

    iget-object v12, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzF:Lcom/google/android/gms/measurement/internal/zzln;

    const/16 v14, 0x9

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    move-object v13, v10

    .line 105
    invoke-virtual/range {v11 .. v17}, Lcom/google/android/gms/measurement/internal/zzlo;->zzO(Lcom/google/android/gms/measurement/internal/zzln;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V

    :cond_13
    :goto_d
    iget-object v8, v2, Lcom/google/android/gms/measurement/internal/zzaw;->zza:Ljava/lang/String;

    .line 106
    invoke-static {v8}, Lcom/google/android/gms/measurement/internal/zzlo;->zzak(Ljava/lang/String;)Z

    move-result v8

    iget-object v9, v2, Lcom/google/android/gms/measurement/internal/zzaw;->zza:Ljava/lang/String;

    .line 107
    invoke-virtual {v4, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    .line 108
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzv()Lcom/google/android/gms/measurement/internal/zzlo;

    iget-object v9, v2, Lcom/google/android/gms/measurement/internal/zzaw;->zzb:Lcom/google/android/gms/measurement/internal/zzau;

    if-nez v9, :cond_14

    const-wide/16 v12, 0x0

    goto :goto_f

    .line 175
    :cond_14
    new-instance v11, Lcom/google/android/gms/measurement/internal/zzat;

    .line 109
    invoke-direct {v11, v9}, Lcom/google/android/gms/measurement/internal/zzat;-><init>(Lcom/google/android/gms/measurement/internal/zzau;)V

    const-wide/16 v12, 0x0

    .line 110
    :cond_15
    :goto_e
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_16

    .line 111
    invoke-virtual {v11}, Lcom/google/android/gms/measurement/internal/zzat;->zza()Ljava/lang/String;

    move-result-object v14

    .line 112
    invoke-virtual {v9, v14}, Lcom/google/android/gms/measurement/internal/zzau;->zzf(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v14

    .line 113
    instance-of v15, v14, [Landroid/os/Parcelable;

    if-eqz v15, :cond_15

    .line 114
    check-cast v14, [Landroid/os/Parcelable;

    array-length v14, v14

    int-to-long v14, v14

    add-long/2addr v12, v14

    goto :goto_e

    .line 108
    :cond_16
    :goto_f
    iget-object v11, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 115
    invoke-static {v11}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 116
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zza()J

    move-result-wide v14

    const-wide/16 v22, 0x1

    add-long v18, v12, v22

    const/4 v9, 0x1

    const/16 v20, 0x0

    const/16 v21, 0x0

    move-wide v12, v14

    move-object/from16 v30, v6

    const-wide/16 v5, 0x0

    move-object v14, v10

    move-wide/from16 v15, v18

    move/from16 v17, v9

    move/from16 v18, v8

    move/from16 v19, v20

    move/from16 v20, v4

    .line 117
    invoke-virtual/range {v11 .. v21}, Lcom/google/android/gms/measurement/internal/zzam;->zzm(JLjava/lang/String;JZZZZZ)Lcom/google/android/gms/measurement/internal/zzak;

    move-result-object v9

    iget-wide v11, v9, Lcom/google/android/gms/measurement/internal/zzak;->zzb:J

    .line 118
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    sget-object v13, Lcom/google/android/gms/measurement/internal/zzeh;->zzk:Lcom/google/android/gms/measurement/internal/zzeg;

    const/4 v15, 0x0

    .line 119
    invoke-virtual {v13, v15}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Integer;

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    int-to-long v13, v13

    sub-long/2addr v11, v13

    const-wide/16 v13, 0x3e8

    cmp-long v16, v11, v5

    if-lez v16, :cond_18

    rem-long/2addr v11, v13

    cmp-long v2, v11, v22

    if-nez v2, :cond_17

    .line 120
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v2

    .line 121
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v2

    const-string v3, "Data loss. Too many events logged. appId, count"

    invoke-static {v10}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    iget-wide v5, v9, Lcom/google/android/gms/measurement/internal/zzak;->zzb:J

    .line 122
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    .line 123
    invoke-virtual {v2, v3, v4, v5}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_17
    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 124
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 125
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzam;->zzC()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 72
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 73
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzam;->zzx()V

    return-void

    :cond_18
    if-eqz v8, :cond_1a

    :try_start_9
    iget-wide v11, v9, Lcom/google/android/gms/measurement/internal/zzak;->zza:J

    .line 126
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    sget-object v13, Lcom/google/android/gms/measurement/internal/zzeh;->zzm:Lcom/google/android/gms/measurement/internal/zzeg;

    .line 127
    invoke-virtual {v13, v15}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Integer;

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    int-to-long v13, v13

    sub-long/2addr v11, v13

    cmp-long v13, v11, v5

    if-lez v13, :cond_1a

    const-wide/16 v13, 0x3e8

    rem-long/2addr v11, v13

    cmp-long v3, v11, v22

    if-nez v3, :cond_19

    .line 362
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v3

    .line 363
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v3

    const-string v4, "Data loss. Too many public events logged. appId, count"

    invoke-static {v10}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    iget-wide v6, v9, Lcom/google/android/gms/measurement/internal/zzak;->zza:J

    .line 364
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    .line 365
    invoke-virtual {v3, v4, v5, v6}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 366
    :cond_19
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzv()Lcom/google/android/gms/measurement/internal/zzlo;

    move-result-object v11

    iget-object v12, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzF:Lcom/google/android/gms/measurement/internal/zzln;

    const/16 v14, 0x10

    const-string v15, "_ev"

    iget-object v2, v2, Lcom/google/android/gms/measurement/internal/zzaw;->zza:Ljava/lang/String;

    const/16 v17, 0x0

    move-object v13, v10

    move-object/from16 v16, v2

    .line 367
    invoke-virtual/range {v11 .. v17}, Lcom/google/android/gms/measurement/internal/zzlo;->zzO(Lcom/google/android/gms/measurement/internal/zzln;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 368
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 369
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzam;->zzC()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 72
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 73
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzam;->zzx()V

    return-void

    :cond_1a
    const v11, 0xf4240

    if-eqz v4, :cond_1c

    :try_start_a
    iget-wide v12, v9, Lcom/google/android/gms/measurement/internal/zzak;->zzd:J

    .line 128
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v4

    iget-object v14, v3, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    sget-object v15, Lcom/google/android/gms/measurement/internal/zzeh;->zzl:Lcom/google/android/gms/measurement/internal/zzeg;

    invoke-virtual {v4, v14, v15}, Lcom/google/android/gms/measurement/internal/zzag;->zze(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzeg;)I

    move-result v4

    .line 129
    invoke-static {v11, v4}, Ljava/lang/Math;->min(II)I

    move-result v4

    const/4 v14, 0x0

    .line 130
    invoke-static {v14, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    int-to-long v14, v4

    sub-long/2addr v12, v14

    cmp-long v4, v12, v5

    if-lez v4, :cond_1c

    cmp-long v2, v12, v22

    if-nez v2, :cond_1b

    .line 356
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v2

    .line 357
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v2

    const-string v3, "Too many error events logged. appId, count"

    invoke-static {v10}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    iget-wide v5, v9, Lcom/google/android/gms/measurement/internal/zzak;->zzd:J

    .line 358
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    .line 359
    invoke-virtual {v2, v3, v4, v5}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_1b
    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 360
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 361
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzam;->zzC()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 72
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 73
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzam;->zzx()V

    return-void

    :cond_1c
    :try_start_b
    iget-object v4, v2, Lcom/google/android/gms/measurement/internal/zzaw;->zzb:Lcom/google/android/gms/measurement/internal/zzau;

    .line 131
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzau;->zzc()Landroid/os/Bundle;

    move-result-object v4

    .line 132
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzv()Lcom/google/android/gms/measurement/internal/zzlo;

    move-result-object v9

    const-string v12, "_o"

    iget-object v13, v2, Lcom/google/android/gms/measurement/internal/zzaw;->zzc:Ljava/lang/String;

    invoke-virtual {v9, v4, v12, v13}, Lcom/google/android/gms/measurement/internal/zzlo;->zzP(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Object;)V

    .line 133
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzv()Lcom/google/android/gms/measurement/internal/zzlo;

    move-result-object v9

    invoke-virtual {v9, v10}, Lcom/google/android/gms/measurement/internal/zzlo;->zzaf(Ljava/lang/String;)Z

    move-result v9
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    const-string v15, "_r"

    if-eqz v9, :cond_1d

    .line 134
    :try_start_c
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzv()Lcom/google/android/gms/measurement/internal/zzlo;

    move-result-object v9

    const-string v12, "_dbg"

    invoke-static/range {v22 .. v23}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    invoke-virtual {v9, v4, v12, v13}, Lcom/google/android/gms/measurement/internal/zzlo;->zzP(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Object;)V

    .line 135
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzv()Lcom/google/android/gms/measurement/internal/zzlo;

    move-result-object v9

    invoke-virtual {v9, v4, v15, v13}, Lcom/google/android/gms/measurement/internal/zzlo;->zzP(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_1d
    const-string v9, "_s"

    iget-object v12, v2, Lcom/google/android/gms/measurement/internal/zzaw;->zza:Ljava/lang/String;

    .line 136
    invoke-virtual {v9, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1e

    iget-object v9, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 137
    invoke-static {v9}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 138
    iget-object v12, v3, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    .line 139
    invoke-virtual {v9, v12, v7}, Lcom/google/android/gms/measurement/internal/zzam;->zzp(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzll;

    move-result-object v9

    if-eqz v9, :cond_1e

    iget-object v12, v9, Lcom/google/android/gms/measurement/internal/zzll;->zze:Ljava/lang/Object;

    .line 140
    instance-of v12, v12, Ljava/lang/Long;

    if-eqz v12, :cond_1e

    .line 141
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzv()Lcom/google/android/gms/measurement/internal/zzlo;

    move-result-object v12

    iget-object v9, v9, Lcom/google/android/gms/measurement/internal/zzll;->zze:Ljava/lang/Object;

    invoke-virtual {v12, v4, v7, v9}, Lcom/google/android/gms/measurement/internal/zzlo;->zzP(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_1e
    iget-object v7, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 142
    invoke-static {v7}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 143
    invoke-static {v10}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 144
    invoke-virtual {v7}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 145
    invoke-virtual {v7}, Lcom/google/android/gms/measurement/internal/zzkt;->zzW()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 146
    :try_start_d
    invoke-virtual {v7}, Lcom/google/android/gms/measurement/internal/zzam;->zzh()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v9

    iget-object v12, v7, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 147
    invoke-virtual {v12}, Lcom/google/android/gms/measurement/internal/zzge;->zzf()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v12

    sget-object v13, Lcom/google/android/gms/measurement/internal/zzeh;->zzp:Lcom/google/android/gms/measurement/internal/zzeg;

    .line 148
    invoke-virtual {v12, v10, v13}, Lcom/google/android/gms/measurement/internal/zzag;->zze(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzeg;)I

    move-result v12

    .line 149
    invoke-static {v11, v12}, Ljava/lang/Math;->min(II)I

    move-result v11
    :try_end_d
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_d .. :try_end_d} :catch_6
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    const/4 v14, 0x0

    .line 150
    :try_start_e
    invoke-static {v14, v11}, Ljava/lang/Math;->max(II)I

    move-result v11

    .line 148
    invoke-static {v11}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v11

    const-string v12, "rowid in (select rowid from raw_events where app_id=? order by rowid desc limit -1 offset ?)"

    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/String;

    aput-object v10, v13, v14

    const/16 v17, 0x1

    aput-object v11, v13, v17
    :try_end_e
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_e .. :try_end_e} :catch_5
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    move-object/from16 v11, v30

    .line 151
    :try_start_f
    invoke-virtual {v9, v11, v12, v13}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v7
    :try_end_f
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_f .. :try_end_f} :catch_4
    .catchall {:try_start_f .. :try_end_f} :catchall_0

    int-to-long v12, v7

    goto :goto_11

    :catch_4
    move-exception v0

    goto :goto_10

    :catch_5
    move-exception v0

    move-object/from16 v11, v30

    goto :goto_10

    :catch_6
    move-exception v0

    move-object/from16 v11, v30

    const/4 v14, 0x0

    :goto_10
    move-object v9, v0

    .line 92
    :try_start_10
    iget-object v7, v7, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 152
    invoke-virtual {v7}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v7

    .line 153
    invoke-virtual {v7}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v7

    const-string v12, "Error deleting over the limit events. appId"

    invoke-static {v10}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    .line 154
    invoke-virtual {v7, v12, v13, v9}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    move-wide v12, v5

    :goto_11
    cmp-long v7, v12, v5

    if-lez v7, :cond_1f

    .line 155
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v7

    .line 156
    invoke-virtual {v7}, Lcom/google/android/gms/measurement/internal/zzeu;->zzk()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v7

    const-string v9, "Data lost. Too many events stored on disk, deleted. appId"

    invoke-static {v10}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v14

    .line 157
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    .line 158
    invoke-virtual {v7, v9, v14, v12}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_1f
    new-instance v7, Lcom/google/android/gms/measurement/internal/zzar;

    iget-object v12, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    iget-object v13, v2, Lcom/google/android/gms/measurement/internal/zzaw;->zzc:Ljava/lang/String;

    iget-object v9, v2, Lcom/google/android/gms/measurement/internal/zzaw;->zza:Ljava/lang/String;

    iget-wide v5, v2, Lcom/google/android/gms/measurement/internal/zzaw;->zzd:J

    const-wide/16 v18, 0x0

    move-object v2, v11

    move-object v11, v7

    const/16 v31, 0x0

    move-object v14, v10

    move-object/from16 p1, v2

    move-object/from16 v34, v15

    const/4 v2, 0x0

    move-object v15, v9

    move-wide/from16 v16, v5

    move-object/from16 v20, v4

    .line 159
    invoke-direct/range {v11 .. v20}, Lcom/google/android/gms/measurement/internal/zzar;-><init>(Lcom/google/android/gms/measurement/internal/zzge;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJLandroid/os/Bundle;)V

    iget-object v4, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 160
    invoke-static {v4}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    iget-object v5, v7, Lcom/google/android/gms/measurement/internal/zzar;->zzb:Ljava/lang/String;

    .line 161
    invoke-virtual {v4, v10, v5}, Lcom/google/android/gms/measurement/internal/zzam;->zzn(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzas;

    move-result-object v4

    if-nez v4, :cond_21

    iget-object v4, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 162
    invoke-static {v4}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 163
    invoke-virtual {v4, v10}, Lcom/google/android/gms/measurement/internal/zzam;->zzf(Ljava/lang/String;)J

    move-result-wide v4

    .line 164
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v6

    invoke-virtual {v6, v10}, Lcom/google/android/gms/measurement/internal/zzag;->zzb(Ljava/lang/String;)I

    move-result v6

    int-to-long v11, v6

    cmp-long v6, v4, v11

    if-ltz v6, :cond_20

    if-eqz v8, :cond_20

    .line 166
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v2

    .line 167
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v2

    const-string v3, "Too many event names used, ignoring event. appId, name, supported count"

    invoke-static {v10}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    iget-object v5, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 168
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzge;->zzj()Lcom/google/android/gms/measurement/internal/zzep;

    move-result-object v5

    iget-object v6, v7, Lcom/google/android/gms/measurement/internal/zzar;->zzb:Ljava/lang/String;

    .line 169
    invoke-virtual {v5, v6}, Lcom/google/android/gms/measurement/internal/zzep;->zzd(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 170
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v6

    invoke-virtual {v6, v10}, Lcom/google/android/gms/measurement/internal/zzag;->zzb(Ljava/lang/String;)I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    .line 171
    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/google/android/gms/measurement/internal/zzes;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 172
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzv()Lcom/google/android/gms/measurement/internal/zzlo;

    move-result-object v11

    iget-object v12, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzF:Lcom/google/android/gms/measurement/internal/zzln;

    const/16 v14, 0x8

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    move-object v13, v10

    .line 173
    invoke-virtual/range {v11 .. v17}, Lcom/google/android/gms/measurement/internal/zzlo;->zzO(Lcom/google/android/gms/measurement/internal/zzln;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_0

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 72
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 73
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzam;->zzx()V

    return-void

    :cond_20
    :try_start_11
    new-instance v4, Lcom/google/android/gms/measurement/internal/zzas;

    iget-object v13, v7, Lcom/google/android/gms/measurement/internal/zzar;->zzb:Ljava/lang/String;

    iget-wide v5, v7, Lcom/google/android/gms/measurement/internal/zzar;->zzd:J

    const-wide/16 v14, 0x0

    const-wide/16 v16, 0x0

    const-wide/16 v18, 0x0

    const-wide/16 v22, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    move-object v11, v4

    move-object v12, v10

    move-wide/from16 v20, v5

    .line 165
    invoke-direct/range {v11 .. v27}, Lcom/google/android/gms/measurement/internal/zzas;-><init>(Ljava/lang/String;Ljava/lang/String;JJJJJLjava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Boolean;)V

    goto :goto_12

    .line 215
    :cond_21
    iget-object v5, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    iget-wide v8, v4, Lcom/google/android/gms/measurement/internal/zzas;->zzf:J

    .line 174
    invoke-virtual {v7, v5, v8, v9}, Lcom/google/android/gms/measurement/internal/zzar;->zza(Lcom/google/android/gms/measurement/internal/zzge;J)Lcom/google/android/gms/measurement/internal/zzar;

    move-result-object v7

    iget-wide v5, v7, Lcom/google/android/gms/measurement/internal/zzar;->zzd:J

    .line 175
    invoke-virtual {v4, v5, v6}, Lcom/google/android/gms/measurement/internal/zzas;->zzc(J)Lcom/google/android/gms/measurement/internal/zzas;

    move-result-object v4

    .line 165
    :goto_12
    iget-object v5, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 176
    invoke-static {v5}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 177
    invoke-virtual {v5, v4}, Lcom/google/android/gms/measurement/internal/zzam;->zzE(Lcom/google/android/gms/measurement/internal/zzas;)V

    .line 178
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 179
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzB()V

    .line 180
    invoke-static {v7}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    invoke-static/range {p2 .. p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v4, v7, Lcom/google/android/gms/measurement/internal/zzar;->zza:Ljava/lang/String;

    .line 182
    invoke-static {v4}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    iget-object v4, v7, Lcom/google/android/gms/measurement/internal/zzar;->zza:Ljava/lang/String;

    .line 183
    iget-object v5, v3, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    invoke-static {v4}, Lcom/google/android/gms/common/internal/Preconditions;->checkArgument(Z)V

    .line 184
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzgd;->zzu()Lcom/google/android/gms/internal/measurement/zzgc;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Lcom/google/android/gms/internal/measurement/zzgc;->zzad(I)Lcom/google/android/gms/internal/measurement/zzgc;

    const-string v6, "android"

    invoke-virtual {v4, v6}, Lcom/google/android/gms/internal/measurement/zzgc;->zzZ(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzgc;

    .line 185
    iget-object v6, v3, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_22

    .line 186
    iget-object v6, v3, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    invoke-virtual {v4, v6}, Lcom/google/android/gms/internal/measurement/zzgc;->zzD(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzgc;

    .line 187
    :cond_22
    iget-object v6, v3, Lcom/google/android/gms/measurement/internal/zzq;->zzd:Ljava/lang/String;

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_23

    .line 188
    iget-object v6, v3, Lcom/google/android/gms/measurement/internal/zzq;->zzd:Ljava/lang/String;

    invoke-virtual {v4, v6}, Lcom/google/android/gms/internal/measurement/zzgc;->zzF(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzgc;

    .line 189
    :cond_23
    iget-object v6, v3, Lcom/google/android/gms/measurement/internal/zzq;->zzc:Ljava/lang/String;

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_24

    .line 190
    iget-object v6, v3, Lcom/google/android/gms/measurement/internal/zzq;->zzc:Ljava/lang/String;

    invoke-virtual {v4, v6}, Lcom/google/android/gms/internal/measurement/zzgc;->zzG(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzgc;

    .line 191
    :cond_24
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzqr;->zzc()Z

    iget-object v6, v3, Lcom/google/android/gms/measurement/internal/zzq;->zzx:Ljava/lang/String;

    .line 192
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_26

    .line 193
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v6

    sget-object v8, Lcom/google/android/gms/measurement/internal/zzeh;->zzam:Lcom/google/android/gms/measurement/internal/zzeg;

    invoke-virtual {v6, v2, v8}, Lcom/google/android/gms/measurement/internal/zzag;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzeg;)Z

    move-result v6

    if-nez v6, :cond_25

    .line 194
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v6

    iget-object v8, v3, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    sget-object v9, Lcom/google/android/gms/measurement/internal/zzeh;->zzao:Lcom/google/android/gms/measurement/internal/zzeg;

    invoke-virtual {v6, v8, v9}, Lcom/google/android/gms/measurement/internal/zzag;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzeg;)Z

    move-result v6

    if-eqz v6, :cond_26

    .line 195
    :cond_25
    iget-object v6, v3, Lcom/google/android/gms/measurement/internal/zzq;->zzx:Ljava/lang/String;

    invoke-virtual {v4, v6}, Lcom/google/android/gms/internal/measurement/zzgc;->zzah(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzgc;

    .line 196
    :cond_26
    iget-wide v8, v3, Lcom/google/android/gms/measurement/internal/zzq;->zzj:J

    const-wide/32 v10, -0x80000000

    cmp-long v6, v8, v10

    if-eqz v6, :cond_27

    long-to-int v6, v8

    .line 197
    invoke-virtual {v4, v6}, Lcom/google/android/gms/internal/measurement/zzgc;->zzH(I)Lcom/google/android/gms/internal/measurement/zzgc;

    .line 198
    :cond_27
    iget-wide v8, v3, Lcom/google/android/gms/measurement/internal/zzq;->zze:J

    invoke-virtual {v4, v8, v9}, Lcom/google/android/gms/internal/measurement/zzgc;->zzV(J)Lcom/google/android/gms/internal/measurement/zzgc;

    .line 199
    iget-object v6, v3, Lcom/google/android/gms/measurement/internal/zzq;->zzb:Ljava/lang/String;

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_28

    .line 200
    iget-object v6, v3, Lcom/google/android/gms/measurement/internal/zzq;->zzb:Ljava/lang/String;

    invoke-virtual {v4, v6}, Lcom/google/android/gms/internal/measurement/zzgc;->zzU(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzgc;

    .line 201
    :cond_28
    iget-object v6, v3, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    .line 202
    invoke-static {v6}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v1, v6}, Lcom/google/android/gms/measurement/internal/zzlg;->zzh(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzai;

    move-result-object v6

    iget-object v8, v3, Lcom/google/android/gms/measurement/internal/zzq;->zzv:Ljava/lang/String;

    .line 203
    invoke-static {v8}, Lcom/google/android/gms/measurement/internal/zzai;->zzb(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzai;

    move-result-object v8

    invoke-virtual {v6, v8}, Lcom/google/android/gms/measurement/internal/zzai;->zzc(Lcom/google/android/gms/measurement/internal/zzai;)Lcom/google/android/gms/measurement/internal/zzai;

    move-result-object v6

    .line 204
    invoke-virtual {v6}, Lcom/google/android/gms/measurement/internal/zzai;->zzh()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Lcom/google/android/gms/internal/measurement/zzgc;->zzL(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzgc;

    .line 205
    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/zzgc;->zzar()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_29

    iget-object v6, v3, Lcom/google/android/gms/measurement/internal/zzq;->zzq:Ljava/lang/String;

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_29

    .line 206
    iget-object v6, v3, Lcom/google/android/gms/measurement/internal/zzq;->zzq:Ljava/lang/String;

    invoke-virtual {v4, v6}, Lcom/google/android/gms/internal/measurement/zzgc;->zzC(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzgc;

    .line 207
    :cond_29
    iget-wide v8, v3, Lcom/google/android/gms/measurement/internal/zzq;->zzf:J

    const-wide/16 v10, 0x0

    cmp-long v6, v8, v10

    if-eqz v6, :cond_2a

    .line 208
    invoke-virtual {v4, v8, v9}, Lcom/google/android/gms/internal/measurement/zzgc;->zzM(J)Lcom/google/android/gms/internal/measurement/zzgc;

    .line 209
    :cond_2a
    iget-wide v8, v3, Lcom/google/android/gms/measurement/internal/zzq;->zzs:J

    invoke-virtual {v4, v8, v9}, Lcom/google/android/gms/internal/measurement/zzgc;->zzP(J)Lcom/google/android/gms/internal/measurement/zzgc;

    iget-object v6, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzi:Lcom/google/android/gms/measurement/internal/zzli;

    .line 210
    invoke-static {v6}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    iget-object v8, v6, Lcom/google/android/gms/measurement/internal/zzli;->zzf:Lcom/google/android/gms/measurement/internal/zzlg;

    iget-object v8, v8, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 211
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzge;->zzaw()Landroid/content/Context;

    move-result-object v8

    .line 212
    invoke-virtual {v8}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    const-string v9, "com.google.android.gms.measurement"

    .line 213
    invoke-static {v9}, Lcom/google/android/gms/internal/measurement/zzhq;->zza(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    sget-object v10, Lcom/google/android/gms/measurement/internal/zzay;->zza:Lcom/google/android/gms/measurement/internal/zzay;

    .line 214
    invoke-static {v8, v9, v10}, Lcom/google/android/gms/internal/measurement/zzhf;->zza(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/Runnable;)Lcom/google/android/gms/internal/measurement/zzhf;

    move-result-object v8

    if-nez v8, :cond_2b

    .line 215
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v8

    goto :goto_13

    :cond_2b
    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/zzhf;->zzc()Ljava/util/Map;

    move-result-object v8

    :goto_13
    if-eqz v8, :cond_2f

    .line 216
    invoke-interface {v8}, Ljava/util/Map;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_2c

    goto/16 :goto_16

    .line 327
    :cond_2c
    new-instance v14, Ljava/util/ArrayList;

    .line 217
    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    sget-object v9, Lcom/google/android/gms/measurement/internal/zzeh;->zzP:Lcom/google/android/gms/measurement/internal/zzeg;

    .line 218
    invoke-virtual {v9, v2}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    .line 219
    invoke-interface {v8}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_2d
    :goto_14
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_2e

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/Map$Entry;

    .line 220
    invoke-interface {v10}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    const-string v12, "measurement.id."

    invoke-virtual {v11, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_0

    if-eqz v11, :cond_2d

    .line 221
    :try_start_12
    invoke-interface {v10}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    if-eqz v10, :cond_2d

    .line 222
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-interface {v14, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 223
    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v10

    if-lt v10, v9, :cond_2d

    iget-object v10, v6, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 224
    invoke-virtual {v10}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v10

    .line 225
    invoke-virtual {v10}, Lcom/google/android/gms/measurement/internal/zzeu;->zzk()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v10

    const-string v11, "Too many experiment IDs. Number of IDs"

    .line 226
    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v10, v11, v12}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_12
    .catch Ljava/lang/NumberFormatException; {:try_start_12 .. :try_end_12} :catch_7
    .catchall {:try_start_12 .. :try_end_12} :catchall_0

    goto :goto_15

    :catch_7
    move-exception v0

    move-object v10, v0

    .line 348
    :try_start_13
    iget-object v11, v6, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 227
    invoke-virtual {v11}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v11

    .line 228
    invoke-virtual {v11}, Lcom/google/android/gms/measurement/internal/zzeu;->zzk()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v11

    const-string v12, "Experiment ID NumberFormatException"

    invoke-virtual {v11, v12, v10}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_14

    .line 229
    :cond_2e
    :goto_15
    invoke-interface {v14}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_30

    :cond_2f
    :goto_16
    move-object v14, v2

    :cond_30
    if-eqz v14, :cond_31

    .line 230
    invoke-virtual {v4, v14}, Lcom/google/android/gms/internal/measurement/zzgc;->zzh(Ljava/lang/Iterable;)Lcom/google/android/gms/internal/measurement/zzgc;

    .line 231
    :cond_31
    iget-object v6, v3, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    .line 232
    invoke-static {v6}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v1, v6}, Lcom/google/android/gms/measurement/internal/zzlg;->zzh(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzai;

    move-result-object v6

    iget-object v8, v3, Lcom/google/android/gms/measurement/internal/zzq;->zzv:Ljava/lang/String;

    .line 233
    invoke-static {v8}, Lcom/google/android/gms/measurement/internal/zzai;->zzb(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzai;

    move-result-object v8

    invoke-virtual {v6, v8}, Lcom/google/android/gms/measurement/internal/zzai;->zzc(Lcom/google/android/gms/measurement/internal/zzai;)Lcom/google/android/gms/measurement/internal/zzai;

    move-result-object v6

    .line 234
    sget-object v8, Lcom/google/android/gms/measurement/internal/zzah;->zza:Lcom/google/android/gms/measurement/internal/zzah;

    invoke-virtual {v6, v8}, Lcom/google/android/gms/measurement/internal/zzai;->zzi(Lcom/google/android/gms/measurement/internal/zzah;)Z

    move-result v8

    if-eqz v8, :cond_32

    .line 235
    iget-boolean v8, v3, Lcom/google/android/gms/measurement/internal/zzq;->zzo:Z

    if-eqz v8, :cond_32

    iget-object v8, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzk:Lcom/google/android/gms/measurement/internal/zzka;

    .line 236
    iget-object v9, v3, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    .line 237
    invoke-virtual {v8, v9, v6}, Lcom/google/android/gms/measurement/internal/zzka;->zzd(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzai;)Landroid/util/Pair;

    move-result-object v8

    .line 238
    iget-object v9, v8, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v9, Ljava/lang/CharSequence;

    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_32

    .line 239
    iget-boolean v9, v3, Lcom/google/android/gms/measurement/internal/zzq;->zzo:Z

    if-eqz v9, :cond_32

    .line 240
    iget-object v9, v8, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v9, Ljava/lang/String;

    invoke-virtual {v4, v9}, Lcom/google/android/gms/internal/measurement/zzgc;->zzae(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzgc;

    .line 241
    iget-object v9, v8, Landroid/util/Pair;->second:Ljava/lang/Object;

    if-eqz v9, :cond_32

    .line 242
    iget-object v8, v8, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v8, Ljava/lang/Boolean;

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    invoke-virtual {v4, v8}, Lcom/google/android/gms/internal/measurement/zzgc;->zzX(Z)Lcom/google/android/gms/internal/measurement/zzgc;

    :cond_32
    iget-object v8, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 243
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzge;->zzg()Lcom/google/android/gms/measurement/internal/zzaq;

    move-result-object v8

    .line 244
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzgy;->zzv()V

    sget-object v8, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v4, v8}, Lcom/google/android/gms/internal/measurement/zzgc;->zzN(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzgc;

    iget-object v8, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 245
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzge;->zzg()Lcom/google/android/gms/measurement/internal/zzaq;

    move-result-object v8

    .line 246
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzgy;->zzv()V

    sget-object v8, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v4, v8}, Lcom/google/android/gms/internal/measurement/zzgc;->zzY(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzgc;

    iget-object v8, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 247
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzge;->zzg()Lcom/google/android/gms/measurement/internal/zzaq;

    move-result-object v8

    .line 248
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzaq;->zzb()J

    move-result-wide v8

    long-to-int v9, v8

    invoke-virtual {v4, v9}, Lcom/google/android/gms/internal/measurement/zzgc;->zzak(I)Lcom/google/android/gms/internal/measurement/zzgc;

    iget-object v8, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 249
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzge;->zzg()Lcom/google/android/gms/measurement/internal/zzaq;

    move-result-object v8

    .line 250
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzaq;->zzc()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Lcom/google/android/gms/internal/measurement/zzgc;->zzao(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzgc;

    .line 251
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzpw;->zzc()Z

    .line 252
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v8

    sget-object v9, Lcom/google/android/gms/measurement/internal/zzeh;->zzaE:Lcom/google/android/gms/measurement/internal/zzeg;

    invoke-virtual {v8, v2, v9}, Lcom/google/android/gms/measurement/internal/zzag;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzeg;)Z

    move-result v8

    if-eqz v8, :cond_33

    .line 253
    iget-wide v8, v3, Lcom/google/android/gms/measurement/internal/zzq;->zzz:J

    invoke-virtual {v4, v8, v9}, Lcom/google/android/gms/internal/measurement/zzgc;->zzaj(J)Lcom/google/android/gms/internal/measurement/zzgc;

    :cond_33
    iget-object v8, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 254
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzge;->zzJ()Z

    move-result v8

    if-eqz v8, :cond_34

    .line 255
    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/zzgc;->zzaq()Ljava/lang/String;

    .line 256
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_34

    .line 257
    invoke-virtual {v4, v2}, Lcom/google/android/gms/internal/measurement/zzgc;->zzO(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzgc;

    :cond_34
    iget-object v8, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 258
    invoke-static {v8}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 259
    iget-object v9, v3, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    invoke-virtual {v8, v9}, Lcom/google/android/gms/measurement/internal/zzam;->zzj(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzh;

    move-result-object v8

    if-nez v8, :cond_36

    new-instance v8, Lcom/google/android/gms/measurement/internal/zzh;

    iget-object v9, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 260
    iget-object v10, v3, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    invoke-direct {v8, v9, v10}, Lcom/google/android/gms/measurement/internal/zzh;-><init>(Lcom/google/android/gms/measurement/internal/zzge;Ljava/lang/String;)V

    .line 261
    invoke-virtual {v1, v6}, Lcom/google/android/gms/measurement/internal/zzlg;->zzw(Lcom/google/android/gms/measurement/internal/zzai;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/google/android/gms/measurement/internal/zzh;->zzI(Ljava/lang/String;)V

    .line 262
    iget-object v9, v3, Lcom/google/android/gms/measurement/internal/zzq;->zzk:Ljava/lang/String;

    invoke-virtual {v8, v9}, Lcom/google/android/gms/measurement/internal/zzh;->zzW(Ljava/lang/String;)V

    .line 263
    iget-object v9, v3, Lcom/google/android/gms/measurement/internal/zzq;->zzb:Ljava/lang/String;

    invoke-virtual {v8, v9}, Lcom/google/android/gms/measurement/internal/zzh;->zzX(Ljava/lang/String;)V

    sget-object v9, Lcom/google/android/gms/measurement/internal/zzah;->zza:Lcom/google/android/gms/measurement/internal/zzah;

    .line 264
    invoke-virtual {v6, v9}, Lcom/google/android/gms/measurement/internal/zzai;->zzi(Lcom/google/android/gms/measurement/internal/zzah;)Z

    move-result v9

    if-eqz v9, :cond_35

    iget-object v9, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzk:Lcom/google/android/gms/measurement/internal/zzka;

    .line 265
    iget-object v10, v3, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    iget-boolean v11, v3, Lcom/google/android/gms/measurement/internal/zzq;->zzo:Z

    .line 266
    invoke-virtual {v9, v10, v11}, Lcom/google/android/gms/measurement/internal/zzka;->zzf(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v9

    .line 267
    invoke-virtual {v8, v9}, Lcom/google/android/gms/measurement/internal/zzh;->zzaf(Ljava/lang/String;)V

    :cond_35
    const-wide/16 v9, 0x0

    .line 268
    invoke-virtual {v8, v9, v10}, Lcom/google/android/gms/measurement/internal/zzh;->zzab(J)V

    .line 269
    invoke-virtual {v8, v9, v10}, Lcom/google/android/gms/measurement/internal/zzh;->zzac(J)V

    .line 270
    invoke-virtual {v8, v9, v10}, Lcom/google/android/gms/measurement/internal/zzh;->zzaa(J)V

    .line 271
    iget-object v9, v3, Lcom/google/android/gms/measurement/internal/zzq;->zzc:Ljava/lang/String;

    invoke-virtual {v8, v9}, Lcom/google/android/gms/measurement/internal/zzh;->zzK(Ljava/lang/String;)V

    .line 272
    iget-wide v9, v3, Lcom/google/android/gms/measurement/internal/zzq;->zzj:J

    invoke-virtual {v8, v9, v10}, Lcom/google/android/gms/measurement/internal/zzh;->zzL(J)V

    .line 273
    iget-object v9, v3, Lcom/google/android/gms/measurement/internal/zzq;->zzd:Ljava/lang/String;

    invoke-virtual {v8, v9}, Lcom/google/android/gms/measurement/internal/zzh;->zzJ(Ljava/lang/String;)V

    .line 274
    iget-wide v9, v3, Lcom/google/android/gms/measurement/internal/zzq;->zze:J

    invoke-virtual {v8, v9, v10}, Lcom/google/android/gms/measurement/internal/zzh;->zzY(J)V

    .line 275
    iget-wide v9, v3, Lcom/google/android/gms/measurement/internal/zzq;->zzf:J

    invoke-virtual {v8, v9, v10}, Lcom/google/android/gms/measurement/internal/zzh;->zzT(J)V

    .line 276
    iget-boolean v9, v3, Lcom/google/android/gms/measurement/internal/zzq;->zzh:Z

    invoke-virtual {v8, v9}, Lcom/google/android/gms/measurement/internal/zzh;->zzad(Z)V

    .line 277
    iget-wide v9, v3, Lcom/google/android/gms/measurement/internal/zzq;->zzs:J

    invoke-virtual {v8, v9, v10}, Lcom/google/android/gms/measurement/internal/zzh;->zzU(J)V

    iget-object v9, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 278
    invoke-static {v9}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 279
    invoke-virtual {v9, v8}, Lcom/google/android/gms/measurement/internal/zzam;->zzD(Lcom/google/android/gms/measurement/internal/zzh;)V

    :cond_36
    sget-object v9, Lcom/google/android/gms/measurement/internal/zzah;->zzb:Lcom/google/android/gms/measurement/internal/zzah;

    .line 280
    invoke-virtual {v6, v9}, Lcom/google/android/gms/measurement/internal/zzai;->zzi(Lcom/google/android/gms/measurement/internal/zzah;)Z

    move-result v6

    if-eqz v6, :cond_37

    .line 281
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzh;->zzv()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_37

    .line 282
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzh;->zzv()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v4, v6}, Lcom/google/android/gms/internal/measurement/zzgc;->zzE(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzgc;

    .line 283
    :cond_37
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzh;->zzy()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_38

    .line 284
    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzh;->zzy()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v4, v6}, Lcom/google/android/gms/internal/measurement/zzgc;->zzT(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzgc;

    :cond_38
    iget-object v6, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 285
    invoke-static {v6}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 286
    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    invoke-virtual {v6, v3}, Lcom/google/android/gms/measurement/internal/zzam;->zzu(Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    const/4 v13, 0x0

    .line 287
    :goto_17
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v6

    if-ge v13, v6, :cond_39

    .line 288
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzgm;->zzd()Lcom/google/android/gms/internal/measurement/zzgl;

    move-result-object v6

    .line 289
    invoke-interface {v3, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/google/android/gms/measurement/internal/zzll;

    iget-object v8, v8, Lcom/google/android/gms/measurement/internal/zzll;->zzc:Ljava/lang/String;

    invoke-virtual {v6, v8}, Lcom/google/android/gms/internal/measurement/zzgl;->zzf(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzgl;

    .line 290
    invoke-interface {v3, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/google/android/gms/measurement/internal/zzll;

    iget-wide v8, v8, Lcom/google/android/gms/measurement/internal/zzll;->zzd:J

    invoke-virtual {v6, v8, v9}, Lcom/google/android/gms/internal/measurement/zzgl;->zzg(J)Lcom/google/android/gms/internal/measurement/zzgl;

    iget-object v8, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzi:Lcom/google/android/gms/measurement/internal/zzli;

    .line 291
    invoke-static {v8}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 292
    invoke-interface {v3, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/google/android/gms/measurement/internal/zzll;

    iget-object v9, v9, Lcom/google/android/gms/measurement/internal/zzll;->zze:Ljava/lang/Object;

    invoke-virtual {v8, v6, v9}, Lcom/google/android/gms/measurement/internal/zzli;->zzu(Lcom/google/android/gms/internal/measurement/zzgl;Ljava/lang/Object;)V

    .line 293
    invoke-virtual {v4, v6}, Lcom/google/android/gms/internal/measurement/zzgc;->zzl(Lcom/google/android/gms/internal/measurement/zzgl;)Lcom/google/android/gms/internal/measurement/zzgc;
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_0

    add-int/lit8 v13, v13, 0x1

    goto :goto_17

    :cond_39
    :try_start_14
    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 294
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 295
    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/zzkx;->zzaD()Lcom/google/android/gms/internal/measurement/zzlb;

    move-result-object v6

    check-cast v6, Lcom/google/android/gms/internal/measurement/zzgd;

    .line 296
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 297
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzkt;->zzW()V

    .line 298
    invoke-static {v6}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 299
    invoke-virtual {v6}, Lcom/google/android/gms/internal/measurement/zzgd;->zzy()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 300
    invoke-virtual {v6}, Lcom/google/android/gms/internal/measurement/zzjk;->zzbx()[B

    move-result-object v8

    iget-object v9, v3, Lcom/google/android/gms/measurement/internal/zzks;->zzf:Lcom/google/android/gms/measurement/internal/zzlg;

    iget-object v9, v9, Lcom/google/android/gms/measurement/internal/zzlg;->zzi:Lcom/google/android/gms/measurement/internal/zzli;

    .line 301
    invoke-static {v9}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 302
    invoke-virtual {v9, v8}, Lcom/google/android/gms/measurement/internal/zzli;->zzd([B)J

    move-result-wide v9

    new-instance v11, Landroid/content/ContentValues;

    .line 303
    invoke-direct {v11}, Landroid/content/ContentValues;-><init>()V

    .line 304
    invoke-virtual {v6}, Lcom/google/android/gms/internal/measurement/zzgd;->zzy()Ljava/lang/String;

    move-result-object v12

    move-object/from16 v13, v33

    invoke-virtual {v11, v13, v12}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 305
    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    move-object/from16 v14, v32

    invoke-virtual {v11, v14, v12}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v12, "metadata"

    .line 306
    invoke-virtual {v11, v12, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V
    :try_end_14
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_14} :catch_a
    .catchall {:try_start_14 .. :try_end_14} :catchall_0

    .line 307
    :try_start_15
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzam;->zzh()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v8

    const-string v12, "raw_events_metadata"

    const/4 v15, 0x4

    .line 308
    invoke-virtual {v8, v12, v2, v11, v15}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J
    :try_end_15
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_15 .. :try_end_15} :catch_9
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_15} :catch_a
    .catchall {:try_start_15 .. :try_end_15} :catchall_0

    :try_start_16
    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 318
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    iget-object v4, v7, Lcom/google/android/gms/measurement/internal/zzar;->zzf:Lcom/google/android/gms/measurement/internal/zzau;

    new-instance v6, Lcom/google/android/gms/measurement/internal/zzat;

    .line 319
    invoke-direct {v6, v4}, Lcom/google/android/gms/measurement/internal/zzat;-><init>(Lcom/google/android/gms/measurement/internal/zzau;)V

    .line 320
    :goto_18
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3b

    .line 321
    invoke-virtual {v6}, Lcom/google/android/gms/measurement/internal/zzat;->zza()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v8, v34

    .line 322
    invoke-virtual {v8, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3a

    :goto_19
    const/16 v31, 0x1

    goto :goto_1a

    :cond_3a
    move-object/from16 v34, v8

    goto :goto_18

    .line 355
    :cond_3b
    iget-object v4, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zzc:Lcom/google/android/gms/measurement/internal/zzfv;

    .line 323
    invoke-static {v4}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    iget-object v6, v7, Lcom/google/android/gms/measurement/internal/zzar;->zza:Ljava/lang/String;

    iget-object v8, v7, Lcom/google/android/gms/measurement/internal/zzar;->zzb:Ljava/lang/String;

    .line 324
    invoke-virtual {v4, v6, v8}, Lcom/google/android/gms/measurement/internal/zzfv;->zzq(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    iget-object v15, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 325
    invoke-static {v15}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 326
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zza()J

    move-result-wide v16

    iget-object v6, v7, Lcom/google/android/gms/measurement/internal/zzar;->zza:Ljava/lang/String;

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    move-object/from16 v18, v6

    invoke-virtual/range {v15 .. v23}, Lcom/google/android/gms/measurement/internal/zzam;->zzl(JLjava/lang/String;ZZZZZ)Lcom/google/android/gms/measurement/internal/zzak;

    move-result-object v6

    if-eqz v4, :cond_3c

    iget-wide v11, v6, Lcom/google/android/gms/measurement/internal/zzak;->zze:J

    .line 327
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v4

    iget-object v6, v7, Lcom/google/android/gms/measurement/internal/zzar;->zza:Ljava/lang/String;

    sget-object v8, Lcom/google/android/gms/measurement/internal/zzeh;->zzo:Lcom/google/android/gms/measurement/internal/zzeg;

    invoke-virtual {v4, v6, v8}, Lcom/google/android/gms/measurement/internal/zzag;->zze(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzeg;)I

    move-result v4

    int-to-long v5, v4

    cmp-long v4, v11, v5

    if-gez v4, :cond_3c

    goto :goto_19

    .line 328
    :cond_3c
    :goto_1a
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 329
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzkt;->zzW()V

    .line 330
    invoke-static {v7}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v4, v7, Lcom/google/android/gms/measurement/internal/zzar;->zza:Ljava/lang/String;

    .line 331
    invoke-static {v4}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    iget-object v4, v3, Lcom/google/android/gms/measurement/internal/zzks;->zzf:Lcom/google/android/gms/measurement/internal/zzlg;

    iget-object v4, v4, Lcom/google/android/gms/measurement/internal/zzlg;->zzi:Lcom/google/android/gms/measurement/internal/zzli;

    .line 332
    invoke-static {v4}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 333
    invoke-virtual {v4, v7}, Lcom/google/android/gms/measurement/internal/zzli;->zzj(Lcom/google/android/gms/measurement/internal/zzar;)Lcom/google/android/gms/internal/measurement/zzft;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/zzjk;->zzbx()[B

    move-result-object v4

    new-instance v5, Landroid/content/ContentValues;

    .line 334
    invoke-direct {v5}, Landroid/content/ContentValues;-><init>()V

    iget-object v6, v7, Lcom/google/android/gms/measurement/internal/zzar;->zza:Ljava/lang/String;

    .line 335
    invoke-virtual {v5, v13, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v6, "name"

    iget-object v8, v7, Lcom/google/android/gms/measurement/internal/zzar;->zzb:Ljava/lang/String;

    .line 336
    invoke-virtual {v5, v6, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v6, "timestamp"

    iget-wide v11, v7, Lcom/google/android/gms/measurement/internal/zzar;->zzd:J

    .line 337
    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v5, v6, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 338
    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v5, v14, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v6, "data"

    .line 339
    invoke-virtual {v5, v6, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    const-string v4, "realtime"

    .line 340
    invoke-static/range {v31 .. v31}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_0

    .line 341
    :try_start_17
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzam;->zzh()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    move-object/from16 v6, p1

    .line 342
    invoke-virtual {v4, v6, v2, v5}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v4

    const-wide/16 v8, -0x1

    cmp-long v2, v4, v8

    if-nez v2, :cond_3d

    iget-object v2, v3, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 343
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v2

    .line 344
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v2

    const-string v4, "Failed to insert raw event (got -1). appId"

    iget-object v5, v7, Lcom/google/android/gms/measurement/internal/zzar;->zza:Ljava/lang/String;

    invoke-static {v5}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .line 345
    invoke-virtual {v2, v4, v5}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_17
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_17 .. :try_end_17} :catch_8
    .catchall {:try_start_17 .. :try_end_17} :catchall_0

    goto :goto_1b

    :cond_3d
    const-wide/16 v4, 0x0

    .line 355
    :try_start_18
    iput-wide v4, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zza:J

    goto :goto_1b

    :catch_8
    move-exception v0

    move-object v2, v0

    .line 313
    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 346
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v3

    .line 347
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v3

    const-string v4, "Error storing raw event. appId"

    iget-object v5, v7, Lcom/google/android/gms/measurement/internal/zzar;->zza:Ljava/lang/String;

    invoke-static {v5}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .line 348
    invoke-virtual {v3, v4, v5, v2}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_0

    goto :goto_1b

    :catch_9
    move-exception v0

    move-object v2, v0

    .line 317
    :try_start_19
    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 309
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v3

    .line 310
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v3

    const-string v5, "Error storing raw event metadata. appId"

    .line 311
    invoke-virtual {v6}, Lcom/google/android/gms/internal/measurement/zzgd;->zzy()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    .line 312
    invoke-virtual {v3, v5, v6, v2}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 313
    throw v2
    :try_end_19
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_19} :catch_a
    .catchall {:try_start_19 .. :try_end_19} :catchall_0

    :catch_a
    move-exception v0

    move-object v2, v0

    .line 314
    :try_start_1a
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v3

    .line 315
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v3

    const-string v5, "Data loss. Failed to insert raw event metadata. appId"

    .line 316
    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/zzgc;->zzaq()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 317
    invoke-virtual {v3, v5, v4, v2}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 345
    :goto_1b
    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 349
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 350
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzam;->zzC()V
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_0

    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 72
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 73
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzam;->zzx()V

    .line 351
    invoke-direct/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzag()V

    .line 352
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v2

    .line 353
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v2

    .line 354
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v3

    sub-long v3, v3, v28

    const-wide/32 v5, 0x7a120

    add-long/2addr v3, v5

    const-wide/32 v5, 0xf4240

    div-long/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const-string v4, "Background event processing time, ms"

    .line 355
    invoke-virtual {v2, v4, v3}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :catchall_0
    move-exception v0

    move-object v2, v0

    .line 371
    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 72
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 73
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzam;->zzx()V

    .line 370
    throw v2

    .line 371
    :cond_3e
    invoke-virtual {v1, v3}, Lcom/google/android/gms/measurement/internal/zzlg;->zzd(Lcom/google/android/gms/measurement/internal/zzq;)Lcom/google/android/gms/measurement/internal/zzh;

    return-void
.end method

.method final zzZ()Z
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzw:Ljava/nio/channels/FileLock;

    const/4 v1, 0x1

    const-string v2, "Storage concurrent access okay"

    if-eqz v0, :cond_1

    .line 2
    invoke-virtual {v0}, Ljava/nio/channels/FileLock;->isValid()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzes;->zza(Ljava/lang/String;)V

    return v1

    .line 2
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzf()Lcom/google/android/gms/measurement/internal/zzag;

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 4
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzaw()Landroid/content/Context;

    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    new-instance v3, Ljava/io/File;

    const-string v4, "google_app_measurement.db"

    .line 6
    invoke-direct {v3, v0, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    :try_start_0
    new-instance v0, Ljava/io/RandomAccessFile;

    const-string v4, "rw"

    .line 7
    invoke-direct {v0, v3, v4}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzx:Ljava/nio/channels/FileChannel;

    .line 8
    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->tryLock()Ljava/nio/channels/FileLock;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzw:Ljava/nio/channels/FileLock;

    if-eqz v0, :cond_2

    .line 9
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeu;->zzj()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzes;->zza(Ljava/lang/String;)V

    return v1

    .line 10
    :cond_2
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v0

    const-string v1, "Storage concurrent data access panic"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzes;->zza(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/nio/channels/OverlappingFileLockException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 11
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzk()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v1

    const-string v2, "Storage lock already acquired"

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    :catch_1
    move-exception v0

    .line 12
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v1

    const-string v2, "Failed to access storage lock file"

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    :catch_2
    move-exception v0

    .line 13
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v1

    const-string v2, "Failed to acquire storage lock"

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    :goto_1
    const/4 v0, 0x0

    return v0
.end method

.method final zza()J
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzax()Lcom/google/android/gms/common/util/Clock;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzk:Lcom/google/android/gms/measurement/internal/zzka;

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzkt;->zzW()V

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzka;->zze:Lcom/google/android/gms/measurement/internal/zzff;

    .line 2
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzff;->zza()J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v7, v3, v5

    if-nez v7, :cond_0

    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 3
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzge;->zzv()Lcom/google/android/gms/measurement/internal/zzlo;

    move-result-object v3

    .line 4
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzlo;->zzG()Ljava/security/SecureRandom;

    move-result-object v3

    const v4, 0x5265c00

    invoke-virtual {v3, v4}, Ljava/security/SecureRandom;->nextInt(I)I

    move-result v3

    int-to-long v3, v3

    iget-object v2, v2, Lcom/google/android/gms/measurement/internal/zzka;->zze:Lcom/google/android/gms/measurement/internal/zzff;

    const-wide/16 v5, 0x1

    add-long/2addr v3, v5

    .line 5
    invoke-virtual {v2, v3, v4}, Lcom/google/android/gms/measurement/internal/zzff;->zzb(J)V

    :cond_0
    add-long/2addr v0, v3

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    const-wide/16 v2, 0x3c

    div-long/2addr v0, v2

    div-long/2addr v0, v2

    const-wide/16 v2, 0x18

    div-long/2addr v0, v2

    return-wide v0
.end method

.method public final zzaA()Lcom/google/android/gms/measurement/internal/zzeu;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/measurement/internal/zzge;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    return-object v0
.end method

.method public final zzaB()Lcom/google/android/gms/measurement/internal/zzgb;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/measurement/internal/zzge;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v0

    return-object v0
.end method

.method public final zzaw()Landroid/content/Context;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzaw()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method public final zzax()Lcom/google/android/gms/common/util/Clock;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/measurement/internal/zzge;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzax()Lcom/google/android/gms/common/util/Clock;

    move-result-object v0

    return-object v0
.end method

.method public final zzay()Lcom/google/android/gms/measurement/internal/zzab;
    .locals 1

    const/4 v0, 0x0

    throw v0
.end method

.method final zzd(Lcom/google/android/gms/measurement/internal/zzq;)Lcom/google/android/gms/measurement/internal/zzh;
    .locals 10

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzB()V

    .line 3
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 5
    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzq;->zzw:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzC:Ljava/util/Map;

    .line 6
    iget-object v2, p1, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    new-instance v3, Lcom/google/android/gms/measurement/internal/zzlf;

    iget-object v4, p1, Lcom/google/android/gms/measurement/internal/zzq;->zzw:Ljava/lang/String;

    invoke-direct {v3, p0, v4, v1}, Lcom/google/android/gms/measurement/internal/zzlf;-><init>(Lcom/google/android/gms/measurement/internal/zzlg;Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzle;)V

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 7
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 8
    iget-object v2, p1, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzam;->zzj(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzh;

    move-result-object v0

    .line 9
    iget-object v2, p1, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    .line 10
    invoke-virtual {p0, v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzh(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzai;

    move-result-object v2

    iget-object v3, p1, Lcom/google/android/gms/measurement/internal/zzq;->zzv:Ljava/lang/String;

    .line 11
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzai;->zzb(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzai;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zzai;->zzc(Lcom/google/android/gms/measurement/internal/zzai;)Lcom/google/android/gms/measurement/internal/zzai;

    move-result-object v2

    .line 12
    sget-object v3, Lcom/google/android/gms/measurement/internal/zzah;->zza:Lcom/google/android/gms/measurement/internal/zzah;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zzai;->zzi(Lcom/google/android/gms/measurement/internal/zzah;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzk:Lcom/google/android/gms/measurement/internal/zzka;

    .line 13
    iget-object v4, p1, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    iget-boolean v5, p1, Lcom/google/android/gms/measurement/internal/zzq;->zzo:Z

    .line 14
    invoke-virtual {v3, v4, v5}, Lcom/google/android/gms/measurement/internal/zzka;->zzf(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    :cond_1
    const-string v3, ""

    :goto_0
    if-nez v0, :cond_3

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzh;

    iget-object v4, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    .line 15
    iget-object v5, p1, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    invoke-direct {v0, v4, v5}, Lcom/google/android/gms/measurement/internal/zzh;-><init>(Lcom/google/android/gms/measurement/internal/zzge;Ljava/lang/String;)V

    sget-object v4, Lcom/google/android/gms/measurement/internal/zzah;->zzb:Lcom/google/android/gms/measurement/internal/zzah;

    .line 16
    invoke-virtual {v2, v4}, Lcom/google/android/gms/measurement/internal/zzai;->zzi(Lcom/google/android/gms/measurement/internal/zzah;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 17
    invoke-virtual {p0, v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzw(Lcom/google/android/gms/measurement/internal/zzai;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/google/android/gms/measurement/internal/zzh;->zzI(Ljava/lang/String;)V

    :cond_2
    sget-object v4, Lcom/google/android/gms/measurement/internal/zzah;->zza:Lcom/google/android/gms/measurement/internal/zzah;

    .line 18
    invoke-virtual {v2, v4}, Lcom/google/android/gms/measurement/internal/zzai;->zzi(Lcom/google/android/gms/measurement/internal/zzah;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 19
    invoke-virtual {v0, v3}, Lcom/google/android/gms/measurement/internal/zzh;->zzaf(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 66
    :cond_3
    sget-object v4, Lcom/google/android/gms/measurement/internal/zzah;->zza:Lcom/google/android/gms/measurement/internal/zzah;

    .line 20
    invoke-virtual {v2, v4}, Lcom/google/android/gms/measurement/internal/zzai;->zzi(Lcom/google/android/gms/measurement/internal/zzah;)Z

    move-result v4

    if-eqz v4, :cond_4

    if-eqz v3, :cond_4

    .line 21
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzh;->zzB()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 25
    invoke-virtual {v0, v3}, Lcom/google/android/gms/measurement/internal/zzh;->zzaf(Ljava/lang/String;)V

    .line 26
    iget-boolean v3, p1, Lcom/google/android/gms/measurement/internal/zzq;->zzo:Z

    if-eqz v3, :cond_5

    iget-object v3, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzk:Lcom/google/android/gms/measurement/internal/zzka;

    .line 27
    iget-object v4, p1, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    .line 28
    invoke-virtual {v3, v4, v2}, Lcom/google/android/gms/measurement/internal/zzka;->zzd(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzai;)Landroid/util/Pair;

    move-result-object v3

    iget-object v3, v3, Landroid/util/Pair;->first:Ljava/lang/Object;

    const-string v4, "00000000-0000-0000-0000-000000000000"

    .line 29
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    .line 30
    invoke-virtual {p0, v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzw(Lcom/google/android/gms/measurement/internal/zzai;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzh;->zzI(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 31
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 32
    iget-object v3, p1, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    const-string v4, "_id"

    .line 33
    invoke-virtual {v2, v3, v4}, Lcom/google/android/gms/measurement/internal/zzam;->zzp(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzll;

    move-result-object v2

    if-eqz v2, :cond_5

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 34
    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 35
    iget-object v3, p1, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    const-string v4, "_lair"

    .line 36
    invoke-virtual {v2, v3, v4}, Lcom/google/android/gms/measurement/internal/zzam;->zzp(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzll;

    move-result-object v2

    if-nez v2, :cond_5

    .line 37
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzax()Lcom/google/android/gms/common/util/Clock;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v7

    new-instance v2, Lcom/google/android/gms/measurement/internal/zzll;

    .line 38
    iget-object v4, p1, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    const-wide/16 v5, 0x1

    .line 39
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    const-string v5, "auto"

    const-string v6, "_lair"

    move-object v3, v2

    invoke-direct/range {v3 .. v9}, Lcom/google/android/gms/measurement/internal/zzll;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/Object;)V

    iget-object v3, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 40
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 41
    invoke-virtual {v3, v2}, Lcom/google/android/gms/measurement/internal/zzam;->zzL(Lcom/google/android/gms/measurement/internal/zzll;)Z

    goto :goto_1

    .line 22
    :cond_4
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzh;->zzv()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_5

    sget-object v3, Lcom/google/android/gms/measurement/internal/zzah;->zzb:Lcom/google/android/gms/measurement/internal/zzah;

    .line 23
    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zzai;->zzi(Lcom/google/android/gms/measurement/internal/zzah;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 24
    invoke-virtual {p0, v2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzw(Lcom/google/android/gms/measurement/internal/zzai;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzh;->zzI(Ljava/lang/String;)V

    .line 42
    :cond_5
    :goto_1
    iget-object v2, p1, Lcom/google/android/gms/measurement/internal/zzq;->zzb:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzh;->zzX(Ljava/lang/String;)V

    .line 43
    iget-object v2, p1, Lcom/google/android/gms/measurement/internal/zzq;->zzq:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzh;->zzG(Ljava/lang/String;)V

    .line 44
    iget-object v2, p1, Lcom/google/android/gms/measurement/internal/zzq;->zzk:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_6

    .line 45
    iget-object v2, p1, Lcom/google/android/gms/measurement/internal/zzq;->zzk:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzh;->zzW(Ljava/lang/String;)V

    .line 46
    :cond_6
    iget-wide v2, p1, Lcom/google/android/gms/measurement/internal/zzq;->zze:J

    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-eqz v6, :cond_7

    .line 47
    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/measurement/internal/zzh;->zzY(J)V

    .line 48
    :cond_7
    iget-object v2, p1, Lcom/google/android/gms/measurement/internal/zzq;->zzc:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_8

    .line 49
    iget-object v2, p1, Lcom/google/android/gms/measurement/internal/zzq;->zzc:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzh;->zzK(Ljava/lang/String;)V

    .line 50
    :cond_8
    iget-wide v2, p1, Lcom/google/android/gms/measurement/internal/zzq;->zzj:J

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/measurement/internal/zzh;->zzL(J)V

    .line 51
    iget-object v2, p1, Lcom/google/android/gms/measurement/internal/zzq;->zzd:Ljava/lang/String;

    if-eqz v2, :cond_9

    .line 52
    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzh;->zzJ(Ljava/lang/String;)V

    .line 53
    :cond_9
    iget-wide v2, p1, Lcom/google/android/gms/measurement/internal/zzq;->zzf:J

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/measurement/internal/zzh;->zzT(J)V

    .line 54
    iget-boolean v2, p1, Lcom/google/android/gms/measurement/internal/zzq;->zzh:Z

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzh;->zzad(Z)V

    .line 55
    iget-object v2, p1, Lcom/google/android/gms/measurement/internal/zzq;->zzg:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_a

    .line 56
    iget-object v2, p1, Lcom/google/android/gms/measurement/internal/zzq;->zzg:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzh;->zzZ(Ljava/lang/String;)V

    .line 57
    :cond_a
    iget-boolean v2, p1, Lcom/google/android/gms/measurement/internal/zzq;->zzo:Z

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzh;->zzH(Z)V

    .line 58
    iget-object v2, p1, Lcom/google/android/gms/measurement/internal/zzq;->zzr:Ljava/lang/Boolean;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzh;->zzae(Ljava/lang/Boolean;)V

    .line 59
    iget-wide v2, p1, Lcom/google/android/gms/measurement/internal/zzq;->zzs:J

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/measurement/internal/zzh;->zzU(J)V

    .line 60
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzqr;->zzc()Z

    .line 61
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v2

    sget-object v3, Lcom/google/android/gms/measurement/internal/zzeh;->zzam:Lcom/google/android/gms/measurement/internal/zzeg;

    invoke-virtual {v2, v1, v3}, Lcom/google/android/gms/measurement/internal/zzag;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzeg;)Z

    move-result v2

    if-nez v2, :cond_b

    .line 62
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v2

    iget-object v3, p1, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    sget-object v4, Lcom/google/android/gms/measurement/internal/zzeh;->zzao:Lcom/google/android/gms/measurement/internal/zzeg;

    invoke-virtual {v2, v3, v4}, Lcom/google/android/gms/measurement/internal/zzag;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzeg;)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 63
    :cond_b
    iget-object v2, p1, Lcom/google/android/gms/measurement/internal/zzq;->zzx:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzh;->zzah(Ljava/lang/String;)V

    .line 64
    :cond_c
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzop;->zzc()Z

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v2

    sget-object v3, Lcom/google/android/gms/measurement/internal/zzeh;->zzal:Lcom/google/android/gms/measurement/internal/zzeg;

    invoke-virtual {v2, v1, v3}, Lcom/google/android/gms/measurement/internal/zzag;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzeg;)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 67
    iget-object v2, p1, Lcom/google/android/gms/measurement/internal/zzq;->zzt:Ljava/util/List;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzh;->zzag(Ljava/util/List;)V

    goto :goto_2

    .line 65
    :cond_d
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzop;->zzc()Z

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v2

    sget-object v3, Lcom/google/android/gms/measurement/internal/zzeh;->zzak:Lcom/google/android/gms/measurement/internal/zzeg;

    invoke-virtual {v2, v1, v3}, Lcom/google/android/gms/measurement/internal/zzag;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzeg;)Z

    move-result v2

    if-eqz v2, :cond_e

    .line 66
    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzh;->zzag(Ljava/util/List;)V

    .line 68
    :cond_e
    :goto_2
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzra;->zzc()Z

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v2

    sget-object v3, Lcom/google/android/gms/measurement/internal/zzeh;->zzaq:Lcom/google/android/gms/measurement/internal/zzeg;

    invoke-virtual {v2, v1, v3}, Lcom/google/android/gms/measurement/internal/zzag;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzeg;)Z

    move-result v2

    if-eqz v2, :cond_f

    .line 69
    iget-boolean v2, p1, Lcom/google/android/gms/measurement/internal/zzq;->zzy:Z

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzh;->zzai(Z)V

    .line 70
    :cond_f
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzpw;->zzc()Z

    .line 71
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzg()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v2

    sget-object v3, Lcom/google/android/gms/measurement/internal/zzeh;->zzaE:Lcom/google/android/gms/measurement/internal/zzeg;

    invoke-virtual {v2, v1, v3}, Lcom/google/android/gms/measurement/internal/zzag;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzeg;)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 72
    iget-wide v1, p1, Lcom/google/android/gms/measurement/internal/zzq;->zzz:J

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzh;->zzaj(J)V

    .line 73
    :cond_10
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzh;->zzam()Z

    move-result p1

    if-eqz p1, :cond_11

    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 74
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 75
    invoke-virtual {p1, v0}, Lcom/google/android/gms/measurement/internal/zzam;->zzD(Lcom/google/android/gms/measurement/internal/zzh;)V

    :cond_11
    return-object v0
.end method

.method public final zzf()Lcom/google/android/gms/measurement/internal/zzaa;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzh:Lcom/google/android/gms/measurement/internal/zzaa;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    return-object v0
.end method

.method public final zzg()Lcom/google/android/gms/measurement/internal/zzag;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/measurement/internal/zzge;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzf()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v0

    return-object v0
.end method

.method final zzh(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzai;
    .locals 6

    .line 1
    sget-object v0, Lcom/google/android/gms/measurement/internal/zzai;->zza:Lcom/google/android/gms/measurement/internal/zzai;

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 3
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzB()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzB:Ljava/util/Map;

    .line 4
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/measurement/internal/zzai;

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    .line 5
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    .line 6
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    .line 8
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkt;->zzW()V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    .line 9
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzam;->zzh()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    const-string v4, "select consent_state from consent_settings where app_id=? limit 1;"

    const/4 v5, 0x0

    .line 10
    :try_start_0
    invoke-virtual {v3, v4, v1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    .line 11
    invoke-interface {v5}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 13
    invoke-interface {v5, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v5, :cond_2

    .line 12
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    goto :goto_0

    :cond_0
    if-eqz v5, :cond_1

    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    :cond_1
    const-string v0, "G1"

    .line 18
    :cond_2
    :goto_0
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzai;->zzb(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzai;

    move-result-object v0

    .line 19
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzV(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzai;)V

    goto :goto_2

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception p1

    .line 12
    :try_start_1
    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzgx;->zzt:Lcom/google/android/gms/measurement/internal/zzge;

    .line 14
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v0

    const-string v1, "Database error"

    invoke-virtual {v0, v1, v4, p1}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 16
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_1
    if-eqz v5, :cond_3

    .line 12
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    .line 17
    :cond_3
    throw p1

    :cond_4
    :goto_2
    return-object v0
.end method

.method public final zzi()Lcom/google/android/gms/measurement/internal/zzam;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zze:Lcom/google/android/gms/measurement/internal/zzam;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    return-object v0
.end method

.method public final zzj()Lcom/google/android/gms/measurement/internal/zzep;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzj()Lcom/google/android/gms/measurement/internal/zzep;

    move-result-object v0

    return-object v0
.end method

.method public final zzl()Lcom/google/android/gms/measurement/internal/zzfa;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzd:Lcom/google/android/gms/measurement/internal/zzfa;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    return-object v0
.end method

.method public final zzm()Lcom/google/android/gms/measurement/internal/zzfc;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzf:Lcom/google/android/gms/measurement/internal/zzfc;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Network broadcast receiver not created"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final zzo()Lcom/google/android/gms/measurement/internal/zzfv;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzc:Lcom/google/android/gms/measurement/internal/zzfv;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    return-object v0
.end method

.method final zzq()Lcom/google/android/gms/measurement/internal/zzge;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    return-object v0
.end method

.method public final zzr()Lcom/google/android/gms/measurement/internal/zzio;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzj:Lcom/google/android/gms/measurement/internal/zzio;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    return-object v0
.end method

.method public final zzs()Lcom/google/android/gms/measurement/internal/zzka;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzk:Lcom/google/android/gms/measurement/internal/zzka;

    return-object v0
.end method

.method public final zzu()Lcom/google/android/gms/measurement/internal/zzli;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzi:Lcom/google/android/gms/measurement/internal/zzli;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzal(Lcom/google/android/gms/measurement/internal/zzkt;)Lcom/google/android/gms/measurement/internal/zzkt;

    return-object v0
.end method

.method public final zzv()Lcom/google/android/gms/measurement/internal/zzlo;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzn:Lcom/google/android/gms/measurement/internal/zzge;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/measurement/internal/zzge;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzge;->zzv()Lcom/google/android/gms/measurement/internal/zzlo;

    move-result-object v0

    return-object v0
.end method

.method final zzw(Lcom/google/android/gms/measurement/internal/zzai;)Ljava/lang/String;
    .locals 5

    .line 1
    sget-object v0, Lcom/google/android/gms/measurement/internal/zzah;->zzb:Lcom/google/android/gms/measurement/internal/zzah;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/measurement/internal/zzai;->zzi(Lcom/google/android/gms/measurement/internal/zzah;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0x10

    new-array p1, p1, [B

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzv()Lcom/google/android/gms/measurement/internal/zzlo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzlo;->zzG()Ljava/security/SecureRandom;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/security/SecureRandom;->nextBytes([B)V

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    new-instance v4, Ljava/math/BigInteger;

    .line 3
    invoke-direct {v4, v1, p1}, Ljava/math/BigInteger;-><init>(I[B)V

    aput-object v4, v2, v3

    const-string p1, "%032x"

    invoke-static {v0, p1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method final zzx(Lcom/google/android/gms/measurement/internal/zzq;)Ljava/lang/String;
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/measurement/internal/zzkz;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/measurement/internal/zzkz;-><init>(Lcom/google/android/gms/measurement/internal/zzlg;Lcom/google/android/gms/measurement/internal/zzq;)V

    .line 2
    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzgb;->zzh(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v0

    const-wide/16 v1, 0x7530

    :try_start_0
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 3
    invoke-interface {v0, v1, v2, v3}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_0
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_0

    :catch_2
    move-exception v0

    .line 4
    :goto_0
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object v1

    .line 5
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object v1

    iget-object p1, p1, Lcom/google/android/gms/measurement/internal/zzq;->zza:Ljava/lang/String;

    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    const-string v2, "Failed to get app instance id. appId"

    .line 6
    invoke-virtual {v1, v2, p1, v0}, Lcom/google/android/gms/measurement/internal/zzes;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    const/4 p1, 0x0

    return-object p1
.end method

.method final zzz(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgx;->zzg()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzq:Ljava/util/List;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    .line 2
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzq:Ljava/util/List;

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzlg;->zzq:Ljava/util/List;

    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method
