--- microtonal quantizer example
-- andrew allred 2025.06.17
-- in1: voltage to quantize
-- in2: voltage to quantize
-- out1: in1 quantized in real time
-- out2: in1 trigger
-- out3: in2 quantized in real time
-- out4: tbd!

local notesPerOctave = 12

function quantize(volts,notesPerOctave) 
    volts = math.abs(volts)
	local octave = math.floor(volts)
	-- local index = ((volts - octave))
    local index = math.floor((volts - octave) * 10 / 3)
    -- note = math.floor(note * (abs*3 + 0.1))

    scale  =  {0,10,12} 
    -- print (scale[index+1])
    local interval = (scale[index+1] / notesPerOctave)

    local note = octave + interval
	return note
end

-- streaming handler;
input[1].stream = function(volts)
    -- find current quantized note    
	local newNote = quantize(volts,notesPerOctave)
	
	-- check if quantized voltage is equal to current voltage
    if newNote ~= output[1].volts then	
        -- print(notesPerOctave);
        print(newNote);
        output[1].volts = newNote
        output[2]()
	end
end

input[2].stream = function(volts)
    -- find current quantized note    
	local newNote = quantize(volts,notesPerOctave)
	
	-- check if quantized voltage is equal to current voltage
    if newNote ~= output[3].volts then	
        -- print(notesPerOctave);
        -- print(newNote);
        output[3].volts = newNote
	end
end


function init()
	input[1].mode('stream',0.005)
    input[2].mode('stream',0.005)

    output[2].action   = pulse(.1 ,5, 1)
	print('microtonal quantizer loaded')
end

