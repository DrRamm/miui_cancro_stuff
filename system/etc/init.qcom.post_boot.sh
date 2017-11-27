#!/system/bin/sh
# Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of The Linux Foundation nor
#       the names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior written
#       permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

target=`getprop ro.board.platform`

case "$target" in
    "msm8974")
        echo 4 > /sys/module/lpm_levels/enable_low_power/l2
        echo 1 > /sys/module/msm_pm/modes/cpu0/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/retention/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/retention/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/retention/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/retention/idle_enabled
        echo 0 > /sys/module/msm_thermal/core_control/enabled
        stop mpdecision
        echo 1 > /sys/devices/system/cpu/cpu1/online
        echo 1 > /sys/devices/system/cpu/cpu2/online
        echo 1 > /sys/devices/system/cpu/cpu3/online
        if [ -f /sys/devices/soc0/soc_id ]; then
            soc_id=`cat /sys/devices/soc0/soc_id`
        else
            soc_id=`cat /sys/devices/system/soc/soc0/id`
        fi
        case "$soc_id" in
            "208" | "211" | "214" | "217" | "209" | "212" | "215" | "218" | "194" | "210" | "213" | "216")
                for devfreq_gov in /sys/class/devfreq/qcom,cpubw*/governor
                do
                    echo "cpubw_hwmon" > $devfreq_gov
                done
                echo "interactive" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
                echo "interactive" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
                echo "interactive" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
                echo "interactive" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
                echo "19000 1400000:35000 1800000:25000" > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
                echo 95 > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
                echo 1190400 > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
                echo 1 > /sys/devices/system/cpu/cpufreq/interactive/io_is_busy
                echo "50  1300000:60 1500000:70 1800000:80 2000000:90" > /sys/devices/system/cpu/cpufreq/interactive/target_loads
                echo 20000 > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
                echo 20 > /sys/module/cpu_boost/parameters/boost_ms
                echo 1728000 > /sys/module/cpu_boost/parameters/sync_threshold
                echo 90000 > /sys/devices/system/cpu/cpufreq/interactive/sampling_down_factor
                echo 20 > /sys/module/cpu_boost/parameters/input_boost_ms
                setprop ro.qualcomm.perf.cores_online 2
            ;;
            *)
                echo "ondemand" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
                echo "ondemand" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
                echo "ondemand" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
                echo "ondemand" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
                echo 50000 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
                echo 90 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold
                echo 1 > /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy
                echo 2 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
                echo 10 > /sys/devices/system/cpu/cpufreq/ondemand/down_differential
                echo 70 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold_multi_core
                echo 3 > /sys/devices/system/cpu/cpufreq/ondemand/down_differential_multi_core
                echo 960000 > /sys/devices/system/cpu/cpufreq/ondemand/optimal_freq
                echo 960000 > /sys/devices/system/cpu/cpufreq/ondemand/sync_freq
                echo 1190400 > /sys/devices/system/cpu/cpufreq/ondemand/input_boost
                echo 80 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold_any_cpu_load
            ;;
        esac
        echo 300000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
        echo 300000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
        echo 300000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
        echo 300000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq
        echo 1 > /sys/module/msm_thermal/core_control/enabled
        chown -h root.system /sys/devices/system/cpu/mfreq
        chmod -h 220 /sys/devices/system/cpu/mfreq
        chown -h root.system /sys/devices/system/cpu/cpu1/online
        chown -h root.system /sys/devices/system/cpu/cpu2/online
        chown -h root.system /sys/devices/system/cpu/cpu3/online
        chmod -h 664 /sys/devices/system/cpu/cpu1/online
        chmod -h 664 /sys/devices/system/cpu/cpu2/online
        chmod -h 664 /sys/devices/system/cpu/cpu3/online
        echo 1 > /dev/cpuctl/cpu.notify_on_migrate
        chown system.system /sys/devices/system/cpu/nrcpus
        chmod -h 664 /sys/devices/system/cpu/nrcpus
        chown system.system /sys/class/devfreq/qcom,cpubw*/governor
        chmod -h 664 /sys/class/devfreq/qcom,cpubw*/governor
        chown system.system /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
        chown system.system /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
        chown system.system /sys/devices/system/cpu/cpu0/cpufreq/sys_cap_freq
        chown system.system /sys/devices/system/cpu/cpu0/cpufreq/thermal_cap_freq
        chown system.system /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
        chown system.system /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
        chown system.system /sys/devices/system/cpu/cpu1/cpufreq/sys_cap_freq
        chown system.system /sys/devices/system/cpu/cpu1/cpufreq/thermal_cap_freq
        chown system.system /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
        chown system.system /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
        chown system.system /sys/devices/system/cpu/cpu2/cpufreq/sys_cap_freq
        chown system.system /sys/devices/system/cpu/cpu2/cpufreq/thermal_cap_freq
        chown system.system /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq
        chown system.system /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq
        chown system.system /sys/devices/system/cpu/cpu3/cpufreq/sys_cap_freq
        chown system.system /sys/devices/system/cpu/cpu3/cpufreq/thermal_cap_freq
        echo 2457600 > /sys/devices/system/cpu/cpu0/cpufreq/sys_cap_freq
        echo 2457600 > /sys/devices/system/cpu/cpu1/cpufreq/sys_cap_freq
        echo 2457600 > /sys/devices/system/cpu/cpu2/cpufreq/sys_cap_freq
        echo 2457600 > /sys/devices/system/cpu/cpu3/cpufreq/sys_cap_freq
        chown system.system /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
        chown system.system /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
        chown system.system /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
        chown system.system /sys/devices/system/cpu/cpufreq/interactive/target_loads
        chown system.system /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
        chown system.system /sys/module/cpu_boost/parameters/boost_ms
        chown system.system /sys/module/cpu_boost/parameters/sync_threshold
        chown system.system /sys/module/cpu_boost/parameters/input_boost_freq
        chown system.system /sys/module/cpu_boost/parameters/input_boost_ms
        echo 1 > /dev/cpuctl/apps/cpu.notify_on_migrate
        start mpdecision
        setprop persist.sys.aries.power_profile `getprop persist.sys.aries.power_profile`
    ;;
esac

chown -h system /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
chown -h system /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
chown -h system /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy

emmc_boot=`getprop ro.boot.emmc`
case "$emmc_boot"
    in "true")
        chown -h system /sys/devices/platform/rs300000a7.65536/force_sync
        chown -h system /sys/devices/platform/rs300000a7.65536/sync_sts
        chown -h system /sys/devices/platform/rs300100a7.65536/force_sync
        chown -h system /sys/devices/platform/rs300100a7.65536/sync_sts
    ;;
esac


rm /data/system/perfd/default_values
echo 896 > /sys/block/mmcblk0/bdi/read_ahead_kb

# Install AdrenoTest.apk if not already installed
if [ -f /data/prebuilt/AdrenoTest.apk ]; then
    if [ ! -d /data/data/com.qualcomm.adrenotest ]; then
        pm install /data/prebuilt/AdrenoTest.apk
    fi
fi

# Install SWE_Browser.apk if not already installed
if [ -f /data/prebuilt/SWE_AndroidBrowser.apk ]; then
    if [ ! -d /data/data/com.android.swe.browser ]; then
        pm install /data/prebuilt/SWE_AndroidBrowser.apk
    fi
fi

case "$target" in
    "msm8226" | "msm8974" | "msm8610" | "apq8084" | "mpq8092" | "msm8610")
        # Let kernel know our image version/variant/crm_version
        image_version="10:"
        image_version+=`getprop ro.build.id`
        image_version+=":"
        image_version+=`getprop ro.build.version.incremental`
        image_variant=`getprop ro.product.name`
        image_variant+="-"
        image_variant+=`getprop ro.build.type`
        oem_version=`getprop ro.build.version.codename`
        echo 10 > /sys/devices/soc0/select_image
        echo $image_version > /sys/devices/soc0/image_version
        echo $image_variant > /sys/devices/soc0/image_variant
        echo $oem_version > /sys/devices/soc0/image_crm_version
        ;;
esac
