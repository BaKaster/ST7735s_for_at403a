################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../include/middlewares/3rd_party/lvgl/src/widgets/lv_arc.c \
../include/middlewares/3rd_party/lvgl/src/widgets/lv_bar.c \
../include/middlewares/3rd_party/lvgl/src/widgets/lv_btn.c \
../include/middlewares/3rd_party/lvgl/src/widgets/lv_btnmatrix.c \
../include/middlewares/3rd_party/lvgl/src/widgets/lv_canvas.c \
../include/middlewares/3rd_party/lvgl/src/widgets/lv_checkbox.c \
../include/middlewares/3rd_party/lvgl/src/widgets/lv_dropdown.c \
../include/middlewares/3rd_party/lvgl/src/widgets/lv_img.c \
../include/middlewares/3rd_party/lvgl/src/widgets/lv_label.c \
../include/middlewares/3rd_party/lvgl/src/widgets/lv_line.c \
../include/middlewares/3rd_party/lvgl/src/widgets/lv_objx_templ.c \
../include/middlewares/3rd_party/lvgl/src/widgets/lv_roller.c \
../include/middlewares/3rd_party/lvgl/src/widgets/lv_slider.c \
../include/middlewares/3rd_party/lvgl/src/widgets/lv_switch.c \
../include/middlewares/3rd_party/lvgl/src/widgets/lv_table.c \
../include/middlewares/3rd_party/lvgl/src/widgets/lv_textarea.c 

OBJS += \
./include/middlewares/3rd_party/lvgl/src/widgets/lv_arc.o \
./include/middlewares/3rd_party/lvgl/src/widgets/lv_bar.o \
./include/middlewares/3rd_party/lvgl/src/widgets/lv_btn.o \
./include/middlewares/3rd_party/lvgl/src/widgets/lv_btnmatrix.o \
./include/middlewares/3rd_party/lvgl/src/widgets/lv_canvas.o \
./include/middlewares/3rd_party/lvgl/src/widgets/lv_checkbox.o \
./include/middlewares/3rd_party/lvgl/src/widgets/lv_dropdown.o \
./include/middlewares/3rd_party/lvgl/src/widgets/lv_img.o \
./include/middlewares/3rd_party/lvgl/src/widgets/lv_label.o \
./include/middlewares/3rd_party/lvgl/src/widgets/lv_line.o \
./include/middlewares/3rd_party/lvgl/src/widgets/lv_objx_templ.o \
./include/middlewares/3rd_party/lvgl/src/widgets/lv_roller.o \
./include/middlewares/3rd_party/lvgl/src/widgets/lv_slider.o \
./include/middlewares/3rd_party/lvgl/src/widgets/lv_switch.o \
./include/middlewares/3rd_party/lvgl/src/widgets/lv_table.o \
./include/middlewares/3rd_party/lvgl/src/widgets/lv_textarea.o 

C_DEPS += \
./include/middlewares/3rd_party/lvgl/src/widgets/lv_arc.d \
./include/middlewares/3rd_party/lvgl/src/widgets/lv_bar.d \
./include/middlewares/3rd_party/lvgl/src/widgets/lv_btn.d \
./include/middlewares/3rd_party/lvgl/src/widgets/lv_btnmatrix.d \
./include/middlewares/3rd_party/lvgl/src/widgets/lv_canvas.d \
./include/middlewares/3rd_party/lvgl/src/widgets/lv_checkbox.d \
./include/middlewares/3rd_party/lvgl/src/widgets/lv_dropdown.d \
./include/middlewares/3rd_party/lvgl/src/widgets/lv_img.d \
./include/middlewares/3rd_party/lvgl/src/widgets/lv_label.d \
./include/middlewares/3rd_party/lvgl/src/widgets/lv_line.d \
./include/middlewares/3rd_party/lvgl/src/widgets/lv_objx_templ.d \
./include/middlewares/3rd_party/lvgl/src/widgets/lv_roller.d \
./include/middlewares/3rd_party/lvgl/src/widgets/lv_slider.d \
./include/middlewares/3rd_party/lvgl/src/widgets/lv_switch.d \
./include/middlewares/3rd_party/lvgl/src/widgets/lv_table.d \
./include/middlewares/3rd_party/lvgl/src/widgets/lv_textarea.d 


# Each subdirectory must supply rules for building sources it contributes
include/middlewares/3rd_party/lvgl/src/widgets/%.o: ../include/middlewares/3rd_party/lvgl/src/widgets/%.c include/middlewares/3rd_party/lvgl/src/widgets/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -ffunction-sections  -g -DAT_START_F403A_V1 -DAT32F403AVGT7 -DUSE_STDPERIPH_DRIVER -I"../include" -I"../include/libraries/drivers/inc" -I"../include/libraries/cmsis/cm4/core_support" -I"../include/libraries/cmsis/cm4/device_support" -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


