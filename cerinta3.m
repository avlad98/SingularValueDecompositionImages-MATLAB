function [A_k S_z] = cerinta3(image, k)
	%Functia care rezolva cerinta 3
	
	A = imread(image);
	A = double(A);
	[m n] = size(A);
	[U S V] = svd(A);

	%SUBPUNCTUL 1
	miu = zeros(m, 1);
	for i = 1:m
		suma = 0;
		for j = 1:n
			suma = suma + A(i, j);
		end
		miu(i) = suma/n;
	end

	%SUBPUNCTUL 2
	for i = 1:m
		A(i, :) = A(i, :) - miu(i);
	end
	
	%SUBPUNCTUL 3
	Z = (1/sqrt(n-1))*A';
	
	%SUBPUNCTUL 4
	[U_z S_z V_z] = svd(Z);

	%SUBPUNCTUL 5
	W = V_z(:, 1:k);

	%SUBPUNCTUL 6
	Y = (W')*A;

	%SUBPUNCTUL 7
	A_k = W*Y + miu;
	
end