

count1 = 0
count2 = 0

-- Use a trigger to advance ER counters and activate ASLs on hits
input[1].change = function(state) 

    print(count1)    

    if count1 == 5 and math.random()*100 < 80 then                    
        output[1]()
        print("bass fill")
    end

    count1 = count1 + 1
    if count2 == 0 then
        count1 = count1 % 4
    end

end

input[2].change = function(state) 

    count2 = count2 + 1
    
    output[1]()

    count2 = count2 % 4
    

end

function init()
	input[1].mode('change',1,0.1,'rising')
	--input[2].mode('stream',0.0005)
    input[2].mode('change',1,0.1,'rising')

	for i=1,4 do 
		output[i].action = pulse(0.02,8)
	end
end
