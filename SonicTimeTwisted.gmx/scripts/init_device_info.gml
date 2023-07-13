device_info = DEVICE_INFO;

if (DEVICE_INFO & DEVICE_OS_ANDROID) {
    if (sttandroid_device_get_type()) {
        device_info = DEVICE_TYPE_CONSOLE | DEVICE_OS_ANDROID;
    }
}
