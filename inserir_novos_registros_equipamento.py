
import pandas as pd
from faker import Faker  # Importa a classe Faker do módulo faker
import random

# Inicializa uma instância da classe Faker com localidade para português do Brasil
fake = Faker('pt_BR')

# Lista de exemplos de nomes de veículos pesados usados em mineração
veiculos_pesados = [
    "Caminhão Basculante",
    "Carregadeira de Rodas",
    "Escavadeira Hidráulica",
    "Trator de Esteiras",
    "Perfuratriz",
    "Caminhão Fora-de-Estrada",
    "Motoniveladora",
    "Trator de Rodas",
    "Pá Carregadeira",
    "Dragline"
]

# Inicializa uma instância da classe Faker com localidade para português do Brasil
fake = Faker('pt_BR')

# Define a quantidade de registros que você deseja gerar
num_registros = 2
dados = []  # Cria uma lista vazia para armazenar os dados de cada registro

# Loop que itera a quantidade de vezes definida em num_registros
for _ in range(num_registros):
    registro = {  # Cria um dicionário para cada registro com dados aleatórios
        "Tipo": fake.random_element(elements=('Abastecimento', 'Betoneira', 'Bobcat', 'Britador', 'Cabolt', 'Caminhão', 'Caminhão de Apoio', 
                                              'Caminhão Emulsão', 'Caminhão pipa', 'Carga infra', 'Escavadeira', 'Fandrill', 'Jumbo', 
                                              'Locomotiva', 'Motoniveladora', 'Pá Carregadeira', 'Paste Fill', 'Perfuratriz', 
                                              'Plataforma Elevatória', 'Raise Boring', 'Robô Projetado', 'Rock Bolt', 'Rock Fill', 
                                              'Rolo Compressor', 'Rompedor', 'Scaler', 'Shaft', 'Trator', 'Trator de esteira', 
                                              'Vagão', 'Veículos Leves')),
        "Nome": random.choice(veiculos_pesados),  # Insere um veículo da lista de veículos pesados
        "Descrição": fake.text(max_nb_chars=40),  # Insere uma descrição aleatória de até 100 caracteres
        "Fluxo de Trabalho": fake.random_element(elements=('1', '2')), 
        "Limite de Velocidade": fake.pyint(min_value=40, max_value=60),  # Gera e insere um valor aleatório de velocidade
        "Grupo de Turno": fake.random_element(elements=('Diurno', 'Noturno')),  # Gera e insere um valor aleatório de turno
        "Situação": fake.random_element(elements=('Ativo', 'Inativo')),  # Gera e insere um valor aleatório de situação
    }
    dados.append(registro)  # Adiciona o dicionário de registro à lista de dados

# Converte a lista de dicionários em um DataFrame do pandas
df = pd.DataFrame(dados)

# Define o caminho para o arquivo Excel que será usado para escrever os dados
path = "F:\\Projetos\\Nereu_Fast_2_Mine\\fast2mine\\resources\\data\\template_equipmentsgroups.xlsx"

# Usando o context manager para abrir o arquivo Excel e garantir seu fechamento automático depois
with pd.ExcelWriter(path, engine='openpyxl', mode='a', if_sheet_exists='overlay') as writer:
    # Escreve o DataFrame no arquivo Excel, iniciando após a última linha de dados existente
    df.to_excel(writer, sheet_name='Dados', startrow=writer.sheets['Dados'].max_row, index=False, header=False)