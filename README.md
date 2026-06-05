# 📚 Sistema BiblioTech

O *BiblioTech* é um Sistema de Informação Web focado na gestão automatizada do acervo e empréstimos da *Biblioteca Central Dom Malan. O projeto visa substituir o controle manual feito por fichas de papel e planilhas soltas, otimizando o tempo de atendimento e garantindo o controle do estoque em tempo real.

## 📊 Classificação do Sistema
* *Tipo:* SPT (Sistema de Processamento de Transações).
* *Justificativa:* O foco do sistema é puramente operacional e prático, registrando de forma rápida e segura as atividades diárias e repetitivas da biblioteca (cadastrar livros, realizar empréstimos e confirmar devoluções).

## 💡 Benefícios Esperados
* Eliminação total do uso de papel e planilhas desorganizadas.
* Atendimento no balcão até 80% mais rápido.
* Controle exato das datas de devolução, reduzindo o sumiço de livros.

---

## 🛠️ Tecnologias Envolvidas
* *Banco de Dados:* MySQL.
* *Backend:* PHP (Ponte de comunicação).
* *Frontend:* HTML, CSS e JavaScript.

---

## 💾 Estrutura do Banco de Dados (MySQL)
O banco de dados foi modelado com três entidades principais:
1. *Aluno:* Identificado por matrícula (Chave Primária) e nome.
2. *Livro:* Contém título, autor, categoria e status (Chave Primária autoincremental).
3.*Empréstimo:* Tabela intermediária que conecta o Aluno ao Livro utilizando Chaves Estrangeiras, registrando a data de devolução.

> 📝 O arquivo bd.sql na raiz do projeto já contém a estrutura completa das tabelas e os dados de teste (população inicial) de alunos, livros e empréstimos ativos para a demonstração do sistema.

---

## 🚀 Guia para o Desenvolvedor Frontend (Como Conectar)

Como o JavaScript do navegador não pode conversar diretamente com o banco de dados por motivos de segurança, o desenvolvimento do backend em PHP foi estruturado para servir como uma API local.

Siga os passos abaixo para configurar o ambiente e conectar as suas telas:

### 1. Configuração do Ambiente Local (XAMPP)
1. Certifique-se de ter o *XAMPP* instalado em sua máquina.
2. Mova a pasta inteira deste projeto para dentro do diretório C:\xampp\htdocs\.
3. Abra o *XAMPP Control Panel* e dê *Start* nos módulos *Apache* e *MySQL*.
4. Clique em *Admin* na linha do MySQL para abrir o phpMyAdmin.
5. Crie um banco de dados chamado bibliotech, vá na aba *Importar* e selecione o arquivo bd.sql que está no projeto.

### 2. Arquivo de Conexão Base
O arquivo conexao.php já está pronto na pasta php/ e realiza a abertura de portas com o banco de dados. Você não precisa alterá-lo.

### 3. Como fazer requisições a partir do JavaScript (Exemplo Prático)
Para buscar livros ou solicitar renovações através das telas HTML, utilize a API fetch() do JavaScript apontando para os scripts PHP correspondentes.

#### Exemplo: Consumindo a Barra de Pesquisa de Livros 
Quando o aluno digitar na barra de busca, o seu script.js deve enviar o termo para o arquivo PHP de busca da seguinte forma:

```javascript
// Função para buscar livros no banco de dados
function buscarLivro(termoPesquisa) {
    fetch(php/pesquisar.php?termo=${termoPesquisa})
        .then(response => response.json())
        .then(dados => {
            // 'dados' conterá a lista de livros vinda do MySQL
            console.log(dados);
            
            // Aqui você renderiza os dados dentro da sua tabela HTML
            // Exemplo: checar se o status está "Disponível" ou "Emprestado"
        })
        .catch(error => console.error("Erro ao buscar dados:", error));
}
