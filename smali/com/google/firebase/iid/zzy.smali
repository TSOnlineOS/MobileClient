.class final synthetic Lcom/google/firebase/iid/zzy;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-iid@@19.0.1"

# interfaces
.implements Landroid/os/Handler$Callback;


# instance fields
.field private final zza:Lcom/google/firebase/iid/zzv;


# direct methods
.method constructor <init>(Lcom/google/firebase/iid/zzv;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/iid/zzy;->zza:Lcom/google/firebase/iid/zzv;

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)Z
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/iid/zzy;->zza:Lcom/google/firebase/iid/zzv;

    invoke-virtual {v0, p1}, Lcom/google/firebase/iid/zzv;->zza(Landroid/os/Message;)Z

    move-result p1

    return p1
.end method
