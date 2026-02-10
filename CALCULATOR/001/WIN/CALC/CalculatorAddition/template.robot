*** Settings ***
Library   RPA.Windows
Library   RPA.Desktop
Library   OperatingSystem


*** Variables ***
${full_path_screen_capture_directory}  ${CURDIR}\\screen_captures
${full_path_report_directory}  ${CURDIR}\\evidence_report
${full_path_report_pdf_file}  ${full_path_report_directory}\\evidence_report.pdf

*** Test Cases ***
#Begin test cases section
Calculator Addition
  WIN-CALC
#End  test cases section

*** Keywords ***
WIN-CALC
#Begin arguments
#End arguments
  [Documentation]  WIN_CAL_0001

  Log  START_PUSHING_INTO_REPORT


  log  LOGICAL_NAME=app_calculator
  RPA.Windows.Windows Run  calc.exe
  RPA.Desktop.Take Screenshot  ${full_path_screen_capture_directory}\\WIN_CAL_001.png

  Sleep  2

  log  LOGICAL_NAME=win_calculator
  RPA.Windows.Control Window  Calculator
  RPA.Desktop.Take Screenshot  ${full_path_screen_capture_directory}\\WIN_CAL_002.png

  RPA.Windows.Screenshot  screen_captures/calc_001.png

  log  LOGICAL_NAME=btn_five
  RPA.Windows.Click  name:Five
  RPA.Desktop.Take Screenshot  ${full_path_screen_capture_directory}\\WIN_CAL_003.png

  RPA.Windows.Screenshot  screen_captures/calc_002.png

  log  LOGICAL_NAME=btn_plus
  RPA.Windows.Click  name:Plus
  RPA.Desktop.Take Screenshot  ${full_path_screen_capture_directory}\\WIN_CAL_004.png


  log  LOGICAL_NAME=btn_three
  RPA.Windows.Click  name:Three
  RPA.Desktop.Take Screenshot  ${full_path_screen_capture_directory}\\WIN_CAL_005.png

  RPA.Windows.Screenshot  screen_captures/calc_003.png

  log  LOGICAL_NAME=btn_equals
  RPA.Windows.Click  name:Equals
  RPA.Desktop.Take Screenshot  ${full_path_screen_capture_directory}\\WIN_CAL_006.png

  RPA.Windows.Screenshot  screen_captures/calc_004.png
  RPA.Windows.Close Current Window

