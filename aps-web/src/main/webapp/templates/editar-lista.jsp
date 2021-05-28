<%@page import="models.Playlist"%>
<%@page import="models.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<% 
	Usuario usuario = (Usuario) session.getAttribute("usuarioAutenticado");
	Playlist playlist = (Playlist) session.getAttribute("playlist");
%>
    

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="css/editar.css" >
    <link href="https://fonts.googleapis.com/css2?family=Candal&display=swap" rel="stylesheet">
	<title>Insert title here</title>
</head>
<body>
<body class="container-fluid bg-light">
    <header class="cabecalho">

        <!--####################################################### NAVBAR ###############################################################################-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <a class="navbar-brand" href="/aps-web/dashboard">PlayList</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="/aps-web/dashboard">Dashboard<span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#modal-criar-lista">Nova
                                Lista</a>
                            <a class="dropdown-item" href="#">Informações</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="/aps-web/logout">Sair</a>
                        </div>
                    </li>
                    
                </ul>
                <form class="form-inline my-2 my-lg-0" action="">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search"
                        name='buscar'>
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
                </form>
            </div>
        </nav>
    </header>
    
    <main>
        <form class="container" method="POST" action="/aps-web/playlist">

            <header>
              <h1 class="titulo"><% out.println(playlist.getTitulo()); %></h1>
            </header>

            <input type="hidden" name="lista_id" value="<% out.println(playlist.getId()); %>">

            <div class="row">
                <div class="form-group col">
                    <label for="titulo">Titulo</label>
                    <input type="text" class="form-control" id="titulo" name="lista_titulo" value="<% out.println(playlist.getTitulo()); %>" required>
                </div>           
                
				<div class="form-group col">
					<label for="imagem">Endereço da Imagem</label>
					<input type="text" class="form-control-file" id="imagem" name="lista_imagem" value="<% out.println(playlist.getEnderecoImagem()); %>">
				</div>
				
            </div>            
            
            <div class="form-group">
                <label for="desc">Descrição</label>
                <textarea class="form-control" id="lista_desc" rows="3" name="lista_desc"><% out.println(playlist.getDescricao()); %></textarea>
            </div>             
            
            <button type="submit" class="btn btn-lg btn-primary">Salvar</button>            
            <a class="btn btn-lg btn-secondary" href="/aps-web/dashboard">Cancelar</a>                     
            
        </form>

    </main>

        
   
</body>

    <!-- Modal - Criar Lista -->
    <div class="modal fade" id="modal-criar-lista" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <dialog class="modal-content">
                <header class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Nova PlayList</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
                    <span aria-hidden="true">&times;</span>
                    </button>
                </header>

                <main class="modal-body">
                    <form action="#####" method="POST" enctype="multipart/form-data">
                        
                        <div class="form-group">
                            <label for="formGroupExampleInput">Título</label>
                            <input type="text" class="form-control" id="formGroupExampleInput" name="nome_lista"
                                placeholder="Insira o título da lista" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="exampleFormControlTextarea1">Descrição</label>
                            <textarea class="form-control" id="exampleFormControlTextarea1" name="desc_lista" rows="3"
                                placeholder="Dê uma descrição"></textarea>
                        </div>

                        <div class="form-group">
                            <label for="imagem">Imagem</label>
                            <input type="file" class="form-control-file" id="imagem" name="imagem_lista" value="">
                        </div>

                        <footer class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                            <button type="submit" class="btn botao-cor-especial" name="submit"
                                value="submit">Criar</button>
                        </footer>

                    </form>
                </main>
            </dialog>
        </div>
    </div>
    

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

</body>
</html>