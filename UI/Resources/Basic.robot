***Settings***
Documentation  a collection of basic keywords 
Library  SeleniumLibrary
Resource  variables.robot 

***Variables***
${name}  فاطمه بخشی
${digikala_url}  https://www.digikala.com
${login_button}  //div[contains(text(),'ورود')]
${email_phone_edittext}  name:username
${password_edittext}  name:password
${submit_button_1}  //div[contains(text(),'ورود')]
${submit_button_2}  //div[contains(text(),'تایید')]
${profile_button}  //*[@id="base_layout_desktop_fixed_header"]/header/div/div/div/div[2]/div[1]/div[1]/div[2]
${profile_info_element}  //*[@id="base_layout_desktop_fixed_header"]/header/div/div/div/div[2]/div[1]/div[2]/a/div/div[2]/span



***Keywords***
Open Page
    [Documentation]  open browser
    Set Selenium Speed  ${SPEED}
    Set Selenium Timeout  ${TIMEOUT}
    Open Browser  ${digikala_url}  ${BROWSER}
    Maximize Browser Window

Login   
    [Documentation]  login
    Wait For Element  ${login_button}
    Click Element  ${login_button} 
    Wait For Element  ${email_phone_edittext}
    Input Text  ${email_phone_edittext}  ${USERNAME}
    Click Element  ${submit_button_1}
    Wait For Element  ${password_edittext}
    Input Text  ${password_edittext}  ${PASSWORD}
    Click Element  ${submit_button_2}
    Wait For Element  ${profile_button}
    Click Element  ${profile_button}
    Element Should Contain  ${profile_info_element}  ${name} 
    
Scroll To Element
    [Documentation]  javascript scroller
    [Arguments]  ${locator}
    ${x}=        Get Horizontal Position  ${locator}
    ${y}=        Get Vertical Position    ${locator}
    Execute Javascript  window.scrollTo(${x}, ${y})

Wait For Element
    [Documentation]  all typed of waits
    [Arguments]  ${locator}
    Wait Until Page Contains Element  ${locator}
    Wait Until Element Is Visible  ${locator}
    Wait Until Element Is Enabled  ${locator}

Go Back
    [Documentation]  go back
    Execute Javascript  history.back()