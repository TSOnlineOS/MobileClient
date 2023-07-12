.class public final Lcom/google/android/play/core/integrity/p;
.super Ljava/lang/Object;
.source "com.google.android.play:integrity@@1.1.0"

# interfaces
.implements Lcom/google/android/play/integrity/internal/aa;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final synthetic a()Ljava/lang/Object;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/play/integrity/internal/k;

    const-string v1, "IntegrityService"

    invoke-direct {v0, v1}, Lcom/google/android/play/integrity/internal/k;-><init>(Ljava/lang/String;)V

    return-object v0
.end method
