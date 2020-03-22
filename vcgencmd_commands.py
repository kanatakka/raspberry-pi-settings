import re
import subprocess

section_messages = [
    'Display temperature.',
    'Display frequency.',
    'Display voltage.',
    'Display memory arrocate.',
    'Display vcgencmd commands.',
]


print("Please input vcgencmd commands")
for index, item in enumerate(section_messages):
        print(str(index+1) + ": " + item)

section = input("input number ->")

if section == 1:
    print(subprocess.check_output(["vcgencmd", "measure_temp"]))
elif section == 2:
    print(subprocess.check_output(["vcgencmd", "measure_clock", "arm"]))
elif section == 3:
    print(subprocess.check_output(["vcgencmd", "measure_volts"]))
elif section == 4:
    print(subprocess.check_output(["vcgencmd", "get_mem", "arm"]))
elif section == 5:
    print(subprocess.check_output(["vcgencmd", "commands"]))
else:
    print('nooooo')
