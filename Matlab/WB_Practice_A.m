% Winter Break MATLAB Practice
% Given the array x, make the following changes and save under a new variable:

LINE = "------------------------------------------------------------------------------------------------------";

x=[2 19 3 11 55 58 10 12 70 33 44 56 81 1 130 66 95 32];

% 1. Add 12 to each element
x = x + 12;
disp(LINE);
% disp("x with each element increased by 12 is: ")
% disp(x)
disp("x with each element increased by 12 is: " + x);

% 2. Add the 2nd and 17th elements together
disp(LINE);
disp("The sum of the 2nd and 17th element is: ");
x_2nd_17th = x(2) + x(17);
disp(x_2nd_17th);

% 3. Compute the square root of each element (refer to element-wise
% operations)
disp(LINE);
x_sqrt = sqrt(x);
disp(x_sqrt);

% 4. Compute the square of each element
disp(LINE);
disp("The square of each element of the square root of x is x and displayed as so: ")
x_sqrt_squared = x_sqrt.^2;
disp(x_sqrt_squared);

% 5. Add 3 to just the odd elements
disp(LINE);
disp("Adding 3 to each odd element for x: ")
x_add3 = x_sqrt_squared;
for i = 1:length(x_add3)
    if mod(i, 2) == 1
        x_add3(i) = x_add3(i) + 3;
    end
end
disp(x_add3);

% 6. Redistribute x into a new 3-column array. Save the second column
% under a variable named "z"
disp(LINE);
array = reshape(x, [], 3);
disp("3-column array of x: ");
disp(array);
z = array(:,2);
disp("2nd column of x: ");
disp(z);
    
% 7. Display "Hello World!"
disp(LINE);
disp("Hello World!");

% 8. Display the 15th number from x"s array
disp(LINE);
disp("x's 15th element: ");
disp(x(15));

% Bonus: Using a while loop and the "ones" function, create a staircase of
% 1s as shown below (displayed in the command window, doesn"t need to be saved under a variable)

%1
%11
%111
%1111

disp(LINE);
i = 0;
while i <= 4
    disp(ones(1, i));
    i = i + 1;
end


