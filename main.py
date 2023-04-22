import mysql.connector
import gui

if __name__ == "__main__":
  # sets up the window for the output
  root = gui.tk.Tk()
  # connects to the database
  mydb = mysql.connector.connect(
  host="127.0.0.1",
  user="root",
  password="Griffin",
  database="university"
  )

  # goes into database executes command and gets the attribute names(colums) as well as the data(result)
  mycursor = mydb.cursor()
  mycursor.execute("select RegID, CourseName, ProfFname, ProfLname, StdFname, StdLname from registration, courses, professors, student where professors.ProfID = courses.ProfID and courses.courseID = registration.CourseID and student.StdNo = registration.StdNo")
  columns = mycursor.description 
  result = mycursor.fetchall()

  # outputs the data into a the database output class to make the database screen
  output1 = gui.DatabaseOutput(root, fields = gui.getFields(columns))
  output1.pack()
  output1.update(result)

  # Runs the Gui
  root.mainloop()
  
