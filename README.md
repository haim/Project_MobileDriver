Android Wallet MobileAutomation Project Set up and Execution
================
Prerequisites
-------------

1. Please make sure you have installed all required software
    
         Follow the below documentation for Setup your Mac book or PC:

          Android Setup Link: https://pulse.kdc.capitalone.com/docs/DOC-100150
          Windows Setup Link: https://pulse.kdc.capitalone.com/docs/DOC-90243

2. Access to CapitalOne Git.(https://github.kdc.capitalone.com)

        Note:- Do not worry if you do not have access to Github repository.
        Please check below link to get access:
        https://pulse.kdc.capitalone.com/docs/DOC-100603


Project Setup
-------------
Step1 - Clone the repository. Go to Terminal and execute below command
               
         $git clone https://github.kdc.capitalone.com/pbb212/android-wallet-automation
   
Step2 - Install bundler gem on root directory- android-wallet-automation folder. Execute below command:

         $gem install bundler
         
Step3 - Install other gems

         Go to root directory- android-wallet-automation folder and execute below command to install all the gems:
         $bundle install
            
Step4 - Screen-Object Set up. Use the below script to pull the screen-object repository in to the global folder

        Go to directory- android-wallet-automation/global folder and execute below command:
        $./pullso.sh



Script Execution using Rake file
----------------

Start Appium Server

Please check tags in .feature file. (eg - @regression, @smoke etc)

Option 1. Running android Scripts from terminal (Manually providing application path).
        
        Go to android-wallet-automation folder in terminal 
        $rake run[tag_name,profile,app_path]

        $rake run[regression,samsung,/Users/pbb212/App/wallet-android.apk]


Viewing HTML Reports
----------------

Please go to Results folder under Project folder-android-wallet-automation to see reports.
You can also view screenshots of failed scenarios inside Results folder under Cucumber project folder.


Other Documentation
----------------

1. Mobile Automation Catalog
        
        https://pulse.kdc.capitalone.com/docs/DOC-79949


        
