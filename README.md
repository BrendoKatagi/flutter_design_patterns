# Exemplos de Arquitetura: MVC, MVP e MVVM

Este repositório contém exemplos práticos de implementações das arquiteturas **MVC**, **MVP** e **MVVM** no Flutter. Ele foi criado para ajudar desenvolvedores a entender como essas arquiteturas podem ser aplicadas em aplicativos Flutter e como organizar melhor o código para diferentes cenários.

---

## Arquiteturas Incluídas

### 1. **MVC (Model-View-Controller)**
O padrão **MVC** divide o aplicativo em três camadas principais:
- **Model**: Gerencia os dados e a lógica de negócios.
- **View**: Responsável por renderizar a interface do usuário e exibir os dados.
- **Controller**: Atua como intermediário entre a View e o Model, processando as interações do usuário e atualizando a UI.

➡️ [Código de Exemplo - MVC](https://github.com/BrendoKatagi/flutter_design_patterns/tree/main/lib/mvc)

---

### 2. **MVP (Model-View-Presenter)**
No padrão **MVP**, a lógica de apresentação é gerenciada pelo **Presenter**, que atua como um intermediário entre a **View** e o **Model**:
- **Model**: Fornece os dados e a lógica de negócios.
- **View**: Exibe a interface do usuário e interage com o Presenter por meio de um contrato.
- **Presenter**: Contém toda a lógica de apresentação e atualiza a View diretamente.

➡️ [Código de Exemplo - MVP](http://github.com/BrendoKatagi/flutter_design_patterns/tree/main/lib/mvp)

---

### 3. **MVVM (Model-View-ViewModel)**
A arquitetura **MVVM** utiliza bindings reativos para conectar a **View** ao **ViewModel**:
- **Model**: Gerencia os dados e a lógica de negócios.
- **View**: Representa a interface do usuário e exibe os dados provenientes do ViewModel.
- **ViewModel**: Expõe dados da lógica de negócios em um formato que a View consegue consumir facilmente. A comunicação é feita de forma reativa, utilizando ferramentas como Streams ou State Management.

➡️ [Código de Exemplo - MVVM](https://github.com/BrendoKatagi/flutter_design_patterns/tree/main/lib/mvvm)

---

## Estrutura do Repositório

```plaintext
/
├── mvc/
│   ├── data/
│   ├── controllers/
│   ├── views/
│   └── main.dart
├── mvp/
│   ├── data/
│   ├── presenters/
│   ├── views/
│   └── main.dart
├── mvvm/
│   ├── data/
│   ├── viewmodels/
│   ├── views/
│   └── main.dart
└── README.md

```

---

## Como Executar os Exemplos
### Clone este repositório:


`git clone https://github.com/BrendoKatagi/flutter_design_patterns.git`

Acesse a pasta do exemplo desejado (MVC, MVP ou MVVM):

`cd mvc`

Execute o projeto:

`flutter run`

## Objetivo
### Este repositório tem como objetivo:

Demonstrar como organizar projetos Flutter utilizando diferentes arquiteturas.

Ajudar desenvolvedores a entender as vantagens e desvantagens de cada abordagem.
Servir como base para novos projetos.

### Contribuições
Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou enviar um pull request com melhorias, novos exemplos ou dúvidas.

## Licença
Este projeto está licenciado sob a licença MIT.