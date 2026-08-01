/*
 * Copyright (c) 2021 HPMicro
 *
 * SPDX-License-Identifier: BSD-3-Clause
 *
 */

#include <stdio.h>
#include "board.h"
#include "hpm_debug_console.h"
#include "hpm_gpio_drv.h"

#define LED_FLASH_PERIOD_IN_MS 300

int main(void)
{
    int u;
    board_init();

    gpio_set_pin_output(HPM_GPIO0, GPIO_DI_GPIOE, 28);

    printf("hello world\n");
    while(1)
    {
//        u = getchar();
//        if (u == '\r') {
//            u = '\n';
//        }
//        printf("%c", u);
        printf("hello world\n");
        board_hb_led_write(1);
        board_delay_ms(500);
        board_hb_led_write(0);
        board_delay_ms(500);
    }
    return 0;
}
