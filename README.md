# 📚 Sistema BiblioTech

[cite_start]O *BiblioTech* é um Sistema de Informação Web focado na gestão automatizada do acervo e empréstimos da *Biblioteca Central Dom Malan*[cite: 1, 2]. [cite_start]O projeto visa substituir o controle manual feito por fichas de papel e planilhas soltas, otimizando o tempo de atendimento e garantindo o controle do estoque em tempo real[cite: 3, 4, 5].

## 📊 Classificação do Sistema
* [cite_start]*Tipo:* SPT (Sistema de Processamento de Transações)[cite: 7].
* [cite_start]*Justificativa:* O foco do sistema é puramente operacional e prático, registrando de forma rápida e segura as atividades diárias e repetitivas da biblioteca (cadastrar livros, realizar empréstimos e confirmar devoluções)[cite: 8, 9].

## 💡 Benefícios Esperados
* [cite_start]Eliminação total do uso de papel e planilhas desorganizadas[cite: 30].
* [cite_start]Atendimento no balcão até 80% mais rápido[cite: 31].
* [cite_start]Controle exato das datas de devolução, reduzindo o sumiço de livros[cite: 32].

---

## 🛠️ Tecnologias Envolvidas
* [cite_start]*Banco de Dados:* MySQL[cite: 27].
* *Backend:* PHP (Ponte de comunicação).
* [cite_start]*Frontend:* HTML, CSS e JavaScript[cite: 28].

---

## 💾 Estrutura do Banco de Dados (MySQL)
[cite_start]O banco de dados foi modelado com três entidades principais[cite: 15]:
1. [cite_start]*Aluno:* Identificado por matrícula (Chave Primária) e nome[cite: 16].
2. [cite_start]*Livro:* Contém título, autor, categoria e status (Chave Primária autoincremental)[cite: 17].
3. [cite_start]*Empréstimo:* Tabela intermediária que conecta o Aluno ao Livro utilizando Chaves Estrangeiras, registrando a data de devolução[cite: 18].

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
[cite_start]Para buscar livros ou solicitar renovações através das telas HTML[cite: 13], utilize a API fetch() do JavaScript apontando para os scripts PHP correspondentes.

#### [cite_start]Exemplo: Consumindo a Barra de Pesquisa de Livros [cite: 13]
[cite_start]Quando o aluno digitar na barra de busca[cite: 13], o seu script.js deve enviar o termo para o arquivo PHP de busca da seguinte forma:

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
