################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../include/middlewares/3rd_party/lvgl/src/hal/lv_hal_disp.c \
../include/middlewares/3rd_party/lvgl/src/hal/lv_hal_indev.c \
../include/middlewares/3rd_party/lvgl/src/hal/lv_hal_tick.c 

OBJS += \
./include/middlewares/3rd_party/lvgl/src/hal/lv_hal_disp.o \
./include/middlewares/3rd_party/lvgl/src/hal/lv_hal_indev.o \
./include/middlewares/3rd_party/lvgl/src/hal/lv_hal_tick.o 

C_DEPS += \
./include/middlewares/3rd_party/lvgl/src/hal/lv_hal_disp.d \
./include/middlewares/3rd_party/lvgl/src/hal/lv_hal_indev.d \
./include/middlewares/3rd_party/lvgl/src/hal/lv_hal_tick.d 


# Each subdirectory must supply rules for building sources it contributes
include/middlewares/3rd_party/lvgl/src/hal/%.o: ../include/middlewares/3rd_party/lvgl/src/hal/%.c include/middlewares/3rd_party/lvgl/src/hal/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -ffunction-sections  -g -DAT_START_F403A_V1 -DAT32F403AVGT7 -DUSE_STDPERIPH_DRIVER -I"../include" -I"../include/libraries/drivers/inc" -I"../include/libraries/cmsis/cm4/core_support" -I"../include/libraries/cmsis/cm4/device_support" -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


