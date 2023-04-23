import mysql.connector
import application

if __name__ == "__main__":
  # sets up the window for the output
  root = application.tk.Tk()

  # connects to the database
  mydb = mysql.connector.connect(
  host="127.0.0.1",
  user="root",
  password="passworddavid1",
  database="425deliverable3"
  )
  mycursor = mydb.cursor()

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
    "SELECT * FROM train_station WHERE line_id = 1 AND ada = TRUE"
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
    ("Button 10", "finds all train stations on the green line that are ADA accessible")
  ]

  # parses through te lists containg commands and button descriptions to give to the application
  button_data = []
  for button_text, command in zip(BUTTON_TEXT, COMMANDS):
    mycursor.execute(command)
    columns = mycursor.description 
    result = mycursor.fetchall()
    button_data.append((button_text[0], button_text[1], result, columns))

  # Runs the Gui
  app = application.Application(master= root, button_data= button_data)
  app.mainloop()
  
