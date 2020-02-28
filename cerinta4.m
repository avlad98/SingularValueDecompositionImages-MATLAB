function [A_k S_z] = cerinta4(image, k)
	%Functia care rezolva cerinta 4

	A = imread(image);
	A = double(A);
	[m n] = size(A);

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

	%Matricea de covarianta
	Z = (1/(n-1))*A*A';
	[V S] = eig(Z);

	%Spatiul k dimensional al PC
	W = V(:, 1:k);

	%SUBPUNCTUL 6
	Y = (W')*A;

	%SUBPUNCTUL 7
	A_k = W*Y + miu;

end