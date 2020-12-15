--- just intonation melody box
-- each crow sings it's own song

c1 = 0
c2 = 0
c3 = 0
range1 = {0,2,4,7,9}
range2 = {0, 3, 5, 7, 9, 11}
range3 = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}

count = 0

decay  = 0.4
attack = 0.04

add1 = true
add2 = true
add3 = true

notes = 15

function play()

    c1 = (c1 + 1) % #range1
    c2 = (c2 + 1) % #range2
    c3 = (c3 + 1) % #range3

    output[1].volts = 1.0 * range1[c1+1]/notes
    output[2].volts = 1.0 * range2[c2+1]/notes
    output[3].volts = 1.0 * range3[c3+1]/notes

    count = (count + 1) % 32
    if count == 0 then        
        output[4]() 
        print('pulse out')
        notes = notes - 1
        if notes < 3 then
            notes = 15
        end
        print(notes)
    end

end

function update()
    if add1 then
        table.insert(range1, range1[c1])
    end
    if not add1 then
        table.remove(range1, 1)
        c1 = c1 - 1
    end

    if #range1 > 25 then
        add1 = false
    end
    if #range1 < 7 then
        add1 = true
    end

    if add2 then
        table.insert(range2, range2[c2])
    end
    if not add2 then
        table.remove(range2, 1)
        c2 = c2 - 1
    end

    if #range2 > 55 then
        add2 = false
    end
    if #range2 < 7 then
        add2 = true        
    end

    table.insert(range3, range3[c3])
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