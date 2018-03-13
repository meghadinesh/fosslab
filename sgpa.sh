
#!/bin/bash

$(pdftotext -layout -nopgbrk s1.pdf>s1.txt)
$(pdftotext -layout -nopgbrk s2.pdf>s2.txt)

$(grep -A 1 "MDL16CS" s1.txt > css1.txt)
$(grep -A 1 "MDL16CS" s2.txt > css2.txt)

$(sed -i 's/--//g' css1.txt)
$(sed -i 's/--//g' css2.txt)
$(sed -i 's/,//g' css1.txt)
$(sed -i 's/,//g' css2.txt)
$(sed -i 's/             / /g' css1.txt)
$(sed -i 's/             / /g' css2.txt)
$(sed -i 's/    /  /g' css1.txt)
$(sed -i 's/    /  /g' css2.txt)

sed -i 's/MA101//g' css1.txt
sed -i 's/PH100//g' css1.txt
sed -i 's/BE110//g' css1.txt
sed -i 's/BE10105//g' css1.txt
sed -i 's/BE103//g' css1.txt
sed -i 's/EE100//g' css1.txt
sed -i 's/PH110//g' css1.txt
sed -i 's/EE110//g' css1.txt
sed -i 's/\<CS110\>//g' css1.txt

sed -i 's/CY100//g' css2.txt
sed -i 's/BE100//g' css2.txt
sed -i 's/EC100//g' css2.txt
sed -i 's/CY110//g' css2.txt
sed -i 's/EC110//g' css2.txt
sed -i 's/MA102//g' css2.txt
sed -i 's/BE102//g' css2.txt
sed -i 's/\<CS100\>//g' css2.txt
sed -i 's/\<CS120\>//g' css2.txt

$(tr -d "\n" < css1.txt > cs_s1.txt)
$(tr -d "\n" < css2.txt > cs_s2.txt)

$(sed -i 's/MDL16CS/\nMDL16CS/g' cs_s1.txt)
$(sed -i 's/MDL16CS/\nMDL16CS/g' cs_s2.txt)

$(sed -i 's/(O)/10/g' cs_s1.txt) 
$(sed -i 's/(A+)/9/g' cs_s1.txt) 
$(sed -i 's/(A)/8.5/g' cs_s1.txt) 
$(sed -i 's/(B+)/8/g' cs_s1.txt) 
$(sed -i 's/(B)/7/g' cs_s1.txt) 
$(sed -i 's/(C)/6/g' cs_s1.txt) 
$(sed -i 's/(P)/5/g' cs_s1.txt)
$(sed -i 's/(F)/0/g' cs_s1.txt)

$(sed -i 's/(O)/10/g' cs_s2.txt)
$(sed -i  's/(A+)/9/g' cs_s2.txt)
$(sed -i  's/(A)/8.5/g' cs_s2.txt) 
$(sed -i  's/(B+)/8/g' cs_s2.txt)
$(sed -i  's/(B)/7/g' cs_s2.txt)
$(sed -i  's/(C)/6/g' cs_s2.txt)
$(sed -i  's/(P)/5/g'  cs_s2.txt)
$(sed -i 's/(F)/0/g' cs_s2.txt)

awk '{ s=0; s+=($2*4 + $3*4 + $4*3  + $5*3  + $6*3  + $7*3  + $8*1  + $9*1 + $10*1)/23; printf( "%s %.2f \n",$1,s)}' cs_s1.txt >CS_S1.txt

awk '{ s=0; s+=($2*4 + $3*4 + $4*3  + $5*1  + $6*1  + $7*4  + $8*3  + $9*3 + $10*1)/24; printf("%s %.2f \n",$1,s)}' cs_s2.txt >CS_S2.txt

join --nocheck-order CS_S1.txt CS_S2.txt > new.txt

awk '{ s=0; s+=($2*23 + $3*24)/(23+24); printf("%s %.2f \n",$1,s)}' new.txt > temp.txt

join --nocheck-order -1 6 -2 1 classlist.txt CS_S1.txt > csb.txt
join --nocheck-order csb.txt CS_S2.txt > t.txt
join --nocheck-order t.txt temp.txt > CSB.txt 

rm classlist.txt csb.txt css1.txt css2.txt cs_s1.txt cs_s2.txt CS_S1.txt CS_S2.txt new.txt s1.txt s1.pdf s2.pdf s2.txt t.txt temp.txt 

