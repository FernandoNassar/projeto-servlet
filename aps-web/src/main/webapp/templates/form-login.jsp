<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="css/lista.css" >
    <link href="https://fonts.googleapis.com/css2?family=Candal&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/form_cadastro.css">
    <link rel="stylesheet" href="css/form_cadastro.css">
	<title>Insert title here</title>
</head>
<body class="bg-color bg-light">
    <div class="container-fluid bg-light">
        <main>
            <div class="card border-info mb-3 posicao" style="max-width: 18rem;">              
                <div class="card-body text-info">
                    <h5 class="card-title">Login</h5>
                    <form action="/aps-web/login" method="POST" >
                        <!-- enctype="multipart/form-data" -->
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" id="usuarioEmail" name="usuarioEmail" class="form-control" placeholder="Digite seu endereço de email" required>
                        </div>
                        <div class="form-group">
                            <label for="senha">Senha</label>
                            <input type="password" id="usuarioSenha" class="form-control" name="usuarioSenha" placeholder="Digite sua senha" required>
                        </div>        
                            
                        <footer class="footer d-flex justify-content-end">
                            <a type="button" href="/aps-web/cadastrar" class="btn btn-secondary" data-dismiss="modal">Criar Conta</a>
<!--                             <a type="button" href="dashboard.html" class="btn btn-primary" data-dismiss="modal">Login</a> -->
                            <button type="submit" class="btn btn-primary " name="submit" value="submit">Login</button>
                        </footer>     
                    </form>
                </div>
            </div>           
        </main>
    </div>
</body>
</html>