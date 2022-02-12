**Settings***
Documentation  a test suit for checking availability of a product
Resource  ../../Resources/Basic.robot 
Resource  ../../Resources/Availability_resource.robot 
Default Tags  Digikala
Force Tags  availability
Suite Setup  Run Keywords  Open Page
...          Login
Suite Teardown  Close Browser
#######################################
***Test Cases***
Check Availabitity of Product
    Mouse Over  ${category_of_products}
    Mouse Over  ${digital_products} 
    Click Element   ${apple_products}

    Click On Element  ${sorting_order_element}

    FOR    ${i}    IN RANGE    6
        ${found}=  Run Keyword And Return Status  Page Should Contain Element  ${product_element}
        Log To Console  ${found}
        Exit For Loop If  ${found}       
        Run Keyword And Ignore Error  Scroll Element Into View   ${page_footer}     
    END

    Click On Element  ${next_page}
    Click On Element  ${product_element}

    ${handle} =	Get Window Handles
    Switch Window	${handle}[1]

    Click On Element  ${notification_button}
    Click On Element  ${sms_checkbox}
    Click On Element  ${notification_submit_button}

    Wait For Element  ${notification_enabled} 
    Page Should Contain Element  ${notification_enabled} 

