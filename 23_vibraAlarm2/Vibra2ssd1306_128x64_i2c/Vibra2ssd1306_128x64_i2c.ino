/**************************************************************************
 This is an example for our Monochrome OLEDs based on SSD1306 drivers

 Pick one up today in the adafruit shop!
 ------> http://www.adafruit.com/category/63_98

 This example is for a 128x64 pixel display using I2C to communicate
 3 pins are required to interface (two I2C and one reset).

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

// Declaration for an SSD1306 display connected to I2C (SDA, SCL pins)
// The pins for I2C are defined by the Wire-library. 
// On an arduino UNO:       A4(SDA), A5(SCL)
// On an arduino MEGA 2560: 20(SDA), 21(SCL)
// On an arduino LEONARDO:   2(SDA),  3(SCL), ...
#define OLED_RESET     4 // Reset pin # (or -1 if sharing Arduino reset pin)
#define SCREEN_ADDRESS 0x3c//0x3D ///< See datasheet for Address; 0x3D for 128x64, 0x3C for 128x32
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);


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

#define clock_DisplayAlarm()  clock_DisplayText((char *)"ALARM")

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

uint8_t clock_CheckAlarm(uint8_t amin, uint8_t asec) {
	if((clock_time.min == amin) && (clock_time.secs == asec))
		return(1);
	return(0);
}

void clock_Start(void) {
  clock_time.min = 15;//20;
  clock_time.secs = 00;//00;
}

static volatile uint8_t wdt_timeout, wdt_event_flag;

/* - private functions ------------------------------------------------------ */
volatile uint8_t global_events;
#define fEV_TIMER_READY    _BV(0)
#define fEV_TIMER_SET      _BV(1)
#define fEV_TIMER_GO       _BV(2)
#define fEV_TIMER_TICK     _BV(3)
#define fEV_TIMER_ALARM1   _BV(4)
#define fEV_TIMER_ALARM2   _BV(5)
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

void setup(void) {
  pinMode(8, OUTPUT);
  digitalWrite(8, LOW);
  pinMode(9, OUTPUT);
  digitalWrite(9, LOW);
  //Serial.begin(9600);

  // SSD1306_SWITCHCAPVCC = generate display voltage from 3.3V internally
  if(!display.begin(SSD1306_SWITCHCAPVCC, SCREEN_ADDRESS)) {
    //Serial.println(F("SSD1306 allocation failed"));
    for(;;); // Don't proceed, loop forever
  }
  display.setRotation(0);


  // Show initial display buffer contents on the screen --
  // the library initializes this with an Adafruit splash screen.
  display.display();
  delay(1000); // Pause for 2 seconds

  // Clear the buffer
  display.clearDisplay();

  // Show the display buffer on the screen. You MUST call display() after
  // drawing commands to make them visible on screen!
  display.display();
  delay(1000);

  clock_Start();

  clock_DisplayText((char *)"READY");
  wdtTimer_StartTimeout(8*10, cEV_TIMER_INTERVAL_0_125S, fEV_TIMER_READY);
  sei();
}

void loop(void) {
  uint8_t local_events = 0;
  uint8_t alarm1_cnt_down = 0;
  uint8_t alarm2_cnt_down = 0;
  uint8_t vibra_step = 0;
  
  while(1) {  
	if(local_events & fEV_TIMER_READY) {
		clock_DisplayText((char *)" SET ");
		wdtTimer_StartTimeout(8*10, cEV_TIMER_INTERVAL_0_125S, fEV_TIMER_SET);
	}
	
	if(local_events & fEV_TIMER_SET) {
		clock_DisplayText((char *)" GO!");
		wdtTimer_StartTimeout(8*10, cEV_TIMER_INTERVAL_0_125S, fEV_TIMER_GO);
	}
	
	if(local_events & fEV_TIMER_GO) {
		clock_DisplayTime();
		wdtTimer_StartTimeout(8*7, cEV_TIMER_INTERVAL_0_125S, fEV_TIMER_TICK);
	}
	
    if(local_events & fEV_TIMER_TICK) {
		if(clock_CheckAlarm(5, 0)) {
			alarm1_cnt_down = 4;
			vibra_step = 0;
			wdtTimer_StartTimeout(8*7, cEV_TIMER_INTERVAL_0_125S, fEV_TIMER_TICK);
		}
		else if(clock_CheckAlarm(0, 0)) {
			alarm2_cnt_down = 10;
			vibra_step = 0;
			global_events |= fEV_TIMER_ALARM2;
		}
		else {
			wdtTimer_StartTimeout(8*7, cEV_TIMER_INTERVAL_0_125S, fEV_TIMER_TICK);
		}
		if(alarm1_cnt_down) {
			global_events |= fEV_TIMER_ALARM1;
		}
		clock_CountDown();
		clock_DisplayTime();
    }

    if(local_events & fEV_TIMER_ALARM1) {
		if(alarm1_cnt_down) {
			//wdtTimer_StartTimeout(8*7, cEV_TIMER_INTERVAL_0_125S, fEV_TIMER_ALARM1);
			
			if(vibra_step == 0) {
				vibra_step = 1;
				display.invertDisplay(true);
				digitalWrite(8, HIGH);
				digitalWrite(9, LOW);
			}
			else if(vibra_step == 1) {
				vibra_step = 2;
				display.invertDisplay(false);
				digitalWrite(8, HIGH);
				digitalWrite(9, HIGH);
			}
			else if(vibra_step == 2) {
				vibra_step = 3;
				display.invertDisplay(true);
				digitalWrite(8, LOW);
				digitalWrite(9, HIGH);
			}
			else { // if(vibra_step == 3) {
				alarm1_cnt_down--;
				vibra_step = 0;
				display.invertDisplay(false);
				digitalWrite(8, LOW);
				digitalWrite(9, LOW);
			}
		}
		else {
			digitalWrite(8, LOW);
			digitalWrite(9, LOW);
			display.invertDisplay(false);
		}
	}
		
	if(local_events & fEV_TIMER_ALARM2) {
		if(alarm2_cnt_down) {
			clock_DisplayAlarm();
			wdtTimer_StartTimeout(8*7, cEV_TIMER_INTERVAL_0_125S, fEV_TIMER_ALARM2);
			
			if(vibra_step == 0) {
				vibra_step = 1;
				display.invertDisplay(true);
				digitalWrite(8, HIGH);
				digitalWrite(9, LOW);
			}
			else if(vibra_step == 1) {
				vibra_step = 2;
				display.invertDisplay(false);
				digitalWrite(8, HIGH);
				digitalWrite(9, HIGH);
			}
			else if(vibra_step == 2) {
				vibra_step = 3;
				display.invertDisplay(true);
				digitalWrite(8, LOW);
				digitalWrite(9, HIGH);
			}
			else { // if(vibra_step == 3) {
				alarm2_cnt_down--;
				vibra_step = 0;
				display.invertDisplay(false);
				digitalWrite(8, LOW);
				digitalWrite(9, LOW);
			}
		}
		else {
			digitalWrite(8, LOW);
			digitalWrite(9, LOW);
			display.invertDisplay(false);
			display.clearDisplay();
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
