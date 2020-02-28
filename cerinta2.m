function cerinta2()
	%Functia care rezolva cerinta 2
	%Obtine 4 grafice folosind SVD

  %imaginea pe care se testeaza:
  %image = './in/images/image1.gif'
  %image_out = './out/cerinta2_image1.gif'
  
  image_out = './out/cerinta2_image3.gif'
  image = './in/images/image3.gif'
  
	%SUBPUNCTUL 1
	A = imread(image);
	A = double(A);
	[m n] = size(A);

	k = [1:19 20:20:99 100:30:min(m, n)]';

	[U S V] = svd(A);
	
	S_d = diag(S);
	[sortedS i] = sort(S_d, 'descend');
	subplot(2, 2, 1);
	plot(sortedS);
  legend('Valorile singulare ale matricei A');
  grid on;
	hold on;

	%SUBPUNCTUL 2
	minim = min(m, n);
	[size_k c_k] = size(k);
	formula_b = zeros(size_k, 1);
	for i = 1:size_k
		S1 = 0;
		for j = 1:k(i)
			S1 = S1 + S_d(j);
		end

		S2 = 0;
		for j = 1:minim
			S2 = S2 + S_d(j);
		end

		formula_b(i) = S1/S2;
	end
	subplot(2, 2, 2);
	plot(k, formula_b);
  xlabel('Vectorul k');
  ylabel('Informatia data de primele k valori');
  grid on;
	hold on;	

	%SUBPUNCTUL 3
	suma = 0;
	eroare = zeros(size(k));
	for l = 1:length(k)
		A_k = cerinta1(image, k(l));
		A_k = double(A_k);
		for i = 1:m
			for j = 1:n
				suma = suma + (A(i,j) - A_k(i,j))^2;
			end
		end
		eroare(l) = suma/(m*n);
		suma = 0;
	end
	
	subplot(2, 2, 3);
	plot(k, eroare);
  xlabel('Vectorul k');
  ylabel('Eroarea');
  grid on;
	hold on;
	
	%SUBPUNCTUL 4
	rata_c = (1/m*n)*(m*k + n*k + k);
	subplot(2, 2, 4);
	plot(k, rata_c);
  xlabel('Vectorul k');
  ylabel('Rata de compresie');
  grid on;
	hold on;
  
  imwrite(uint8(A_k), image_out);
end