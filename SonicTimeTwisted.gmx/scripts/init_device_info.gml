device_info = DEVICE_INFO;

if (DEVICE_INFO & DEVICE_OS_ANDROID) {
    if (android_get_device_type()) {
        device_info = DEVICE_TYPE_CONSOLE | DEVICE_OS_ANDROID;
    }
}
