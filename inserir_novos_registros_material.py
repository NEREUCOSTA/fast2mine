import pandas as pd
from faker import Faker  # Importa a classe Faker do módulo faker

# Inicializa uma instância da classe Faker com localidade para português do Brasil
fake = Faker('pt_BR')

# Define a quantidade de registros que você deseja gerar
num_registros = 2
dados = []  # Cria uma lista vazia para armazenar os dados de cada registro

# Loop que itera a quantidade de vezes definida em num_registros
for _ in range(num_registros):
    registro = {  # Cria um dicionário para cada registro com dados aleatórios
        "Nome": fake.name(),  # Gera e insere um nome aleatório
        "Descrição": fake.job(),  # Gera e insere uma descrição de trabalho aleatória
        "Situação": fake.random_element(elements=('Ativo', 'Inativo')),  # Seleciona aleatoriamente entre 'Ativo' e 'Inativo'
    }
    dados.append(registro)  # Adiciona o dicionário de registro à lista de dados

# Converte a lista de dicionários em um DataFrame do pandas
df = pd.DataFrame(dados)

# Define o caminho para o arquivo Excel que será usado para escrever os dados
path = "C:\\QA\\fast2mine\\resources\\data\\template_materialsgroups.xlsx"     

# Usando o context manager para abrir o arquivo Excel e garantir seu fechamento automático depois
with pd.ExcelWriter(path, engine='openpyxl', mode='a', if_sheet_exists='overlay') as writer:
    # Escreve o DataFrame no arquivo Excel, iniciando após a última linha de dados existente
    df.to_excel(writer, sheet_name='Dados', startrow=writer.sheets['Dados'].max_row, index=False, header=False)