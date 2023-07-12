.class public final Lcom/google/android/recaptcha/internal/zzah;
.super Ljava/lang/Object;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"


# static fields
.field public static final zza:Lcom/google/android/recaptcha/internal/zzag;

.field private static zzb:Lcom/google/android/recaptcha/internal/zzkj;


# instance fields
.field private final zzc:Ljava/lang/String;

.field private final zzd:Lcom/google/android/recaptcha/internal/zzs;

.field private final zze:Lcom/google/android/recaptcha/internal/zzku;

.field private final zzf:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/google/android/recaptcha/internal/zzag;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/android/recaptcha/internal/zzag;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/google/android/recaptcha/internal/zzah;->zza:Lcom/google/android/recaptcha/internal/zzag;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/recaptcha/internal/zzaf;Ljava/lang/String;Lcom/google/android/recaptcha/internal/zzs;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/google/android/recaptcha/internal/zzah;->zzc:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/recaptcha/internal/zzah;->zzd:Lcom/google/android/recaptcha/internal/zzs;

    invoke-static {}, Lcom/google/android/recaptcha/internal/zzkx;->zzi()Lcom/google/android/recaptcha/internal/zzku;

    move-result-object p2

    iput-object p2, p0, Lcom/google/android/recaptcha/internal/zzah;->zze:Lcom/google/android/recaptcha/internal/zzku;

    .line 2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p2

    iput-wide p2, p0, Lcom/google/android/recaptcha/internal/zzah;->zzf:J

    iget-object p2, p0, Lcom/google/android/recaptcha/internal/zzah;->zze:Lcom/google/android/recaptcha/internal/zzku;

    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzaf;->zza()Lcom/google/android/recaptcha/internal/zzkw;

    move-result-object p3

    .line 3
    invoke-virtual {p2, p3}, Lcom/google/android/recaptcha/internal/zzku;->zzq(Lcom/google/android/recaptcha/internal/zzkw;)Lcom/google/android/recaptcha/internal/zzku;

    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzaf;->zzb()Ljava/lang/String;

    move-result-object p3

    .line 4
    invoke-virtual {p2, p3}, Lcom/google/android/recaptcha/internal/zzku;->zze(Ljava/lang/String;)Lcom/google/android/recaptcha/internal/zzku;

    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzaf;->zzc()Ljava/lang/String;

    move-result-object p3

    .line 5
    invoke-virtual {p2, p3}, Lcom/google/android/recaptcha/internal/zzku;->zzs(Ljava/lang/String;)Lcom/google/android/recaptcha/internal/zzku;

    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzaf;->zzd()Ljava/lang/String;

    move-result-object p1

    .line 6
    invoke-virtual {p2, p1}, Lcom/google/android/recaptcha/internal/zzku;->zzv(Ljava/lang/String;)Lcom/google/android/recaptcha/internal/zzku;

    .line 7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 8
    invoke-static {v0, v1}, Lcom/google/android/recaptcha/internal/zzka;->zzb(J)Lcom/google/android/recaptcha/internal/zzjd;

    move-result-object p1

    .line 9
    invoke-static {p1}, Lcom/google/android/recaptcha/internal/zzka;->zzc(Lcom/google/android/recaptcha/internal/zzjd;)Ljava/lang/String;

    move-result-object p1

    .line 10
    invoke-virtual {p2, p1}, Lcom/google/android/recaptcha/internal/zzku;->zzu(Ljava/lang/String;)Lcom/google/android/recaptcha/internal/zzku;

    return-void
.end method

.method private static final zzd(Landroid/content/Context;)Lcom/google/android/recaptcha/internal/zzkj;
    .locals 8

    const-string v0, "unknown"

    const/16 v1, 0x21

    .line 1
    :try_start_0
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v3, "com.google.android.gms.version"

    const/4 v4, -0x1

    if-lt v2, v1, :cond_1

    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 2
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const-wide/16 v6, 0x80

    .line 3
    invoke-static {v6, v7}, Landroid/content/pm/PackageManager$ApplicationInfoFlags;->of(J)Landroid/content/pm/PackageManager$ApplicationInfoFlags;

    move-result-object v6

    .line 4
    invoke-virtual {v2, v5, v6}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;Landroid/content/pm/PackageManager$ApplicationInfoFlags;)Landroid/content/pm/ApplicationInfo;

    move-result-object v2

    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    .line 5
    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v4, :cond_0

    goto :goto_0

    .line 6
    :cond_0
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 7
    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 8
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0x80

    invoke-virtual {v2, v5, v6}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v2

    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    .line 9
    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v4, :cond_2

    goto :goto_0

    .line 10
    :cond_2
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    :goto_0
    move-object v2, v0

    .line 5
    :goto_1
    :try_start_2
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v3, v1, :cond_3

    .line 11
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 12
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const-wide/16 v3, 0x0

    .line 13
    invoke-static {v3, v4}, Landroid/content/pm/PackageManager$PackageInfoFlags;->of(J)Landroid/content/pm/PackageManager$PackageInfoFlags;

    move-result-object v3

    .line 14
    invoke-virtual {v1, p0, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;Landroid/content/pm/PackageManager$PackageInfoFlags;)Landroid/content/pm/PackageInfo;

    move-result-object p0

    .line 15
    invoke-virtual {p0}, Landroid/content/pm/PackageInfo;->getLongVersionCode()J

    move-result-wide v3

    .line 16
    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    .line 31
    :cond_3
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1c

    const/4 v4, 0x0

    if-lt v1, v3, :cond_4

    .line 17
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 18
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p0

    .line 19
    invoke-virtual {p0}, Landroid/content/pm/PackageInfo;->getLongVersionCode()J

    move-result-wide v3

    .line 20
    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    .line 21
    :cond_4
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 22
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p0

    iget p0, p0, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 23
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_1

    .line 24
    :catch_1
    :goto_2
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzkj;->zzf()Lcom/google/android/recaptcha/internal/zzki;

    move-result-object p0

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 25
    invoke-virtual {p0, v1}, Lcom/google/android/recaptcha/internal/zzki;->zzd(I)Lcom/google/android/recaptcha/internal/zzki;

    .line 26
    invoke-virtual {p0, v2}, Lcom/google/android/recaptcha/internal/zzki;->zzq(Ljava/lang/String;)Lcom/google/android/recaptcha/internal/zzki;

    const-string v1, "18.1.2"

    .line 27
    invoke-virtual {p0, v1}, Lcom/google/android/recaptcha/internal/zzki;->zzs(Ljava/lang/String;)Lcom/google/android/recaptcha/internal/zzki;

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 28
    invoke-virtual {p0, v1}, Lcom/google/android/recaptcha/internal/zzki;->zzp(Ljava/lang/String;)Lcom/google/android/recaptcha/internal/zzki;

    sget-object v1, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 29
    invoke-virtual {p0, v1}, Lcom/google/android/recaptcha/internal/zzki;->zzr(Ljava/lang/String;)Lcom/google/android/recaptcha/internal/zzki;

    .line 30
    invoke-virtual {p0, v0}, Lcom/google/android/recaptcha/internal/zzki;->zze(Ljava/lang/String;)Lcom/google/android/recaptcha/internal/zzki;

    .line 31
    invoke-virtual {p0}, Lcom/google/android/recaptcha/internal/zzgi;->zzh()Lcom/google/android/recaptcha/internal/zzgo;

    move-result-object p0

    check-cast p0, Lcom/google/android/recaptcha/internal/zzkj;

    return-object p0
.end method


# virtual methods
.method public final zza()J
    .locals 2

    iget-wide v0, p0, Lcom/google/android/recaptcha/internal/zzah;->zzf:J

    return-wide v0
.end method

.method public final zzb()Lcom/google/android/recaptcha/internal/zzku;
    .locals 1

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzah;->zze:Lcom/google/android/recaptcha/internal/zzku;

    return-object v0
.end method

.method public final zzc(ILcom/google/android/recaptcha/internal/zzkm;Landroid/content/Context;)Lcom/google/android/recaptcha/internal/zzkx;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzah;->zze:Lcom/google/android/recaptcha/internal/zzku;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-wide v3, p0, Lcom/google/android/recaptcha/internal/zzah;->zzf:J

    sub-long/2addr v1, v3

    .line 2
    invoke-virtual {v0, v1, v2}, Lcom/google/android/recaptcha/internal/zzku;->zzp(J)Lcom/google/android/recaptcha/internal/zzku;

    .line 3
    invoke-virtual {v0, p1}, Lcom/google/android/recaptcha/internal/zzku;->zzw(I)Lcom/google/android/recaptcha/internal/zzku;

    if-eqz p2, :cond_0

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzah;->zze:Lcom/google/android/recaptcha/internal/zzku;

    .line 4
    invoke-virtual {p1, p2}, Lcom/google/android/recaptcha/internal/zzku;->zzr(Lcom/google/android/recaptcha/internal/zzkm;)Lcom/google/android/recaptcha/internal/zzku;

    :cond_0
    sget-object p1, Lcom/google/android/recaptcha/internal/zzah;->zzb:Lcom/google/android/recaptcha/internal/zzkj;

    if-nez p1, :cond_1

    .line 5
    invoke-static {p3}, Lcom/google/android/recaptcha/internal/zzah;->zzd(Landroid/content/Context;)Lcom/google/android/recaptcha/internal/zzkj;

    move-result-object p1

    sput-object p1, Lcom/google/android/recaptcha/internal/zzah;->zzb:Lcom/google/android/recaptcha/internal/zzkj;

    :cond_1
    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzah;->zze:Lcom/google/android/recaptcha/internal/zzku;

    .line 6
    invoke-static {}, Lcom/google/android/recaptcha/internal/zzlj;->zzf()Lcom/google/android/recaptcha/internal/zzli;

    move-result-object p2

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzah;->zzc:Ljava/lang/String;

    .line 7
    invoke-virtual {p2, v0}, Lcom/google/android/recaptcha/internal/zzli;->zzq(Ljava/lang/String;)Lcom/google/android/recaptcha/internal/zzli;

    sget-object v0, Lcom/google/android/recaptcha/internal/zzah;->zzb:Lcom/google/android/recaptcha/internal/zzkj;

    if-nez v0, :cond_2

    .line 8
    invoke-static {p3}, Lcom/google/android/recaptcha/internal/zzah;->zzd(Landroid/content/Context;)Lcom/google/android/recaptcha/internal/zzkj;

    move-result-object v0

    :cond_2
    invoke-virtual {p2, v0}, Lcom/google/android/recaptcha/internal/zzli;->zzd(Lcom/google/android/recaptcha/internal/zzkj;)Lcom/google/android/recaptcha/internal/zzli;

    .line 9
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p3

    invoke-virtual {p3}, Ljava/util/Locale;->getISO3Language()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Lcom/google/android/recaptcha/internal/zzli;->zzp(Ljava/lang/String;)Lcom/google/android/recaptcha/internal/zzli;

    .line 10
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p3

    invoke-virtual {p3}, Ljava/util/Locale;->getISO3Country()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Lcom/google/android/recaptcha/internal/zzli;->zze(Ljava/lang/String;)Lcom/google/android/recaptcha/internal/zzli;

    .line 11
    invoke-virtual {p2}, Lcom/google/android/recaptcha/internal/zzgi;->zzh()Lcom/google/android/recaptcha/internal/zzgo;

    move-result-object p2

    check-cast p2, Lcom/google/android/recaptcha/internal/zzlj;

    .line 12
    invoke-virtual {p1, p2}, Lcom/google/android/recaptcha/internal/zzku;->zzt(Lcom/google/android/recaptcha/internal/zzlj;)Lcom/google/android/recaptcha/internal/zzku;

    iget-object p1, p0, Lcom/google/android/recaptcha/internal/zzah;->zze:Lcom/google/android/recaptcha/internal/zzku;

    .line 13
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzgi;->zzh()Lcom/google/android/recaptcha/internal/zzgo;

    move-result-object p1

    check-cast p1, Lcom/google/android/recaptcha/internal/zzkx;

    return-object p1
.end method
