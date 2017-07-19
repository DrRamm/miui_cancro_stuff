.class public Lcom/android/camera/camera_adapter/CameraQcom;
.super Lcom/android/camera/module/CameraModule;
.source "CameraQcom.java"


# static fields
.field private static sProxy:Lcom/android/camera/hardware/QcomCameraProxy;


# instance fields
.field private mIsLongShotMode:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    invoke-static {}, Lcom/android/camera/hardware/CameraHardwareProxy;->getDeviceProxy()Lcom/android/camera/hardware/CameraHardwareProxy;

    move-result-object v0

    check-cast v0, Lcom/android/camera/hardware/QcomCameraProxy;

    sput-object v0, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 18
    invoke-direct {p0}, Lcom/android/camera/module/CameraModule;-><init>()V

    .line 20
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mIsLongShotMode:Z

    return-void
.end method

.method private couldEnableChromaFlash()Z
    .locals 3

    .prologue
    .line 242
    iget-boolean v0, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mMultiSnapStatus:Z

    if-nez v0, :cond_0

    const-string v0, "af-bracket-on"

    sget-object v1, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    iget-object v2, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v1, v2}, Lcom/android/camera/hardware/QcomCameraProxy;->getUbiFocus(Landroid/hardware/Camera$Parameters;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "pref_qc_camera_iso_key"

    const v1, 0x7f0e00c1

    invoke-virtual {p0, v1}, Lcom/android/camera/camera_adapter/CameraQcom;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/camera_adapter/CameraQcom;->isDefaultPreference(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "pref_qc_camera_exposuretime_key"

    const v1, 0x7f0e0143

    invoke-virtual {p0, v1}, Lcom/android/camera/camera_adapter/CameraQcom;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/camera_adapter/CameraQcom;->isDefaultPreference(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getZSL()Ljava/lang/String;
    .locals 2

    .prologue
    .line 344
    iget-boolean v0, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mMultiSnapStatus:Z

    if-eqz v0, :cond_0

    .line 345
    const-string v0, "on"

    .line 362
    :goto_0
    return-object v0

    .line 347
    :cond_0
    iget-object v0, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->isRAW()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 348
    const-string v0, "off"

    goto :goto_0

    .line 350
    :cond_1
    sget-boolean v0, Lcom/android/camera/Device;->IS_XIAOMI:Z

    if-eqz v0, :cond_2

    sget-boolean v0, Lcom/android/camera/Device;->IS_MI2A:Z

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/android/camera/camera_adapter/CameraQcom;->isDefaultManualExposure()Z

    move-result v0

    if-nez v0, :cond_2

    .line 351
    const-string v0, "off"

    goto :goto_0

    .line 356
    :cond_2
    invoke-static {}, Lcom/android/camera/Device;->isUsedMorphoLib()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->isNormal()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->isSceneHdr()Z

    move-result v0

    if-eqz v0, :cond_4

    sget-object v0, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    iget-object v1, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v0, v1}, Lcom/android/camera/hardware/QcomCameraProxy;->isZSLHDRSupported(Landroid/hardware/Camera$Parameters;)Z

    move-result v0

    if-eqz v0, :cond_4

    :cond_3
    sget-boolean v0, Lcom/android/camera/Device;->IS_HM3LTE:Z

    if-eqz v0, :cond_5

    invoke-virtual {p0}, Lcom/android/camera/camera_adapter/CameraQcom;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 360
    :cond_4
    const-string v0, "off"

    goto :goto_0

    .line 362
    :cond_5
    const-string v0, "on"

    goto :goto_0
.end method

.method private qcomUpdateCameraParametersPreference()V
    .locals 22

    .prologue
    .line 25
    invoke-static {}, Lcom/android/camera/Device;->isSupportedManualFunction()Z

    move-result v18

    if-eqz v18, :cond_0

    .line 26
    const-string v18, "pref_qc_camera_exposuretime_key"

    const v19, 0x7f0e0143

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/android/camera/camera_adapter/CameraQcom;->getString(I)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/camera_adapter/CameraQcom;->getManualValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 29
    .local v9, "exposureTime":Ljava/lang/String;
    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v18

    sget-object v19, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Lcom/android/camera/hardware/QcomCameraProxy;->getMaxExposureTimeValue(Landroid/hardware/Camera$Parameters;)I

    move-result v19

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->min(II)I

    move-result v8

    .line 30
    .local v8, "exposure":I
    if-ltz v8, :cond_0

    .line 31
    sget-object v18, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v8}, Lcom/android/camera/hardware/QcomCameraProxy;->setExposureTime(Landroid/hardware/Camera$Parameters;I)V

    .line 32
    const-string v18, "Camera"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "ExposureTime value="

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    sget-object v20, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lcom/android/camera/hardware/QcomCameraProxy;->getExposureTime(Landroid/hardware/Camera$Parameters;)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .end local v8    # "exposure":I
    .end local v9    # "exposureTime":Ljava/lang/String;
    :cond_0
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lcom/android/camera/effect/EffectController;->hasEffect()Z

    move-result v18

    if-eqz v18, :cond_1

    invoke-static {}, Lcom/android/camera/Device;->isEffectWatermarkFilted()Z

    move-result v18

    if-nez v18, :cond_14

    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result v18

    if-nez v18, :cond_14

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mPreferences:Lcom/android/camera/preferences/CameraSettingPreferences;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lcom/android/camera/CameraSettings;->isWaterMarkOpen(Landroid/content/SharedPreferences;)Z

    move-result v18

    if-eqz v18, :cond_14

    .line 39
    sget-object v18, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v19, v0

    const-string v20, "on"

    invoke-virtual/range {v18 .. v20}, Lcom/android/camera/hardware/QcomCameraProxy;->setTimeWatermark(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    .line 45
    :goto_0
    invoke-static {}, Lcom/android/camera/Device;->isSupportedFaceInfoWaterMark()Z

    move-result v18

    if-eqz v18, :cond_2

    .line 46
    sget-object v19, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result v18

    if-nez v18, :cond_15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mPreferences:Lcom/android/camera/preferences/CameraSettingPreferences;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lcom/android/camera/CameraSettings;->isFaceWaterMarkOpen(Landroid/content/SharedPreferences;)Z

    move-result v18

    if-eqz v18, :cond_15

    const/16 v18, 0x1

    :goto_1
    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/hardware/QcomCameraProxy;->setFaceWatermark(Landroid/hardware/Camera$Parameters;Z)V

    .line 51
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/camera_adapter/CameraQcom;->setBeautyParams()V

    .line 54
    invoke-static {}, Lcom/android/camera/Device;->isSupportedIntelligentBeautify()Z

    move-result v18

    if-eqz v18, :cond_3

    .line 55
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mPreferences:Lcom/android/camera/preferences/CameraSettingPreferences;

    move-object/from16 v18, v0

    const-string v19, "pref_camera_show_gender_age_key"

    const v20, 0x7f0e015d

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/android/camera/camera_adapter/CameraQcom;->getString(I)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v18 .. v20}, Lcom/android/camera/preferences/CameraSettingPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 57
    .local v15, "showGenderAndAge":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/camera_adapter/CameraQcom;->getUIController()Lcom/android/camera/ui/UIController;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lcom/android/camera/ui/UIController;->getFaceView()Lcom/android/camera/ui/FaceView;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v15}, Lcom/android/camera/ui/FaceView;->setShowGenderAndAge(Ljava/lang/String;)V

    .line 58
    const-string v18, "Camera"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "SetShowGenderAndAge ="

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    .end local v15    # "showGenderAndAge":Ljava/lang/String;
    :cond_3
    invoke-static {}, Lcom/android/camera/Device;->isSupportedObjectTrack()Z

    move-result v18

    if-nez v18, :cond_4

    invoke-static {}, Lcom/android/camera/Device;->isSupportedIntelligentBeautify()Z

    move-result v18

    if-eqz v18, :cond_5

    .line 63
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v19, v0

    const-string v20, "xiaomi-preview-rotation"

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mOrientation:I

    move/from16 v18, v0

    const/16 v21, -0x1

    move/from16 v0, v18

    move/from16 v1, v21

    if-ne v0, v1, :cond_16

    const/16 v18, 0x0

    :goto_2
    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Landroid/hardware/Camera$Parameters;->set(Ljava/lang/String;I)V

    .line 68
    :cond_5
    sget-object v18, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lcom/android/camera/hardware/QcomCameraProxy;->getSupportedDenoiseModes(Landroid/hardware/Camera$Parameters;)Ljava/util/List;

    move-result-object v18

    if-eqz v18, :cond_6

    .line 69
    sget-boolean v18, Lcom/android/camera/Device;->IS_HONGMI:Z

    if-eqz v18, :cond_17

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mMultiSnapStatus:Z

    move/from16 v18, v0

    if-eqz v18, :cond_17

    sget-boolean v18, Lcom/android/camera/Device;->IS_B5:Z

    if-nez v18, :cond_17

    const-string v3, "denoise-off"

    .line 72
    .local v3, "Denoise":Ljava/lang/String;
    :goto_3
    const-string v18, "Camera"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Denoise value = "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    sget-object v18, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v3}, Lcom/android/camera/hardware/QcomCameraProxy;->setDenoise(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    .line 76
    .end local v3    # "Denoise":Ljava/lang/String;
    :cond_6
    const-string v18, "pref_qc_camera_iso_key"

    const v19, 0x7f0e00c1

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/android/camera/camera_adapter/CameraQcom;->getString(I)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/camera_adapter/CameraQcom;->getManualValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 78
    .local v10, "iso":Ljava/lang/String;
    sget-object v18, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lcom/android/camera/hardware/QcomCameraProxy;->getSupportedIsoValues(Landroid/hardware/Camera$Parameters;)Ljava/util/List;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-static {v10, v0}, Lcom/android/camera/camera_adapter/CameraQcom;->isSupported(Ljava/lang/String;Ljava/util/List;)Z

    move-result v18

    if-eqz v18, :cond_7

    .line 79
    const-string v18, "Camera"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "ISO value = "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    sget-object v18, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v10}, Lcom/android/camera/hardware/QcomCameraProxy;->setISOValue(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    .line 84
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mPreferences:Lcom/android/camera/preferences/CameraSettingPreferences;

    move-object/from16 v18, v0

    const-string v19, "pref_qc_camera_saturation_key"

    const v20, 0x7f0e00ad

    invoke-static/range {v20 .. v20}, Lcom/android/camera/CameraSettings;->getDefaultPreferenceId(I)I

    move-result v20

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/android/camera/camera_adapter/CameraQcom;->getString(I)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v18 .. v20}, Lcom/android/camera/preferences/CameraSettingPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 88
    .local v12, "saturationStr":Ljava/lang/String;
    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v18

    sget-object v19, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Lcom/android/camera/hardware/QcomCameraProxy;->getMaxSaturation(Landroid/hardware/Camera$Parameters;)I

    move-result v19

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->min(II)I

    move-result v11

    .line 89
    .local v11, "saturation":I
    if-ltz v11, :cond_8

    .line 90
    const-string v18, "Camera"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Saturation value = "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    sget-object v18, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v11}, Lcom/android/camera/hardware/QcomCameraProxy;->setSaturation(Landroid/hardware/Camera$Parameters;I)V

    .line 95
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mPreferences:Lcom/android/camera/preferences/CameraSettingPreferences;

    move-object/from16 v18, v0

    const-string v19, "pref_qc_camera_contrast_key"

    const v20, 0x7f0e00ab

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/android/camera/camera_adapter/CameraQcom;->getString(I)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v18 .. v20}, Lcom/android/camera/preferences/CameraSettingPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 98
    .local v7, "contrastStr":Ljava/lang/String;
    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v18

    sget-object v19, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Lcom/android/camera/hardware/QcomCameraProxy;->getMaxContrast(Landroid/hardware/Camera$Parameters;)I

    move-result v19

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 99
    .local v6, "contrast":I
    if-ltz v6, :cond_9

    .line 100
    const-string v18, "Camera"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Contrast value = "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    sget-object v18, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v6}, Lcom/android/camera/hardware/QcomCameraProxy;->setContrast(Landroid/hardware/Camera$Parameters;I)V

    .line 105
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mPreferences:Lcom/android/camera/preferences/CameraSettingPreferences;

    move-object/from16 v18, v0

    const-string v19, "pref_qc_camera_sharpness_key"

    const v20, 0x7f0e00af

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/android/camera/camera_adapter/CameraQcom;->getString(I)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v18 .. v20}, Lcom/android/camera/preferences/CameraSettingPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 108
    .local v14, "sharpnessStr":Ljava/lang/String;
    invoke-static {v14}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v18

    sget-object v19, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Lcom/android/camera/hardware/QcomCameraProxy;->getMaxSharpness(Landroid/hardware/Camera$Parameters;)I

    move-result v19

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->min(II)I

    move-result v13

    .line 109
    .local v13, "sharpness":I
    if-ltz v13, :cond_a

    .line 110
    const-string v18, "Camera"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Sharpness value = "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    sget-object v18, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v13}, Lcom/android/camera/hardware/QcomCameraProxy;->setSharpness(Landroid/hardware/Camera$Parameters;I)V

    .line 114
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mPreferences:Lcom/android/camera/preferences/CameraSettingPreferences;

    move-object/from16 v18, v0

    const-string v19, "pref_camera_touchafaec_key"

    const v20, 0x7f0e00a0

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/android/camera/camera_adapter/CameraQcom;->getString(I)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v18 .. v20}, Lcom/android/camera/preferences/CameraSettingPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 117
    .local v16, "touchAfAec":Ljava/lang/String;
    sget-object v18, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lcom/android/camera/hardware/QcomCameraProxy;->getSupportedTouchAfAec(Landroid/hardware/Camera$Parameters;)Ljava/util/List;

    move-result-object v18

    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/android/camera/camera_adapter/CameraQcom;->isSupported(Ljava/lang/String;Ljava/util/List;)Z

    move-result v18

    if-eqz v18, :cond_b

    .line 118
    const-string v18, "Camera"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "TouchAfAec value = "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    sget-object v18, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, v16

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/hardware/QcomCameraProxy;->setTouchAfAec(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    .line 123
    :cond_b
    invoke-static {}, Lcom/android/camera/Device;->isSupportedMagicMirror()Z

    move-result v18

    if-eqz v18, :cond_c

    .line 124
    sget-object v18, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v19, v0

    const-string v20, "pref_camera_magic_mirror_key"

    invoke-static/range {v20 .. v20}, Lcom/android/camera/CameraSettings;->isSwitchOn(Ljava/lang/String;)Z

    move-result v20

    invoke-virtual/range {v18 .. v20}, Lcom/android/camera/hardware/QcomCameraProxy;->setBeautyRank(Landroid/hardware/Camera$Parameters;Z)V

    .line 128
    :cond_c
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/camera_adapter/CameraQcom;->setPictureFlipIfNeed()V

    .line 130
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mFaceDetectionEnabled:Z

    move/from16 v18, v0

    if-eqz v18, :cond_18

    .line 131
    sget-object v18, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v19, v0

    const-string v20, "on"

    invoke-virtual/range {v18 .. v20}, Lcom/android/camera/hardware/QcomCameraProxy;->setFaceDetectionMode(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    .line 139
    :goto_4
    invoke-static {}, Lcom/android/camera/Device;->isUsedMorphoLib()Z

    move-result v18

    if-eqz v18, :cond_d

    .line 140
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v18, v0

    const-string v19, "ae-bracket-hdr"

    const-string v20, "Off"

    invoke-virtual/range {v18 .. v20}, Landroid/hardware/Camera$Parameters;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    :cond_d
    sget-object v18, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-virtual/range {v18 .. v20}, Lcom/android/camera/hardware/QcomCameraProxy;->setHandNight(Landroid/hardware/Camera$Parameters;Z)V

    .line 143
    sget-object v18, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-virtual/range {v18 .. v20}, Lcom/android/camera/hardware/QcomCameraProxy;->setMorphoHDR(Landroid/hardware/Camera$Parameters;Z)V

    .line 145
    sget-object v18, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v19, v0

    const-string v20, "af-bracket-off"

    invoke-virtual/range {v18 .. v20}, Lcom/android/camera/hardware/QcomCameraProxy;->setUbiFocus(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    .line 146
    sget-object v18, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v19, v0

    const-string v20, "off"

    invoke-virtual/range {v18 .. v20}, Lcom/android/camera/hardware/QcomCameraProxy;->setAoHDR(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    .line 147
    sget-object v18, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v19, v0

    const-string v20, "false"

    invoke-virtual/range {v18 .. v20}, Lcom/android/camera/hardware/QcomCameraProxy;->setHDR(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    .line 148
    sget-object v18, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v19, v0

    const-string v20, "false"

    invoke-virtual/range {v18 .. v20}, Lcom/android/camera/hardware/QcomCameraProxy;->setNightShot(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    .line 149
    sget-object v18, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v19, v0

    const-string v20, "false"

    invoke-virtual/range {v18 .. v20}, Lcom/android/camera/hardware/QcomCameraProxy;->setNightAntiMotion(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    .line 152
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/android/camera/MutexModeManager;->isNormal()Z

    move-result v18

    if-nez v18, :cond_e

    .line 153
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/android/camera/MutexModeManager;->isHandNight()Z

    move-result v18

    if-eqz v18, :cond_1a

    .line 154
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/camera_adapter/CameraQcom;->isSceneMotion()Z

    move-result v18

    if-eqz v18, :cond_19

    .line 155
    sget-object v18, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v19, v0

    const-string v20, "true"

    invoke-virtual/range {v18 .. v20}, Lcom/android/camera/hardware/QcomCameraProxy;->setNightAntiMotion(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    .line 159
    :goto_5
    const-string v18, "Camera"

    const-string v19, "Hand Nigh = true"

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    :cond_e
    :goto_6
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/camera_adapter/CameraQcom;->getZSL()Ljava/lang/String;

    move-result-object v17

    .line 175
    .local v17, "zsl":Ljava/lang/String;
    const-string v18, "Camera"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "ZSL value = "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 176
    const-string v18, "on"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_1f

    .line 177
    invoke-static {}, Lcom/android/camera/Device;->shouldRestartPreviewAfterZslSwitch()Z

    move-result v18

    if-eqz v18, :cond_1e

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mIsZSLMode:Z

    move/from16 v18, v0

    if-nez v18, :cond_1e

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mCameraState:I

    move/from16 v18, v0

    if-eqz v18, :cond_1e

    const/16 v18, 0x1

    :goto_7
    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/camera/camera_adapter/CameraQcom;->mRestartPreview:Z

    .line 179
    const/16 v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/camera/camera_adapter/CameraQcom;->mIsZSLMode:Z

    .line 180
    sget-object v18, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v19, v0

    const-string v20, "on"

    invoke-virtual/range {v18 .. v20}, Lcom/android/camera/hardware/QcomCameraProxy;->setZSLMode(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    .line 181
    sget-object v18, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v19, v0

    const/16 v20, 0x1

    invoke-virtual/range {v18 .. v20}, Lcom/android/camera/hardware/QcomCameraProxy;->setCameraMode(Landroid/hardware/Camera$Parameters;I)V

    .line 190
    :cond_f
    :goto_8
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mIsZSLMode:Z

    move/from16 v18, v0

    if-eqz v18, :cond_22

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mMultiSnapStatus:Z

    move/from16 v18, v0

    if-eqz v18, :cond_22

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mIsLongShotMode:Z

    move/from16 v18, v0

    if-nez v18, :cond_22

    .line 191
    const/16 v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/camera/camera_adapter/CameraQcom;->mIsLongShotMode:Z

    .line 192
    sget-boolean v18, Lcom/android/camera/Device;->IS_MI2:Z

    if-nez v18, :cond_10

    sget-boolean v18, Lcom/android/camera/Device;->IS_MI2A:Z

    if-eqz v18, :cond_21

    .line 193
    :cond_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v18, v0

    const-string v19, "num-snaps-per-shutter"

    sget v20, Lcom/android/camera/camera_adapter/CameraQcom;->BURST_SHOOTING_COUNT:I

    invoke-virtual/range {v18 .. v20}, Landroid/hardware/Camera$Parameters;->set(Ljava/lang/String;I)V

    .line 198
    :goto_9
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/camera_adapter/CameraQcom;->setTimeWatermarkIfNeed()V

    .line 207
    :cond_11
    :goto_a
    const-string v18, "Camera"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Long Shot mode value = "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/camera_adapter/CameraQcom;->isLongShotMode()Z

    move-result v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 210
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mIsLongShotMode:Z

    move/from16 v18, v0

    if-eqz v18, :cond_25

    const-string v18, "torch"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/hardware/Camera$Parameters;->getFlashMode()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_25

    const/16 v18, 0x1

    :goto_b
    move-object/from16 v0, v19

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setAutoWhiteBalanceLock(Z)V

    .line 214
    invoke-static {}, Lcom/android/camera/Device;->isSupportedChromaFlash()Z

    move-result v18

    if-eqz v18, :cond_12

    .line 215
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/camera_adapter/CameraQcom;->couldEnableChromaFlash()Z

    move-result v18

    if-eqz v18, :cond_26

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mPreferences:Lcom/android/camera/preferences/CameraSettingPreferences;

    move-object/from16 v18, v0

    const-string v19, "pref_auto_chroma_flash_key"

    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/camera_adapter/CameraQcom;->getResources()Landroid/content/res/Resources;

    move-result-object v20

    const v21, 0x7f0b0003

    invoke-static/range {v21 .. v21}, Lcom/android/camera/CameraSettings;->getDefaultPreferenceId(I)I

    move-result v21

    invoke-virtual/range {v20 .. v21}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v20

    invoke-virtual/range {v18 .. v20}, Lcom/android/camera/preferences/CameraSettingPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v18

    if-eqz v18, :cond_26

    const-string v5, "chroma-flash-on"

    .line 221
    .local v5, "chromaFlash":Ljava/lang/String;
    :goto_c
    sget-object v18, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v5}, Lcom/android/camera/hardware/QcomCameraProxy;->setChromaFlash(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    .line 223
    .end local v5    # "chromaFlash":Ljava/lang/String;
    :cond_12
    const-string v18, "Camera"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Chroma Flash = "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    sget-object v20, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lcom/android/camera/hardware/QcomCameraProxy;->getChromaFlash(Landroid/hardware/Camera$Parameters;)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 225
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/camera_adapter/CameraQcom;->isBackCamera()Z

    move-result v18

    if-eqz v18, :cond_13

    invoke-static {}, Lcom/android/camera/Device;->isSupportedASD()Z

    move-result v18

    if-eqz v18, :cond_13

    .line 226
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/camera_adapter/CameraQcom;->getUIController()Lcom/android/camera/ui/UIController;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lcom/android/camera/ui/UIController;->getSettingPage()Lcom/android/camera/ui/V6SettingPage;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lcom/android/camera/ui/V6SettingPage;->isItemSelected()Z

    move-result v18

    if-nez v18, :cond_27

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mIsLongShotMode:Z

    move/from16 v18, v0

    if-nez v18, :cond_27

    const/4 v4, 0x1

    .line 227
    .local v4, "asdEnable":Z
    :goto_d
    const-string v18, "Camera"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "ASD Enable = "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 228
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v19, v0

    const-string v20, "scene-detect"

    if-eqz v4, :cond_28

    const-string v18, "on"

    :goto_e
    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Landroid/hardware/Camera$Parameters;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 229
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/android/camera/camera_adapter/CameraQcom;->setMetaCallback(Z)V

    .line 231
    .end local v4    # "asdEnable":Z
    :cond_13
    return-void

    .line 41
    .end local v6    # "contrast":I
    .end local v7    # "contrastStr":Ljava/lang/String;
    .end local v10    # "iso":Ljava/lang/String;
    .end local v11    # "saturation":I
    .end local v12    # "saturationStr":Ljava/lang/String;
    .end local v13    # "sharpness":I
    .end local v14    # "sharpnessStr":Ljava/lang/String;
    .end local v16    # "touchAfAec":Ljava/lang/String;
    .end local v17    # "zsl":Ljava/lang/String;
    :cond_14
    sget-object v18, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v19, v0

    const-string v20, "off"

    invoke-virtual/range {v18 .. v20}, Lcom/android/camera/hardware/QcomCameraProxy;->setTimeWatermark(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 46
    :cond_15
    const/16 v18, 0x0

    goto/16 :goto_1

    .line 63
    :cond_16
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mOrientation:I

    move/from16 v18, v0

    goto/16 :goto_2

    .line 69
    :cond_17
    const-string v3, "denoise-off"

    goto/16 :goto_3

    .line 133
    .restart local v6    # "contrast":I
    .restart local v7    # "contrastStr":Ljava/lang/String;
    .restart local v10    # "iso":Ljava/lang/String;
    .restart local v11    # "saturation":I
    .restart local v12    # "saturationStr":Ljava/lang/String;
    .restart local v13    # "sharpness":I
    .restart local v14    # "sharpnessStr":Ljava/lang/String;
    .restart local v16    # "touchAfAec":Ljava/lang/String;
    :cond_18
    sget-object v18, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v19, v0

    const-string v20, "off"

    invoke-virtual/range {v18 .. v20}, Lcom/android/camera/hardware/QcomCameraProxy;->setFaceDetectionMode(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    goto/16 :goto_4

    .line 157
    :cond_19
    sget-object v18, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v19, v0

    const-string v20, "true"

    invoke-virtual/range {v18 .. v20}, Lcom/android/camera/hardware/QcomCameraProxy;->setNightShot(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    goto/16 :goto_5

    .line 160
    :cond_1a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/android/camera/MutexModeManager;->isRAW()Z

    move-result v18

    if-eqz v18, :cond_1b

    .line 161
    const-string v18, "Camera"

    const-string v19, "Raw Data = true"

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_6

    .line 162
    :cond_1b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/android/camera/MutexModeManager;->isAoHdr()Z

    move-result v18

    if-eqz v18, :cond_1c

    .line 163
    sget-object v18, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v19, v0

    const-string v20, "on"

    invoke-virtual/range {v18 .. v20}, Lcom/android/camera/hardware/QcomCameraProxy;->setAoHDR(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    .line 164
    const-string v18, "Camera"

    const-string v19, "AoHDR = true"

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_6

    .line 165
    :cond_1c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/android/camera/MutexModeManager;->isMorphoHdr()Z

    move-result v18

    if-eqz v18, :cond_1d

    .line 166
    sget-object v18, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v19, v0

    const-string v20, "true"

    invoke-virtual/range {v18 .. v20}, Lcom/android/camera/hardware/QcomCameraProxy;->setHDR(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    .line 167
    const-string v18, "Camera"

    const-string v19, "Morpho HDR = true"

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_6

    .line 168
    :cond_1d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result v18

    if-eqz v18, :cond_e

    .line 169
    sget-object v18, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v19, v0

    const-string v20, "af-bracket-on"

    invoke-virtual/range {v18 .. v20}, Lcom/android/camera/hardware/QcomCameraProxy;->setUbiFocus(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    .line 170
    const-string v18, "Camera"

    const-string v19, "Ubi Focus = true"

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_6

    .line 177
    .restart local v17    # "zsl":Ljava/lang/String;
    :cond_1e
    const/16 v18, 0x0

    goto/16 :goto_7

    .line 182
    :cond_1f
    const-string v18, "off"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_f

    .line 183
    invoke-static {}, Lcom/android/camera/Device;->shouldRestartPreviewAfterZslSwitch()Z

    move-result v18

    if-eqz v18, :cond_20

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mIsZSLMode:Z

    move/from16 v18, v0

    if-eqz v18, :cond_20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mCameraState:I

    move/from16 v18, v0

    if-eqz v18, :cond_20

    const/16 v18, 0x1

    :goto_f
    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/camera/camera_adapter/CameraQcom;->mRestartPreview:Z

    .line 185
    const/16 v18, 0x0

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/camera/camera_adapter/CameraQcom;->mIsZSLMode:Z

    .line 186
    sget-object v18, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v19, v0

    const-string v20, "off"

    invoke-virtual/range {v18 .. v20}, Lcom/android/camera/hardware/QcomCameraProxy;->setZSLMode(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    .line 187
    sget-object v18, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-virtual/range {v18 .. v20}, Lcom/android/camera/hardware/QcomCameraProxy;->setCameraMode(Landroid/hardware/Camera$Parameters;I)V

    goto/16 :goto_8

    .line 183
    :cond_20
    const/16 v18, 0x0

    goto :goto_f

    .line 195
    :cond_21
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mCameraDevice:Lcom/android/camera/CameraManager$CameraProxy;

    move-object/from16 v18, v0

    const/16 v19, 0x1

    invoke-virtual/range {v18 .. v19}, Lcom/android/camera/CameraManager$CameraProxy;->setLongshotMode(Z)V

    goto/16 :goto_9

    .line 199
    :cond_22
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mIsLongShotMode:Z

    move/from16 v18, v0

    if-eqz v18, :cond_11

    .line 200
    const/16 v18, 0x0

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/camera/camera_adapter/CameraQcom;->mIsLongShotMode:Z

    .line 201
    sget-boolean v18, Lcom/android/camera/Device;->IS_MI2:Z

    if-nez v18, :cond_23

    sget-boolean v18, Lcom/android/camera/Device;->IS_MI2A:Z

    if-eqz v18, :cond_24

    .line 202
    :cond_23
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    move-object/from16 v18, v0

    const-string v19, "num-snaps-per-shutter"

    const/16 v20, 0x1

    invoke-virtual/range {v18 .. v20}, Landroid/hardware/Camera$Parameters;->set(Ljava/lang/String;I)V

    goto/16 :goto_a

    .line 204
    :cond_24
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/camera_adapter/CameraQcom;->mCameraDevice:Lcom/android/camera/CameraManager$CameraProxy;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-virtual/range {v18 .. v19}, Lcom/android/camera/CameraManager$CameraProxy;->setLongshotMode(Z)V

    goto/16 :goto_a

    .line 210
    :cond_25
    const/16 v18, 0x0

    goto/16 :goto_b

    .line 215
    :cond_26
    const-string v5, "chroma-flash-off"

    goto/16 :goto_c

    .line 226
    :cond_27
    const/4 v4, 0x0

    goto/16 :goto_d

    .line 228
    .restart local v4    # "asdEnable":Z
    :cond_28
    const-string v18, "off"

    goto/16 :goto_e
.end method

.method private setPictureFlipIfNeed()V
    .locals 4

    .prologue
    .line 320
    invoke-virtual {p0}, Lcom/android/camera/camera_adapter/CameraQcom;->isFrontMirror()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 321
    iget v0, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mOrientation:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mOrientation:I

    rem-int/lit16 v0, v0, 0xb4

    if-eqz v0, :cond_0

    .line 323
    sget-object v0, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    iget-object v1, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    const-string v2, "flip-h"

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/hardware/QcomCameraProxy;->setPictureFlip(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    .line 330
    :goto_0
    const-string v0, "Camera"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Picture flip value = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    iget-object v3, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v2, v3}, Lcom/android/camera/hardware/QcomCameraProxy;->getPictureFlip(Landroid/hardware/Camera$Parameters;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 331
    return-void

    .line 325
    :cond_0
    sget-object v0, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    iget-object v1, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    const-string v2, "flip-v"

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/hardware/QcomCameraProxy;->setPictureFlip(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    goto :goto_0

    .line 328
    :cond_1
    sget-object v0, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    iget-object v1, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    const-string v2, "off"

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/hardware/QcomCameraProxy;->setPictureFlip(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method protected cancelContinuousShot()V
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 234
    iget-boolean v0, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mMultiSnapStatus:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mIsLongShotMode:Z

    if-eqz v0, :cond_0

    .line 235
    iput-boolean v1, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mIsLongShotMode:Z

    .line 236
    iget-object v0, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mCameraDevice:Lcom/android/camera/CameraManager$CameraProxy;

    invoke-virtual {v0, v1}, Lcom/android/camera/CameraManager$CameraProxy;->setLongshotMode(Z)V

    .line 237
    const-string v0, "Camera"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Long Shot mode value = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/android/camera/camera_adapter/CameraQcom;->isLongShotMode()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 239
    :cond_0
    return-void
.end method

.method protected getBurstDelayTime()I
    .locals 1

    .prologue
    .line 372
    sget-boolean v0, Lcom/android/camera/Device;->IS_HONGMI:Z

    if-eqz v0, :cond_0

    .line 373
    const/16 v0, 0x12c

    .line 375
    :goto_0
    return v0

    :cond_0
    const/16 v0, 0xc8

    goto :goto_0
.end method

.method protected isLongShotMode()Z
    .locals 1

    .prologue
    .line 302
    iget-boolean v0, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mIsLongShotMode:Z

    return v0
.end method

.method protected isSupportSceneMode()Z
    .locals 1

    .prologue
    .line 275
    sget-boolean v0, Lcom/android/camera/Device;->IS_HONGMI:Z

    return v0
.end method

.method protected isZeroShotMode()Z
    .locals 1

    .prologue
    .line 289
    iget-boolean v0, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mIsZSLMode:Z

    return v0
.end method

.method protected needAutoFocusBeforeCapture()Z
    .locals 2

    .prologue
    .line 313
    iget-object v1, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getFlashMode()Ljava/lang/String;

    move-result-object v0

    .line 314
    .local v0, "flashMode":Ljava/lang/String;
    const-string v1, "on"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "auto"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mCameraDevice:Lcom/android/camera/CameraManager$CameraProxy;

    invoke-virtual {v1}, Lcom/android/camera/CameraManager$CameraProxy;->isNeedFlashOn()Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected needSetupPreview()Z
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 280
    iget-boolean v1, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mIsZSLMode:Z

    if-nez v1, :cond_1

    const-string v1, "persist.camera.feature.restart"

    invoke-static {v1, v0}, Lmiui/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v1, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    iget-object v2, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v1, v2}, Lcom/android/camera/hardware/QcomCameraProxy;->getInternalPreviewSupported(Landroid/hardware/Camera$Parameters;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "jpeg"

    iget-object v2, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    const-string v3, "picture-format"

    invoke-virtual {v2, v3}, Landroid/hardware/Camera$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :cond_1
    return v0
.end method

.method public onResumeAfterSuper()V
    .locals 2

    .prologue
    .line 381
    invoke-super {p0}, Lcom/android/camera/module/CameraModule;->onResumeAfterSuper()V

    .line 382
    iget-object v0, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isEdgePhotoEnable()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/camera/SensorStateManager;->setEdgeTouchEnabled(Z)V

    .line 384
    return-void
.end method

.method public onSettingValueChanged(Ljava/lang/String;)V
    .locals 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 262
    iget-object v0, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mCameraDevice:Lcom/android/camera/CameraManager$CameraProxy;

    if-nez v0, :cond_0

    .line 272
    :goto_0
    return-void

    .line 263
    :cond_0
    const-string v0, "pref_focus_position_key"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 264
    sget-object v0, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    iget-object v1, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-static {}, Lcom/android/camera/CameraSettings;->getFocusPosition()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/hardware/QcomCameraProxy;->setFocusPosition(Landroid/hardware/Camera$Parameters;I)V

    .line 265
    iget-object v0, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mCameraDevice:Lcom/android/camera/CameraManager$CameraProxy;

    iget-object v1, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v0, v1}, Lcom/android/camera/CameraManager$CameraProxy;->setParametersAsync(Landroid/hardware/Camera$Parameters;)V

    goto :goto_0

    .line 266
    :cond_1
    const-string v0, "pref_qc_manual_whitebalance_k_value_key"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 267
    sget-object v0, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    iget-object v1, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-static {}, Lcom/android/camera/CameraSettings;->getKValue()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/hardware/QcomCameraProxy;->setWBManualCCT(Landroid/hardware/Camera$Parameters;I)V

    .line 268
    iget-object v0, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mCameraDevice:Lcom/android/camera/CameraManager$CameraProxy;

    iget-object v1, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v0, v1}, Lcom/android/camera/CameraManager$CameraProxy;->setParametersAsync(Landroid/hardware/Camera$Parameters;)V

    goto :goto_0

    .line 270
    :cond_2
    invoke-super {p0, p1}, Lcom/android/camera/module/CameraModule;->onSettingValueChanged(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected prepareCapture()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 335
    invoke-direct {p0}, Lcom/android/camera/camera_adapter/CameraQcom;->setPictureFlipIfNeed()V

    .line 336
    sget-boolean v0, Lcom/android/camera/Device;->IS_H2XLTE:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->isHdr()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 337
    iget-object v0, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setAutoExposureLock(Z)V

    .line 338
    iget-object v0, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setAutoWhiteBalanceLock(Z)V

    .line 340
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/camera_adapter/CameraQcom;->setTimeWatermarkIfNeed()V

    .line 341
    return-void
.end method

.method protected setAutoExposure(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V
    .locals 2
    .param p1, "parameters"    # Landroid/hardware/Camera$Parameters;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 294
    sget-object v1, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    invoke-virtual {v1, p1}, Lcom/android/camera/hardware/QcomCameraProxy;->getSupportedAutoexposure(Landroid/hardware/Camera$Parameters;)Ljava/util/List;

    move-result-object v0

    .line 295
    .local v0, "aeList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v0, :cond_0

    invoke-interface {v0, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 296
    sget-object v1, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    invoke-virtual {v1, p1, p2}, Lcom/android/camera/hardware/QcomCameraProxy;->setAutoExposure(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    .line 298
    :cond_0
    return-void
.end method

.method protected setBeautyParams()V
    .locals 7

    .prologue
    .line 388
    sget-boolean v3, Lcom/android/camera/Device;->IS_MI2:Z

    if-eqz v3, :cond_1

    sget-boolean v3, Lcom/android/camera/Device;->IS_MI2A:Z

    if-nez v3, :cond_1

    .line 389
    invoke-static {}, Lcom/android/camera/CameraSettings;->getFaceBeautifyValue()Ljava/lang/String;

    move-result-object v0

    .line 390
    .local v0, "beauty":Ljava/lang/String;
    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isFaceBeautyOn(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 392
    :try_start_0
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 393
    .local v1, "beautyInt":I
    const-string v3, "pref_skin_beautify_skin_color_key"

    invoke-static {v3}, Lcom/android/camera/CameraSettings;->getBeautifyDetailValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    shl-int/lit8 v3, v3, 0x1c

    or-int/2addr v1, v3

    .line 395
    const-string v3, "pref_skin_beautify_slim_face_key"

    invoke-static {v3}, Lcom/android/camera/CameraSettings;->getBeautifyDetailValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    shl-int/lit8 v3, v3, 0x18

    or-int/2addr v1, v3

    .line 397
    const-string v3, "pref_skin_beautify_skin_smooth_key"

    invoke-static {v3}, Lcom/android/camera/CameraSettings;->getBeautifyDetailValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    shl-int/lit8 v3, v3, 0x10

    or-int/2addr v1, v3

    .line 399
    const-string v3, "pref_skin_beautify_enlarge_eye_key"

    invoke-static {v3}, Lcom/android/camera/CameraSettings;->getBeautifyDetailValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    shl-int/lit8 v3, v3, 0x14

    or-int/2addr v1, v3

    .line 401
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 406
    .end local v1    # "beautyInt":I
    :cond_0
    :goto_0
    sget-object v3, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    iget-object v4, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v3, v4, v0}, Lcom/android/camera/hardware/QcomCameraProxy;->setStillBeautify(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    .line 407
    const-string v3, "Camera"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "SetStillBeautify ="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/android/camera/camera_adapter/CameraQcom;->sProxy:Lcom/android/camera/hardware/QcomCameraProxy;

    iget-object v6, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v5, v6}, Lcom/android/camera/hardware/QcomCameraProxy;->getStillBeautify(Landroid/hardware/Camera$Parameters;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 411
    .end local v0    # "beauty":Ljava/lang/String;
    :goto_1
    return-void

    .line 402
    .restart local v0    # "beauty":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 403
    .local v2, "e":Ljava/lang/NumberFormatException;
    const-string v3, "Camera"

    const-string v4, "check beautify detail values in strings.xml of aries"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 409
    .end local v0    # "beauty":Ljava/lang/String;
    .end local v2    # "e":Ljava/lang/NumberFormatException;
    :cond_1
    invoke-super {p0}, Lcom/android/camera/module/CameraModule;->setBeautyParams()V

    goto :goto_1
.end method

.method protected updateCameraParametersInitialize()V
    .locals 4

    .prologue
    .line 249
    invoke-super {p0}, Lcom/android/camera/module/CameraModule;->updateCameraParametersInitialize()V

    .line 252
    iget-object v1, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-static {v1}, Lcom/android/camera/CameraSettings;->getPhotoPreviewFpsRange(Landroid/hardware/Camera$Parameters;)[I

    move-result-object v0

    .line 253
    .local v0, "fpsRange":[I
    sget-boolean v1, Lcom/android/camera/Device;->IS_MI4:Z

    if-nez v1, :cond_0

    sget-boolean v1, Lcom/android/camera/Device;->IS_MI5:Z

    if-eqz v1, :cond_1

    :cond_0
    if-eqz v0, :cond_1

    array-length v1, v0

    if-lez v1, :cond_1

    .line 254
    iget-object v1, p0, Lcom/android/camera/camera_adapter/CameraQcom;->mParameters:Landroid/hardware/Camera$Parameters;

    const/4 v2, 0x0

    aget v2, v0, v2

    const/4 v3, 0x1

    aget v3, v0, v3

    invoke-virtual {v1, v2, v3}, Landroid/hardware/Camera$Parameters;->setPreviewFpsRange(II)V

    .line 258
    :cond_1
    return-void
.end method

.method protected updateCameraParametersPreference()V
    .locals 0

    .prologue
    .line 307
    invoke-super {p0}, Lcom/android/camera/module/CameraModule;->updateCameraParametersPreference()V

    .line 308
    invoke-direct {p0}, Lcom/android/camera/camera_adapter/CameraQcom;->qcomUpdateCameraParametersPreference()V

    .line 309
    return-void
.end method