import getpass
from selenium import webdriver
from selenium.webdriver.common.by import By


def click_button(selector):
    buttun_element = chrome_browser.find_element(By.XPATH,selector)
    buttun_element.click()

def fill_edittext(selector,text):
    edittxt_element = chrome_browser.find_element(By.XPATH,selector)
    edittxt_element.send_keys(text)

def get_text(selector):
    txt_element= chrome_browser.find_element(By.XPATH,selector)
    return txt_element.text

def digikala_login(email,password):
    #login_button
    click_button('/html/body/header/div/div/div[2]/div[1]/div/a')
    #email_edittext
    fill_edittext('/html/body/main/div[2]/section/div[2]/form/div[4]/label/div[1]/input',email)
    #enter_button
    click_button('/html/body/main/div[2]/section/div[2]/form/button')
    #password_edittext
    fill_edittext('/html/body/main/div[2]/section/div/form/div[2]/div[3]/label/div/input',password)
    #continue_button
    click_button('/html/body/main/div[2]/section/div/form/button')
    #account_button
    click_button('/html/body/header/div/div/div[2]/div[1]/div/a')
    #user_name_elemet
    user_name=get_text('/html/body/header/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div[2]/p')
    return user_name


chrome_browser=webdriver.Chrome()
#chrome_browser.maximize_window()
chrome_browser.get('https://www.digikala.com')
# User's credentials
email = input("Enter your email or phone number: ")
password = getpass.getpass("Enter your password: ")
user_name = getpass.getpass("Enter your name: ")

usr_nm=digikala_login(email,password)
try:
    assert (user_name==usr_nm)
    print('passed!')
except Exception as e:
    print(e)
    print('failed!')
finally:
    chrome_browser.close()

 
