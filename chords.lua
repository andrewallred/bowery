
chords = { {4, 7}, {3, 7}, {3, 6}, {1, 1} }

-- streaming handler; sets out3 & out4
input[1].stream = function(volts)

    local v = input[1].volts

    local chord = chords[1]
    
    local semitone = 1 / 12.0
    output[1].volts = v
    output[2].volts = v + chord[1] * semitone
    output[3].volts = v + chord[2] * semitone
	
end

function init()
	input[1].mode('stream',0.005)
	input[2].mode('stream',0.005)
	print('quantizer loaded')
end

