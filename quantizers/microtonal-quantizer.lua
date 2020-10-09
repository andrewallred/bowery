--- microtonal quantizer example
-- andrew allred 2020.10.08
-- in1: clock
-- in2: voltage to quantize
-- out1: in2 quantized to scale1 on clock pulses
-- out2: in2 quantized to scale2 on clock pulses
-- out3: in2 quantized to scale3 continuously
-- out4: trigger pulses when out3 changes

function quantize(volts,notesPerOctave) 
    volts = math.abs(volts)
	local octave = math.floor(volts)
	local interval = math.floor((volts - octave) * notesPerOctave) / notesPerOctave
    local note = octave + interval
	return note
end


-- streaming handler;
input[1].stream = function(volts)
    -- find current quantized note    
    local notesPerOctave = math.floor((input[2].volts * 10) / 2) + 7
	local newNote = quantize(volts,notesPerOctave)
	
	-- check if quantized voltage is equal to current voltage
    if newNote ~= output[1].volts then	
        print(notesPerOctave);
        print(newNote);
		output[1].volts = newNote
	end
end


function init()
	input[1].mode('stream',0.005)
	print('microtonal quantizer loaded')
end

