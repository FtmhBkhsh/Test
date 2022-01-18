**Settings***
Documentation  a test suit for buy an item
Resource  ../../Resources/Basic.robot 
Force Tags  Digikala
Suite Setup  Run Keywords  Open Page
...          Login
Suite Teardown  Close Browser
#######################################
***Variables***
${category_of_products}  XPath:/html/body/header/nav/div/div/ul/li[1]/ul/li[2]/div[1]
${digital_products}  XPath:/html/body/header/nav/div/div/ul/li[1]/ul/li[2]/div[2]/div[1]/a[1]
${apple_products}  XPath://*[@id="categories-1"]/ul/li[8]/a[1]
${close_festival}  XPath:/html/body/div[3]/button
${sorting_order_element}  XPath://a[text()='پرفروش‌ترین‌']
#${seller}  XPath://*[@id="js-list-aside"]/div[8]/div[1]
${seller}  //*[@id="js-list-aside"]/div[5]/div/div[2]/div[3]/div/ul/li[1]
#${brand}  XPath://*[@id="js-list-aside"]/div[6]/div/div[2]/div[4]/div/ul/li[3]
${brand}  XPath://*[@id="js-list-aside"]/div[5]/div/div[2]/div[4]/div/ul/li[3]
#${product_element}  //a[text()='گوشی موبایل اپل مدل iPhone 13 Pro Max A2644 دو سیم‌ کارت ظرفیت 1 ترابایت و رم 6 گیگابایت - اکتیو']  

#${product_element}  //a[text()='گوشی موبایل اپل مدل iPhone 13 Pro Max A2644 دو سیم‌ کارت ظرفیت 1 ترابایت و رم 6 گیگابایت ']
${product_element}   //a[contains(text(),' مدل iPhone 13 Pro Max A2644 دو سیم‌ کارت ظرفیت 1 ترابایت و رم 6 گیگابایت')]
${add_to_card_button}   class:btn-add-to-cart__txt 
${checkout_button}  class:c-checkout-bill__to-forward-button

#######################################
***Test Cases***
Delete Product
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

