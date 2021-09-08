function Update(hObject,handles)
n = 0:255;
%n = 0:127;
N = 64;
  
phaR = get(handles.slider1, 'value');
phaG = get(handles.slider2, 'value');
phaB = get(handles.slider3, 'value');


handles.Rdata = abs(cos(2*pi.*n/N+phaR));
guidata(hObject,handles)

handles.Gdata = abs(cos(2*pi.*n/N+phaG));
guidata(hObject,handles)

handles.Bdata = abs(cos(2*pi.*n/N+phaB));
guidata(hObject,handles)


axes(handles.axes3);
plot(n, handles.Rdata, n, handles.Gdata, n, handles.Bdata);
axes(handles.axes2);
MapColor(handles.image, handles);


