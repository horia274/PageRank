# PageRank

## Scopul algoritmului

**PageRank** este un algoritm de analiza a hiperlegaturilor din Internet, folosit
de motorul de cautare Google pentru a acorda o pondere fiecarui element
dintr-o multime  de  documente  interconectate  prin  hiperlegaturi,  cu  scopul
masurarii importantei relative in cadrul multimii.

Algoritmul este implementat in doua moduri, [**iterativ**](https://en.wikipedia.org/wiki/PageRank#Iterative) si
[**algebric**](https://en.wikipedia.org/wiki/PageRank#Algebraic), iar ulterior este testat pe doua exemple de input.

Progamul a fost creat ca o tema din cadrul cursului de **Metode numerice**.
Mai multe detalii despre enunt se pot gasi [aici](https://acs.curs.pub.ro/2019/pluginfile.php/74087/mod_resource/content/0/Tema_2_MN_2020.pdf).

## Explicatii privind implementarea

### Algoritmul Iterative:

Sursele se gasesc in *src/Iterative*.

Ma folosesc de recurenta R(t+1) = d * M * R(t) .+ (1- d) / N, unde matricea
M se construieste astfel: M(i,j) = 1 / L(pj), daca j are link la i si M(i,j) = 0
altfel. L este vector care contine numarul de link-uri ale fiecarei pagini catre
altele.

Functia **Read**, citeste datele din fisierul de input si formeaza matricea de
adiacenta, A, vectorul L si matricea M.

Aceasta functie este apelata in functia **Iterative** unde se calculeaza iteratiile
la fiecare pas. Se initializeaza un vector cu 1/N, peste tot si se foloseste 
relatia de recurenta de mai sus pentru a gasi indicele PageRank R.


### Algoritmul Algebraic:

Sursele se gasesc in *src/Algebraic*.

Se foloseste relatia R = d * M * R .+ (1-d)/N, care sta la baza formarii
relatiei de recurenta de mai sus. Se va obtine R = (I - d*M)^(-1) * (1-d)/N * 1
(1 fiind un vector coloana).

Functia **GramSchmidt**imi factorizeaza QR o matrice patratica A, cu metoda op-
timizata a acestui algoritm, din laborator. 

Functia **SST** rezolva un sistem superior triunghiular pornind la ultima linie
si mergand spre prima.

Aceste doua functii sunt combinate in functia **PR_Inv**, ce calculeaza inversa
unei matrici in urmatorul fel. Se factorizeaza QR cu GramSchmidt matricea A, si
se rezolva n sisteme superior triunghiulare su **SST**, pentru a obtine coloanele
inversei, asa cum am precizat si in comentariile din cod.

In functia **Algebraic**, formez din nou matricea M, cu ajutorul functie Read,
dupa care calculez inversa matricii I - d*M, cu ajutorul functiei **PR_Inv** si 
apoi formez vectorul R.


### Gradul de Apartenenta

Sursele se gasesc in *src/PageRank*.

Functia **Apartenenta** construieste valoarea functiei u, astfel incat aceasta
sa ramana continua pe intreg inervalul de definire.

Functia **Sort** are rolul de a sorta nodurile si valoarea indicelui de PageRank
in functie de acest indice. Sortarea este descrescatoare pentru a afisa
clasamentul celor mai importante pagini.

Si ultima functie **PageRank**, le apeleaza pe cele doua **Iterative** si **Algebraic**
pentru a afisa cei doi vectori R obtinuti in fisierul de output. Ulterior formez vectorul F ce contine valorile functiei* **Apartenenta** in punctele vectorului
R (vectorul sortat cu functia **Sort**). Apoi formez calea la fisierul de output si
afisez in el datele corespunzatoare.

