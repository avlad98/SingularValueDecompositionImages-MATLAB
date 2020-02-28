function cerinta5()
	%Functia care generaza 4 grafice pentru cerinta 5

  %imaginea pe care se testeaza:
  %image = './in/images/image1.gif'
  %image_out = './out/cerinta5_image1.gif'
  
  image_out = './out/cerinta5_image3.gif'
  image = './in/images/image3.gif'
  
	A = imread(image);
	A = double(A);
	[m n] = size(A);
  k = [1:19 20:20:99 100:30:min(m, n)]';

	[A_k S] = cerinta3(image, k);
  
	%SUBPUNCTUL 1
	subplot(2, 2, 1);
	plot(diag(S));
  legend('Valorile singulare ale matricei A');
  grid on;
	hold on;

	%SUBPUNCTUL 2
	S1 = 0;
	S2 = 0;
	for j = 1:length(k)

		for i = 1:k(j)
			S1 = S1 + S(i, i);
		end

		for i = 1:min(m, n)
			S2 = S2 + S(i, i);
		end

		informatie(j) = S1/S2;
	end

	subplot(2, 2, 2);
	plot(k, informatie);
  xlabel('Vectorul k');
  ylabel('Informatia data de primele k valori');
  grid on;
	hold on;


	%SUBPUNCTUL 3
	suma = 0;
	eroare = zeros(size(k));
	for l = 1:length(k)
		[A_k S_z] = cerinta3(image, k(l));
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
	for i = 1:length(k)
		rata_c(i) = (1/n)*(2*k(i) + 1);
	end

	subplot(2, 2, 4);
	plot(k, rata_c);
  xlabel('Vectorul k');
  ylabel('Rata de compresie');
  grid on;
	hold on;
  
  imwrite(uint8(A_k), image_out);
end