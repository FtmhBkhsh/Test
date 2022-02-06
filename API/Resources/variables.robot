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