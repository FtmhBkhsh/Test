**Settings***
Documentation  a test case to learn DDT
Resource  ../../Resources/Basic.robot 
Resource  ../../Resources/DataDriven_resources.robot 
Force Tags  Digikala
Test Setup  Run Keywords  Open Page
...          Login
Test Teardown  Close Browser
Test Template  Find A Magazine
#########################################
***Test Cases***
Find A Magazine That Is Persian  ${persian_magazine}  ${cover_of_magazine_kinds}  ${cover_of_magazine}  ${persian_element}  ${persian_element_name}  ${persian_page_footer} 
Find A Magazine That Is Foriegn  ${foriegn_magazine}  ${cover_of_magazine_kinds}  ${cover_of_magazine}  ${foriegn_element}  ${foriegn_element_name}  ${foriegn_page_footer} 


#########################################
***Keywords***
Find A Magazine
    [Arguments]  ${element_kind}  ${cover_of_magazine_kinds}  ${cover_of_magazine}  ${magazine_element}  ${element_name}  ${page_footer} 
    ${not_found}  Set Variable  True


    Mouse Over  ${category_of_products}    
    Wait For Element  ${book_and_art__products}
    Mouse Over  ${book_and_art__products}
    Wait For Element  ${magazine_products}
    Click Element   ${magazine_products}

    Wait For Element  ${element_kind}
    Click Element  ${element_kind}

    #Wait For Element  ${close_festival} 
    #Click Element   ${close_festival} 

    Wait For Element  ${cover_of_magazine_kinds}
    Run Keyword And Ignore Error  Scroll Element Into View   ${cover_of_magazine_kinds}
    Click Element  ${cover_of_magazine_kinds}

    Wait For Element  ${cover_of_magazine}
    Run Keyword And Ignore Error  Scroll Element Into View   ${cover_of_magazine}
    Click Element  ${cover_of_magazine}

    # four first pages of digikala serach results appear by scolling
    # the For Loop below do scolling
    FOR    ${i}    IN RANGE    10
        ${found}=  Run Keyword And Return Status  Page Should Contain   ${element_name}
        Log To Console  ${found}
        Exit For Loop If  ${found}       
        Run Keyword And Ignore Error  Scroll Element Into View   ${page_footer}     
    END


    Wait For Element  ${magazine_element}
    Run Keyword And Ignore Error  Scroll Element Into View   ${magazine_element}
    Click Element  ${magazine_element}

    ${handle} =	Get Window Handles
    Switch Window	${handle}[1]

    Page Should Contain  ${element_name}




