.class abstract Lcom/google/android/gms/internal/firebase-auth-api/zzabg;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Lcom/google/android/gms/internal/firebase-auth-api/zzabi;


# instance fields
.field zzA:Lcom/google/android/gms/common/api/Status;

.field private zza:Z

.field protected final zze:I

.field final zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzabd;

.field protected zzg:Lcom/google/firebase/FirebaseApp;

.field protected zzh:Lcom/google/firebase/auth/FirebaseUser;

.field protected zzi:Ljava/lang/Object;

.field protected zzj:Lcom/google/firebase/auth/internal/zzao;

.field protected zzk:Lcom/google/android/gms/internal/firebase-auth-api/zzaaw;

.field protected final zzl:Ljava/util/List;

.field protected zzm:Ljava/util/concurrent/Executor;

.field protected zzn:Lcom/google/android/gms/internal/firebase-auth-api/zzade;

.field protected zzo:Lcom/google/android/gms/internal/firebase-auth-api/zzacv;

.field protected zzp:Lcom/google/android/gms/internal/firebase-auth-api/zzacj;

.field protected zzq:Lcom/google/android/gms/internal/firebase-auth-api/zzadn;

.field protected zzr:Ljava/lang/String;

.field protected zzs:Ljava/lang/String;

.field protected zzt:Lcom/google/firebase/auth/AuthCredential;

.field protected zzu:Ljava/lang/String;

.field protected zzv:Ljava/lang/String;

.field protected zzw:Lcom/google/android/gms/internal/firebase-auth-api/zzwn;

.field protected zzx:Lcom/google/android/gms/internal/firebase-auth-api/zzadd;

.field protected zzy:Lcom/google/android/gms/internal/firebase-auth-api/zzada;

.field zzz:Ljava/lang/Object;


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzabd;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzabd;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzabg;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzabd;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zzl:Ljava/util/List;

    iput p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zze:I

    return-void
.end method

.method static bridge synthetic zzi(Lcom/google/android/gms/internal/firebase-auth-api/zzabg;Z)V
    .locals 0

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zza:Z

    return-void
.end method

.method static bridge synthetic zzj(Lcom/google/android/gms/internal/firebase-auth-api/zzabg;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zzb()V

    iget-boolean p0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zza:Z

    const-string v0, "no success or failure set on method implementation"

    .line 2
    invoke-static {p0, v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    return-void
.end method

.method static bridge synthetic zzk(Lcom/google/android/gms/internal/firebase-auth-api/zzabg;Lcom/google/android/gms/common/api/Status;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zzj:Lcom/google/firebase/auth/internal/zzao;

    if-eqz p0, :cond_0

    invoke-interface {p0, p1}, Lcom/google/firebase/auth/internal/zzao;->zzb(Lcom/google/android/gms/common/api/Status;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public abstract zzb()V
.end method

.method public final zzd(Ljava/lang/Object;)Lcom/google/android/gms/internal/firebase-auth-api/zzabg;
    .locals 1

    const-string v0, "external callback cannot be null"

    .line 1
    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zzi:Ljava/lang/Object;

    return-object p0
.end method

.method public final zze(Lcom/google/firebase/auth/internal/zzao;)Lcom/google/android/gms/internal/firebase-auth-api/zzabg;
    .locals 1

    const-string v0, "external failure callback cannot be null"

    .line 1
    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/auth/internal/zzao;

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zzj:Lcom/google/firebase/auth/internal/zzao;

    return-object p0
.end method

.method public final zzf(Lcom/google/firebase/FirebaseApp;)Lcom/google/android/gms/internal/firebase-auth-api/zzabg;
    .locals 1

    const-string v0, "firebaseApp cannot be null"

    .line 1
    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/FirebaseApp;

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zzg:Lcom/google/firebase/FirebaseApp;

    return-object p0
.end method

.method public final zzg(Lcom/google/firebase/auth/FirebaseUser;)Lcom/google/android/gms/internal/firebase-auth-api/zzabg;
    .locals 1

    const-string v0, "firebaseUser cannot be null"

    .line 1
    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/auth/FirebaseUser;

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zzh:Lcom/google/firebase/auth/FirebaseUser;

    return-object p0
.end method

.method public final zzh(Lcom/google/firebase/auth/PhoneAuthProvider$OnVerificationStateChangedCallbacks;Landroid/app/Activity;Ljava/util/concurrent/Executor;Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzabg;
    .locals 1

    .line 1
    invoke-static {p4, p1, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzabu;->zza(Ljava/lang/String;Lcom/google/firebase/auth/PhoneAuthProvider$OnVerificationStateChangedCallbacks;Lcom/google/android/gms/internal/firebase-auth-api/zzabg;)Lcom/google/firebase/auth/PhoneAuthProvider$OnVerificationStateChangedCallbacks;

    move-result-object p1

    iget-object p4, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zzl:Ljava/util/List;

    .line 2
    monitor-enter p4

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zzl:Ljava/util/List;

    .line 3
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/auth/PhoneAuthProvider$OnVerificationStateChangedCallbacks;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    monitor-exit p4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p2, :cond_0

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zzl:Ljava/util/List;

    .line 5
    invoke-static {p2, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaax;->zza(Landroid/app/Activity;Ljava/util/List;)V

    .line 6
    :cond_0
    invoke-static {p3}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/concurrent/Executor;

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zzm:Ljava/util/concurrent/Executor;

    return-object p0

    :catchall_0
    move-exception p1

    .line 4
    :try_start_1
    monitor-exit p4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public final zzl(Lcom/google/android/gms/common/api/Status;)V
    .locals 2

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zza:Z

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zzA:Lcom/google/android/gms/common/api/Status;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zzk:Lcom/google/android/gms/internal/firebase-auth-api/zzaaw;

    const/4 v1, 0x0

    invoke-interface {v0, v1, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaaw;->zza(Ljava/lang/Object;Lcom/google/android/gms/common/api/Status;)V

    return-void
.end method

.method public final zzm(Ljava/lang/Object;)V
    .locals 2

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zza:Z

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zzz:Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zzk:Lcom/google/android/gms/internal/firebase-auth-api/zzaaw;

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaaw;->zza(Ljava/lang/Object;Lcom/google/android/gms/common/api/Status;)V

    return-void
.end method
