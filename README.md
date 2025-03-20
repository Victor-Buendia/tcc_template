# tcc_template

Template para trabalhos de conclusão de curso (TCC) em LaTeX. Repositório original: [https://github.com/fga-unb/template-latex-tcc](https://github.com/fga-unb/template-latex-tcc).

## Pré-requisitos

- Docker: O projeto utiliza Docker e Docker Compose para garantir um ambiente consistente de compilação LaTeX.

## Instalação

1. Clone o repositório
2. Instale os hooks do git:
```bash
make hooks
```

## Como Usar

### Editando o Conteúdo

O conteúdo do TCC é editado através do arquivo `latex/tcc.tex`. Este arquivo importa os arquivos do diretório `latex/editaveis/` que contêm as diferentes seções do documento como introdução, metodologia, resultados, etc.

Para editar o conteúdo, modifique os arquivos .tex correspondentes que estão localizados no diretório `/latex/editaveis/`.


### Gerando o PDF

Para gerar o PDF do seu TCC:

```bash
make pdf
```

O arquivo `TCC_PDF.pdf` será gerado na raiz do projeto.

### Limpando arquivos temporários

```bash
make clean
```

## Configuração do VSCode

Recomendamos as seguintes extensões para melhor experiência de desenvolvimento:

1. **Spell Checker PT-BR:**
   - Instale a extensão "Code Spell Checker"
   - Instale a extensão "Brazilian Portuguese - Code Spell Checker"
   - Nas configurações do VSCode, adicione:
   ```json
   "cSpell.language": "en,pt,pt-BR"
   ```

2. **Run on Save:**
   - Instale a extensão "Run on Save"
   - Configure para executar `make pdf` ao salvar arquivos .tex:
   ```json
   "emeraldwalk.runonsave": {
     "commands": [
       {
         "match": "\\.tex$",
         "cmd": "cd ${workspaceFolder} && make pdf"
       }
     ]
   }
   ```

3. **Visualizador de PDF:**
   - Instale a extensão "PDF Viewer" para visualizar o PDF gerado diretamente no VSCode
   - Ou use seu visualizador de PDF preferido que suporte auto-reload, assim você pode ver as mudanças em tempo real sem atualizar manualmente o PDF

## Importante: Imagens

- O template **só aceita imagens no formato EPS** (Encapsulated PostScript)
- Para converter imagens de outros formatos para EPS, utilize conversores online como:
  - [FreeConvert](https://www.freeconvert.com/)
  - [CloudConvert](https://cloudconvert.com/)
  - [Convertio](https://convertio.co/)

Caso queira usar imagens em outros formatos é possível, mas você terá que modificar o template para aceitar outros formatos.

### Sobre o Controle de Versão das Imagens

Para contornar as limitações de tamanho do GitHub (imagens EPS podem ser grandes), o projeto utiliza um sistema automatizado:

1. O hook `post-commit` comprime todas as imagens em `figuras.zip` e faz um commit *ammend* do arquivo zip
2. Isso permite versionar as imagens sem exceder os limites do GitHub porque o zip fica levinho :)

As imagens devem ser colocadas no diretório `latex/figuras/`.
