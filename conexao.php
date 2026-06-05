<?php
// Configurações de acesso ao banco de dados local do XAMPP
$host = "localhost";
$usuario = "root";
$senha = "";
$banco = "bibliotech";

// Tenta conectar ao MySQL
$conexao = new mysqli($host, $usuario, $senha, $banco);

// Se a conexão falhar, exibe o erro
if ($conexao->connect_error) {
    die("Falha na conexão com o banco de dados: " . $conexao->connect_error);
}

// Configura o banco para aceitar acentos (ç, á, é, etc.) corretamente
$conexao->set_charset("utf8");
?>
