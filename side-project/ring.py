from selenium import webdriver
from selenium.webdriver.common.by import By
import time

# Specify the YouTube video URL
url = "https://www.google.com/android/find"

# Use the Chrome web browser (make sure chromedriver is in your PATH or specify its location)
driver = webdriver.Chrome()

# Open the YouTube video in fullscreen
driver.get(url)
time.sleep(50000)  # Give the video some time to load

# Find the fullscreen button and click it
ring_button = driver.find_element(By.CSS_SELECTOR, ".GLET6d")
ring_button.click()

# Keep the browser window open for viewing
input("Press Enter to exit...")
driver.quit()
