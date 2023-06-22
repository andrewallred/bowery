
notes = {}
function addNote()
    table.insert(notes, input[1].volts)
end

function setMetro()

end

input[1].change = function(s)
    addNote()
end
  
input[2].stream = function(volts)
    if input[2].volts > 0 then
        m2.time = .27
    else
        m2.time = .25
    end
end

m1 = 0
m2 = 0
m3 = 0
function init()

    input[1].mode('change')
	input[2].mode('stream',0.005)

    m1 = metro.init{ event = out1
                    , time  = .25
                    , count = -1 -- nb: -1 is 'forever'
                    }

    m1:start()
    -- m1:stop()

    m2 = metro.init{ event = out2
                    , time  = .27
                    , count = -1 -- nb: -1 is 'forever'
                    }

    m2:start()
    -- m2:stop()

    m3 = metro.init{ event = out3
                    , time  = .5002
                    , count = -1 -- nb: -1 is 'forever'
                    }

    m3:start()
    -- m3:stop()

    output[4].action = ar(get_a,get_d)

end

c1 = 1
function out1()
    if c1 < #notes then
        output[1].volts = notes[c1]
        c1 = c1 + 1
    end    
end

c2 = 1
function out2()
    if c2 < #notes then
        output[2].volts = notes[c2]
        c2 = c2 + 1
    end    
end

c3 = 1
function out3()
    if c3 < #notes then
        output[3].volts = notes[c3]
        output[4]()
        c3 = c3 + 1
    end  
end