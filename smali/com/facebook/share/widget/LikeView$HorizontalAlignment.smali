.class public final enum Lcom/facebook/share/widget/LikeView$HorizontalAlignment;
.super Ljava/lang/Enum;
.source "LikeView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/share/widget/LikeView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "HorizontalAlignment"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/facebook/share/widget/LikeView$HorizontalAlignment;",
        ">;"
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/facebook/share/widget/LikeView$HorizontalAlignment;

.field public static final enum CENTER:Lcom/facebook/share/widget/LikeView$HorizontalAlignment;

.field static DEFAULT:Lcom/facebook/share/widget/LikeView$HorizontalAlignment;

.field public static final enum LEFT:Lcom/facebook/share/widget/LikeView$HorizontalAlignment;

.field public static final enum RIGHT:Lcom/facebook/share/widget/LikeView$HorizontalAlignment;


# instance fields
.field private intValue:I

.field private stringValue:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 166
    new-instance v0, Lcom/facebook/share/widget/LikeView$HorizontalAlignment;

    const-string v1, "CENTER"

    const/4 v2, 0x0

    const-string v3, "center"

    invoke-direct {v0, v1, v2, v3, v2}, Lcom/facebook/share/widget/LikeView$HorizontalAlignment;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/facebook/share/widget/LikeView$HorizontalAlignment;->CENTER:Lcom/facebook/share/widget/LikeView$HorizontalAlignment;

    .line 172
    new-instance v0, Lcom/facebook/share/widget/LikeView$HorizontalAlignment;

    const-string v1, "LEFT"

    const/4 v3, 0x1

    const-string v4, "left"

    invoke-direct {v0, v1, v3, v4, v3}, Lcom/facebook/share/widget/LikeView$HorizontalAlignment;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/facebook/share/widget/LikeView$HorizontalAlignment;->LEFT:Lcom/facebook/share/widget/LikeView$HorizontalAlignment;

    .line 179
    new-instance v0, Lcom/facebook/share/widget/LikeView$HorizontalAlignment;

    const-string v1, "RIGHT"

    const/4 v4, 0x2

    const-string v5, "right"

    invoke-direct {v0, v1, v4, v5, v4}, Lcom/facebook/share/widget/LikeView$HorizontalAlignment;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/facebook/share/widget/LikeView$HorizontalAlignment;->RIGHT:Lcom/facebook/share/widget/LikeView$HorizontalAlignment;

    const/4 v1, 0x3

    new-array v1, v1, [Lcom/facebook/share/widget/LikeView$HorizontalAlignment;

    .line 158
    sget-object v5, Lcom/facebook/share/widget/LikeView$HorizontalAlignment;->CENTER:Lcom/facebook/share/widget/LikeView$HorizontalAlignment;

    aput-object v5, v1, v2

    sget-object v2, Lcom/facebook/share/widget/LikeView$HorizontalAlignment;->LEFT:Lcom/facebook/share/widget/LikeView$HorizontalAlignment;

    aput-object v2, v1, v3

    aput-object v0, v1, v4

    sput-object v1, Lcom/facebook/share/widget/LikeView$HorizontalAlignment;->$VALUES:[Lcom/facebook/share/widget/LikeView$HorizontalAlignment;

    .line 181
    sput-object v5, Lcom/facebook/share/widget/LikeView$HorizontalAlignment;->DEFAULT:Lcom/facebook/share/widget/LikeView$HorizontalAlignment;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    .line 196
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 197
    iput-object p3, p0, Lcom/facebook/share/widget/LikeView$HorizontalAlignment;->stringValue:Ljava/lang/String;

    .line 198
    iput p4, p0, Lcom/facebook/share/widget/LikeView$HorizontalAlignment;->intValue:I

    return-void
.end method

.method static synthetic access$200(Lcom/facebook/share/widget/LikeView$HorizontalAlignment;)I
    .locals 0

    .line 159
    invoke-direct {p0}, Lcom/facebook/share/widget/LikeView$HorizontalAlignment;->getValue()I

    move-result p0

    return p0
.end method

.method static fromInt(I)Lcom/facebook/share/widget/LikeView$HorizontalAlignment;
    .locals 5

    .line 184
    invoke-static {}, Lcom/facebook/share/widget/LikeView$HorizontalAlignment;->values()[Lcom/facebook/share/widget/LikeView$HorizontalAlignment;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 185
    invoke-direct {v3}, Lcom/facebook/share/widget/LikeView$HorizontalAlignment;->getValue()I

    move-result v4

    if-ne v4, p0, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method private getValue()I
    .locals 1

    .line 207
    iget v0, p0, Lcom/facebook/share/widget/LikeView$HorizontalAlignment;->intValue:I

    return v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/facebook/share/widget/LikeView$HorizontalAlignment;
    .locals 1

    .line 158
    const-class v0, Lcom/facebook/share/widget/LikeView$HorizontalAlignment;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/facebook/share/widget/LikeView$HorizontalAlignment;

    return-object p0
.end method

.method public static values()[Lcom/facebook/share/widget/LikeView$HorizontalAlignment;
    .locals 1

    .line 158
    sget-object v0, Lcom/facebook/share/widget/LikeView$HorizontalAlignment;->$VALUES:[Lcom/facebook/share/widget/LikeView$HorizontalAlignment;

    invoke-virtual {v0}, [Lcom/facebook/share/widget/LikeView$HorizontalAlignment;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/facebook/share/widget/LikeView$HorizontalAlignment;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 203
    iget-object v0, p0, Lcom/facebook/share/widget/LikeView$HorizontalAlignment;->stringValue:Ljava/lang/String;

    return-object v0
.end method
