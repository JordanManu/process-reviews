# Given a number in pounds and pence, work out the most efficient 
# way of breaking it down into notes and coins, e.g. 
# 11.55 becomes ["£10", "£1", "50p", "5p"]

# Acceptance Criteria
# change_generator.convert(6.42)
#  => ["£5", "£1", "20p", "20p", "2p"]
# change_generator.convert(40)
#  => ["£20", "£20"]
# change_generator.convert(16.30)
#  => ["£10", "£5", "£1", "20p", "10p"]
# change_generator.convert(19.99)
#  => ["£10", "£5", "£2", "£2", "50p", "20p", "20p", "5p", "2p", "2p"]
# change_generator.convert(76.81)
#  => ["£50", "£20", "£5", "£1", "50p", "20p", "10p", "1p"]

require 'byebug'

class ChangeGenerator

  CHANGE = [
    50.00,
    20.00,
    10.00,
    5.00,
    1.00,
    0.50,
    0.20,
    0.10,
    0.05,
    0.01
  ]

  def convert(money)
    result = []
    CHANGE.each do |c|
      while money >= c
        result.push(c)
        money = (money -= c).round(2)
      end
    end
    result
  end

end