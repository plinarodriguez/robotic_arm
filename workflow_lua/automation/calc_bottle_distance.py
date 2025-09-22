x_start_Bottle1 = 101.500
x_start_Bottle2 = 46.0
x_start_Bottle3 = -13.0

y_start_Bottle1 = -288.715
y_start_Bottle2 = -288.719
y_start_Bottle3 = -288.717

# Bottle1: j1,j2,j3,j4,j5,j6 = 90.104,-77.245,149.903,-60.867,90.541,-90.070
# Bottle2: j1,j2,j3,j4,j5,j6 = 72.470,-78.986,153.091,-61.787,73.287,-93.776
# Bottle3: j1,j2,j3,j4,j5,j6 = 54.018,-78.950,153.486,-60.148,55.323,-98.485

x_diff_b12 = x_start_Bottle1 -x_start_Bottle2
x_diff_b23 = x_start_Bottle2 -x_start_Bottle3
x_diff_b13 = x_start_Bottle1 -x_start_Bottle3

y_diff_b12 = y_start_Bottle1 -y_start_Bottle2
y_diff_b23 = y_start_Bottle2 -y_start_Bottle3
y_diff_b13 = y_start_Bottle1 -y_start_Bottle3

print(f'x_diff_b12 = {x_diff_b12}')
print(f'x_diff_b23 = {x_diff_b23}')
print(f'x_diff_b13 = {x_diff_b13/2}')
print(f'y_diff_b12 = {y_diff_b12}')
print(f'y_diff_b23 = {y_diff_b23}')
print(f'y_diff_b13 = {y_diff_b13}')