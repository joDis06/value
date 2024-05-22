def boxText(text):
    L = len(text)
    return "/" + ("-"*L) + "\\\n" + "|" + text + "|\n" + "\\" + "-" * L + "/"

print(boxText("Sale"))
print(boxText("Welcome to Stuyvesant"))