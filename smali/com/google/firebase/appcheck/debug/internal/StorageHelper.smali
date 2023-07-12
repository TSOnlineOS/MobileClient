.class public Lcom/google/firebase/appcheck/debug/internal/StorageHelper;
.super Ljava/lang/Object;
.source "StorageHelper.java"


# static fields
.field static final DEBUG_SECRET_KEY:Ljava/lang/String; = "com.google.firebase.appcheck.debug.DEBUG_SECRET"

.field static final PREFS_TEMPLATE:Ljava/lang/String; = "com.google.firebase.appcheck.debug.store.%s"


# instance fields
.field private final sharedPreferences:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    const-string p2, "com.google.firebase.appcheck.debug.store.%s"

    .line 43
    invoke-static {p2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 44
    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/appcheck/debug/internal/StorageHelper;->sharedPreferences:Landroid/content/SharedPreferences;

    return-void
.end method


# virtual methods
.method public retrieveDebugSecret()Ljava/lang/String;
    .locals 3

    .line 53
    iget-object v0, p0, Lcom/google/firebase/appcheck/debug/internal/StorageHelper;->sharedPreferences:Landroid/content/SharedPreferences;

    const-string v1, "com.google.firebase.appcheck.debug.DEBUG_SECRET"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public saveDebugSecret(Ljava/lang/String;)V
    .locals 2

    .line 48
    iget-object v0, p0, Lcom/google/firebase/appcheck/debug/internal/StorageHelper;->sharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "com.google.firebase.appcheck.debug.DEBUG_SECRET"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method
