@api
Feature: Search in the program repository

  Background: 
    Given there are users:
      | name     | password | token      |
      | Catrobat | 12345    | cccccccccc |
      | User1    | vwxyz    | aaaaaaaaaa |
      | NewUser  | 54321    | bbbbbbbbbb |
    And there are programs:
      | id | name             | description | owned by | downloads | views | upload time      | version |
      | 1  | Galaxy War       | p1          | User1    | 3         | 12    | 01.01.2013 12:00 | 0.8.5   |
      | 2  | Minions          |             | Catrobat | 33        | 9     | 01.02.2013 13:00 | 0.8.5   |
      | 3  | Fisch            |             | User1    | 133       | 33    | 01.01.2012 13:00 | 0.8.5   |
      | 4  | Ponny            | p2          | User1    | 245       | 33    | 01.01.2012 13:00 | 0.8.5   |
      | 5  | MarkoTheBest     |             | NewUser  | 335       | 33    | 01.01.2012 13:00 | 0.8.5   |
      | 6  | Whack the Marko  |             | Catrobat | 2         | 33    | 01.02.2012 13:00 | 0.8.5   |
      | 7  | Superponny       | p1 p2 p3    | User1    | 4         | 33    | 01.01.2012 12:00 | 0.8.5   |
      | 8  | Universe         |             | User1    | 23        | 33    | 01.01.2012 13:00 | 0.8.5   |
      | 9  | Webteam          |             | User1    | 100       | 33    | 01.01.2012 13:00 | 0.8.5   |
      | 10 | Fritz the Cat    |             | User1    | 112       | 33    | 01.01.2012 13:00 | 0.8.5   |


  Scenario: search program by name
    Given I have a parameter "q" with value "Galaxy"
    And I have a parameter "limit" with value "1"
    And I have a parameter "offset" with value "0"
    When I GET "/api/projects/search.json" with these parameters
    Then I should get the json object:
"""
{
  "completeTerm":"",
  "CatrobatInformation": {
		"BaseUrl":"https:\/\/localhost\/",
		"TotalProjects":1,
		"ProjectsExtension":".catrobat"
  },
  "CatrobatProjects":[{
		"ProjectId":1,
		"ProjectName":"Galaxy War",
		"ProjectNameShort":"Galaxy War",
		"ScreenshotBig":"resources\/thumbnails\/1_large.png",
		"ScreenshotSmall":"resources\/thumbnails\/1_small.png",
		"Author":"User1",
		"Description":"p1",
		"Uploaded":1357041600,
		"UploadedString":"0",
		"Version":"0.8.5",
		"Views":"12",
		"Downloads":"3",
		"ProjectUrl":"details\/1",
		"DownloadUrl":"download\/1.catrobat"
  }],
  "preHeaderMessages":""
}
"""

  Scenario: search program by name
    Given I have a parameter "q" with value "marko"
    And I have a parameter "limit" with value "10"
    And I have a parameter "offset" with value "0"
    When I GET "/api/projects/search.json" with these parameters
    Then I should get the json object:
"""
{
  "completeTerm":"",
  "CatrobatInformation": {
		"BaseUrl":"https:\/\/localhost\/",
		"TotalProjects":1,
		"ProjectsExtension":".catrobat"
  },
  "CatrobatProjects":[{
		"ProjectId":6,
		"ProjectName":"Whack the Marko",
		"ProjectNameShort":"Whack the Marko",
		"ScreenshotBig":"resources\/thumbnails\/6_large.png",
		"ScreenshotSmall":"resources\/thumbnails\/6_small.png",
		"Author":"Catrobat",
		"Description":"",
		"Uploaded":1328101200,
		"UploadedString":"0",
		"Version":"0.8.5",
		"Views":"33",
		"Downloads":"2",
		"ProjectUrl":"details\/6",
		"DownloadUrl":"download\/6.catrobat"
  },
  {
  		"ProjectId":5,
		"ProjectName":"MarkoTheBest",
		"ProjectNameShort":"MarkoTheBest",
		"ScreenshotBig":"resources\/thumbnails\/5_large.png",
		"ScreenshotSmall":"resources\/thumbnails\/5_small.png",
		"Author":"NewUser",
		"Description":"",
		"Uploaded":1325422800,
		"UploadedString":"0",
		"Version":"0.8.5",
		"Views":"33",
		"Downloads":"335",
		"ProjectUrl":"details\/5",
		"DownloadUrl":"download\/5.catrobat"

  }],
  "preHeaderMessages":""
}
"""

  Scenario: search program by name
    Given I have a parameter "q" with value "NewUser"
    And I have a parameter "limit" with value "1"
    And I have a parameter "offset" with value "0"
    When I GET "/api/projects/search.json" with these parameters
    Then I should get the json object:
    """
{
  "completeTerm":"",
  "CatrobatInformation": {
		"BaseUrl":"https:\/\/localhost\/",
		"TotalProjects":1,
		"ProjectsExtension":".catrobat"
  },
  "CatrobatProjects":[{
  		"ProjectId":5,
		"ProjectName":"MarkoTheBest",
		"ProjectNameShort":"MarkoTheBest",
		"ScreenshotBig":"resources\/thumbnails\/5_large.png",
		"ScreenshotSmall":"resources\/thumbnails\/5_small.png",
		"Author":"NewUser",
		"Description":"",
		"Uploaded":1325422800,
		"UploadedString":"0",
		"Version":"0.8.5",
		"Views":"33",
		"Downloads":"335",
		"ProjectUrl":"details\/5",
		"DownloadUrl":"download\/5.catrobat"
  }],
  "preHeaderMessages":""
}
"""

  Scenario: search program by name
    Given I have a parameter "q" with value "noUser"
    And I have a parameter "limit" with value "1"
    And I have a parameter "offset" with value "0"
    When I GET "/api/projects/search.json" with these parameters
    Then I should get the json object:
"""
{
  "completeTerm":"",
  "CatrobatInformation": {
		"BaseUrl":"https:\/\/localhost\/",
		"TotalProjects":1,
		"ProjectsExtension":".catrobat"
  },
  "CatrobatProjects":[],
  "preHeaderMessages":""
}
"""


  Scenario: search program by description
    Given I have a parameter "q" with value "p1"
    And I have a parameter "limit" with value "10"
    And I have a parameter "offset" with value "0"
    When I GET "/api/projects/search.json" with these parameters
    Then I should get the json object:
"""
{
  "completeTerm":"",
  "CatrobatInformation": {
		"BaseUrl":"https:\/\/localhost\/",
		"TotalProjects":1,
		"ProjectsExtension":".catrobat"
  },
  "CatrobatProjects":[{
		"ProjectId":1,
		"ProjectName":"Galaxy War",
		"ProjectNameShort":"Galaxy War",
		"ScreenshotBig":"resources\/thumbnails\/1_large.png",
		"ScreenshotSmall":"resources\/thumbnails\/1_small.png",
		"Author":"User1",
		"Description":"p1",
		"Uploaded":1357041600,
		"UploadedString":"0",
		"Version":"0.8.5",
		"Views":"12",
		"Downloads":"3",
		"ProjectUrl":"details\/1",
		"DownloadUrl":"download\/1.catrobat"
  },
  {
  		"ProjectId":7,
		"ProjectName":"Superponny",
		"ProjectNameShort":"Superponny",
		"ScreenshotBig":"resources\/thumbnails\/7_large.png",
		"ScreenshotSmall":"resources\/thumbnails\/7_small.png",
		"Author":"User1",
		"Description":"p1 p2 p3",
		"Uploaded":1325419200,
		"UploadedString":"0",
		"Version":"0.8.5",
		"Views":"33",
		"Downloads":"4",
		"ProjectUrl":"details\/7",
		"DownloadUrl":"download\/7.catrobat"

  }],
  "preHeaderMessages":""
}
"""

  Scenario: search program by description
    Given I have a parameter "q" with value "p2"
    And I have a parameter "limit" with value "10"
    And I have a parameter "offset" with value "0"
    When I GET "/api/projects/search.json" with these parameters
    Then I should get the json object:
"""
{
  "completeTerm":"",
  "CatrobatInformation": {
		"BaseUrl":"https:\/\/localhost\/",
		"TotalProjects":1,
		"ProjectsExtension":".catrobat"
  },
  "CatrobatProjects":[{
		"ProjectId":4,
		"ProjectName":"Ponny",
		"ProjectNameShort":"Ponny",
		"ScreenshotBig":"resources\/thumbnails\/4_large.png",
		"ScreenshotSmall":"resources\/thumbnails\/4_small.png",
		"Author":"User1",
		"Description":"p2",
		"Uploaded":1325422800,
		"UploadedString":"0",
		"Version":"0.8.5",
		"Views":"33",
		"Downloads":"245",
		"ProjectUrl":"details\/4",
		"DownloadUrl":"download\/4.catrobat"
  },
  {
  		"ProjectId":7,
		"ProjectName":"Superponny",
		"ProjectNameShort":"Superponny",
		"ScreenshotBig":"resources\/thumbnails\/7_large.png",
		"ScreenshotSmall":"resources\/thumbnails\/7_small.png",
		"Author":"User1",
		"Description":"p1 p2 p3",
		"Uploaded":1325419200,
		"UploadedString":"0",
		"Version":"0.8.5",
		"Views":"33",
		"Downloads":"4",
		"ProjectUrl":"details\/7",
		"DownloadUrl":"download\/7.catrobat"

  }],
  "preHeaderMessages":""
}
"""


#
#
#  @TODO
#  Scenario: search all programs
#    Given I have a parameter "projectName" with value "program 1"
#    And I have a parameter "limit" with value "1"
#    And I have a parameter "offset" with value "0"
#    When I GET "/api/projects/search.json" with these parameters
#    Then I should get the json object:
#"""
#{
#  "ProgrammCount":"10";
#}
#"""
#
#
#
#
#  @TODO
#  Scenario: search programs by name and with a limit of 5 and offset of 0
#    Given I have a parameter "projectName" with value "program 1"
#    And I have a parameter "limit" with value "5"
#    And I have a parameter "offset" with value "0"
#    When I POST these parameters to "/api/projects/search.json"
#    Then I should get the json object:
#"""
#{
#  "completeTerm":"",
#  "CatrobatInformation": {
#		"BaseUrl":"https:\/\/localhost\/",
#		"TotalProjects":3,
#		"ProjectsExtension":".catrobat"
#  },
#  "CatrobatProjects":[{
#		"ProjectId":"1",
#		"ProjectName":"program 1",
#		"ProjectNameShort":"program 1",
#		"ScreenshotBig":"resources\/thumbnails\/1_large.png",
#		"ScreenshotSmall":"resources\/thumbnails\/1_small.png",
#		"Author":"Catrobat",
#		"Description":"p1",
#		"Uploaded":"1357041600",
#		"UploadedString":<timestring>,
#		"Version":"0.8.5",
#		"Views":"12",
#		"Downloads":"3",
#		"ProjectUrl":"details\/1",
#		"DownloadUrl":"download\/1.catrobat"
#  }],
#  "preHeaderMessages":""
#}
#"""
#
#
#  @TODO
#  Scenario: search programs by name and with a limit of 5 and offset of 2
#    Given I have a parameter "projectName" with value "program 1"
#    And I have a parameter "limit" with value "5"
#    And I have a parameter "offset" with value "2"
#    When I POST these parameters to "/api/projects/search.json"
#    Then I should get the json object:
#"""
#{
#  "completeTerm":"",
#  "CatrobatInformation": {
#		"BaseUrl":"https:\/\/localhost\/",
#		"TotalProjects":3,
#		"ProjectsExtension":".catrobat"
#  },
#  "CatrobatProjects":[{
#		"ProjectId":"1",
#		"ProjectName":"program 1",
#		"ProjectNameShort":"program 1",
#		"ScreenshotBig":"resources\/thumbnails\/1_large.png",
#		"ScreenshotSmall":"resources\/thumbnails\/1_small.png",
#		"Author":"Catrobat",
#		"Description":"p1",
#		"Uploaded":"1357041600",
#		"UploadedString":<timestring>,
#		"Version":"0.8.5",
#		"Views":"12",
#		"Downloads":"3",
#		"ProjectUrl":"details\/1",
#		"DownloadUrl":"download\/1.catrobat"
#  }],
#  "preHeaderMessages":""
#}
#"""
#
#
#
#  @TODO
#  Scenario: search all users
#    Given I have a parameter "projectName" with value "program 1"
#    And I have a parameter "limit" with value "1"
#    And I have a parameter "offset" with value "0"
#    When I POST these parameters to "/api/projects/search.json"
#    Then I should get the json object:
#    """
#{
#  "UserCount":"2";
#}
#"""
#
#  @TODO
#  Scenario: search user by name
#    Given I have a parameter "Author" with value "User1"
#    And I have a parameter "limit" with value "1"
#    And I have a parameter "offset" with value "0"
#    When I POST these parameters to "/api/projects/search.json"
#    Then I should get the json object:
#"""
#{
#"Author":"User1";
#}
#"""



