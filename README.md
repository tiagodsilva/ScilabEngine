# Scilab em RMarkdown 

Um exemplo bastante elementar de como utilizar Scilab em RMarkdown, que permite a emissão de relatórios que, em algumas etapas, podem ser convertidos em PDF e em HTML para divulgação na Web, por exemplo. Este programa foi testado no sistema operacional Ubuntu 20.04. 

Para utilizar o Scilab em RMarkdown, é necessário instalar o Scilab, o que pode ser feito com 
``` 
sudo apt install scilab 
```  
Em seguida, para garantirmos que o sistema está adequado, o comando 
``` 
scilab-cli -e "disp('Hello World');exit" 
``` 
deve imprimir `Hello World` no console. 



