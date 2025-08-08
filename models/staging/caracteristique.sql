{{ config(materialized='view') }}


SELECT
  cast (Num_Acc as string) as  numero_accident,
  cast(jour as int64) as jour,
  cast(mois as int64) as mois,
  cast(an as int64) as an,
  hrmn as heure_minut,
   case 
   when lum = "1" then "Plein jour"
   when lum = "2" then "Crépuscule ou aube"
   when lum = "3" then "Nuit sans éclairage public"
   when lum = "4" then "Nuit avec éclairage public non allumé"
   when lum = "5" then "Nuit avec éclairage public allumé"
   end 
   as lum,
  dep as departement,
  com as commune,
  agg as aggregation,
  atm,
  col,
  adr as addresse,
  lat as latitude,
  long as logitude
  
FROM {{ source('raw', 'caracteristique') }}