/**
  **************************************************************************
  * @file     lv_tick_custom.c
  * @version  v2.0.0
  * @date     2020-11-02
  * @brief    main interrupt service routines.
  **************************************************************************
  *                       Copyright notice & Disclaimer
  *
  * The software Board Support Package (BSP) that is made available to 
  * download from Artery official website is the copyrighted work of Artery. 
  * Artery authorizes customers to use, copy, and distribute the BSP 
  * software and its related documentation for the purpose of design and 
  * development in conjunction with Artery microcontrollers. Use of the 
  * software is governed by this copyright notice and the following disclaimer.
  *
  * THIS SOFTWARE IS PROVIDED ON "AS IS" BASIS WITHOUT WARRANTIES,
  * GUARANTEES OR REPRESENTATIONS OF ANY KIND. ARTERY EXPRESSLY DISCLAIMS,
  * TO THE FULLEST EXTENT PERMITTED BY LAW, ALL EXPRESS, IMPLIED OR
  * STATUTORY OR OTHER WARRANTIES, GUARANTEES OR REPRESENTATIONS,
  * INCLUDING BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY,
  * FITNESS FOR A PARTICULAR PURPOSE, OR NON-INFRINGEMENT.
  *
  **************************************************************************
  */

/* includes ------------------------------------------------------------------*/
#include "lv_tick_custom.h"
#include "at32f403a_407.h"

volatile static uint32_t system_ms = 0;

/**
  * @brief  get the systick by ms
  * @param  none
  * @retval ms
  */
uint32_t millis(void)
{
    return system_ms;
}

void tmr7_int_init(u16 arr, u16 psc)
{

  /* enable tmr7 clock */
  crm_periph_clock_enable(CRM_TMR4_PERIPH_CLOCK, TRUE);

  tmr_base_init(TMR4, arr, psc);
  tmr_cnt_dir_set(TMR4, TMR_COUNT_UP);
  tmr_interrupt_enable(TMR4, TMR_OVF_INT, TRUE);

  /* tmr1 overflow interrupt nvic init */
  nvic_priority_group_config(NVIC_PRIORITY_GROUP_0);
  nvic_irq_enable(TMR4_GLOBAL_IRQn, 1, 0);

  /* enable tmr7 */
  tmr_counter_enable(TMR4, TRUE);  
}
 
void TMR4_GLOBAL_IRQHandler(void)
{ 		  
  TMR4->ists = 0;; 
  system_ms++;  
}
