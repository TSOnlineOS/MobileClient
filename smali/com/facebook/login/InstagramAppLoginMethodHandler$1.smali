.class final Lcom/facebook/login/InstagramAppLoginMethodHandler$1;
.super Ljava/lang/Object;
.source "InstagramAppLoginMethodHandler.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/login/InstagramAppLoginMethodHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/facebook/login/InstagramAppLoginMethodHandler;
    .locals 1

    .line 91
    new-instance v0, Lcom/facebook/login/InstagramAppLoginMethodHandler;

    invoke-direct {v0, p1}, Lcom/facebook/login/InstagramAppLoginMethodHandler;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 87
    invoke-virtual {p0, p1}, Lcom/facebook/login/InstagramAppLoginMethodHandler$1;->createFromParcel(Landroid/os/Parcel;)Lcom/facebook/login/InstagramAppLoginMethodHandler;

    move-result-object p1

    return-object p1
.end method

.method public newArray(I)[Lcom/facebook/login/InstagramAppLoginMethodHandler;
    .locals 0

    .line 96
    new-array p1, p1, [Lcom/facebook/login/InstagramAppLoginMethodHandler;

    return-object p1
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 87
    invoke-virtual {p0, p1}, Lcom/facebook/login/InstagramAppLoginMethodHandler$1;->newArray(I)[Lcom/facebook/login/InstagramAppLoginMethodHandler;

    move-result-object p1

    return-object p1
.end method
