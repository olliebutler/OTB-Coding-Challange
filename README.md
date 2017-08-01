# OTB Coding Challange

Assumes the string will be formatted in the following format with one job per line and the first and last character on each line being the job and dependancy respectivel.


SMPLE INPUTS AND OUTPUTS 

test_string = %(

a => b

b => 

c => 

)

puts dependancy_sort(test_string) #=> b,a,c

test_string2 = %(
a => 
b => c
c => f
d => a
e => b
f => 
)

puts dependancy_sort(test_string2) #=> a,f,c,b,d,e

test_string3 = %(
a => a
b => b
c => 
)

puts dependancy_sort(test_string3) #=> ERROR: a job cannot depend on itself

test_string4 = %(
a => b
b => a
c => 
)

puts dependancy_sort(test_string4) #=> ERROR: cyclic dependancies
