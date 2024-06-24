#include "menu_functions.h"
#include "images.h"
#include "at32f403a_407_int.h"
#include "stdio.h"

#define ENCODER_MAX 128
#define SCROLL_THRESHOLD 4 // Порог срабатывания прокрутки

uint8_t temp_bright=111;
int32_t encoder_count = 0, temporary_encoder=0;
wchar_t value[25];
volatile bool functionRunning = false;
volatile bool button_pressed = false; // Объявите button_pressed с volatile
volatile bool isPlaying=false;
volatile ColorInversionState_t colorInversionState = COLOR_INVERSION_OFF;
uint32_t functionStartTime = 0; // Время запуска функции Battery
bool isInversed=false;
volatile bool isEditing = false;
int16_t entered_number=0;

void apply_changes()
{
	 flash_ee_data_read(0, &eeprom);
	 inversion_state.state=eeprom;
	 color_inversion(0);
	 flash_ee_data_read(1, &eeprom);
     brightness_data.current_value = eeprom;
	 flash_ee_data_read(2, &eeprom);
	 entered_number = eeprom;

}

wchar_t* display_up_time(wchar_t* up_time_str) {
    // Получаем текущее время в миллисекундах
    uint32_t current_time = get_millis();

    // Конвертируем время работы в часы, минуты и секунды
    uint32_t seconds = current_time / 1000;
    uint32_t minutes = seconds / 60;
    uint32_t hours = minutes / 60;
    seconds %= 60;
    minutes %= 60;

    // Формируем строку для отображения
    swprintf(up_time_str,20, L"%02lu:%02lu:%02lu", hours, minutes, seconds);

    return up_time_str;
}

// Вызовите эту функцию в основном цикле или там, где обновляется информация на экране.


void Screen_off()
{

	functionStartTime = get_millis(); // Запоминаем время запуска функции
		functionRunning=true;

		lcd_clear(BLACK);
		lcd_display_buffer();
		while(functionRunning)
		{


			if(functionRunning==false)
					{
						break;
					}
		}
}
void Geoscan_logotype(uint8_t selected_digit)
{
	functionStartTime = get_millis(); // Запоминаем время запуска функции
	functionRunning=true;
    active_menu_item = &current_menu[selected_item];
	lcd_clear(BACKGROUND);
	display_status_bar();

	uint8_t colorSteps = 20; // Number of steps in the transition
		uint8_t redStart = 0;   // Starting red value (0 in RGB565)
		uint8_t redEnd = 31;   // Ending red value (31 in RGB565)
		uint8_t blueStart = 31; // Starting blue value (31 in RGB565)
		uint8_t blueEnd = 0;   // Ending blue value (0 in RGB565)
		uint8_t green = 0;  // Green color is fixed

		uint16_t color = 0;


	while(functionRunning)
	{
		// Blue to Red transition
				for (int i = 0; i < colorSteps; i++) {
					float progress = (float)i / (colorSteps - 1);
					uint8_t currentRed = (uint8_t)(redStart + progress * (redEnd - redStart));
					uint8_t currentBlue = (uint8_t)(blueStart + progress * (blueEnd - blueStart));

					// Calculate color using currentRed and currentBlue
					color = ((currentRed << 11) | (green << 5) | currentBlue);

					// Left large line
						lcd_draw_line(21, 132, 60, 35, color);
						lcd_draw_line(22, 133, 61, 36, color); // Shift right and down

						// Right large line
						lcd_draw_line(60, 35, 108, 132, color);
						lcd_draw_line(61, 35, 109, 132, color); // Shift right and down

						// Top line
						lcd_draw_line(63, 114, 20, 132, color);
						lcd_draw_line(63, 115, 21, 133, color); // Shift right and down

						// Bottom line
						lcd_draw_line(63, 114, 108, 132, color);
						lcd_draw_line(63, 115, 108, 133, color); // Shift right and down
					   delay_unblocked(5000);
					lcd_display_buffer();

				}

				// Red to Blue transition (reverse)
				for (int i = 0; i < colorSteps; i++) {
					float progress = (float)i / (colorSteps - 1);
					uint8_t currentRed = (uint8_t)(redEnd - progress * (redEnd - redStart));
					uint8_t currentBlue = (uint8_t)(blueEnd + progress * (blueStart - blueEnd));

					// Calculate color using currentRed and currentBlue
					color = ((currentRed << 11) | (green << 5) | currentBlue);

		// Increase size and move down
		// Left large line
		lcd_draw_line(21, 132, 60, 35, color);
		lcd_draw_line(22, 133, 61, 36, color); // Shift right and down

		// Right large line
		lcd_draw_line(60, 35, 108, 132, color);
		lcd_draw_line(61, 35, 109, 132, color); // Shift right and down

		// Top line
		lcd_draw_line(63, 114, 20, 132, color);
		lcd_draw_line(63, 115, 21, 133, color); // Shift right and down

		// Bottom line
		lcd_draw_line(63, 114, 108, 132, color);
		lcd_draw_line(63, 115, 108, 133, color); // Shift right and down



		if(functionRunning==false)
		{
			break;
		}
   delay_unblocked(5000);
		lcd_display_buffer();

		// Delay to control transition speed
	}

	active_menu_item = NULL;
}
}

#define MAX_INPUT_DIGITS 10

wchar_t input_number[MAX_INPUT_DIGITS + 1] = {0};
uint8_t input_length = 0;
int32_t encoder_position = 0; // Текущая позиция энкодера

#define TOTAL_OPTIONS 12 // Общее количество опций, включая цифры и кнопки "Clear" и "Apply"

// Массив координат X для каждой кнопки
const uint8_t button_positions[TOTAL_OPTIONS][2] = {
    {21, 69},  // Кнопка "1"
    {58, 69},  // Кнопка "2"
    {95, 69},  // Кнопка "3"
    {21, 91},  // Кнопка "4"
    {58, 91},  // Кнопка "5"
    {95, 91},  // Кнопка "6"
    {21, 114},  // Кнопка "7"
    {58, 114}, // Кнопка "8"
    {95, 114}, // Кнопка "9"
    {21, 137},   // Кнопка "Clear"
    {58, 137},   // Кнопка "0"
    {95, 137},  // Кнопка "Apply"
};


void display_input_interface(uint8_t selected_digit) {
	   uint8_t rectangle_width = 35;
	    uint8_t rectangle_height = 18;
	    uint8_t y_offset=0;
if(lcd_height==128)
{    uint8_t rectangle_height = 15;
uint8_t y_offset=4;}
    // Очистка экрана
		lcd_clear(BACKGROUND);
	   	display_status_bar();
		lcd_draw_filled_round_rect(2, 23, 121, 135, 7, BUTTONS);
		lcd_draw_filled_round_rect(6, 62, 113, 93, 7, BRIGHTED_SELECT);
		lcd_draw_filled_round_rect(6, 26, 113, 28, 7, BRIGHTED_SELECT);
    // Отображение цифр и кнопок "Clear" и "Apply"
    wchar_t* buttons[TOTAL_OPTIONS] = {L"1", L"2", L"3", L"4", L"5", L"6", L"7", L"8", L"9", L"Очистить", L"0", L"OK"};
    for (uint8_t i = 0; i < TOTAL_OPTIONS; i++) {

    		lcd_draw_filled_round_rect( button_positions[i][0]-13, button_positions[i][1]-4-y_offset, rectangle_width, rectangle_height,5, 0x2124);
    		if(i==9)
    		    	    	{
    			  draw_transparent_png(&Clear, button_positions[i][0]-8, button_positions[i][1]-4-y_offset);
    		    	    	}
    		else if(i==11)
    	    	{
        lcd_show_string(button_positions[i][0]-8, button_positions[i][1]-1-y_offset, 120, 100, &Montserrat_16, buttons[i], WHITE);
    	    	}
    	else { lcd_show_string(button_positions[i][0], button_positions[i][1]-y_offset, 120, 100, &Montserrat_16, buttons[i], WHITE);}
    }

    // Подсветка выбранного числа или кнопки
    lcd_draw_round_rect(button_positions[selected_digit][0]-13, button_positions[selected_digit][1]-4-y_offset, rectangle_width, rectangle_height,5, WHITE);
    lcd_show_string(10, 36, 120, 100, &Montserrat_16, input_number, WHITE);
	lcd_display_buffer();
}


void input_number_handler(uint8_t selected_item) {
	functionStartTime = get_millis(); // Запоминаем время запуска функции
	    uint8_t selected_digit = encoder_position % 12; // 10 цифр + 2 кнопки
	    bool input_complete = false;
	    functionRunning=true;
	    active_menu_item = &current_menu[selected_item];
	    display_input_interface(selected_digit);

    float accumulated_delta = 0; // Накопительное значение для изменений encoder_delta
  while (!input_complete) {
    // Чтение значения энкодера и обработка переполнения
	   // Обработка вращения энкодера
	           encoder_handler(false);

	           // Накапливаем изменения encoder_delta
	           accumulated_delta += encoder_delta;
	           encoder_delta = 0; // Сбрасываем encoder_delta после обновления позиции

	           // Проверяем, достигло ли накопленное значение порога
	           if (fabs(accumulated_delta) >= SCROLL_THRESHOLD) {
	               // Обновляем encoder_position, учитывая порог
	               encoder_position += (int)(accumulated_delta / SCROLL_THRESHOLD);
	               accumulated_delta -= (int)(accumulated_delta / SCROLL_THRESHOLD) * SCROLL_THRESHOLD; // Уменьшаем накопленное значение на количество "шагов"

	               selected_digit = abs(encoder_position) % 12; // Обновление выбранного числа
	               display_input_interface(selected_digit); // Обновление интерфейса без нажатия кнопки
	           }

    // Обработка нажатия кнопки
	           if (!functionRunning) {
	                    if (selected_digit < 9) {
	                        // Добавление цифры к введенному числу
	                        if (input_length < MAX_INPUT_DIGITS) {
	                            input_number[input_length++] = '0' + selected_digit+1;
	                            input_number[input_length] = '\0'; // Обновление строки
	                            display_input_interface(selected_digit); // Обновление интерфейса после ввода числа
	                        }
	                    } else if (selected_digit == 9) {
	                        // Очистка последней цифры
	                    	 if (input_length > 0) {
	                    	                    input_number[--input_length] = '\0'; // Удаление последнего символа
	                    	                    display_input_interface(selected_digit); // Обновление интерфейса п
	                        }
	                    } else if (selected_digit == 10) {
	                        // Добавление цифры к введенному числу
	                        if (input_length < MAX_INPUT_DIGITS) {
	                            input_number[input_length++] = '0' + 0;
	                            input_number[input_length] = '\0'; // Обновление строки
	                            display_input_interface(selected_digit); // Обновление интерфейса после ввода числа
	                        }}
	                        else if (selected_digit == 11) {
	                        // Завершение ввода
	                        input_complete = true;
	                    }

	                    // Сброс флага нажатия кнопки
	                    functionRunning = true;
	                }
	            }

  // Преобразование и сохранение числа
  entered_number = wcstol(input_number, NULL, 10);
  flash_ee_data_write(2, entered_number);
  // ... (ваш код для сохранения entered_number)
  active_menu_item = NULL;
  return;
}

void color_inversion(uint8_t selected_item) {
	functionStartTime = get_millis(); // Запоминаем время запуска функции
        // Обработка вращения энкодера
            switch (inversion_state.state) {
                case true:
                	lcd_wr_reg(0x20);
                    break;
                case false:
                	lcd_wr_reg(0x21);
                    break;
            }
            flash_ee_data_write(0, inversion_state.state);
            inversion_state.state= !inversion_state.state;
}

void Information() {
    functionRunning = true;
    functionStartTime = get_millis();
    uint16_t start_encoder = tmr_counter_value_get(TMR2);
    int block_width = 113;
    int block_height = 31;
    int block_spacing = 2;
    int x_pos = 6;
    int y_pos = 26;
    int max_visible_blocks =4;
    if(lcd_height == 128){max_visible_blocks = 3;} // Максимальное количество видимых блоков
    active_menu_item = &current_menu[selected_item];
    wchar_t up_time_str[20], output[40], inversion_str[40];

    InfoItem info_items[] = {
        {.info_name = L"Имя:", .data_type = DATA_TYPE_WCHART, .data.wchart_val = L"ST7735S (128x160)"},
        {.info_name = L"Время с запуска:", .data_type = DATA_TYPE_WCHART, .data.wchart_val = up_time_str},
        {.info_name = L"Яркость:", .data_type = DATA_TYPE_UINT16, .data.uint16_val = brightness_data.current_value},
        {.info_name = L"Инверсия:", .data_type = DATA_TYPE_BOOL, .data.bool_val = inversion_state.state},
        // Добавьте больше элементов, чтобы проверить прокрутку
       {.info_name = L"Введено:", .data_type = DATA_TYPE_UINT16, .data.uint16_val = entered_number},
		{.info_name = L"Геоскан топ?", .data_type = DATA_TYPE_WCHART, .data.wchart_val = L"Разумеется"},
    };
    int num_info_items = sizeof(info_items) / sizeof(info_items[0]);
    lcd_clear(BACKGROUND);
    display_status_bar();
    while (functionRunning) {
        display_up_time(up_time_str);
        lcd_draw_filled_round_rect(2, 23, 121, 135, 7, BUTTONS);

        // Обработка вращения энкодера
        encoder_handler(false); // Передаем false, так как не нужно обновлять меню
        // Ограничиваем selected_item в пределах количества элементов
        if (selected_item < 0) {
            selected_item = 0;
        } else if (selected_item > num_info_items - 1) {
            selected_item = num_info_items - 1;
        }

        // Отображение блоков с учетом selected_item
        int start_item = selected_item; // Элемент, с которого начинается отображение
        if (start_item > num_info_items - max_visible_blocks) {
            start_item = num_info_items - max_visible_blocks;
        }
        display_scroll_bar(num_info_items, selected_item, 4, 0);
        for (int i = start_item; i < start_item + max_visible_blocks && i < num_info_items; i++) {
            y_pos = 26 + (i - start_item) * (block_height + block_spacing);

            lcd_draw_filled_round_rect(x_pos, y_pos, block_width, block_height, 7, 0x4A49);
            lcd_show_string(x_pos + 5, y_pos + 3, 120, 100, &Montserrat_12, info_items[i].info_name, WHITE);

            switch (info_items[i].data_type) {
                case DATA_TYPE_WCHART:
                    lcd_show_string(x_pos + 5, y_pos + 17, 120, 100, &Montserrat_12, info_items[i].data.wchart_val, WHITE);
                    break;
                case DATA_TYPE_UINT16:
                    swprintf(output, 10, L"%u", info_items[i].data.uint16_val);
                    lcd_show_string(x_pos + 5, y_pos + 17, 120, 100, &Montserrat_12, output, WHITE);
                    break;
                case DATA_TYPE_BOOL:
                    wcscpy(inversion_str, info_items[i].data.bool_val ? L"Включено" : L"Выключено");
                    lcd_show_string(x_pos + 5, y_pos + 17, 120, 100, &Montserrat_12, inversion_str, WHITE);
                    break;
            }
        }

        lcd_display_buffer();

        if (functionRunning == false) {
        	tmr_counter_value_set(TMR2, start_encoder);
            break;
        }
    }
    active_menu_item = NULL;
}


void Brightness_selected(uint8_t selected_item) {
	functionRunning=true;
	isEditing = true;
    active_menu_item = &current_menu[selected_item];
    display_menu(current_menu, selected_item);
		functionStartTime = get_millis();
  uint16_t start_encoder = tmr_counter_value_get(TMR2);
  uint16_t last_encoder = start_encoder;
  // Включаем режим редактирования
  uint8_t scroll_threshold = 1;
  int16_t encoder_delta = 0;
  // Цикл редактирования
  while (functionRunning) {
    // Считываем текущее значение энкодера
    uint16_t current_encoder = tmr_counter_value_get(TMR2);

    // Обработка переполнения энкодера
    int16_t diff = current_encoder - last_encoder;
    if (diff > ENCODER_MAX / 2) {
        diff = diff - ENCODER_MAX;
    } else if (diff < -ENCODER_MAX / 2) {
        diff = diff + ENCODER_MAX;
    }
    last_encoder = current_encoder;
    encoder_delta += diff;

    // Изменение значения яркости
    if (abs(encoder_delta) >= scroll_threshold) {
      brightness_data.current_value += encoder_delta / scroll_threshold;
      encoder_delta = 0; // Сбрасываем дельту

      // Ограничиваем значение яркости от 0 до 100
      if (brightness_data.current_value < brightness_data.min_value) {
        brightness_data.current_value = brightness_data.min_value;
      } else if (brightness_data.current_value > brightness_data.max_value) {
        brightness_data.current_value = brightness_data.max_value;
      }

      // Обновляем дисплей с новым значением яркости
      display_menu(current_menu, selected_item);

      // Применяем яркость (здесь нужно вызвать вашу функцию установки яркости)
      // set_brightness(brightness_data.current_value);
    }

    // Проверка нажатия кнопки для подтверждения
    if(functionRunning==false) {
    	isEditing = false;
    	tmr_counter_value_set(TMR2, start_encoder);
        flash_ee_data_write(1,  brightness_data.current_value);
      // Выходим из режима редактирования
    	break;
    }
  }
  active_menu_item = NULL;
}


