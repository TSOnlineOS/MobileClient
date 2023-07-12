.class public Lcom/google/firebase/auth/FirebaseAuthMissingActivityForRecaptchaException;
.super Lcom/google/firebase/auth/FirebaseAuthException;
.source "com.google.firebase:firebase-auth@@22.0.0"


# direct methods
.method public constructor <init>()V
    .locals 2

    const-string v0, "ERROR_MISSING_ACTIVITY"

    const-string v1, "App verification failed - a valid Activity is required to complete the Recaptcha flow"

    .line 1
    invoke-direct {p0, v0, v1}, Lcom/google/firebase/auth/FirebaseAuthException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
