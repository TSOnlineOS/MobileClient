.class public final synthetic Lcom/google/android/gms/internal/firebase-auth-api/zzabh;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic zza:Lcom/google/android/gms/internal/firebase-auth-api/zzabj;

.field public final synthetic zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzabi;

.field public final synthetic zzc:Lcom/google/android/gms/tasks/TaskCompletionSource;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzabj;Lcom/google/android/gms/internal/firebase-auth-api/zzabi;Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabh;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzabj;

    iput-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabh;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzabi;

    iput-object p3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabh;->zzc:Lcom/google/android/gms/tasks/TaskCompletionSource;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabh;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzabj;

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabh;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzabi;

    iget-object v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzabh;->zzc:Lcom/google/android/gms/tasks/TaskCompletionSource;

    iget-object v0, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzabj;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;

    invoke-interface {v1, v2, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzabi;->zzc(Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/android/gms/internal/firebase-auth-api/zzaaf;)V

    return-void
.end method
