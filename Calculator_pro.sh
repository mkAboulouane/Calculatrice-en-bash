#!/bin/bash

# Use bash strict Mode :it'a avoid having unexpected compilations in production
#set -euo pipefail
#IFS=$'\n\t'
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
Lblue='\033[1;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
GRAY='\033[0;37m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
Lgreen='\033[1;32m'

clear
echo -e "${YELLOW}Augmenter la taille de l'ecran pour avoir une meilleur vision"
echo -e "enjoy :)"
sleep 4
clear

function clearScreen 
{

clear
echo -e "${Lgreen}"
cat << "EOF"
    ******************************************* Advanced Calculator ***********************************    
    ___________________________________________________________________________________________________      
   |1) Addition          |2) soustraction      |3) division        |4) Multiplication  |21) cos(x)    |
   |_____________________|_____________________|___________________|___________________|______________|
   |5) Factorielle       |6) Carre             |7) puissance       |8) X^-1            |22) sin(x)    |
   |_____________________|_____________________|___________________|___________________|______________|
   |9) valeur absolue    |10)random            |11)reste division  |12)Racine caree    |23) arctan(x) |   
   |_____________________|_____________________|___________________|___________________|______________|
   |13)decimal to binaire|14)binaire to decimal|15)octal to decimal|16)decimal to octal|24) log(x)    |
   |_____________________|_____________________|___________________|___________________|______________|
   |17)decimal to hexa   |18)hexa to decimal   |19)a*X+b=0         |20)a*X^2+b*X+c=0   |25) exp(x)    |   
   |_____________________|_____________________|___________________|___________________|______________|
EOF
echo -e "${YELLOW}   exit:0 | clear: F\n"
}
clearScreen
function somme
{
echo -e "${Lblue} Somme  "
echo -en "${CYAN} le premier nombre: " 
read a
echo -en "${CYAN} le deusieme nombre: " 
read b
c=`bc -l <<< "$a+$b"`
echo -en "${BLUE} le resultat est : $c"
}

function difference
{
echo -e "${Lblue} Difference  "
echo -en "${CYAN} le premier nombre: " 
read a
echo -en "${CYAN} le deusieme nombre: " 
read b
c=`echo "$a-(($b))" | bc -l`
echo -en "${BLUE} le resultat est : $c "
}

function division
{
echo -e "${Lblue} Division  "
echo -en "${CYAN} le premier nombre: " 
read nombre1
echo -en "${CYAN} le deusieme nombre: " 
read nombre2
if (( $nombre2 == 0 ));
then
echo -e "${RED} Division Impossible!"
division
else
r=`echo "(($nombre1))/(($nombre2))" | bc -l`
echo -en "${BLUE} le resultat est : $r"
fi
}

function Multiplication
{
echo -e "${Lblue} Multiplication  "
echo -en "${CYAN} le premier nombre: " 
read nombre1
echo -en "${CYAN} le deusieme nombre: " 
read nombre2

resultat=`bc -l <<< "$nombre1*$nombre2"`
echo -en "${BLUE} le resultat est : $resultat "

}

function Factorielle 
{
echo -e "${Lblue} Factorielle  "
echo -ne "${CYAN} Donner un nombre: " 
read nombre1

resultat=1;
if (( nombre1 >= 0 )); 
then
for((i=$nombre1;i>=1;i--)); do
resultat=$((resultat*i)) 
done	
echo -e "${BLUE} le resultat est: $resultat"
else 
echo -e "${RED} essayer avec un nombre possitif "
Factorielle
fi
}

function power
{
echo -e "${Lblue} Puissance  "
echo -en "${CYAN} entrer un nombre: " 
read nombre1
echo -en "${CYAN} entrer sa puissance: "
read nombre2

resultat=1;
if (( nombre1 >= 0 ));
then
for((i=1;i<=$nombre2;i++)); do
resultat=$((resultat*nombre1))
done
echo -e "${BLUE} le resultat est: $resultat"
else
echo -e "${RED} essayer avec un entier possitif"
power
fi
}
function toBinaire
{
echo -e "${Lblue} Conversion a binaire  "
echo -e "${CYAN} Entrer un nombre decimal: "
read nombre1
echo -en "${BLUE} en Binaire est: "
bc <<< "obase=2;$nombre1"
}

function toDecimal
{
  echo -e "${Lblue} Conversion de Binaire a Decimal  "	
  echo -en "${CYAN} Entrer un Binaire: "
  read nombre1
  echo -e " en Decimal est: ${BLUE} $((2#$nombre1))"
}

function octalToDecimal 
{
echo -e "${Lblue} Conversion de l'Octal a Decimal  "
echo -en "${CYAN} Entrer un octal: "
read nombre1	
echo -e " en Decimal ${BLUE} $((8#$nombre1))"
}

function DecimalToOctal
{
echo -e "${Lblue} Conversion de Decimal a l'Octal   "
echo -en "${CYAN} Saisir un Decimal: "
read nombre1
echo -en "${BLUE} en Octal est " 
echo -e "obase=8; ibase=10; $nombre1" | bc
}

function DecimalToHexa
{
echo -e "${Lblue} Conversion de Decimal a HexaDecimal  "
echo -en "${CYAN} Saisir un Decimal: "
read nombre1
echo -en "${BLUE} en HexaDecimal est " 
echo -e "obase=16; ibase=10; $nombre1" | bc
}

function HexaToDecimal
{
echo -e "${Lblue} Conversion de HexaDecimal to Decimal "
echo -en "${CYAN} Saisir un HexaDecimal: "
read nombre1
echo -en "${BLUE} en Decimal est " 
echo -e "$((16#$nombre1))"
}

function random
{
echo -e "${Lblue} Nombre Aleatoire  "
echo -en "${CYAN} entrer d'intervalle du random: "
read nombre1
echo -e "${BLUE} le random est: $(($RANDOM%nombre1))"
}

function absolue
{
echo -e "${Lblue} Valeur Absolue  "
echo -en "${CYAN} Entrer un nombre: "
read nombre1
if (( nombre1 < 0 )); then
nombre1=$(($nombre1*-1))
echo -e "${BLUE} la valeur absolue est: $nombre1 "
else
echo -e "${BLUE} la valeur absolue est: $nombre1 "
fi
}

function carre
{
echo -e "${Lblue} le Carre d'un nombre  "
echo -en "${CYAN} Entrer un nombre: "
read nombre1
echo -e "${BLUE} le carre est $((nombre1*nombre1))"
}

function reste
{
echo -e "${Lblue} le Reste de Division "
echo -en "${CYAN} Entrer le nombre1: "
read nombre1
echo -en "${CYAN} Entrer le nombre2: "
read nombre2
echo -e "${BLUE} le reste est  $((nombre1%nombre2))"
}
function racine
{
echo -e "${Lblue} le Racine carree "
echo -en "${CYAN} Entrer le nombre1: "
read nombre1
if (( $nombre1 > 0 )); 
then
resultat=`bc -l <<<"(sqrt($nombre1))"`      	
echo -en "${BLUE} le resultat est: $resultat"
else
echo -e "${RED} Racine ne peut pas etre  negatif ou null!"
racine
fi
}
function qrt
{
echo -e "${Lblue} l'Inverse "
echo -en "${CYAN} Entrer le nombre1: "
read nombre1
resultat=`bc -l <<<"1/$nombre1"`
echo -en "${BLUE} le resultat est: $resultat"
}
function ordre1
{
echo -e "${Lblue} Equation premier Ordre "
echo -en "${CYAN} entre a: "
read a
echo -en "${CYAN} entre b: "
read b
if (( $b == 0 )); then
echo -e "${RED}Equation n'admet pas de solution"
ordre1
else
x=`bc -l <<< "-1*$b/$a"`
echo -en "${BLUE} la soution d'equation est: $x"
fi
}
function ordre2
{
echo -e "${Lblue} Equation deusieme Ordre "
echo -en "${CYAN} entre a: "
read a
echo -en "${CYAN} entre b: "
read b
echo -en "${CYAN} entre c: "
read c
delta=`bc -l <<< "$b*$b-4*$a*$c"`
if (( $delta > 0 )); then
del=`bc -l <<< "sqrt($delta)"`
x1=`bc -l <<< "(-1*$b+$del)/(2*$a)"`
x2=`bc -l <<< "(-1*$b-$del)/(2*$a)"`
echo -en "${BLUE} x1=$x1 \t x2=$x2 \n"
elif (( $delta == 0 )); then
x=`bc -l <<< "(-1*$b)/(2*$a)"`
echo -en "${BLUE} x=$x \n"
else
delta=`bc -l <<< "-1*$delta"`
del=`bc -l <<< "sqrt($delta)"`
x=`bc -l <<< "(-1*$b)/(2*$a)"`
y=`bc -l <<< "($del)/(2*$a)"`
echo -en "${BLUE} z1=${x}+${y}i \t z2=${x}-${y}i \n"
fi
}
function cos
{
echo -e "${Lblue} Calcul Cos "
echo -en "${CYAN} Entrer l'angle (en degres): "
read nombre1
echo -en "${BLUE} cos($nombre1)= "
echo -e "c($nombre1)" | bc -l
}
function sin
{
echo -e "${Lblue} Calcule Sin "
echo -en "${CYAN} Entrer l'angle (en degres): "
read nombre1
echo -en "${BLUE} sin($nombre1)= "
echo -e "s($nombre1)" | bc -l
}
function arctan
{
echo -e "${Lblue} Calcule Arctan "
echo -en "${CYAN} Entrer l'angle (en degres): "
read nombre1
echo -en "${BLUE} arctan($nombre1)= "
echo -e "a($nombre1)" | bc -l
}
function log
{
echo -e "${Lblue} Calcule logarithme naturel"
echo -en "${CYAN} Entrer un nombre: "
read nombre1
echo -en "${BLUE} log($nombre1)= "
echo -e "l($nombre1)" | bc -l
}
function exp
{
echo -e "${Lblue} Calcule d'Expenetielle"
echo -en "${CYAN} Entrer un nombre: "
read nombre1
echo -en "${BLUE} exp($nombre1)= "
echo -e "e($nombre1)" | bc -l
}


while true; do
echo -en "${WHITE}\n\t\t\t\t\t        Entrer une Commande: "
read operation

case $operation in
    0) echo -e "${PURPLE}By ;)"
	sleep 1    
        clear
        exit 
      ;;	
    1) somme
      ;;
    2) difference
      ;;
    3) division    
      ;;
    4) Multiplication
      ;;
    5) Factorielle
      ;;
    6) carre  
      ;;
    7) power 
      ;;
    8) qrt
      ;;
    9) absolue
      ;;
    10) random
      ;;
    11) reste
      ;;
    12) racine
      ;;
    13) toBinaire
      ;;
    14) toDecimal
      ;;	    
    15) octalToDecimal 
      ;;
    16) DecimalToOctal 
      ;;
    17) DecimalToHexa 
      ;;	  
    18) HexaToDecimal 
      ;;	
    19) ordre1
      ;;
    20) ordre2
      ;;
    21) cos
      ;;
    22) sin
      ;;
    23) arctan
      ;;
    24) log
      ;;
    25) exp
      ;;	
    F) clearScreen
      ;;
    *) echo -e "${RED}\t\t\t\t\t  Essayer avec un nombre valide ! ;) "
      ;; 
esac
done
