function disk4()
  curve0=8.65372791291102+0i;
  col0=0.077225492255425;
  [curve1,col1]  =runalldisk(0.077226,0.08,8.5,0.4,0);
  [curve2,col2]  =runalldisk(0.08,0.09,8.1,0.9,0);
  [curve3,col3]  =runalldisk(0.09,0.11,7.5,1.0,0);
  [curve4,col4]  =runalldisk(0.11,0.13,7.0,1.2,0);
  [curve5,col5]  =runalldisk(0.13,0.16,6.5,1.0,0);
  [curve6,col6]  =runalldisk(0.16,0.18,6.0,0.7,0);
  [curve7,col7]  =runalldisk(0.18,0.18979,5.5,0.4,0);
  
  curvex=5.52007811028631;
  colx=0.189791479516754+0i;
  [curve8,col8]  =runalldisk(0.18979,0.2,5.3,0.5,0);
  [curve9,col9]  =runalldisk(0.2,0.24,5,1,0);
  [curve10,col10]=runalldisk(0.24,0.3,4.5,1.5,0);
  [curve11,col11]=runalldisk(0.3,0.4,4,1.5,0);
  [curve12,col12]=runalldisk(0.4,0.5,3.6,1.5,0);
  [curve13,col13]=runalldisk(0.5,0.999,3.2,1.5,0);
  
    curve=[curve0;curve1; curve2; curve3; curve4; curve5; curve6; curve7; curvex; curve8; curve9; curve10; curve11; curve12; curve13];
    nnn=[col0;col1; col2; col3; col4; col5; col6; col7; colx; col8; col9; col10; col11; col12; col13];
    save('disk4.mat','curve','nnn');
end