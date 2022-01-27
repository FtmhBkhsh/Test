**Settings***
Documentation  a test suit for buying an item
Resource  ../../Resources/Basic.robot 
Resource  ../../Resources/Buy_resource.robot 
Default Tags  Digikala
Force Tags  buy
Suite Setup  Run Keywords  Open Page
...          Login
Suite Teardown  Close Browser
#######################################
***Test Cases***
Buy an item
    Mouse Over  ${category_of_products}
    Mouse Over  ${digital_products} 
    Click Element   ${apple_products}

    Wait For Element  ${close_festival} 
    Click Element   ${close_festival}

    Wait For Element  ${seller}
    Run Keyword And Ignore Error  Scroll Element Into View   ${seller}
    Click Element  ${seller}

    Wait For Element  ${brand}
    Run Keyword And Ignore Error  Scroll Element Into View   ${brand}
    Click Element  ${brand}

    Wait For Element  ${sorting_order_element}
    Run Keyword And Ignore Error  Scroll Element Into View  ${sorting_order_element}
    Mouse Over  ${sorting_order_element}
    Click Element  ${sorting_order_element}


    Wait For Element  ${product_element}
    Run Keyword And Ignore Error  Scroll Element Into View  ${product_element}
    Run Keyword And Ignore Error  Mouse Over  ${product_element}
    Click Element  ${product_element}

    ${handle} =	Get Window Handles
    Switch Window	${handle}[1]

    Click Element  ${add_to_card_button}
    Click Element  ${checkout_button}

