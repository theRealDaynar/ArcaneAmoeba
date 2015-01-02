draw_self()

var count = physics_particle_count()
var dataFlags = phy_particle_data_flag_position | phy_particle_data_flag_velocity
var heat = 1
draw_set_blend_mode(bm_normal)

if count > 0
{
    var buffer = buffer_create( count * 4, buffer_grow,4)
    physics_particle_get_data(buffer, dataFlags)
    for( var n = 0; n < count; n++)
    {
        var xx = buffer_read(buffer, buffer_f32)
        var yy = buffer_read(buffer, buffer_f32)
        var xvel = buffer_read(buffer, buffer_f32)
        var yvel = buffer_read(buffer, buffer_f32)
        var vres = sqrt(abs((xvel^2)+(yvel^2)))
        var vcol = vres
        var dir = -1*radtodeg(arctan2(yvel,xvel)) + 90
        if (vres > heat)
            vcol = heat
            //255, 128,0
            //
        col = make_color_rgb(100*vcol/heat+155,-vcol/heat*37+155,55-55*vcol/heat)
        if vres >= 8
            draw_sprite_ext(sDropBack,0,xx,yy,1/(vres/8),.75+.25/(vres/8),dir,col,1)
        else
            draw_sprite_ext(sDropBack,0,xx,yy,1,1,dir,col,1)
    }
    buffer_delete(buffer)
}

if count > 0
{
    var buffer = buffer_create( count * 4, buffer_grow,4)
    physics_particle_get_data(buffer, dataFlags)
    for( var n = 0; n < count; n++)
    {
        draw_set_blend_mode(bm_subtract)
        var xx = buffer_read(buffer, buffer_f32)
        var yy = buffer_read(buffer, buffer_f32)
        var xvel = buffer_read(buffer, buffer_f32)
        var yvel = buffer_read(buffer, buffer_f32)
        var vres = sqrt(abs((xvel^2)+(yvel^2)))
        var vcol = vres
        var dir = -1*radtodeg(arctan2(yvel,xvel)) + 90
        col =  make_color_rgb(100*vcol/heat+155,-vcol/heat*37+155,55-55*vcol/heat)
        if (vres > heat)
            vcol = heat
        if vres >= 8
            draw_sprite_ext(sSlimeParticle,0,xx,yy,1/(vres/8),.75+.25/(vres/8),dir,col,1)
       else
           draw_sprite_ext(sSlimeParticle,0,xx,yy,1,1,dir,col,1)
    }
    buffer_delete(buffer)
}
draw_set_blend_mode(bm_normal)//*/

