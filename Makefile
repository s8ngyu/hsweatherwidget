ARCHS = arm64 arm64e

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = HSWeatherWidget
HSWeatherWidget_FILES = HSWeatherWidgetViewController.mm HSWeatherWidgetPreferencesViewController.mm
HSWeatherWidget_FRAMEWORKS = UIKit
HSWeatherWidget_EXTRA_FRAMEWORKS = HSWidgets
HSWeatherWidget_INSTALL_PATH = /Library/HSWidgets
HSWeatherWidget_PRIVATE_FRAMEWORKS = Preferences
HSWeatherWidget_CFLAGS = -fobjc-arc
HSWeatherWidget_LIBRARIES += pddokdo

include $(THEOS_MAKE_PATH)/bundle.mk

