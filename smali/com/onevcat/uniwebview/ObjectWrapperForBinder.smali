.class public Lcom/onevcat/uniwebview/ObjectWrapperForBinder;
.super Landroid/os/Binder;
.source "ObjectWrapperForBinder.java"


# instance fields
.field private final mData:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 0

    .line 15
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 16
    iput-object p1, p0, Lcom/onevcat/uniwebview/ObjectWrapperForBinder;->mData:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public getData()Ljava/lang/Object;
    .locals 1

    .line 20
    iget-object v0, p0, Lcom/onevcat/uniwebview/ObjectWrapperForBinder;->mData:Ljava/lang/Object;

    return-object v0
.end method
