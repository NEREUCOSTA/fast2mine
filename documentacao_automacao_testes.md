
# Documentação do Projeto de Automação de Testes

## Introdução

Este documento descreve a configuração e estrutura para automação de testes utilizando o Visual Studio Code (VSCode) como IDE, `venv` para gerenciamento de ambientes virtuais, e o Robot Framework como o framework de automação.

## Ferramentas e Tecnologias

### Visual Studio Code (VSCode)

O Visual Studio Code é uma IDE leve, mas poderosa, disponível para Windows, Linux e macOS. Ela suporta uma vasta gama de linguagens de programação e tecnologias, incluindo Python, que será usado neste projeto para automação de testes com o Robot Framework. O VSCode oferece recursos como destaque de sintaxe, autocompletar código, capacidade de depuração, e extensões personalizáveis, facilitando significativamente o desenvolvimento e a automação de testes.

### Ambiente Virtual com `venv`

`venv` é uma ferramenta para criar ambientes virtuais isolados em Python, permitindo que diferentes projetos tenham suas próprias dependências, independentemente das bibliotecas instaladas globalmente no sistema.

#### Instalando e Configurando `venv`

- **Windows:**

  ```
  python -m venv <nome_do_ambiente>
  .\<nome_do_ambiente>\Scripts\activate
  ```

- **Linux/Mac:**

  ```
  python3 -m venv <nome_do_ambiente>
  source <nome_do_ambiente>/bin/activate
  ```

#### Benefícios do Uso de `venv`

Usar `venv` permite gerenciar dependências de forma eficiente, evitando conflitos entre as bibliotecas necessárias para diferentes projetos. Isso assegura que o ambiente de desenvolvimento esteja em conformidade com os requisitos do projeto, sem afetar outros projetos ou a configuração do sistema.

### Robot Framework

O Robot Framework é um framework de automação de testes de código aberto, que permite a escrita de testes em um formato tabular de fácil leitura. Ele é independente de plataforma e framework, oferecendo suporte para a automação de testes de interfaces gráficas, APIs, e processos de negócios.

## Estrutura de Diretórios e Arquivos

A estrutura do projeto foi planejada para promover a organização e facilitar a manutenção dos testes automatizados:

- `resources/`: Armazena arquivos de configuração e recursos do projeto.
  - `pages/`: Contém variáveis e keywords específicas para partes dos cenários de teste.
  - `data/`: Responsável por armazenar credenciais de acesso e arquivos para criação de massa de teste.
- `test_cases/`: Diretório que irá conter os arquivos `.robot` para execução dos testes.

Esta estrutura ajuda na organização lógica dos testes e recursos, facilitando a gestão e atualização dos testes automatizados.
