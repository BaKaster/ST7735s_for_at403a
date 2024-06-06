################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../include/middlewares/3rd_party/lvgl/src/draw/sw/lv_draw_sw.c \
../include/middlewares/3rd_party/lvgl/src/draw/sw/lv_draw_sw_arc.c \
../include/middlewares/3rd_party/lvgl/src/draw/sw/lv_draw_sw_blend.c \
../include/middlewares/3rd_party/lvgl/src/draw/sw/lv_draw_sw_dither.c \
../include/middlewares/3rd_party/lvgl/src/draw/sw/lv_draw_sw_gradient.c \
../include/middlewares/3rd_party/lvgl/src/draw/sw/lv_draw_sw_img.c \
../include/middlewares/3rd_party/lvgl/src/draw/sw/lv_draw_sw_layer.c \
../include/middlewares/3rd_party/lvgl/src/draw/sw/lv_draw_sw_letter.c \
../include/middlewares/3rd_party/lvgl/src/draw/sw/lv_draw_sw_line.c \
../include/middlewares/3rd_party/lvgl/src/draw/sw/lv_draw_sw_polygon.c \
../include/middlewares/3rd_party/lvgl/src/draw/sw/lv_draw_sw_rect.c \
../include/middlewares/3rd_party/lvgl/src/draw/sw/lv_draw_sw_transform.c 

OBJS += \
./include/middlewares/3rd_party/lvgl/src/draw/sw/lv_draw_sw.o \
./include/middlewares/3rd_party/lvgl/src/draw/sw/lv_draw_sw_arc.o \
./include/middlewares/3rd_party/lvgl/src/draw/sw/lv_draw_sw_blend.o \
./include/middlewares/3rd_party/lvgl/src/draw/sw/lv_draw_sw_dither.o \
./include/middlewares/3rd_party/lvgl/src/draw/sw/lv_draw_sw_gradient.o \
./include/middlewares/3rd_party/lvgl/src/draw/sw/lv_draw_sw_img.o \
./include/middlewares/3rd_party/lvgl/src/draw/sw/lv_draw_sw_layer.o \
./include/middlewares/3rd_party/lvgl/src/draw/sw/lv_draw_sw_letter.o \
./include/middlewares/3rd_party/lvgl/src/draw/sw/lv_draw_sw_line.o \
./include/middlewares/3rd_party/lvgl/src/draw/sw/lv_draw_sw_polygon.o \
./include/middlewares/3rd_party/lvgl/src/draw/sw/lv_draw_sw_rect.o \
./include/middlewares/3rd_party/lvgl/src/draw/sw/lv_draw_sw_transform.o 

C_DEPS += \
./include/middlewares/3rd_party/lvgl/src/draw/sw/lv_draw_sw.d \
./include/middlewares/3rd_party/lvgl/src/draw/sw/lv_draw_sw_arc.d \
./include/middlewares/3rd_party/lvgl/src/draw/sw/lv_draw_sw_blend.d \
./include/middlewares/3rd_party/lvgl/src/draw/sw/lv_draw_sw_dither.d \
./include/middlewares/3rd_party/lvgl/src/draw/sw/lv_draw_sw_gradient.d \
./include/middlewares/3rd_party/lvgl/src/draw/sw/lv_draw_sw_img.d \
./include/middlewares/3rd_party/lvgl/src/draw/sw/lv_draw_sw_layer.d \
./include/middlewares/3rd_party/lvgl/src/draw/sw/lv_draw_sw_letter.d \
./include/middlewares/3rd_party/lvgl/src/draw/sw/lv_draw_sw_line.d \
./include/middlewares/3rd_party/lvgl/src/draw/sw/lv_draw_sw_polygon.d \
./include/middlewares/3rd_party/lvgl/src/draw/sw/lv_draw_sw_rect.d \
./include/middlewares/3rd_party/lvgl/src/draw/sw/lv_draw_sw_transform.d 


# Each subdirectory must supply rules for building sources it contributes
include/middlewares/3rd_party/lvgl/src/draw/sw/%.o: ../include/middlewares/3rd_party/lvgl/src/draw/sw/%.c include/middlewares/3rd_party/lvgl/src/draw/sw/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -ffunction-sections  -g -DAT_START_F403A_V1 -DAT32F403AVGT7 -DUSE_STDPERIPH_DRIVER -I"../include" -I"../include/libraries/drivers/inc" -I"../include/libraries/cmsis/cm4/core_support" -I"../include/libraries/cmsis/cm4/device_support" -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


