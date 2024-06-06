#include "at32f403a_407_clock.h"
#include "at32f403a_407_board.h"
#include "lv_tick_custom.h"
#include "at32_video_ev_lcd.h"
#include "at32_video_ev_spi.h"
#include <middlewares/3rd_party/lvgl/examples/porting/lv_port_disp_template.h>
#include "middlewares/3rd_party/lvgl/examples/porting/lv_port_indev_template.h"
#include "middlewares/3rd_party/lvgl/lvgl.h"
#include "time.h"
#include "stdlib.h"
#include "string.h"


#define    EXTEND_SRAM          0x00

void crm_configuration(void);
void nvic_configuration(void);

/**
  * @brief  initializ lcd display information
  * @param  none
  * @retval none
  */

void lcd_display_initial_info(void)
{
    point_color = WHITE;
    back_color = RED;
    delay_ms(100);
	lcd_show_string(36,70,100,50,16, "GEOSCAN");
	delay_ms(2000);
	lcd_draw_line(34, 65, 63, 0, WHITE);
	lcd_draw_line(63, 0, 93, 65, WHITE);
	lcd_draw_line(63, 53, 34, 65, WHITE);
	lcd_draw_line(63, 53, 93, 65, WHITE);
}


void extend_sram(void)
{
  /* check if ram has been set to expectant size, if not, change eopb0 to 64k sram */
  if(((USD->eopb0) & 0xFF) != EXTEND_SRAM)
  {
    flash_unlock();
    /* erase user system data bytes */
    flash_user_system_data_erase();

    /* change sram size */
    flash_user_system_data_program((uint32_t)&USD->eopb0, EXTEND_SRAM);

    /* system reset */
    nvic_system_reset();
  }
}


/**
  * @brief  main function.
  * @param  none
  * @retval none
  */

int main(void)
{
  system_clock_config();
  nvic_configuration();
  delay_init();
  
  uart_print_init(115200);
  printf("usart init ok\r\n");
  
  /* for littlevgl gui tick increase */  
  tmr7_int_init(191, 999);
 
  crm_configuration();
  lcd_init();


#if 1
  /* for benchmark test */
   lv_init();
  lv_port_disp_init();
 // lv_demo_benchmark();
#else  
  /* for touch test */
  touch_adjust();
  lcd_display_initial_info();
  lv_init();
  lv_port_disp_init();
  lv_port_indev_init();
  lv_example_style_10(); 
#endif  
  lcd_clear(RED);
  while(1)
  {
	  //lv_task_handler();
	  lcd_display_initial_info();
  }
}


/**
  * @brief  crm configuration
  * @param  none
  * @retval none
  */
void crm_configuration(void)
{
  crm_periph_clock_enable(LCD_SPI_MASTER_DMA_CLK, TRUE);
  crm_periph_clock_enable(LCD_SPI_SELECTED_CLK, TRUE);
  crm_periph_clock_enable(CRM_IOMUX_PERIPH_CLOCK, TRUE);
  crm_periph_clock_enable(LCD_PEN_GPIO_CLK, TRUE);
  crm_periph_clock_enable(LCD_RST_GPIO_CLK, TRUE);
  crm_periph_clock_enable(LCD_BLK_GPIO_CLK, TRUE);
  crm_periph_clock_enable(LCD_DC_GPIO_CLK, TRUE);
  crm_periph_clock_enable(LCD_CS1_GPIO_CLK, TRUE);
  crm_periph_clock_enable(LCD_CS2_GPIO_CLK, TRUE);
  crm_periph_clock_enable(LCD_SPI_SCK_GPIO_CLK, TRUE);
  crm_periph_clock_enable(LCD_SPI_MOSI_GPIO_CLK, TRUE);
  crm_periph_clock_enable(LCD_SPI_MISO_GPIO_CLK, TRUE);  
}


/**
  * @brief  nvic configuration
  * @param  none
  * @retval none
  */
void nvic_configuration(void)
{
  /* 2 bit for pre-emption priority,2 bits for subpriority */
  nvic_priority_group_config(NVIC_PRIORITY_GROUP_4);

  /* configure dma1 channel3 for the spi transmit */
  nvic_irq_enable(LCD_SPI_MASTER_Tx_DMA_IRQn, 0, 2);
}
