.class public final synthetic Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultFirebaseAppCheck$srRDamzXg9TR6IfQqGBQFT4vxxc;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/google/android/gms/tasks/Continuation;


# static fields
.field public static final synthetic INSTANCE:Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultFirebaseAppCheck$srRDamzXg9TR6IfQqGBQFT4vxxc;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultFirebaseAppCheck$srRDamzXg9TR6IfQqGBQFT4vxxc;

    invoke-direct {v0}, Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultFirebaseAppCheck$srRDamzXg9TR6IfQqGBQFT4vxxc;-><init>()V

    sput-object v0, Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultFirebaseAppCheck$srRDamzXg9TR6IfQqGBQFT4vxxc;->INSTANCE:Lcom/google/firebase/appcheck/internal/-$$Lambda$DefaultFirebaseAppCheck$srRDamzXg9TR6IfQqGBQFT4vxxc;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final then(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .locals 0

    invoke-static {p1}, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->lambda$getToken$1(Lcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method
