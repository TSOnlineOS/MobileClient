.class public final Lcom/google/android/play/integrity/internal/ab;
.super Ljava/lang/Object;
.source "com.google.android.play:integrity@@1.1.0"

# interfaces
.implements Lcom/google/android/play/integrity/internal/aa;


# static fields
.field private static final a:Lcom/google/android/play/integrity/internal/ab;


# instance fields
.field private final b:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/google/android/play/integrity/internal/ab;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/android/play/integrity/internal/ab;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/google/android/play/integrity/internal/ab;->a:Lcom/google/android/play/integrity/internal/ab;

    return-void
.end method

.method private constructor <init>(Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/play/integrity/internal/ab;->b:Ljava/lang/Object;

    return-void
.end method

.method public static b(Ljava/lang/Object;)Lcom/google/android/play/integrity/internal/aa;
    .locals 1

    new-instance v0, Lcom/google/android/play/integrity/internal/ab;

    invoke-direct {v0, p0}, Lcom/google/android/play/integrity/internal/ab;-><init>(Ljava/lang/Object;)V

    return-object v0
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/google/android/play/integrity/internal/ab;->b:Ljava/lang/Object;

    return-object v0
.end method
