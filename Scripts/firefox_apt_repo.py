import os
import sys
import requests

url = "https://support.mozilla.org/en-US/kb/install-firefox-linux"

def grab_page(url):
    response = requests.get(url)
    return response

def save_page(response, filename):
    with open(filename + ".html", "w") as file:
        file.write(response.text)

def get_code_from_response(response):
    # <code> code </code>
    code = response.text.split("<code>")[1:]
    code = [x.split("</code>")[0] for x in code]
    return code

def remove_tags_from_code(code):
    code =[x.replace("<strong>", "") for x in code]
    code =[x.replace("</strong>", "") for x in code]
    return code

if __name__ == "__main__":
    response = grab_page(url)
    codes = get_code_from_response(response)[1:13]
    codes = remove_tags_from_code(codes)
    f = open("codes.sh", "w")
    for i in codes[:-1]:
        f.write(i + "\n")
    last = codes[-1]
    last = last.replace("amp;", "")
    f.write(last+"\n")
    f.close()
    os.system("chmod +x codes.sh")
    os.system("./codes.sh")
    os.system('rm codes.sh')
    sys.exit(0)