.class public Landroid/media/AudioSystem;
.super Ljava/lang/Object;
.source "AudioSystem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/media/AudioSystem$DynamicPolicyCallback;,
        Landroid/media/AudioSystem$ErrorCallback;
    }
.end annotation


# static fields
.field public static final AUDIO_HW_SYNC_INVALID:I = 0x0

.field public static final AUDIO_SESSION_ALLOCATE:I = 0x0

.field public static final AUDIO_STATUS_ERROR:I = 0x1

.field public static final AUDIO_STATUS_OK:I = 0x0

.field public static final AUDIO_STATUS_SERVER_DIED:I = 0x64

.field public static final BAD_VALUE:I = -0x2

.field public static final DEAD_OBJECT:I = -0x6

.field public static final DEFAULT_MUTE_STREAMS_AFFECTED:I = 0x2e

.field public static DEFAULT_STREAM_VOLUME:[I = null

.field public static final DEVICE_ALL_HDMI_SYSTEM_AUDIO_AND_SPEAKER:I = 0x2c0002

.field public static final DEVICE_BIT_DEFAULT:I = 0x40000000

.field public static final DEVICE_BIT_IN:I = -0x80000000

.field public static final DEVICE_IN_ALL:I = -0x3ef00001

.field public static final DEVICE_IN_ALL_SCO:I = -0x7ffffff8

.field public static final DEVICE_IN_ALL_USB:I = -0x7fffe800

.field public static final DEVICE_IN_AMBIENT:I = -0x7ffffffe

.field public static final DEVICE_IN_AMBIENT_NAME:Ljava/lang/String; = "ambient"

.field public static final DEVICE_IN_ANLG_DOCK_HEADSET:I = -0x7ffffe00

.field public static final DEVICE_IN_ANLG_DOCK_HEADSET_NAME:Ljava/lang/String; = "analog_dock"

.field public static final DEVICE_IN_AUX_DIGITAL:I = -0x7fffffe0

.field public static final DEVICE_IN_AUX_DIGITAL_NAME:Ljava/lang/String; = "aux_digital"

.field public static final DEVICE_IN_BACK_MIC:I = -0x7fffff80

.field public static final DEVICE_IN_BACK_MIC_NAME:Ljava/lang/String; = "back_mic"

.field public static final DEVICE_IN_BLUETOOTH_A2DP:I = -0x7ffe0000

.field public static final DEVICE_IN_BLUETOOTH_A2DP_NAME:Ljava/lang/String; = "bt_a2dp"

.field public static final DEVICE_IN_BLUETOOTH_SCO_HEADSET:I = -0x7ffffff8

.field public static final DEVICE_IN_BLUETOOTH_SCO_HEADSET_NAME:Ljava/lang/String; = "bt_sco_hs"

.field public static final DEVICE_IN_BUILTIN_MIC:I = -0x7ffffffc

.field public static final DEVICE_IN_BUILTIN_MIC_NAME:Ljava/lang/String; = "mic"

.field public static final DEVICE_IN_COMMUNICATION:I = -0x7fffffff

.field public static final DEVICE_IN_COMMUNICATION_NAME:Ljava/lang/String; = "communication"

.field public static final DEVICE_IN_DEFAULT:I = -0x40000000

.field public static final DEVICE_IN_DGTL_DOCK_HEADSET:I = -0x7ffffc00

.field public static final DEVICE_IN_DGTL_DOCK_HEADSET_NAME:Ljava/lang/String; = "digital_dock"

.field public static final DEVICE_IN_FM_TUNER:I = -0x7fffe000

.field public static final DEVICE_IN_FM_TUNER_NAME:Ljava/lang/String; = "fm_tuner"

.field public static final DEVICE_IN_HDMI:I = -0x7fffffe0

.field public static final DEVICE_IN_IP:I = -0x7ff80000

.field public static final DEVICE_IN_IP_NAME:Ljava/lang/String; = "ip"

.field public static final DEVICE_IN_LINE:I = -0x7fff8000

.field public static final DEVICE_IN_LINE_NAME:Ljava/lang/String; = "line"

.field public static final DEVICE_IN_LOOPBACK:I = -0x7ffc0000

.field public static final DEVICE_IN_LOOPBACK_NAME:Ljava/lang/String; = "loopback"

.field public static final DEVICE_IN_PROXY:I = -0x7f000000

.field public static final DEVICE_IN_REMOTE_SUBMIX:I = -0x7fffff00

.field public static final DEVICE_IN_REMOTE_SUBMIX_NAME:Ljava/lang/String; = "remote_submix"

.field public static final DEVICE_IN_SPDIF:I = -0x7fff0000

.field public static final DEVICE_IN_SPDIF_NAME:Ljava/lang/String; = "spdif"

.field public static final DEVICE_IN_TELEPHONY_RX:I = -0x7fffffc0

.field public static final DEVICE_IN_TELEPHONY_RX_NAME:Ljava/lang/String; = "telephony_rx"

.field public static final DEVICE_IN_TV_TUNER:I = -0x7fffc000

.field public static final DEVICE_IN_TV_TUNER_NAME:Ljava/lang/String; = "tv_tuner"

.field public static final DEVICE_IN_USB_ACCESSORY:I = -0x7ffff800

.field public static final DEVICE_IN_USB_ACCESSORY_NAME:Ljava/lang/String; = "usb_accessory"

.field public static final DEVICE_IN_USB_DEVICE:I = -0x7ffff000

.field public static final DEVICE_IN_USB_DEVICE_NAME:Ljava/lang/String; = "usb_device"

.field public static final DEVICE_IN_VOICE_CALL:I = -0x7fffffc0

.field public static final DEVICE_IN_WIRED_HEADSET:I = -0x7ffffff0

.field public static final DEVICE_IN_WIRED_HEADSET_NAME:Ljava/lang/String; = "headset"

.field public static final DEVICE_NONE:I = 0x0

.field public static final DEVICE_OUT_ALL:I = 0x41ffffff

.field public static final DEVICE_OUT_ALL_A2DP:I = 0x380

.field public static final DEVICE_OUT_ALL_HDMI_SYSTEM_AUDIO:I = 0x2c0000

.field public static final DEVICE_OUT_ALL_SCO:I = 0x70

.field public static final DEVICE_OUT_ALL_USB:I = 0x6000

.field public static final DEVICE_OUT_ANLG_DOCK_HEADSET:I = 0x800

.field public static final DEVICE_OUT_ANLG_DOCK_HEADSET_NAME:Ljava/lang/String; = "analog_dock"

.field public static final DEVICE_OUT_AUX_DIGITAL:I = 0x400

.field public static final DEVICE_OUT_AUX_DIGITAL_NAME:Ljava/lang/String; = "aux_digital"

.field public static final DEVICE_OUT_AUX_LINE:I = 0x200000

.field public static final DEVICE_OUT_AUX_LINE_NAME:Ljava/lang/String; = "aux_line"

.field public static final DEVICE_OUT_BLUETOOTH_A2DP:I = 0x80

.field public static final DEVICE_OUT_BLUETOOTH_A2DP_HEADPHONES:I = 0x100

.field public static final DEVICE_OUT_BLUETOOTH_A2DP_HEADPHONES_NAME:Ljava/lang/String; = "bt_a2dp_hp"

.field public static final DEVICE_OUT_BLUETOOTH_A2DP_NAME:Ljava/lang/String; = "bt_a2dp"

.field public static final DEVICE_OUT_BLUETOOTH_A2DP_SPEAKER:I = 0x200

.field public static final DEVICE_OUT_BLUETOOTH_A2DP_SPEAKER_NAME:Ljava/lang/String; = "bt_a2dp_spk"

.field public static final DEVICE_OUT_BLUETOOTH_SCO:I = 0x10

.field public static final DEVICE_OUT_BLUETOOTH_SCO_CARKIT:I = 0x40

.field public static final DEVICE_OUT_BLUETOOTH_SCO_CARKIT_NAME:Ljava/lang/String; = "bt_sco_carkit"

.field public static final DEVICE_OUT_BLUETOOTH_SCO_HEADSET:I = 0x20

.field public static final DEVICE_OUT_BLUETOOTH_SCO_HEADSET_NAME:Ljava/lang/String; = "bt_sco_hs"

.field public static final DEVICE_OUT_BLUETOOTH_SCO_NAME:Ljava/lang/String; = "bt_sco"

.field public static final DEVICE_OUT_DEFAULT:I = 0x40000000

.field public static final DEVICE_OUT_DGTL_DOCK_HEADSET:I = 0x1000

.field public static final DEVICE_OUT_DGTL_DOCK_HEADSET_NAME:Ljava/lang/String; = "digital_dock"

.field public static final DEVICE_OUT_EARPIECE:I = 0x1

.field public static final DEVICE_OUT_EARPIECE_NAME:Ljava/lang/String; = "earpiece"

.field public static final DEVICE_OUT_FM:I = 0x100000

.field public static final DEVICE_OUT_FM_NAME:Ljava/lang/String; = "fm_transmitter"

.field public static final DEVICE_OUT_HDMI:I = 0x400

.field public static final DEVICE_OUT_HDMI_ARC:I = 0x40000

.field public static final DEVICE_OUT_HDMI_ARC_NAME:Ljava/lang/String; = "hmdi_arc"

.field public static final DEVICE_OUT_HDMI_NAME:Ljava/lang/String; = "hdmi"

.field public static final DEVICE_OUT_IP:I = 0x800000

.field public static final DEVICE_OUT_IP_NAME:Ljava/lang/String; = "ip"

.field public static final DEVICE_OUT_LINE:I = 0x20000

.field public static final DEVICE_OUT_LINE_NAME:Ljava/lang/String; = "line"

.field public static final DEVICE_OUT_PROXY:I = 0x1000000

.field public static final DEVICE_OUT_PROXY_NAME:Ljava/lang/String; = "proxy"

.field public static final DEVICE_OUT_REMOTE_SUBMIX:I = 0x8000

.field public static final DEVICE_OUT_REMOTE_SUBMIX_NAME:Ljava/lang/String; = "remote_submix"

.field public static final DEVICE_OUT_SPDIF:I = 0x80000

.field public static final DEVICE_OUT_SPDIF_NAME:Ljava/lang/String; = "spdif"

.field public static final DEVICE_OUT_SPEAKER:I = 0x2

.field public static final DEVICE_OUT_SPEAKER_NAME:Ljava/lang/String; = "speaker"

.field public static final DEVICE_OUT_SPEAKER_SAFE:I = 0x400000

.field public static final DEVICE_OUT_SPEAKER_SAFE_NAME:Ljava/lang/String; = "speaker_safe"

.field public static final DEVICE_OUT_TELEPHONY_TX:I = 0x10000

.field public static final DEVICE_OUT_TELEPHONY_TX_NAME:Ljava/lang/String; = "telephony_tx"

.field public static final DEVICE_OUT_USB_ACCESSORY:I = 0x2000

.field public static final DEVICE_OUT_USB_ACCESSORY_NAME:Ljava/lang/String; = "usb_accessory"

.field public static final DEVICE_OUT_USB_DEVICE:I = 0x4000

.field public static final DEVICE_OUT_USB_DEVICE_NAME:Ljava/lang/String; = "usb_device"

.field public static final DEVICE_OUT_WIRED_HEADPHONE:I = 0x8

.field public static final DEVICE_OUT_WIRED_HEADPHONE_NAME:Ljava/lang/String; = "headphone"

.field public static final DEVICE_OUT_WIRED_HEADSET:I = 0x4

.field public static final DEVICE_OUT_WIRED_HEADSET_NAME:Ljava/lang/String; = "headset"

.field public static final DEVICE_STATE_AVAILABLE:I = 0x1

.field public static final DEVICE_STATE_UNAVAILABLE:I = 0x0

.field private static final DYNAMIC_POLICY_EVENT_MIX_STATE_UPDATE:I = 0x0

.field public static final ERROR:I = -0x1

.field public static final FORCE_ANALOG_DOCK:I = 0x8

.field public static final FORCE_BT_A2DP:I = 0x4

.field public static final FORCE_BT_CAR_DOCK:I = 0x6

.field public static final FORCE_BT_DESK_DOCK:I = 0x7

.field public static final FORCE_BT_SCO:I = 0x3

.field public static final FORCE_DEFAULT:I = 0x0

.field public static final FORCE_DIGITAL_DOCK:I = 0x9

.field public static final FORCE_EARPIECE:I = 0xd

.field public static final FORCE_HDMI_SYSTEM_AUDIO_ENFORCED:I = 0xc

.field public static final FORCE_HEADPHONES:I = 0x2

.field public static final FORCE_NONE:I = 0x0

.field public static final FORCE_NO_BT_A2DP:I = 0xa

.field public static final FORCE_SPEAKER:I = 0x1

.field public static final FORCE_SYSTEM_ENFORCED:I = 0xb

.field public static final FORCE_WIRED_ACCESSORY:I = 0x5

.field public static final FOR_COMMUNICATION:I = 0x0

.field public static final FOR_DOCK:I = 0x3

.field public static final FOR_HDMI_SYSTEM_AUDIO:I = 0x5

.field public static final FOR_LB_TEST:I = 0x6

.field public static final FOR_MEDIA:I = 0x1

.field public static final FOR_RECORD:I = 0x2

.field public static final FOR_SYSTEM:I = 0x4

.field public static final INVALID_OPERATION:I = -0x3

.field public static final IN_VOICE_COMM_FOCUS_ID:Ljava/lang/String; = "AudioFocus_For_Phone_Ring_And_Calls"

.field public static final MODE_CURRENT:I = -0x1

.field public static final MODE_INVALID:I = -0x2

.field public static final MODE_IN_CALL:I = 0x2

.field public static final MODE_IN_COMMUNICATION:I = 0x3

.field public static final MODE_NORMAL:I = 0x0

.field public static final MODE_RINGTONE:I = 0x1

.field static final NATIVE_EVENT_ROUTING_CHANGE:I = 0x3e8

.field public static final NO_INIT:I = -0x5

.field private static final NUM_DEVICE_STATES:I = 0x1

.field private static final NUM_FORCE_CONFIG:I = 0xe

.field private static final NUM_FORCE_USE:I = 0x7

.field public static final NUM_MODES:I = 0x4

.field public static final NUM_STREAMS:I = 0x5

.field private static final NUM_STREAM_TYPES:I = 0xa

.field public static final PERMISSION_DENIED:I = -0x4

.field public static final PHONE_STATE_INCALL:I = 0x2

.field public static final PHONE_STATE_OFFCALL:I = 0x0

.field public static final PHONE_STATE_RINGING:I = 0x1

.field public static final PLATFORM_DEFAULT:I = 0x0

.field public static final PLATFORM_TELEVISION:I = 0x2

.field public static final PLATFORM_VOICE:I = 0x1

.field public static final PLAY_SOUND_DELAY:I = 0x12c

.field public static final ROUTE_ALL:I = -0x1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final ROUTE_BLUETOOTH:I = 0x4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final ROUTE_BLUETOOTH_A2DP:I = 0x10
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final ROUTE_BLUETOOTH_SCO:I = 0x4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final ROUTE_EARPIECE:I = 0x1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final ROUTE_HEADSET:I = 0x8
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final ROUTE_SPEAKER:I = 0x2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final STREAM_ALARM:I = 0x4

.field public static final STREAM_BLUETOOTH_SCO:I = 0x6

.field public static final STREAM_DEFAULT:I = -0x1

.field public static final STREAM_DTMF:I = 0x8

.field public static final STREAM_MUSIC:I = 0x3

.field public static final STREAM_NAMES:[Ljava/lang/String;

.field public static final STREAM_NOTIFICATION:I = 0x5

.field public static final STREAM_RING:I = 0x2

.field public static final STREAM_SYSTEM:I = 0x1

.field public static final STREAM_SYSTEM_ENFORCED:I = 0x7

.field public static final STREAM_TTS:I = 0x9

.field public static final STREAM_VOICE_CALL:I = 0x0

.field public static final SUCCESS:I = 0x0

.field public static final SYNC_EVENT_NONE:I = 0x0

.field public static final SYNC_EVENT_PRESENTATION_COMPLETE:I = 0x1

.field private static final TAG:Ljava/lang/String; = "AudioSystem"

.field public static final WOULD_BLOCK:I = -0x7

.field private static mErrorCallback:Landroid/media/AudioSystem$ErrorCallback;

.field private static sDynPolicyCallback:Landroid/media/AudioSystem$DynamicPolicyCallback;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/16 v3, 0xa

    .line 73
    new-array v0, v3, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "STREAM_VOICE_CALL"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "STREAM_SYSTEM"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "STREAM_RING"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "STREAM_MUSIC"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "STREAM_ALARM"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "STREAM_NOTIFICATION"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "STREAM_BLUETOOTH_SCO"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "STREAM_SYSTEM_ENFORCED"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "STREAM_DTMF"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "STREAM_TTS"

    aput-object v2, v0, v1

    sput-object v0, Landroid/media/AudioSystem;->STREAM_NAMES:[Ljava/lang/String;

    .line 699
    new-array v0, v3, [I

    fill-array-data v0, :array_48

    sput-object v0, Landroid/media/AudioSystem;->DEFAULT_STREAM_VOLUME:[I

    .line 714
    sget-object v0, Landroid/media/AudioSystem;->DEFAULT_STREAM_VOLUME:[I

    invoke-static {v0}, Landroid/media/AudioServiceInjector;->adjustDefaultStreamVolume([I)V

    .line 715
    return-void

    .line 699
    nop

    :array_48
    .array-data 4
        0x4
        0x7
        0x5
        0xb
        0x6
        0x5
        0x7
        0x7
        0xb
        0xb
    .end array-data
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 233
    return-void
.end method

.method public static native checkAudioFlinger()I
.end method

.method public static native createAudioPatch([Landroid/media/AudioPatch;[Landroid/media/AudioPortConfig;[Landroid/media/AudioPortConfig;)I
.end method

.method private static dynamicPolicyCallbackFromNative(ILjava/lang/String;I)V
    .registers 7
    .param p0, "event"    # I
    .param p1, "regId"    # Ljava/lang/String;
    .param p2, "val"    # I

    .prologue
    .line 253
    const/4 v0, 0x0

    .line 254
    .local v0, "cb":Landroid/media/AudioSystem$DynamicPolicyCallback;
    const-class v2, Landroid/media/AudioSystem;

    monitor-enter v2

    .line 255
    :try_start_4
    sget-object v1, Landroid/media/AudioSystem;->sDynPolicyCallback:Landroid/media/AudioSystem$DynamicPolicyCallback;

    if-eqz v1, :cond_a

    .line 256
    sget-object v0, Landroid/media/AudioSystem;->sDynPolicyCallback:Landroid/media/AudioSystem$DynamicPolicyCallback;

    .line 258
    :cond_a
    monitor-exit v2
    :try_end_b
    .catchall {:try_start_4 .. :try_end_b} :catchall_29

    .line 259
    if-eqz v0, :cond_28

    .line 260
    packed-switch p0, :pswitch_data_30

    .line 265
    const-string v1, "AudioSystem"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "dynamicPolicyCallbackFromNative: unknown event "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 268
    :cond_28
    :goto_28
    return-void

    .line 258
    :catchall_29
    move-exception v1

    :try_start_2a
    monitor-exit v2
    :try_end_2b
    .catchall {:try_start_2a .. :try_end_2b} :catchall_29

    throw v1

    .line 262
    :pswitch_2c
    invoke-interface {v0, p1, p2}, Landroid/media/AudioSystem$DynamicPolicyCallback;->onDynamicPolicyMixStateUpdate(Ljava/lang/String;I)V

    goto :goto_28

    .line 260
    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_2c
    .end packed-switch
.end method

.method private static errorCallbackFromNative(I)V
    .registers 4
    .param p0, "error"    # I

    .prologue
    .line 218
    const/4 v0, 0x0

    .line 219
    .local v0, "errorCallback":Landroid/media/AudioSystem$ErrorCallback;
    const-class v2, Landroid/media/AudioSystem;

    monitor-enter v2

    .line 220
    :try_start_4
    sget-object v1, Landroid/media/AudioSystem;->mErrorCallback:Landroid/media/AudioSystem$ErrorCallback;

    if-eqz v1, :cond_a

    .line 221
    sget-object v0, Landroid/media/AudioSystem;->mErrorCallback:Landroid/media/AudioSystem$ErrorCallback;

    .line 223
    :cond_a
    monitor-exit v2
    :try_end_b
    .catchall {:try_start_4 .. :try_end_b} :catchall_11

    .line 224
    if-eqz v0, :cond_10

    .line 225
    invoke-interface {v0, p0}, Landroid/media/AudioSystem$ErrorCallback;->onError(I)V

    .line 227
    :cond_10
    return-void

    .line 223
    :catchall_11
    move-exception v1

    :try_start_12
    monitor-exit v2
    :try_end_13
    .catchall {:try_start_12 .. :try_end_13} :catchall_11

    throw v1
.end method

.method public static native getAudioHwSyncForSession(I)I
.end method

.method public static getDefaultStreamVolume(I)I
    .registers 2
    .param p0, "streamType"    # I

    .prologue
    .line 696
    sget-object v0, Landroid/media/AudioSystem;->DEFAULT_STREAM_VOLUME:[I

    aget v0, v0, p0

    return v0
.end method

.method public static native getDeviceConnectionState(ILjava/lang/String;)I
.end method

.method public static native getDevicesForStream(I)I
.end method

.method public static native getForceUse(I)I
.end method

.method public static getInputDeviceName(I)Ljava/lang/String;
    .registers 2
    .param p0, "device"    # I

    .prologue
    .line 532
    sparse-switch p0, :sswitch_data_50

    .line 575
    invoke-static {p0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    :goto_7
    return-object v0

    .line 534
    :sswitch_8
    const-string v0, "communication"

    goto :goto_7

    .line 536
    :sswitch_b
    const-string v0, "ambient"

    goto :goto_7

    .line 538
    :sswitch_e
    const-string/jumbo v0, "mic"

    goto :goto_7

    .line 540
    :sswitch_12
    const-string v0, "bt_sco_hs"

    goto :goto_7

    .line 542
    :sswitch_15
    const-string/jumbo v0, "headset"

    goto :goto_7

    .line 544
    :sswitch_19
    const-string v0, "aux_digital"

    goto :goto_7

    .line 546
    :sswitch_1c
    const-string/jumbo v0, "telephony_rx"

    goto :goto_7

    .line 548
    :sswitch_20
    const-string v0, "back_mic"

    goto :goto_7

    .line 550
    :sswitch_23
    const-string/jumbo v0, "remote_submix"

    goto :goto_7

    .line 552
    :sswitch_27
    const-string v0, "analog_dock"

    goto :goto_7

    .line 554
    :sswitch_2a
    const-string v0, "digital_dock"

    goto :goto_7

    .line 556
    :sswitch_2d
    const-string/jumbo v0, "usb_accessory"

    goto :goto_7

    .line 558
    :sswitch_31
    const-string/jumbo v0, "usb_device"

    goto :goto_7

    .line 560
    :sswitch_35
    const-string v0, "fm_tuner"

    goto :goto_7

    .line 562
    :sswitch_38
    const-string/jumbo v0, "tv_tuner"

    goto :goto_7

    .line 564
    :sswitch_3c
    const-string/jumbo v0, "line"

    goto :goto_7

    .line 566
    :sswitch_40
    const-string/jumbo v0, "spdif"

    goto :goto_7

    .line 568
    :sswitch_44
    const-string v0, "bt_a2dp"

    goto :goto_7

    .line 570
    :sswitch_47
    const-string/jumbo v0, "loopback"

    goto :goto_7

    .line 572
    :sswitch_4b
    const-string/jumbo v0, "ip"

    goto :goto_7

    .line 532
    nop

    :sswitch_data_50
    .sparse-switch
        -0x7fffffff -> :sswitch_8
        -0x7ffffffe -> :sswitch_b
        -0x7ffffffc -> :sswitch_e
        -0x7ffffff8 -> :sswitch_12
        -0x7ffffff0 -> :sswitch_15
        -0x7fffffe0 -> :sswitch_19
        -0x7fffffc0 -> :sswitch_1c
        -0x7fffff80 -> :sswitch_20
        -0x7fffff00 -> :sswitch_23
        -0x7ffffe00 -> :sswitch_27
        -0x7ffffc00 -> :sswitch_2a
        -0x7ffff800 -> :sswitch_2d
        -0x7ffff000 -> :sswitch_31
        -0x7fffe000 -> :sswitch_35
        -0x7fffc000 -> :sswitch_38
        -0x7fff8000 -> :sswitch_3c
        -0x7fff0000 -> :sswitch_40
        -0x7ffe0000 -> :sswitch_44
        -0x7ffc0000 -> :sswitch_47
        -0x7ff80000 -> :sswitch_4b
    .end sparse-switch
.end method

.method public static native getMasterMute()Z
.end method

.method public static native getMasterVolume()F
.end method

.method public static final getNumStreamTypes()I
    .registers 1

    .prologue
    .line 71
    const/16 v0, 0xa

    return v0
.end method

.method public static getOutputDeviceName(I)Ljava/lang/String;
    .registers 2
    .param p0, "device"    # I

    .prologue
    .line 473
    sparse-switch p0, :sswitch_data_62

    .line 526
    invoke-static {p0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    :goto_7
    return-object v0

    .line 475
    :sswitch_8
    const-string v0, "earpiece"

    goto :goto_7

    .line 477
    :sswitch_b
    const-string/jumbo v0, "speaker"

    goto :goto_7

    .line 479
    :sswitch_f
    const-string/jumbo v0, "headset"

    goto :goto_7

    .line 481
    :sswitch_13
    const-string/jumbo v0, "headphone"

    goto :goto_7

    .line 483
    :sswitch_17
    const-string v0, "bt_sco"

    goto :goto_7

    .line 485
    :sswitch_1a
    const-string v0, "bt_sco_hs"

    goto :goto_7

    .line 487
    :sswitch_1d
    const-string v0, "bt_sco_carkit"

    goto :goto_7

    .line 489
    :sswitch_20
    const-string v0, "bt_a2dp"

    goto :goto_7

    .line 491
    :sswitch_23
    const-string v0, "bt_a2dp_hp"

    goto :goto_7

    .line 493
    :sswitch_26
    const-string v0, "bt_a2dp_spk"

    goto :goto_7

    .line 495
    :sswitch_29
    const-string/jumbo v0, "hdmi"

    goto :goto_7

    .line 497
    :sswitch_2d
    const-string v0, "analog_dock"

    goto :goto_7

    .line 499
    :sswitch_30
    const-string v0, "digital_dock"

    goto :goto_7

    .line 501
    :sswitch_33
    const-string/jumbo v0, "usb_accessory"

    goto :goto_7

    .line 503
    :sswitch_37
    const-string/jumbo v0, "usb_device"

    goto :goto_7

    .line 505
    :sswitch_3b
    const-string/jumbo v0, "remote_submix"

    goto :goto_7

    .line 507
    :sswitch_3f
    const-string/jumbo v0, "telephony_tx"

    goto :goto_7

    .line 509
    :sswitch_43
    const-string/jumbo v0, "line"

    goto :goto_7

    .line 511
    :sswitch_47
    const-string/jumbo v0, "hmdi_arc"

    goto :goto_7

    .line 513
    :sswitch_4b
    const-string/jumbo v0, "spdif"

    goto :goto_7

    .line 515
    :sswitch_4f
    const-string v0, "fm_transmitter"

    goto :goto_7

    .line 517
    :sswitch_52
    const-string v0, "aux_line"

    goto :goto_7

    .line 519
    :sswitch_55
    const-string/jumbo v0, "speaker_safe"

    goto :goto_7

    .line 521
    :sswitch_59
    const-string/jumbo v0, "ip"

    goto :goto_7

    .line 523
    :sswitch_5d
    const-string/jumbo v0, "proxy"

    goto :goto_7

    .line 473
    nop

    :sswitch_data_62
    .sparse-switch
        0x1 -> :sswitch_8
        0x2 -> :sswitch_b
        0x4 -> :sswitch_f
        0x8 -> :sswitch_13
        0x10 -> :sswitch_17
        0x20 -> :sswitch_1a
        0x40 -> :sswitch_1d
        0x80 -> :sswitch_20
        0x100 -> :sswitch_23
        0x200 -> :sswitch_26
        0x400 -> :sswitch_29
        0x800 -> :sswitch_2d
        0x1000 -> :sswitch_30
        0x2000 -> :sswitch_33
        0x4000 -> :sswitch_37
        0x8000 -> :sswitch_3b
        0x10000 -> :sswitch_3f
        0x20000 -> :sswitch_43
        0x40000 -> :sswitch_47
        0x80000 -> :sswitch_4b
        0x100000 -> :sswitch_4f
        0x200000 -> :sswitch_52
        0x400000 -> :sswitch_55
        0x800000 -> :sswitch_59
        0x1000000 -> :sswitch_5d
    .end sparse-switch
.end method

.method public static native getOutputLatency(I)I
.end method

.method public static native getParameters(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public static getPlatformType(Landroid/content/Context;)I
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 740
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x1120059

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 741
    const/4 v0, 0x1

    .line 745
    :goto_e
    return v0

    .line 742
    :cond_f
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const-string v1, "android.software.leanback"

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 743
    const/4 v0, 0x2

    goto :goto_e

    .line 745
    :cond_1d
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public static native getPrimaryOutputFrameCount()I
.end method

.method public static native getPrimaryOutputSamplingRate()I
.end method

.method public static native getStreamVolumeIndex(II)I
.end method

.method public static getValueForVibrateSetting(III)I
    .registers 5
    .param p0, "existingValue"    # I
    .param p1, "vibrateType"    # I
    .param p2, "vibrateSetting"    # I

    .prologue
    .line 687
    const/4 v0, 0x3

    mul-int/lit8 v1, p1, 0x2

    shl-int/2addr v0, v1

    xor-int/lit8 v0, v0, -0x1

    and-int/2addr p0, v0

    .line 690
    and-int/lit8 v0, p2, 0x3

    mul-int/lit8 v1, p1, 0x2

    shl-int/2addr v0, v1

    or-int/2addr p0, v0

    .line 692
    return p0
.end method

.method public static native initStreamVolume(III)I
.end method

.method public static native isMicrophoneMuted()Z
.end method

.method public static native isSourceActive(I)Z
.end method

.method public static native isStreamActive(II)Z
.end method

.method public static native isStreamActiveRemotely(II)Z
.end method

.method public static native listAudioPatches(Ljava/util/ArrayList;[I)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/media/AudioPatch;",
            ">;[I)I"
        }
    .end annotation
.end method

.method public static native listAudioPorts(Ljava/util/ArrayList;[I)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/media/AudioPort;",
            ">;[I)I"
        }
    .end annotation
.end method

.method public static native muteMicrophone(Z)I
.end method

.method private static final native native_register_dynamic_policy_callback()V
.end method

.method public static native newAudioSessionId()I
.end method

.method public static native registerPolicyMixes(Ljava/util/ArrayList;Z)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/media/audiopolicy/AudioMix;",
            ">;Z)I"
        }
    .end annotation
.end method

.method public static native releaseAudioPatch(Landroid/media/AudioPatch;)I
.end method

.method public static native setAudioPortConfig(Landroid/media/AudioPortConfig;)I
.end method

.method public static native setDeviceConnectionState(IILjava/lang/String;Ljava/lang/String;)I
.end method

.method public static setDynamicPolicyCallback(Landroid/media/AudioSystem$DynamicPolicyCallback;)V
    .registers 3
    .param p0, "cb"    # Landroid/media/AudioSystem$DynamicPolicyCallback;

    .prologue
    .line 245
    const-class v1, Landroid/media/AudioSystem;

    monitor-enter v1

    .line 246
    :try_start_3
    sput-object p0, Landroid/media/AudioSystem;->sDynPolicyCallback:Landroid/media/AudioSystem$DynamicPolicyCallback;

    .line 247
    invoke-static {}, Landroid/media/AudioSystem;->native_register_dynamic_policy_callback()V

    .line 248
    monitor-exit v1

    .line 249
    return-void

    .line 248
    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public static setErrorCallback(Landroid/media/AudioSystem$ErrorCallback;)V
    .registers 3
    .param p0, "cb"    # Landroid/media/AudioSystem$ErrorCallback;

    .prologue
    .line 208
    const-class v1, Landroid/media/AudioSystem;

    monitor-enter v1

    .line 209
    :try_start_3
    sput-object p0, Landroid/media/AudioSystem;->mErrorCallback:Landroid/media/AudioSystem$ErrorCallback;

    .line 210
    if-eqz p0, :cond_e

    .line 211
    invoke-static {}, Landroid/media/AudioSystem;->checkAudioFlinger()I

    move-result v0

    invoke-interface {p0, v0}, Landroid/media/AudioSystem$ErrorCallback;->onError(I)V

    .line 213
    :cond_e
    monitor-exit v1

    .line 214
    return-void

    .line 213
    :catchall_10
    move-exception v0

    monitor-exit v1
    :try_end_12
    .catchall {:try_start_3 .. :try_end_12} :catchall_10

    throw v0
.end method

.method public static native setForceUse(II)I
.end method

.method public static native setLowRamDevice(Z)I
.end method

.method public static native setMasterMute(Z)I
.end method

.method public static native setMasterVolume(F)I
.end method

.method public static native setParameters(Ljava/lang/String;)I
.end method

.method public static native setPhoneState(I)I
.end method

.method public static native setStreamVolumeIndex(III)I
.end method

.method public static streamToString(I)Ljava/lang/String;
    .registers 3
    .param p0, "stream"    # I

    .prologue
    .line 719
    if-ltz p0, :cond_c

    sget-object v0, Landroid/media/AudioSystem;->STREAM_NAMES:[Ljava/lang/String;

    array-length v0, v0

    if-ge p0, v0, :cond_c

    sget-object v0, Landroid/media/AudioSystem;->STREAM_NAMES:[Ljava/lang/String;

    aget-object v0, v0, p0

    .line 721
    :goto_b
    return-object v0

    .line 720
    :cond_c
    const/high16 v0, -0x80000000

    if-ne p0, v0, :cond_13

    const-string v0, "USE_DEFAULT_STREAM_TYPE"

    goto :goto_b

    .line 721
    :cond_13
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "UNKNOWN_STREAM_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_b
.end method

.method public static native systemReady()I
.end method
