***Settings***
Documentation  a test case for learning API requests
Library   RequestsLibrary
Library   Collections
Library  JSONLibrary
Library  BuiltIn
Library  os
Library  ../Libraries/ConvertDate.py
Default Tags  API
Force Tags  GET


***Variables***
${first_scenario_url}  https://gorest.co.in
${second_scenario_url}  https://reqres.in
${third_scenario_url}  https://reqres.in
${data_key}  data
${pages_value_path}  $.meta.pagination.page
${Base_URL}    http://example.com
${name_string}  name
${name}  mourfeus
${body_1}  {"name": "mourfeus", "job": "leader"}
${body_2}  {"email": "sydney@fife"}
${body_3}  {"name": "david", "job": "leader","email": "david@email.com"}
***Test Cases***
Get Info
      Create Session  first_session  ${first_scenario_url}
      ${response}=  GET On Session  first_session  /public/v1/posts/123/comments
      ${stringg_response}=  Convert To String  ${response.content}
      ${json_object}=  To Json    ${stringg_response}
      ${data_object}=  Convert To String  ${json_object}[${data_key}] 
      ${values}=  Get Value From Json  ${json_object}  ${pages_value_path} 
      ${pages_string_value}=  Convert To String  ${values}
      Should Be Equal  ${data_object}  []
      Should Be Equal  ${pages_string_value}  [1]


Post Info1
      ${header}=    Create Dictionary  Content-Type=application/json  Accept=application/json 
      Create Session  second_session  ${second_scenario_url}  verify=true
      ${response}=  Post on Session  second_session  /api/users  data= ${body_1}  headers=${header}
      ${response_string_status}=  Convert To String  ${response.status_code}
      Should Be Equal  ${response_string_status}  201
      ${response_string_content}=  Convert To String  ${response.content}
      Should Contain  ${response_string_content}  mourfeus  job



Post Info2
      Create Session  third_session  ${third_scenario_url}  verify=true
      #${body}=  Create Dictionary   email=sydney@fife
      ${header}=    Create Dictionary    Content-type=application/json   Accept=application/json
      ${response}=    POST On Session    third_session    api/register  data=${body_2}  expected_status=400


Post Info3
      ${header}=    Create Dictionary  Content-Type=application/json  Accept=application/json 
      Create Session  second_session  ${second_scenario_url}  verify=true
      ${response}=  Post on Session  second_session  /api/users  data= ${body_3}  headers=${header}
      ${response_string_status}=  Convert To String  ${response.status_code}
      Should Be Equal  ${response_string_status}  201
      Should Be Equal  ${response.json()}[name]  david
      Should Be Equal  ${response.json()}[email]  david@email.com
      ${id}=  Convert To Integer  ${response.json()}[id]	
      ${more_than_100}=  Evaluate  (${id} / ${100})>=${0}
      ${less_than_1000}=  Evaluate  (${id} / ${1000})<${1}
      Should Be True  ${more_than_100} and ${less_than_1000}
      ${jalali_date}=  Convert_time  ${response.json()}[createdAt]
      Log To Console  ${jalali_date}





