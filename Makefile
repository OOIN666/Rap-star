TARGET := iphone:clang:latest:14.0
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = MyModMenu
MyModMenu_FILES = ModMenu.swift Patcher.swift Cheats.swift Tweak.x
MyModMenu_SWIFTFLAGS = -ISwift

include $(THEOS_MAKE_PATH)/tweak.mk
