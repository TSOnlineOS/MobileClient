.class final Lcom/google/android/gms/measurement/internal/zzlb;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-measurement@@21.2.2"

# interfaces
.implements Lcom/google/android/gms/measurement/internal/zzln;


# instance fields
.field final synthetic zza:Lcom/google/android/gms/measurement/internal/zzlg;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzlg;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzlb;->zza:Lcom/google/android/gms/measurement/internal/zzlg;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    const-string v0, "_err"

    if-eqz p2, :cond_1

    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzlb;->zza:Lcom/google/android/gms/measurement/internal/zzlg;

    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzp(Lcom/google/android/gms/measurement/internal/zzlg;)Lcom/google/android/gms/measurement/internal/zzge;

    move-result-object p2

    if-eqz p2, :cond_0

    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzp(Lcom/google/android/gms/measurement/internal/zzlg;)Lcom/google/android/gms/measurement/internal/zzge;

    move-result-object p1

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzge;->zzaA()Lcom/google/android/gms/measurement/internal/zzeu;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzeu;->zzd()Lcom/google/android/gms/measurement/internal/zzes;

    move-result-object p1

    const-string p2, "AppId not known when logging event"

    invoke-virtual {p1, p2, v0}, Lcom/google/android/gms/measurement/internal/zzes;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_0
    return-void

    :cond_1
    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzlb;->zza:Lcom/google/android/gms/measurement/internal/zzlg;

    .line 3
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzlg;->zzaB()Lcom/google/android/gms/measurement/internal/zzgb;

    move-result-object p2

    new-instance v1, Lcom/google/android/gms/measurement/internal/zzla;

    invoke-direct {v1, p0, p1, v0, p3}, Lcom/google/android/gms/measurement/internal/zzla;-><init>(Lcom/google/android/gms/measurement/internal/zzlb;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 4
    invoke-virtual {p2, v1}, Lcom/google/android/gms/measurement/internal/zzgb;->zzp(Ljava/lang/Runnable;)V

    return-void
.end method
