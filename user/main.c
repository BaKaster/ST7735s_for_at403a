#include "at32f403a_407_clock.h"
#include "at32f403a_407_board.h"
#include "at32_video_ev_lcd.h"
#include "at32_video_ev_spi.h"
#include "images.h"
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
//    point_color = WHITE;
//    back_color = RED;
//    lcd_draw_rectangle(20,20, 64,64, WHITE);
    //lcd_draw_filled_rectangle(40, 40, 20, 30, WHITE);
	lcd_draw_filled_round_rect(0, 0, 128, 21, 5, STATUS_BAR);
	lcd_draw_filled_round_rect(3, 25, 121, 23, 7, BRIGHTED_SELECT);
	lcd_draw_filled_round_rect(3, 52, 121, 23, 7, BUTTONS);
	lcd_draw_filled_round_rect(3, 79, 121, 23, 7, BUTTONS);
	lcd_draw_filled_round_rect(3, 106, 121, 23, 7, BUTTONS);
	lcd_draw_filled_round_rect(3, 133, 121, 23, 7, BUTTONS);
//    lcd_draw_circle_helper(50, 50, 30, QUADRANT_1, RED);
//    lcd_draw_circle_helper(50, 50, 30, QUADRANT_2, BLUE);
//    lcd_draw_circle_helper(50, 50, 30, QUADRANT_3, YELLOW);
//    lcd_draw_circle_helper(50, 50, 30, QUADRANT_4, GREEN);
    lcd_draw_round_rect(3, 25, 121, 23, 7, WHITE);
   lcd_show_string(88,11,120,100,&Montserrat_12, L"100%", WHITE);
    lcd_show_string(28,38,120,100,&Montserrat_16, L"Сведения", WHITE);
    lcd_show_string(28,65,120,100,&Montserrat_16, L"Режим сна", WHITE);
    lcd_show_string(28,92,120,100,&Montserrat_16,L"Настройки", WHITE);
    lcd_show_string(28,119,120,100,&Montserrat_16, L"Геоскан", WHITE);
    lcd_show_string(28,146,120,100,&Montserrat_16, L"Функция", WHITE);
    st7735s_DrawBitmap(city, 0, 0, 128, 160);
	lcd_display_buffer();
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
  
 
  crm_configuration();
  lcd_init();


//#if 1
//  /* for benchmark test */
 // lv_init();
 //lv_port_disp_init();
// // lv_demo_benchmark();
//#else
//  /* for touch test */
//  touch_adjust();
//  lcd_display_initial_info();
//  lv_init();
//  lv_port_disp_init();
//  lv_port_indev_init();
//  lv_example_style_10();
//#endif
  //lcd_clear(0x0841);
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

  dma_init_type dma_init_struct;
  crm_periph_clock_enable(CRM_DMA1_PERIPH_CLOCK, TRUE);
  dma_reset(LCD_SPI_MASTER_Tx_DMA_Channel);
  dma_init_struct.buffer_size = 0xFFFE;
  dma_init_struct.direction = DMA_DIR_MEMORY_TO_PERIPHERAL;
  dma_init_struct.memory_base_addr = (uint32_t)LCD_SPI_MASTER_DR_Base;
  dma_init_struct.memory_data_width = DMA_MEMORY_DATA_WIDTH_BYTE;
  dma_init_struct.memory_inc_enable = TRUE;
  dma_init_struct.peripheral_base_addr = (uint32_t)LCD_SPI_MASTER_DR_Base;
  dma_init_struct.peripheral_data_width = DMA_PERIPHERAL_DATA_WIDTH_BYTE;
  dma_init_struct.peripheral_inc_enable = FALSE;
  dma_init_struct.priority = DMA_PRIORITY_HIGH;
  dma_init_struct.loop_mode_enable = FALSE;
  dma_init(LCD_SPI_MASTER_Tx_DMA_Channel, &dma_init_struct);

  nvic_irq_enable(LCD_SPI_MASTER_Tx_DMA_IRQn, 1, 0);
  dma_interrupt_enable(LCD_SPI_MASTER_Tx_DMA_Channel,DMA_FDT_INT,TRUE);
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
