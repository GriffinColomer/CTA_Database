import mysql.connector
import application
import login

if __name__ == "__main__":
   # sql commands to execute
  COMMANDS = [
    "SELECT * FROM train_station WHERE train_station.ada = FALSE",
    "SELECT last_name, first_name, gender FROM operator",
    "SELECT DISTINCT operator.* FROM operator INNER JOIN train ON operator.operator_id = train.operator_id",
    "SELECT stop_name, COUNT(*) AS num_buses FROM bus_stop JOIN bus ON bus.stop_id = bus_stop.stop_id GROUP BY stop_name",
    "SELECT * FROM operator WHERE hire_date < '1997-01-01'",
    "SELECT bus.bus_id, bus_schedule.route FROM bus INNER JOIN bus_schedule ON bus.bus_schedule_id = bus_schedule.bus_schedule_id",
    "SELECT train.train_id, train_schedule.route FROM train INNER JOIN train_schedule ON train.train_schedule_id = train_schedule.train_schedule_id",
    "SELECT * FROM train_station ts INNER JOIN line l ON ts.line_id = l.line_id WHERE l.red = TRUE",
    "SELECT b.*, o.first_name, o.last_name FROM bus b JOIN operator o ON b.operator_id = o.operator_id WHERE o.last_name LIKE 'S%'",
    "SELECT * FROM train_station WHERE line_id = 1 AND ada = TRUE",
    "SELECT operator_id, first_name, last_name, gender, CASE WHEN hire_date > DATE_SUB(CURRENT_DATE(), INTERVAL 20 YEAR) THEN 'Less than 20 year' WHEN hire_date > DATE_SUB(CURRENT_DATE(), INTERVAL 25 YEAR) THEN '20-25 years' ELSE 'More than 25 years' END AS tenure FROM operator ORDER BY tenure",
    "SELECT line_color, train_count, RANK() OVER (ORDER BY train_count DESC) AS count_rank FROM (SELECT t.line_color, COUNT(t.train_id) AS train_count FROM train t GROUP BY t.line_color) sub"
  ]
  # text that will go in the buttons and describe the command
  BUTTON_TEXT = [
    ("Button 1", "finds train stations that are not ADA complient"),
    ("Button 2", "gives the operators information displayed as last, first, gender"),
    ("Button 3", "gives operators that operate trains"),
    ("Button 4", "finds the number of buses that stop at each bus stop"),
    ("Button 5", "gives operators that have been working since before 2012"),
    ("Button 6", "gives bus number and its route"),
    ("Button 7", "gives trains and their routes"),
    ("Button 8", "gives all the stations that service the red line"),
    ("Button 9", "finds all buses operated by operators with a last name starting with 'S'"),
    ("Button 10", "finds all train stations on the green line that are ADA accessible"),
    ("Button 11", "gives you the tenure of each operator"),
    ("Button 12", "gives a ranking of train lines with the most trains scheduled for it")
  ]

  # sets up the login for the application
  login_page = login.tk.Tk()

  #acquires Login information for the database
  login_information = login.LoginScreen(login_page)
  login_information.mainloop()

  # Connects your local database if the schema exists already
  try:
    mydb = mysql.connector.connect(
    host="127.0.0.1",
    user=login_information.get_username(),
    password=login_information.get_password(),
    database='CTADatabase'
    )
    mycursor = mydb.cursor()

  # Connects to you local MySQL server and creates the database
  except:
    mydb = mysql.connector.connect(
    host="127.0.0.1",
    user=login_information.get_username(),
    password=login_information.get_password(),
    )
    mycursor = mydb.cursor()

    with open('.\database_app\CTA_Database.sql', 'r') as file:
      command = ""
      for line in file:
        if ';' in line:
          command += line.replace(';', '').strip()
          mycursor.execute(command)
          command = ""
        else:
          command += line.strip() + " "
      mydb.commit()

  # parses through the lists containing commands and button descriptions to give to the application
  button_data = []
  for button_text, command in zip(BUTTON_TEXT, COMMANDS):
    mycursor.execute(command)
    columns = mycursor.description 
    result = mycursor.fetchall()
    button_data.append((button_text[0], button_text[1], result, columns))

  # Runs the Gui
  button_sheet = application.tk.Tk()
  app = application.Application(master= button_sheet, button_data= button_data)
  app.mainloop()
  
