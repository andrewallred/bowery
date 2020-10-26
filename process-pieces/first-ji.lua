--- just intonation melody box
-- each crow sings it's own song

c1 = 0
c2 = 0
c3 = 0
range1 = {0, 1, 2, 3, 4, 5, 6}
range2 = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}
range3 = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}

count = 0

decay  = 0.4
attack = 0.04

function play()
    output[1].volts = 5.0 * range1[c1+1]/15
    output[2].volts = 5.0 * range2[c2+1]/15
    output[3].volts = 5.0 * range3[c3+1]/15

    c1 = (c1 + 1) % #range1
    c2 = (c2 + 1) % #range2
    c3 = (c3 + 1) % #range3

    count = (count + 1) % 64
    if count == 0 then        
        output[4]() 
        print('pulse out')
    end
end

function update()
    table.insert(range1, range1[c1])
    table.insert(range2, range2[c2])
    table.insert(range3, range3[c3])
    print('added')
end

input[1].change = function(s)
  play()
end

input[2].change = function(s)
    update()
end

function init()
  -- out params
  output[1].slew   = 0
  output[2].slew   = 0
  output[3].slew   = 0
  output[4].action = ar(get_a,get_d)
  
  -- start sequence!
  input[1]{ mode = 'change', direction = 'rising' }
  input[2]{ mode = 'change', direction = 'rising' }
  dec = metro.init{ event = env, time = 0.1 }
  dec:start()
end

function get_d() return decay end
function get_a() return attack end