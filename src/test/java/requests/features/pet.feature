Feature: pet feature

Background:
  Given url baseUrl
  And path 'pet'

  Scenario: get request /pet/{petId}
    And path 10
    When method GET
    Then print response
    And status 200
    And match response.id == '#number'


  Scenario: post request /pet with static json
    * def myBody =

  """
    {
       "category": {
    "id": 0,
    "name": "string"
  },
  "name": "doggie",
  "photoUrls": [
    "string"
  ],
  "tags": [
    {
      "id": 0,
      "name": "string"
    }
  ],
  "status": "available"
  }
  """
    And request myBody
    When method POST
    Then karate.log(response)
    And match response.id == '#number'
    And match response.name == myBody.name


  Scenario: post request /pet with external JSON for request body
    And def myRequestBody = read('classpath:data/pet.json')
    And request myRequestBody
    When method POST
    Then status 200
    And match response.id == '#present'
    And match response.name == myRequestBody.name
    And match response contains {category: { "name" : "#string", "id":"#number"}}

  Scenario Outline: get /pet/{petId} with static <id>
    And path id
    When method GET
    Then print response
    And status 200

    Examples:
    |id|
    |10|
    |11|
    |12|

  Scenario Outline: get /pet/{petId} with csv - <number>
    And path number
    When method GET
    Then print response

  Examples:
    |read('classpath:data/data.csv')|

  Scenario: post request with /pet for random name parameter
    * def myString = call read('classpath:data/generate.js') 5
    * def myRequestBody = read('classpath:data/pet.json')
    And set myRequestBody.name = myString
    And request myRequestBody
    When method POST
    Then status 200
    And print response




    