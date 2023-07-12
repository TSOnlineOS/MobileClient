.class public final Lcom/google/android/gms/internal/appinvite/zzt;
.super Lcom/google/firebase/appinvite/FirebaseAppInvite;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final zzt:Landroid/os/Bundle;


# direct methods
.method public constructor <init>(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/firebase/appinvite/FirebaseAppInvite;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/android/gms/internal/appinvite/zzt;->zzt:Landroid/os/Bundle;

    return-void
.end method


# virtual methods
.method public final getInvitationId()Ljava/lang/String;
    .locals 3

    .line 4
    iget-object v0, p0, Lcom/google/android/gms/internal/appinvite/zzt;->zzt:Landroid/os/Bundle;

    const-string v1, "com.google.firebase.appinvite.fdl.extension.InvitationId"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
