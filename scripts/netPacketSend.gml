///netPacketSend(socket,header,t1,v1,t2,v2,...)
/*
    Can be called from either the server or client instance.
    Sends the a packet containing supplied data through specified socket.
*/
var _b = buffer_create(1,buffer_grow,1)
buffer_write(_b,buffer_u8,argument[1])
for(var _i = 2; _i < argument_count; _i += 2) {buffer_write(_b,argument[_i],argument[_i+1])}
var _s = network_send_packet(argument[0],_b,buffer_get_size(_b))
buffer_delete(_b)
return _s
