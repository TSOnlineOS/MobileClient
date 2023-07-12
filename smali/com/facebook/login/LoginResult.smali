.class public Lcom/facebook/login/LoginResult;
.super Ljava/lang/Object;
.source "LoginResult.java"


# instance fields
.field private final accessToken:Lcom/facebook/AccessToken;

.field private final authenticationToken:Lcom/facebook/AuthenticationToken;

.field private final recentlyDeniedPermissions:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final recentlyGrantedPermissions:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/facebook/AccessToken;Lcom/facebook/AuthenticationToken;Ljava/util/Set;Ljava/util/Set;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/AccessToken;",
            "Lcom/facebook/AuthenticationToken;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput-object p1, p0, Lcom/facebook/login/LoginResult;->accessToken:Lcom/facebook/AccessToken;

    .line 63
    iput-object p2, p0, Lcom/facebook/login/LoginResult;->authenticationToken:Lcom/facebook/AuthenticationToken;

    .line 64
    iput-object p3, p0, Lcom/facebook/login/LoginResult;->recentlyGrantedPermissions:Ljava/util/Set;

    .line 65
    iput-object p4, p0, Lcom/facebook/login/LoginResult;->recentlyDeniedPermissions:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>(Lcom/facebook/AccessToken;Ljava/util/Set;Ljava/util/Set;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/AccessToken;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 46
    invoke-direct {p0, p1, v0, p2, p3}, Lcom/facebook/login/LoginResult;-><init>(Lcom/facebook/AccessToken;Lcom/facebook/AuthenticationToken;Ljava/util/Set;Ljava/util/Set;)V

    return-void
.end method


# virtual methods
.method public getAccessToken()Lcom/facebook/AccessToken;
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/facebook/login/LoginResult;->accessToken:Lcom/facebook/AccessToken;

    return-object v0
.end method

.method public getAuthenticationToken()Lcom/facebook/AuthenticationToken;
    .locals 1

    .line 83
    iget-object v0, p0, Lcom/facebook/login/LoginResult;->authenticationToken:Lcom/facebook/AuthenticationToken;

    return-object v0
.end method

.method public getRecentlyDeniedPermissions()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 101
    iget-object v0, p0, Lcom/facebook/login/LoginResult;->recentlyDeniedPermissions:Ljava/util/Set;

    return-object v0
.end method

.method public getRecentlyGrantedPermissions()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 92
    iget-object v0, p0, Lcom/facebook/login/LoginResult;->recentlyGrantedPermissions:Ljava/util/Set;

    return-object v0
.end method
