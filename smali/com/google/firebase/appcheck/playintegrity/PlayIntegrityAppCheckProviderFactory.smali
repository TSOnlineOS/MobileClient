.class public Lcom/google/firebase/appcheck/playintegrity/PlayIntegrityAppCheckProviderFactory;
.super Ljava/lang/Object;
.source "PlayIntegrityAppCheckProviderFactory.java"

# interfaces
.implements Lcom/google/firebase/appcheck/AppCheckProviderFactory;


# static fields
.field private static final instance:Lcom/google/firebase/appcheck/playintegrity/PlayIntegrityAppCheckProviderFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 30
    new-instance v0, Lcom/google/firebase/appcheck/playintegrity/PlayIntegrityAppCheckProviderFactory;

    invoke-direct {v0}, Lcom/google/firebase/appcheck/playintegrity/PlayIntegrityAppCheckProviderFactory;-><init>()V

    sput-object v0, Lcom/google/firebase/appcheck/playintegrity/PlayIntegrityAppCheckProviderFactory;->instance:Lcom/google/firebase/appcheck/playintegrity/PlayIntegrityAppCheckProviderFactory;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/google/firebase/appcheck/playintegrity/PlayIntegrityAppCheckProviderFactory;
    .locals 1

    .line 36
    sget-object v0, Lcom/google/firebase/appcheck/playintegrity/PlayIntegrityAppCheckProviderFactory;->instance:Lcom/google/firebase/appcheck/playintegrity/PlayIntegrityAppCheckProviderFactory;

    return-object v0
.end method


# virtual methods
.method public create(Lcom/google/firebase/FirebaseApp;)Lcom/google/firebase/appcheck/AppCheckProvider;
    .locals 1

    .line 43
    const-class v0, Lcom/google/firebase/appcheck/playintegrity/internal/PlayIntegrityAppCheckProvider;

    invoke-virtual {p1, v0}, Lcom/google/firebase/FirebaseApp;->get(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/appcheck/AppCheckProvider;

    return-object p1
.end method
