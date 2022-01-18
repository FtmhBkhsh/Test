***Settings***
Documentation  a collection of basic keywords
Library  SeleniumLibrary
Resource  Variables.robot 

***Variables***
${name}  فاطمه بخشی
${google_search_url}  https://www.google.com/search?q=digikala
${first_element_in_google_results}  css:div#rso>div:nth-child(1)>div>div>div>div>div>div>div.yuRUbf>a>h3
${login_button}  class:c-header__btn-login
${email_phone_edittext}  name:login[email_phone]
${password_edittext}  name:login[password]
${submit_button}  css:button[type='submit']
${profile_button}  class:c-header__btn-profile
${profile_info_element}  class:c-header__profile-dropdown-user-info


***Keywords***
Open Page
    Set Selenium Speed  ${SPEED}
    Set Selenium Timeout  ${TIMEOUT}
    Open Browser  ${google_search_url}  ${BROWSER}
    Maximize Browser Window

Login   
    Wait For Element  ${first_element_in_google_results}
    Click Element  ${first_element_in_google_results}
    Wait For Element  ${login_button}
    Click Element  ${login_button} 
    Wait For Element  ${email_phone_edittext}
    Input Text  ${email_phone_edittext}  ${USERNAME}
    Click Element  ${submit_button}
    Wait For Element  ${password_edittext}
    Input Text  ${password_edittext}  ${PASSWORD}
    Click Element  ${submit_button}
    Click Element  ${profile_button}
    Element Should Contain  ${profile_info_element}  ${name} 
    
Scroll To Element
    [Arguments]  ${locator}
    ${x}=        Get Horizontal Position  ${locator}
    ${y}=        Get Vertical Position    ${locator}
    Execute Javascript  window.scrollTo(${x}, ${y})

Wait For Element
    [Arguments]  ${locator}
    Wait Until Page Contains Element  ${locator}
    Wait Until Element Is Visible  ${locator}
    Wait Until Element Is Enabled  ${locator}
