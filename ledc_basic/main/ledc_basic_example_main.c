/* LEDC (LED Controller) basic example
/
   This example code is in the Public Domain (or CC0 licensed, at your option.)

   Unless required by applicable law or agreed to in writing, this
   software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
   CONDITIONS OF ANY KIND, either express or implied.
*/
#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/ledc.h"
#include "driver/gpio.h"
#include "esp_err.h"
#include "sdkconfig.h"
#include "esp_pm.h"
#include "driver/dac_oneshot.h"
#include "esp_adc/adc_oneshot.h"
#include "driver/dac_types.h"

#define LEDC_TIMER              LEDC_TIMER_0
#define LEDC_MODE               LEDC_LOW_SPEED_MODE
#define LEDC_OUTPUT_IO          (15) // Define the output GPIO
#define LEDC_CHANNEL            LEDC_CHANNEL_0
#define LEDC_DUTY_RES           LEDC_TIMER_13_BIT // Set duty resolution to 13 bits
#define LEDC_DUTY               (4096) // Set duty to 50%. (2 ** 13) * 50% = 4096
#if CONFIG_PM_ENABLE
#define LEDC_CLK_SRC            LEDC_USE_RC_FAST_CLK // choose a clock source that can maintain during light sleep
#define LEDC_FREQUENCY          (400) // Frequency in Hertz. Set frequency at 400 Hz
#else
#define LEDC_CLK_SRC            LEDC_AUTO_CLK
#define LEDC_FREQUENCY          (4000) // Frequency in Hertz. Set frequency at 4 kHz
#endif

/* Warning:
 * For ESP32, ESP32S2, ESP32S3, ESP32C3, ESP32C2, ESP32C6, ESP32H2 (rev < 1.2), ESP32P4 (rev < 3.0) targets,
 * when LEDC_DUTY_RES selects the maximum duty resolution (i.e. value equal to SOC_LEDC_TIMER_BIT_WIDTH),
 * 100% duty cycle is not reachable (duty cannot be set to (2 ** SOC_LEDC_TIMER_BIT_WIDTH)).
 */

static void example_ledc_init(int gpio)
{
    // Prepare and then apply the LEDC PWM timer configuration
    ledc_timer_config_t ledc_timer = {
        .speed_mode       = LEDC_MODE,
        .duty_resolution  = LEDC_DUTY_RES,
        .timer_num        = LEDC_TIMER,
        .freq_hz          = 440 /*LEDC_FREQUENCY*/,  // Set output frequency at 4 kHz
        .clk_cfg          = LEDC_CLK_SRC,
    };
    ESP_ERROR_CHECK(ledc_timer_config(&ledc_timer));

    // Prepare and then apply the LEDC PWM channel configuration
    ledc_channel_config_t ledc_channel = {
        .speed_mode     = LEDC_MODE,
        .channel        = LEDC_CHANNEL,
        .timer_sel      = LEDC_TIMER,
        .gpio_num       = gpio /*LEDC_OUTPUT_IO*/,
        .duty           = 0, // Set duty to 0%
        .hpoint         = 0,
#if CONFIG_PM_ENABLE
        .sleep_mode     = LEDC_SLEEP_MODE_KEEP_ALIVE,
#endif
    };
    ESP_ERROR_CHECK(ledc_channel_config(&ledc_channel));
}

static uint32_t dac_output_task(void *args, uint32_t val)
{
    dac_oneshot_handle_t handle = (dac_oneshot_handle_t)args;

    ESP_ERROR_CHECK(dac_oneshot_output_voltage(handle, val));
    val += 1;
    printf("%ld, ", val);
        
    vTaskDelay(pdMS_TO_TICKS(100));
    return val;
}

static void configure_button(int GPIO)
{
    gpio_config_t io_conf = {
        .pin_bit_mask = 1ULL << GPIO,
        .mode = GPIO_MODE_INPUT,
        .pull_up_en = GPIO_PULLUP_ENABLE,
        .pull_down_en = GPIO_PULLDOWN_DISABLE,
    };

    gpio_config(&io_conf);
}

void app_main(void)
{

#if CONFIG_PM_ENABLE
    esp_pm_config_t pm_config = {
        .max_freq_mhz = CONFIG_ESP_DEFAULT_CPU_FREQ_MHZ,
        .min_freq_mhz = CONFIG_ESP_DEFAULT_CPU_FREQ_MHZ,
#if CONFIG_FREERTOS_USE_TICKLESS_IDLE
        .light_sleep_enable = true
#endif
    };
    ESP_ERROR_CHECK(esp_pm_configure(&pm_config));
#endif
    // Set the LEDC peripheral configuration
    
    char tone;
    example_ledc_init(15);
    
    // Set duty to 50%
    ESP_ERROR_CHECK(ledc_set_duty(LEDC_MODE, LEDC_CHANNEL, LEDC_DUTY));
    // Update duty to apply the new value
    ESP_ERROR_CHECK(ledc_update_duty(LEDC_MODE, LEDC_CHANNEL));
    
    int button[] = { 5, 18, 19, 21, 3 };
    int i;
    
    // If ledc_set_freq is called multiple times, the sound get
    // weird, so he need to be called only one time, with ntch
    // (not changed) i verify if the button has changed.
    int ntch = 9;
    float freq = 440;
    float stop;
    // Configure buttons
    for(i = 0; i < 5; i++)
        configure_button(button[i]);

    /* DAC oneshot init */
    dac_oneshot_handle_t chan0_handle;
    dac_oneshot_config_t chan0_cfg = {
        .chan_id = DAC_CHAN_0
    };
    ESP_ERROR_CHECK(dac_oneshot_new_channel(&chan0_cfg, &chan0_handle));

    /* DAC oneshot outputting threads */
//    xTaskCreate(dac_output_task, "dac_chan0_output_task", 4096, chan0_handle, 5, NULL);


    float duty = 0.5;

    while(1) {
        scanf("%c", &tone);
        
        for(i = 0; i < 5; i++) { 
            
            if(gpio_get_level(button[i]) == 0) {
                while(gpio_get_level(button[i]) == 0) { 
                if(ntch == 8) {
                    // Set duty to 50%
                    ESP_ERROR_CHECK(ledc_set_duty(LEDC_MODE, LEDC_CHANNEL, LEDC_DUTY));
                
                    // Update duty to apply the new value
                    ESP_ERROR_CHECK(ledc_update_duty(LEDC_MODE, LEDC_CHANNEL));
                }
                if(i == 0 && ntch != 0) {
                    //ledc_set_freq(LEDC_MODE, LEDC_TIMER, 990);
                    freq = stop = 990;
                    printf("0");
                    ntch = 0;
                }
                else if(i == 1 && ntch != 1) {
                    //ledc_set_freq(LEDC_MODE, LEDC_TIMER, 880);
                    freq = stop = 880;
                    printf("1");
                    ntch = 1;
                }
                else if(i == 2 && ntch != 2) {
                    //ledc_set_freq(LEDC_MODE, LEDC_TIMER, 770);
                    freq = stop = 770;
                    printf("2");
                    ntch = 2;
                }
                else if(i == 3 && ntch != 3) {
                    //ledc_set_freq(LEDC_MODE, LEDC_TIMER, 660);
                    freq = stop = 660;
                    printf("3");
                    ntch = 3;
                }
                else if(i == 4 && ntch != 4) {
                    //ledc_set_freq(LEDC_MODE, LEDC_TIMER, 550);
                    freq = stop = 550;
                    printf("4");
                    ntch = 4;
                }

                // Set duty to 50%
                ESP_ERROR_CHECK(ledc_set_duty(LEDC_MODE, LEDC_CHANNEL, 8129 * duty));
                // Update duty to apply the new value
                ESP_ERROR_CHECK(ledc_update_duty(LEDC_MODE, LEDC_CHANNEL));
                
                duty -= 0.01;

                ledc_set_freq(LEDC_MODE, LEDC_TIMER, freq);
                
                vTaskDelay(100 / portTICK_PERIOD_MS);
                }
            }
            else if (ntch != 8) {
                ledc_stop(LEDC_MODE, LEDC_CHANNEL, 0);
                ntch = 8;
            }
            vTaskDelay(1);
        }
    }
}
