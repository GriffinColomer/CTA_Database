import tkinter as tk

class Database_Output(tk.Frame):
    def __init__(self, master=None, data=None, fields=None):
        super().__init__(master)
        self.grid()
        self.create_widgets(fields)
        if data:
            self.update(data)

    def create_widgets(self, fields):
        # create labels for each field in the tuple
        for i, field in enumerate(fields):
            tk.Label(self, text=field, relief=tk.RIDGE, width=12, font='Helvetica 10 bold').grid(row=0, column=i, sticky=tk.NSEW)
        
        # create a separator line
        tk.Frame(self, height=2, bd=1, relief=tk.SUNKEN).grid(row=1, columnspan=len(fields), sticky=tk.NSEW)
    
    def update(self, data):
        # clear any previous rows
        for widget in self.winfo_children():
            if isinstance(widget, tk.Label) and widget.grid_info()['row'] > 1:
                widget.grid_forget()
        
        # output each tuple as a row of labels
        for i, row in enumerate(data):
            for j, item in enumerate(row):
                tk.Label(self, text=item, relief=tk.RIDGE, font='Helvetica 10', anchor="w").grid(row=i+2, column=j, sticky=tk.NSEW)

def getFields(columns):
    fields = []
    for x in columns:
        fields.append(x[0])
    return tuple(fields)