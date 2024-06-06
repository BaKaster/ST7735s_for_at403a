################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_1.c \
../include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_10.c \
../include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_11.c \
../include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_12.c \
../include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_13.c \
../include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_14.c \
../include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_15.c \
../include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_2.c \
../include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_3.c \
../include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_4.c \
../include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_5.c \
../include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_6.c \
../include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_7.c \
../include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_8.c \
../include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_9.c 

OBJS += \
./include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_1.o \
./include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_10.o \
./include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_11.o \
./include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_12.o \
./include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_13.o \
./include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_14.o \
./include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_15.o \
./include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_2.o \
./include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_3.o \
./include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_4.o \
./include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_5.o \
./include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_6.o \
./include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_7.o \
./include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_8.o \
./include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_9.o 

C_DEPS += \
./include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_1.d \
./include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_10.d \
./include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_11.d \
./include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_12.d \
./include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_13.d \
./include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_14.d \
./include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_15.d \
./include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_2.d \
./include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_3.d \
./include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_4.d \
./include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_5.d \
./include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_6.d \
./include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_7.d \
./include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_8.d \
./include/middlewares/3rd_party/lvgl/examples/styles/lv_example_style_9.d 


# Each subdirectory must supply rules for building sources it contributes
include/middlewares/3rd_party/lvgl/examples/styles/%.o: ../include/middlewares/3rd_party/lvgl/examples/styles/%.c include/middlewares/3rd_party/lvgl/examples/styles/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -ffunction-sections  -g -DAT_START_F403A_V1 -DAT32F403AVGT7 -DUSE_STDPERIPH_DRIVER -I"../include" -I"../include/libraries/drivers/inc" -I"../include/libraries/cmsis/cm4/core_support" -I"../include/libraries/cmsis/cm4/device_support" -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


