.class public final synthetic Lcom/google/firebase/auth/internal/zza;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Lcom/google/android/gms/tasks/OnCompleteListener;


# instance fields
.field public final synthetic zza:Lcom/google/firebase/auth/internal/zzf;

.field public final synthetic zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;

.field public final synthetic zzc:Lcom/google/firebase/auth/FirebaseAuth;

.field public final synthetic zzd:Lcom/google/firebase/auth/internal/zzby;

.field public final synthetic zze:Landroid/app/Activity;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/auth/internal/zzf;Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/firebase/auth/FirebaseAuth;Lcom/google/firebase/auth/internal/zzby;Landroid/app/Activity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/auth/internal/zza;->zza:Lcom/google/firebase/auth/internal/zzf;

    iput-object p2, p0, Lcom/google/firebase/auth/internal/zza;->zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;

    iput-object p3, p0, Lcom/google/firebase/auth/internal/zza;->zzc:Lcom/google/firebase/auth/FirebaseAuth;

    iput-object p4, p0, Lcom/google/firebase/auth/internal/zza;->zzd:Lcom/google/firebase/auth/internal/zzby;

    iput-object p5, p0, Lcom/google/firebase/auth/internal/zza;->zze:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public final onComplete(Lcom/google/android/gms/tasks/Task;)V
    .locals 6

    iget-object v0, p0, Lcom/google/firebase/auth/internal/zza;->zza:Lcom/google/firebase/auth/internal/zzf;

    iget-object v1, p0, Lcom/google/firebase/auth/internal/zza;->zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;

    iget-object v2, p0, Lcom/google/firebase/auth/internal/zza;->zzc:Lcom/google/firebase/auth/FirebaseAuth;

    iget-object v3, p0, Lcom/google/firebase/auth/internal/zza;->zzd:Lcom/google/firebase/auth/internal/zzby;

    iget-object v4, p0, Lcom/google/firebase/auth/internal/zza;->zze:Landroid/app/Activity;

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Lcom/google/firebase/auth/internal/zzf;->zze(Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/firebase/auth/FirebaseAuth;Lcom/google/firebase/auth/internal/zzby;Landroid/app/Activity;Lcom/google/android/gms/tasks/Task;)V

    return-void
.end method
