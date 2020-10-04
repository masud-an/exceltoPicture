clear;

#Function for Converting RGB to HEX

 function totalhex= fun(rgbValueInput);
 
hex1 = idivide (rgbValueInput(1), 16, "fix");
hexc1 = dec2hex(hex1);
hexce1 = num2str(hexc1);

hex2 =  rem (rgbValueInput(1), 16);
hexc2 = dec2hex(hex2);
hexce2 = num2str(hexc2);

hex3 = idivide (rgbValueInput(2), 16, "fix");
hexc3 = dec2hex(hex3);
hexce3 = num2str(hexc3);

hex4 =  rem (rgbValueInput(2), 16);
hexc4 = dec2hex(hex4);
hexce4 = num2str(hexc4);

hex5 = idivide (rgbValueInput(3), 16, "fix");
hexc5 = dec2hex(hex5);
hexce5 = num2str(hexc5);

hex6 =  rem (rgbValueInput(3), 16);
hexc6 = dec2hex(hex6);
hexce6 = num2str(hexc6);

totalhex = strcat(hexce1, hexce2, hexce3, hexce4, hexce5, hexce6); 

end


I = imread ("Picture.png");
fileID = fopen('allHexValues.txt', 'w');

pixel_value = input("Enter Row/Column value of pixel: ")

loop_value = pixel_value*pixel_value;
secondLoop_value = 2*loop_value;
Y = [0 0 0];


#fprintf(fileID,'%f \n',I);

for c = 1:loop_value
   X = [I(c) I(c+loop_value) I(c+secondLoop_value)];
   Y = [Y;X];
##   fprintf(fileID,'%d,%d,%d\n',X);
   
end




Y(1,:) = []; 
Z = [];
P = [];

for i = 1:loop_value
  P = fun(Y(i,:));
  Z = [Z;P];
endfor


for c = 1:loop_value
  for j = 1:6
    fprintf(fileID,'%s',Z(c,j));
  endfor
   fprintf(fileID,'\n');
end


fclose(fileID);

## This is the excel VBA code,. Goto View code of a worksheet and then paste this code
##Private Sub Worksheet_Change(ByVal Target As Range)
##    On Error GoTo bm_Safe_Exit
##    Application.EnableEvents = False
##    Dim rng As Range, clr As String
##    For Each rng In Target
##        If Len(rng.Value2) = 6 Then
##            clr = rng.Value2
##            rng.Interior.Color = _
##              RGB(Application.Hex2Dec(Left(clr, 2)), _
##                  Application.Hex2Dec(Mid(clr, 3, 2)), _
##                  Application.Hex2Dec(Right(clr, 2)))
##        End If
##    Next rng
##
##bm_Safe_Exit:
##    Application.EnableEvents = True
##End Sub
##

