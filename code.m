
clear;
clc;
img = imread('lena_color.png');


timg = img(:,:,1); % RED CHANNEL

row = size(img,1);%number of rows
col = size(img,2);%number of cols


tic

%DNA_encode_rule

d   =  [];
add = [];
k1  =  [];
k2  =  [];
k3  =  [];
k4  =  [];
for i = 1:row*col
    x = dec2base(uint8(timg(i)),2,8); %8 bit base 2
%___      
    if x(1) == '0' && x(2) == '0';    
        k1 = 'A';
    elseif x(1) == '0' && x(2) == '1';
        k1 = 'C';  
    elseif x(1) == '1' && x(2) == '0';
        k1 = 'G';
    elseif x(1) == '1' && x(2) == '1';     
        k1 = 'T';
    end
%___
    if x(3) == '0' && x(4) == '0';    
        k2 = 'A';
    elseif x(3) == '0' && x(4) == '1';
        k2 = 'C';        
    elseif x(3) == '1' && x(4) == '0';
        k2 = 'G';
    elseif x(3) == '1' && x(4) == '1';     
        k2 = 'T';
    end
%___
    if x(5) == '0' && x(6) == '0';    
        k3 = 'A';
    elseif x(5) == '0' && x(6) == '1';
        k3 = 'C';        
    elseif x(5) == '1' && x(6) == '0';
        k3 = 'G';
    elseif x(5) == '1' && x(6) == '1';     
        k3 = 'T';
    end
%___
    if x(7) == '0' && x(8) == '0';    
        k4 = 'A';
    elseif x(7) == '0' && x(8) == '1';
        k4 = 'C';        
    elseif x(7) == '1' && x(8) == '0';
        k4 = 'G';
    elseif x(7) == '1' && x(8) == '1';     
        k4 = 'T';
    end
    d = [d k1 k2 k3 k4]; %encoded transitional image
end


i=1;
j=1;

%addition 
while i <row*col*4  
    
 if d(1,i)=='A' && d(1,i+1)=='A';
    i=i+2;
    add(1,j) = 'C';
    j=j+1;
 elseif d(1,i)=='A' && d(1,i+1)=='G';
    i=i+2;
    add(1,j) = 'T';
    j=j+1;
 elseif d(1,i)=='A' && d(1,i+1)=='C';
    i=i+2;
    add(1,j) = 'A';
    j=j+1;
 elseif d(1,i)=='A' && d(1,i+1)=='T';
    i=i+2;
    add(1,j) = 'G';
    j=j+1;
 elseif d(1,i)=='G' && d(1,i+1)=='A';
    i=i+2;
    add(1,j) = 'T';
    j=j+1;
 elseif d(1,i)=='G' && d(1,i+1)=='G';
    i=i+2;
    add(1,j) = 'C';
    j=j+1;
 elseif d(1,i)=='G' && d(1,i+1)=='C';
    i=i+2;
    add(1,j) = 'G';
    j=j+1;
 elseif d(1,i)=='G' && d(1,i+1)=='T';
    i=i+2;
    add(1,j) = 'A';
    j=j+1;
 elseif d(1,i)=='C' && d(1,i+1)=='A';
    i=i+2;
    add(1,j) = 'A';
    j=j+1;
 elseif d(1,i)=='C' && d(1,i+1)=='G';
    i=i+2;
    add(1,j) = 'G';
    j=j+1;
 elseif d(1,i)=='C' && d(1,i+1)=='C';
    i=i+2;
    add(1,j) = 'C';
    j=j+1;
 elseif d(1,i)=='C' && d(1,i+1)=='T';
    i=i+2;
    add(1,j) = 'T';
    j=j+1;
 elseif d(1,i)=='T' && d(1,i+1)=='A';
    i=i+2;
    add(1,j) = 'G';
    j=j+1;
 elseif d(1,i)=='T' && d(1,i+1)=='G';
    i=i+2;
    add(1,j) = 'A';
    j=j+1;
 elseif d(1,i)=='T' && d(1,i+1)=='C';
    i=i+2;
    add(1,j) = 'T';
    j=j+1;
 elseif d(1,i)=='T' && d(1,i+1)=='T';
    i=i+2;
    add(1,j) = 'C';
    j=j+1;
 end
 add=char(add);
end





%XOR
while i <row*col*2  
    
 if d(1,i)=='A' && d(1,i+1)=='A';
    i=i+2;
    add(1,j) = 'A';
    j=j+1;
 elseif d(1,i)=='A' && d(1,i+1)=='G';
    i=i+2;
    add(1,j) = 'G';
    j=j+1;
 elseif d(1,i)=='A' && d(1,i+1)=='C';
    i=i+2;
    add(1,j) = 'C';
    j=j+1;
 elseif d(1,i)=='A' && d(1,i+1)=='T';
    i=i+2;
    add(1,j) = 'T';
    j=j+1;
 elseif d(1,i)=='G' && d(1,i+1)=='A';
    i=i+2;
    add(1,j) = 'G';
    j=j+1;
 elseif d(1,i)=='G' && d(1,i+1)=='G';
    i=i+2;
    add(1,j) = 'A';
    j=j+1;
 elseif d(1,i)=='G' && d(1,i+1)=='C';
    i=i+2;
    add(1,j) = 'T';
    j=j+1;
 elseif d(1,i)=='G' && d(1,i+1)=='T';
    i=i+2;
    add(1,j) = 'C';
    j=j+1;
 elseif d(1,i)=='C' && d(1,i+1)=='A';
    i=i+2;
    add(1,j) = 'C';
    j=j+1;
 elseif d(1,i)=='C' && d(1,i+1)=='G';
    i=i+2;
    add(1,j) = 'T';
    j=j+1;
 elseif d(1,i)=='C' && d(1,i+1)=='C';
    i=i+2;
    add(1,j) = 'A';
    j=j+1;
 elseif d(1,i)=='C' && d(1,i+1)=='T';
    i=i+2;
    add(1,j) = 'G';
    j=j+1;
 elseif d(1,i)=='T' && d(1,i+1)=='A';
    i=i+2;
    add(1,j) = 'T';
    j=j+1;
 elseif d(1,i)=='T' && d(1,i+1)=='G';
    i=i+2;
    add(1,j) = 'C';
    j=j+1;
 elseif d(1,i)=='T' && d(1,i+1)=='C';
    i=i+2;
    add(1,j) = 'G';
    j=j+1;
 elseif d(1,i)=='T' && d(1,i+1)=='T';
    i=i+2;
    add(1,j) = 'A';
    j=j+1;
 end
 add=char(add);
end


%subtract
while i <row*col  
    
 if d(1,i)=='A' && d(1,i+1)=='A';
    i=i+2;
    add(1,j) = 'C';
    j=j+1;
 elseif d(1,i)=='A' && d(1,i+1)=='G';
    i=i+2;
    add(1,j) = 'T';
    j=j+1;
 elseif d(1,i)=='A' && d(1,i+1)=='C';
    i=i+2;
    add(1,j) = 'G';
    j=j+1;
 elseif d(1,i)=='A' && d(1,i+1)=='T';
    i=i+2;
    add(1,j) = 'A';
    j=j+1;
 elseif d(1,i)=='G' && d(1,i+1)=='A';
    i=i+2;
    add(1,j) = 'T';
    j=j+1;
 elseif d(1,i)=='G' && d(1,i+1)=='G';
    i=i+2;
    add(1,j) = 'C';
    j=j+1;
 elseif d(1,i)=='G' && d(1,i+1)=='C';
    i=i+2;
    add(1,j) = 'A';
    j=j+1;
 elseif d(1,i)=='G' && d(1,i+1)=='T';
    i=i+2;
    add(1,j) = 'G';
    j=j+1;
 elseif d(1,i)=='C' && d(1,i+1)=='A';
    i=i+2;
    add(1,j) = 'A';
    j=j+1;
 elseif d(1,i)=='C' && d(1,i+1)=='G';
    i=i+2;
    add(1,j) = 'G';
    j=j+1;
 elseif d(1,i)=='C' && d(1,i+1)=='C';
    i=i+2;
    add(1,j) = 'C';
    j=j+1;
 elseif d(1,i)=='C' && d(1,i+1)=='T';
    i=i+2;
    add(1,j) = 'T';
    j=j+1;
 elseif d(1,i)=='T' && d(1,i+1)=='A';
    i=i+2;
    add(1,j) = 'G';
    j=j+1;
 elseif d(1,i)=='T' && d(1,i+1)=='G';
    i=i+2;
    add(1,j) = 'A';
    j=j+1;
 elseif d(1,i)=='T' && d(1,i+1)=='C';
    i=i+2;
    add(1,j) = 'T';
    j=j+1;
 elseif d(1,i)=='T' && d(1,i+1)=='T';
    i=i+2;
    add(1,j) = 'C';
    j=j+1;
 end
 add=char(add);
end






i=1;
%complement


for i = 1:(row*col) 
       
        if add(i)=='A'
            add(i)='T';
        elseif add(i)=='T'
            add(i)='A';
        elseif add(i)=='C'
            add(i)='G';
        elseif add(i)=='G'
            add(i)='C';
        end        
    
end





r = 3.62; %system parameter
x(1) = 0.7; % initial value

s = row*col;
%Creation of Logistic function
for n=1:s-1
    x(n+1) = r*x(n)*(1-x(n));
end

[so,in] = sort(x);

% %Start of Confusion
timg = timg(:);
% for m = 1:size(timg,1)
%     
%     t1 = timg(m);
%     timg(m)=timg(in(m));
%     timg(in(m))=t1;
%     
% end
% End of confusion


%Creation of diffusion key

p=3.628;
k(1)=0.632;
for n=1:s-1
    k(n+1) = cos(p*acos(k(n)));
end
k = abs(round(k*255));

ktemp = de2bi(k);
ktemp = circshift(ktemp,1);
ktemp = bi2de(ktemp)';
key = bitxor(k,ktemp);

%Ending creation of diffusion key

%decode rule 
i=1;
decoded_img = [];
kk = [];
for i=1:(row*col)/2 
    if add(i)=='A';
        kk = '00';
    elseif add(i)=='C';
        kk = '01';  
    elseif add(i)=='G';
        kk = '10';
    elseif add(i)=='T';     
        kk = '11';
    end
    decoded_img = [decoded_img kk];
end


%Final Encryption Starts
timg = timg'; % complex conjugate transpose
timg = bitxor(uint8(key),uint8(timg)); % key,logistic map,decoded image
ttimg = bitxor(uint8(x),uint8(timg));
ttimg = bitxor(uint8(decoded_img),uint8(ttimg));
red_enc=ttimg;


%Final Encryption Ends
toc

timg = bitxor(uint8(key),uint8(red_enc));
timg = bitxor(uint8(x),uint8(timg));
timg = bitxor(uint8(decoded_img),uint8(timg));

timg = timg(:); %reshapes into col
% for m = size(timg,1):-1:1
%     
%     t1 = timg(m);
%     timg(m)=timg(in(m));
%     timg(in(m))=t1;
%     
% end

timg = reshape(timg,[row col]);


 red_dec=timg; %decrypted  
 
lossy_red_dec =red_dec -90; 
red_enc = reshape(red_enc,[row col]);
figure(1)
imshow(red_enc), title('red encrypted');

 timg = img(:,:,2); % GREEN CHANNEL
 
tic



%DNA_encode_rule

d   =  [];
add = [];
k1  =  [];
k2  =  [];
k3  =  [];
k4  =  [];
for i = 1:row*col
    x = dec2base(uint8(timg(i)),2,8);
%___      
    if x(1) == '0' && x(2) == '0';    
        k1 = 'A';
    elseif x(1) == '0' && x(2) == '1';
        k1 = 'C';  
    elseif x(1) == '1' && x(2) == '0';
        k1 = 'G';
    elseif x(1) == '1' && x(2) == '1';     
        k1 = 'T';
    end
%___
    if x(3) == '0' && x(4) == '0';    
        k2 = 'A';
    elseif x(3) == '0' && x(4) == '1';
        k2 = 'C';        
    elseif x(3) == '1' && x(4) == '0';
        k2 = 'G';
    elseif x(3) == '1' && x(4) == '1';     
        k2 = 'T';
    end
%___
    if x(5) == '0' && x(6) == '0';    
        k3 = 'A';
    elseif x(5) == '0' && x(6) == '1';
        k3 = 'C';        
    elseif x(5) == '1' && x(6) == '0';
        k3 = 'G';
    elseif x(5) == '1' && x(6) == '1';     
        k3 = 'T';
    end
%___
    if x(7) == '0' && x(8) == '0';    
        k4 = 'A';
    elseif x(7) == '0' && x(8) == '1';
        k4 = 'C';        
    elseif x(7) == '1' && x(8) == '0';
        k4 = 'G';
    elseif x(7) == '1' && x(8) == '1';     
        k4 = 'T';
    end
    d = [d k1 k2 k3 k4]; %encoded transitional image
end


i=1;
j=1;

%addition 
while i <row*col*4
    
 if d(1,i)=='A' && d(1,i+1)=='A';
    i=i+2;
    add(1,j) = 'C';
    j=j+1;
 elseif d(1,i)=='A' && d(1,i+1)=='G';
    i=i+2;
    add(1,j) = 'T';
    j=j+1;
 elseif d(1,i)=='A' && d(1,i+1)=='C';
    i=i+2;
    add(1,j) = 'A';
    j=j+1;
 elseif d(1,i)=='A' && d(1,i+1)=='T';
    i=i+2;
    add(1,j) = 'G';
    j=j+1;
 elseif d(1,i)=='G' && d(1,i+1)=='A';
    i=i+2;
    add(1,j) = 'T';
    j=j+1;
 elseif d(1,i)=='G' && d(1,i+1)=='G';
    i=i+2;
    add(1,j) = 'C';
    j=j+1;
 elseif d(1,i)=='G' && d(1,i+1)=='C';
    i=i+2;
    add(1,j) = 'G';
    j=j+1;
 elseif d(1,i)=='G' && d(1,i+1)=='T';
    i=i+2;
    add(1,j) = 'A';
    j=j+1;
 elseif d(1,i)=='C' && d(1,i+1)=='A';
    i=i+2;
    add(1,j) = 'A';
    j=j+1;
 elseif d(1,i)=='C' && d(1,i+1)=='G';
    i=i+2;
    add(1,j) = 'G';
    j=j+1;
 elseif d(1,i)=='C' && d(1,i+1)=='C';
    i=i+2;
    add(1,j) = 'C';
    j=j+1;
 elseif d(1,i)=='C' && d(1,i+1)=='T';
    i=i+2;
    add(1,j) = 'T';
    j=j+1;
 elseif d(1,i)=='T' && d(1,i+1)=='A';
    i=i+2;
    add(1,j) = 'G';
    j=j+1;
 elseif d(1,i)=='T' && d(1,i+1)=='G';
    i=i+2;
    add(1,j) = 'A';
    j=j+1;
 elseif d(1,i)=='T' && d(1,i+1)=='C';
    i=i+2;
    add(1,j) = 'T';
    j=j+1;
 elseif d(1,i)=='T' && d(1,i+1)=='T';
    i=i+2;
    add(1,j) = 'C';
    j=j+1;
 end
 add=char(add);
end


%XOR
while i <row*col*2  
    
 if d(1,i)=='A' && d(1,i+1)=='A';
    i=i+2;
    add(1,j) = 'A';
    j=j+1;
 elseif d(1,i)=='A' && d(1,i+1)=='G';
    i=i+2;
    add(1,j) = 'G';
    j=j+1;
 elseif d(1,i)=='A' && d(1,i+1)=='C';
    i=i+2;
    add(1,j) = 'C';
    j=j+1;
 elseif d(1,i)=='A' && d(1,i+1)=='T';
    i=i+2;
    add(1,j) = 'T';
    j=j+1;
 elseif d(1,i)=='G' && d(1,i+1)=='A';
    i=i+2;
    add(1,j) = 'G';
    j=j+1;
 elseif d(1,i)=='G' && d(1,i+1)=='G';
    i=i+2;
    add(1,j) = 'A';
    j=j+1;
 elseif d(1,i)=='G' && d(1,i+1)=='C';
    i=i+2;
    add(1,j) = 'T';
    j=j+1;
 elseif d(1,i)=='G' && d(1,i+1)=='T';
    i=i+2;
    add(1,j) = 'C';
    j=j+1;
 elseif d(1,i)=='C' && d(1,i+1)=='A';
    i=i+2;
    add(1,j) = 'C';
    j=j+1;
 elseif d(1,i)=='C' && d(1,i+1)=='G';
    i=i+2;
    add(1,j) = 'T';
    j=j+1;
 elseif d(1,i)=='C' && d(1,i+1)=='C';
    i=i+2;
    add(1,j) = 'A';
    j=j+1;
 elseif d(1,i)=='C' && d(1,i+1)=='T';
    i=i+2;
    add(1,j) = 'G';
    j=j+1;
 elseif d(1,i)=='T' && d(1,i+1)=='A';
    i=i+2;
    add(1,j) = 'T';
    j=j+1;
 elseif d(1,i)=='T' && d(1,i+1)=='G';
    i=i+2;
    add(1,j) = 'C';
    j=j+1;
 elseif d(1,i)=='T' && d(1,i+1)=='C';
    i=i+2;
    add(1,j) = 'G';
    j=j+1;
 elseif d(1,i)=='T' && d(1,i+1)=='T';
    i=i+2;
    add(1,j) = 'A';
    j=j+1;
 end
 add=char(add);
end


%subtract
while i <row*col  
    
 if d(1,i)=='A' && d(1,i+1)=='A';
    i=i+2;
    add(1,j) = 'C';
    j=j+1;
 elseif d(1,i)=='A' && d(1,i+1)=='G';
    i=i+2;
    add(1,j) = 'T';
    j=j+1;
 elseif d(1,i)=='A' && d(1,i+1)=='C';
    i=i+2;
    add(1,j) = 'G';
    j=j+1;
 elseif d(1,i)=='A' && d(1,i+1)=='T';
    i=i+2;
    add(1,j) = 'A';
    j=j+1;
 elseif d(1,i)=='G' && d(1,i+1)=='A';
    i=i+2;
    add(1,j) = 'T';
    j=j+1;
 elseif d(1,i)=='G' && d(1,i+1)=='G';
    i=i+2;
    add(1,j) = 'C';
    j=j+1;
 elseif d(1,i)=='G' && d(1,i+1)=='C';
    i=i+2;
    add(1,j) = 'A';
    j=j+1;
 elseif d(1,i)=='G' && d(1,i+1)=='T';
    i=i+2;
    add(1,j) = 'G';
    j=j+1;
 elseif d(1,i)=='C' && d(1,i+1)=='A';
    i=i+2;
    add(1,j) = 'A';
    j=j+1;
 elseif d(1,i)=='C' && d(1,i+1)=='G';
    i=i+2;
    add(1,j) = 'G';
    j=j+1;
 elseif d(1,i)=='C' && d(1,i+1)=='C';
    i=i+2;
    add(1,j) = 'C';
    j=j+1;
 elseif d(1,i)=='C' && d(1,i+1)=='T';
    i=i+2;
    add(1,j) = 'T';
    j=j+1;
 elseif d(1,i)=='T' && d(1,i+1)=='A';
    i=i+2;
    add(1,j) = 'G';
    j=j+1;
 elseif d(1,i)=='T' && d(1,i+1)=='G';
    i=i+2;
    add(1,j) = 'A';
    j=j+1;
 elseif d(1,i)=='T' && d(1,i+1)=='C';
    i=i+2;
    add(1,j) = 'T';
    j=j+1;
 elseif d(1,i)=='T' && d(1,i+1)=='T';
    i=i+2;
    add(1,j) = 'C';
    j=j+1;
 end
 add=char(add);
end



i=1;
%complement


for i = 1:(row*col)
       
        if add(i)=='A'
            add(i)='T';
        elseif add(i)=='T'
            add(i)='A';
        elseif add(i)=='C'
            add(i)='G';
        elseif add(i)=='G'
            add(i)='C';
        end        
    
end

%decode rule
i=1;
decoded_img = [];
kk = [];
for i=1:(row*col)/2
    if add(i)=='A';
        kk = '00';
    elseif add(i)=='C';
        kk = '01';  
    elseif add(i)=='G';
        kk = '10';
    elseif add(i)=='T';     
        kk = '11';
    end
    decoded_img = [decoded_img kk];
end

r = 3.62;
x(1) = 0.7;
s = row*col;
%Creation of Logistic function
for n=1:s-1
    x(n+1) = r*x(n)*(1-x(n));
end

[so,in] = sort(x);

%Start of Confusion
timg = timg(:);
% for m = 1:size(timg,1)
%     
%     t1 = timg(m);
%     timg(m)=timg(in(m));
%     timg(in(m))=t1;
%     
% end
%End of confusion


%Creation of diffusion key

p=3.628;
k(1)=0.632;
for n=1:s-1
    k(n+1) = cos(p*acos(k(n)));
end
k = abs(round(k*255));

ktemp = de2bi(k);
ktemp = circshift(ktemp,1);
ktemp = bi2de(ktemp)';
key = bitxor(k,ktemp);

%Ending creation of diffusion key


%Final Encryption Starts
timg = timg'; % complex conjugate transpose
timg = bitxor(uint8(key),uint8(timg)); % key,logistic map,decoded image
ttimg = bitxor(uint8(x),uint8(timg));
ttimg = bitxor(uint8(decoded_img),uint8(ttimg));
green_enc=ttimg;



%Final Encryption Ends
toc

timg = bitxor(uint8(key),uint8(green_enc));
timg = bitxor(uint8(x),uint8(timg));
timg = bitxor(uint8(decoded_img),uint8(timg));

timg = timg(:);
% for m = size(timg,1):-1:1
%     
%     t1 = timg(m);
%     timg(m)=timg(in(m));
%     timg(in(m))=t1;
%     
% end

timg = reshape(timg,[row col]);


 green_dec=timg;
 
 lossy_green_dec = green_dec -70;
 
 
 green_enc = reshape(green_enc,[row col]);
 figure(2)
imshow(green_enc), title('green encrypted');
 
timg = img(:,:,3); % BLUE CHANNEL
 
 
 tic

%DNA_encode_rule

d   =  [];
add = [];
k1  =  [];
k2  =  [];
k3  =  [];
k4  =  [];
for i = 1:row*col
    x = dec2base(uint8(timg(i)),2,8);
%___      
    if x(1) == '0' && x(2) == '0';    
        k1 = 'A';
    elseif x(1) == '0' && x(2) == '1';
        k1 = 'C';  
    elseif x(1) == '1' && x(2) == '0';
        k1 = 'G';
    elseif x(1) == '1' && x(2) == '1';     
        k1 = 'T';
    end
%___
    if x(3) == '0' && x(4) == '0';    
        k2 = 'A';
    elseif x(3) == '0' && x(4) == '1';
        k2 = 'C';        
    elseif x(3) == '1' && x(4) == '0';
        k2 = 'G';
    elseif x(3) == '1' && x(4) == '1';     
        k2 = 'T';
    end
%___
    if x(5) == '0' && x(6) == '0';    
        k3 = 'A';
    elseif x(5) == '0' && x(6) == '1';
        k3 = 'C';        
    elseif x(5) == '1' && x(6) == '0';
        k3 = 'G';
    elseif x(5) == '1' && x(6) == '1';     
        k3 = 'T';
    end
%___
    if x(7) == '0' && x(8) == '0';    
        k4 = 'A';
    elseif x(7) == '0' && x(8) == '1';
        k4 = 'C';        
    elseif x(7) == '1' && x(8) == '0';
        k4 = 'G';
    elseif x(7) == '1' && x(8) == '1';     
        k4 = 'T';
    end
    d = [d k1 k2 k3 k4]; %encoded transitional image
end

i=1;
j=1;

%addition 
while i <row*col*4
    
 if d(1,i)=='A' && d(1,i+1)=='A';
    i=i+2;
    add(1,j) = 'C';
    j=j+1;
 elseif d(1,i)=='A' && d(1,i+1)=='G';
    i=i+2;
    add(1,j) = 'T';
    j=j+1;
 elseif d(1,i)=='A' && d(1,i+1)=='C';
    i=i+2;
    add(1,j) = 'A';
    j=j+1;
 elseif d(1,i)=='A' && d(1,i+1)=='T';
    i=i+2;
    add(1,j) = 'G';
    j=j+1;
 elseif d(1,i)=='G' && d(1,i+1)=='A';
    i=i+2;
    add(1,j) = 'T';
    j=j+1;
 elseif d(1,i)=='G' && d(1,i+1)=='G';
    i=i+2;
    add(1,j) = 'C';
    j=j+1;
 elseif d(1,i)=='G' && d(1,i+1)=='C';
    i=i+2;
    add(1,j) = 'G';
    j=j+1;
 elseif d(1,i)=='G' && d(1,i+1)=='T';
    i=i+2;
    add(1,j) = 'A';
    j=j+1;
 elseif d(1,i)=='C' && d(1,i+1)=='A';
    i=i+2;
    add(1,j) = 'A';
    j=j+1;
 elseif d(1,i)=='C' && d(1,i+1)=='G';
    i=i+2;
    add(1,j) = 'G';
    j=j+1;
 elseif d(1,i)=='C' && d(1,i+1)=='C';
    i=i+2;
    add(1,j) = 'C';
    j=j+1;
 elseif d(1,i)=='C' && d(1,i+1)=='T';
    i=i+2;
    add(1,j) = 'T';
    j=j+1;
 elseif d(1,i)=='T' && d(1,i+1)=='A';
    i=i+2;
    add(1,j) = 'G';
    j=j+1;
 elseif d(1,i)=='T' && d(1,i+1)=='G';
    i=i+2;
    add(1,j) = 'A';
    j=j+1;
 elseif d(1,i)=='T' && d(1,i+1)=='C';
    i=i+2;
    add(1,j) = 'T';
    j=j+1;
 elseif d(1,i)=='T' && d(1,i+1)=='T';
    i=i+2;
    add(1,j) = 'C';
    j=j+1;
 end
 add=char(add);
end


%XOR
while i <row*col*2  
    
 if d(1,i)=='A' && d(1,i+1)=='A';
    i=i+2;
    add(1,j) = 'A';
    j=j+1;
 elseif d(1,i)=='A' && d(1,i+1)=='G';
    i=i+2;
    add(1,j) = 'G';
    j=j+1;
 elseif d(1,i)=='A' && d(1,i+1)=='C';
    i=i+2;
    add(1,j) = 'C';
    j=j+1;
 elseif d(1,i)=='A' && d(1,i+1)=='T';
    i=i+2;
    add(1,j) = 'T';
    j=j+1;
 elseif d(1,i)=='G' && d(1,i+1)=='A';
    i=i+2;
    add(1,j) = 'G';
    j=j+1;
 elseif d(1,i)=='G' && d(1,i+1)=='G';
    i=i+2;
    add(1,j) = 'A';
    j=j+1;
 elseif d(1,i)=='G' && d(1,i+1)=='C';
    i=i+2;
    add(1,j) = 'T';
    j=j+1;
 elseif d(1,i)=='G' && d(1,i+1)=='T';
    i=i+2;
    add(1,j) = 'C';
    j=j+1;
 elseif d(1,i)=='C' && d(1,i+1)=='A';
    i=i+2;
    add(1,j) = 'C';
    j=j+1;
 elseif d(1,i)=='C' && d(1,i+1)=='G';
    i=i+2;
    add(1,j) = 'T';
    j=j+1;
 elseif d(1,i)=='C' && d(1,i+1)=='C';
    i=i+2;
    add(1,j) = 'A';
    j=j+1;
 elseif d(1,i)=='C' && d(1,i+1)=='T';
    i=i+2;
    add(1,j) = 'G';
    j=j+1;
 elseif d(1,i)=='T' && d(1,i+1)=='A';
    i=i+2;
    add(1,j) = 'T';
    j=j+1;
 elseif d(1,i)=='T' && d(1,i+1)=='G';
    i=i+2;
    add(1,j) = 'C';
    j=j+1;
 elseif d(1,i)=='T' && d(1,i+1)=='C';
    i=i+2;
    add(1,j) = 'G';
    j=j+1;
 elseif d(1,i)=='T' && d(1,i+1)=='T';
    i=i+2;
    add(1,j) = 'A';
    j=j+1;
 end
 add=char(add);
end


%subtract
while i <row*col  
    
 if d(1,i)=='A' && d(1,i+1)=='A';
    i=i+2;
    add(1,j) = 'C';
    j=j+1;
 elseif d(1,i)=='A' && d(1,i+1)=='G';
    i=i+2;
    add(1,j) = 'T';
    j=j+1;
 elseif d(1,i)=='A' && d(1,i+1)=='C';
    i=i+2;
    add(1,j) = 'G';
    j=j+1;
 elseif d(1,i)=='A' && d(1,i+1)=='T';
    i=i+2;
    add(1,j) = 'A';
    j=j+1;
 elseif d(1,i)=='G' && d(1,i+1)=='A';
    i=i+2;
    add(1,j) = 'T';
    j=j+1;
 elseif d(1,i)=='G' && d(1,i+1)=='G';
    i=i+2;
    add(1,j) = 'C';
    j=j+1;
 elseif d(1,i)=='G' && d(1,i+1)=='C';
    i=i+2;
    add(1,j) = 'A';
    j=j+1;
 elseif d(1,i)=='G' && d(1,i+1)=='T';
    i=i+2;
    add(1,j) = 'G';
    j=j+1;
 elseif d(1,i)=='C' && d(1,i+1)=='A';
    i=i+2;
    add(1,j) = 'A';
    j=j+1;
 elseif d(1,i)=='C' && d(1,i+1)=='G';
    i=i+2;
    add(1,j) = 'G';
    j=j+1;
 elseif d(1,i)=='C' && d(1,i+1)=='C';
    i=i+2;
    add(1,j) = 'C';
    j=j+1;
 elseif d(1,i)=='C' && d(1,i+1)=='T';
    i=i+2;
    add(1,j) = 'T';
    j=j+1;
 elseif d(1,i)=='T' && d(1,i+1)=='A';
    i=i+2;
    add(1,j) = 'G';
    j=j+1;
 elseif d(1,i)=='T' && d(1,i+1)=='G';
    i=i+2;
    add(1,j) = 'A';
    j=j+1;
 elseif d(1,i)=='T' && d(1,i+1)=='C';
    i=i+2;
    add(1,j) = 'T';
    j=j+1;
 elseif d(1,i)=='T' && d(1,i+1)=='T';
    i=i+2;
    add(1,j) = 'C';
    j=j+1;
 end
 add=char(add);
end



i=1;
%complement


for i = 1:(row*col)
       
        if add(i)=='A'
            add(i)='T';
        elseif add(i)=='T'
            add(i)='A';
        elseif add(i)=='C'
            add(i)='G';
        elseif add(i)=='G'
            add(i)='C';
        end        
    
end

%decode rule 
i=1;
decoded_img = [];
kk = [];
for i=1:(row*col)/2
    if add(i)=='A';
        kk = '00';
    elseif add(i)=='C';
        kk = '01';  
    elseif add(i)=='G';
        kk = '10';
    elseif add(i)=='T';     
        kk = '11';
    end
    decoded_img = [decoded_img kk];
end


r = 3.62;
x(1) = 0.7;
s = row*col;
%Creation of Logistic function
for n=1:s-1
    x(n+1) = r*x(n)*(1-x(n));
end

[so,in] = sort(x);

%Start of Confusion
timg = timg(:);
% for m = 1:size(timg,1)
%     
%     t1 = timg(m);
%     timg(m)=timg(in(m));
%     timg(in(m))=t1;
%     
% end
%End of confusion


%Creation of diffusion key

p=3.628;
k(1)=0.632;
for n=1:s-1
    k(n+1) = cos(p*acos(k(n)));
end
k = abs(round(k*255));

ktemp = de2bi(k);
ktemp = circshift(ktemp,1);
ktemp = bi2de(ktemp)';
key = bitxor(k,ktemp);

%Ending creation of diffusion key


%Final Encryption Starts
timg = timg'; %complex conjugate transpose
timg = bitxor(uint8(key),uint8(timg)); %key,logistic map,decoded image
ttimg = bitxor(uint8(x),uint8(timg));
ttimg = bitxor(uint8(decoded_img),uint8(ttimg));
blue_enc=ttimg;


%Final Encryption Ends
toc

timg = bitxor(uint8(key),uint8(blue_enc));
timg = bitxor(uint8(x),uint8(timg));
timg = bitxor(uint8(decoded_img),uint8(timg));

timg = timg(:); %reshapes into col
% for m = size(timg,1):-1:1
%     
%     t1 = timg(m);
%     timg(m)=timg(in(m));
%     timg(in(m))=t1;
%     
% end

timg = reshape(timg,[row col]);


blue_dec=timg;
 
 lossy_blue_dec = blue_dec -20;
 
 
blue_enc = reshape(blue_enc,[row col]);
figure(3)
imshow(blue_enc), title('blue encrypted');
 
 final_encrypted=cat(3,red_enc,green_enc,blue_enc);%Concatenates arrays 
 figure(4)
 imshow(final_encrypted), title('Final encrypted image');
 
 back_to_original_img = cat(3,red_dec,green_dec,blue_dec);
 figure(5)
 imshow(back_to_original_img), title('Retrieved image');
 
 
 data_loss_img = cat(3,lossy_red_dec,lossy_green_dec,lossy_blue_dec); 
 figure(6)
 imshow(data_loss_img), title('Data loss attack');
 

figure(7)
imhist(img), title('Plain image histogram');

figure(8)
imhist(final_encrypted), title('Cipher image histogram');
figure(9)
imhist(back_to_original_img), title('Retrieved image histogram');




%Entropy Test

E1 = entropy(red_enc)
E2 = entropy(green_enc)
E3 = entropy(blue_enc)
E4 = entropy(final_encrypted)




%PSNR - Value should be high

origImg = double(img);
distImg = double(timg);

[M N] = size(origImg);
error = origImg - distImg;
MSE = sum(sum(error .* error)) / (M * N);

if(MSE > 0)
    PSNR = 10*log(255*255/MSE) / log(10)
else
    PSNR = 99
end



figure(10)
%Pixel Correlation

    %%horizontal
    A=double(img);
    A2 = double(final_encrypted);
    x1 = A(:,1:end-1);  
    y1 = A(:,2:end);
    h_p=hesap(x1,y1);
    %%Vertical
    x2 = A(1:end-1,:);  
    y2 = A(2:end,:);    
    v_p=hesap(x2,y2);
    %%diagonal
    x3 = A(1:end-1,1:end-1);  
    y3 = A(2:end,2:end);     
    d_p=hesap(x3,y3);

    %%==================================================
    %%for encrypted image
    %%horizontal
    x4 = A2(:,1:end-1);  
    y4 = A2(:,2:end);
    h_c=hesap(x4,y4);
    %%Vertical
    x5 = A2(1:end-1,:);  
    y5 = A2(2:end,:);    
    v_c=hesap(x5,y5);
    %%diagonal
    x6 = A2(1:end-1,1:end-1);  
    y6 = A2(2:end,2:end);     
    d_c=hesap(x6,y6);
    %%==================================================
    %%graphics
    
    subplot(3,2,1),grafik(x1,y1),title('Horizontal');%correlation distribution
    subplot(3,2,3),grafik(x2,y2),title('Vertical');
    subplot(3,2,5),grafik(x3,y3),title('Diagonal');
    subplot(3,2,2),grafik(x4,y4),title('Horizontal');
    subplot(3,2,4),grafik(x5,y5),title('Vertical');
    subplot(3,2,6),grafik(x6,y6),title('Diagonal');
    
    
    
