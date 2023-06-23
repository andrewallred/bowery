-- comparator and shifter

-- variable to keep track of v2 voltage
lastV2 = 0

-- streaming handlers;
input[1].stream = function(volts)

    local v1 = math.abs(input[1].volts)

    if v1 < .5 and v1 > 0 then
        output[1].volts = 10
    else
        output[1].volts = 0
    end

    if v1 < 5.5 and v1 > 5 then
        output[2].volts = 10
    else
        output[2].volts = 0
    end
	
end

-- streaming handler;
input[2].stream = function(volts)

    local v2 = math.abs(input[2].volts)

    local diffV2 = lastV2 - v2

    output[3].volts = math.abs(output[3].volts + diffV2)
    --print(output[3].volts)
    
    lastV2 = v2

    if v2 < 5.5 and v2 > 5 then
        output[4].volts = 10
    else
        output[4].volts = 0
    end
	
end

function init()
	input[1].mode('stream',0.005)
    print('stepped comparator loaded')

	input[2].mode('stream',0.1)
    output[3].slew = .1
    print('shifter loaded')
end