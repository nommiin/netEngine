///netPacketBroadcast(header,t1,v1,t2,v2,...)
/*
    Meant to only be called from the server instance.
    Sends the same packet to every connected socket.
*/
var _b = buffer_create(1,buffer_grow,1)
buffer_write(_b,buffer_u8,argument[0])
for(var _i = 1; _i < argument_count; _i += 2) {buffer_write(_b,argument[_i],argument[_i+1])}
for(var _j = 0; _j < ds_list_size(netSockets); _j++) {network_send_packet(netSockets[| _j],_b,buffer_get_size(_b))}
buffer_delete(_b)
