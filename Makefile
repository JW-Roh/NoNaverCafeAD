GO_EASY_ON_ME = 1
FINALPACKAGE=1
DEBUG=0

ARCHS := arm64
TARGET := iphone:clang:14.4:14.4

INSTALL_TARGET_PROCESSES = NaverCafe

THEOS_DEVICE_IP = 127.0.0.1 -p 2222

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NoNaverCafeAD

NoNaverCafeAD_FILES = Tweak.x
NoNaverCafeAD_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
