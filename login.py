import tkinter as tk

class LoginScreen(tk.Frame):
    def __init__(self, master=None):
        super().__init__(master)
        self.master = master
        self.master.title("Login")
        self.grid()
        self.create_widgets()
        self.username = None
        self.password = None

    def create_widgets(self):
        # create username label and entry
        self.username_label = tk.Label(self, text="Username:")
        self.username_label.grid(row=0, column=0, sticky=tk.E)

        self.username_entry = tk.Entry(self)
        self.username_entry.grid(row=0, column=1)

        # create password label and entry
        self.password_label = tk.Label(self, text="Password:")
        self.password_label.grid(row=1, column=0, sticky=tk.E)

        self.password_entry = tk.Entry(self, show="*")
        self.password_entry.grid(row=1, column=1)

        # create login button
        self.login_button = tk.Button(self, text="Login", command=self.login)
        self.login_button.grid(row=2, columnspan=2)

    def login(self):
        # get entered username and password
        self.username = self.username_entry.get()
        self.password = self.password_entry.get()
        self.master.destroy()
    
    def get_username(self):
        # returns saved username
        return self.username

    def get_password(self):
        # returns saved password
        return self.password