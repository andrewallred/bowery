--- let's try some acid

decay  = 0.8
attack = 0.04
chord  = { {0, 2, 4}, {-5, 2, 7}, {0, 4, 9}, {0, 2, 12}, {0, 2, 14}, {-5, 2, 4} }
sequence = { {1, 0, 0}, {1, 0, 0}, {1, 0, 0}, {1, .3, 0}, {1, 0, 0}, {1, .2, 0}, {1, 0, 0}, {1, 0, 0} }

count = 1
chordCount = 1
clockCount = 1

input[1].change = function(s)

    local step = sequence[count]
    if step[1] == 1 then
        output[1].slew = step[2]
        -- local selectedChord = math.floor(math.random(3))
        local stepChord = chord[chordCount]
        local selectedNote = math.floor(math.random(3))
        local note = stepChord[selectedNote]
        output[1].volts = (note / 12)
        output[2]() 
        -- if step[3] == 1 then 
        if math.floor(math.random(30)) < 3 then
            output[3]() 
        end
    end
    
    count = count % 8 + 1
    if count == 1 and math.floor(math.random(30)) < 3 then
        -- print('incrementing chord')
        chordCount = chordCount % #chord + 1
    end
    if count == 1 then
        clockCount = clockCount % 8 + 1
    end
    --print(clockCount)
    if count == 1 and clockCount == 1 then
        --print('clock')
        output[4]() 
    end    
end

function get_d() return decay end
function get_a() return attack end

t = {0,0}
function env(count)
  for i=1,2 do t[i] = t[i] + 1 end
end

function init()
    
    -- out params
    output[1].slew   = 0
    output[1].volts  = 0
    output[2].action = ar(get_a,get_d)
    output[3].action = ar(get_a,get_d)
    output[4].action = ar(get_a,get_d)
  
    -- start sequence!
    input[1]{ mode = 'change', direction = 'rising' }
    dec = metro.init{ event = env, time = 0.001 }
    dec:start()
  end