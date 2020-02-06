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


def monty_hall(door_picked, switch_doors, num_doors=3.0)
  # ? door_picked   =>  which door is initially selected
  # ? switch_doors  =>  will the user switch doors, boolean
  # ? num_doors     =>  number of doors available
  # ? 0: goat, 1: car
  # * if user picks 1, then randomly delete 2 or 3
  # * if user picks 2, the delete 3
  # * if user picks 3, the delete 2

  # doors_arr = Array.new(num_doors, door_prob)
  # door_prob_arr = [door_prob, door_prob_inv]
  
  door_prob = (1/num_doors)
  door_prob_inv = ((num_doors - 1)/num_doors)
  door_prob__arr = [door_prob, door_prob_inv]
  door_arr = [1,0]
  
  # p door_arr
  
  if (door_picked < num_doors)
    output = true
  else
    output = false
  end
  
  output

end

doors_arr = [1, 2, 3]
switch_doors_arr = [true, false]
num_doors = 3.0
iterations_f = 10000.0
iterations = iterations_f.to_i
output_arr = []

iterations.times do 
  output_arr << monty_hall(doors_arr.sample, switch_doors_arr.sample)
end

times_true = output_arr.count(true)

p (times_true / iterations_f)
