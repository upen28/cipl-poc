*** Settings ***
Library   SeleniumLibrary
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
  SeleniumLibrary.Open Browser  https://www.google.com  edge
  Capture Page Screenshot  ${full_path_screen_capture_directory}\\Goo_Sea_001.png

  Log  STOP_PUSHING_INTO_REPORT
  wait until element is visible  name=q  timeout=10s
  Log  START_PUSHING_INTO_REPORT

  log  LOGICAL_NAME=txt_search
  SeleniumLibrary.Input Text  name=q  ${SearchTerm}
  Capture Page Screenshot  ${full_path_screen_capture_directory}\\Goo_Sea_002.png


  log  LOGICAL_NAME=txt_search
  SeleniumLibrary.Press Keys  name=q  ${ENTER}
  Capture Page Screenshot  ${full_path_screen_capture_directory}\\Goo_Sea_003.png

  Sleep  10

