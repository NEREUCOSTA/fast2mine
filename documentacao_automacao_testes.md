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

# Instalação das Dependências do Projeto

Este passo fornece uma orientação passo a passo sobre como instalar as dependências necessárias para o projeto usando o arquivo `requirements.txt`.

## Pré-Requisitos

Antes de começar, certifique-se de ter o Python instalado em seu sistema. Além disso, é recomendado usar um ambiente virtual para evitar conflitos de dependências com outros projetos Python.

## Passos para Instalação

### 1. Criar o Arquivo `requirements.txt`

Primeiro, assegure-se de que o arquivo `requirements.txt` esteja no diretório raiz do seu projeto e contenha todas as dependências necessárias listadas. Exemplo de um `requirements.txt`:

robotframework^=6.0
robotframework-seleniumlibrary^=6.0
PyAutoGUI
pandas^=2.0


### 2. Abrir o Terminal

Abra o terminal no seu sistema operacional:

- **Windows**: Prompt de Comando ou PowerShell ou terminal integrado do VSCode.
- **Linux/macOS**: Terminal.

### 3. Navegar até o Diretório do Projeto

Utilize o comando `cd` para mudar para o diretório onde seu arquivo `requirements.txt` está localizado. Por exemplo:
cd caminho/para/seu/projeto


### 4. Ativar o Ambiente Virtual

Se estiver usando um ambiente virtual, ative-o com o seguinte comando:

- **Windows**:
.\venv\Scripts\activate

- **Linux/macOS**:
source venv/bin/activate

### 5. Instalar as Dependências

Com o ambiente virtual ativado, instale as dependências executando:
pip install -r requirements.txt

Este comando instalará todas as bibliotecas e suas respectivas versões especificadas no arquivo `requirements.txt`.

### 6. Verificar a Instalação

Após a instalação, você pode verificar se todas as dependências foram instaladas corretamente com:
pip list


### 7. Desativar o Ambiente Virtual

Quando terminar de trabalhar no projeto, desative o ambiente virtual para retornar ao ambiente global do Python:
deactivate

## Conclusão

Seguir estes passos garantirá que você tenha todas as dependências necessárias instaladas corretamente para o desenvolvimento do projeto. Isso ajuda a manter um ambiente de desenvolvimento consistente e evita problemas relacionados a versões incompatíveis de pacotes.


### Robot Framework

O Robot Framework é um framework de automação de testes de código aberto, que permite a escrita de testes em um formato tabular de fácil leitura. Ele é independente de plataforma e framework, oferecendo suporte para a automação de testes de interfaces gráficas, APIs, e processos de negócios.

## Estrutura de Diretórios e Arquivos

A estrutura do projeto foi planejada para promover a organização e facilitar a manutenção dos testes automatizados:

- `resources/`: Armazena arquivos de configuração e recursos do projeto.
  - `pages/`: Contém variáveis e keywords específicas para partes dos cenários de teste.
  - `data/`: Responsável por armazenar credenciais de acesso e arquivos para criação de massa de teste.
- `test_cases/`: Diretório que irá conter os arquivos `.robot` para execução dos testes.

Esta estrutura ajuda na organização lógica dos testes e recursos, facilitando a gestão e atualização dos testes automatizados.
