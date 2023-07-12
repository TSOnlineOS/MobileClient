.class public final Lcom/google/android/gms/internal/appinvite/zzp;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/appinvite/AppInviteInvitationResult;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final zzr:Lcom/google/android/gms/common/api/Status;

.field private final zzs:Landroid/content/Intent;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/Status;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/android/gms/internal/appinvite/zzp;->zzr:Lcom/google/android/gms/common/api/Status;

    .line 3
    iput-object p2, p0, Lcom/google/android/gms/internal/appinvite/zzp;->zzs:Landroid/content/Intent;

    return-void
.end method


# virtual methods
.method public final getInvitationIntent()Landroid/content/Intent;
    .locals 1

    .line 6
    iget-object v0, p0, Lcom/google/android/gms/internal/appinvite/zzp;->zzs:Landroid/content/Intent;

    return-object v0
.end method

.method public final getStatus()Lcom/google/android/gms/common/api/Status;
    .locals 1

    .line 5
    iget-object v0, p0, Lcom/google/android/gms/internal/appinvite/zzp;->zzr:Lcom/google/android/gms/common/api/Status;

    return-object v0
.end method
