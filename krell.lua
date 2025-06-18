--- sample & hold krell
-- in1: sampling clock
-- out1: random sample krell

scale  = { {2,4,7,9,12,14,16}, {0,2,4,5} }

function init()
    input[1].mode('change',1,0.1,'rising')
    input[2].mode('change',1,0.1,'rising')
end

input[1].change = function()
    t = math.floor((math.random() * 5) + 1)
    note = scale[1][t]
    
    output[1].volts = note/12
end

input[2].change = function()
    t = math.floor((math.random() * 5) + 1)
    note = scale[2][t]
    
    output[3].volts = note/12
end