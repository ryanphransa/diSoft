
# Consider dependencies only in project.
set(CMAKE_DEPENDS_IN_PROJECT_ONLY OFF)

# The set of languages for which implicit dependencies are needed:
set(CMAKE_DEPENDS_LANGUAGES
  "ASM"
  )
# The set of files for implicit dependencies of each language:
set(CMAKE_DEPENDS_CHECK_ASM
  "/home/black/esp/ledc_basic/build/x509_crt_bundle.S" "/home/black/esp/ledc_basic/build/esp-idf/mbedtls/CMakeFiles/__idf_mbedtls.dir/__/__/x509_crt_bundle.S.obj"
  )
set(CMAKE_ASM_COMPILER_ID "GNU")

# Preprocessor definitions for this target.
set(CMAKE_TARGET_DEFINITIONS_ASM
  "ESP_PLATFORM"
  [[IDF_VER="v6.1-dev-6485-g055ba9d3f9c"]]
  [[MBEDTLS_CONFIG_FILE="mbedtls/esp_config.h"]]
  "MBEDTLS_MAJOR_VERSION=4"
  "SOC_MMU_PAGE_SIZE=CONFIG_MMU_PAGE_SIZE"
  "SOC_XTAL_FREQ_MHZ=CONFIG_XTAL_FREQ"
  [[TF_PSA_CRYPTO_USER_CONFIG_FILE="mbedtls/esp_config.h"]]
  "_GLIBCXX_HAVE_POSIX_SEMAPHORE"
  "_GLIBCXX_USE_POSIX_SEMAPHORE"
  "_GNU_SOURCE"
  "_POSIX_READER_WRITER_LOCKS"
  "__STDC_WANT_LIB_EXT1__=0"
  )

# The include file search paths:
set(CMAKE_ASM_TARGET_INCLUDE_PATH
  "config"
  "/home/black/esp/esp-idf/components/mbedtls/port/include"
  "/home/black/esp/esp-idf/components/mbedtls/mbedtls/include"
  "/home/black/esp/esp-idf/components/mbedtls/mbedtls/library"
  "/home/black/esp/esp-idf/components/mbedtls/mbedtls/tf-psa-crypto/core"
  "/home/black/esp/esp-idf/components/mbedtls/mbedtls/tf-psa-crypto/drivers/builtin/src"
  "/home/black/esp/esp-idf/components/mbedtls/mbedtls/tf-psa-crypto/extras"
  "/home/black/esp/esp-idf/components/mbedtls/esp_crt_bundle/include"
  "/home/black/esp/esp-idf/components/mbedtls/port/psa_driver/include"
  "/home/black/esp/esp-idf/components/mbedtls/port/psa_crypto_storage/include"
  "/home/black/esp/esp-idf/components/esp_libc/platform_include"
  "/home/black/esp/esp-idf/components/freertos/config/include"
  "/home/black/esp/esp-idf/components/freertos/config/include/freertos"
  "/home/black/esp/esp-idf/components/freertos/config/xtensa/include"
  "/home/black/esp/esp-idf/components/freertos/FreeRTOS-Kernel/include"
  "/home/black/esp/esp-idf/components/freertos/FreeRTOS-Kernel/portable/xtensa/include"
  "/home/black/esp/esp-idf/components/freertos/FreeRTOS-Kernel/portable/xtensa/include/freertos"
  "/home/black/esp/esp-idf/components/freertos/esp_additions/include"
  "/home/black/esp/esp-idf/components/esp_hw_support/include"
  "/home/black/esp/esp-idf/components/esp_hw_support/include/soc"
  "/home/black/esp/esp-idf/components/esp_hw_support/ldo/include"
  "/home/black/esp/esp-idf/components/esp_hw_support/debug_probe/include"
  "/home/black/esp/esp-idf/components/esp_hw_support/etm/include"
  "/home/black/esp/esp-idf/components/esp_hw_support/mspi/mspi_timing_tuning/include"
  "/home/black/esp/esp-idf/components/esp_hw_support/mspi/mspi_timing_tuning/tuning_scheme_impl/include"
  "/home/black/esp/esp-idf/components/esp_hw_support/mspi/mspi_intr/include"
  "/home/black/esp/esp-idf/components/esp_hw_support/power_supply/include"
  "/home/black/esp/esp-idf/components/esp_hw_support/modem/include"
  "/home/black/esp/esp-idf/components/esp_hw_support/port/esp32/."
  "/home/black/esp/esp-idf/components/esp_hw_support/port/esp32/include"
  "/home/black/esp/esp-idf/components/heap/include"
  "/home/black/esp/esp-idf/components/heap/tlsf"
  "/home/black/esp/esp-idf/components/log/include"
  "/home/black/esp/esp-idf/components/soc/include"
  "/home/black/esp/esp-idf/components/soc/esp32"
  "/home/black/esp/esp-idf/components/soc/esp32/include"
  "/home/black/esp/esp-idf/components/soc/esp32/register"
  "/home/black/esp/esp-idf/components/hal/platform_port/include"
  "/home/black/esp/esp-idf/components/hal/esp32/include"
  "/home/black/esp/esp-idf/components/hal/include"
  "/home/black/esp/esp-idf/components/esp_rom/include"
  "/home/black/esp/esp-idf/components/esp_rom/esp32/include"
  "/home/black/esp/esp-idf/components/esp_rom/esp32/include/esp32"
  "/home/black/esp/esp-idf/components/esp_rom/esp32"
  "/home/black/esp/esp-idf/components/esp_common/include"
  "/home/black/esp/esp-idf/components/esp_system/include"
  "/home/black/esp/esp-idf/components/esp_system/port/soc"
  "/home/black/esp/esp-idf/components/esp_system/port/include/private"
  "/home/black/esp/esp-idf/components/esp_stdio/include"
  "/home/black/esp/esp-idf/components/xtensa/esp32/include"
  "/home/black/esp/esp-idf/components/xtensa/include"
  "/home/black/esp/esp-idf/components/xtensa/deprecated_include"
  "/home/black/esp/esp-idf/components/esp_hal_gpio/include"
  "/home/black/esp/esp-idf/components/esp_hal_gpio/esp32/include"
  "/home/black/esp/esp-idf/components/esp_hal_usb/include"
  "/home/black/esp/esp-idf/components/esp_hal_pmu/include"
  "/home/black/esp/esp-idf/components/esp_hal_pmu/esp32/include"
  "/home/black/esp/esp-idf/components/esp_hal_regi2c/include"
  "/home/black/esp/esp-idf/components/esp_hal_regi2c/esp32/include"
  "/home/black/esp/esp-idf/components/esp_hal_uart/include"
  "/home/black/esp/esp-idf/components/esp_hal_uart/esp32/include"
  "/home/black/esp/esp-idf/components/esp_hal_ana_conv/include"
  "/home/black/esp/esp-idf/components/esp_hal_ana_conv/esp32/include"
  "/home/black/esp/esp-idf/components/esp_hal_dma/include"
  "/home/black/esp/esp-idf/components/esp_hal_i2s/include"
  "/home/black/esp/esp-idf/components/esp_hal_i2s/esp32/include"
  "/home/black/esp/esp-idf/components/esp_security/include"
  "/home/black/esp/esp-idf/components/esp_hal_security/esp32/include"
  "/home/black/esp/esp-idf/components/esp_hal_security/include"
  "/home/black/esp/esp-idf/components/esp_pm/include"
  "/home/black/esp/esp-idf/components/esp_driver_dma/include"
  "/home/black/esp/esp-idf/components/mbedtls/mbedtls/tf-psa-crypto/include"
  "/home/black/esp/esp-idf/components/mbedtls/mbedtls/tf-psa-crypto/drivers/builtin/include"
  "esp-idf/mbedtls/mbedtls/tf-psa-crypto/include"
  "/home/black/esp/esp-idf/components/mbedtls/mbedtls/tf-psa-crypto/drivers/everest/include"
  "/home/black/esp/esp-idf/components/mbedtls/mbedtls/tf-psa-crypto/drivers/p256-m/p256-m"
  "/home/black/esp/esp-idf/components/mbedtls/mbedtls/tf-psa-crypto/drivers/pqcp/include"
  )

# The set of dependency files which are needed:
set(CMAKE_DEPENDS_DEPENDENCY_FILES
  "/home/black/esp/esp-idf/components/mbedtls/esp_crt_bundle/esp_crt_bundle.c" "esp-idf/mbedtls/CMakeFiles/__idf_mbedtls.dir/esp_crt_bundle/esp_crt_bundle.c.obj" "gcc" "esp-idf/mbedtls/CMakeFiles/__idf_mbedtls.dir/esp_crt_bundle/esp_crt_bundle.c.obj.d"
  "/home/black/esp/esp-idf/components/mbedtls/port/esp_mem.c" "esp-idf/mbedtls/CMakeFiles/__idf_mbedtls.dir/port/esp_mem.c.obj" "gcc" "esp-idf/mbedtls/CMakeFiles/__idf_mbedtls.dir/port/esp_mem.c.obj.d"
  "/home/black/esp/esp-idf/components/mbedtls/port/psa_crypto_storage/esp_psa_key_file.c" "esp-idf/mbedtls/CMakeFiles/__idf_mbedtls.dir/port/psa_crypto_storage/esp_psa_key_file.c.obj" "gcc" "esp-idf/mbedtls/CMakeFiles/__idf_mbedtls.dir/port/psa_crypto_storage/esp_psa_key_file.c.obj.d"
  )

# Targets to which this target links which contain Fortran sources.
set(CMAKE_Fortran_TARGET_LINKED_INFO_FILES
  )

# Targets to which this target links which contain Fortran sources.
set(CMAKE_Fortran_TARGET_FORWARD_LINKED_INFO_FILES
  )

# Fortran module output directory.
set(CMAKE_Fortran_TARGET_MODULE_DIR "")
