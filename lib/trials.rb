# ! Game show to select 1 of 3 doors, 1 with a car and 2 with a goat.
# ! After selection, the host opens one door with a goat.
# ! What is the probablity that you get the car from not switching vs switching doors
# ! Create a trial of the Monty hall problem provving through 10,000 iterations that your probablity of getting the car is 1/3 if you don't change doors, and 2/3 if you do.
# * Given num_doors = 3
# * P(x:  choose car) => 1/3
# * P(y:  choose goat) => 1/3 + 1/3 = 2/3
# * P(y|x:choose goat, given shown car) = 1/2
# * P(x|y:choose car, given shown goat) => prob of getting car without changing choice
# * P(x|y) = P(y|x) * P(x) / P(y) = 1/2 * 1/3 / 1/2 =>    1/3
# * P'(x|y) = prob of getting car by changing choice =>   2/3

def monty_hall(door_picked, switch_doors)
  # ? door_picked   =>  which door is initially selected
  # ? switch_doors  =>  will the user switch doors, boolean

  # * door_picked == 1
  # * if switch_doors => true, then     output = 1
  # * if switch_doors => false, then    output = 3
  # * door_picked > 1
  # * if switch_doors => true, then     output = 2
  # * if switch_doors => false, then    output = 4
  
  scen_one    = (door_picked == 1 && !switch_doors)
  scen_two    = (door_picked > 1 && switch_doors)
  scen_three  = (door_picked == 1 && switch_doors)
  scen_four   = (door_picked > 1 && !switch_doors)

  # ? Output => 
    # * 1: Success  w/ no switch
    # * 2: Success  w/ switch
    # * 3: Failure  w/ no switch
    # * 4: Failure  w/ switch
  
  if scen_one
    output = 1
  elsif scen_two
    output = 2
  elsif scen_three
    output = 3
  else scen_four
    output = 4
  end

  output
  
end


def monty_hall_iterations(iterations, num_doors=3.0)
  output_arr = []

  iterations.times do 
    door_picked = rand(1..num_doors.to_i)
    result = monty_hall(door_picked, [true, false].sample)
    output_arr << result
  end
  output_arr
end

# ? Test Params
num_doors = 3.0
iterations = 10000
output_arr = monty_hall_iterations(iterations, num_doors)

# ? OUTPUT
print 'Successful Trials without switching doors:   ', success_no_switch   = output_arr.count(1)
puts ''
print 'Successful Trials by switching doors:        ', success_switch      = output_arr.count(2)
puts ''

success = (success_no_switch + success_switch).to_f

print 'Number of doors:                             ', num_doors.to_i
puts ''
print 'Number of iterations:                        ', iterations
puts ''
puts 'Percent of Successful Trials by switching doors:', success_switch / success