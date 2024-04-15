import pandas as pd

planilha = {
    "Nome": ["Turma G"] * 5 + ["Turma X"] * 5,      # Inserindo o texto "Turma G" e "Turma x" 5x na coluna Nome
    "Descrição": ["Turma operadores"] * 3 + ["Equipe passivo"] * 3 + ["Grupo da retomada"] * 4,     # Inserindo "Turma operadores", "Equipe passivo" e "Grupo da retomada" na coluna Descrição
    "Situação": ["Ativo"] * 4 + ["Inativo"] * 6     # Inserindo o texto "Ativo" e "Inativo" na coluna  Situação
}
df = pd.DataFrame(planilha)

path = "resources/data/template_operatorsgroups.xlsx"
book = pd.read_excel(path, sheet_name=0) # Carrega a primeira página da planilha
ultima_linha = len(book)    # Determina a última linha não vazia

with pd.ExcelWriter(path, engine='openpyxl', mode='a', if_sheet_exists='overlay') as writer:
    df.to_excel(writer, sheet_name='Dados', startrow=ultima_linha  + 1, index=False, header=False)




