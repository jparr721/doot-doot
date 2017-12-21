import os, platform
if platform.system() == "Windows":
    import msvcrt # In case I wanna run this on windows

def menu():
    os.chdir("/")
    print("Current directory: "+os.getcwd())
    print("Brogrammer, the environment setup system")
    print("1 - Prep Linux Zone")
    opt = input("Select an option: ")

    if opt == "1":
        fresh = input("Fresh install? (y/n): ")
        fresh = True if fresh == "y" or fresh == "Y" else False
        prepare_linux_zone(fresh)

# Prepares the zone to be coded on. If fresh, install dependencies.
# Also it assumes atom is default editor. Personal preference.
def prepare_linux_zone(fresh):
    if platform.system() == "Linux" and not fresh:
        os.system("atom &")
    elif platform.system() == "Linux" and fresh:
        switch = input("Change direcotories? (y/n): ")
        clone = input("Download any github repositories? (y/n): ")
        if (switch == "y" or switch == "Y"):
            dirpath = input("What directory? (absolute): ")
            os.chdir(dirpath)
        while (clone != "n" or clone != "N"):
            repo = input("Enter a repo name: (Case Sensitive): ")
            user = input("Enter the user name: (Case Sensitive): ")
            https = True
            delivery = input("https or ssh? (https/ssh): ")
            https = True if delivery = "https" else False
            if (repo is not None and https):
                print("Cloning with https...")
                os.system("git clone https://github.com/"+user+"/"+repo+".git")
                print("Done")
            elif (repo is not None and not https):
                print("Cloning with ssh...")
                os.system("git clone git@github.com:"+user+"/"+repo+".git")
                print("Done")
            clone = input("Download any github repositories? (y/n): ")
        os.system("atom &")

if __name__ == "__main__":
    menu()
