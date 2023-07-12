.class final Lcom/android/billingclient/api/zzp;
.super Ljava/lang/Object;
.source "com.android.billingclient:billing@@5.1.0"


# instance fields
.field private final zza:Landroid/content/Context;

.field private final zzb:Lcom/android/billingclient/api/zzo;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/android/billingclient/api/PurchasesUpdatedListener;Lcom/android/billingclient/api/zzc;)V
    .locals 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/billingclient/api/zzp;->zza:Landroid/content/Context;

    new-instance p1, Lcom/android/billingclient/api/zzo;

    const/4 v0, 0x0

    invoke-direct {p1, p0, p2, p3, v0}, Lcom/android/billingclient/api/zzo;-><init>(Lcom/android/billingclient/api/zzp;Lcom/android/billingclient/api/PurchasesUpdatedListener;Lcom/android/billingclient/api/zzc;Lcom/android/billingclient/api/zzn;)V

    iput-object p1, p0, Lcom/android/billingclient/api/zzp;->zzb:Lcom/android/billingclient/api/zzo;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lcom/android/billingclient/api/zzbf;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/billingclient/api/zzp;->zza:Landroid/content/Context;

    new-instance p1, Lcom/android/billingclient/api/zzo;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2, p2}, Lcom/android/billingclient/api/zzo;-><init>(Lcom/android/billingclient/api/zzp;Lcom/android/billingclient/api/zzbf;Lcom/android/billingclient/api/zzn;)V

    iput-object p1, p0, Lcom/android/billingclient/api/zzp;->zzb:Lcom/android/billingclient/api/zzo;

    return-void
.end method

.method static bridge synthetic zza(Lcom/android/billingclient/api/zzp;)Lcom/android/billingclient/api/zzo;
    .locals 0

    iget-object p0, p0, Lcom/android/billingclient/api/zzp;->zzb:Lcom/android/billingclient/api/zzo;

    return-object p0
.end method


# virtual methods
.method final zzb()Lcom/android/billingclient/api/zzbf;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/billingclient/api/zzp;->zzb:Lcom/android/billingclient/api/zzo;

    invoke-static {v0}, Lcom/android/billingclient/api/zzo;->zza(Lcom/android/billingclient/api/zzo;)Lcom/android/billingclient/api/zzbf;

    const/4 v0, 0x0

    return-object v0
.end method

.method final zzc()Lcom/android/billingclient/api/PurchasesUpdatedListener;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/billingclient/api/zzp;->zzb:Lcom/android/billingclient/api/zzo;

    invoke-static {v0}, Lcom/android/billingclient/api/zzo;->zzb(Lcom/android/billingclient/api/zzo;)Lcom/android/billingclient/api/PurchasesUpdatedListener;

    move-result-object v0

    return-object v0
.end method

.method final zzd()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/billingclient/api/zzp;->zzb:Lcom/android/billingclient/api/zzo;

    iget-object v1, p0, Lcom/android/billingclient/api/zzp;->zza:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/android/billingclient/api/zzo;->zzd(Landroid/content/Context;)V

    return-void
.end method

.method final zze()V
    .locals 3

    .line 1
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "com.android.vending.billing.PURCHASES_UPDATED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string v1, "com.android.vending.billing.ALTERNATIVE_BILLING"

    .line 2
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/android/billingclient/api/zzp;->zzb:Lcom/android/billingclient/api/zzo;

    iget-object v2, p0, Lcom/android/billingclient/api/zzp;->zza:Landroid/content/Context;

    .line 3
    invoke-virtual {v1, v2, v0}, Lcom/android/billingclient/api/zzo;->zzc(Landroid/content/Context;Landroid/content/IntentFilter;)V

    return-void
.end method
