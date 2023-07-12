.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzabf;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Lcom/google/android/gms/internal/firebase-auth-api/zzaaw;


# instance fields
.field private final zza:Lcom/google/android/gms/internal/firebase-auth-api/zzabg;

.field private final zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzabg;Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabf;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzabg;

    iput-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabf;->zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;

    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Object;Lcom/google/android/gms/common/api/Status;)V
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabf;->zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;

    const-string v1, "completion source cannot be null"

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p2, :cond_a

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabf;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzabg;

    iget-object v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zzw:Lcom/google/android/gms/internal/firebase-auth-api/zzwn;

    if-eqz v0, :cond_8

    iget-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabf;->zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;

    iget-object p1, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zzg:Lcom/google/firebase/FirebaseApp;

    .line 2
    invoke-static {p1}, Lcom/google/firebase/auth/FirebaseAuth;->getInstance(Lcom/google/firebase/FirebaseApp;)Lcom/google/firebase/auth/FirebaseAuth;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabf;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzabg;

    iget-object v1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zzw:Lcom/google/android/gms/internal/firebase-auth-api/zzwn;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zza()Ljava/lang/String;

    move-result-object v0

    const-string v2, "reauthenticateWithCredential"

    .line 3
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabf;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzabg;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zza()Ljava/lang/String;

    move-result-object v0

    const-string v3, "reauthenticateWithCredentialWithData"

    .line 4
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    move-object v0, v2

    goto :goto_1

    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabf;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzabg;

    iget-object v0, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zzh:Lcom/google/firebase/auth/FirebaseUser;

    .line 5
    :goto_1
    sget v3, Lcom/google/android/gms/internal/firebase-auth-api/zzaag;->zzb:I

    if-eqz p1, :cond_7

    if-eqz v1, :cond_6

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzaag;->zza:Landroid/util/SparseArray;

    const/16 v3, 0x42b6

    .line 6
    invoke-virtual {v2, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Pair;

    .line 7
    new-instance v3, Lcom/google/firebase/auth/FirebaseAuthMultiFactorException;

    iget-object v4, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    iget-object v2, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    .line 8
    sget-object v5, Lcom/google/firebase/auth/internal/zzae;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 9
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwn;->zzc()Ljava/util/List;

    move-result-object v5

    new-instance v7, Ljava/util/ArrayList;

    .line 10
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 11
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_2
    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/firebase/auth/MultiFactorInfo;

    instance-of v8, v6, Lcom/google/firebase/auth/PhoneMultiFactorInfo;

    if-eqz v8, :cond_2

    .line 12
    check-cast v6, Lcom/google/firebase/auth/PhoneMultiFactorInfo;

    invoke-interface {v7, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 13
    :cond_3
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwn;->zzc()Ljava/util/List;

    move-result-object v5

    new-instance v12, Ljava/util/ArrayList;

    .line 14
    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 15
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_4
    :goto_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/firebase/auth/MultiFactorInfo;

    instance-of v8, v6, Lcom/google/firebase/auth/zzau;

    if-eqz v8, :cond_4

    .line 16
    check-cast v6, Lcom/google/firebase/auth/zzau;

    invoke-interface {v12, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 17
    :cond_5
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwn;->zzc()Ljava/util/List;

    move-result-object v5

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwn;->zzb()Ljava/lang/String;

    move-result-object v6

    .line 18
    invoke-static {v5, v6}, Lcom/google/firebase/auth/internal/zzag;->zzb(Ljava/util/List;Ljava/lang/String;)Lcom/google/firebase/auth/internal/zzag;

    move-result-object v8

    new-instance v5, Lcom/google/firebase/auth/internal/zzae;

    .line 19
    invoke-virtual {p1}, Lcom/google/firebase/auth/FirebaseAuth;->getApp()Lcom/google/firebase/FirebaseApp;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/firebase/FirebaseApp;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwn;->zza()Lcom/google/firebase/auth/zze;

    move-result-object v10

    .line 20
    move-object v11, v0

    check-cast v11, Lcom/google/firebase/auth/internal/zzx;

    move-object v6, v5

    invoke-direct/range {v6 .. v12}, Lcom/google/firebase/auth/internal/zzae;-><init>(Ljava/util/List;Lcom/google/firebase/auth/internal/zzag;Ljava/lang/String;Lcom/google/firebase/auth/zze;Lcom/google/firebase/auth/internal/zzx;Ljava/util/List;)V

    .line 8
    invoke-direct {v3, v4, v2, v5}, Lcom/google/firebase/auth/FirebaseAuthMultiFactorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/google/firebase/auth/MultiFactorResolver;)V

    .line 21
    invoke-virtual {p2, v3}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    return-void

    .line 22
    :cond_6
    throw v2

    .line 23
    :cond_7
    throw v2

    .line 21
    :cond_8
    iget-object v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zzt:Lcom/google/firebase/auth/AuthCredential;

    if-eqz v0, :cond_9

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabf;->zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;

    iget-object v2, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zzu:Ljava/lang/String;

    iget-object p1, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzabg;->zzv:Ljava/lang/String;

    .line 24
    invoke-static {p2, v0, v2, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaag;->zzb(Lcom/google/android/gms/common/api/Status;Lcom/google/firebase/auth/AuthCredential;Ljava/lang/String;Ljava/lang/String;)Lcom/google/firebase/FirebaseException;

    move-result-object p1

    .line 25
    invoke-virtual {v1, p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    return-void

    :cond_9
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabf;->zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 26
    invoke-static {p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaag;->zza(Lcom/google/android/gms/common/api/Status;)Lcom/google/firebase/FirebaseException;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    return-void

    .line 23
    :cond_a
    iget-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabf;->zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 27
    invoke-virtual {p2, p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    return-void
.end method
