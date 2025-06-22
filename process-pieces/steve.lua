--- minimalism
-- each crow sings it's own song

pattern1 = {-1,2,4,7,11,12,16,19}
pattern2 = {-1,2,4,7}

count1 = 0
count2 = 0

decay  = 0.0
attack = 0.04

add1 = true
add2 = true
add3 = true

function play1()

    output[1].volts = 2 + (pattern1[(count1 % #pattern1) + 1]/12)
    --print(output[1].volts)

    if (count1 % 8) == 0 then        
        print('pulse out1 8 ')
    end

    if (count1 % 64) == 0 then        
        print('count1 64')
        
        local i1 = math.floor(math.random(#pattern1))
        local i2 = math.floor(math.random(#pattern1))
        -- print (i1)
        -- print (i2)
        -- print (#pattern1)
        local t1 = pattern1[i1]
        local t2 = pattern1[i2]
        pattern1[i1] = t2
        pattern1[i2] = t1

    end

    count1 = (count1 + 1) % 64

end

function play2()

  output[2].volts = 1 + (pattern2[(count2 % #pattern2) + 1]/12)
  --print(output[1].volts)

  if (count2 % 8) == 0 then        
      print('pulse out2 8 ')
  end

  if (count2 % 16) == 0 then        
      print('count2 64')
      
      local i1 = math.floor(math.random(#pattern2))
      local i2 = math.floor(math.random(#pattern2))
      -- print (i1)
      -- print (i2)
      -- print (#pattern1)
      local t1 = pattern2[i1]
      local t2 = pattern2[i2]
      pattern2[i1] = t2
      pattern2[i2] = t1

  end

  count2 = (count2 + 1) % 16

end

input[1].change = function(s)
  play1()
end

input[2].change = function(s)
  play2()
end

function init()
  -- out params
  output[1].slew   = 0
  output[2].slew   = 0
  output[3].action = pulse(.1 ,5, 1)
  output[4].action = pulse(.1 ,5, 1)
  
  -- start sequence!
  input[1]{ mode = 'change', direction = 'rising' }
  input[2]{ mode = 'change', direction = 'rising' }
  dec = metro.init{ event = env, time = 0.1 }
  dec:start()
end

function get_d() return decay end
function get_a() return attack end