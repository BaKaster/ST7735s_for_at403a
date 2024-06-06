################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../include/middlewares/3rd_party/lvgl/src/draw/nxp/vglite/lv_draw_vglite.c \
../include/middlewares/3rd_party/lvgl/src/draw/nxp/vglite/lv_draw_vglite_arc.c \
../include/middlewares/3rd_party/lvgl/src/draw/nxp/vglite/lv_draw_vglite_blend.c \
../include/middlewares/3rd_party/lvgl/src/draw/nxp/vglite/lv_draw_vglite_line.c \
../include/middlewares/3rd_party/lvgl/src/draw/nxp/vglite/lv_draw_vglite_rect.c \
../include/middlewares/3rd_party/lvgl/src/draw/nxp/vglite/lv_vglite_buf.c \
../include/middlewares/3rd_party/lvgl/src/draw/nxp/vglite/lv_vglite_utils.c 

OBJS += \
./include/middlewares/3rd_party/lvgl/src/draw/nxp/vglite/lv_draw_vglite.o \
./include/middlewares/3rd_party/lvgl/src/draw/nxp/vglite/lv_draw_vglite_arc.o \
./include/middlewares/3rd_party/lvgl/src/draw/nxp/vglite/lv_draw_vglite_blend.o \
./include/middlewares/3rd_party/lvgl/src/draw/nxp/vglite/lv_draw_vglite_line.o \
./include/middlewares/3rd_party/lvgl/src/draw/nxp/vglite/lv_draw_vglite_rect.o \
./include/middlewares/3rd_party/lvgl/src/draw/nxp/vglite/lv_vglite_buf.o \
./include/middlewares/3rd_party/lvgl/src/draw/nxp/vglite/lv_vglite_utils.o 

C_DEPS += \
./include/middlewares/3rd_party/lvgl/src/draw/nxp/vglite/lv_draw_vglite.d \
./include/middlewares/3rd_party/lvgl/src/draw/nxp/vglite/lv_draw_vglite_arc.d \
./include/middlewares/3rd_party/lvgl/src/draw/nxp/vglite/lv_draw_vglite_blend.d \
./include/middlewares/3rd_party/lvgl/src/draw/nxp/vglite/lv_draw_vglite_line.d \
./include/middlewares/3rd_party/lvgl/src/draw/nxp/vglite/lv_draw_vglite_rect.d \
./include/middlewares/3rd_party/lvgl/src/draw/nxp/vglite/lv_vglite_buf.d \
./include/middlewares/3rd_party/lvgl/src/draw/nxp/vglite/lv_vglite_utils.d 


# Each subdirectory must supply rules for building sources it contributes
include/middlewares/3rd_party/lvgl/src/draw/nxp/vglite/%.o: ../include/middlewares/3rd_party/lvgl/src/draw/nxp/vglite/%.c include/middlewares/3rd_party/lvgl/src/draw/nxp/vglite/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -ffunction-sections  -g -DAT_START_F403A_V1 -DAT32F403AVGT7 -DUSE_STDPERIPH_DRIVER -I"../include" -I"../include/libraries/drivers/inc" -I"../include/libraries/cmsis/cm4/core_support" -I"../include/libraries/cmsis/cm4/device_support" -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


