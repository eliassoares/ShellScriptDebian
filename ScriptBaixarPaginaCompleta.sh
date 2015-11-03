#!/bin/bash
#26/10/15

echo "Digite o link da página para fazer Download:"
read link
wget --mirror -p --convert-links $link