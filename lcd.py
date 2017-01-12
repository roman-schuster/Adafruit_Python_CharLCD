#!/usr/bin/python
# Example using a character LCD connected to a Raspberry Pi or BeagleBone Black.
import time

import Adafruit_CharLCD as LCD
from googlefinance import getQuotes

# Raspberry Pi pin configuration:
lcd_rs        = 25
lcd_en        = 24
lcd_d4        = 23
lcd_d5        = 17
lcd_d6        = 21
lcd_d7        = 22

# Define LCD column and row size for 16x2 LCD.
lcd_columns = 16
lcd_rows    = 2

# Initialize the LCD using the pins above.
lcd = LCD.Adafruit_CharLCD(lcd_rs, lcd_en, lcd_d4, lcd_d5, lcd_d6, lcd_d7,
                           lcd_columns, lcd_rows)

# Print a two line message
#lcd.message('It works! Now look\nlook @ cute bear')

# Wait 5 seconds
#time.sleep(5.0)

# Demo showing the cursor.
#lcd.clear()
#lcd.show_cursor(True)
#lcd.message('Show cursor')

#time.sleep(5.0)

# Demo showing the blinking cursor.
#lcd.clear()
#lcd.blink(True)
#lcd.message('Blink cursor')

#time.sleep(5.0)

# Stop blinking and showing cursor.
#lcd.show_cursor(False)
#lcd.blink(False)

# Demo scrolling message right/left.
#lcd.clear()
#message = 'Scroll'
#lcd.message(message)
#for i in range(lcd_columns-len(message)):
#    time.sleep(0.5)
#    lcd.move_right()
#for i in range(lcd_columns-len(message)):
#    time.sleep(0.5)
#    lcd.move_left()


# Change message.
lcd.clear()
tickers = ['AAPL', 'GS', 'DB', 'GORO']

while True:
    for ticker in tickers:
        lcd.clear()
        json = getQuotes(ticker)[0]
        price = json['LastTradePrice']
        myTime = json['LastTradeTime']
        msg = ticker + ': ' + price + '\nat ' + myTime
        lcd.message(msg)
        time.sleep(2.0)

