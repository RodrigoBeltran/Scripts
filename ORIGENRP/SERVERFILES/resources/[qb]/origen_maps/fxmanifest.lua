fx_version 'adamant'

game 'gta5'

version '1.0.0'
author 'hashashin'

this_is_a_map "yes"

data_file 'DLC_ITYP_REQUEST' 'stream/patoche_cap1.ytyp'

file 'gusepe_timecycle_mods_saloon.xml'
data_file 'TIMECYCLEMOD_FILE' 'gusepe_timecycle_mods_saloon.xml'
data_file 'DLC_ITYP_REQUEST' 'stream/int_retail.ytyp' 
data_file 'DLC_ITYP_REQUEST' 'stream/vw_prop_vw_tables.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/ch_prop_ch_casino_accs_02.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/int_industrial.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/v_int_10.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/ch_dlc_int_02_ch.ytyp'

data_file 'DLC_ITYP_REQUEST' 'stream/patoche_cyber_list.ytyp'

data_file 'DLC_ITYP_REQUEST' 'stream/props.ytyp'

data_file 'FIVEM_LOVES_YOU_A9E8B9F6EEB35186' 'stream/little_seoul.ymt'

data_file('DLC_ITYP_REQUEST')('stream/uj_prop_tr_01/uj_prop_tr_01.ytyp')
data_file('DLC_ITYP_REQUEST')('stream/uj_prop_tr_vehicles/uj_prop_tr_vehicles.ytyp')
data_file('DLC_ITYP_REQUEST')('stream/uj_prop_tr_track_hoardings/uj_prop_tr_track_hoardings.ytyp')
data_file('DLC_ITYP_REQUEST')('stream/uj_prop_tr_track_course/uj_prop_tr_track_course.ytyp')


files {
    'stream/little_seoul.ymt',
    'interiorproxies.meta'
}

data_file 'INTERIOR_PROXY_ORDER_FILE' 'interiorproxies.meta'

client_scripts{ 
    "client.lua",
    "galaxyipl.lua"
  }
