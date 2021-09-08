function MapColor(g, handles)
R = handles.Rdata;
G = handles.Gdata;
B = handles.Bdata;

for i=1:size(g,1)
    for j=1:size(g,2)
        ng(i,j,1)=255*R(floor(g(i,j,1)/2)+1);
        ng(i,j,2)=255*G(floor(g(i,j,1)/2)+1);
        ng(i,j,3)=255*B(floor(g(i,j,1)/2)+1);
    end
end

ng = mat2gray(ng);
axes(handles.axes2);
imshow(ng);