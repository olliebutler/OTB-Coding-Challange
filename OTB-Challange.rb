require 'tsort'

def dependancy_sort(string)

	lines_array = Array.new
	lines_array = string.split(/\n+/)
    
	job_hash = SortableHash[]

	lines_array.each { |x|  job = x.chars.first
							dependancy = x.chars.last
                            
                            if dependancy =~ /[[:alpha:]]/ && job =~ /[[:alpha:]]/ 
                                if job == dependancy
                                    return "ERROR: a job cannot depend on itself"
                                end
                                job_hash[job] = [dependancy] 
                            else if job =~ /[[:alpha:]]/
                                job_hash[job] = []
                            end
                            end 
						}
    begin 
        sorted_array = job_hash.tsort
    rescue TSort::Cyclic
        return "ERROR: cyclic dependancies"
    else
        sorted_list = sorted_array.join(",")
        return sorted_list
    end
end

class SortableHash < Hash
  include TSort
  alias tsort_each_node each_key
  def tsort_each_child(node, &block)
    fetch(node).each(&block)
  end
end

#assumes the string will be formatted in the following format with the first and last character on each
#line being the job and dependancy respectively

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



