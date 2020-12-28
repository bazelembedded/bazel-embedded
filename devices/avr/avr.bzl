# MIT License
#
# Copyright (c) 2019 Nathaniel Brough
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

load("//devices:device_config.bzl", "device_config")

AVR_MCUS = [
    "at90pwm2b",
    "atmega88p",
    "atmega168a",
    "atmega3250pa",
    "attiny2313",
    "atmega6450",
    "attiny9",
    "attiny2313a",
    "attiny1616",
    "attiny261",
    "attiny414",
    "ata6285",
    "atmega3290p",
    "at90scr100",
    "ata6616c",
    "atmega16u2",
    "atmega644",
    "attiny13",
    "attiny816",
    "ata5795",
    "atxmega64b1",
    "atmega329p",
    "at90pwm1",
    "attiny461",
    "atmega64hve2",
    "atmega329pa",
    "atmega649a",
    "attiny1614",
    "atxmega128a1",
    "at90usb1287",
    "at90s2313",
    "atmega324pa",
    "at90pwm3",
    "ata5272",
    "atmega169a",
    "attiny45",
    "attiny22",
    "attiny5",
    "atmega128rfr2",
    "atmega64m1",
    "atmega3250a",
    "atxmega16d4",
    "atmega88a",
    "atxmega192a3",
    "ata8510",
    "ata5790n",
    "atmega8hva",
    "attiny3216",
    "ata664251",
    "atxmega64b3",
    "avrxmega4",
    "avr35",
    "at90s2323",
    "atmega169pa",
    "atmega168pa",
    "atxmega128a4u",
    "atmega162",
    "atmega324p",
    "atmega1280",
    "atmega128rfa1",
    "atmega8a",
    "atmega48pa",
    "avrxmega3",
    "atmega8",
    "atxmega64d4",
    "attiny48",
    "atmega325",
    "atmega32c1",
    "atmega16m1",
    "attiny3217",
    "atmega64hve",
    "atxmega32d3",
    "atmega16hvbrevb",
    "atmega328",
    "atmega16hva2",
    "atmega325a",
    "attiny4",
    "atmega1284",
    "atxmega192d3",
    "attiny84a",
    "at94k",
    "atmega8u2",
    "attiny1634",
    "at43usb355",
    "atxmega16e5",
    "attiny24",
    "atmega6490p",
    "attiny43u",
    "ata8210",
    "atxmega16c4",
    "attiny24a",
    "attiny20",
    "atmega2560",
    "atmega645",
    "atmega2561",
    "at76c711",
    "atxmega64a4u",
    "atmega16hva",
    "at90s4414",
    "at90usb647",
    "attiny87",
    "atmega32hvb",
    "at43usb320",
    "avr31",
    "avr4",
    "atxmega64a1",
    "atmega48",
    "atmega48a",
    "at90pwm161",
    "atxmega128b1",
    "avr6",
    "attiny828",
    "at86rf401",
    "atmega32a",
    "atmega16",
    "atxmega128b3",
    "atxmega64c3",
    "at90can64",
    "attiny461a",
    "at90s8535",
    "attiny40",
    "atmega2564rfr2",
    "atmega64a",
    "at90pwm3b",
    "atmega644a",
    "atxmega192c3",
    "attiny212",
    "attiny817",
    "atmega323",
    "at90s8515",
    "atmega164pa",
    "atmega8535",
    "atmega645p",
    "at90can128",
    "ata6286",
    "atmega6450p",
    "atxmega128d3",
    "atmega88pb",
    "atmega16u4",
    "atmega3290",
    "atxmega128a3",
    "avrxmega7",
    "at90usb162",
    "atmega645a",
    "atmega103",
    "atmega644rfr2",
    "at90s1200",
    "atmega328p",
    "atmega164p",
    "atxmega16a4u",
    "attiny214",
    "attiny861a",
    "at90usb646",
    "at90pwm2",
    "attiny4313",
    "avrxmega6",
    "attiny28",
    "atmega325p",
    "atmega169p",
    "atmega128a",
    "atmega16a",
    "attiny12",
    "avrxmega5",
    "atmega649p",
    "atxmega256a3",
    "atmega1284p",
    "atxmega32a4u",
    "attiny261a",
    "atmega329",
    "attiny1617",
    "atxmega384c3",
    "attiny85",
    "atxmega128a1u",
    "atmega6490a",
    "avr1",
    "atmega168p",
    "ata5702m322",
    "attiny814",
    "atmega32",
    "avr25",
    "ata5790",
    "attiny416",
    "attiny10",
    "avrxmega2",
    "ata6617c",
    "atmega32hvbrevb",
    "atmega644pa",
    "atxmega128a3u",
    "atmega16hvb",
    "atmega168",
    "atmega6450a",
    "atxmega256a3bu",
    "at90s2343",
    "atxmega8e5",
    "atmega64rfr2",
    "atmega169",
    "atxmega16a4",
    "attiny167",
    "atxmega384d3",
    "attiny26",
    "atmega88pa",
    "attiny441",
    "atmega32m1",
    "avr5",
    "atmega3290a",
    "ata5782",
    "at90s2333",
    "attiny861",
    "at90c8534",
    "atmega165",
    "attiny44a",
    "atmega64c1",
    "attiny11",
    "attiny25",
    "attiny3214",
    "avrtiny",
    "atxmega32c3",
    "attiny84",
    "m3000",
    "atxmega192a3u",
    "atmega6490",
    "atxmega32d4",
    "atmega32u4",
    "attiny412",
    "attiny88",
    "atmega406",
    "atmega165a",
    "atmega325pa",
    "atmega32u2",
    "atmega644p",
    "atxmega256d3",
    "atmega163",
    "atmega165pa",
    "atmega328pb",
    "atxmega64a1u",
    "attiny13a",
    "atxmega128c3",
    "ata5505",
    "ata5791",
    "atxmega256c3",
    "attiny417",
    "attiny44",
    "at90usb1286",
    "atmega88",
    "atmega32u6",
    "attiny15",
    "atmega3250p",
    "ata6289",
    "at90pwm316",
    "atmega161",
    "atmega324a",
    "atmega1281",
    "atmega168pb",
    "atmega48p",
    "atxmega64a3u",
    "atxmega256a3u",
    "atxmega64d3",
    "atxmega128d4",
    "at90s4434",
    "atxmega32a4",
    "atmega1284rfr2",
    "atxmega64a3",
    "ata6613c",
    "at90pwm216",
    "atmega640",
    "atmega128",
    "atxmega32c4",
    "ata6612c",
    "atmega164a",
    "atmega649",
    "at90can32",
    "atxmega256a3b",
    "atmega48pb",
    "atmega165p",
    "atmega256rfr2",
    "attiny841",
    "at90usb82",
    "avr2",
    "ata5831",
    "avr3",
    "atmega8515",
    "at90pwm81",
    "atmega3290pa",
    "avr51",
    "ata6614q",
    "atmega3250",
    "atxmega32e5",
    "atmega329a",
    "at90s4433",
    "atmega64",
]

AVR_CONFIGS = [device_config(
    arch = mcu,
    endain = "little",
    float_abi = "soft",
    fpu = "none",
) for mcu in AVR_MCUS]
