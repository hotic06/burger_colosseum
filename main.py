import time
import subprocess
import requests

# get match list
with open("match_list.csv", 'r') as f:
    match_list = f.read().splitlines()
match_list = [x.split(" ") for x in match_list]
print("get match list")
print(match_list)

# loop
for red_side, blue_side in match_list:
    # start game run background
    subprocess.Popen(["bash", "./scripts/match.sh", red_side, blue_side])


    # wait start match
    time.sleep(30)
    # watch dog end of game
    while True:
        time.sleep(5) # 0.2 fps
        resp = requests.get("http://localhost:5000/warState")
        print(resp.text)
        if "stop" in resp.text:
            break

    time.sleep(3) # wait 3 sec for record match result
    # kill processes
    subprocess.call(["bash", "./scripts/kill_burger.sh"])
    # wait kill processes
    time.sleep(45)

