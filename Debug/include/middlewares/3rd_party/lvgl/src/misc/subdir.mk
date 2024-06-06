################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../include/middlewares/3rd_party/lvgl/src/misc/lv_anim.c \
../include/middlewares/3rd_party/lvgl/src/misc/lv_anim_timeline.c \
../include/middlewares/3rd_party/lvgl/src/misc/lv_area.c \
../include/middlewares/3rd_party/lvgl/src/misc/lv_async.c \
../include/middlewares/3rd_party/lvgl/src/misc/lv_bidi.c \
../include/middlewares/3rd_party/lvgl/src/misc/lv_color.c \
../include/middlewares/3rd_party/lvgl/src/misc/lv_fs.c \
../include/middlewares/3rd_party/lvgl/src/misc/lv_gc.c \
../include/middlewares/3rd_party/lvgl/src/misc/lv_ll.c \
../include/middlewares/3rd_party/lvgl/src/misc/lv_log.c \
../include/middlewares/3rd_party/lvgl/src/misc/lv_lru.c \
../include/middlewares/3rd_party/lvgl/src/misc/lv_math.c \
../include/middlewares/3rd_party/lvgl/src/misc/lv_mem.c \
../include/middlewares/3rd_party/lvgl/src/misc/lv_printf.c \
../include/middlewares/3rd_party/lvgl/src/misc/lv_style.c \
../include/middlewares/3rd_party/lvgl/src/misc/lv_style_gen.c \
../include/middlewares/3rd_party/lvgl/src/misc/lv_templ.c \
../include/middlewares/3rd_party/lvgl/src/misc/lv_timer.c \
../include/middlewares/3rd_party/lvgl/src/misc/lv_tlsf.c \
../include/middlewares/3rd_party/lvgl/src/misc/lv_txt.c \
../include/middlewares/3rd_party/lvgl/src/misc/lv_txt_ap.c \
../include/middlewares/3rd_party/lvgl/src/misc/lv_utils.c 

OBJS += \
./include/middlewares/3rd_party/lvgl/src/misc/lv_anim.o \
./include/middlewares/3rd_party/lvgl/src/misc/lv_anim_timeline.o \
./include/middlewares/3rd_party/lvgl/src/misc/lv_area.o \
./include/middlewares/3rd_party/lvgl/src/misc/lv_async.o \
./include/middlewares/3rd_party/lvgl/src/misc/lv_bidi.o \
./include/middlewares/3rd_party/lvgl/src/misc/lv_color.o \
./include/middlewares/3rd_party/lvgl/src/misc/lv_fs.o \
./include/middlewares/3rd_party/lvgl/src/misc/lv_gc.o \
./include/middlewares/3rd_party/lvgl/src/misc/lv_ll.o \
./include/middlewares/3rd_party/lvgl/src/misc/lv_log.o \
./include/middlewares/3rd_party/lvgl/src/misc/lv_lru.o \
./include/middlewares/3rd_party/lvgl/src/misc/lv_math.o \
./include/middlewares/3rd_party/lvgl/src/misc/lv_mem.o \
./include/middlewares/3rd_party/lvgl/src/misc/lv_printf.o \
./include/middlewares/3rd_party/lvgl/src/misc/lv_style.o \
./include/middlewares/3rd_party/lvgl/src/misc/lv_style_gen.o \
./include/middlewares/3rd_party/lvgl/src/misc/lv_templ.o \
./include/middlewares/3rd_party/lvgl/src/misc/lv_timer.o \
./include/middlewares/3rd_party/lvgl/src/misc/lv_tlsf.o \
./include/middlewares/3rd_party/lvgl/src/misc/lv_txt.o \
./include/middlewares/3rd_party/lvgl/src/misc/lv_txt_ap.o \
./include/middlewares/3rd_party/lvgl/src/misc/lv_utils.o 

C_DEPS += \
./include/middlewares/3rd_party/lvgl/src/misc/lv_anim.d \
./include/middlewares/3rd_party/lvgl/src/misc/lv_anim_timeline.d \
./include/middlewares/3rd_party/lvgl/src/misc/lv_area.d \
./include/middlewares/3rd_party/lvgl/src/misc/lv_async.d \
./include/middlewares/3rd_party/lvgl/src/misc/lv_bidi.d \
./include/middlewares/3rd_party/lvgl/src/misc/lv_color.d \
./include/middlewares/3rd_party/lvgl/src/misc/lv_fs.d \
./include/middlewares/3rd_party/lvgl/src/misc/lv_gc.d \
./include/middlewares/3rd_party/lvgl/src/misc/lv_ll.d \
./include/middlewares/3rd_party/lvgl/src/misc/lv_log.d \
./include/middlewares/3rd_party/lvgl/src/misc/lv_lru.d \
./include/middlewares/3rd_party/lvgl/src/misc/lv_math.d \
./include/middlewares/3rd_party/lvgl/src/misc/lv_mem.d \
./include/middlewares/3rd_party/lvgl/src/misc/lv_printf.d \
./include/middlewares/3rd_party/lvgl/src/misc/lv_style.d \
./include/middlewares/3rd_party/lvgl/src/misc/lv_style_gen.d \
./include/middlewares/3rd_party/lvgl/src/misc/lv_templ.d \
./include/middlewares/3rd_party/lvgl/src/misc/lv_timer.d \
./include/middlewares/3rd_party/lvgl/src/misc/lv_tlsf.d \
./include/middlewares/3rd_party/lvgl/src/misc/lv_txt.d \
./include/middlewares/3rd_party/lvgl/src/misc/lv_txt_ap.d \
./include/middlewares/3rd_party/lvgl/src/misc/lv_utils.d 


# Each subdirectory must supply rules for building sources it contributes
include/middlewares/3rd_party/lvgl/src/misc/%.o: ../include/middlewares/3rd_party/lvgl/src/misc/%.c include/middlewares/3rd_party/lvgl/src/misc/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -ffunction-sections  -g -DAT_START_F403A_V1 -DAT32F403AVGT7 -DUSE_STDPERIPH_DRIVER -I"../include" -I"../include/libraries/drivers/inc" -I"../include/libraries/cmsis/cm4/core_support" -I"../include/libraries/cmsis/cm4/device_support" -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


