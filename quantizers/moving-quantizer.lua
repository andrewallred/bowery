--- quantizer example
-- a allred 2021
-- in1: voltage to quantize
-- in2: voltage to quantize
-- out1: in1 quantized to scale1 on clock pulses
-- out2: in2 quantized to scale2 on clock pulses
-- out3: tbd
-- out4: tbd

-- nb: scales should be written as semitones (cents optional) in ascending order
octaves = {0,12}
major = {0,2,4,5,7,9,11,12}
harmonicMinor = {0,2,3,5,7,8,10,12}
dorian = {0,2,3,5,7,9,10,12}
majorTriad = {0,4,7,12}
dominant7th = {0,4,7,10,12}

scales = { major, harmonicMinor, majorTriad }
count = 0
scaleIndex = 1


function quantize(volts,scale) 
	local octave = math.floor(volts)
	local interval = volts - octave
	local semitones = interval / 12
	local note = scale[math.floor(interval * #scale) + 1]
	note = note + 12 * octave
	return note
end

l1 = 0
-- streaming handler;
input[1].stream = function(volts)
    -- find current quantized note
	local newNote = quantize(volts,scales[scaleIndex])
	
	-- check if quantized voltage is equal to current voltage
    if newNote ~= l1 then
        output[1].volts = n2v(newNote)

        l1 = newNote
        count = count + 1
        if count % 256 == 0 then
            print("next scale")
            scaleIndex = scaleIndex % #scales + 1
        end
		
	end
end

-- streaming handler;
input[2].stream = function(volts)
	-- find current quantized note
	local newNote = quantize(volts,scales[scaleIndex])
	
	-- check if quantized voltage is equal to current voltage
	if n2v(newNote) ~= output[2].volts then
		output[2].volts = n2v(newNote)
	end
end


function init()
	input[1].mode('stream',0.005)
	input[2].mode('stream',0.005)
	print('quantizer loaded')
end

