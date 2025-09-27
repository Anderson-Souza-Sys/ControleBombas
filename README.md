# # 🔧 Projeto Demonstrativo: Controle de Bombas de Combustível (Delphi + Firebird) com 🔐 Criptografia

## 💡 Sobre o Projeto

💡 Projeto Demonstrativo: Sistema de Controle de Bombas de Combustível desenvolvido em Delphi, com banco de dados Firebird e geração de relatórios via Fortes Report.

🔐 Destaque: Este projeto utiliza um algoritmo de criptografia próprio, desenvolvido por mim com fins de estudo e aplicação prática no contexto do sistema. A abordagem foi elogiada por outros desenvolvedores pela iniciativa e atenção à segurança da informação.

🧪 Projeto com foco demonstrativo, voltado ao aprendizado e à apresentação de técnicas em desenvolvimento desktop, integração com banco de dados e controle de acesso seguro.

Este é um sistema de cadastro e controle de bombas de combustível, criado com foco em **boas práticas de programação em Delphi**, utilizando banco de dados Firebird e relatórios com Fortes Report. O objetivo é servir como um projeto de **portfólio técnico**, demonstrando domínio em:

- Orientação a Objetos
- Acesso a banco de dados
- Componentes visuais (VCL)
- Tratamento de erros global
- Boas práticas de UX voltadas à VCL Delphi
- Padrão de desenvolvimento com formulários herdados (inherited)
- Criptografia Própria

---

## 🛠 Tecnologias Utilizadas

- **Delphi XE8**
- **Firebird SQL**
- **Fortes Report** [download](https://github.com/fortesinformatica/fortesreport-ce/tree/master)
- VCL (Visual Component Library)


## 🚀 Diferenciais Técnicos

- **Criptografia**
- **Middleware**
- **Usabilidade**

## 🔐 Criptografia de Dados de Conexão

- Algoritmo de Criptografia Próprio (Desenvolvido do Zero)
- Ao iniciar, caso o arquivo `database.dat` não exista no diretório do executável, o sistema exibe uma **tela de configuração da conexão com o banco**.
- Esses dados são **salvos em arquivo binário criptografado** com rotina própria de criptografia **desenvolvida integralmente por mim**.
- Ferramenta de Teste Inclusa. Um **aplicativo auxiliar** para quem quiser testar, validar ou auditar a rotina.

<img src="configurabanco.png" alt="Tela de configuração do banco"/>

  ### 🧪 Aplicativo Auxiliar

  Além do sistema principal, o repositório inclui um **utilitário de criptografia** para testar a eficiência da rotina usada no armazenamento dos dados de conexão.

  <img src="criptoTool.png" alt="Explicações de uso ferramenta de criptografia."/>

## 🧩 Middleware em Delphi: Tratamento Global de Erros e Ajuda Contextual

Embora o Delphi siga uma terminologia mais tradicional, conceitos modernos como middleware foram aplicados de forma prática:

- **Middleware de erros**: Toda exceção não tratada diretamente na aplicação é interceptada por um **handler global**, exibindo mensagens amigáveis ao usuário e registrando detalhes técnicos em `errolog.txt`.
- **Middleware visual de dicas (hints)**: Os hints dos itens do menu principal são capturados e exibidos automaticamente na barra de status, oferecendo ajuda contextual em tempo real.

### ⚙️ Regras de Negócio no Banco de Dados (Triggers)

Para garantir a integridade dos dados e minimizar a lógica repetida na aplicação, o sistema utiliza **triggers no Firebird** que automatizam ações diretamente no banco.

### 🖼️ Usabilidade e Detalhes Visuais

- Uso de **Formulários herdados (Inheritable Forms)** para padronizar telas.
- Itens do menu exibem ajuda na **barra de status** ao serem selecionados.

<img src="ajudaStatusBar.png" alt="Ajuda exibida na barra de status"/>

---

## 📦 O que está incluído

- Código-fonte completo da aplicação
- Executável já compilado
- Scripts SQL e backup do banco
- Aplicativo auxiliar de criptografia (para testar e validar a rotina usada na aplicação)

---

## 🧠 Conceitos Aplicados

### ✅ Orientação a Objetos
- Classes bem definidas como `TBombas`, `TRecarga`, `TAbastecimento`, `TTanques` entre outras.
- Métodos organizados: `Cadastrar`, `Atualizar`, `Excluir`, `Localizar`, `IntegridadeReferencial`, etc.
- Uso de `Record` para separar campos persistentes (`Campos`) de atributos auxiliares (`Atributos`).
- Implementação de regras de negócio encapsuladas nas classes.

---

## 📂 Organização de Código

- Separação por camadas: dados, regras de negócio e interface.
- Técnicas "Fail Fast", Separação de responsabilidades, Clean Code.
- Uso de consultas dinâmicas e queries fixas para operações diretas.
- Implementação de **camada de validação** (ex: verificação de nomes duplicados, integridade referencial antes de exclusão, limite de bombas por tanque).
- A rotina de criptografia foi implementada em uma **DLL externa** por motivos de segurança e organização da arquitetura. **Encapsular a lógica de criptografia**, mantem o código sensível isolado da aplicação principal.

---

## 📫 Contato

Caso tenha dúvidas, sugestões ou queira discutir sobre o projeto:

**- ✉️ E-mail: [souza.sysnet@gmail.com](souza.sysnet@gmail.com)**

---

## 🗒️ Observações Finais

Este projeto tem caráter demonstrativo, mas foi desenvolvido com atenção a detalhes que facilitam manutenção, clareza e extensibilidade. O objetivo é mostrar que mesmo com tecnologias como Delphi e Firebird, é possível aplicar **boas práticas modernas** de desenvolvimento.

---
