import requests, json

PATH = 'experiments/'
PERSON = 'Holmes'
PROBLEM = 'LondonTube'
DOMAIN = 'TRAINS'
INITIAL_STOP = 'watford'
GOAL_STOP = 'piccadilly_circus'
lines_stops = {}
lines = []
line_obj = ''
stop_obj = ''
person_obj = PERSON+' - person\n'


raw_lines = json.loads(requests.get("https://api.tfl.gov.uk/Line/Mode/tube").text)

for l in raw_lines:
    line = l['id']
    lines.append(line)

    response = json.loads(requests.get("https://api.tfl.gov.uk/Line/" + line + "/StopPoints").text)

    lines_stops[line] = []
    for stops in response:
        stop_cln = stops['commonName'].replace(' Underground Station','').replace(' ', '_').replace('(', '').replace(')', '').replace('.', '').replace('&', 'E').replace('\'', '').lower()
        lines_stops[line].append(stop_cln)



i = 0
for line in lines:
    line_obj += line + " "
    for stop in lines_stops[line]:
        if ' '+stop+' ' not in stop_obj:
            stop_obj += stop + " "
            i += 1
            if i%10 == 0: stop_obj += "\n"
stop_obj += "- stop\n"
line_obj += '- line\n'


header = ['(define (problem '+PROBLEM+') (:domain '+DOMAIN+')']
header.append('\n(:objects \n\n'+person_obj+'\n'+line_obj+'\n'+stop_obj+')\n')

states = ['\n(:init\n']
states.append('\n(at '+PERSON+' '+INITIAL_STOP+')\n\n')

for line in lines_stops:
    for stop in lines_stops[line]:
        states.append('(itinerary ' + line + ' ' + stop + ')\n')
states.append('\n)\n')

goal = ['\n(:goal (and\n']
goal.append('\n(at '+PERSON+' '+GOAL_STOP+')\n')
goal.append('(not (on-train '+PERSON+'))\n')
goal.append('\n)\n)\n)\n')



with open(PATH+PROBLEM+'.pddl', 'w') as file:
    file.writelines(header)
    file.writelines(states)
    file.writelines(goal)


# print(line_obj)
# print(stop_obj)
#
#
# print(lines)
# print(lines_stops)
#
# for line in lines:
#     print(line)
#     for stop in lines_stops[line]:
#         print("--> "+stop)