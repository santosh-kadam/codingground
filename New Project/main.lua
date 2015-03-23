function DisplayMultipleLines(buf)
	--xip_display_lcd_clear_screen()
	str1=NIL
	str2=NIL
	str3=NIL
	str4=NIL
	
	print("DisplayMultipleLines:Line Received : "..buf)
	count = 1	
	result = ""
	Ypos = 20
    for word in buf:gmatch("%w+") do
        if(string.len(result)+string.len(word)+1 > 20) then
			Ypos = Ypos + 15
            print("DisplayMultipleLines:Line chunk : "..result)
			--xip_display_lcd_show_string(2,Ypos, result)
			count = count + 1
            result = word
            if (str1 == NIL) then
                str1 = result
            elseif (str2 == NIL) then 
                str2 = result
            elseif (str3 == NIL) then
                str3 = result
            else
                str4 = result
            end
                
        elseif(string.len(result)>0) then
            result = result.." "..word
        else
            result = word
        end
    end
	Ypos = Ypos + 15
    print("DisplayMultipleLines:Line chunk : "..result)
--	xip_display_lcd_show_string(2,Ypos, result)
--	xip_display_lcd_update_screen()
    return str1,str2,str3,str4
end

print("Hello World!")
st1,st2,st3,st4 = DisplayMultipleLines ("0123456789 0123456789 012345678901234567 123456789")
print ("st1 " .. st1)
print ("st2 " .. st2)
print ("st3 " .. st3)
--print ("st4" .. st4)
