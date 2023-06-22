-- streaming handler;
input[1].stream = function(volts)

    local v = math.abs(input[1].volts)

    if v < .5 and v > 0 then
        output[1].volts = 10
    else
        output[1].volts = 0
    end

    if v < 3 and v > 2.5 then
        output[2].volts = 10
    else
        output[2].volts = 0
    end

    if v < 5.5 and v > 5 then
        output[3].volts = 10
    else
        output[3].volts = 0
    end

    if v < 8 and v > 7.5 then
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