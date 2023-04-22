import mysql.connector
import application

if __name__ == "__main__":
  # sets up the window for the output
  root = application.tk.Tk()

  # connects to the database
  mydb = mysql.connector.connect(
  host="127.0.0.1",
  user="root",
  password="Griffin",
  database="university"
  )
  mycursor = mydb.cursor()

  # sql commands to execute
  COMMANDS = [
    "select RegID, CourseName, ProfFname, ProfLname, StdFname, StdLname from registration, courses, professors, student where professors.ProfID = courses.ProfID and courses.courseID = registration.CourseID and student.StdNo = registration.StdNo",
    "select * from professors"
  ]
  # text that will go in the buttons and describe the command
  BUTTON_TEXT = [
    ("Button 1", "returns the registaration data along with the registration ID"),
    ("Button 2", "returns the all the professors")
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
  
