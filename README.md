# vhdl_workshop

Atelier pour introduire le VHDL aux étudiant.es en génie électrique


## Astuces

- Nom de fichier pareil au nom de l'entité
  - Sinon ne compile pas sur tous les outils
- Mettre des commentaires
- Liste incomplète de sensibilité
- Signaux assignés par plusieurs process/components


## Comment utiliser (avec GHDL et GtkWave)

Exemple:  
`ghdl -a and_gate.vhd tb_and.vhd`  
`ghdl -e tb_and`  
`ghdl -r tb_and --vcd=tb.vcd`  
`gtkwave -S render.tcl tb.vcd`
