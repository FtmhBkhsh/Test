**Settings***
Documentation  a test case to learn DDT
Resource  ../../Resources/Basic.robot 
Force Tags  Digikala
Test Setup  Run Keywords  Open Page
...          Login
Test Teardown  Close Browser
Test Template  Find A Magazine
#######################################
***Variables***
${category_of_products}  XPath:/html/body/header/nav/div/div/ul/li[1]/ul/li[2]/div[1]
${book_and_art__products}  XPath:/html/body/header/nav/div/div/ul/li[1]/ul/li[2]/div[2]/div[1]/a[8]
${magazine_products}  XPath://*[@id="categories-8"]/ul/li[3]
${close_festival}  XPath:/html/body/div[3]/button
${persian_magazine}  //div[text()='مجلات داخلی']
${foriegn_magazine}  //div[text()='مجلات خارجی']
${cover_of_persian_magazine_kinds}   XPath:/html/body/main/div[2]/div/div[1]/div/div[1]/div/div/div[10]/div[1]
${cover_of_foriegn_magazine_kinds}  XPath://*[@id="js-list-aside"]/div[11]
${cover_of_persian_magazine}  XPath://*[@id="js-list-aside"]/div[10]/div[2]/div[3]/div/ul/li[5]
${cover_of_foriegn_magazine}   XPath://*[@id="js-list-aside"]/div[11]/div[2]/div[3]/div/ul/li[3]
${persian_element}  //a[contains(text(),'مجله سینمایی فارابی شماره 84')]
${foriegn_element}  //a[contains(text(),'مجله THE BATMAN WHO LAUGHS 3 فوریه 2019')] 
${persian_element_name}  مجله سینمایی فارابی شماره 84
${foriegn_element_name}   THE BATMAN WHO LAUGHS 
#########################################
***Test Cases***
Find A Magazine That Is Persian  ${persian_magazine}  ${cover_of_persian_magazine_kinds}  ${cover_of_persian_magazine}  ${persian_element}  ${persian_element_name}
Find A Magazine That Is Foriegn  ${foriegn_magazine}  ${cover_of_foriegn_magazine_kinds}  ${cover_of_foriegn_magazine}  ${foriegn_element}  ${foriegn_element_name}

#########################################
***Keywords***
Find A Magazine
    [Arguments]  ${element_kind}  ${cover_of_magazine_kinds}  ${cover_of_magazine}  ${magazine_element}  ${element_name}

    Mouse Over  ${category_of_products}    
    Wait For Element  ${book_and_art__products}
    Mouse Over  ${book_and_art__products}
    Wait For Element  ${magazine_products}
    Click Element   ${magazine_products}

    Wait For Element  ${element_kind}
    Click Element  ${element_kind}

    Wait For Element  ${close_festival} 
    Click Element   ${close_festival} 

    Wait For Element  ${cover_of_magazine_kinds}
    Run Keyword And Ignore Error  Scroll Element Into View   ${cover_of_magazine_kinds}
    Click Element  ${cover_of_magazine_kinds}

    Wait For Element  ${cover_of_magazine}
    Run Keyword And Ignore Error  Scroll Element Into View   ${cover_of_magazine}
    Click Element  ${cover_of_magazine}

    Wait For Element  ${magazine_element}
    Run Keyword And Ignore Error  Scroll Element Into View   ${magazine_element}
    Click Element  ${magazine_element}

    ${handle} =	Get Window Handles
    Switch Window	${handle}[1]

    Page Should Contain  ${element_name}




