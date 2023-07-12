.class public final synthetic Lcom/google/firebase/auth/zzi;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic zza:Lcom/google/firebase/auth/PhoneAuthProvider$OnVerificationStateChangedCallbacks;

.field public final synthetic zzb:Lcom/google/firebase/auth/FirebaseAuthMissingActivityForRecaptchaException;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/auth/PhoneAuthProvider$OnVerificationStateChangedCallbacks;Lcom/google/firebase/auth/FirebaseAuthMissingActivityForRecaptchaException;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/auth/zzi;->zza:Lcom/google/firebase/auth/PhoneAuthProvider$OnVerificationStateChangedCallbacks;

    iput-object p2, p0, Lcom/google/firebase/auth/zzi;->zzb:Lcom/google/firebase/auth/FirebaseAuthMissingActivityForRecaptchaException;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lcom/google/firebase/auth/zzi;->zza:Lcom/google/firebase/auth/PhoneAuthProvider$OnVerificationStateChangedCallbacks;

    iget-object v1, p0, Lcom/google/firebase/auth/zzi;->zzb:Lcom/google/firebase/auth/FirebaseAuthMissingActivityForRecaptchaException;

    sget v2, Lcom/google/firebase/auth/FirebaseAuth;->zza:I

    .line 1
    invoke-virtual {v0, v1}, Lcom/google/firebase/auth/PhoneAuthProvider$OnVerificationStateChangedCallbacks;->onVerificationFailed(Lcom/google/firebase/FirebaseException;)V

    return-void
.end method
