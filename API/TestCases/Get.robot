***Settings***
Documentation  a test case for learning GET request
Library   RequestsLibrary
Library   Collections
Default Tags  API
Force Tags  GET


***Variables***
${base_url}  https://gorest.co.in
${b_url}  data
***Test Cases***
Get Info
      Create Session  first_session  ${base_url}
      ${response}=  GET On Session  first_session  /public/v1/posts/123/comments
      ${stringg_response}=  Convert To String  ${response.content}
      ${json_object}=  To Json    ${stringg_response}
      ${json_object}=  To Json    ${stringg_response}
      ${data_object}=  Convert To String  ${json_object}[data] 
      Should Be Equal  ${data_object}  []
      Log To Console    ${json_object}


