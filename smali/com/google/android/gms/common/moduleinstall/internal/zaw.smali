.class final Lcom/google/android/gms/common/moduleinstall/internal/zaw;
.super Lcom/google/android/gms/common/moduleinstall/internal/zaa;
.source "com.google.android.gms:play-services-base@@18.2.0"


# instance fields
.field final synthetic zaa:Lcom/google/android/gms/tasks/TaskCompletionSource;


# direct methods
.method constructor <init>(Lcom/google/android/gms/common/moduleinstall/internal/zay;Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/google/android/gms/common/moduleinstall/internal/zaw;->zaa:Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {p0}, Lcom/google/android/gms/common/moduleinstall/internal/zaa;-><init>()V

    return-void
.end method


# virtual methods
.method public final zac(Lcom/google/android/gms/common/api/Status;Lcom/google/android/gms/common/moduleinstall/ModuleInstallIntentResponse;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/moduleinstall/internal/zaw;->zaa:Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-static {p1, p2, v0}, Lcom/google/android/gms/common/api/internal/TaskUtil;->trySetResultOrApiException(Lcom/google/android/gms/common/api/Status;Ljava/lang/Object;Lcom/google/android/gms/tasks/TaskCompletionSource;)Z

    return-void
.end method
