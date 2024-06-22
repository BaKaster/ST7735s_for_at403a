#include "at32_video_ev_lcd.h"

extern const uint16_t city[];
extern const uint16_t geoscan_logo[];
extern const uint16_t info[];

typedef struct {
  uint8_t *data;
  int w;
  int h;
} Image;

extern Image background;
extern Image logo;
extern Image information;

