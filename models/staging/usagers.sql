{{ config(materialized='view') }}

SELECT
  cast(Num_Acc as string) as numero_accident,
  cast(id_vehicule as string) as id_vehicule,
  num_veh as numero_vehicule,
  place,
  case
  when catu = "1" then "Conducteur"
  when catu = "2" then "Conducteur"
  when catu = "3" then "Conducteur"
  end 
  as categorie,
  grav,
  sexe as genre,
  an_nais,
  trajet,
  secu1,
  secu2,
  secu3,
  locp,
  actp,
  etatp
FROM {{ source('raw', 'usagers')}}