.class public final synthetic Lcom/google/firebase/auth/zzag;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.0.0"

# interfaces
.implements Lcom/google/firebase/components/ComponentFactory;


# instance fields
.field public final synthetic zza:Lcom/google/firebase/components/Qualified;

.field public final synthetic zzb:Lcom/google/firebase/components/Qualified;

.field public final synthetic zzc:Lcom/google/firebase/components/Qualified;

.field public final synthetic zzd:Lcom/google/firebase/components/Qualified;

.field public final synthetic zze:Lcom/google/firebase/components/Qualified;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/components/Qualified;Lcom/google/firebase/components/Qualified;Lcom/google/firebase/components/Qualified;Lcom/google/firebase/components/Qualified;Lcom/google/firebase/components/Qualified;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/auth/zzag;->zza:Lcom/google/firebase/components/Qualified;

    iput-object p2, p0, Lcom/google/firebase/auth/zzag;->zzb:Lcom/google/firebase/components/Qualified;

    iput-object p3, p0, Lcom/google/firebase/auth/zzag;->zzc:Lcom/google/firebase/components/Qualified;

    iput-object p4, p0, Lcom/google/firebase/auth/zzag;->zzd:Lcom/google/firebase/components/Qualified;

    iput-object p5, p0, Lcom/google/firebase/auth/zzag;->zze:Lcom/google/firebase/components/Qualified;

    return-void
.end method


# virtual methods
.method public final create(Lcom/google/firebase/components/ComponentContainer;)Ljava/lang/Object;
    .locals 6

    iget-object v0, p0, Lcom/google/firebase/auth/zzag;->zza:Lcom/google/firebase/components/Qualified;

    iget-object v1, p0, Lcom/google/firebase/auth/zzag;->zzb:Lcom/google/firebase/components/Qualified;

    iget-object v2, p0, Lcom/google/firebase/auth/zzag;->zzc:Lcom/google/firebase/components/Qualified;

    iget-object v3, p0, Lcom/google/firebase/auth/zzag;->zzd:Lcom/google/firebase/components/Qualified;

    iget-object v4, p0, Lcom/google/firebase/auth/zzag;->zze:Lcom/google/firebase/components/Qualified;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lcom/google/firebase/auth/FirebaseAuthRegistrar;->lambda$getComponents$0(Lcom/google/firebase/components/Qualified;Lcom/google/firebase/components/Qualified;Lcom/google/firebase/components/Qualified;Lcom/google/firebase/components/Qualified;Lcom/google/firebase/components/Qualified;Lcom/google/firebase/components/ComponentContainer;)Lcom/google/firebase/auth/FirebaseAuth;

    move-result-object p1

    return-object p1
.end method
