Tm=0.6
U=Entrada;
Y=Salida;
N=length(U);


X=[Y(5:N),Y(4:N-1),Y(3:N-2),Y(2:N-3),U(1:N-4),U(2:N-3),U(3:N-2)]';
Yd=[U(4:N-1)]';

Red=newff(X,Yd,[15],{'tansig','purelin'},'trainbr');
Red.trainParam.epochs=500;
Red.dividefcn='';
Red=train(Red,X,Yd);
gensim(Red,Tm)