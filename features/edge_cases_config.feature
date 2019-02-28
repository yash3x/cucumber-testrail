Feature: Run CucumberTestRail with invalid config

  @TestRail-SYM-R3
  Scenario: Running CucumberTestRail with non-existent testrail_url in config throws error
    Given a TestRail API at http://localhost:7000
    When I run the script:
    """
    cucumber-testrail -c sample_files/cucumber_testrail_invalid1.yml
                      -r sample_files/results_valid.json
                      -u 'user@ctr.co'
                      -p 'password'
                      -i 'QA'
    """
    Then I see the error:
    """
    Error: cucumber_testrail.yml is missing testrail_url
    """
    And the TestRail update fails to send