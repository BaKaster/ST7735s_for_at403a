################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../include/middlewares/3rd_party/lvgl/src/core/lv_disp.c \
../include/middlewares/3rd_party/lvgl/src/core/lv_event.c \
../include/middlewares/3rd_party/lvgl/src/core/lv_group.c \
../include/middlewares/3rd_party/lvgl/src/core/lv_indev.c \
../include/middlewares/3rd_party/lvgl/src/core/lv_indev_scroll.c \
../include/middlewares/3rd_party/lvgl/src/core/lv_obj.c \
../include/middlewares/3rd_party/lvgl/src/core/lv_obj_class.c \
../include/middlewares/3rd_party/lvgl/src/core/lv_obj_draw.c \
../include/middlewares/3rd_party/lvgl/src/core/lv_obj_pos.c \
../include/middlewares/3rd_party/lvgl/src/core/lv_obj_scroll.c \
../include/middlewares/3rd_party/lvgl/src/core/lv_obj_style.c \
../include/middlewares/3rd_party/lvgl/src/core/lv_obj_style_gen.c \
../include/middlewares/3rd_party/lvgl/src/core/lv_obj_tree.c \
../include/middlewares/3rd_party/lvgl/src/core/lv_refr.c \
../include/middlewares/3rd_party/lvgl/src/core/lv_theme.c 

OBJS += \
./include/middlewares/3rd_party/lvgl/src/core/lv_disp.o \
./include/middlewares/3rd_party/lvgl/src/core/lv_event.o \
./include/middlewares/3rd_party/lvgl/src/core/lv_group.o \
./include/middlewares/3rd_party/lvgl/src/core/lv_indev.o \
./include/middlewares/3rd_party/lvgl/src/core/lv_indev_scroll.o \
./include/middlewares/3rd_party/lvgl/src/core/lv_obj.o \
./include/middlewares/3rd_party/lvgl/src/core/lv_obj_class.o \
./include/middlewares/3rd_party/lvgl/src/core/lv_obj_draw.o \
./include/middlewares/3rd_party/lvgl/src/core/lv_obj_pos.o \
./include/middlewares/3rd_party/lvgl/src/core/lv_obj_scroll.o \
./include/middlewares/3rd_party/lvgl/src/core/lv_obj_style.o \
./include/middlewares/3rd_party/lvgl/src/core/lv_obj_style_gen.o \
./include/middlewares/3rd_party/lvgl/src/core/lv_obj_tree.o \
./include/middlewares/3rd_party/lvgl/src/core/lv_refr.o \
./include/middlewares/3rd_party/lvgl/src/core/lv_theme.o 

C_DEPS += \
./include/middlewares/3rd_party/lvgl/src/core/lv_disp.d \
./include/middlewares/3rd_party/lvgl/src/core/lv_event.d \
./include/middlewares/3rd_party/lvgl/src/core/lv_group.d \
./include/middlewares/3rd_party/lvgl/src/core/lv_indev.d \
./include/middlewares/3rd_party/lvgl/src/core/lv_indev_scroll.d \
./include/middlewares/3rd_party/lvgl/src/core/lv_obj.d \
./include/middlewares/3rd_party/lvgl/src/core/lv_obj_class.d \
./include/middlewares/3rd_party/lvgl/src/core/lv_obj_draw.d \
./include/middlewares/3rd_party/lvgl/src/core/lv_obj_pos.d \
./include/middlewares/3rd_party/lvgl/src/core/lv_obj_scroll.d \
./include/middlewares/3rd_party/lvgl/src/core/lv_obj_style.d \
./include/middlewares/3rd_party/lvgl/src/core/lv_obj_style_gen.d \
./include/middlewares/3rd_party/lvgl/src/core/lv_obj_tree.d \
./include/middlewares/3rd_party/lvgl/src/core/lv_refr.d \
./include/middlewares/3rd_party/lvgl/src/core/lv_theme.d 


# Each subdirectory must supply rules for building sources it contributes
include/middlewares/3rd_party/lvgl/src/core/%.o: ../include/middlewares/3rd_party/lvgl/src/core/%.c include/middlewares/3rd_party/lvgl/src/core/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -ffunction-sections  -g -DAT_START_F403A_V1 -DAT32F403AVGT7 -DUSE_STDPERIPH_DRIVER -I"../include" -I"../include/libraries/drivers/inc" -I"../include/libraries/cmsis/cm4/core_support" -I"../include/libraries/cmsis/cm4/device_support" -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


