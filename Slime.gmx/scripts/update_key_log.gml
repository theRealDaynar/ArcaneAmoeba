///update_key_log( pressed, key, ds_list )
if argument0 = 1
{
    if ds_list_find_index(argument2,argument1) = - 1
        ds_list_add(argument2,argument1)
    else
    {
        ds_list_delete(argument2,ds_list_find_index(argument2,argument1))
        ds_list_add(argument2,argument1)
    }
}
else
{
    if ds_list_find_index(argument2,argument1) != - 1
        ds_list_delete(argument2,ds_list_find_index(argument2,argument1))
}

// movement
speed = 0
if ds_list_size(key_log) > 0
{
    if sprite_index = sHI or sprite_index = sTI or sprite_index = sDI
        image_index = 0
    for(var i = 0; i<ds_list_size(key_log);i++)
    switch(ds_list_find_value(key_log, i))
    {
    case 0:
        vspeed = -spd;
        sprite_index = sTM
    break;
    case 1:
        vspeed = spd;
        sprite_index = sDM
    break;
    case 2:
        hspeed = -spd;
        sprite_index = sHM
        image_xscale = -abs(image_xscale)
    break;
    case 3:
        hspeed = spd;
        sprite_index = sHM
        image_xscale = abs(image_xscale)
    break;
    }
    speed = spd
}