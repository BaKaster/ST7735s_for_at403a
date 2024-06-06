################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl.c \
../include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_arc.c \
../include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_bg.c \
../include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_composite.c \
../include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_img.c \
../include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_label.c \
../include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_layer.c \
../include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_line.c \
../include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_mask.c \
../include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_polygon.c \
../include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_rect.c \
../include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_stack_blur.c \
../include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_texture_cache.c \
../include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_utils.c 

OBJS += \
./include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl.o \
./include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_arc.o \
./include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_bg.o \
./include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_composite.o \
./include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_img.o \
./include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_label.o \
./include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_layer.o \
./include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_line.o \
./include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_mask.o \
./include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_polygon.o \
./include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_rect.o \
./include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_stack_blur.o \
./include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_texture_cache.o \
./include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_utils.o 

C_DEPS += \
./include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl.d \
./include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_arc.d \
./include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_bg.d \
./include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_composite.d \
./include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_img.d \
./include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_label.d \
./include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_layer.d \
./include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_line.d \
./include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_mask.d \
./include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_polygon.d \
./include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_rect.d \
./include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_stack_blur.d \
./include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_texture_cache.d \
./include/middlewares/3rd_party/lvgl/src/draw/sdl/lv_draw_sdl_utils.d 


# Each subdirectory must supply rules for building sources it contributes
include/middlewares/3rd_party/lvgl/src/draw/sdl/%.o: ../include/middlewares/3rd_party/lvgl/src/draw/sdl/%.c include/middlewares/3rd_party/lvgl/src/draw/sdl/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -ffunction-sections  -g -DAT_START_F403A_V1 -DAT32F403AVGT7 -DUSE_STDPERIPH_DRIVER -I"../include" -I"../include/libraries/drivers/inc" -I"../include/libraries/cmsis/cm4/core_support" -I"../include/libraries/cmsis/cm4/device_support" -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


