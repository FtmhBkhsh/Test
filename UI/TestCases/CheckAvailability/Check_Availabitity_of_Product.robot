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

    Wait For Element  ${close_festival} 
    Click Element   ${close_festival} 

    Wait For Element  ${sorting_order_element}
    Scroll Element Into View  ${sorting_order_element}
    Mouse Over  ${sorting_order_element}
    Click Element  ${sorting_order_element}

    Wait For Element  ${page_number_element}
    Run Keyword And Ignore Error  Scroll Element Into View  ${page_number_element}
    Click Link  ${page_number_element}


    Wait For Element  ${product_element}
    Run Keyword And Ignore Error  Scroll Element Into View  ${product_element}
    Run Keyword And Ignore Error  Mouse Over  ${product_element}
    Click Link  ${product_element}

    ${handle} =	Get Window Handles
    Switch Window	${handle}[1]

    Wait For Element  ${notification_button}
    Run Keyword And Ignore Error  Scroll Element Into View  ${notification_button}
    Click Element  ${notification_button}
    Select Checkbox  ${sms_checkbox}
    Click Element  ${notification_submit_button}
    Page Should Contain Element  ${notification_button}

