.class final Lcom/google/android/gms/internal/firebase-auth-api/zzje;
.super Lcom/google/android/gms/internal/firebase-auth-api/zzlg;
.source "com.google.firebase:firebase-auth@@22.0.0"


# direct methods
.method constructor <init>(Ljava/lang/Class;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzlg;-><init>(Ljava/lang/Class;)V

    return-void
.end method


# virtual methods
.method public final synthetic zza(Lcom/google/android/gms/internal/firebase-auth-api/zzahp;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzsh;

    .line 2
    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zziz;->zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzsh;)Lcom/google/android/gms/internal/firebase-auth-api/zziz;

    move-result-object p1

    return-object p1
.end method
