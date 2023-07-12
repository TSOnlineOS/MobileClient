.class final Lcom/google/android/gms/internal/firebase-auth-api/zzo;
.super Lcom/google/android/gms/internal/firebase-auth-api/zzl;
.source "com.google.firebase:firebase-auth@@22.0.0"


# instance fields
.field final zza:Ljava/util/regex/Matcher;


# direct methods
.method constructor <init>(Ljava/util/regex/Matcher;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzl;-><init>()V

    if-eqz p1, :cond_0

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzo;->zza:Ljava/util/regex/Matcher;

    return-void

    :cond_0
    const/4 p1, 0x0

    throw p1
.end method
