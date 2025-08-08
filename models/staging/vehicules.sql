{{ config(materialized='view') }}


SELECT
  cast(Num_Acc as string) as numero_accident ,
  cast(id_vehicule as string) as id_vehicule,
  num_veh,
  case 
  when senc = -1 then "Non renseigné"
  when senc = 0 then "Inconnu"
  when senc = 1 then "PK ou PR ou numéro d’adresse postale croissant"
  when senc = 2 then "PK ou PR ou numéro d’adresse postale décroissant "
  when senc = 3 then "Absence de repère"
  end as  senc,
  catv,
  obs,
  obsm,
  choc,
  manv,
  motor,
  occutc
FROM
{{ source('raw', 'véhicules') }}