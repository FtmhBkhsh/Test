**Settings***
Documentation  a test suit for check availability of a product
Resource  ../../Resources/Basic.robot 
Force Tags  Digikala
Suite Setup  Run Keywords  Open Page
...          Login
Suite Teardown  Close Browser
#######################################
***Variables***
${category_of_products}  XPath:/html/body/header/nav/div/div/ul/li[1]/ul/li[2]/div[1]
${digital_products} XPath:/html/body/header/nav/div/div/ul/li[1]/ul/li[2]/div[2]/div[1]/a[1]
${apple_products}  XPath://*[@id="categories-1"]/ul/li[8]/a[1]
${close_festival}  XPath:/html/body/div[3]/button
${sorting_order_element}  XPath://a[text()='پرفروش‌ترین‌']
${page_number_element}   XPath://a[text()='۲']
${product_element}   XPath://a[text()='گوشی موبایل اپل مدل Apple iPhone XS تک سیم کارت ظرفیت 512 گیگابایت'] 
${notification_enabled}  دیگه لازم نیست اطلاع بدی 
${notification_button}  //label[text()='موجود شد به من اطلاع بده'] 
${sms_checkbox}  name:observed[sms]
${notification_submit_button}  id:add-to-observed

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

