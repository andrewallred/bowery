-- streaming handler;
input[1].stream = function(volts)

    local v1 = math.abs(input[1].volts)
    local v2 = math.abs(input[2].volts)

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

    if v2 < .5 and v2 > 0 then
        output[3].volts = 10
    else
        output[3].volts = 0
    end

    if v2 < 5.5 and v2 > 5 then
        output[4].volts = 10
    else
        output[4].volts = 0
    end
	
end

function init()
	input[1].mode('stream',0.005)
	input[2].mode('stream',0.005)
	print('stepped comparator loaded')
end