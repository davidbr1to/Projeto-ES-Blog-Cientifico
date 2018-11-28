Feature: Posts
  As a administrador do sistema blog
  I want to adicionar, remover, editar e visualizar um post
  So that eu nao tenha quer fazer isso manualmente

  Scenario: Novo post
    Given Eu abro a pagina inicial de posts
    When Eu preencho o texto “Post de teste” com o titulo “Teste”
    And Eu clico no botao de adicionar post
    Then Eu vejo que “Teste” foi salvo

  Scenario: Novo post invalido(falta o “clicar no botao”)
    Given Eu abro a pagina inicial de posts
    When Eu preencho o campo texto “” com o titulo “”
    And Eu clico no botao de adicionar post
    Then Eu vejo uma mensagem de erro informando que o post precisa de um corpo e de um título

  Scenario: Editar post existente
    Given Eu estou na pagina inicial de posts
    And Eu vejo o titulo “Teste” do post
    When Eu clico para ver “Teste”, clico para editar
    And Eu preencho o texto “Novas mudanças teste” com o titulo “Teste2”
    Then Eu vejo uma mensagem informando que “Teste” foi alterado

  Scenario: Editar post existente invalido
    Given Eu estou na pagina inicial de posts
    And Eu vejo o titulo “Teste” do post
    When Eu clico no botao para ver “Teste”, clico para editar
    And Eu preencho o texto “” com o titulo “”
    Then Eu vejo uma mensagem de erro informando  que “Teste” nao foi alterado

  Scenario: Remover post existente
    Given Eu estou na pagina inicial de posts
    And Eu vejo o titulo “Teste” do post
    When Eu clico para ver “Teste”
    And Eu clico para remover “Teste”
    Then Eu vejo uma mensagem que informando que “Teste” foi removido

  Scenario: Visualizar post existente
    Given Eu estou na pagina inicial de posts
    And Eu vejo um post de título “Titulo”
    When Eu clico no titulo “Titulo”
    Then Eu visualizo o conteudo do post

  Scenario: Adicionar Categoria
    Given Eu estou na pagina de criacao de posts
    And Eu clico no botão Adicionar categoria
    When Eu preencho o campo Categoria com “categoria”
    And Eu clico em “Adicionar Categoria”
    Then A Categoria e adicionada com sucesso

  Scenario: Pesquisar post por titulo existente
    Given Eu estou na pagina de listagem de posts
    When Eu clico no botao pesquisar
    And Eu digito o titulo “titulo”
    And Eu clico em Pesquisar post
    Then Eu encontro o post pesquisado

  Scenario: Pesquisar post por titulo inexistente
    Given Eu estou na pagina de listagem de posts
    When Eu clico no botao pesquisar
    And Eu digito o titulo “titulo”
    And Eu clico em Pesquisar post
    Then Eu vejo a mensagem informando que o post nao foi encontrado

  Scenario: Pesquisar post por categoria
    Given Eu estou na pagina de listagem de posts
    When Eu clico na Scroll Bar Categorias
    And Eu clico na categoria teste
    Then Todos os posts da categoria teste são exibidos

  Scenario: Pesquisar post por idioma
    Given Eu estou na pagina de listagem de posts
    When Eu clico na Scroll Bar Idiomas
    And Eu clico na categoria Ingles
    Then Todos os posts no idioma Ingles são exibidos


  Scenario: Pesquisar post por recentes
    Given Eu estou na pagina de listagem de posts
    When Eu clico na Scroll Bar Recentes
    Then Todos os posts recentes são exibidos

  Scenario: Pesquisar post por populares
    Given Eu estou na pagina de listagem de posts
    When Eu clico na Scroll Bar Populares
    Then Todos os posts populares são exibidos

  Scenario: Fazer upload de fotos no post
    Given Eu estou na pagina de criacao de post
    And Eu clico no botao de selecao da imagem para upload
    When Eu seleciono a imagem “123.jpg”
    And Eu clico no botao para fazer upload
    Then Eu vejo a imagem no corpo do post

  Scenario: Fazer upload de arquivo invalido no post
    Given Eu estou na pagina de criacao de post
    And Eu clico no botao de selecao da imagem para upload
    When Eu seleciono o arquivo “qwe.mp3”
    And Eu clico no botao para fazer upload
    Then Eu vejo uma mensagem de erro informando que o formato do arquivo e invalido.
