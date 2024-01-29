from selenium import webdriver
from selenium.webdriver.common.by import By
import time

# Specify the YouTube video URL
youtube_url = "https://m.youtube.com/watch?v=dQw4w9WgXcQ&pp=ygUIcmlja3JvbGw%3D"

# Use the Chrome web browser (make sure chromedriver is in your PATH or specify its location)
driver = webdriver.Chrome()

# Open the YouTube video in fullscreen
driver.get(youtube_url)
time.sleep(5)  # Give the video some time to load

# Find the fullscreen button and click it
fullscreen_button = driver.find_element(By.CSS_SELECTOR, ".ytp-fullscreen-button")
fullscreen_button.click()

# Keep the browser window open for viewing
input("Press Enter to exit...")
driver.quit()
