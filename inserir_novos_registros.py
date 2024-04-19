import pandas as pd

planilha = {
    "Nome": ["Nova Teste Ncienf"] * 1 ,      # Inserindo o texto "Turma G" e "Turma x" 5x na coluna Nome
    "Descrição": ["Turma"] * 1 ,     # Inserindo "Turma operadores", "Equipe passivo" e "Grupo da retomada" na coluna Descrição
    "Situação": ["Ativo"] * 1    # Inserindo o texto "Ativo" e "Inativo" na coluna  Situação
}
df = pd.DataFrame(planilha)

path = "C:\\Fast2mine - miningcontrol\\fast2_mine_main\\fast2mine\\resources\\data\\template_operatorsgroups.xlsx"
book = pd.read_excel(path, sheet_name=0) # Carrega a primeira página da planilha
ultima_linha = len(book)    # Determina a última linha não vazia

#def escreve_arquivo():
with pd.ExcelWriter(path, engine='openpyxl', mode='a', if_sheet_exists='overlay') as writer:
    df.to_excel(writer, sheet_name='Dados', startrow=ultima_linha  + 1, index=False, header=False)