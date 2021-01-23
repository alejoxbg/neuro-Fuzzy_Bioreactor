Tm=0.2
U=Entrada;
Y=Salida;
N=length(U);


X=[Y(3:N-1),Y(2:N-2),Y(1:N-3),U(1:N-3),U(2:N-2),U(3:N-1)]';
Yd=[Y(4:N)]';

Red=newff(X,Yd,[10],{'tansig','purelin'},'trainlm');
Red.trainParam.epochs=500;
Red.dividefcn='';
Red=train(Red,X,Yd);
gensim(Red,Tm)