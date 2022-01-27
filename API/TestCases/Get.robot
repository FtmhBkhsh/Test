***Settings***
Documentation  a test case for learning GET
Library   RequestsLibrary
Library   Collections
Force Tags  API

***Variables***
${base_url}  https://gorest.co.in
${b_url}  data
***Test Cases***
Get Info
      Create Session  first_session  ${base_url}
      ${response}=  GET On Session  first_session  /public/v1/posts/123/comments

      ${json_object}  Parse Json    ${response.content}
      FOR  ${item}    IN    @{json_object['data']}
      Log To Console    ${item['id']}

      #${data_content}=	Create Dictionary  ${response.content}  
      #log to console  ${response.content}
      #${hi}=  Get From Dictionary   ${data_content.data}  "data"

      #FOR     ${key}    IN    @{data_content}
     #Log     The current key is: ${key

      #END	
      #log to console  ${response.content}
      log to console  ${buy}
    #log to console  ${data}

