################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../include/middlewares/3rd_party/lvgl/tests/src/test_cases/_test_template.c \
../include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_arc.c \
../include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_bar.c \
../include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_checkbox.c \
../include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_config.c \
../include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_demo_stress.c \
../include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_demo_widgets.c \
../include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_dropdown.c \
../include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_event.c \
../include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_font_loader.c \
../include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_fs.c \
../include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_line.c \
../include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_mem.c \
../include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_obj_tree.c \
../include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_slider.c \
../include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_snapshot.c \
../include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_style.c \
../include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_switch.c \
../include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_table.c \
../include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_textarea.c \
../include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_txt.c 

OBJS += \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/_test_template.o \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_arc.o \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_bar.o \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_checkbox.o \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_config.o \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_demo_stress.o \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_demo_widgets.o \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_dropdown.o \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_event.o \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_font_loader.o \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_fs.o \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_line.o \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_mem.o \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_obj_tree.o \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_slider.o \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_snapshot.o \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_style.o \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_switch.o \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_table.o \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_textarea.o \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_txt.o 

C_DEPS += \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/_test_template.d \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_arc.d \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_bar.d \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_checkbox.d \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_config.d \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_demo_stress.d \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_demo_widgets.d \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_dropdown.d \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_event.d \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_font_loader.d \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_fs.d \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_line.d \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_mem.d \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_obj_tree.d \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_slider.d \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_snapshot.d \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_style.d \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_switch.d \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_table.d \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_textarea.d \
./include/middlewares/3rd_party/lvgl/tests/src/test_cases/test_txt.d 


# Each subdirectory must supply rules for building sources it contributes
include/middlewares/3rd_party/lvgl/tests/src/test_cases/%.o: ../include/middlewares/3rd_party/lvgl/tests/src/test_cases/%.c include/middlewares/3rd_party/lvgl/tests/src/test_cases/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -ffunction-sections  -g -DAT_START_F403A_V1 -DAT32F403AVGT7 -DUSE_STDPERIPH_DRIVER -I"../include" -I"../include/libraries/drivers/inc" -I"../include/libraries/cmsis/cm4/core_support" -I"../include/libraries/cmsis/cm4/device_support" -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


