# Copyright (C) 2016 The Pure Nexus Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

CUSTOM_BUILD_DATE := $(shell date -u +%Y%m%d-%H%M)
TARGET_PRODUCT_SHORT := $(subst aosp_,,$(CUSTOM_BUILD))
ROM_FINGERPRINT := ABC-ROM/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(CUSTOM_BUILD_DATE)
ABC_VERSION := ABC-ROM_$(CUSTOM_BUILD)-$(PLATFORM_VERSION)-$(CUSTOM_BUILD_DATE)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.ABC.version=$(ABC_VERSION) \
    ro.ABC.build_date=$(CUSTOM_BUILD_DATE) \
    ro.ABC.fingerprint=$(ROM_FINGERPRINT)    
    
