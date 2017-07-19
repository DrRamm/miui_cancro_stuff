.class public Landroid/media/AudioServiceInjector;
.super Ljava/lang/Object;
.source "AudioServiceInjector.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "AudioService"

.field public static mOriginalIndexWhenSetStreamVolume:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static adjustDefaultStreamVolume([I)V
    .registers 3
    .param p0, "defaultStreamVolume"    # [I

    .prologue
    .line 128
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p0

    if-ge v0, v1, :cond_11

    .line 129
    if-eqz v0, :cond_9

    const/4 v1, 0x6

    if-ne v0, v1, :cond_c

    .line 128
    :cond_9
    :goto_9
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 132
    :cond_c
    const/16 v1, 0xa

    aput v1, p0, v0

    goto :goto_9

    .line 134
    :cond_11
    return-void
.end method

.method public static adjustHiFiVolume(ILandroid/content/Context;)V
    .registers 4
    .param p0, "direction"    # I
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 36
    invoke-static {p1}, Lmiui/util/AudioManagerHelper;->getHiFiVolume(Landroid/content/Context;)I

    move-result v0

    .line 38
    .local v0, "currentHiFiVolume":I
    const/4 v1, -0x1

    if-ne p0, v1, :cond_d

    .line 39
    add-int/lit8 v1, v0, -0xa

    invoke-static {p1, v1}, Lmiui/util/AudioManagerHelper;->setHiFiVolume(Landroid/content/Context;I)V

    .line 43
    :cond_c
    :goto_c
    return-void

    .line 40
    :cond_d
    const/4 v1, 0x1

    if-ne p0, v1, :cond_c

    const/16 v1, 0x64

    if-ge v0, v1, :cond_c

    .line 41
    add-int/lit8 v1, v0, 0xa

    invoke-static {p1, v1}, Lmiui/util/AudioManagerHelper;->setHiFiVolume(Landroid/content/Context;I)V

    goto :goto_c
.end method

.method public static adjustMaxStreamVolume([I)V
    .registers 3
    .param p0, "maxStreamVolume"    # [I

    .prologue
    .line 119
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p0

    if-ge v0, v1, :cond_11

    .line 120
    if-eqz v0, :cond_9

    const/4 v1, 0x6

    if-ne v0, v1, :cond_c

    .line 119
    :cond_9
    :goto_9
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 123
    :cond_c
    const/16 v1, 0x23

    aput v1, p0, v0

    goto :goto_9

    .line 125
    :cond_11
    return-void
.end method

.method public static calculateStreamMaxVolume(IILandroid/content/Context;)I
    .registers 5
    .param p0, "streamType"    # I
    .param p1, "maxIndex"    # I
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 106
    add-int/lit8 v1, p1, 0x5

    div-int/lit8 v0, v1, 0xa

    .line 107
    .local v0, "retValue":I
    const/4 v1, 0x3

    if-ne v1, p0, :cond_f

    invoke-static {p2}, Lmiui/util/AudioManagerHelper;->isHiFiMode(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_f

    .line 109
    add-int/lit8 v0, v0, 0xa

    .line 111
    :cond_f
    return v0
.end method

.method public static calculateStreamVolume(IILandroid/content/Context;)I
    .registers 5
    .param p0, "streamType"    # I
    .param p1, "index"    # I
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 98
    add-int/lit8 v1, p1, 0x5

    div-int/lit8 v0, v1, 0xa

    .line 99
    .local v0, "retValue":I
    const/4 v1, 0x3

    if-ne p0, v1, :cond_14

    invoke-static {p2}, Lmiui/util/AudioManagerHelper;->isHiFiMode(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 100
    invoke-static {p2}, Lmiui/util/AudioManagerHelper;->getHiFiVolume(Landroid/content/Context;)I

    move-result v1

    div-int/lit8 v1, v1, 0xa

    add-int/2addr v0, v1

    .line 102
    :cond_14
    return v0
.end method

.method public static checkForRingerModeChange(Landroid/content/Context;III)I
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "oldRingerMode"    # I
    .param p2, "newRingerMode"    # I
    .param p3, "direction"    # I

    .prologue
    .line 137
    invoke-static {p0, p2}, Lmiui/util/AudioManagerHelper;->getValidatedRingerMode(Landroid/content/Context;I)I

    move-result v0

    return v0
.end method

.method public static isOnlyAdjustVolume(I)Z
    .registers 2
    .param p0, "flags"    # I

    .prologue
    .line 115
    const/high16 v0, 0x100000

    and-int/2addr v0, p0

    if-eqz v0, :cond_7

    const/4 v0, 0x1

    :goto_6
    return v0

    :cond_7
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public static isPackageProtectedWhenUserBackground(ILandroid/content/pm/PackageInfo;)Z
    .registers 3
    .param p0, "userId"    # I
    .param p1, "pkg"    # Landroid/content/pm/PackageInfo;

    .prologue
    .line 141
    iget-object v0, p1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-static {v0, p0}, Lcom/miui/whetstone/WhetstoneActivityManager;->checkIfPackageIsLocked(Ljava/lang/String;I)Z

    move-result v0

    return v0
.end method

.method public static setStreamVolumeIntAlt(Ljava/lang/Object;IIII[ILandroid/content/Context;)V
    .registers 19
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "streamType"    # I
    .param p2, "index"    # I
    .param p3, "device"    # I
    .param p4, "maxIndex"    # I
    .param p5, "streamVolumeAlias"    # [I
    .param p6, "context"    # Landroid/content/Context;

    .prologue
    .line 48
    :try_start_0
    invoke-static/range {p6 .. p6}, Lmiui/util/AudioManagerHelper;->isHiFiMode(Landroid/content/Context;)Z

    move-result v3

    .line 49
    .local v3, "isHiFiMode":Z
    const/4 v1, 0x0

    .line 50
    .local v1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 51
    const/4 v4, 0x0

    .line 52
    .local v4, "method":Ljava/lang/reflect/Method;
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0x17

    if-lt v8, v9, :cond_85

    .line 53
    if-eqz v1, :cond_35

    .line 54
    const-string/jumbo v8, "setStreamVolumeInt"

    const/4 v9, 0x5

    new-array v9, v9, [Ljava/lang/Class;

    const/4 v10, 0x0

    sget-object v11, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v11, v9, v10

    const/4 v10, 0x1

    sget-object v11, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v11, v9, v10

    const/4 v10, 0x2

    sget-object v11, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v11, v9, v10

    const/4 v10, 0x3

    sget-object v11, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v11, v9, v10

    const/4 v10, 0x4

    const-class v11, Ljava/lang/String;

    aput-object v11, v9, v10

    invoke-virtual {v1, v8, v9}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 63
    :cond_35
    :goto_35
    const/4 v8, 0x3

    if-ne v8, p1, :cond_d1

    if-eqz v3, :cond_d1

    move/from16 v0, p4

    if-lt p2, v0, :cond_d1

    .line 64
    move/from16 v5, p4

    .line 65
    .local v5, "rawStreamMaxIndex":I
    if-eqz v4, :cond_76

    .line 66
    const/4 v8, 0x1

    invoke-virtual {v4, v8}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 67
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0x17

    if-lt v8, v9, :cond_a6

    .line 68
    const/4 v8, 0x5

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aget v10, p5, p1

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x3

    const/4 v10, 0x0

    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x4

    const-string v10, "AudioService"

    aput-object v10, v8, v9

    invoke-virtual {v4, p0, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    :cond_76
    :goto_76
    add-int/lit8 v8, v5, 0x5

    div-int/lit8 v6, v8, 0xa

    .line 74
    .local v6, "streamMaxIndex":I
    sget v8, Landroid/media/AudioServiceInjector;->mOriginalIndexWhenSetStreamVolume:I

    sub-int/2addr v8, v6

    mul-int/lit8 v8, v8, 0xa

    move-object/from16 v0, p6

    invoke-static {v0, v8}, Lmiui/util/AudioManagerHelper;->setHiFiVolume(Landroid/content/Context;I)V

    .line 95
    .end local v1    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "isHiFiMode":Z
    .end local v4    # "method":Ljava/lang/reflect/Method;
    .end local v5    # "rawStreamMaxIndex":I
    .end local v6    # "streamMaxIndex":I
    :cond_84
    :goto_84
    return-void

    .line 58
    .restart local v1    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v3    # "isHiFiMode":Z
    .restart local v4    # "method":Ljava/lang/reflect/Method;
    :cond_85
    if-eqz v1, :cond_35

    .line 59
    const-string/jumbo v8, "setStreamVolumeInt"

    const/4 v9, 0x4

    new-array v9, v9, [Ljava/lang/Class;

    const/4 v10, 0x0

    sget-object v11, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v11, v9, v10

    const/4 v10, 0x1

    sget-object v11, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v11, v9, v10

    const/4 v10, 0x2

    sget-object v11, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v11, v9, v10

    const/4 v10, 0x3

    sget-object v11, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v11, v9, v10

    invoke-virtual {v1, v8, v9}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    goto :goto_35

    .line 70
    .restart local v5    # "rawStreamMaxIndex":I
    :cond_a6
    const/4 v8, 0x4

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aget v10, p5, p1

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x3

    const/4 v10, 0x0

    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-virtual {v4, p0, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_cb
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_cb} :catch_cc
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_cb} :catch_12c
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_cb} :catch_159
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_cb} :catch_15f

    goto :goto_76

    .line 86
    .end local v1    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "isHiFiMode":Z
    .end local v4    # "method":Ljava/lang/reflect/Method;
    .end local v5    # "rawStreamMaxIndex":I
    :catch_cc
    move-exception v2

    .line 87
    .local v2, "e":Ljava/lang/UnsupportedOperationException;
    invoke-virtual {v2}, Ljava/lang/UnsupportedOperationException;->printStackTrace()V

    goto :goto_84

    .line 76
    .end local v2    # "e":Ljava/lang/UnsupportedOperationException;
    .restart local v1    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v3    # "isHiFiMode":Z
    .restart local v4    # "method":Ljava/lang/reflect/Method;
    :cond_d1
    if-eqz v4, :cond_84

    .line 77
    const/4 v8, 0x1

    :try_start_d4
    invoke-virtual {v4, v8}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 78
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0x17

    if-lt v8, v9, :cond_132

    .line 79
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Pid:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " Uid:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 80
    .local v7, "tag":Ljava/lang/String;
    const/4 v8, 0x5

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aget v10, p5, p1

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x3

    const/4 v10, 0x0

    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x4

    aput-object v7, v8, v9

    invoke-virtual {v4, p0, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_12a
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_d4 .. :try_end_12a} :catch_cc
    .catch Ljava/lang/NoSuchMethodException; {:try_start_d4 .. :try_end_12a} :catch_12c
    .catch Ljava/lang/IllegalAccessException; {:try_start_d4 .. :try_end_12a} :catch_159
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_d4 .. :try_end_12a} :catch_15f

    goto/16 :goto_84

    .line 88
    .end local v1    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "isHiFiMode":Z
    .end local v4    # "method":Ljava/lang/reflect/Method;
    .end local v7    # "tag":Ljava/lang/String;
    :catch_12c
    move-exception v2

    .line 89
    .local v2, "e":Ljava/lang/NoSuchMethodException;
    invoke-virtual {v2}, Ljava/lang/NoSuchMethodException;->printStackTrace()V

    goto/16 :goto_84

    .line 82
    .end local v2    # "e":Ljava/lang/NoSuchMethodException;
    .restart local v1    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v3    # "isHiFiMode":Z
    .restart local v4    # "method":Ljava/lang/reflect/Method;
    :cond_132
    const/4 v8, 0x4

    :try_start_133
    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aget v10, p5, p1

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x3

    const/4 v10, 0x0

    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-virtual {v4, p0, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_157
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_133 .. :try_end_157} :catch_cc
    .catch Ljava/lang/NoSuchMethodException; {:try_start_133 .. :try_end_157} :catch_12c
    .catch Ljava/lang/IllegalAccessException; {:try_start_133 .. :try_end_157} :catch_159
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_133 .. :try_end_157} :catch_15f

    goto/16 :goto_84

    .line 90
    .end local v1    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "isHiFiMode":Z
    .end local v4    # "method":Ljava/lang/reflect/Method;
    :catch_159
    move-exception v2

    .line 91
    .local v2, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v2}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto/16 :goto_84

    .line 92
    .end local v2    # "e":Ljava/lang/IllegalAccessException;
    :catch_15f
    move-exception v2

    .line 93
    .local v2, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v2}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace()V

    goto/16 :goto_84
.end method

.method public static shouldAdjustHiFiVolume(IIIILandroid/content/Context;)Z
    .registers 12
    .param p0, "streamType"    # I
    .param p1, "direction"    # I
    .param p2, "streamIndex"    # I
    .param p3, "maxIndex"    # I
    .param p4, "context"    # Landroid/content/Context;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 24
    const/4 v6, 0x3

    if-ne p0, v6, :cond_b

    invoke-static {p4}, Lmiui/util/AudioManagerHelper;->isHiFiMode(Landroid/content/Context;)Z

    move-result v6

    if-nez v6, :cond_c

    .line 32
    :cond_b
    :goto_b
    return v4

    .line 28
    :cond_c
    invoke-static {p4}, Lmiui/util/AudioManagerHelper;->getHiFiVolume(Landroid/content/Context;)I

    move-result v2

    .line 29
    .local v2, "currentHiFiVolume":I
    move v3, p3

    .line 30
    .local v3, "maxStreamIndex":I
    const/4 v6, -0x1

    if-ne p1, v6, :cond_22

    if-lez v2, :cond_22

    move v0, v5

    .line 31
    .local v0, "adjustDownHiFiVolume":Z
    :goto_17
    if-ne p1, v5, :cond_24

    if-ne p2, v3, :cond_24

    move v1, v5

    .line 32
    .local v1, "adjustUpHiFiVolume":Z
    :goto_1c
    if-nez v0, :cond_20

    if-eqz v1, :cond_b

    :cond_20
    move v4, v5

    goto :goto_b

    .end local v0    # "adjustDownHiFiVolume":Z
    .end local v1    # "adjustUpHiFiVolume":Z
    :cond_22
    move v0, v4

    .line 30
    goto :goto_17

    .restart local v0    # "adjustDownHiFiVolume":Z
    :cond_24
    move v1, v4

    .line 31
    goto :goto_1c
.end method
