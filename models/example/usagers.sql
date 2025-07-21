{{ config(materialized="table") }}

select *
from `myprojetlooker.Accidents.usagers`
limit 1000
