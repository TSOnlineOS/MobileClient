.class final Lcom/google/android/gms/measurement/internal/zzkw;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-measurement@@21.2.2"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic zza:Lcom/google/android/gms/measurement/internal/zzlh;

.field final synthetic zzb:Lcom/google/android/gms/measurement/internal/zzlg;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzlg;Lcom/google/android/gms/measurement/internal/zzlh;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkw;->zzb:Lcom/google/android/gms/measurement/internal/zzlg;

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzkw;->zza:Lcom/google/android/gms/measurement/internal/zzlh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkw;->zzb:Lcom/google/android/gms/measurement/internal/zzlg;

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzkw;->zza:Lcom/google/android/gms/measurement/internal/zzlh;

    invoke-static {v0, v1}, Lcom/google/android/gms/measurement/internal/zzlg;->zzy(Lcom/google/android/gms/measurement/internal/zzlg;Lcom/google/android/gms/measurement/internal/zzlh;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkw;->zzb:Lcom/google/android/gms/measurement/internal/zzlg;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzlg;->zzS()V

    return-void
.end method
