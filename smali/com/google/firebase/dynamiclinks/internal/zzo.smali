.class public final Lcom/google/firebase/dynamiclinks/internal/zzo;
.super Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;

# interfaces
.implements Lcom/google/firebase/dynamiclinks/ShortDynamicLink;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/firebase/dynamiclinks/internal/zzo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final zzu:Landroid/net/Uri;

.field private final zzv:Landroid/net/Uri;

.field private final zzw:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/firebase/dynamiclinks/internal/zzr;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 22
    new-instance v0, Lcom/google/firebase/dynamiclinks/internal/zzq;

    invoke-direct {v0}, Lcom/google/firebase/dynamiclinks/internal/zzq;-><init>()V

    sput-object v0, Lcom/google/firebase/dynamiclinks/internal/zzo;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/net/Uri;Landroid/net/Uri;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Landroid/net/Uri;",
            "Ljava/util/List<",
            "Lcom/google/firebase/dynamiclinks/internal/zzr;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/firebase/dynamiclinks/internal/zzo;->zzu:Landroid/net/Uri;

    .line 3
    iput-object p2, p0, Lcom/google/firebase/dynamiclinks/internal/zzo;->zzv:Landroid/net/Uri;

    .line 4
    iput-object p3, p0, Lcom/google/firebase/dynamiclinks/internal/zzo;->zzw:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final getPreviewLink()Landroid/net/Uri;
    .locals 1

    .line 7
    iget-object v0, p0, Lcom/google/firebase/dynamiclinks/internal/zzo;->zzv:Landroid/net/Uri;

    return-object v0
.end method

.method public final getShortLink()Landroid/net/Uri;
    .locals 1

    .line 6
    iget-object v0, p0, Lcom/google/firebase/dynamiclinks/internal/zzo;->zzu:Landroid/net/Uri;

    return-object v0
.end method

.method public final getWarnings()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/firebase/dynamiclinks/internal/zzr;",
            ">;"
        }
    .end annotation

    .line 8
    iget-object v0, p0, Lcom/google/firebase/dynamiclinks/internal/zzo;->zzw:Ljava/util/List;

    return-object v0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 4

    .line 10
    invoke-static {p1}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->beginObjectHeader(Landroid/os/Parcel;)I

    move-result v0

    .line 12
    invoke-virtual {p0}, Lcom/google/firebase/dynamiclinks/internal/zzo;->getShortLink()Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 13
    invoke-static {p1, v2, v1, p2, v3}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeParcelable(Landroid/os/Parcel;ILandroid/os/Parcelable;IZ)V

    .line 15
    invoke-virtual {p0}, Lcom/google/firebase/dynamiclinks/internal/zzo;->getPreviewLink()Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x2

    .line 16
    invoke-static {p1, v2, v1, p2, v3}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeParcelable(Landroid/os/Parcel;ILandroid/os/Parcelable;IZ)V

    .line 18
    invoke-virtual {p0}, Lcom/google/firebase/dynamiclinks/internal/zzo;->getWarnings()Ljava/util/List;

    move-result-object p2

    const/4 v1, 0x3

    .line 19
    invoke-static {p1, v1, p2, v3}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeTypedList(Landroid/os/Parcel;ILjava/util/List;Z)V

    .line 20
    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->finishObjectHeader(Landroid/os/Parcel;I)V

    return-void
.end method
