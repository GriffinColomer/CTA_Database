# CTA Database Project
## Setup
### Instalation Requirements
MySQL is the database used for this project so ensure you are using the correct database application.

This program is run in python make sure you have **Python  3.9** or above to check your version you can run, 
`python --version`
for windows or 
`python3 --version`
for linux ditributions.

The MySQL Connector driver is required for the project to work. To install use the command 
`python -m pip install mysql-connector-python`

### Download
To download the program either clone the repository with the command
`git clone https://github.com/GriffinColomer/CTA_Database.git`
or install as a zip file and unzip the project.

### Running
To run the program go into the root directory of the project and run `run.bat`.

Upon running you will be prompted for your local MySQL server's username and password. After entering your credentials and logging in, you will be given a list of buttons with the description of the sql commands that get run under them. Clicking one will create a new window with the output.