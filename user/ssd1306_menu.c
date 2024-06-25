#include "ssd1306_menu.h"


MenuItem *current_menu;
MenuItem MainMenu[6];
MenuItem DisplayMenu[4];
MenuItem SettingsMenu[3];
uint8_t selected_item;
const int lcd_width = LCD_WIDTH;
const int lcd_height = LCD_HEIGHT;
SliderData brightness_data = {0, 100, 50};
SwitchData inversion_state = {false, L"Выкл."};

#define OFFSET 27
#define BUTTON_HEIGHT 23
const uint16_t SCROLL_BAR_HEIGHT = LCD_HEIGHT;
// Функция выхода из подменю
void Back_func() {
	  selected_item = current_menu->parent_num;
  current_menu = current_menu->parent;
  // Сбрасываем active_menu_item при выходе из подменю
  active_menu_item = NULL;
}
menu_y_offset = 0; // Global variable to store the offset
MenuItem* active_menu_item = NULL;


void display_status_bar() {
  lcd_draw_filled_round_rect(0, 0, 128, 21, 5, STATUS_BAR);

  // Вывод названия активного пункта меню или логотипа
  if (active_menu_item != NULL) {
    // Если есть активный пункт меню, выводим его название
    lcd_show_string(3, 5, 120, 100, &Montserrat_12, L">", WHITE);
    lcd_show_string(10, 5, 120, 100, &Montserrat_12, active_menu_item->name, WHITE);
  } else if (current_menu == MainMenu && current_menu->type != MENU_TYPE_FOLDER) {
    // Если в главном меню, выводим логотип
    st7735s_DrawBitmap(&Geoscan_logo, 3, 4);
  } else if (current_menu->parent != NULL) {
    // Если в подменю, выводим название родительского пункта
    lcd_show_string(3, 5, 120, 100, &Montserrat_12, L">", WHITE);
    lcd_show_string(10, 5, 120, 100, &Montserrat_12, current_menu->parent[current_menu->parent_num].name, WHITE);
  } else {
    // Иначе выводим название текущего меню
    lcd_show_string(3, 5, 120, 100, &Montserrat_12, L">", WHITE);
    lcd_show_string(10, 5, 120, 100, &Montserrat_12, current_menu->name, WHITE);
  }

  lcd_show_string(88, 5, 120, 100, &Montserrat_12, L"100%", WHITE);
}
// Функция для отображения одного пункта меню
inline void display_menu_item(MenuItem *item, uint8_t position, int start_item) {
	  int highlighted_item = position + start_item;
	  int y_pos = 25 + position * OFFSET + menu_y_offset; // Add the offset
	  int x_pos = 27;

	  // Проверяем тип текущего пункта меню
	  if (item->type == MENU_TYPE_SLIDER || item->type == MENU_TYPE_SWITCH) {
	    // Рисуем фон для слайдера (увеличенная высота)
	    lcd_draw_filled_round_rect(2, y_pos, 121, BUTTON_HEIGHT * 2, 7,(highlighted_item == selected_item) ? (isEditing ? 0x434E : BRIGHTED_SELECT) : BUTTONS);// Черный цвет при редактировании

	    if (highlighted_item == selected_item) {
	      lcd_draw_round_rect(2, y_pos, 121, BUTTON_HEIGHT * 2, 7, WHITE);
	    }
	    // Увеличиваем y_pos для следующего пункта
	    menu_y_offset += BUTTON_HEIGHT;
	  } else {
	    // Рисуем фон для обычного пункта меню
	    lcd_draw_filled_round_rect(2, y_pos, 121, BUTTON_HEIGHT, 7,
	                               (highlighted_item == selected_item) ? BRIGHTED_SELECT : BUTTONS);
	    if (highlighted_item == selected_item) {
	      lcd_draw_round_rect(2, y_pos, 121, BUTTON_HEIGHT, 7, WHITE);
	    }
	  }

  // Рисуем иконку (если есть)
  if (item->icon != NULL) {
    draw_transparent_png(item->icon, 4, y_pos + 1);
  }
  else {
	  x_pos=6;
  }

  // Выводим текст пункта меню (с учетом смещения)

  lcd_show_string(x_pos, y_pos + 5, 120, 100, &Montserrat_16, item->name, WHITE);
  // Отрисовка слайдера
  if (item->type == MENU_TYPE_SLIDER) {
    int slider_width = 112;
    int slider_x = 6;
    int slider_y = y_pos + 26;

    // Вычисление позиции ползунка с использованием float для точности
    int thumb_pos = slider_x + ((item->data.slider_data->current_value - item->data.slider_data->min_value) * slider_width) /
                     (item->data.slider_data->max_value - item->data.slider_data->min_value);

    // Ограничение thumb_pos, чтобы ползунок не выходил за границы слайдера
    thumb_pos = (thumb_pos < slider_x) ? slider_x : thumb_pos;
    thumb_pos = (thumb_pos > slider_x + slider_width) ? slider_x + slider_width : thumb_pos;
    int fill_width = thumb_pos - slider_x;

    lcd_draw_filled_round_rect(slider_x, slider_y, slider_width, 12, 3, WHITE);
    if (fill_width > 6) {
           lcd_draw_filled_round_rect(slider_x, slider_y, fill_width, 12, 3, GEOSCAN_COLOR);
       }

  }
  if (item->type == MENU_TYPE_SWITCH) {
      uint8_t slider_x = 6;
      uint8_t slider_y = y_pos + 22;

      if(item->data.switch_data->state)
      {
    	   lcd_draw_filled_round_rect(slider_x, slider_y, 36, 19, 7, GEOSCAN_COLOR); // Красный цвет
    	        lcd_fill_circle(slider_x + 26, slider_y + 9, 7, 0xDEDB);
    	        lcd_show_string(slider_x+40, slider_y + 5, 120, 100, &Montserrat_12, L"Вкл.", WHITE);

      }
      else {
              // Выключено: рисуем серый прямоугольник с кружком слева
              lcd_draw_filled_round_rect(slider_x, slider_y, 36, 19, 7, 0x8C51); // Серый цвет
              lcd_fill_circle(slider_x + 9, slider_y + 9, 7, 0xDEDB); // Кружок слева
  	        lcd_show_string(slider_x+40, slider_y + 5, 120, 100, &Montserrat_12, L"Выкл.", WHITE);
            }

    }
}
void display_scroll_bar(uint8_t total_items, uint8_t selected_item, uint8_t visible_items, bool scroll_on_hover) {
  // Вычисляем высоту одного элемента в полосе прокрутки
  uint16_t scroll_element_height = SCROLL_BAR_HEIGHT / total_items;
  uint16_t thumb_height = (SCROLL_BAR_HEIGHT * visible_items) / total_items;
  thumb_height = (thumb_height < 10) ? 10 : thumb_height;

  // Вычисляем позицию ползунка
  uint16_t scroll_y_position = 0;
  if (total_items > visible_items) {
    // Оптимизация: вычисляем позицию только если есть что скроллить
    if (scroll_on_hover) {
      // Логика для скролла при наведении
      if (selected_item >= visible_items) {
        scroll_y_position = scroll_element_height * (selected_item - visible_items + 1);

        // Ограничиваем scroll_y_position, чтобы ползунок не выходил за границы
        int16_t max_scroll_y = SCROLL_BAR_HEIGHT - thumb_height;
        scroll_y_position = (scroll_y_position > max_scroll_y) ? max_scroll_y : scroll_y_position;
      }
    } else {
      // Логика для скролла при изменении каждого пункта
      // Вычисляем, в какой части видимой области находится выбранный элемент
    	 float relative_position = (float)selected_item / (total_items - visible_items);

    	      // Вычисляем позицию ползунка на основе относительного положения
    	      scroll_y_position = (SCROLL_BAR_HEIGHT - thumb_height) * relative_position;

    	      // Ограничиваем scroll_y_position, чтобы ползунок не выходил за границы
    	      int16_t max_scroll_y = SCROLL_BAR_HEIGHT - thumb_height;
    	      scroll_y_position = (scroll_y_position > max_scroll_y) ? max_scroll_y : scroll_y_position;

    }

  }

  lcd_draw_filled_rectangle(126, 10, 128, SCROLL_BAR_HEIGHT, BUTTONS);
  lcd_draw_filled_rectangle(126, 10 + scroll_y_position, 128, thumb_height, 0x7BCF);
  display_status_bar();
}

void display_menu(MenuItem *menu, uint8_t selected_item) {
	lcd_clear(BACKGROUND);
  // Определение, находимся ли мы в главном меню


  int total_items = menu->child_count;
  int items_to_display = calculate_items_to_display(menu, total_items);
  // Определение начального пункта для отображения
  int start_item = selected_item - (items_to_display - 1);
  if (start_item < 0) {
    start_item = 0;
  } else if (start_item > total_items - items_to_display) {
    start_item = total_items - items_to_display;
  }
  menu_y_offset = 0;

  // Отображение индикатора выбранного пункта
  int indicator_position = selected_item - start_item;
    // Смещение индикатора для главного меню

  // Отображение пунктов меню
  for (int i = 0; i < items_to_display; i++) {
    if ((start_item + i) < total_items) {
      display_menu_item(&(menu[start_item + i]), i, start_item);
    }
  }
  display_scroll_bar(total_items, selected_item, items_to_display, 1);
//  lcd_draw_round_rect(2,25+ indicator_position*OFFSET, 121, 23, 7, WHITE);

	lcd_display_buffer();
}

inline int calculate_items_to_display(MenuItem *menu, int total_items) {
 int max_items = 5; // Начальное значение для обычных пунктов
 int current_height = 25; // Начальная высота (отступ сверху)

 for (int i = 0; i < total_items && current_height <= LCD_HEIGHT; i++) {
   if (menu[i].type == MENU_TYPE_SLIDER || menu[i].type == MENU_TYPE_SWITCH) {
     current_height += BUTTON_HEIGHT * 2; // Учитываем двойную высоту слайдера
   } else {
     current_height += BUTTON_HEIGHT;
   }
   if (current_height > LCD_HEIGHT) {
     max_items = i; // Запоминаем количество пунктов, которые поместились
     break;
   }
 }

 return max_items;
}


// Функция для инициализации меню
void menu_init() {
  // Инициализация подменю

	SettingsMenu[0] = (MenuItem){MENU_TYPE_ACTION, L"Назад", Back_func, NULL, MainMenu, 3, &Back, 2, NULL};
	SettingsMenu[1] = (MenuItem){MENU_TYPE_ACTION, L"Сеть", NULL, NULL, MainMenu, 3, &Network, 2, NULL};
	SettingsMenu[2] = (MenuItem){MENU_TYPE_FOLDER, L"Экран", NULL, DisplayMenu, MainMenu, 3, &Display, 2, NULL};

	DisplayMenu[0] = (MenuItem){MENU_TYPE_ACTION, L"Назад", Back_func, NULL, SettingsMenu, 4, &Back, 2, NULL};
	DisplayMenu[1] = (MenuItem){MENU_TYPE_SLIDER, L"Яркость:", Brightness_selected, NULL, SettingsMenu, 4, &Display, 2,  &brightness_data };
	DisplayMenu[2] = (MenuItem){MENU_TYPE_SWITCH, L"Инверсия:", color_inversion, NULL, SettingsMenu, 4, NULL, 2, &inversion_state};
	DisplayMenu[3] = (MenuItem){MENU_TYPE_ACTION, L"Таймер", NULL, NULL, SettingsMenu, 4, NULL, 2, NULL};
		  // Инициализация главного меню
	MainMenu[0] = (MenuItem){MENU_TYPE_ACTION, L"Сведения", Information, NULL, NULL, 6, &Info, 0, NULL};
	MainMenu[1] = (MenuItem){MENU_TYPE_ACTION, L"Режим сна", Screen_off, NULL, NULL, 6, &Power, 0};
	MainMenu[2] = (MenuItem){MENU_TYPE_FOLDER, L"Настройки", NULL, SettingsMenu, NULL, 6, &Settings, 0, NULL};
	MainMenu[3] = (MenuItem){MENU_TYPE_ACTION, L"Геоскан", Geoscan_logotype, NULL, NULL, 6, &Geoscan, 0, NULL};
	MainMenu[4] = (MenuItem){MENU_TYPE_ACTION, L"Ввод", input_number_handler, NULL, NULL, 6, &Input, 0, NULL};
	MainMenu[5] = (MenuItem){MENU_TYPE_ACTION, L"Функция", NULL, NULL, NULL, 6, &Function, 0, NULL};



  // Установка текущего меню на главное меню
  current_menu = MainMenu;
  selected_item = 0;

}

