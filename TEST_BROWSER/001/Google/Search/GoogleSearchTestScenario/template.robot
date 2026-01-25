*** Settings ***
Library   SeleniumLibrary
Library   Mainframe3270
Library   OperatingSystem


*** Variables ***
${full_path_screen_capture_directory}  ${CURDIR}\\screen_captures
${full_path_report_directory}  ${CURDIR}\\evidence_report
${full_path_report_pdf_file}  ${full_path_report_directory}\\evidence_report.pdf

*** Test Cases ***
#Begin test cases section
Google Search Test Scenario
  Google-Search
#End  test cases section

*** Keywords ***
Google-Search
#Begin arguments
#End arguments
  [Documentation]  GOO_SEA_0001

  Log  START_PUSHING_INTO_REPORT


  log  LOGICAL_NAME=url_google
  SeleniumLibrary.Open Browser  https://www.google.com edge
  Capture Page Screenshot  ${full_path_screen_capture_directory}\\Goo_Sea_001.png

  Log  STOP_PUSHING_INTO_REPORT
  wait until element is visible  name=q  timeout=10s
  Log  START_PUSHING_INTO_REPORT

  log  LOGICAL_NAME=txt_search
  SeleniumLibrary.Input Text  name=q  ${Selenium}
  Capture Page Screenshot  ${full_path_screen_capture_directory}\\Goo_Sea_002.png


  log  LOGICAL_NAME=txt_search
  SeleniumLibrary.Press Keys  name=q  ${ENTER}
  Capture Page Screenshot  ${full_path_screen_capture_directory}\\Goo_Sea_003.png

  Sleep  2
  Mainframe3270.Page Should Contain String  Selenium
  
  Log  STOP_PUSHING_INTO_REPORT
  Mainframe3270.Set Screenshot Folder  ${full_path_screen_capture_directory}
  Take Screenshot  filename_prefix=Goo_Sea_004
  ${files}    List Files In Directory    ${full_path_screen_capture_directory}  Goo_Sea_004*.html
  ${newFile}  Set Variable  tempFile
  FOR    ${file}    IN    @{files}
  ${newFile}  Set Variable  ${file}
  END
  Open Browser  ${full_path_screen_capture_directory}\\${file}  edge
  Set Window Size  725  520
  Log  START_PUSHING_INTO_REPORT
  Capture Page Screenshot  ${full_path_screen_capture_directory}\\Goo_Sea_004.png
  Log  STOP_PUSHING_INTO_REPORT
  Close Browser
  Remove File  ${full_path_screen_capture_directory}\\${file}
  Log  START_PUSHING_INTO_REPORT


  Capture Page Screenshot  ${full_path_screen_capture_directory}\\Goo_Sea_005.png
  SeleniumLibrary.Close Browser

