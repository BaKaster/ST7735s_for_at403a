################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../include/middlewares/3rd_party/lvgl/src/draw/lv_draw.c \
../include/middlewares/3rd_party/lvgl/src/draw/lv_draw_arc.c \
../include/middlewares/3rd_party/lvgl/src/draw/lv_draw_img.c \
../include/middlewares/3rd_party/lvgl/src/draw/lv_draw_label.c \
../include/middlewares/3rd_party/lvgl/src/draw/lv_draw_layer.c \
../include/middlewares/3rd_party/lvgl/src/draw/lv_draw_line.c \
../include/middlewares/3rd_party/lvgl/src/draw/lv_draw_mask.c \
../include/middlewares/3rd_party/lvgl/src/draw/lv_draw_rect.c \
../include/middlewares/3rd_party/lvgl/src/draw/lv_draw_transform.c \
../include/middlewares/3rd_party/lvgl/src/draw/lv_draw_triangle.c \
../include/middlewares/3rd_party/lvgl/src/draw/lv_img_buf.c \
../include/middlewares/3rd_party/lvgl/src/draw/lv_img_cache.c \
../include/middlewares/3rd_party/lvgl/src/draw/lv_img_decoder.c 

OBJS += \
./include/middlewares/3rd_party/lvgl/src/draw/lv_draw.o \
./include/middlewares/3rd_party/lvgl/src/draw/lv_draw_arc.o \
./include/middlewares/3rd_party/lvgl/src/draw/lv_draw_img.o \
./include/middlewares/3rd_party/lvgl/src/draw/lv_draw_label.o \
./include/middlewares/3rd_party/lvgl/src/draw/lv_draw_layer.o \
./include/middlewares/3rd_party/lvgl/src/draw/lv_draw_line.o \
./include/middlewares/3rd_party/lvgl/src/draw/lv_draw_mask.o \
./include/middlewares/3rd_party/lvgl/src/draw/lv_draw_rect.o \
./include/middlewares/3rd_party/lvgl/src/draw/lv_draw_transform.o \
./include/middlewares/3rd_party/lvgl/src/draw/lv_draw_triangle.o \
./include/middlewares/3rd_party/lvgl/src/draw/lv_img_buf.o \
./include/middlewares/3rd_party/lvgl/src/draw/lv_img_cache.o \
./include/middlewares/3rd_party/lvgl/src/draw/lv_img_decoder.o 

C_DEPS += \
./include/middlewares/3rd_party/lvgl/src/draw/lv_draw.d \
./include/middlewares/3rd_party/lvgl/src/draw/lv_draw_arc.d \
./include/middlewares/3rd_party/lvgl/src/draw/lv_draw_img.d \
./include/middlewares/3rd_party/lvgl/src/draw/lv_draw_label.d \
./include/middlewares/3rd_party/lvgl/src/draw/lv_draw_layer.d \
./include/middlewares/3rd_party/lvgl/src/draw/lv_draw_line.d \
./include/middlewares/3rd_party/lvgl/src/draw/lv_draw_mask.d \
./include/middlewares/3rd_party/lvgl/src/draw/lv_draw_rect.d \
./include/middlewares/3rd_party/lvgl/src/draw/lv_draw_transform.d \
./include/middlewares/3rd_party/lvgl/src/draw/lv_draw_triangle.d \
./include/middlewares/3rd_party/lvgl/src/draw/lv_img_buf.d \
./include/middlewares/3rd_party/lvgl/src/draw/lv_img_cache.d \
./include/middlewares/3rd_party/lvgl/src/draw/lv_img_decoder.d 


# Each subdirectory must supply rules for building sources it contributes
include/middlewares/3rd_party/lvgl/src/draw/%.o: ../include/middlewares/3rd_party/lvgl/src/draw/%.c include/middlewares/3rd_party/lvgl/src/draw/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -ffunction-sections  -g -DAT_START_F403A_V1 -DAT32F403AVGT7 -DUSE_STDPERIPH_DRIVER -I"../include" -I"../include/libraries/drivers/inc" -I"../include/libraries/cmsis/cm4/core_support" -I"../include/libraries/cmsis/cm4/device_support" -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


