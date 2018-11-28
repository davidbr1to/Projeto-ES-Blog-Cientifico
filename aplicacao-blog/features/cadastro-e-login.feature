Feature: Cadastro e login
  As a usuario do sistema
  I want me cadastrar e logar no sistema
  So that eu possa ter acesso a todas as funcionalidades do sistema

  Scenario: Cadastrar no sistema com sucesso
    Given Eu estou na pagina de cadastro
    When Eu preencho o campo de nome com “Jose”, e o email “jose@gmail.com”, e senha “qweasdzxc123”
    And Eu clico no botão cadastrar
    Then Eu vejo uma mensagem informando que o cadastro foi realizado com sucesso

  Scenario: Fazer cadastro com dados invalidos
    Given Eu estou na pagina de cadastro
    When eu clico no botao para Cadastrar
    Then Eu vejo uma mensagem de erro

  Scenario: Fazer cadastro com email ja existente
    Given Eu estou na pagina inicial do site
    And Eu clico no botao para Cadastrar
    When Eu preencho os campos de dados
    Then Eu vejo uma mensagem de erro informando que o email ja esta em uso

  Scenario: Fazer cadastro com dados menor que o necessario
    Given Eu estou na pagina de cadastro
    When Eu preencho o campo de login com “jose” e o campo de senha com “aaa”
    And Eu clico no botao para cadastrar
    Then eu vejo uma mensagem de erro informando que os dados tem o tamanho menor que o necessario

  Scenario: logar no sistema    com sucesso
    Given Eu estou na pagina de login
    When Eu preencho o campo login com “jose@gmail.com” e o campo senha com “qweasdzxc123”
    And Eu clico no botao logar
    Then Eu estou logado no sistema

  Scenario: logar no sistema sem preencher dados
    Given Eu estou na pagina de login
    When Eu clico no botao logar
    Then Eu nao logarei no sistema e continuei na pagina de login

  Scenario: logar com dados incorretos
    Given Eu estou na pagina de login
    When Eu preencho o campo login com “aaa@gmail.com” e o campo senha com “senhaincorreta123”
    And Eu clico no botao logar
    Then Eu vejo uma mensagem de erro informando que os dados estao incorretos





  Scenario: logar com senha menor que o necessario
    Given Eu estou na pagina de cadastro
    When Eu preencho o campo login com “jose@gmail.com”  o campo senha com “ES”
    And eu clico no botao logar
    Then Eu vejo uma mensagem de erro informando que o tamanho da senha e menor que o permitido

  Scenario: logar com email invalido
    Given Eu estou na pagina de cadastro
    When Eu preencho o campo login com “jose.maria”  o campo senha com “qweasdzxc123”
    And eu clico no botao logar
    Then Eu vejo uma mensagem de erro informando que o login desejado nao e um email valido

  Scenario: Fazer logout com sucesso
    Given Eu estou logado no blog
    When Eu clico no botao para sair
    And Eu clico no botao para confirmar
    Then eu sou deslogado do sistema

  Scenario: Excluir conta com sucesso
    Given Eu estou logado no blog
    And Eu estou na pagina do meu perfil
    When Eu clico no botao Excluir conta
    And Eu preencho o campo de senha “qweasdzxc123”e clico no botao para confirmar
    Then Eu vejo uma mensagem de exclusao de conta com sucesso

  Scenario: Excluir conta senha incorreta
    Given Eu estou logado no blog
    And Eu estou na pagina do meu perfil
    When Eu clico no botao para excluir conta
    And Eu preencho o campo de senha incorretamente com “naoseiminhasenha e clico no botao para confirmar
    Then Eu vejo uma mensagem de erro na exclusao da conta informando que a senha e invalida

  Scenario: Excluir conta com senha em branco
    Given Eu estou logado no blog
    And Eu estou na pagina do meu perfil
    When Eu clico no botao para Excluir conta
    And Eu preencho o campo de senha “” e clico no botao para confirmar
    Then Eu vejo uma mensagem de erro na exclusao da conta

  Scenario: Editar nome de exibicao de usuario
    Given Eu estou logado no blog
    And Eu estou na pagina do meu perfil
    When Eu clico no botao Editar perfil”
    And Eu preencho o campo de nome “Joao” e clico no botao para confirmar
    Then Eu vejo uma mensagem de sucesso na modificacao do nome

  Scenario: Editar nome de exibicao de usuario invalido
    Given Eu estou logado no blog
    And Eu estou na pagina do meu perfil
    When Eu clico no botao para Editar perfil
    And Eu preencho o campo de nome “” e clico no botao para confirmar
    Then Eu vejo uma mensagem de erro na modificao do nome
