################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../include/middlewares/3rd_party/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_alpha16.c \
../include/middlewares/3rd_party/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_argb.c \
../include/middlewares/3rd_party/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_chroma_keyed.c \
../include/middlewares/3rd_party/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_indexed16.c \
../include/middlewares/3rd_party/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_rgb.c \
../include/middlewares/3rd_party/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_rgb565a8.c \
../include/middlewares/3rd_party/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_12_compr_az.c.c \
../include/middlewares/3rd_party/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_16_compr_az.c.c \
../include/middlewares/3rd_party/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_28_compr_az.c.c 

OBJS += \
./include/middlewares/3rd_party/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_alpha16.o \
./include/middlewares/3rd_party/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_argb.o \
./include/middlewares/3rd_party/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_chroma_keyed.o \
./include/middlewares/3rd_party/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_indexed16.o \
./include/middlewares/3rd_party/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_rgb.o \
./include/middlewares/3rd_party/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_rgb565a8.o \
./include/middlewares/3rd_party/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_12_compr_az.c.o \
./include/middlewares/3rd_party/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_16_compr_az.c.o \
./include/middlewares/3rd_party/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_28_compr_az.c.o 

C_DEPS += \
./include/middlewares/3rd_party/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_alpha16.d \
./include/middlewares/3rd_party/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_argb.d \
./include/middlewares/3rd_party/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_chroma_keyed.d \
./include/middlewares/3rd_party/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_indexed16.d \
./include/middlewares/3rd_party/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_rgb.d \
./include/middlewares/3rd_party/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_rgb565a8.d \
./include/middlewares/3rd_party/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_12_compr_az.c.d \
./include/middlewares/3rd_party/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_16_compr_az.c.d \
./include/middlewares/3rd_party/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_28_compr_az.c.d 


# Each subdirectory must supply rules for building sources it contributes
include/middlewares/3rd_party/lvgl/demos/benchmark/assets/%.o: ../include/middlewares/3rd_party/lvgl/demos/benchmark/assets/%.c include/middlewares/3rd_party/lvgl/demos/benchmark/assets/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -ffunction-sections  -g -DAT_START_F403A_V1 -DAT32F403AVGT7 -DUSE_STDPERIPH_DRIVER -I"../include" -I"../include/libraries/drivers/inc" -I"../include/libraries/cmsis/cm4/core_support" -I"../include/libraries/cmsis/cm4/device_support" -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


