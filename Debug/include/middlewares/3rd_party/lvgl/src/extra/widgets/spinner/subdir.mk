################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../include/middlewares/3rd_party/lvgl/src/extra/widgets/spinner/lv_spinner.c 

OBJS += \
./include/middlewares/3rd_party/lvgl/src/extra/widgets/spinner/lv_spinner.o 

C_DEPS += \
./include/middlewares/3rd_party/lvgl/src/extra/widgets/spinner/lv_spinner.d 


# Each subdirectory must supply rules for building sources it contributes
include/middlewares/3rd_party/lvgl/src/extra/widgets/spinner/%.o: ../include/middlewares/3rd_party/lvgl/src/extra/widgets/spinner/%.c include/middlewares/3rd_party/lvgl/src/extra/widgets/spinner/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -ffunction-sections  -g -DAT_START_F403A_V1 -DAT32F403AVGT7 -DUSE_STDPERIPH_DRIVER -I"../include" -I"../include/libraries/drivers/inc" -I"../include/libraries/cmsis/cm4/core_support" -I"../include/libraries/cmsis/cm4/device_support" -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


