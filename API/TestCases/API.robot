***Settings***
Documentation  few test cases for learning API requests
Library   RequestsLibrary
Library   Collections
Library  JSONLibrary
Library  BuiltIn
Library  ../Libraries/ConvertDate.py
Default Tags  API
Force Tags  GET


***Variables***
#1st scenario
${first_scenario_url}  https://gorest.co.in
${first_scenario_data_key}  data
${pages_value_path}  $.meta.pagination.page
#2nd scenario
${second_scenario_url}  https://reqres.in
${body_2}  {"name": "mourfeus", "job": "leader"}
#3rd scenario
${body_3}  {"email": "sydney@fife"}
#4th scenario
${body_4}  {"name": "david", "job": "leader","email": "david@email.com"}
***Test Cases***
Get Info 1
      Create Session  first_session  ${first_scenario_url}
      ${response}=  GET On Session  first_session  /public/v1/posts/123/comments
      ${data_object}=  Convert To String  ${response.json()}[${first_scenario_data_key}] 
      ${values}=  Get Value From Json  ${response.json()}  ${pages_value_path} 
      ${pages_string_value}=  Convert To String  ${values}
      Should Be Equal  ${data_object}  []
      Should Be Equal  ${pages_string_value}  [1]

Post Info 2
      ${header}=    Create Dictionary  Content-Type=application/json  Accept=application/json 
      Create Session  second_session  ${second_scenario_url}  verify=true
      ${response}=  Post on Session  second_session  /api/users  data= ${body_2}  headers=${header}
      ${response_string_status}=  Convert To String  ${response.status_code}
      Should Be Equal  ${response_string_status}  201
      ${response_string_content}=  Convert To String  ${response.content}
      Should Contain  ${response_string_content}  mourfeus  job

Post Info 3
      Create Session  third_session  ${second_scenario_url}  
      ${header}=    Create Dictionary    Content-type=application/json   Accept=application/json
      ${response}=    POST On Session    third_session    api/register  data=${body_3}  expected_status=400

Post Info 4
      ${header}=    Create Dictionary  Content-Type=application/json  Accept=application/json 
      Create Session  second_session  ${second_scenario_url}  verify=true
      ${response}=  Post on Session  second_session  /api/users  data= ${body_4}  headers=${header}
      ${response_string_status}=  Convert To String  ${response.status_code}
      Should Be Equal  ${response_string_status}  201
      Should Be Equal  ${response.json()}[name]  david
      Should Be Equal  ${response.json()}[email]  david@email.com
      ${id}=  Convert To Integer  ${response.json()}[id]	
      ${more_than_100}=  Evaluate  (${id} / ${100})>=${0}
      ${less_than_1000}=  Evaluate  (${id} / ${1000})<${1}
      Should Be True  ${more_than_100} and ${less_than_1000}
      ${jalali_date}=  Convert_time  ${response.json()}[createdAt]
      Log To Console  output: ${jalali_date}





