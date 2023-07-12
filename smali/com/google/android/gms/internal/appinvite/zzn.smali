.class final Lcom/google/android/gms/internal/appinvite/zzn;
.super Lcom/google/android/gms/internal/appinvite/zze;


# instance fields
.field private final synthetic zzq:Lcom/google/android/gms/internal/appinvite/zzk;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/appinvite/zzk;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/internal/appinvite/zzn;->zzq:Lcom/google/android/gms/internal/appinvite/zzk;

    invoke-direct {p0}, Lcom/google/android/gms/internal/appinvite/zze;-><init>()V

    return-void
.end method


# virtual methods
.method public final zza(Lcom/google/android/gms/common/api/Status;Landroid/content/Intent;)V
    .locals 2

    .line 2
    iget-object v0, p0, Lcom/google/android/gms/internal/appinvite/zzn;->zzq:Lcom/google/android/gms/internal/appinvite/zzk;

    new-instance v1, Lcom/google/android/gms/internal/appinvite/zzp;

    invoke-direct {v1, p1, p2}, Lcom/google/android/gms/internal/appinvite/zzp;-><init>(Lcom/google/android/gms/common/api/Status;Landroid/content/Intent;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/appinvite/zzk;->setResult(Lcom/google/android/gms/common/api/Result;)V

    .line 3
    invoke-static {p2}, Lcom/google/android/gms/appinvite/AppInviteReferral;->hasReferral(Landroid/content/Intent;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/google/android/gms/internal/appinvite/zzn;->zzq:Lcom/google/android/gms/internal/appinvite/zzk;

    .line 4
    invoke-static {p1}, Lcom/google/android/gms/internal/appinvite/zzk;->zza(Lcom/google/android/gms/internal/appinvite/zzk;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/google/android/gms/internal/appinvite/zzn;->zzq:Lcom/google/android/gms/internal/appinvite/zzk;

    .line 5
    invoke-static {p1}, Lcom/google/android/gms/internal/appinvite/zzk;->zzb(Lcom/google/android/gms/internal/appinvite/zzk;)Ljava/lang/ref/WeakReference;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 6
    iget-object p1, p0, Lcom/google/android/gms/internal/appinvite/zzn;->zzq:Lcom/google/android/gms/internal/appinvite/zzk;

    invoke-static {p1}, Lcom/google/android/gms/internal/appinvite/zzk;->zzb(Lcom/google/android/gms/internal/appinvite/zzk;)Ljava/lang/ref/WeakReference;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/Activity;

    if-eqz p1, :cond_0

    .line 8
    invoke-virtual {p1, p2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method
