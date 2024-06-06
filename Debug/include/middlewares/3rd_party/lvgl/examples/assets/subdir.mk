################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../include/middlewares/3rd_party/lvgl/examples/assets/animimg001.c \
../include/middlewares/3rd_party/lvgl/examples/assets/animimg002.c \
../include/middlewares/3rd_party/lvgl/examples/assets/animimg003.c \
../include/middlewares/3rd_party/lvgl/examples/assets/img_caret_down.c \
../include/middlewares/3rd_party/lvgl/examples/assets/img_cogwheel_alpha16.c \
../include/middlewares/3rd_party/lvgl/examples/assets/img_cogwheel_argb.c \
../include/middlewares/3rd_party/lvgl/examples/assets/img_cogwheel_chroma_keyed.c \
../include/middlewares/3rd_party/lvgl/examples/assets/img_cogwheel_indexed16.c \
../include/middlewares/3rd_party/lvgl/examples/assets/img_cogwheel_rgb.c \
../include/middlewares/3rd_party/lvgl/examples/assets/img_hand.c \
../include/middlewares/3rd_party/lvgl/examples/assets/img_skew_strip.c \
../include/middlewares/3rd_party/lvgl/examples/assets/img_star.c \
../include/middlewares/3rd_party/lvgl/examples/assets/imgbtn_left.c \
../include/middlewares/3rd_party/lvgl/examples/assets/imgbtn_mid.c \
../include/middlewares/3rd_party/lvgl/examples/assets/imgbtn_right.c 

OBJS += \
./include/middlewares/3rd_party/lvgl/examples/assets/animimg001.o \
./include/middlewares/3rd_party/lvgl/examples/assets/animimg002.o \
./include/middlewares/3rd_party/lvgl/examples/assets/animimg003.o \
./include/middlewares/3rd_party/lvgl/examples/assets/img_caret_down.o \
./include/middlewares/3rd_party/lvgl/examples/assets/img_cogwheel_alpha16.o \
./include/middlewares/3rd_party/lvgl/examples/assets/img_cogwheel_argb.o \
./include/middlewares/3rd_party/lvgl/examples/assets/img_cogwheel_chroma_keyed.o \
./include/middlewares/3rd_party/lvgl/examples/assets/img_cogwheel_indexed16.o \
./include/middlewares/3rd_party/lvgl/examples/assets/img_cogwheel_rgb.o \
./include/middlewares/3rd_party/lvgl/examples/assets/img_hand.o \
./include/middlewares/3rd_party/lvgl/examples/assets/img_skew_strip.o \
./include/middlewares/3rd_party/lvgl/examples/assets/img_star.o \
./include/middlewares/3rd_party/lvgl/examples/assets/imgbtn_left.o \
./include/middlewares/3rd_party/lvgl/examples/assets/imgbtn_mid.o \
./include/middlewares/3rd_party/lvgl/examples/assets/imgbtn_right.o 

C_DEPS += \
./include/middlewares/3rd_party/lvgl/examples/assets/animimg001.d \
./include/middlewares/3rd_party/lvgl/examples/assets/animimg002.d \
./include/middlewares/3rd_party/lvgl/examples/assets/animimg003.d \
./include/middlewares/3rd_party/lvgl/examples/assets/img_caret_down.d \
./include/middlewares/3rd_party/lvgl/examples/assets/img_cogwheel_alpha16.d \
./include/middlewares/3rd_party/lvgl/examples/assets/img_cogwheel_argb.d \
./include/middlewares/3rd_party/lvgl/examples/assets/img_cogwheel_chroma_keyed.d \
./include/middlewares/3rd_party/lvgl/examples/assets/img_cogwheel_indexed16.d \
./include/middlewares/3rd_party/lvgl/examples/assets/img_cogwheel_rgb.d \
./include/middlewares/3rd_party/lvgl/examples/assets/img_hand.d \
./include/middlewares/3rd_party/lvgl/examples/assets/img_skew_strip.d \
./include/middlewares/3rd_party/lvgl/examples/assets/img_star.d \
./include/middlewares/3rd_party/lvgl/examples/assets/imgbtn_left.d \
./include/middlewares/3rd_party/lvgl/examples/assets/imgbtn_mid.d \
./include/middlewares/3rd_party/lvgl/examples/assets/imgbtn_right.d 


# Each subdirectory must supply rules for building sources it contributes
include/middlewares/3rd_party/lvgl/examples/assets/%.o: ../include/middlewares/3rd_party/lvgl/examples/assets/%.c include/middlewares/3rd_party/lvgl/examples/assets/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -ffunction-sections  -g -DAT_START_F403A_V1 -DAT32F403AVGT7 -DUSE_STDPERIPH_DRIVER -I"../include" -I"../include/libraries/drivers/inc" -I"../include/libraries/cmsis/cm4/core_support" -I"../include/libraries/cmsis/cm4/device_support" -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


