**Settings***
Documentation  a test suit for buying and deleting an item
Resource  ../../Resources/Basic.robot 
Resource  ../../Resources/Buy_resource.robot 
Resource  ../../Resources/Delete_resource.robot 
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

    Click On Element  ${seller}
    Click On Element  ${seller_digikala}
    Click On Element  ${sorting_order_element}
    Click On Element  ${brand} 
    Click On Element  ${brand_apple} 
    Click On Element  ${product_element}

    ${handle} =	Get Window Handles
    Switch Window	${handle}[1]

    Click On Element  ${add_to_card_button}
    Click On Element  ${bascket_button}
    Click On Element  ${checkout_button}

Delete the item
    Go Back
    Click On Element  ${delete_element}
    Wait For Element  ${empty_bascket}
    Page Should Contain  ${empty_bascket_1}
