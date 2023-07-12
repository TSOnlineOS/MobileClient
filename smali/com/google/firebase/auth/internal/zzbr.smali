.class public final Lcom/google/firebase/auth/internal/zzbr;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"


# instance fields
.field final zza:Ljava/util/Map;

.field final zzb:Lcom/google/firebase/FirebaseApp;

.field final zzc:Lcom/google/firebase/auth/FirebaseAuth;

.field final zzd:Lcom/google/firebase/auth/internal/zzbm;

.field private zze:Lcom/google/android/gms/internal/firebase-auth-api/zzadd;


# direct methods
.method public constructor <init>(Lcom/google/firebase/FirebaseApp;Lcom/google/firebase/auth/FirebaseAuth;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/firebase/auth/internal/zzbn;

    invoke-direct {v0}, Lcom/google/firebase/auth/internal/zzbn;-><init>()V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/google/firebase/auth/internal/zzbr;->zza:Ljava/util/Map;

    iput-object p1, p0, Lcom/google/firebase/auth/internal/zzbr;->zzb:Lcom/google/firebase/FirebaseApp;

    iput-object p2, p0, Lcom/google/firebase/auth/internal/zzbr;->zzc:Lcom/google/firebase/auth/FirebaseAuth;

    iput-object v0, p0, Lcom/google/firebase/auth/internal/zzbr;->zzd:Lcom/google/firebase/auth/internal/zzbm;

    return-void
.end method

.method static bridge synthetic zzc(Lcom/google/firebase/auth/internal/zzbr;Lcom/google/android/gms/internal/firebase-auth-api/zzadd;)V
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/auth/internal/zzbr;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzadd;

    return-void
.end method

.method public static zzd()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/firebase/auth/internal/zzbs;
        }
    .end annotation

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_0

    return-void

    :cond_0
    new-instance v0, Lcom/google/firebase/auth/internal/zzbs;

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "SDK version too low to use Recaptcha Enterprise. Got "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", Want >= 19"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/firebase/auth/internal/zzbs;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private final zzf(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/firebase/auth/internal/zzbr;->zza:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/tasks/Task;

    return-object p1
.end method

.method private static zzg(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzac;->zzd(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p0, "*"

    :cond_0
    return-object p0
.end method


# virtual methods
.method public final zza(Ljava/lang/String;Ljava/lang/Boolean;Lcom/google/android/recaptcha/RecaptchaAction;)Lcom/google/android/gms/tasks/Task;
    .locals 2

    .line 1
    :try_start_0
    invoke-static {}, Lcom/google/firebase/auth/internal/zzbr;->zzd()V
    :try_end_0
    .catch Lcom/google/firebase/auth/internal/zzbs; {:try_start_0 .. :try_end_0} :catch_0

    .line 3
    invoke-static {p1}, Lcom/google/firebase/auth/internal/zzbr;->zzg(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 4
    invoke-direct {p0, p1}, Lcom/google/firebase/auth/internal/zzbr;->zzf(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    .line 5
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_0

    if-nez v0, :cond_1

    .line 6
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/google/firebase/auth/internal/zzbr;->zzb(Ljava/lang/String;Ljava/lang/Boolean;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    .line 7
    :cond_1
    new-instance p1, Lcom/google/firebase/auth/internal/zzbq;

    invoke-direct {p1, p0, p3}, Lcom/google/firebase/auth/internal/zzbq;-><init>(Lcom/google/firebase/auth/internal/zzbr;Lcom/google/android/recaptcha/RecaptchaAction;)V

    invoke-virtual {v0, p1}, Lcom/google/android/gms/tasks/Task;->continueWithTask(Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1

    :catch_0
    move-exception p1

    .line 2
    invoke-static {p1}, Lcom/google/android/gms/tasks/Tasks;->forException(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public final zzb(Ljava/lang/String;Ljava/lang/Boolean;)Lcom/google/android/gms/tasks/Task;
    .locals 1

    .line 1
    :try_start_0
    invoke-static {}, Lcom/google/firebase/auth/internal/zzbr;->zzd()V
    :try_end_0
    .catch Lcom/google/firebase/auth/internal/zzbs; {:try_start_0 .. :try_end_0} :catch_0

    .line 3
    invoke-static {p1}, Lcom/google/firebase/auth/internal/zzbr;->zzg(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 4
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-nez p2, :cond_0

    .line 5
    invoke-direct {p0, p1}, Lcom/google/firebase/auth/internal/zzbr;->zzf(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object p2

    if-eqz p2, :cond_0

    return-object p2

    :cond_0
    iget-object p2, p0, Lcom/google/firebase/auth/internal/zzbr;->zzc:Lcom/google/firebase/auth/FirebaseAuth;

    const-string v0, "RECAPTCHA_ENTERPRISE"

    .line 6
    invoke-virtual {p2, v0}, Lcom/google/firebase/auth/FirebaseAuth;->zze(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object p2

    new-instance v0, Lcom/google/firebase/auth/internal/zzbp;

    invoke-direct {v0, p0, p1}, Lcom/google/firebase/auth/internal/zzbp;-><init>(Lcom/google/firebase/auth/internal/zzbr;Ljava/lang/String;)V

    .line 7
    invoke-virtual {p2, v0}, Lcom/google/android/gms/tasks/Task;->continueWithTask(Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1

    :catch_0
    move-exception p1

    .line 2
    invoke-static {p1}, Lcom/google/android/gms/tasks/Tasks;->forException(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public final zze()Z
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/auth/internal/zzbr;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzadd;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzadd;->zzc()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method
