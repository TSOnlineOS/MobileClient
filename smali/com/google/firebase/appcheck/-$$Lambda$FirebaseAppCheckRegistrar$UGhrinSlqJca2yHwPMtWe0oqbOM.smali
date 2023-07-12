.class public final synthetic Lcom/google/firebase/appcheck/-$$Lambda$FirebaseAppCheckRegistrar$UGhrinSlqJca2yHwPMtWe0oqbOM;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/google/firebase/components/ComponentFactory;


# instance fields
.field public final synthetic f$0:Lcom/google/firebase/components/Qualified;

.field public final synthetic f$1:Lcom/google/firebase/components/Qualified;

.field public final synthetic f$2:Lcom/google/firebase/components/Qualified;

.field public final synthetic f$3:Lcom/google/firebase/components/Qualified;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/components/Qualified;Lcom/google/firebase/components/Qualified;Lcom/google/firebase/components/Qualified;Lcom/google/firebase/components/Qualified;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/appcheck/-$$Lambda$FirebaseAppCheckRegistrar$UGhrinSlqJca2yHwPMtWe0oqbOM;->f$0:Lcom/google/firebase/components/Qualified;

    iput-object p2, p0, Lcom/google/firebase/appcheck/-$$Lambda$FirebaseAppCheckRegistrar$UGhrinSlqJca2yHwPMtWe0oqbOM;->f$1:Lcom/google/firebase/components/Qualified;

    iput-object p3, p0, Lcom/google/firebase/appcheck/-$$Lambda$FirebaseAppCheckRegistrar$UGhrinSlqJca2yHwPMtWe0oqbOM;->f$2:Lcom/google/firebase/components/Qualified;

    iput-object p4, p0, Lcom/google/firebase/appcheck/-$$Lambda$FirebaseAppCheckRegistrar$UGhrinSlqJca2yHwPMtWe0oqbOM;->f$3:Lcom/google/firebase/components/Qualified;

    return-void
.end method


# virtual methods
.method public final create(Lcom/google/firebase/components/ComponentContainer;)Ljava/lang/Object;
    .locals 4

    iget-object v0, p0, Lcom/google/firebase/appcheck/-$$Lambda$FirebaseAppCheckRegistrar$UGhrinSlqJca2yHwPMtWe0oqbOM;->f$0:Lcom/google/firebase/components/Qualified;

    iget-object v1, p0, Lcom/google/firebase/appcheck/-$$Lambda$FirebaseAppCheckRegistrar$UGhrinSlqJca2yHwPMtWe0oqbOM;->f$1:Lcom/google/firebase/components/Qualified;

    iget-object v2, p0, Lcom/google/firebase/appcheck/-$$Lambda$FirebaseAppCheckRegistrar$UGhrinSlqJca2yHwPMtWe0oqbOM;->f$2:Lcom/google/firebase/components/Qualified;

    iget-object v3, p0, Lcom/google/firebase/appcheck/-$$Lambda$FirebaseAppCheckRegistrar$UGhrinSlqJca2yHwPMtWe0oqbOM;->f$3:Lcom/google/firebase/components/Qualified;

    invoke-static {v0, v1, v2, v3, p1}, Lcom/google/firebase/appcheck/FirebaseAppCheckRegistrar;->lambda$getComponents$0(Lcom/google/firebase/components/Qualified;Lcom/google/firebase/components/Qualified;Lcom/google/firebase/components/Qualified;Lcom/google/firebase/components/Qualified;Lcom/google/firebase/components/ComponentContainer;)Lcom/google/firebase/appcheck/FirebaseAppCheck;

    move-result-object p1

    return-object p1
.end method
