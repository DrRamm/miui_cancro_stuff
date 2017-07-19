.class public Lcom/android/camera/camera_adapter/VideoQcom;
.super Lcom/android/camera/module/VideoModule;
.source "VideoQcom.java"


# static fields
.field private static final VIDEO_HIGH_FRAME_RATE:Ljava/lang/String;

.field private static sProxy:Lcom/android/camera/hardware/QcomCameraProxy;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .prologue
    const/4 v8, 0x0

    const/4 v4, 0x5

    const/4 v3, 0x4

    const/high16 v7, -0x80000000

    .line 18
    sget-boolean v2, Lcom/android/camera/Device;->IS_MI2:Z

    if-eqz v2, :cond_4e

    const-string v2, "90"

    :goto_b
    sput-object v2, Lcom/android/camera/camera_adapter/VideoQcom;->VIDEO_HIGH_FRAME_RATE:Ljava/lang/String;

    .line 19
    invoke-static {}, Lcom/android/camera/hardware/CameraHardwareProxy;->getDeviceProxy()Lcom/android/camera/hardware/CameraHardwareProxy;

    move-result-object v2

    check-cast v2, Lcom/android/camera/hardware/QcomCameraProxy;

    sput-object v2, Lcom/android/camera/camera_adapter/VideoQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    .line 23
    invoke-static {}, Lcom/android/camera/Device;->isSupportedHFR()Z

    move-result v2

    if-eqz v2, :cond_4d

    .line 24
    const-string v2, "android.media.CamcorderProfile"

    const-string v5, "QUALITY_HIGH_SPEED_480P"

    const-string v6, "I"

    invoke-static {v2, v8, v5, v6}, Lcom/android/camera/Util;->getIntField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 25
    .local v0, "highSpeed480":I
    sget-object v2, Lcom/android/camera/camera_adapter/VideoQcom;->VIDEO_QUALITY_TO_HIGHSPEED:Ljava/util/HashMap;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    if-eq v0, v7, :cond_51

    .end local v0    # "highSpeed480":I
    :goto_2d
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v5, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    const-string v2, "android.media.CamcorderProfile"

    const-string v3, "QUALITY_HIGH_SPEED_720P"

    const-string v5, "I"

    invoke-static {v2, v8, v3, v5}, Lcom/android/camera/Util;->getIntField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 29
    .local v1, "highSpeed720":I
    sget-object v2, Lcom/android/camera/camera_adapter/VideoQcom;->VIDEO_QUALITY_TO_HIGHSPEED:Ljava/util/HashMap;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    if-eq v1, v7, :cond_53

    .end local v1    # "highSpeed720":I
    :goto_46
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    :cond_4d
    return-void

    .line 18
    :cond_4e
    const-string v2, "120"

    goto :goto_b

    .restart local v0    # "highSpeed480":I
    :cond_51
    move v0, v3

    .line 25
    goto :goto_2d

    .end local v0    # "highSpeed480":I
    .restart local v1    # "highSpeed720":I
    :cond_53
    move v1, v4

    .line 29
    goto :goto_46
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;-><init>()V

    return-void
.end method


# virtual methods
.method protected configMediaRecorder(Landroid/media/MediaRecorder;)V
    .registers 10
    .param p1, "mediaRecorder"    # Landroid/media/MediaRecorder;

    .prologue
    .line 80
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x17

    if-lt v5, v6, :cond_8b

    const-string v5, "slow"

    iget-object v6, p0, Lcom/android/camera/camera_adapter/VideoQcom;->mHfr:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8b

    .line 81
    const/4 v1, 0x0

    .line 82
    .local v1, "captureRate":I
    const/4 v2, 0x0

    .line 84
    .local v2, "hfr":Ljava/lang/String;
    :try_start_12
    sget-object v5, Lcom/android/camera/camera_adapter/VideoQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    iget-object v6, p0, Lcom/android/camera/camera_adapter/VideoQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v5, v6}, Lcom/android/camera/hardware/QcomCameraProxy;->getVideoHighFrameRate(Landroid/hardware/Camera$Parameters;)Ljava/lang/String;

    move-result-object v2

    .line 85
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1d
    .catch Ljava/lang/NumberFormatException; {:try_start_12 .. :try_end_1d} :catch_8c

    move-result v1

    .line 90
    :goto_1e
    if-lez v1, :cond_3c

    .line 91
    const-string v5, "VideoQcom"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Setting capture-rate = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    int-to-double v6, v1

    invoke-virtual {p1, v6, v7}, Landroid/media/MediaRecorder;->setCaptureRate(D)V

    .line 96
    :cond_3c
    const/16 v4, 0x1e

    .line 97
    .local v4, "targetFrameRate":I
    const-string v5, "VideoQcom"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Setting target fps = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    invoke-virtual {p1, v4}, Landroid/media/MediaRecorder;->setVideoFrameRate(I)V

    .line 100
    iget-object v5, p0, Lcom/android/camera/camera_adapter/VideoQcom;->mProfile:Landroid/media/CamcorderProfile;

    iget v0, v5, Landroid/media/CamcorderProfile;->videoBitRate:I

    .line 101
    .local v0, "bitrate":I
    sget-boolean v5, Lcom/android/camera/Device;->IS_MI4:Z

    if-nez v5, :cond_70

    sget-boolean v5, Lcom/android/camera/Device;->IS_MI5:Z

    if-nez v5, :cond_70

    .line 106
    iget-object v5, p0, Lcom/android/camera/camera_adapter/VideoQcom;->mProfile:Landroid/media/CamcorderProfile;

    iget v5, v5, Landroid/media/CamcorderProfile;->videoBitRate:I

    mul-int/2addr v5, v4

    iget-object v6, p0, Lcom/android/camera/camera_adapter/VideoQcom;->mProfile:Landroid/media/CamcorderProfile;

    iget v6, v6, Landroid/media/CamcorderProfile;->videoFrameRate:I

    div-int v0, v5, v6

    .line 108
    :cond_70
    const-string v5, "VideoQcom"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Scaled Video bitrate : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    invoke-virtual {p1, v0}, Landroid/media/MediaRecorder;->setVideoEncodingBitRate(I)V

    .line 111
    .end local v0    # "bitrate":I
    .end local v1    # "captureRate":I
    .end local v2    # "hfr":Ljava/lang/String;
    .end local v4    # "targetFrameRate":I
    :cond_8b
    return-void

    .line 86
    .restart local v1    # "captureRate":I
    .restart local v2    # "hfr":Ljava/lang/String;
    :catch_8c
    move-exception v3

    .line 87
    .local v3, "nfe":Ljava/lang/NumberFormatException;
    const-string v5, "VideoQcom"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Invalid hfr("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1e
.end method

.method protected isShowHFRDuration()Z
    .registers 3

    .prologue
    .line 116
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-ge v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method protected updateVideoParametersPreference()V
    .registers 7

    .prologue
    const/4 v5, 0x0

    .line 37
    invoke-super {p0}, Lcom/android/camera/module/VideoModule;->updateVideoParametersPreference()V

    .line 38
    iget-object v2, p0, Lcom/android/camera/camera_adapter/VideoQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getMaxPreviewFpsRange(Landroid/hardware/Camera$Parameters;)[I

    move-result-object v0

    .line 39
    .local v0, "fpsRange":[I
    sget-boolean v2, Lcom/android/camera/Device;->IS_MI4:Z

    if-nez v2, :cond_12

    sget-boolean v2, Lcom/android/camera/Device;->IS_MI5:Z

    if-eqz v2, :cond_a7

    :cond_12
    array-length v2, v0

    if-lez v2, :cond_a7

    .line 40
    iget-object v2, p0, Lcom/android/camera/camera_adapter/VideoQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    aget v3, v0, v5

    const/4 v4, 0x1

    aget v4, v0, v4

    invoke-virtual {v2, v3, v4}, Landroid/hardware/Camera$Parameters;->setPreviewFpsRange(II)V

    .line 47
    :goto_1f
    invoke-static {}, Lcom/android/camera/Device;->isSupportedAoHDR()Z

    move-result v2

    if-eqz v2, :cond_36

    .line 48
    sget-object v3, Lcom/android/camera/camera_adapter/VideoQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    iget-object v4, p0, Lcom/android/camera/camera_adapter/VideoQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    iget-object v2, p0, Lcom/android/camera/camera_adapter/VideoQcom;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v2}, Lcom/android/camera/MutexModeManager;->isAoHdr()Z

    move-result v2

    if-eqz v2, :cond_b2

    const-string v2, "on"

    :goto_33
    invoke-virtual {v3, v4, v2}, Lcom/android/camera/hardware/QcomCameraProxy;->setVideoHDR(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    .line 53
    :cond_36
    invoke-static {}, Lcom/android/camera/Device;->isSupportedVideoQuality4kUHD()Z

    move-result v2

    if-eqz v2, :cond_4d

    .line 55
    iget-object v3, p0, Lcom/android/camera/camera_adapter/VideoQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    const-string v4, "preview-format"

    iget v2, p0, Lcom/android/camera/camera_adapter/VideoQcom;->mQuality:I

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->is4KHigherVideoQuality(I)Z

    move-result v2

    if-eqz v2, :cond_b6

    const-string v2, "nv12-venus"

    :goto_4a
    invoke-virtual {v3, v4, v2}, Landroid/hardware/Camera$Parameters;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    :cond_4d
    invoke-static {}, Lcom/android/camera/Device;->isSupportedHFR()Z

    move-result v2

    if-eqz v2, :cond_8c

    .line 62
    const-string v2, "slow"

    iget-object v3, p0, Lcom/android/camera/camera_adapter/VideoQcom;->mHfr:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_b9

    const-string v1, "off"

    .line 63
    .local v1, "highFrameRate":Ljava/lang/String;
    :goto_5f
    sget-object v2, Lcom/android/camera/camera_adapter/VideoQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    iget-object v3, p0, Lcom/android/camera/camera_adapter/VideoQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v2, v3}, Lcom/android/camera/hardware/QcomCameraProxy;->getSupportedVideoHighFrameRateModes(Landroid/hardware/Camera$Parameters;)Ljava/util/List;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/camera_adapter/VideoQcom;->isSupported(Ljava/lang/String;Ljava/util/List;)Z

    move-result v2

    if-eqz v2, :cond_8c

    .line 65
    const-string v2, "VideoQcom"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "HighFrameRate value ="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    sget-object v2, Lcom/android/camera/camera_adapter/VideoQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    iget-object v3, p0, Lcom/android/camera/camera_adapter/VideoQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v2, v3, v1}, Lcom/android/camera/hardware/QcomCameraProxy;->setVideoHighFrameRate(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    .line 71
    .end local v1    # "highFrameRate":Ljava/lang/String;
    :cond_8c
    sget-object v2, Lcom/android/camera/camera_adapter/VideoQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    iget-object v3, p0, Lcom/android/camera/camera_adapter/VideoQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v2, v3}, Lcom/android/camera/hardware/QcomCameraProxy;->getSupportedDenoiseModes(Landroid/hardware/Camera$Parameters;)Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_9f

    .line 72
    sget-object v2, Lcom/android/camera/camera_adapter/VideoQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    iget-object v3, p0, Lcom/android/camera/camera_adapter/VideoQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    const-string v4, "denoise-on"

    invoke-virtual {v2, v3, v4}, Lcom/android/camera/hardware/QcomCameraProxy;->setDenoise(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    .line 75
    :cond_9f
    sget-object v2, Lcom/android/camera/camera_adapter/VideoQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    iget-object v3, p0, Lcom/android/camera/camera_adapter/VideoQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v2, v3, v5}, Lcom/android/camera/hardware/QcomCameraProxy;->setFaceWatermark(Landroid/hardware/Camera$Parameters;Z)V

    .line 76
    return-void

    .line 44
    :cond_a7
    iget-object v2, p0, Lcom/android/camera/camera_adapter/VideoQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    iget-object v3, p0, Lcom/android/camera/camera_adapter/VideoQcom;->mProfile:Landroid/media/CamcorderProfile;

    iget v3, v3, Landroid/media/CamcorderProfile;->videoFrameRate:I

    invoke-virtual {v2, v3}, Landroid/hardware/Camera$Parameters;->setPreviewFrameRate(I)V

    goto/16 :goto_1f

    .line 48
    :cond_b2
    const-string v2, "off"

    goto/16 :goto_33

    .line 55
    :cond_b6
    const-string v2, "yuv420sp"

    goto :goto_4a

    .line 62
    :cond_b9
    sget-object v1, Lcom/android/camera/camera_adapter/VideoQcom;->VIDEO_HIGH_FRAME_RATE:Ljava/lang/String;

    goto :goto_5f
.end method
