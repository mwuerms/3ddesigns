/**************************************************************************
 This is an example for our Monochrome OLEDs based on SSD1306 drivers

 Pick one up today in the adafruit shop!
 ------> http://www.adafruit.com/category/63_98

 This example is for a 128x64 pixel display using SPI to communicate
 4 or 5 pins are required to interface.

 Adafruit invests time and resources providing this open
 source code, please support Adafruit and open-source
 hardware by purchasing products from Adafruit!

 Written by Limor Fried/Ladyada for Adafruit Industries,
 with contributions from the open source community.
 BSD license, check license.txt for more information
 All text above, and the splash screen below must be
 included in any redistribution.
 **************************************************************************/

#define SSD1306_NO_SPLASH

#include <SPI.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include <avr/wdt.h>
#include <avr/io.h>
#include <avr/power.h>
#include <avr/sleep.h>
#include <avr/interrupt.h>

#define SCREEN_WIDTH 128 // OLED display width, in pixels
#define SCREEN_HEIGHT 64 // OLED display height, in pixels

// Declaration for SSD1306 display connected using software SPI (default case):
#define OLED_MOSI  12
#define OLED_CLK   13
#define OLED_DC    10
#define OLED_CS    11
#define OLED_RESET 14
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT,
  OLED_MOSI, OLED_CLK, OLED_DC, OLED_RESET, OLED_CS);
  
#define VIBRA_PIN	2

/* Comment out above, uncomment this block to use hardware SPI
#define OLED_DC     6
#define OLED_CS     7
#define OLED_RESET  8
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT,
  &SPI, OLED_DC, OLED_RESET, OLED_CS);
*/

struct {
  uint8_t min, secs;
} clock_time;

void clock_DisplayText(char* text) {

  display.clearDisplay();

  display.setCursor(8,20);             // Start at top-left corner
  display.setTextSize(4);             // Draw 2X-scale text
  display.setTextColor(SSD1306_WHITE);
  
  display.print(text); 
  display.display();
}

void clock_DisplayTime(void) {

  char str[] = {0, 0, 0, 0, 0, 0, 0, 0};
  uint8_t x, pos = 0;
  if(clock_time.min < 10) {
    str[pos++] = '0';
    str[pos++] = clock_time.min + '0';
  }
  else {
    x = clock_time.min / 10;
    str[pos++] = x + '0';
    x = clock_time.min - (x * 10);
    str[pos++] = x + '0';
  }
  
  str[pos++] = ':';
  if(clock_time.secs < 10) {
    str[pos++] = '0';
    str[pos++] = clock_time.secs + '0';
  }
  else {
    x = clock_time.secs / 10;
    str[pos++] = x + '0';
    x = clock_time.secs - (x * 10);
    str[pos++] = x + '0';
  }

  clock_DisplayText(str);
}

#define clock_DisplayAlarm()  clock_DisplayText("ALARM")

uint8_t clock_CountDown(void) {
  if((clock_time.min == 0) && (clock_time.secs == 0)) {
    // done
    return(1);
  }
  if(clock_time.secs == 0) {
    clock_time.secs = 59;
    clock_time.min--;
  }
  else {
    clock_time.secs--;
  }
  return(0);
}

void clock_Start(void) {
  clock_time.min = 00;//10;
  clock_time.secs = 12;//00;
}

static volatile uint8_t wdt_timeout, wdt_event_flag;

/* - private functions ------------------------------------------------------ */
volatile uint8_t global_events;
#define fEV_TICK_TIMER     _BV(0)
#define fEV_ALARM_TIMER    _BV(1)
/**
 * stop wdtTimer
 */
static inline void wdtTimer_Stop(void) {
    WDTCSR = _BV(WDCE);
    WDTCSR = 0;
}

/**
 * watchdog ISR
 */
ISR(WDT_vect) {
    if(wdt_timeout == 0) {   // so "wdtTimer_StartTimeout(1, ...)" does result in delay of 1 and not 2 wdt periodes
        wdtTimer_Stop();
        global_events |= wdt_event_flag;
    }
    else {
        wdt_timeout--;
    }
}

/**
 * start the wdtTimer
 * @param   timeout     overall timeout = interval * timeout
 */
#define cEV_TIMER_INTERVAL_0_125S   3
void wdtTimer_StartTimeout(uint8_t timeout, uint8_t interval, uint8_t event_flag) {
    uint8_t sr;
    //lock_interrupt(sr);
    wdt_timeout = timeout;
    wdt_event_flag = event_flag;
    WDTCSR = (1 << WDCE) | (1 << WDIF);
    WDTCSR |= (interval & 0x07);
    WDTCSR |= (1 << WDIE);
    //restore_interrupt(sr);
}

/**
 * enter the given sleep mode, see avr/sleep.h
 * @param   mode    sleep modes:
 * translate: own defines to arv/sleep.h:
 * cSLEEP_MODE_... | SLEEP_MODE_...
 * cSLEEP_MODE_ACTIVE | none, do not enter this function
 * cSLEEP_MODE_IDLE | SLEEP_MODE_IDLE
 *  none | SLEEP_MODE_ADC
 * cSLEEP_MODE_POWER_DOWN | SLEEP_MODE_PWR_DOWN
 *  none | SLEEP_MODE_PWR_SAVE
 *  none | SLEEP_MODE_STANDBY
 *  none | SLEEP_MODE_EXT_STANDBY
 */
static void _EnterSleepMode(uint8_t mode) {
    set_sleep_mode(mode);
    sleep_enable();
    sei();
    sleep_cpu();    // enter sleep mode, wait here
    sleep_disable();
    cli();
}

void setup() {
  pinMode(VIBRA_PIN, OUTPUT);
  //Serial.begin(9600);

  // SSD1306_SWITCHCAPVCC = generate display voltage from 3.3V internally
  if(!display.begin(SSD1306_SWITCHCAPVCC)) {
    //Serial.println(F("SSD1306 allocation failed"));
    for(;;); // Don't proceed, loop forever
  }
  display.setRotation(0);


  // Show initial display buffer contents on the screen --
  // the library initializes this with an Adafruit splash screen.
  display.display();
  delay(2000); // Pause for 2 seconds

  // Clear the buffer
  display.clearDisplay();

  // Show the display buffer on the screen. You MUST call display() after
  // drawing commands to make them visible on screen!
  display.display();
  delay(2000);

  clock_Start();

  clock_DisplayTime();
  wdtTimer_StartTimeout(8*7, cEV_TIMER_INTERVAL_0_125S, fEV_TICK_TIMER);
  sei();
}

void loop() {
  uint8_t local_events = 0, tog;
  uint8_t alarm_cnt_down;
  
  while(1) {
    if(local_events & fEV_TICK_TIMER) {
      if(clock_CountDown()) {
        tog = 0;
        alarm_cnt_down = 10;//255;
        wdtTimer_StartTimeout(8, cEV_TIMER_INTERVAL_0_125S, fEV_ALARM_TIMER);
      }
      else {
        wdtTimer_StartTimeout(8*7, cEV_TIMER_INTERVAL_0_125S, fEV_TICK_TIMER);
      }
      clock_DisplayTime();
    }

    if(local_events & fEV_ALARM_TIMER) {
      if(tog == 0) {
        tog = 1;
        clock_DisplayAlarm();
        display.invertDisplay(false);
        digitalWrite(VIBRA_PIN, HIGH);
      }
      else {
        tog = 0;
        clock_DisplayAlarm();
        display.invertDisplay(true);
        digitalWrite(VIBRA_PIN, HIGH);
        if(alarm_cnt_down) {
	        alarm_cnt_down--;
        }
      }
	    if(alarm_cnt_down) {
	      wdtTimer_StartTimeout(8*7, cEV_TIMER_INTERVAL_0_125S, fEV_ALARM_TIMER);
      }
      else {
      	// done, no more alarm
      	digitalWrite(VIBRA_PIN, LOW);
      	display.clearDisplay();
        display.invertDisplay(false);
	      display.display();
      }
    }

    while(1) {
      cli();
      local_events = global_events;
      global_events = 0;
      if(local_events) {
          sei();
          break;
      }
      // Power-down mode + WDT enabled = 10 uA ? datasheet ATTiny85, p 162
      // measured 2021-03-22 ca. 6 uA, 20 °C, UNI-T, UT139C
      _EnterSleepMode(SLEEP_MODE_PWR_DOWN);
    }
  }
}
