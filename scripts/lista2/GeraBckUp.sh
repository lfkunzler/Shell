#!/bin/bash

DIRDEST=$HOME/Backup

# is not a dir?
if [ ! -d $DIRDEST ]
then
  echo "criando diretorio $DIRDEST"
  mkdir -p $DIRDEST
fi

DAYS=$(find $DIREST -ctime -7 -name backup_home\*tgz)

if [ $DAYS7 ] # variavel e nula?
then
  echo "Já foi gerado um backup de $DIREST nos ultimos 7 dias"
  read -p "Deseja continuar? (N/s):" OPCAO
  case $OPCAO in
    N)
      echo "Gerando backup..."
      ;;
    *)
      echo "Backup abortado"
      exit 1

    esac
fi

ARQ="backup_home_$(date +%F\ %T).tgz
tar zcvpf $DIRDEST/$ARQ --absolute-names --exclude="$HOME/Google Drive"
--exclude="$HOME/Videos --exclude="$DIRDEST" "$HOME"/* > /dev/null
