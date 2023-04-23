from database_output import tk
import database_output

class Application(tk.Frame):
    def __init__(self, master=None, button_data=None):
        super().__init__(master)
        self.master = master
        self.master.title("Database Application")
        self.pack()
        self.create_widgets(button_data)

    def create_widgets(self, button_data):
        for button_text, description_text, result, columns in button_data:
            # Create a button and description
            button_frame = tk.Frame(self)
            button_frame.pack(side="top", pady=10, padx=5, anchor="w")
            button = tk.Button(button_frame, text=button_text, command=self.button_clicked(button_text, result, columns))
            button.pack(side="left")
            description = tk.Label(button_frame, text=description_text)
            description.pack(side="left", padx=10, anchor="w")

        # Create a quit button
        quit_button = tk.Button(self, text="Quit", fg="red", command=self.master.destroy)
        quit_button.pack(side="bottom", pady=10)

    def button_clicked(self, button_text, result, columns):
        def handler():
            db_window = tk.Toplevel(self.master)
            db_window.title(button_text)
            database_window = database_output.Database_Output(master=db_window, fields = database_output.getFields(columns))
            database_window.pack()
            database_window.update(result)
        return handler