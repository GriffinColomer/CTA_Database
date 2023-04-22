import mysql.connector


if __name__ == "__main__":
  mydb = mysql.connector.connect(
  host="127.0.0.1",
  user="root",
  password="Griffin",
  database="university"
  )

  mycursor = mydb.cursor()

  mycursor.execute("select RegID, CourseName, ProfFname, ProfLname, StdFname, StdLname from registration, courses, professors, student where professors.ProfID = courses.ProfID and courses.courseID = registration.CourseID and student.StdNo = registration.StdNo")

  for x in mycursor:
    print(x)
