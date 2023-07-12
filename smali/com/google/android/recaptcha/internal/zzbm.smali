.class public final Lcom/google/android/recaptcha/internal/zzbm;
.super Ljava/lang/Object;
.source "com.google.android.recaptcha:recaptcha@@18.1.2"


# instance fields
.field private final zza:Ljava/util/Map;

.field private final zzb:Ljava/util/Set;

.field private final zzc:Ljava/util/Map;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/recaptcha/internal/zzbm;->zza:Ljava/util/Map;

    new-instance v0, Ljava/util/LinkedHashSet;

    .line 2
    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lcom/google/android/recaptcha/internal/zzbm;->zzb:Ljava/util/Set;

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzbm;->zza:Ljava/util/Map;

    iput-object v0, p0, Lcom/google/android/recaptcha/internal/zzbm;->zzc:Ljava/util/Map;

    return-void
.end method

.method private final zzh(Ljava/util/List;)Ljava/util/List;
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {p1, v1}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 2
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 3
    check-cast v1, Lcom/google/android/recaptcha/internal/zzmu;

    .line 4
    invoke-virtual {p0, v1}, Lcom/google/android/recaptcha/internal/zzbm;->zza(Lcom/google/android/recaptcha/internal/zzmu;)Ljava/lang/Object;

    move-result-object v1

    .line 3
    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-object v0
.end method


# virtual methods
.method public final zza(Lcom/google/android/recaptcha/internal/zzmu;)Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/recaptcha/internal/zzt;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzmu;->zzN()I

    move-result v0

    add-int/lit8 v1, v0, -0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_3

    const/4 v0, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x6

    const/4 v5, 0x4

    packed-switch v1, :pswitch_data_0

    new-instance p1, Lcom/google/android/recaptcha/internal/zzt;

    const/4 v0, 0x5

    .line 25
    invoke-direct {p1, v5, v0, v2}, Lcom/google/android/recaptcha/internal/zzt;-><init>(IILjava/lang/Throwable;)V

    .line 26
    throw p1

    .line 5
    :pswitch_0
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzmu;->zzK()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 6
    :pswitch_1
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzmu;->zzf()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    return-object p1

    .line 7
    :pswitch_2
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzmu;->zzg()F

    move-result p1

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    return-object p1

    .line 8
    :pswitch_3
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzmu;->zzG()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    return-object p1

    .line 18
    :pswitch_4
    new-instance p1, Lcom/google/android/recaptcha/internal/zzt;

    .line 2
    invoke-direct {p1, v5, v4, v2}, Lcom/google/android/recaptcha/internal/zzt;-><init>(IILjava/lang/Throwable;)V

    .line 3
    throw p1

    .line 9
    :pswitch_5
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzmu;->zzk()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1

    .line 10
    :pswitch_6
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzmu;->zzj()I

    move-result p1

    const/16 v0, -0x8000

    if-lt p1, v0, :cond_0

    const/16 v0, 0x7fff

    if-gt p1, v0, :cond_0

    int-to-short p1, p1

    .line 13
    invoke-static {p1}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v2

    goto :goto_0

    .line 10
    :cond_0
    new-instance p1, Lcom/google/android/recaptcha/internal/zzt;

    .line 11
    invoke-direct {p1, v5, v4, v2}, Lcom/google/android/recaptcha/internal/zzt;-><init>(IILjava/lang/Throwable;)V

    .line 12
    throw p1

    .line 14
    :pswitch_7
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzmu;->zzJ()Ljava/lang/String;

    move-result-object p1

    .line 15
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-ne v1, v3, :cond_1

    .line 18
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result p1

    invoke-static {p1}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v2

    goto :goto_0

    .line 15
    :cond_1
    new-instance p1, Lcom/google/android/recaptcha/internal/zzt;

    .line 16
    invoke-direct {p1, v5, v4, v2}, Lcom/google/android/recaptcha/internal/zzt;-><init>(IILjava/lang/Throwable;)V

    .line 17
    throw p1

    .line 19
    :pswitch_8
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzmu;->zzH()Lcom/google/android/recaptcha/internal/zzez;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzez;->zzo()[B

    move-result-object p1

    .line 20
    array-length v1, p1

    if-ne v1, v3, :cond_2

    .line 23
    aget-byte p1, p1, v0

    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v2

    :goto_0
    :pswitch_9
    return-object v2

    .line 20
    :cond_2
    new-instance p1, Lcom/google/android/recaptcha/internal/zzt;

    .line 21
    invoke-direct {p1, v5, v4, v2}, Lcom/google/android/recaptcha/internal/zzt;-><init>(IILjava/lang/Throwable;)V

    .line 22
    throw p1

    .line 24
    :pswitch_a
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzmu;->zzL()Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    .line 23
    :pswitch_b
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzbm;->zza:Ljava/util/Map;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/recaptcha/internal/zzmu;->zzi()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 1
    :cond_3
    throw v2

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_b
        :pswitch_a
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_4
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_9
    .end packed-switch
.end method

.method public final zzb(I)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzbm;->zza:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final zzc()Ljava/util/Map;
    .locals 1

    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzbm;->zzc:Ljava/util/Map;

    return-object v0
.end method

.method public final zzd()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzbm;->zza:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    return-void
.end method

.method public final zze(ILjava/lang/Object;)V
    .locals 0

    const/16 p1, 0xad

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/google/android/recaptcha/internal/zzbm;->zzf(ILjava/lang/Object;)V

    iget-object p2, p0, Lcom/google/android/recaptcha/internal/zzbm;->zzb:Ljava/util/Set;

    .line 2
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {p2, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final zzf(ILjava/lang/Object;)V
    .locals 1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    .line 1
    iget-object v0, p0, Lcom/google/android/recaptcha/internal/zzbm;->zza:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final zzg(Ljava/util/List;)[Ljava/lang/Object;
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/google/android/recaptcha/internal/zzbm;->zzh(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    .line 2
    invoke-interface {p1, v0}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
