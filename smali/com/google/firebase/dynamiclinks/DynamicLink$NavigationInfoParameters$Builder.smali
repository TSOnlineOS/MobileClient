.class public final Lcom/google/firebase/dynamiclinks/DynamicLink$NavigationInfoParameters$Builder;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/dynamiclinks/DynamicLink$NavigationInfoParameters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private final zzf:Landroid/os/Bundle;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, p0, Lcom/google/firebase/dynamiclinks/DynamicLink$NavigationInfoParameters$Builder;->zzf:Landroid/os/Bundle;

    return-void
.end method


# virtual methods
.method public final build()Lcom/google/firebase/dynamiclinks/DynamicLink$NavigationInfoParameters;
    .locals 3

    .line 6
    new-instance v0, Lcom/google/firebase/dynamiclinks/DynamicLink$NavigationInfoParameters;

    iget-object v1, p0, Lcom/google/firebase/dynamiclinks/DynamicLink$NavigationInfoParameters$Builder;->zzf:Landroid/os/Bundle;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/firebase/dynamiclinks/DynamicLink$NavigationInfoParameters;-><init>(Landroid/os/Bundle;Lcom/google/firebase/dynamiclinks/zza;)V

    return-object v0
.end method

.method public final setForcedRedirectEnabled(Z)Lcom/google/firebase/dynamiclinks/DynamicLink$NavigationInfoParameters$Builder;
    .locals 2

    .line 4
    iget-object v0, p0, Lcom/google/firebase/dynamiclinks/DynamicLink$NavigationInfoParameters$Builder;->zzf:Landroid/os/Bundle;

    const-string v1, "efr"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    return-object p0
.end method
