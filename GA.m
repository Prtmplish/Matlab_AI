clc
clear all
close all
 
%generation of genes randomly
%generate 10 genes each of length 30 using binary encoding
pool = randi([0,1], 10, 30); 
 
%fitness is decided based on summation of values for each gene
fitness = sum(pool,2);
 
%selection of best fittted genes
high_first = max(fitness);
for i = 1:10
  if fitness(i) == high_first
    a=i;
  end  
end
parent_one = pool(a,:);
disp('Parent 1:'), disp (parent_one)
 
high_second = max(fitness(fitness<max(fitness)));
for i = 1:10
  if fitness(i) == high_second
    a=i;
  end  
end
parent_two = pool(a,:);
disp('Parent 2:'), disp (parent_two)
 
%crossover is done at any random point
b = randi([1 , 30]);
for i = 1:30
  if i <= b
    child(i) = parent_one(i);
  else
    child(i) = parent_two(i);
  end  
end
disp('Crossover point:'), disp (b)
disp('Child after crossover:'), disp (child)
 
%mutation is done at any random point
c = randi([1 , 30]);
if child(c) == 0
  child(c) = 1;
end
disp('Mutation point:'), disp (c)
disp('Child after mutation:'), disp (child)