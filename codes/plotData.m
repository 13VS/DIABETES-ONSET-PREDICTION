function plotData(X, y)
  figure; 
for i=1 :8
  for j=1:8
    subplot(8,8,8*(i-1)+j);
    hold on;
    pos = find(y==1); neg = find(y == 0);
    plot(X(pos, i), X(pos, j), 'k+','LineWidth', 0.5,  'MarkerSize', 3); 
    plot(X(neg, i), X(neg, j), 'rx','LineWidth', 0.5,  'MarkerSize', 3);
    if i==1
         xlabel('prg');
       elseif i==2
         xlabel('Glu');
       elseif i==3
         xlabel('BP');
       elseif i==4
         xlabel('Skin');
       elseif i==5
         xlabel('Ins');
       elseif i==6
         xlabel('BMI');
       elseif i==7
         xlabel('DPF');
       elseif i==8
         xlabel('Age');
     end
    if j==1
         ylabel('prg');
       elseif j==2
         ylabel('Glu');
       elseif j==3
         ylabel('BP');
       elseif j==4
         ylabel('Skin');
       elseif j==5
         ylabel('Ins');
       elseif j==6
         ylabel('BMI');
       elseif j==7
         ylabel('DPF');
       elseif j==8
         ylabel('Age');
     end
    

    hold off;

  end
end
legend('Diabetes +ve', 'Diabetes -ve')
end
