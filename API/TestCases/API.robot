***Settings***
Documentation  few test cases for learning API requests
Resource  ../Resources/variables.robot
Library   RequestsLibrary
Library   Collections
Library  JSONLibrary
Library  BuiltIn
Library  ../Libraries/ConvertDate.py
Default Tags  API
Force Tags  GET


***Test Cases***
Get Info 1
      Create Session  first_session  ${first_scenario_url}
      ${response}=  GET On Session  first_session  ${first_scenario_alias}
      ${data_object}=  Convert To String  ${response.json()}[${first_scenario_data_key}] 
      ${values}=  Get Value From Json  ${response.json()}  ${pages_value_path} 
      ${pages_string_value}=  Convert To String  ${values}
      Should Be Equal  ${data_object}  []
      Should Be Equal  ${pages_string_value}  [1]

Post Info 2
      ${header}=    Create Dictionary  Content-Type=application/json  Accept=application/json 
      Create Session  second_session  ${second_scenario_url}  verify=true
      ${response}=  Post on Session  second_session  ${second_scenario_aliasl}  data= ${body_2}  headers=${header}
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
      ${response}=  Post on Session  second_session  ${second_scenario_aliasl}  data= ${body_4}  headers=${header}
      ${response_string_status}=  Convert To String  ${response.status_code}
      Should Be Equal  ${response_string_status}  201
      Should Be Equal  ${response.json()}[name]  david
      Should Be Equal  ${response.json()}[email]  david@email.com
      ${id}=  Convert To Integer  ${response.json()}[id]	
      ${between_100_and_1000}=  Evaluate  ${100}<${id}<${1000}
      Should Be True  ${between_100_and_1000}
      ${jalali_date}=  Convert_time  ${response.json()}[createdAt]
      Log To Console  output: ${jalali_date}





