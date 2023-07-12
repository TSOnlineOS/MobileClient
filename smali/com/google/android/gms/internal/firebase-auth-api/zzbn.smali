.class final Lcom/google/android/gms/internal/firebase-auth-api/zzbn;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"


# instance fields
.field final zza:Lcom/google/android/gms/internal/firebase-auth-api/zzki;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzki;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzbn;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzki;

    return-void
.end method


# virtual methods
.method final zza(Lcom/google/android/gms/internal/firebase-auth-api/zzaff;)Lcom/google/android/gms/internal/firebase-auth-api/zzahp;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;,
            Lcom/google/android/gms/internal/firebase-auth-api/zzags;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzbn;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzki;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzki;->zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzaff;)Lcom/google/android/gms/internal/firebase-auth-api/zzahp;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzbn;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzki;

    .line 2
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzki;->zzd(Lcom/google/android/gms/internal/firebase-auth-api/zzahp;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzbn;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzki;

    .line 3
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzki;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzahp;)Lcom/google/android/gms/internal/firebase-auth-api/zzahp;

    move-result-object p1

    return-object p1
.end method
