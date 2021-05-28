<%@page import="models.Playlist"%>
<%@page import="models.Usuario"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	Usuario usuario = (Usuario) session.getAttribute("usuarioAutenticado");

%>
<% 
//	String email = usuario.getEmail();
%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css"><%--             <% out.println("<h2>Usuario: " + "usuario: " + email + "</h2>");%> --%>
    <link href="https://fonts.googleapis.com/css2?family=Candal&display=swap" rel="stylesheet">
	<title>Insert title here</title>
</head>
<body>
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

    <main class="container-fluid bg-light">

        <div class="area-titulo">
            <h1 class="titulo fonte-titulo">PlayLists</h1>
        </div>

        <!--################################################### CARDS ############################################################################################-->
        <section class="container-sm container-md container-lg container-xl bg-light" id="cards">
            <div class="row justify-content-center">
				
				
				<% if(usuario.getPlaylists() != null) { %>
				<% for(Playlist playlist : usuario.getPlaylists() ){ %>
					
					<article class="card card-largura p-0 m-4 col-12 col-md-4 col-lg-4 col-xl-4">

                    <img src="<% out.println(playlist.getEnderecoImagem()); %>" class="card-img-top card-posicao-imagem"
                        alt="...">

                    <div class="card-body">
                        <h5 class="card-title text-capitalize titulo_card text-truncate"><% out.println(playlist.getTitulo()); %></h5>

                        <div class="d-flex justify-content-between">
                            <a href="/aps-web/playlist?playlist_id=<%=playlist.getId() %>" class="btn btn-primary">Vídeos</a>
                            <div class="dropdown">
                                <a class="btn btn-secondary dropdown-toggle" href="#" role="button"
                                    id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                    <img src="img/settings-tool.png">
                                </a>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                    <a class="dropdown-item" href="/aps-web/playlist?playlist_id=<%=playlist.getId() %>&action=editar">Editar</a>
                                    <a class="dropdown-item" href="/aps-web/playlist?playlist_id=<%=playlist.getId() %>&action=excluir">Excluir</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </article>
					
					
				<% } %>
				<% } %>
              
            </div>

        </section>
    
        <nav class="d-flex justify-content-center mt-5" aria-label="Page navigation example">
            <ul class="pagination">
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    
    </main>



    <footer class="d-flex justify-content-center mt-5">
        <p>PlayList</p>
    </footer>



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
                    <form action="/aps-web/playlist" method="POST">
                        <div class="form-group">
                            <label for="formGroupExampleInput">Título</label>
                            <input type="text" class="form-control" id="formGroupExampleInput" name="lista_titulo"
                                placeholder="Insira o título da lista" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="exampleFormControlTextarea1">Descrição</label>
                            <textarea class="form-control" id="exampleFormControlTextarea1" name="lista_desc" rows="3"
                                placeholder="Dê uma descrição"></textarea>
                        </div>

                        <div class="form-group">
                            <label for="imagem">Endereço da Imagem</label>
                            <input type="text" class="form-control-file" id="imagem" name="lista_imagem" value="">
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


    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>
</body>

</html>