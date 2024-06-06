################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../include/middlewares/3rd_party/lvgl/examples/widgets/keyboard/lv_example_keyboard_1.c 

OBJS += \
./include/middlewares/3rd_party/lvgl/examples/widgets/keyboard/lv_example_keyboard_1.o 

C_DEPS += \
./include/middlewares/3rd_party/lvgl/examples/widgets/keyboard/lv_example_keyboard_1.d 


# Each subdirectory must supply rules for building sources it contributes
include/middlewares/3rd_party/lvgl/examples/widgets/keyboard/%.o: ../include/middlewares/3rd_party/lvgl/examples/widgets/keyboard/%.c include/middlewares/3rd_party/lvgl/examples/widgets/keyboard/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -ffunction-sections  -g -DAT_START_F403A_V1 -DAT32F403AVGT7 -DUSE_STDPERIPH_DRIVER -I"../include" -I"../include/libraries/drivers/inc" -I"../include/libraries/cmsis/cm4/core_support" -I"../include/libraries/cmsis/cm4/device_support" -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


