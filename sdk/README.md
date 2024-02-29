
## Pre-requisites for running tests through SmartUI SDK

- Basic understanding of Command Line Interface and Selenium is required.
- Login to [LambdaTest SmartUI](https://smartui.lambdatest.com/) with your credentials.

The following steps will guide you in running your first Visual Regression test on LambdaTest platform using SmartUI Selenium SDK integration.

## Create a SmartUI Project

The first step is to create a project with the application in which we will combine all your builds run on the project. To create a SmartUI Project, follow these steps:

1. Go to [Projects page](https://smartui.lambdatest.com/)
2. Click on the `new project` button
3. Select the platform as <b>CLI</b> or <b>Web</b> for executing your `SDK` tests.
4. Add name of the project, approvers for the changes found, tags for any filter or easy navigation.
5. Click on the **Submit**.

## Steps to run your first test

Once you have created a SmartUI Project, you can generate screenshots by running automation scripts. Follow the below steps to successfully generate screenshots

### **Step 1:** Create/Update your test

You can clone the sample repository to run `LambdaTest` automation tests with `SmartUI` and use the `sdkCloud.rb` file present in the `sdk` folder.

```bash
git clone https://github.com/LambdaTest/smartui-ruby-selenium-sample
cd smartui-ruby-selenium-sample/sdk
```
### **Step 2**: Install the Dependencies

Install required NPM modules for `LambdaTest Smart UI Selenium SDK` in your **Frontend** project.

```bash
npm i @lambdatest/smartui-cli
```

```
gem install lambdatest-selenium-driver selenium-webdriver
```

### **Step 3:** Configure your Project Token

Setup your project token show in the **SmartUI** app after, creating your project.

<Tabs className="docs__val" groupId="language">
<TabItem value="MacOS/Linux" label="MacOS/Linux" default>

```bash
export PROJECT_TOKEN="123456#1234abcd-****-****-****-************"
```

</TabItem>
<TabItem value="Windows" label="Windows - CMD">

```bash
set PROJECT_TOKEN="123456#1234abcd-****-****-****-************"
```

</TabItem>
<TabItem value="Powershell" label="Windows-PS">

```bash
$Env:PROJECT_TOKEN="123456#1234abcd-****-****-****-************"
```
</TabItem>
</Tabs>

### **Step 4:** Create and Configure SmartUI Config

You can now configure your project settings on using various available options to run your tests with the SmartUI integration. To generate the configuration file, please execute the following command:

```bash
npx smartui config:create smartui-web.json
```

Once, the configuration file will be created, you will be seeing the default configuration pre-filled in the configuration file:

```json title="/smartui-sdk-project/smartui-web.json"
{
  "web": {
    "browsers": [
      "chrome", 
      "firefox",
      "safari",
      "edge"
    ],
    "viewports": [
      [
        1920
      ],
      [
        1366
      ],
      [
        360
      ]
    ],
    "waitForPageRender": 50000, 
    "waitForTimeout": 1000

  }
}
```
#### For capturing viewport screenshots

To capture a screenshot of the content currently visible in your viewport, rather than the entire page, it's important to define the viewport width in your configuration settings. Specify the desired width parameters as demonstrated in the following example to ensure that the screenshot encompasses only the viewport area.

```json
    "viewports": [
      [
        1920,
        1080
      ],
      [
        1366,
        768
      ],
      [
        360,
        640
      ]
    ],
```

### **Step 5:** Adding SmartUI function to take screenshot

- You can incorporate SmartUI into your custom `Selenium` automation test (any platform) script by adding the `smartuiSnapshot` function in the required segment of selenium script of which we would like to take the screenshot, as shown below: 
  

```ruby
require "selenium-webdriver"
require "lambdatest/selenium/driver"

driver = Selenium::WebDriver.for :chrome
driver.navigate.to "https://www.pinterest.com/pin/16958936087791895/"

# Take a snapshot
Lambdatest::Selenium::Driver.smartui_snapshot(driver, "Screenshot Name")

driver.quit
```

### **Step 6:** Execute the Tests on SmartUI Cloud

Execute `visual regression tests` on SmartUI using the following commands

```bash
npx smartui exec ruby sdkCloud.rb --config smartui-web.json
```
##  View SmartUI Results

You have successfully integrated SmartUI SDK with your Selenium tests. Visit your SmartUI project to view builds and compare snapshots between different test runs.

You can see the Smart UI dashboard to view the results. This will help you identify the Mismatches from the existing `Baseline` build and do the required visual testing.
