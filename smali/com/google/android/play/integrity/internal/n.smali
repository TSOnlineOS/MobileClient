.class public final synthetic Lcom/google/android/play/integrity/internal/n;
.super Ljava/lang/Object;
.source "com.google.android.play:integrity@@1.1.0"

# interfaces
.implements Landroid/os/IBinder$DeathRecipient;


# instance fields
.field public final synthetic a:Lcom/google/android/play/integrity/internal/v;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/play/integrity/internal/v;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/play/integrity/internal/n;->a:Lcom/google/android/play/integrity/internal/v;

    return-void
.end method


# virtual methods
.method public final binderDied()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/play/integrity/internal/n;->a:Lcom/google/android/play/integrity/internal/v;

    invoke-static {v0}, Lcom/google/android/play/integrity/internal/v;->h(Lcom/google/android/play/integrity/internal/v;)V

    return-void
.end method
