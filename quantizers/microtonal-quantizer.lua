--- microtonal quantizer example
-- andrew allred 2020.10.08
-- in1: voltage to quantize
-- in2: sets notes per octave from 7 to 57
-- out1: in1 quantized in real time

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

