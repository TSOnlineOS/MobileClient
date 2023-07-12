.class public final Lcom/google/firebase/dynamiclinks/DynamicLink$IosParameters$Builder;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/dynamiclinks/DynamicLink$IosParameters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private final zzf:Landroid/os/Bundle;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, p0, Lcom/google/firebase/dynamiclinks/DynamicLink$IosParameters$Builder;->zzf:Landroid/os/Bundle;

    const-string v1, "ibi"

    .line 3
    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final build()Lcom/google/firebase/dynamiclinks/DynamicLink$IosParameters;
    .locals 3

    .line 17
    new-instance v0, Lcom/google/firebase/dynamiclinks/DynamicLink$IosParameters;

    iget-object v1, p0, Lcom/google/firebase/dynamiclinks/DynamicLink$IosParameters$Builder;->zzf:Landroid/os/Bundle;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/firebase/dynamiclinks/DynamicLink$IosParameters;-><init>(Landroid/os/Bundle;Lcom/google/firebase/dynamiclinks/zza;)V

    return-object v0
.end method

.method public final setAppStoreId(Ljava/lang/String;)Lcom/google/firebase/dynamiclinks/DynamicLink$IosParameters$Builder;
    .locals 2

    .line 13
    iget-object v0, p0, Lcom/google/firebase/dynamiclinks/DynamicLink$IosParameters$Builder;->zzf:Landroid/os/Bundle;

    const-string v1, "isi"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method

.method public final setCustomScheme(Ljava/lang/String;)Lcom/google/firebase/dynamiclinks/DynamicLink$IosParameters$Builder;
    .locals 2

    .line 7
    iget-object v0, p0, Lcom/google/firebase/dynamiclinks/DynamicLink$IosParameters$Builder;->zzf:Landroid/os/Bundle;

    const-string v1, "ius"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method

.method public final setFallbackUrl(Landroid/net/Uri;)Lcom/google/firebase/dynamiclinks/DynamicLink$IosParameters$Builder;
    .locals 2

    .line 5
    iget-object v0, p0, Lcom/google/firebase/dynamiclinks/DynamicLink$IosParameters$Builder;->zzf:Landroid/os/Bundle;

    const-string v1, "ifl"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    return-object p0
.end method

.method public final setIpadBundleId(Ljava/lang/String;)Lcom/google/firebase/dynamiclinks/DynamicLink$IosParameters$Builder;
    .locals 2

    .line 11
    iget-object v0, p0, Lcom/google/firebase/dynamiclinks/DynamicLink$IosParameters$Builder;->zzf:Landroid/os/Bundle;

    const-string v1, "ipbi"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method

.method public final setIpadFallbackUrl(Landroid/net/Uri;)Lcom/google/firebase/dynamiclinks/DynamicLink$IosParameters$Builder;
    .locals 2

    .line 9
    iget-object v0, p0, Lcom/google/firebase/dynamiclinks/DynamicLink$IosParameters$Builder;->zzf:Landroid/os/Bundle;

    const-string v1, "ipfl"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    return-object p0
.end method

.method public final setMinimumVersion(Ljava/lang/String;)Lcom/google/firebase/dynamiclinks/DynamicLink$IosParameters$Builder;
    .locals 2

    .line 15
    iget-object v0, p0, Lcom/google/firebase/dynamiclinks/DynamicLink$IosParameters$Builder;->zzf:Landroid/os/Bundle;

    const-string v1, "imv"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method
