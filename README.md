<h1>Projeto de Controle de Bombas de Combust�vel</h1>

<h3>Projeto</h3>


- Teste mostrando orienta��o a objeto, relat�rios utilizando Fortes Report
- Utilizandoi Delphi XE 8, com Firebird
- Acompanhando c�digo fonte, execut�vel compilado, backup e scripts SQL 

<h3>Orienta��o a Objeto </h3>

- M�dotos como Cadastrar, Atualizar, Localizar, Excluir, etc
- Fun��es overload

<h3>Particularidades</h3>

- Ao iniciar se no mesmo diret�rio onde se encontra o .exe n�o exisitir o arquivo "data.dat", ir� abrir uma janela de configura��o de acesso ao banco de dados

<img src="configurabanco.png" alt="Tela de configura��o"/>

- Utilizando "Inheritable Forms"

- Quando um item � selecionado no menu, aparece uma explica��o mais detalhada sobre o menu na barra de status

<img src="ajudaStatusBar.png" alt="Ajuda exibida na barra de status"/>

- Qualquer erro n�o tratado diretamente, est� sendo tratado dentro do Eventos de Erro da aplica��o, reportando o erro e gravando um log em "errolog.txt". No mesmo diret�rio do .exe


