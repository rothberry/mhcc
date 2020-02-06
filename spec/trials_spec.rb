describe "trials" do

  # * 3 doors
  # * Test 1: with 10,000 iterations, percentage of success w/o  switch
  # * Test 2: with 10,000 iterations, percentage of success w/switch
  describe "3 doors" do
    it "Num Success w/ switching" do
      test_out = monty_hall_iterations(10000.0, 3.0) * 100
      p '3 doors (~.66 expected):'
      p test_out / 100 
      expect(test_out).to be_between(64, 68)
    end
  end
  
  # * 100 doors
  # * Test 3: with 10,000 iterations, percentage of success w/o  switch
  describe "100 doors" do
    it "Num Success w/ switching" do
      test_out = monty_hall_iterations(10000.0, 100.0) * 100
      p '100 doors percentage (~99% expected):'
      p test_out / 100 
      expect(test_out).to be_between(98, 100)
    end
  end

end
