.class public Lcom/google/firebase/dynamiclinks/internal/DynamicLinkData;
.super Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/firebase/dynamiclinks/internal/DynamicLinkData;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private zzj:Ljava/lang/String;

.field private zzk:Ljava/lang/String;

.field private zzl:I

.field private zzm:J

.field private zzn:Landroid/os/Bundle;

.field private zzo:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 43
    new-instance v0, Lcom/google/firebase/dynamiclinks/internal/zza;

    invoke-direct {v0}, Lcom/google/firebase/dynamiclinks/internal/zza;-><init>()V

    sput-object v0, Lcom/google/firebase/dynamiclinks/internal/DynamicLinkData;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;IJLandroid/os/Bundle;Landroid/net/Uri;)V
    .locals 2

    .line 8
    invoke-direct {p0}, Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;-><init>()V

    const-wide/16 v0, 0x0

    .line 9
    iput-wide v0, p0, Lcom/google/firebase/dynamiclinks/internal/DynamicLinkData;->zzm:J

    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lcom/google/firebase/dynamiclinks/internal/DynamicLinkData;->zzn:Landroid/os/Bundle;

    .line 11
    iput-object p1, p0, Lcom/google/firebase/dynamiclinks/internal/DynamicLinkData;->zzj:Ljava/lang/String;

    .line 12
    iput-object p2, p0, Lcom/google/firebase/dynamiclinks/internal/DynamicLinkData;->zzk:Ljava/lang/String;

    .line 13
    iput p3, p0, Lcom/google/firebase/dynamiclinks/internal/DynamicLinkData;->zzl:I

    .line 14
    iput-wide p4, p0, Lcom/google/firebase/dynamiclinks/internal/DynamicLinkData;->zzm:J

    .line 15
    iput-object p6, p0, Lcom/google/firebase/dynamiclinks/internal/DynamicLinkData;->zzn:Landroid/os/Bundle;

    .line 16
    iput-object p7, p0, Lcom/google/firebase/dynamiclinks/internal/DynamicLinkData;->zzo:Landroid/net/Uri;

    return-void
.end method


# virtual methods
.method public final getClickTimestamp()J
    .locals 2

    .line 3
    iget-wide v0, p0, Lcom/google/firebase/dynamiclinks/internal/DynamicLinkData;->zzm:J

    return-wide v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 5

    .line 19
    invoke-static {p1}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->beginObjectHeader(Landroid/os/Parcel;)I

    move-result v0

    .line 21
    iget-object v1, p0, Lcom/google/firebase/dynamiclinks/internal/DynamicLinkData;->zzj:Ljava/lang/String;

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 23
    invoke-static {p1, v2, v1, v3}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeString(Landroid/os/Parcel;ILjava/lang/String;Z)V

    .line 25
    iget-object v1, p0, Lcom/google/firebase/dynamiclinks/internal/DynamicLinkData;->zzk:Ljava/lang/String;

    const/4 v2, 0x2

    .line 27
    invoke-static {p1, v2, v1, v3}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeString(Landroid/os/Parcel;ILjava/lang/String;Z)V

    .line 29
    iget v1, p0, Lcom/google/firebase/dynamiclinks/internal/DynamicLinkData;->zzl:I

    const/4 v2, 0x3

    .line 30
    invoke-static {p1, v2, v1}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeInt(Landroid/os/Parcel;II)V

    .line 32
    iget-wide v1, p0, Lcom/google/firebase/dynamiclinks/internal/DynamicLinkData;->zzm:J

    const/4 v4, 0x4

    .line 33
    invoke-static {p1, v4, v1, v2}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeLong(Landroid/os/Parcel;IJ)V

    .line 35
    invoke-virtual {p0}, Lcom/google/firebase/dynamiclinks/internal/DynamicLinkData;->zzf()Landroid/os/Bundle;

    move-result-object v1

    const/4 v2, 0x5

    .line 36
    invoke-static {p1, v2, v1, v3}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeBundle(Landroid/os/Parcel;ILandroid/os/Bundle;Z)V

    .line 38
    iget-object v1, p0, Lcom/google/firebase/dynamiclinks/internal/DynamicLinkData;->zzo:Landroid/net/Uri;

    const/4 v2, 0x6

    .line 40
    invoke-static {p1, v2, v1, p2, v3}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeParcelable(Landroid/os/Parcel;ILandroid/os/Parcelable;IZ)V

    .line 41
    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->finishObjectHeader(Landroid/os/Parcel;I)V

    return-void
.end method

.method public final zza(J)V
    .locals 0

    .line 4
    iput-wide p1, p0, Lcom/google/firebase/dynamiclinks/internal/DynamicLinkData;->zzm:J

    return-void
.end method

.method public final zzc()Landroid/net/Uri;
    .locals 1

    .line 7
    iget-object v0, p0, Lcom/google/firebase/dynamiclinks/internal/DynamicLinkData;->zzo:Landroid/net/Uri;

    return-object v0
.end method

.method public final zzd()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/firebase/dynamiclinks/internal/DynamicLinkData;->zzk:Ljava/lang/String;

    return-object v0
.end method

.method public final zze()I
    .locals 1

    .line 2
    iget v0, p0, Lcom/google/firebase/dynamiclinks/internal/DynamicLinkData;->zzl:I

    return v0
.end method

.method public final zzf()Landroid/os/Bundle;
    .locals 1

    .line 6
    iget-object v0, p0, Lcom/google/firebase/dynamiclinks/internal/DynamicLinkData;->zzn:Landroid/os/Bundle;

    if-nez v0, :cond_0

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    :cond_0
    return-object v0
.end method
