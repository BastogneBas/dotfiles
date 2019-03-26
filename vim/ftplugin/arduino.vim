filetype off
autocmd BufNewFile,BufReadPost *.c,*.cpp,*.h,*.ino,*.pde set filetype=cpp

Plug 'w0rp/ale'
let g:ale_linters = {
	\ 'cpp': ['clang-format']
	\ }
let g:ale_fixers = {
	\ 'cpp' : ['g++']
	\}
let g:ale_cpp_gcc_executable='/home/bas/arduino/hardware/tools/avr/bin/avr-g++'
let g:ale_cpp_gcc_options='-x c++
	\ -include Arduino.h
	\ -MMD
	\ -c
	\ -D__PROG_TYPES_COMPAT__
	\ -mmcu=atmega328p
	\ -DF_CPU=16000000L
	\ -DARDUINO=188
	\ -DARDUINO_ARCH_AVR
	\ -I/home/bas/arduino/hardware/arduino/avr/cores/arduino
	\ -I/home/bas/arduino/hardware/arduino/avr/variants/standard
	\ -I/home/bas/sketchbook/libraries/FreeRTOS/src
	\ -Wall
	\ -ffunction-sections
	\ -fdata-sections
	\ -Os
	\ -fpermissive
	\ -fno-exceptions
	\ -std=gnu++11
	\ -fno-threadsafe-statics
	\ -flto
	\ -fno-devirtualize
	\ -fdiagnostics-color=always
	\'
set path+=~/arduino/hardware/arduino/avr/cores/arduino
