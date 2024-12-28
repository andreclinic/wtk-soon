#!/bin/bash

BASE_DIR="/var/www/html"     # Diretório base sem a barra final
LIMIT=16000000               # Limite em kilobytes (8GB = 8 * 1000 * 1000 KB)

# Função para remover arquivos antigos e limpar espaço
clean_directory() {
    local dir=$1

    # Pastas a serem preservadas (não excluir arquivos dessas pastas)
    preserved_dirs=("logotipos" "fileList" "quickMessage" "media")

    # Construir a expressão para as pastas a serem preservadas
    exclude_args=""
    for folder in "${preserved_dirs[@]}"; do
        exclude_args="$exclude_args ! -path \"$dir/$folder/*\""
    done

    # Adicionar exceção para não remover as pastas que começam com "company", mas permitir a remoção de seus arquivos antigos
    exclude_args="$exclude_args ! -path \"$dir/company*/*\""

    # Remover arquivos com mais de 30 dias, exceto nas pastas preservadas
    eval "find \"$dir\" -type f -mtime +30 $exclude_args -exec rm -f {} +"

    # Verificar o tamanho total da pasta em kilobytes, excluindo as pastas preservadas
    exclude_size_args=""
    for folder in "${preserved_dirs[@]}"; do
        exclude_size_args="$exclude_size_args --exclude=\"$dir/$folder\""
    done

    # Excluir as pastas que começam com "company" do cálculo de tamanho
    exclude_size_args="$exclude_size_args --exclude=\"$dir/company*\""

    SIZE=$(eval "du -sk \"$dir\" $exclude_size_args | awk '{sum += \$1} END {print sum}'")

    # Enquanto o tamanho da pasta exceder o limite
    while [ "$SIZE" -gt "$LIMIT" ]; do
        # Encontrar o arquivo mais antigo, exceto nas pastas preservadas, e removê-lo
        OLDEST_FILE=$(eval "find \"$dir\" -type f $exclude_args -printf '%T+ %p\n' | sort | head -n 1 | cut -d' ' -f2")
        if [ -n "$OLDEST_FILE" ]; then
            rm -f "$OLDEST_FILE"
        else
            break
        fi

        # Atualizar o tamanho da pasta, excluindo as pastas preservadas
        SIZE=$(eval "du -sk \"$dir\" $exclude_size_args | awk '{sum += \$1} END {print sum}'")
    done
}

# Percorrer cada diretório que corresponde ao padrão
for dir in "$BASE_DIR"/*/backend/public/; do
    if [ -d "$dir" ]; then
        echo "Limpando diretório $dir"
        clean_directory "$dir"
    else
        echo "Diretório $dir não encontrado ou não é um diretório."
    fi
done

echo "Limpeza concluída."
