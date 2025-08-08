{{ config(materialized='table') }}



select 
 car.numero_accident,
  car.an,
  veh.numero_accident as veh_numero_accident,
  veh.id_vehicule,
  usg.numero_accident as usg_numero_accident,
  usg.id_vehicule as usg_id_vehicule

from  {{ref('caracteristique')}} car
left join {{ref('vehicules')}}  veh
on cast(car.numero_accident as string)   = cast(veh.numero_accident as string)
left join  {{ref('usagers')}} usg
on cast(veh.numero_accident as string) = cast(usg.numero_accident as string)
and cast(veh.id_vehicule as string) = cast(usg.id_vehicule as string)

where car.an = 2019