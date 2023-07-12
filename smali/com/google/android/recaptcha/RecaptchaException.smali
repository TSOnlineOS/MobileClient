.class public final Lcom/google/android/recaptcha/RecaptchaException;
.super Ljava/lang/Exception;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0006\u0018\u00002\u00060\u0001j\u0002`\u0002B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u0008\u0008\u0002\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0002\u0010\u0007R\u0011\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\tR\u0011\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000b\u00a8\u0006\u000c"
    }
    d2 = {
        "Lcom/google/android/recaptcha/RecaptchaException;",
        "Ljava/lang/Exception;",
        "Lkotlin/Exception;",
        "errorCode",
        "Lcom/google/android/recaptcha/RecaptchaErrorCode;",
        "errorMessage",
        "",
        "(Lcom/google/android/recaptcha/RecaptchaErrorCode;Ljava/lang/String;)V",
        "getErrorCode",
        "()Lcom/google/android/recaptcha/RecaptchaErrorCode;",
        "getErrorMessage",
        "()Ljava/lang/String;",
        "java.com.google.android.libraries.abuse.recaptcha.enterprise.public_public"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final errorCode:Lcom/google/android/recaptcha/RecaptchaErrorCode;

.field private final errorMessage:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/google/android/recaptcha/RecaptchaErrorCode;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/google/android/recaptcha/RecaptchaException;->errorCode:Lcom/google/android/recaptcha/RecaptchaErrorCode;

    iput-object p2, p0, Lcom/google/android/recaptcha/RecaptchaException;->errorMessage:Ljava/lang/String;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/google/android/recaptcha/RecaptchaErrorCode;Ljava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    .line 2
    invoke-virtual {p1}, Lcom/google/android/recaptcha/RecaptchaErrorCode;->getErrorMessage()Ljava/lang/String;

    move-result-object p2

    .line 3
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/google/android/recaptcha/RecaptchaException;-><init>(Lcom/google/android/recaptcha/RecaptchaErrorCode;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final getErrorCode()Lcom/google/android/recaptcha/RecaptchaErrorCode;
    .locals 1

    iget-object v0, p0, Lcom/google/android/recaptcha/RecaptchaException;->errorCode:Lcom/google/android/recaptcha/RecaptchaErrorCode;

    return-object v0
.end method

.method public final getErrorMessage()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/recaptcha/RecaptchaException;->errorMessage:Ljava/lang/String;

    return-object v0
.end method
