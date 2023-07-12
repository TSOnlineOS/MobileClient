.class public abstract Lcom/google/firebase/appcheck/AppCheckTokenResult;
.super Ljava/lang/Object;
.source "AppCheckTokenResult.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract getError()Ljava/lang/Exception;
.end method

.method public abstract getToken()Ljava/lang/String;
.end method
